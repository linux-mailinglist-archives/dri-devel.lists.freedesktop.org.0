Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF289CC33
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 21:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3550210EC69;
	Mon,  8 Apr 2024 19:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fnql5Eai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5A910E3C0;
 Mon,  8 Apr 2024 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603175; x=1744139175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6oxQGlJkE+CXeO+rhKhtZGpFtiv72GzyHbm2W/e1SoM=;
 b=Fnql5EaiCJpNBoCbMk+wHgjIfVarX2ZCa92rWaGeF4bznNDHPWC5tKp+
 n0HbZRvZhWiEpQ7jbvnoci5Yd0LO4d3WHRsSAd7vRZIip1A1l4btt1Zlk
 fcnrVkPtVnH9tj0n14pOsLzs6ZkIlDCVu7wvMSTXDx2P+2mU6ixyYyHkR
 SRcnHkWTLq08ijAd/b61x4sQ4kA1vZ1jPzuSptWNr1cgdBeiLcqWIXMGx
 6UTq5FlqzJIYSmt80KPno1kfiOhWyjKDw3evzhOub0s66omTM3dDzlRqI
 9Heb41A5BOvJHMgGAVoJFHP+EDqvA9p22WS9PZHhEXlO32hV0pelWs4G7 Q==;
X-CSE-ConnectionGUID: h4YfdpPKTuq74sZQ29vv9w==
X-CSE-MsgGUID: 6rWhsqrNR7KTxKSyCgogGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19278627"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19278627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792376"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792376"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 12:06:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 22:06:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vblank: Introduce drm_crtc_vblank_crtc()
Date: Mon,  8 Apr 2024 22:06:07 +0300
Message-ID: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make life easier by providing a function that hands
out the the correct drm_vblank_crtc for a given a drm_crtc.

Also abstract the lower level internals of the vblank
code in a similar fashion.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_vblank.c      | 58 ++++++++++++++++++-------------
 drivers/gpu/drm/drm_vblank_work.c |  2 +-
 include/drm/drm_vblank.h          |  1 +
 3 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 702a12bc93bd..cc3571e25a9a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -166,11 +166,24 @@ module_param_named(timestamp_precision_usec, drm_timestamp_precision, int, 0600)
 MODULE_PARM_DESC(vblankoffdelay, "Delay until vblank irq auto-disable [msecs] (0: never disable, <0: disable immediately)");
 MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
 
+static struct drm_vblank_crtc *
+drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
+{
+	return &dev->vblank[pipe];
+}
+
+struct drm_vblank_crtc *
+drm_crtc_vblank_crtc(struct drm_crtc *crtc)
+{
+	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
+}
+EXPORT_SYMBOL(drm_crtc_vblank_crtc);
+
 static void store_vblank(struct drm_device *dev, unsigned int pipe,
 			 u32 vblank_count_inc,
 			 ktime_t t_vblank, u32 last)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 
 	assert_spin_locked(&dev->vblank_time_lock);
 
@@ -184,7 +197,7 @@ static void store_vblank(struct drm_device *dev, unsigned int pipe,
 
 static u32 drm_max_vblank_count(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 
 	return vblank->max_vblank_count ?: dev->max_vblank_count;
 }
@@ -273,7 +286,7 @@ static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe
 static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 				    bool in_vblank_irq)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	u32 cur_vblank, diff;
 	bool rc;
 	ktime_t t_vblank;
@@ -364,7 +377,7 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
 
 u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	u64 count;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
@@ -438,7 +451,7 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
  */
 void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	unsigned long irqflags;
 
 	assert_spin_locked(&dev->vbl_lock);
@@ -600,7 +613,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	int linedur_ns = 0, framedur_ns = 0;
 	int dotclock = mode->crtc_clock;
 
@@ -930,7 +943,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
 static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 				     ktime_t *vblanktime)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	u64 vblank_count;
 	unsigned int seq;
 
@@ -985,7 +998,6 @@ EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
  */
 int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 {
-	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank;
 	struct drm_display_mode *mode;
 	u64 vblank_start;
@@ -993,7 +1005,7 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 	if (!drm_dev_has_vblank(crtc->dev))
 		return -EINVAL;
 
-	vblank = &crtc->dev->vblank[pipe];
+	vblank = drm_crtc_vblank_crtc(crtc);
 	mode = &vblank->hwmode;
 
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
@@ -1147,7 +1159,7 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 
 static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret = 0;
 
 	assert_spin_locked(&dev->vbl_lock);
@@ -1185,7 +1197,7 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	unsigned long irqflags;
 	int ret = 0;
 
@@ -1228,7 +1240,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
 
 void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1274,7 +1286,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
  */
 void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
 	u64 last;
 
@@ -1327,7 +1339,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct drm_pending_vblank_event *e, *t;
 	ktime_t now;
 	u64 seq;
@@ -1405,8 +1417,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_off);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	spin_lock_irq(&dev->vbl_lock);
 	/*
@@ -1445,8 +1456,7 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	drm_WARN_ON(dev, dev->max_vblank_count);
 	drm_WARN_ON(dev, !READ_ONCE(vblank->inmodeset));
@@ -1469,7 +1479,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1512,7 +1522,7 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 	assert_spin_locked(&dev->vbl_lock);
 	assert_spin_locked(&dev->vblank_time_lock);
 
-	vblank = &dev->vblank[pipe];
+	vblank = drm_vblank_crtc(dev, pipe);
 	drm_WARN_ONCE(dev,
 		      drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
 		      "Cannot compute missed vblanks without frame duration\n");
@@ -1564,7 +1574,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 				  union drm_wait_vblank *vblwait,
 				  struct drm_file *file_priv)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	struct drm_pending_vblank_event *e;
 	ktime_t now;
 	u64 seq;
@@ -1872,7 +1882,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
  */
 bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 {
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	unsigned long irqflags;
 	bool disable_irq;
 
@@ -1981,7 +1991,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 
 	pipe = drm_crtc_index(crtc);
 
-	vblank = &dev->vblank[pipe];
+	vblank = drm_crtc_vblank_crtc(crtc);
 	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
@@ -2046,7 +2056,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 
 	pipe = drm_crtc_index(crtc);
 
-	vblank = &dev->vblank[pipe];
+	vblank = drm_crtc_vblank_crtc(crtc);
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (e == NULL)
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 43cd5c0f4f6f..4fe9b1d3b00f 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -245,7 +245,7 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
 {
 	kthread_init_work(&work->base, func);
 	INIT_LIST_HEAD(&work->node);
-	work->vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	work->vblank = drm_crtc_vblank_crtc(crtc);
 }
 EXPORT_SYMBOL(drm_vblank_work_init);
 
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 7f3957943dd1..c8f829b4307c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -225,6 +225,7 @@ struct drm_vblank_crtc {
 	wait_queue_head_t work_wait_queue;
 };
 
+struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
 bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
-- 
2.43.2

