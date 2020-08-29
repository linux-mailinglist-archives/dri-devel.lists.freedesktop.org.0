Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F4256807
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 16:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A796E05A;
	Sat, 29 Aug 2020 14:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605876E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 14:07:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o13so1848572pgf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G4Co+LDYHQDXFnU8L4kBtVkB8qH4ZjDz0L0to2gfrKY=;
 b=VLkSOoR/YR8forWhO67URYv2p62bdEUJPYPqIFIdrHshtLyU3x/JWxTnz1xV4x4Eoe
 tbxEFIrPu+Phv9bL3xrw6grMczHzX1voAIt+iylXLjxEpG/egTgZmD+ehF6OmvdfhPvP
 quqbzPRt3Kzp3fwQWnPmKEJcda0P2TxoGmpykz6+/MPuYbzp+Du6YJv6P/onoDXyBN/0
 pwO8QzuQr8l59g4G2vfIQk5F2HybQTbQlwNmyfi8+rXxwpamCKTASm5NFiDJGoL75TOO
 i706fmWgETbTrH9DxVApbbrC53jSQdxmF+FT9P0rvwMtzTpznq9NFhrDayPujwwh2ymn
 K3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G4Co+LDYHQDXFnU8L4kBtVkB8qH4ZjDz0L0to2gfrKY=;
 b=TdbMYkagXzo2DOKcw143AdF2a/eJea3zPUvVAYNK+MMkptEmj7RzQqZkMjdb3/fT9l
 zDITYfIplAuj3wfdO086uYD2p9BSbfXxPmmoMFrOOTR2+iBFn474KzkNDkq0tNPsMQRk
 UH3wcPbNqRZgf4aKEWCGeEWjH380ol0oV8NOie5RseOZORuEc73iSuTjFjQdW9kfTF1w
 YblkZYiMyhA590lnkQlHgEs4ShOacgXjHoSEg90j3bfyMU4N+2c43k7C/ikL9p3tXCfB
 tB9PQ9FDsUlOR8aI4mHKjw/uUgha63B+hswYAlZSIw8bi0FI0aaOAos4R5NkShxZebPL
 JH2w==
X-Gm-Message-State: AOAM532RhCqDwrWgFUObMYSjwAISis5XFO1WEqP2mYVH6CjZgSJEIfiE
 O4/MYEj2zqqBlD0S7Ed5g7Q=
X-Google-Smtp-Source: ABdhPJxyqOLquHmdfef3I8zWlT2JV8o6Q8Plfy8AEupDK8yZuT+bcCMdqitS7x/r+KeBRepRufcVtQ==
X-Received: by 2002:a63:9d0f:: with SMTP id i15mr2581489pgd.413.1598710032881; 
 Sat, 29 Aug 2020 07:07:12 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id h193sm2691889pgc.42.2020.08.29.07.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 07:07:12 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm/vkms: add support for gamma_set interface
Date: Sat, 29 Aug 2020 14:06:47 +0000
Message-Id: <20200829140647.7626-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently vkms module doesn't support gamma function for userspace. so igt
subtests in kms_plane(pixel-format-pipe-A-plan) failed for calling
drmModeCrtcSetGamma(). This patch set gamma_set interface in vkms_crtc_funcs for
support gamma function. With initializing crtc, added calls for setting gamma
size. it pass the test after this patch.

Cc: Daniel Vetter<daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..643435fb2ee6 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -160,6 +160,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.get_crc_sources	= vkms_get_crc_sources,
 	.set_crc_source		= vkms_set_crc_source,
 	.verify_crc_source	= vkms_verify_crc_source,
+	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
 };
 
 static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
@@ -275,6 +276,13 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		return ret;
 	}
 
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret) {
+		DRM_ERROR("Failed to set gamma size\n");
+		return ret;
+	}
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
 	spin_lock_init(&vkms_out->lock);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
