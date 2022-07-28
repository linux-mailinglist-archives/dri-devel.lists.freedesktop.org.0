Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430D583676
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 03:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5175C835A;
	Thu, 28 Jul 2022 01:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8FDA7502
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 01:41:02 +0000 (UTC)
Received: from fsav117.sakura.ne.jp (fsav117.sakura.ne.jp [27.133.134.244])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26S1exb2028265;
 Thu, 28 Jul 2022 10:40:59 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav117.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp);
 Thu, 28 Jul 2022 10:40:59 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26S1exQ6028262
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Jul 2022 10:40:59 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <216591bc-28bb-0453-10bb-59e268dff540@I-love.SAKURA.ne.jp>
Date: Thu, 28 Jul 2022 10:40:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v3] gpu/drm/bridge/cadence: avoid flush_scheduled_work() usage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
macro") says, flush_scheduled_work() is dangerous and will be forbidden.
We are on the way for removing all flush_scheduled_work() callers from
the kernel, and this patch is for removing flush_scheduled_work() call
 from cadence driver.

Since cdns-mhdp8546 driver uses 4 works

  mhdp->modeset_retry_work
  mhdp->hpd_work
  mhdp->hdcp.check_work
  mhdp->hdcp.prop_work

I assume that flush_scheduled_work() in cdns_mhdp_remove() needs to wait
for only these 4 works.

Since mhdp->modeset_retry_work already uses cancel_work_sync(), I assume
that flush_scheduled_work() needs to wait for only 3 works. But I came to
wonder whether mhdp->hdcp.check_work should be flushed or cancelled.

While flush_scheduled_work() waits for completion of works which were
already queued to system_wq, mhdp->hdcp.check_work is a delayed work.
That is, this work won't be queued to system_wq unless timeout expires.

Current code will wait for mhdp->hdcp.check_work only if timeout already
expired. If timeout is not expired yet, flush_scheduled_work() will fail
to cancel mhdp->hdcp.check_work, and cdns_mhdp_hdcp_check_work() which is
triggered by mhdp->hdcp.check_work will schedule hdcp->check_work, which
is too late for flush_scheduled_work() to wait for completion of
cdns_mhdp_hdcp_prop_work().

But since I couldn't get comments on how do we want to handle this race
window [1], this patch chose "do nothing" for mhdp->hdcp.check_work and
mhdp->hdcp.prop_work. That is, I assume that flush_scheduled_work() in
cdns_mhdp_remove() needs to wait for only mhdp->hpd_work work.

Link: https://lkml.kernel.org/r/943273cb-c2ec-24e3-5edb-64eacc6e2d30@I-love.SAKURA.ne.jp [1]
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index ab63e7b11944..31442a922502 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2605,7 +2605,8 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	cancel_work_sync(&mhdp->modeset_retry_work);
-	flush_scheduled_work();
+	flush_work(&mhdp->hpd_work);
+	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
 
 	clk_disable_unprepare(mhdp->clk);
 
-- 
2.18.4
