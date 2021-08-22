Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4A3F4223
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5250289E52;
	Sun, 22 Aug 2021 22:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E2689F0A;
 Sun, 22 Aug 2021 22:20:57 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so21501707otc.4; 
 Sun, 22 Aug 2021 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGFh1ocE7GYNytaK9ZVTk/INwYTyxPotKB7s3KrmExE=;
 b=JPWE+YmgJlBbdQhhKNkRpvMJ0ojOSmUS9FePAMQGlTfPDjeNpo3zhNdxkBSWX6yeXZ
 f8w8Drri6PMkZN9qsTYerEzg53OkH4cb+sQrQ+xriq3D/Q8ZyXZni+YxRuhAWY5nK6Bb
 YM3F8KR1vJ0RB0kifp57wduOe3YgOmHIvr5cfMv/baXSDDHujQhLdqWI3ZDaTNhrJ88x
 Bo/RD1WgWLkk16UJCzFa2M036CAH3EgtskC9fyVTvGhcvxYbE0XdJBBIBurWLdIPFiRF
 oIIDrqlIspA9tI+iZN7QtN+knEbbmggtkHfLFI9apQBhV6WTlZK5xn3E74VPhi5s3JJv
 MVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RGFh1ocE7GYNytaK9ZVTk/INwYTyxPotKB7s3KrmExE=;
 b=pMB73+VSxG21vqOm5u/HsL0hsXKjguYxeuN+AV76mAPmTcw8rxsTVw15MOACQYtYEv
 vAHaCYeK0yOBzrzLzJvbl09Vp637fv2AoJGNI2HeD8QgbSRzX0MyEEA2jNnSbmgN3e+y
 FPcOuIEOw8E9+zCwDzL/k/dIgzL0rniTRyF/t3LBZXnocABUWWnWyNrLb1lVr8AN5OU3
 V3bxmLbHvr/jP/7b9mYMjuV6Dc6yT1vnkPj9vc3CiTdN+MeyIKS/up80NkTx6MKe+rgK
 76eO1fgpayTsQkk/659NqXoC1eVFyZe214JNYgMlLVb7Kn1l0zIlbbjL2djT6OWr7hHS
 thLg==
X-Gm-Message-State: AOAM531TjZnJJgk7ohOE1lUFeVoVsdhmsIE2ob51XrkAD3+AVdHf3ZIM
 pjjyx/L2+kguIIYLcqeuxBE=
X-Google-Smtp-Source: ABdhPJx+yWcZ3I+WyB6O09Vf/MP/6Q/RWo3l1z8RmQISKj4KBmaNhmIqVPxxO7TcXUeuhViA5nMR6w==
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr9403654oiw.98.1629670856722; 
 Sun, 22 Aug 2021 15:20:56 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 09/11] nouveau: fold multiple DRM_DEBUG_DRIVERs together
Date: Sun, 22 Aug 2021 16:20:07 -0600
Message-Id: <20210822222009.2035788-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

With DRM_USE_DYNAMIC_DEBUG, each callsite record requires 56 bytes.
We can combine 12 into one here and save ~620 bytes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 36 +++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a616cf4573b8..58693e40b447 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1246,19 +1246,29 @@ nouveau_drm_pci_table[] = {
 
 static void nouveau_display_options(void)
 {
-	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n");
-
-	DRM_DEBUG_DRIVER("... tv_disable   : %d\n", nouveau_tv_disable);
-	DRM_DEBUG_DRIVER("... ignorelid    : %d\n", nouveau_ignorelid);
-	DRM_DEBUG_DRIVER("... duallink     : %d\n", nouveau_duallink);
-	DRM_DEBUG_DRIVER("... nofbaccel    : %d\n", nouveau_nofbaccel);
-	DRM_DEBUG_DRIVER("... config       : %s\n", nouveau_config);
-	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
-	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
-	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
-	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
-	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
-	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
+	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n"
+			 "... tv_disable   : %d\n"
+			 "... ignorelid    : %d\n"
+			 "... duallink     : %d\n"
+			 "... nofbaccel    : %d\n"
+			 "... config       : %s\n"
+			 "... debug        : %s\n"
+			 "... noaccel      : %d\n"
+			 "... modeset      : %d\n"
+			 "... runpm        : %d\n"
+			 "... vram_pushbuf : %d\n"
+			 "... hdmimhz      : %d\n"
+			 , nouveau_tv_disable
+			 , nouveau_ignorelid
+			 , nouveau_duallink
+			 , nouveau_nofbaccel
+			 , nouveau_config
+			 , nouveau_debug
+			 , nouveau_noaccel
+			 , nouveau_modeset
+			 , nouveau_runtime_pm
+			 , nouveau_vram_pushbuf
+			 , nouveau_hdmimhz);
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
-- 
2.31.1

