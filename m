Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AF868F28
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81510F304;
	Tue, 27 Feb 2024 11:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Iap4Gcqc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jgviNOO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iap4Gcqc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+jgviNOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234010F2F0;
 Tue, 27 Feb 2024 11:39:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10EFD1FB99;
 Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
 b=Iap4Gcqc0rjD2TRN2kykn26mW0SUEjzZuDmdkxZDC+WAqpPdKIqy0VLB7V5XDy/dFDyzMe
 xvH4RGdNis4x9HIccKV5omHXtmAgMJBTWurCxFkic6auyfXfXgx9YZ+GtM4GLshuoWqR6k
 znWTDmGP4NvEBQko8mDeuDwpmlo/YZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
 b=+jgviNOO7hbJ5BGlv+ZA2LWA4AyIZMqac9Mb3L87ltFgdGkEWE/f9yRKoiWOOri4ITG6+i
 Q1W5kalkmzziP3Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
 b=Iap4Gcqc0rjD2TRN2kykn26mW0SUEjzZuDmdkxZDC+WAqpPdKIqy0VLB7V5XDy/dFDyzMe
 xvH4RGdNis4x9HIccKV5omHXtmAgMJBTWurCxFkic6auyfXfXgx9YZ+GtM4GLshuoWqR6k
 znWTDmGP4NvEBQko8mDeuDwpmlo/YZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZV4CkeoE17AOm8bSqkPxWkJQ8aQ/V+vccV/TuSAVGrs=;
 b=+jgviNOO7hbJ5BGlv+ZA2LWA4AyIZMqac9Mb3L87ltFgdGkEWE/f9yRKoiWOOri4ITG6+i
 Q1W5kalkmzziP3Dg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 439FE13ABC;
 Tue, 27 Feb 2024 11:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id MFEpD9TJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:00 +0000
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
Subject: [PATCH 06/13] drm/nouveau: Acquire reservation lock in GEM pin/unpin
 callbacks
Date: Tue, 27 Feb 2024 11:14:53 +0100
Message-ID: <20240227113853.8464-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Iap4Gcqc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+jgviNOO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.40 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.09)[64.43%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.40
X-Rspamd-Queue-Id: 10EFD1FB99
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

Acquire the reservation lock directly in GEM pin callback. Same for
unpin. Prepares for further changes.

Dma-buf locking semantics require callers to hold the buffer's
reservation lock when invoking the pin and unpin callbacks. Prepare
nouveau accordingly by pushing locking out of the implementation. A
follow-up patch will fix locking for all GEM code at once.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1b2ff0c40fc1c..774f9bd031102 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -86,21 +86,32 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	struct ttm_buffer_object *bo = &nvbo->bo;
 	int ret;
 
-	/* pin buffer into GTT */
-	ret = nouveau_bo_pin(nvbo, NOUVEAU_GEM_DOMAIN_GART, false);
+	ret = ttm_bo_reserve(bo, false, false, NULL);
 	if (ret)
 		return -EINVAL;
+	/* pin buffer into GTT */
+	ret = nouveau_bo_pin_locked(nvbo, NOUVEAU_GEM_DOMAIN_GART, false);
+	if (ret)
+		ret = -EINVAL;
+	ttm_bo_unreserve(bo);
 
-	return 0;
+	return ret;
 }
 
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
 
-	nouveau_bo_unpin(nvbo);
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return;
+	nouveau_bo_unpin_locked(nvbo);
+	ttm_bo_unreserve(bo);
 }
 
 struct dma_buf *nouveau_gem_prime_export(struct drm_gem_object *gobj,
-- 
2.43.2

