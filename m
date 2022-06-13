Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A554859A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C3F10E1B8;
	Mon, 13 Jun 2022 13:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB13C10E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:57:44 +0000 (UTC)
Received: from fsav120.sakura.ne.jp (fsav120.sakura.ne.jp [27.133.134.247])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25DDvgUw099614;
 Mon, 13 Jun 2022 22:57:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav120.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp);
 Mon, 13 Jun 2022 22:57:42 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25DDvfcv099610
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 13 Jun 2022 22:57:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <943273cb-c2ec-24e3-5edb-64eacc6e2d30@I-love.SAKURA.ne.jp>
Date: Mon, 13 Jun 2022 22:57:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] gpu/drm/bridge/cadence: avoid flush_scheduled_work()
 usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <d87fdfd0-71d0-09e0-a5ea-652edd50dfdd@I-love.SAKURA.ne.jp>
 <e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp>
In-Reply-To: <e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp>
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
Cc: DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/06/10 23:35, Tetsuo Handa wrote:
> Use local wq in order to avoid flush_scheduled_work() usage.
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Changes in v2:
>   Replace flush_scheduled_work() with flush_workqueue().
> 
> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
> using a macro") for background.
> 
> This is a blind conversion, and is only compile tested.
> 
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 32 ++++++++++++++++---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  2 ++
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 16 +++++-----
>  3 files changed, 37 insertions(+), 13 deletions(-)
> 

I'm thinking about flush_work() version, and I got confused.

Since cdns-mhdp8546 driver uses 4 works

	mhdp->modeset_retry_work
	mhdp->hpd_work
	mhdp->hdcp.check_work
	mhdp->hdcp.prop_work

I assume that flush_scheduled_work() in cdns_mhdp_remove() needs to wait
for only these 4 works. And since mhdp->modeset_retry_work already uses
cancel_work_sync(), flush_scheduled_work() would need to wait for only 3 works.
Therefore, I guess that the flush_work() version would look something like

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 67f0f444b4e8..04b21752ab3f 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2603,7 +2603,11 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	cancel_work_sync(&mhdp->modeset_retry_work);
-	flush_scheduled_work();
+	flush_work(&mhdp->hpd_work);
+	if (mhdp->hdcp_supported) {
+		cancel_delayed_work_sync(&mhdp->hdcp.check_work);
+		flush_work(&mhdp->hdcp.prop_work);
+	}
 
 	clk_disable_unprepare(mhdp->clk);
 

but I came to wonder whether mhdp->hdcp.check_work should be flushed or cancelled.

While flush_scheduled_work() waits for completion of works which were already queued
to system_wq, mhdp->modeset_retry_work and mhdp->hdcp.check_work are delayed works.
That is, work won't be queued to system_wq unless timeout expires.

Current code will wait for mhdp->hdcp.check_work only if timeout already expired.
If timeout is not expired yet, flush_scheduled_work() will fail to cancel
mhdp->hdcp.check_work, and cdns_mhdp_hdcp_check_work() which is triggered by
mhdp->hdcp.check_work will schedule hdcp->check_work, which is too late for
flush_scheduled_work() to wait for completion of cdns_mhdp_hdcp_prop_work().

Thus, how do we want to handle this race window?

  flush_delayed_work(&mhdp->hdcp.check_work) followed by
  flush_work(&mhdp->hdcp.prop_work) (i.e. flush as much as possible) ?

  cancel_delayed_work_sync(&mhdp->hdcp.check_work) followed by
  cancel_work_sync(&mhdp->hdcp.prop_work) (i.e. cancel as much as possible) ?

  do nothing (i.e. no need to flush or cancel mhdp->hdcp.check_work and mhdp->hdcp.prop_work) ?

