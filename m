Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHZUFneoeGl9rwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:58:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206193ED6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1C610E552;
	Tue, 27 Jan 2026 11:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RB2Svl8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B51B10E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+3ju3E6FPu2JD1Nsb68VmJVlbR8fpECigyHMAVRuT8=; b=RB2Svl8vmti9/gzR6GVzpBYo4F
 PTiisgUx+yPUCO1bNRKJvgCVBEviZ5QzXFdLpksfKVcCFyjwfvUZCT6qkdA9jwdrihDTNo2/bq32e
 iY7Q8In50jkqkaT/1iL/2GLC9huyVlylbej/kRjB6DSfY1RmnArALi4SzOZ/s6hi9N8rmQRzitIB6
 Y/NtJ6rA4gwbIFup+gOB2/tfmtmUJI57Dpp5OPAKAbIe4rybtH4fndL+KkGjiXGRm8alU+VZu6uk/
 5uPU5JZcfCy6Kn+0RC4QyVaCZNG50QfYWWBoxmnxtJuN4PtvbHxMsZfgFvxJbpAS7EGUAlmLksYYq
 UH9lZiJw==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1vkhiK-00AS8A-Bl; Tue, 27 Jan 2026 12:58:32 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 1/2] drm/v3d: Replace IDR with XArray for perfmon tracking
Date: Tue, 27 Jan 2026 08:56:59 -0300
Message-ID: <20260127115822.64401-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:itoral@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:kernel-dev@igalia.com,m:mcanal@igalia.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 0206193ED6
X-Rspamd-Action: no action

The IDR interface is deprecated and the XArray API is the recommended
replacement. Replace the per-file IDR used to track perfmons with an
XArray. This allows us to remove the external mutex that protects the
IDR.

While here, introduce the v3d_perfmon_delete() helper to consolidate
the perfmon cleanup logic used by both v3d_perfmon_close_file() and
v3d_perfmon_destroy_ioctl().

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20260115150903.92163-2-mcanal@igalia.com/

- Replace XA_LIMIT(V3D_PERFMONID_MIN, V3D_PERFMONID_MAX) with
  xa_limit_32b (Tvrtko Ursulin)

---
 drivers/gpu/drm/v3d/v3d_drv.h     |  5 +--
 drivers/gpu/drm/v3d/v3d_perfmon.c | 57 +++++++++++--------------------
 2 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 99a39329bb85..314213c26710 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -220,10 +220,7 @@ v3d_has_csd(struct v3d_dev *v3d)
 struct v3d_file_priv {
 	struct v3d_dev *v3d;
 
-	struct {
-		struct idr idr;
-		struct mutex lock;
-	} perfmon;
+	struct xarray perfmons;
 
 	struct drm_sched_entity sched_entity[V3D_MAX_QUEUES];
 
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index 9a3fe5255874..c090fc30ba4b 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -6,9 +6,6 @@
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 
-#define V3D_PERFMONID_MIN	1
-#define V3D_PERFMONID_MAX	U32_MAX
-
 static const struct v3d_perf_counter_desc v3d_v42_performance_counters[] = {
 	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primitives that result in no rendered pixels, for all rendered tiles"},
 	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives for all rendered tiles (primitives may be counted in more than one tile)"},
@@ -290,24 +287,23 @@ struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_priv *v3d_priv, int id)
 {
 	struct v3d_perfmon *perfmon;
 
-	mutex_lock(&v3d_priv->perfmon.lock);
-	perfmon = idr_find(&v3d_priv->perfmon.idr, id);
+	xa_lock(&v3d_priv->perfmons);
+	perfmon = xa_load(&v3d_priv->perfmons, id);
 	v3d_perfmon_get(perfmon);
-	mutex_unlock(&v3d_priv->perfmon.lock);
+	xa_unlock(&v3d_priv->perfmons);
 
 	return perfmon;
 }
 
 void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
 {
-	mutex_init(&v3d_priv->perfmon.lock);
-	idr_init_base(&v3d_priv->perfmon.idr, 1);
+	xa_init_flags(&v3d_priv->perfmons, XA_FLAGS_ALLOC1);
 }
 
-static int v3d_perfmon_idr_del(int id, void *elem, void *data)
+static void v3d_perfmon_delete(struct v3d_file_priv *v3d_priv,
+			       struct v3d_perfmon *perfmon)
 {
-	struct v3d_perfmon *perfmon = elem;
-	struct v3d_dev *v3d = (struct v3d_dev *)data;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 
 	/* If the active perfmon is being destroyed, stop it first */
 	if (perfmon == v3d->active_perfmon)
@@ -317,19 +313,17 @@ static int v3d_perfmon_idr_del(int id, void *elem, void *data)
 	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
 
 	v3d_perfmon_put(perfmon);
-
-	return 0;
 }
 
 void v3d_perfmon_close_file(struct v3d_file_priv *v3d_priv)
 {
-	struct v3d_dev *v3d = v3d_priv->v3d;
+	struct v3d_perfmon *perfmon;
+	unsigned long id;
 
-	mutex_lock(&v3d_priv->perfmon.lock);
-	idr_for_each(&v3d_priv->perfmon.idr, v3d_perfmon_idr_del, v3d);
-	idr_destroy(&v3d_priv->perfmon.idr);
-	mutex_unlock(&v3d_priv->perfmon.lock);
-	mutex_destroy(&v3d_priv->perfmon.lock);
+	xa_for_each(&v3d_priv->perfmons, id, perfmon)
+		v3d_perfmon_delete(v3d_priv, perfmon);
+
+	xa_destroy(&v3d_priv->perfmons);
 }
 
 int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
@@ -341,6 +335,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	struct v3d_perfmon *perfmon;
 	unsigned int i;
 	int ret;
+	u32 id;
 
 	/* Number of monitored counters cannot exceed HW limits. */
 	if (req->ncounters > DRM_V3D_MAX_PERF_COUNTERS ||
@@ -366,18 +361,15 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	refcount_set(&perfmon->refcnt, 1);
 	mutex_init(&perfmon->lock);
 
-	mutex_lock(&v3d_priv->perfmon.lock);
-	ret = idr_alloc(&v3d_priv->perfmon.idr, perfmon, V3D_PERFMONID_MIN,
-			V3D_PERFMONID_MAX, GFP_KERNEL);
-	mutex_unlock(&v3d_priv->perfmon.lock);
-
+	ret = xa_alloc(&v3d_priv->perfmons, &id, perfmon, xa_limit_32b,
+		       GFP_KERNEL);
 	if (ret < 0) {
 		mutex_destroy(&perfmon->lock);
 		kfree(perfmon);
 		return ret;
 	}
 
-	req->id = ret;
+	req->id = id;
 
 	return 0;
 }
@@ -387,24 +379,13 @@ int v3d_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_perfmon_destroy *req = data;
-	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct v3d_perfmon *perfmon;
 
-	mutex_lock(&v3d_priv->perfmon.lock);
-	perfmon = idr_remove(&v3d_priv->perfmon.idr, req->id);
-	mutex_unlock(&v3d_priv->perfmon.lock);
-
+	perfmon = xa_erase(&v3d_priv->perfmons, req->id);
 	if (!perfmon)
 		return -EINVAL;
 
-	/* If the active perfmon is being destroyed, stop it first */
-	if (perfmon == v3d->active_perfmon)
-		v3d_perfmon_stop(v3d, perfmon, false);
-
-	/* If the global perfmon is being destroyed, set it to NULL */
-	cmpxchg(&v3d->global_perfmon, perfmon, NULL);
-
-	v3d_perfmon_put(perfmon);
+	v3d_perfmon_delete(v3d_priv, perfmon);
 
 	return 0;
 }
-- 
2.52.0

