Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8EA868F44
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB8610F32A;
	Tue, 27 Feb 2024 11:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zlPdJuLT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CZCFTYjr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zlPdJuLT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CZCFTYjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8153510EFC2;
 Tue, 27 Feb 2024 11:39:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 188521FD35;
 Tue, 27 Feb 2024 11:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qv+cmNpN6bABL4zQ3D1sbnX7AZu8VR7PIhXGXWvPPk8=;
 b=zlPdJuLTMeoMP3U92nFgE03WfmufoZ7cfRMsBqpiUzj4JvtnCVGfUe+sPjmYa28qgtllBN
 OQKK8PtXp43kJsXmHEvnxh60ellP7vBgAoshNzrsL6RGGrTccY/LDoFRBW+QqIbCC2W3Jn
 ST5LaHghtHmj2gcvSmFHcV5+eU2wxrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qv+cmNpN6bABL4zQ3D1sbnX7AZu8VR7PIhXGXWvPPk8=;
 b=CZCFTYjrFyk0ilK9gk56lsct47mFeBBWpjF5TmUt3P9R6GT7NduSUMUNCbCjW/tVaDdZ8F
 crSJkx3Gp08JMvBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qv+cmNpN6bABL4zQ3D1sbnX7AZu8VR7PIhXGXWvPPk8=;
 b=zlPdJuLTMeoMP3U92nFgE03WfmufoZ7cfRMsBqpiUzj4JvtnCVGfUe+sPjmYa28qgtllBN
 OQKK8PtXp43kJsXmHEvnxh60ellP7vBgAoshNzrsL6RGGrTccY/LDoFRBW+QqIbCC2W3Jn
 ST5LaHghtHmj2gcvSmFHcV5+eU2wxrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qv+cmNpN6bABL4zQ3D1sbnX7AZu8VR7PIhXGXWvPPk8=;
 b=CZCFTYjrFyk0ilK9gk56lsct47mFeBBWpjF5TmUt3P9R6GT7NduSUMUNCbCjW/tVaDdZ8F
 crSJkx3Gp08JMvBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DB9413216;
 Tue, 27 Feb 2024 11:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SJ1jEdjJ3WVMUQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:39:04 +0000
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
Subject: [PATCH 11/13] drm/client: Pin vmap'ed GEM buffers
Date: Tue, 27 Feb 2024 11:14:58 +0100
Message-ID: <20240227113853.8464-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zlPdJuLT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CZCFTYjr
X-Spamd-Result: default: False [2.68 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLo3wgn6xaqcdyw4c639zmwwtu)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.01)[48.59%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[30]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.68
X-Rspamd-Queue-Id: 188521FD35
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++
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

The function drm_client_buffer_vmap() establishes a long-term mapping
of the client's buffer object into the kernel address space. Make sure
that buffer does not move by pinning it to its current location. Same
for vunmap with unpin.

The only caller of drm_client_buffer_vmap() is fbdev-dma, which uses
gem-dma. As DMA-backed GEM buffers do not move, this change is for
correctness with little impact in practice.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2cc81831236b5..77fe217aeaf36 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -388,16 +388,30 @@ int
 drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 		       struct iosys_map *map_copy)
 {
+	struct drm_gem_object *gem = buffer->gem;
 	struct iosys_map *map = &buffer->map;
 	int ret;
 
-	ret = drm_gem_vmap_unlocked(buffer->gem, map);
+	drm_gem_lock(gem);
+
+	ret = drm_gem_pin_locked(gem);
 	if (ret)
-		return ret;
+		goto err_drm_gem_pin_locked;
+	ret = drm_gem_vmap(gem, map);
+	if (ret)
+		goto err_drm_gem_vmap;
+
+	drm_gem_unlock(gem);
 
 	*map_copy = *map;
 
 	return 0;
+
+err_drm_gem_vmap:
+	drm_gem_unpin_locked(buffer->gem);
+err_drm_gem_pin_locked:
+	drm_gem_unlock(gem);
+	return ret;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -411,9 +425,13 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
+	struct drm_gem_object *gem = buffer->gem;
 	struct iosys_map *map = &buffer->map;
 
-	drm_gem_vunmap_unlocked(buffer->gem, map);
+	drm_gem_lock(gem);
+	drm_gem_vunmap(gem, map);
+	drm_gem_unpin_locked(gem);
+	drm_gem_unlock(gem);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
-- 
2.43.2

