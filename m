Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA386B063D3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441E10E61F;
	Tue, 15 Jul 2025 16:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JGLxR8MR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qWMAUg0b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JGLxR8MR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qWMAUg0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FDD10E616
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 16:02:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 670252119A;
 Tue, 15 Jul 2025 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752595367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfYjzuoxmyYeg6JjBAYw8VrD5CmAOs+t8N63zQx23+E=;
 b=JGLxR8MRJgnQbYq+YTrtsf7IkbYIeTF15u3/o3/xSIM3S+mARhDtemYXX4YQLnjxT3SI2r
 i2OWsBItrP8RnI3Y3oZbtk8Tr+eSL8lDbqZZE6ozsjt96lnKTsnDUSQQffFtT2tAxhcnV0
 N1LNMVPe21Z1YqBccSuAQsMr+kchadQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752595367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfYjzuoxmyYeg6JjBAYw8VrD5CmAOs+t8N63zQx23+E=;
 b=qWMAUg0b+eiGkAWFWj4s9bdcdJD+o8XWj/0JqE5oq2PK3gvt0dREnljsC/dGEX78CvQyRv
 vLbvvwlnkJtBK8AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JGLxR8MR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qWMAUg0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752595367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfYjzuoxmyYeg6JjBAYw8VrD5CmAOs+t8N63zQx23+E=;
 b=JGLxR8MRJgnQbYq+YTrtsf7IkbYIeTF15u3/o3/xSIM3S+mARhDtemYXX4YQLnjxT3SI2r
 i2OWsBItrP8RnI3Y3oZbtk8Tr+eSL8lDbqZZE6ozsjt96lnKTsnDUSQQffFtT2tAxhcnV0
 N1LNMVPe21Z1YqBccSuAQsMr+kchadQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752595367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfYjzuoxmyYeg6JjBAYw8VrD5CmAOs+t8N63zQx23+E=;
 b=qWMAUg0b+eiGkAWFWj4s9bdcdJD+o8XWj/0JqE5oq2PK3gvt0dREnljsC/dGEX78CvQyRv
 vLbvvwlnkJtBK8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFD5413A6C;
 Tue, 15 Jul 2025 16:02:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gDHrMKZ7dmiFaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 16:02:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: [PATCH v3 5/7] Revert "drm/gem-framebuffer: Use dma_buf from GEM
 object instance"
Date: Tue, 15 Jul 2025 17:58:15 +0200
Message-ID: <20250715155934.150656-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715155934.150656-1-tzimmermann@suse.de>
References: <20250715155934.150656-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[22];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[etnaviv];
 DKIM_TRACE(0.00)[suse.de:+];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim, suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 670252119A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
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

This reverts commit cce16fcd7446dcff7480cd9d2b6417075ed81065.

The dma_buf field in struct drm_gem_object is not stable over the
object instance's lifetime. The field becomes NULL when user space
releases the final GEM handle on the buffer object. This resulted
in a NULL-pointer deref.

Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
Acquire internal references on GEM handles") only solved the problem
partially. They especially don't work for buffer objects without a DRM
framebuffer associated.

Hence, this revert to going back to using .import_attach->dmabuf.

v3:
- cc stable

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org> # v6.15+
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 618ce725cd75..fefb2a0f6b40 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -420,6 +420,7 @@ EXPORT_SYMBOL(drm_gem_fb_vunmap);
 static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir,
 					unsigned int num_planes)
 {
+	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	int ret;
 
@@ -428,9 +429,10 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
 		obj = drm_gem_fb_get_obj(fb, num_planes);
 		if (!obj)
 			continue;
+		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_end_cpu_access(obj->dma_buf, dir);
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
 			drm_err(fb->dev, "dma_buf_end_cpu_access(%u, %d) failed: %d\n",
 				ret, num_planes, dir);
@@ -453,6 +455,7 @@ static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_dat
  */
 int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
 {
+	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	unsigned int i;
 	int ret;
@@ -463,9 +466,10 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 			ret = -EINVAL;
 			goto err___drm_gem_fb_end_cpu_access;
 		}
+		import_attach = obj->import_attach;
 		if (!drm_gem_is_imported(obj))
 			continue;
-		ret = dma_buf_begin_cpu_access(obj->dma_buf, dir);
+		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
 			goto err___drm_gem_fb_end_cpu_access;
 	}
-- 
2.50.0

