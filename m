Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F2515441
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63E310EAFB;
	Fri, 29 Apr 2022 19:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D60410EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:17:36 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nkW7Q-00019X-8v; Fri, 29 Apr 2022 21:17:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: avoid cleaning up sched_job when submit succeeded
Date: Fri, 29 Apr 2022 21:17:31 +0200
Message-Id: <20220429191731.2187339-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the labels may mislead the casual reader, the tail of the function
etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
set up in this function need to be cleaned up regardless of whether the
submit succeeded or failed.

An exception is the newly added drm_sched_job_cleanup, which must only
be called when the submit failed before handing the job to the
scheduler.

Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
Reported-by: Michael Walle <michael@walle.cc>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
Daniel, please apply to the appropriate drm-misc branch to make sure
this ends up in the same pullrequest as the offending commit.
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 98bb5c9239de..bf2a400f59c9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -607,7 +607,8 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->out_fence_id;
 
 err_submit_job:
-	drm_sched_job_cleanup(&submit->sched_job);
+	if (ret)
+		drm_sched_job_cleanup(&submit->sched_job);
 err_submit_put:
 	etnaviv_submit_put(submit);
 
-- 
2.30.2

