Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DC868F36
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310A310F31E;
	Tue, 27 Feb 2024 11:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EIip1was";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/r213L71";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EIip1was";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/r213L71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA6E10F2F0;
 Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D648A2274F;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
 b=EIip1wasq42dh5HLOR8rCl5/x8NVUdfyWV0Lksbk739jy+1S5LaVApsO+tfSPtr2jqmC3J
 mWwayLjxqEsEGwd603nR6nCxLnDJJKOJqd2ZxhAcJtckDqJqX51qpFNhyXzoq21HgSMU+O
 PZ6qtgCT/wuB33guHwKDKSSmDVnn6mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
 b=/r213L712WtrNOv//INF5QDNWmL+6in4afs/kADW6Lu2xm1gzW4tkzSHYK6alop6to4Rs2
 YyX0hwJPKSa+/xCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
 b=EIip1wasq42dh5HLOR8rCl5/x8NVUdfyWV0Lksbk739jy+1S5LaVApsO+tfSPtr2jqmC3J
 mWwayLjxqEsEGwd603nR6nCxLnDJJKOJqd2ZxhAcJtckDqJqX51qpFNhyXzoq21HgSMU+O
 PZ6qtgCT/wuB33guHwKDKSSmDVnn6mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CSK/N04eUehs4wa6IhRI10IV4iGyTth6Lhzd5f6Dd8=;
 b=/r213L712WtrNOv//INF5QDNWmL+6in4afs/kADW6Lu2xm1gzW4tkzSHYK6alop6to4Rs2
 YyX0hwJPKSa+/xCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 181A313216;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sKZ8BNXJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/13] drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
Date: Tue, 27 Feb 2024 11:14:54 +0100
Message-ID: <20240227113853.8464-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EIip1was;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/r213L71"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.46 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.03)[56.18%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.46
X-Rspamd-Queue-Id: D648A2274F
X-Spam-Flag: NO
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

Rename __qxl_bo_pin() to qxl_bo_pin_locked() and update all callers.
The function will be helpful for implementing the GEM pin callback
with correct semantics. Same for __qxl_bo_unpin().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_object.c | 25 +++++++++++++------------
 drivers/gpu/drm/qxl/qxl_object.h |  2 ++
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 1e46b0a6e4787..39218e979a807 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -29,9 +29,6 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
-static int __qxl_bo_pin(struct qxl_bo *bo);
-static void __qxl_bo_unpin(struct qxl_bo *bo);
-
 static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct qxl_bo *bo;
@@ -167,13 +164,13 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		goto out;
 	}
 
-	r = __qxl_bo_pin(bo);
+	r = qxl_bo_pin_locked(bo);
 	if (r)
 		return r;
 
 	r = ttm_bo_vmap(&bo->tbo, &bo->map);
 	if (r) {
-		__qxl_bo_unpin(bo);
+		qxl_bo_unpin_locked(bo);
 		return r;
 	}
 	bo->map_count = 1;
@@ -246,7 +243,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 		return;
 	bo->kptr = NULL;
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
-	__qxl_bo_unpin(bo);
+	qxl_bo_unpin_locked(bo);
 }
 
 int qxl_bo_vunmap(struct qxl_bo *bo)
@@ -290,12 +287,14 @@ struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo)
 	return bo;
 }
 
-static int __qxl_bo_pin(struct qxl_bo *bo)
+int qxl_bo_pin_locked(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { false, false };
 	struct drm_device *ddev = bo->tbo.base.dev;
 	int r;
 
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->tbo.pin_count) {
 		ttm_bo_pin(&bo->tbo);
 		return 0;
@@ -309,14 +308,16 @@ static int __qxl_bo_pin(struct qxl_bo *bo)
 	return r;
 }
 
-static void __qxl_bo_unpin(struct qxl_bo *bo)
+void qxl_bo_unpin_locked(struct qxl_bo *bo)
 {
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	ttm_bo_unpin(&bo->tbo);
 }
 
 /*
  * Reserve the BO before pinning the object.  If the BO was reserved
- * beforehand, use the internal version directly __qxl_bo_pin.
+ * beforehand, use the internal version directly qxl_bo_pin_locked.
  *
  */
 int qxl_bo_pin(struct qxl_bo *bo)
@@ -327,14 +328,14 @@ int qxl_bo_pin(struct qxl_bo *bo)
 	if (r)
 		return r;
 
-	r = __qxl_bo_pin(bo);
+	r = qxl_bo_pin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return r;
 }
 
 /*
  * Reserve the BO before pinning the object.  If the BO was reserved
- * beforehand, use the internal version directly __qxl_bo_unpin.
+ * beforehand, use the internal version directly qxl_bo_unpin_locked.
  *
  */
 int qxl_bo_unpin(struct qxl_bo *bo)
@@ -345,7 +346,7 @@ int qxl_bo_unpin(struct qxl_bo *bo)
 	if (r)
 		return r;
 
-	__qxl_bo_unpin(bo);
+	qxl_bo_unpin_locked(bo);
 	qxl_bo_unreserve(bo);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 53392cb90eecf..1cf5bc7591016 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -67,6 +67,8 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int pa
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
 extern struct qxl_bo *qxl_bo_ref(struct qxl_bo *bo);
 extern void qxl_bo_unref(struct qxl_bo **bo);
+extern int qxl_bo_pin_locked(struct qxl_bo *bo);
+extern void qxl_bo_unpin_locked(struct qxl_bo *bo);
 extern int qxl_bo_pin(struct qxl_bo *bo);
 extern int qxl_bo_unpin(struct qxl_bo *bo);
 extern void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain);
-- 
2.43.2

