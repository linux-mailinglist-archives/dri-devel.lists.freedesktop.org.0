Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E60868F33
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B01B10F319;
	Tue, 27 Feb 2024 11:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QBOHVnZ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eX7MLuBN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QBOHVnZ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eX7MLuBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E962C10EFC2;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DA8422750;
 Tue, 27 Feb 2024 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
 b=QBOHVnZ+RrkbKXomSZ1lThUHL8gXbAZIV1Zw2ythYqPwn31W09M8rthmroUTmJgvnv7uG7
 Qm61bxrpBiKZF/Ds1QnkXC4c1ukk5Nkt0QLpixNltU2nC4KDDPcIxRkuFocJydlUeEdwlI
 VDrxbuZFTDcnSgCZs0N5LFqdYIXiHcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
 b=eX7MLuBNXl8uZLjiXl4e1GunYe5EBaQvU01lL/icN21GiwZH0x5Ec4u9CBi/GUgax+6Jxy
 lvQ1FOjSIM7SIQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
 b=QBOHVnZ+RrkbKXomSZ1lThUHL8gXbAZIV1Zw2ythYqPwn31W09M8rthmroUTmJgvnv7uG7
 Qm61bxrpBiKZF/Ds1QnkXC4c1ukk5Nkt0QLpixNltU2nC4KDDPcIxRkuFocJydlUeEdwlI
 VDrxbuZFTDcnSgCZs0N5LFqdYIXiHcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
 b=eX7MLuBNXl8uZLjiXl4e1GunYe5EBaQvU01lL/icN21GiwZH0x5Ec4u9CBi/GUgax+6Jxy
 lvQ1FOjSIM7SIQCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 71C7F13216;
 Tue, 27 Feb 2024 11:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cCJxGtPJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:59 +0000
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
Subject: [PATCH 05/13] drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
Date: Tue, 27 Feb 2024 11:14:52 +0100
Message-ID: <20240227113853.8464-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLqs7qcp4g99ribr8z1n9xsc8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; RCPT_COUNT_TWELVE(0.00)[30];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[24.18%]
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

Implement pinning without locking in nouveau_bo_pin_locked(). Keep
nouveau_bo_pin() for acquiring the buffer object's reservation lock.
The new helper will be useful for implementing the GEM pin callback
with correct semantics. Same for unpin.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 43 +++++++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_bo.h |  2 ++
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 56dcd25db1ce2..4a7c002a325a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -467,17 +467,14 @@ nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
 	set_placement_range(nvbo, domain);
 }
 
-int
-nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
+int nouveau_bo_pin_locked(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
 	bool force = false, evict = false;
-	int ret;
+	int ret = 0;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(bo->base.resv);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
 	    domain == NOUVEAU_GEM_DOMAIN_VRAM && contig) {
@@ -540,20 +537,15 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 out:
 	if (force && ret)
 		nvbo->contig = false;
-	ttm_bo_unreserve(bo);
 	return ret;
 }
 
-int
-nouveau_bo_unpin(struct nouveau_bo *nvbo)
+void nouveau_bo_unpin_locked(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
-	int ret;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(bo->base.resv);
 
 	ttm_bo_unpin(&nvbo->bo);
 	if (!nvbo->bo.pin_count) {
@@ -568,8 +560,33 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 			break;
 		}
 	}
+}
+
+int nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
+{
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
 
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return ret;
+	ret = nouveau_bo_pin_locked(nvbo, domain, contig);
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+
+int nouveau_bo_unpin(struct nouveau_bo *nvbo)
+{
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
+
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return ret;
+	nouveau_bo_unpin_locked(nvbo);
 	ttm_bo_unreserve(bo);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index e9dfab6a81560..4e891752c2551 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -85,6 +85,8 @@ int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 domain,
 		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
 		    struct dma_resv *robj,
 		    struct nouveau_bo **);
+int  nouveau_bo_pin_locked(struct nouveau_bo *nvbo, uint32_t domain, bool contig);
+void nouveau_bo_unpin_locked(struct nouveau_bo *nvbo);
 int  nouveau_bo_pin(struct nouveau_bo *, u32 flags, bool contig);
 int  nouveau_bo_unpin(struct nouveau_bo *);
 int  nouveau_bo_map(struct nouveau_bo *);
-- 
2.43.2

