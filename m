Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dRe5Dn1MrWnY1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 11:16:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFC22F4CA
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 11:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE1E10E0F5;
	Sun,  8 Mar 2026 10:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l/psn+Ur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091510E0F5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 10:16:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so8216622f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772964982; x=1773569782; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r1M7cJDIewQ99ulliRiFRi494hczaIMjS0kWLIY8AF4=;
 b=l/psn+UrTE/2fRzFxbOJL2UMyUET6jynaUk/dGot8sSTcreEQSOveGZMuFO9V+vPOP
 L4CFSpCs2TByzf96oMEOZ8Lv4U9AAD3pbksWfAasIXmjqsfc0Y4CHRgwIDkdLMNYol+u
 s8UQ8bqfEBCEy0RDCGYYMW8x9f6jkPnX1TkboifdD7KhaViGiOvz3Cj+2MLn90MnkVy+
 apHhRyZVUG4hmMoH+bUi3/jQ7ATnw22glzbGAJVsn22P7Tk6G9V5yUD0Pm4RIZGV1A3m
 tNNc+xljg8i+wYzgwnu7CSoBL7mU+H17BdXDRVb3o50z9hF0iAN1SJoCIyZZ/M/Umwev
 fp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772964982; x=1773569782;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1M7cJDIewQ99ulliRiFRi494hczaIMjS0kWLIY8AF4=;
 b=C28/kc/1HNYD0rMRP18Q5ltlAOH3Rm9HRLly+cjDm+aSxPVHXkIgi6AlZTE7Iy6tU5
 Jky5GFoQWlwWA5XQvQXlXzX+sgfRIiKM89eZoIXmK9I92pEHhaIHf+cIhfWi25AXrEyW
 VhopEDjuv3dM9MQzcFP/wzkjLR/hD3QcdtApR8QMzCi40aL8VTtJRMXBR4wcQ+bq7fl6
 O+F8tV0PL+xNZkCJJvY/4WUePmAiir9Szeb2zO7ekZvrZIa7d1PHUbH2D+60HgmI8j3y
 5dQJnlInku9PUb223jbVC2h9YDQuo3Qod6LYHIIf0kKxQBujibUEPYK5i1kNHW5uXWUz
 9Lkg==
X-Gm-Message-State: AOJu0Yyewx1NfXPRvC3I/xehYY780y12UWrpC3iUpQNWi4GWVyuAlIlb
 lJ26dhjtnkGNCcTV29mC/W1b5UYMtv9dL2FlhoAinYUqqfitU82bh93/JIZM5+/G
X-Gm-Gg: ATEYQzyZCjJIHM5NmNGKjN6JWVyQQXhhoGoh2IB3MPXF2Y1NAgIDo1+IhdURxL+yR0Q
 YawZc7idaKaio6MPCXi9ZlPv9eIzuN9jYCSWaaxE+WjPjPV05nk1ZNA2xu22N5qJSCbcLPCujqI
 KTgEm1pbmxdMr25+qNVwn2DcEhDGN0IH+NZ7HCHP/NeXA2pgE1ksCpsqfc4oPn4IgkoxU+Oyp12
 jyzw7aXnhA2UwzCtOVRH+y39ykqplLzuktiP43ZWec3dvCI+/e7r5CSjXmqBEiIklkDKnqFn0oQ
 pyhyJ49vtTQSLd0Lztj2wOsPafQoC1OrpYSziZ87dC3i/PeXMoNBOKPQopzHY3OSJfthv1bPTHS
 Wo6fCpQSfrOjs/Ts0h+JE//3YtrQnrZ2bq9l7WvqH2Pb6dYQLPQG2BAye0HnCuk5ek6iJuQ5S3e
 speyaYFd5uOKYv1e+0u1Jm+9Y+JF3aIPwgX08DDJynzuEeqJeiQ5IeOQn0cbio7+a7uOP/94LR2
 ao22ehqWpNt/kTLXGT5
X-Received: by 2002:a05:6000:178f:b0:439:b2d9:cf35 with SMTP id
 ffacd0b85a97d-439da64f838mr13391513f8f.8.1772964982098; 
 Sun, 08 Mar 2026 03:16:22 -0700 (PDT)
Received: from [127.0.1.1]
 (2a01cb0012bffa003c9ca4edfdd4e172.ipv6.abo.wanadoo.fr.
 [2a01:cb00:12bf:fa00:3c9c:a4ed:fdd4:e172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm18890466f8f.32.2026.03.08.03.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 03:16:21 -0700 (PDT)
From: Amin GATTOUT <amin.gattout@gmail.com>
Date: Sun, 08 Mar 2026 11:15:57 +0100
Subject: [PATCH] drm/loongson: use drm_gem_ttm_dumb_map_offset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-master-v1-1-af32d71c8a1d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFxMrWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwML3dzE4pLUIl1TizSD5CQTS6Nk01QloOKCotS0zAqwQdGxtbUAokM
 nPVgAAAA=
To: Sui Jingfeng <suijingfeng@loongson.cn>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Amin GATTOUT <amin.gattout@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772964981; l=2766;
 i=amin.gattout@gmail.com; h=from:subject:message-id;
 bh=eFxzNr5PrfT1jo5pKjIS5kQAx8mJ0kgA3mYlRoLglEM=;
 b=rnkhjvgGpACrE2+9kB8RCAmhgwFKWWOgS2YZl/Jg9CiJ2VCQGPXGlXiTZrGNwe+wG+yBZl0B+
 cZLJ2wlhRRSCmrUIdfCUY4qYisusQR/8lDAsMBbvqP7DDxfsIgfLSrr
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=C9HM6Jf5d9dPl9fnP9pM/nhMwm+c280ldqYZ0ESu3a8=
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
X-Rspamd-Queue-Id: 8ECFC22F4CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:suijingfeng@loongson.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:amin.gattout@gmail.com,m:amingattout@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[loongson.cn,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[amingattout@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Replace the open-coded lsdc_dumb_map_offset() with the generic
drm_gem_ttm_dumb_map_offset() helper, which is functionally identical.
This removes unnecessary boilerplate and aligns with the DRM convention
for TTM-based drivers.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 drivers/gpu/drm/loongson/lsdc_drv.c |  3 ++-
 drivers/gpu/drm/loongson/lsdc_gem.c | 15 ---------------
 drivers/gpu/drm/loongson/lsdc_gem.h |  4 ----
 3 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index abf5bf68eec2..1ece1ea42f78 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_print.h>
@@ -45,7 +46,7 @@ static const struct drm_driver lsdc_drm_driver = {
 
 	.debugfs_init = lsdc_debugfs_init,
 	.dumb_create = lsdc_dumb_create,
-	.dumb_map_offset = lsdc_dumb_map_offset,
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
 	DRM_FBDEV_TTM_DRIVER_OPS,
 };
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index 6372db2d3093..2fb03487c983 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -234,21 +234,6 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 	return 0;
 }
 
-int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
-			 u32 handle, uint64_t *offset)
-{
-	struct drm_gem_object *gobj;
-
-	gobj = drm_gem_object_lookup(filp, handle);
-	if (!gobj)
-		return -ENOENT;
-
-	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
-
-	drm_gem_object_put(gobj);
-
-	return 0;
-}
 
 void lsdc_gem_init(struct drm_device *ddev)
 {
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
index 92cbb10e6e13..96729b3eebec 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.h
+++ b/drivers/gpu/drm/loongson/lsdc_gem.h
@@ -14,10 +14,6 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
 			   struct dma_buf_attachment *attach,
 			   struct sg_table *sg);
 
-int lsdc_dumb_map_offset(struct drm_file *file,
-			 struct drm_device *dev,
-			 u32 handle,
-			 uint64_t *offset);
 
 int lsdc_dumb_create(struct drm_file *file,
 		     struct drm_device *ddev,

---
base-commit: c23719abc3308df7ed3ad35650ad211fb2d2003d
change-id: 20260308-master-58f0cb492c5e

Best regards,
-- 
Amin GATTOUT <amin.gattout@gmail.com>

