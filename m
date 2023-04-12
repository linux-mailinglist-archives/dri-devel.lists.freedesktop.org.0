Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6426DF944
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6A210E869;
	Wed, 12 Apr 2023 15:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141010E869
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681311771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fOTqvY719R4jZzP4ns7YSiBLEN7m3bKNAvtcXsEuWyw=;
 b=YS+d5bA88HBhosMJWyxz8LgmLkbZkvtVqoVYKcA1mSO7Yqwq5kzpcWkgWhF9MeHd22Ijdk
 ofWgSy5cHHaq16UsVd7z756n+FUPZv5ZRz3nqCwYnZevPM2c4cof746ZbUILCBLlEpXobf
 dc8BXaEhil7adVV8gr01FMNcbRVQvDo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-Jq_QeBlgN02CQxWnjQ48jw-1; Wed, 12 Apr 2023 11:02:47 -0400
X-MC-Unique: Jq_QeBlgN02CQxWnjQ48jw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso486606wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681311765; x=1683903765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fOTqvY719R4jZzP4ns7YSiBLEN7m3bKNAvtcXsEuWyw=;
 b=4wNQVbqbn1hxrQ+nCqB7AT4MiQRDqxNJ2US4S0cnnAgIdIR31eNYA7s4GuN+Wse/GC
 aw+q+Yd36IhjmjFrXMcFZPI1xFdRcRjWfP8Fqgxof+BekMvsmLylcf2vwWgMWzTq1SEB
 aFXJKgZxpFkIzuS1nEue5U8w200qY6pCgcmXXKOVbPxqm+7cUI1zzN4K/dFPtOz+pldW
 hPUiDgeACE8X0vBdGbQgcrfe/54mDef3kLfMAZJaYNTHTC3gltyBov0nhXIqzbcq5X6K
 Wse6/2uyPWF4bVhEOiyLKxejMFeZ+470B4q35vzWqgO5eTiBYfOlUydwwGRmqqPjTROc
 O4lw==
X-Gm-Message-State: AAQBX9fIxtWd2lMUnra2I8gesiOVCceryloAN44vwsPSdO2YfUPhSUfl
 +w58DF94qvsDNsLNsLP52boNmR7A59wGCbnU/FUSJD96Ae9OzSJQbuaT3/0bXw3PAA7VePQuRXB
 dWUdpMrR2ef99HPOIGFg2MgL9q8lV
X-Received: by 2002:a7b:c406:0:b0:3ed:ca62:418e with SMTP id
 k6-20020a7bc406000000b003edca62418emr12888226wmi.9.1681311765048; 
 Wed, 12 Apr 2023 08:02:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zs3sEW6ZK/haeqlD0EesehbH1qFxifoinpDruNHzuIvT1CjAWb8Wn3A32owwiWpevsufxCtA==
X-Received: by 2002:a7b:c406:0:b0:3ed:ca62:418e with SMTP id
 k6-20020a7bc406000000b003edca62418emr12888200wmi.9.1681311764728; 
 Wed, 12 Apr 2023 08:02:44 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s5-20020a7bc385000000b003edcc2223c6sm2620876wmj.28.2023.04.12.08.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:02:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
Date: Wed, 12 Apr 2023 17:02:25 +0200
Message-Id: <20230412150225.3757223-1-javierm@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
fixed format selection, by calculating the bits-per-pixel instead of just
using the reported color depth.

But unfortunately this broke some modes because the stride is always set
to the reported line length (in bytes), which could not match the actual
stride if the calculated bits-per-pixel doesn't match the reported depth.

Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
Reported-by: Pierre Asselin <pa@panix.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/firmware/sysfb_simplefb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..5dc23e57089f 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -28,7 +28,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 			     struct simplefb_platform_data *mode)
 {
 	__u8 type;
-	u32 bits_per_pixel;
+	u32 bits_per_pixel, stride;
 	unsigned int i;
 
 	type = si->orig_video_isVGA;
@@ -54,14 +54,19 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	 * bits_per_pixel here and ignore lfb_depth. In the loop below,
 	 * ignore simplefb formats with alpha bits, as EFI and VESA
 	 * don't specify alpha channels.
+	 *
+	 * If a calculated bits_per_pixel is used instead of lfb_depth,
+	 * then also ignore lfb_linelength and calculate the stride.
 	 */
 	if (si->lfb_depth > 8) {
 		bits_per_pixel = max(max3(si->red_size + si->red_pos,
 					  si->green_size + si->green_pos,
 					  si->blue_size + si->blue_pos),
 				     si->rsvd_size + si->rsvd_pos);
+		stride = DIV_ROUND_UP(si->lfb_width * bits_per_pixel, 8);
 	} else {
 		bits_per_pixel = si->lfb_depth;
+		stride = si->lfb_linelength;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
@@ -80,7 +85,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 			mode->format = f->name;
 			mode->width = si->lfb_width;
 			mode->height = si->lfb_height;
-			mode->stride = si->lfb_linelength;
+			mode->stride = stride;
 			return true;
 		}
 	}

base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
-- 
2.40.0

