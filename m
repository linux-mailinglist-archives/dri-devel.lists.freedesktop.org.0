Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CA227A76
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F276E441;
	Tue, 21 Jul 2020 08:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780489B11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 01:33:40 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 083D01A2142;
 Tue, 21 Jul 2020 09:33:03 +0800 (CST)
Message-ID: <AE2AjQBfDVxlYNyBF9u*s4rp.1.1595295183020.Hmail.bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Drew Davenport <ddavenport@chromium.org>, 
 Bernard Zhao <bernard@vivo.com>, Hongbo Yao <yaohongbo@huawei.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?W1Jlc2VuZF1bUEFUQ0hdIGRybS9tc206IHVzZSBrdGhyZWFkX2NyZWF0ZV93b3JrZXIgaW5zdGVhZCBvZiBrdGhyZWFkX3J1bg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 14.29.82.33
MIME-Version: 1.0
Received: from bernard@vivo.com( [14.29.82.33) ] by ajax-webmail ( [127.0.0.1]
 ) ; Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 21 Jul 2020 09:33:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSE8ZQh5CQ05OSU8eVkpOQk5JQk5KQ0hKT0tVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo#SToRKjkdPy0DFyI1Ajk9Qg5R
 CE8JC1VKVUpOQk5JQk5KQ0hOSENVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpPVUlC
 VUNJVUhIWVdZCAFZQU1OTk83Bg++
X-HM-Tid: 0a736f00b0cd93b4kuws083d01a2142
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kthread_create_worker to simplify the code and optimise
the manager struct: msm_drm_thread. With this change, we
could remove struct element (struct task_struct *thread &
struct kthread_worker worker), instead, use one point (struct
kthread_worker *worker).

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +--
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..c959c959021d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -396,7 +396,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(&priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
 }
 
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..82e79b82a594 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -238,10 +238,8 @@ static int msm_drm_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
-		if (priv->event_thread[i].thread) {
-			kthread_destroy_worker(&priv->event_thread[i].worker);
-			priv->event_thread[i].thread = NULL;
-		}
+		if (priv->event_thread[i].worker)
+			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -504,19 +502,15 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	for (i = 0; i < priv->num_crtcs; i++) {
 		/* initialize event thread */
 		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
-		kthread_init_worker(&priv->event_thread[i].worker);
 		priv->event_thread[i].dev = ddev;
-		priv->event_thread[i].thread =
-			kthread_run(kthread_worker_fn,
-				&priv->event_thread[i].worker,
-				"crtc_event:%d", priv->event_thread[i].crtc_id);
-		if (IS_ERR(priv->event_thread[i].thread)) {
+		priv->event_thread[i].worker = kthread_create_worker(0,
+			"crtc_event:%d", priv->event_thread[i].crtc_id);
+		if (IS_ERR(priv->event_thread[i].worker)) {
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			priv->event_thread[i].thread = NULL;
 			goto err_msm_uninit;
 		}
 
-		ret = sched_setscheduler(priv->event_thread[i].thread,
+		ret = sched_setscheduler(priv->event_thread[i].worker->task,
 					 SCHED_FIFO, &param);
 		if (ret)
 			dev_warn(dev, "event_thread set priority failed:%d\n",
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e2d6a6056418..daf2f4e5548c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -129,9 +129,8 @@ struct msm_display_info {
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-	struct task_struct *thread;
 	unsigned int crtc_id;
-	struct kthread_worker worker;
+	struct kthread_worker *worker;
 };
 
 struct msm_drm_private {
-- 
2.17.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
