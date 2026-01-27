Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPDTJnWoeGl9rwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:58:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10A93ECF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9FD10E54C;
	Tue, 27 Jan 2026 11:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KInZYKz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA04110E552
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=971H05FXDEq6GPtfIuxtR1rM3dvd9485TIJWJw/E64s=; b=KInZYKz/lWSviBfUl4oWiidj16
 a4XnZBWVPjspSOD4pFFy56BtN+SYD8w3VSNLAJUZiJPz6weVJKx3jHkBD/wYsavkr9H4JeThZZVrt
 aFoNF3H+pyPELylq5gsQKr0cJz1r3vwFkjBrvf8T1P7Z8r80rQASAnRa8WCgntCCbKgjmi3mLgaGp
 EIQe0iql6akkh0HbglyA7G7Rx8U86LUkiPaJqG9BEAAXLfodNilg9seWXDSUq9vS4BDCKdht78Pni
 Lcj+gA6x3Q/5RjwTTjrcIYc7tDbZsXI8JCjxZ18PBKJxjCIGMepw2njekqjatY+u2y5lLarxGmreS
 FAPaWwfA==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1vkhiN-00AS8A-7O; Tue, 27 Jan 2026 12:58:35 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 2/2] drm/vc4: Replace IDR with XArray for perfmon tracking
Date: Tue, 27 Jan 2026 08:57:00 -0300
Message-ID: <20260127115822.64401-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127115822.64401-1-mcanal@igalia.com>
References: <20260127115822.64401-1-mcanal@igalia.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:itoral@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:kernel-dev@igalia.com,m:mcanal@igalia.com,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: CC10A93ECF
X-Rspamd-Action: no action

The IDR interface is deprecated and the XArray API is the recommended
replacement. Replace the per-file IDR used to track perfmons with an
XArray. This allows us to remove the external mutex that protects the
IDR.

While at it, introduce the vc4_perfmon_delete() helper to consolidate
the perfmon cleanup logic used by both vc4_perfmon_close_file() and
vc4_perfmon_destroy_ioctl(). Also, remove the redundant assignment of
vc4file->dev to itself in vc4_perfmon_open_file().

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20260115150903.92163-3-mcanal@igalia.com/

- Replace XA_LIMIT(VC4_PERFMONID_MIN, VC4_PERFMONID_MAX) with
  xa_limit_32b (Tvrtko Ursulin)

---
 drivers/gpu/drm/vc4/vc4_drv.h     |  5 +--
 drivers/gpu/drm/vc4/vc4_perfmon.c | 51 +++++++++++++------------------
 2 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 221d8e01d539..dbcc83b7df00 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -791,10 +791,7 @@ struct vc4_exec_info {
 struct vc4_file {
 	struct vc4_dev *dev;
 
-	struct {
-		struct idr idr;
-		struct mutex lock;
-	} perfmon;
+	struct xarray perfmons;
 
 	bool bin_bo_used;
 };
diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 1ac80c0b258f..c02609b3ca47 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -14,9 +14,6 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
-#define VC4_PERFMONID_MIN	1
-#define VC4_PERFMONID_MAX	U32_MAX
-
 void vc4_perfmon_get(struct vc4_perfmon *perfmon)
 {
 	struct vc4_dev *vc4;
@@ -95,10 +92,10 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return NULL;
 
-	mutex_lock(&vc4file->perfmon.lock);
-	perfmon = idr_find(&vc4file->perfmon.idr, id);
+	xa_lock(&vc4file->perfmons);
+	perfmon = xa_load(&vc4file->perfmons, id);
 	vc4_perfmon_get(perfmon);
-	mutex_unlock(&vc4file->perfmon.lock);
+	xa_unlock(&vc4file->perfmons);
 
 	return perfmon;
 }
@@ -110,37 +107,34 @@ void vc4_perfmon_open_file(struct vc4_file *vc4file)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
-	mutex_init(&vc4file->perfmon.lock);
-	idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
-	vc4file->dev = vc4;
+	xa_init_flags(&vc4file->perfmons, XA_FLAGS_ALLOC1);
 }
 
-static int vc4_perfmon_idr_del(int id, void *elem, void *data)
+static void vc4_perfmon_delete(struct vc4_file *vc4file,
+			       struct vc4_perfmon *perfmon)
 {
-	struct vc4_perfmon *perfmon = elem;
-	struct vc4_dev *vc4 = (struct vc4_dev *)data;
+	struct vc4_dev *vc4 = vc4file->dev;
 
 	/* If the active perfmon is being destroyed, stop it first */
 	if (perfmon == vc4->active_perfmon)
 		vc4_perfmon_stop(vc4, perfmon, false);
 
 	vc4_perfmon_put(perfmon);
-
-	return 0;
 }
 
 void vc4_perfmon_close_file(struct vc4_file *vc4file)
 {
 	struct vc4_dev *vc4 = vc4file->dev;
+	struct vc4_perfmon *perfmon;
+	unsigned long id;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return;
 
-	mutex_lock(&vc4file->perfmon.lock);
-	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, vc4);
-	idr_destroy(&vc4file->perfmon.idr);
-	mutex_unlock(&vc4file->perfmon.lock);
-	mutex_destroy(&vc4file->perfmon.lock);
+	xa_for_each(&vc4file->perfmons, id, perfmon)
+		vc4_perfmon_delete(vc4file, perfmon);
+
+	xa_destroy(&vc4file->perfmons);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
@@ -152,6 +146,7 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
 	struct vc4_perfmon *perfmon;
 	unsigned int i;
 	int ret;
+	u32 id;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
@@ -185,17 +180,15 @@ int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
 
 	refcount_set(&perfmon->refcnt, 1);
 
-	mutex_lock(&vc4file->perfmon.lock);
-	ret = idr_alloc(&vc4file->perfmon.idr, perfmon, VC4_PERFMONID_MIN,
-			VC4_PERFMONID_MAX, GFP_KERNEL);
-	mutex_unlock(&vc4file->perfmon.lock);
-
+	ret = xa_alloc(&vc4file->perfmons, &id, perfmon, xa_limit_32b,
+		       GFP_KERNEL);
 	if (ret < 0) {
 		kfree(perfmon);
 		return ret;
 	}
 
-	req->id = ret;
+	req->id = id;
+
 	return 0;
 }
 
@@ -215,14 +208,12 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	mutex_lock(&vc4file->perfmon.lock);
-	perfmon = idr_remove(&vc4file->perfmon.idr, req->id);
-	mutex_unlock(&vc4file->perfmon.lock);
-
+	perfmon = xa_erase(&vc4file->perfmons, req->id);
 	if (!perfmon)
 		return -EINVAL;
 
-	vc4_perfmon_put(perfmon);
+	vc4_perfmon_delete(vc4file, perfmon);
+
 	return 0;
 }
 
-- 
2.52.0

