Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A2A4680D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC410E984;
	Wed, 26 Feb 2025 17:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HI6aYuV+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/9Kr6ooL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QKYIuPvG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xU99DSOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385BD10E982
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:28:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1893211BA;
 Wed, 26 Feb 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXS0NRkIQVDa9v2S7069aIfYa4Ke/ElyG+7nz+trVQc=;
 b=HI6aYuV+nHfMqwP0x4mfYUGI+Eop8r9S6Jg0g0LuEaev1FEslvwWXTTbpPsc63vftq3L/5
 Nh1mqUateeUk4x2LYb1ZX86ONDxW5TUs5tDKRT2FGg93wgVMXnSu/x7RXGyj5MzZAiGFU7
 Boxx5FOLgbx+hMo7QjnXudfK2kX5glY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXS0NRkIQVDa9v2S7069aIfYa4Ke/ElyG+7nz+trVQc=;
 b=/9Kr6ooL5MoxX4Cjo4z4YGvCUswlsUsfAFYtICaP31LwfuiyfcII/2hfMiL5TF3y1htRX6
 2BM7MdCDmwOdSRAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXS0NRkIQVDa9v2S7069aIfYa4Ke/ElyG+7nz+trVQc=;
 b=QKYIuPvGlQ4sQYQwRoM42JpHRscJ846fRxFhAsF/Do92p/pE63ry/907qCjGZhBNy83IMd
 daZ1sU7LvdWeEkSceEJrFo4yhtcw4jx8y+ZkO3VWd5MRPGUxDMN1xgURb7s6obeTgLXODu
 g99Sb8/EyUjiz7f7J+YAA1ApaGH/duA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590894;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXS0NRkIQVDa9v2S7069aIfYa4Ke/ElyG+7nz+trVQc=;
 b=xU99DSOgPBqsxyByJE30n7uaibKRA02M3W6lbqr/lWCdyeE+PVBV/NU0pFRE3/GzUzorFL
 QCP62CaeC2PNB4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0BFE13A82;
 Wed, 26 Feb 2025 17:28:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aJ3aKS5Pv2cWBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 17:28:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/10] drm/gem-framebuffer: Use dma_buf from GEM object
 instance
Date: Wed, 26 Feb 2025 18:03:10 +0100
Message-ID: <20250226172457.217725-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226172457.217725-1-tzimmermann@suse.de>
References: <20250226172457.217725-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.948];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.79
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

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 2bf606ba24cd..0fbeb686e561 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -419,7 +419,6 @@ EXPORT_SYMBOL(drm_gem_fb_vunmap);
 static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir,
 					unsigned int num_planes)
 {
-	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	int ret;
 
@@ -428,10 +427,9 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
 		obj = drm_gem_fb_get_obj(fb, num_planes);
 		if (!obj)
 			continue;
-		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
+		ret = dma_buf_end_cpu_access(obj->dma_buf, dir);
 		if (ret)
 			drm_err(fb->dev, "dma_buf_end_cpu_access(%u, %d) failed: %d\n",
 				ret, num_planes, dir);
@@ -454,7 +452,6 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
  */
 int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
 {
-	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	unsigned int i;
 	int ret;
@@ -465,10 +462,9 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 			ret = -EINVAL;
 			goto err___drm_gem_fb_end_cpu_access;
 		}
-		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
+		ret = dma_buf_begin_cpu_access(obj->dma_buf, dir);
 		if (ret)
 			goto err___drm_gem_fb_end_cpu_access;
 	}
-- 
2.48.1

