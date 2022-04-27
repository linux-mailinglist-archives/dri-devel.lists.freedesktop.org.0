Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B115123D8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333BD10E731;
	Wed, 27 Apr 2022 20:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72410E731
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651091120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DWkcC1Mw2kGsDS6+CAaSOc7PdrzllYlAOUnL4kSDScE=;
 b=SoE+dJm7XrJ6gwVL6PeczFs/jDge0rx9S+Fmpmq4D8cCZ74A8xhBvCmAc/3gVnycw+6+ys
 Tbc0+d3K2pKYyWzwb/V5vP8flvBtRc3IywOHtuEyQygUOdRwEvMj1SawgQ9MnYcOSnNN2+
 ++0q2hjUorZrLoXv1tT+XAW9MaEHFMA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-8blgKb3oNtSd-cMHnteVvg-1; Wed, 27 Apr 2022 16:25:19 -0400
X-MC-Unique: 8blgKb3oNtSd-cMHnteVvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so3294096wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWkcC1Mw2kGsDS6+CAaSOc7PdrzllYlAOUnL4kSDScE=;
 b=xtYAB40qswQhCGfMjrOlbCTuijiNb6rLisYuXM0zCVGbq3bJCL4ZuTqesg6+R16GEZ
 /EQbLlkH1Tp+UKk0NNOhUxIbgxB5TyW+u8jJgJdr7OXWDLjXynPeUC4RgWbsQJMsqzp5
 hb+tNair0qvhf2Ns8Qy1Xm4KdJ9DDeN4j6kY8M7u8IWFFcvJGk8FD8v8A25MB3GES8uf
 afJai/l64VxC19JdJ0AmpDltC3LvhlbM8npwaIBJAwofqhGRWeXKAbY9RJjtANxP7ja6
 snOlSRL9M0umV95GozTVrfyykcj7LhMLQHjDLgKYHaLeyKhMChF+p4kWBKoGu9+ukmHp
 v7/A==
X-Gm-Message-State: AOAM533727/U/AWz2zPvJwDaH+y7klPv+WsOEMQ0Jfr/GhTbeuj6JQ0S
 nEcZ3xbyXlJ43pIQhed/slkA7/lkjsdK42P+Fu6tXgYx/4flcdZgDSbpdzz0Zaf18XvEL60WLgz
 6VU5PPh+6FdtmQOwZhR6S46mz/vhx
X-Received: by 2002:a05:6000:178f:b0:20a:8009:7cd3 with SMTP id
 e15-20020a056000178f00b0020a80097cd3mr23927698wrg.532.1651091118305; 
 Wed, 27 Apr 2022 13:25:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeyUQBNyusRg7cR3OhmiRejZFOBGxuVFHcl4pM81Q6ah77SVWgTi13DCfSIVex/7kUiivQwQ==
X-Received: by 2002:a05:6000:178f:b0:20a:8009:7cd3 with SMTP id
 e15-20020a056000178f00b0020a80097cd3mr23927684wrg.532.1651091118025; 
 Wed, 27 Apr 2022 13:25:18 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0020aa790a258sm15147634wra.8.2022.04.27.13.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:25:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/display: Select DP helpers for DRM_DP_AUX_CHARDEV and
 DRM_DP_CEC
Date: Wed, 27 Apr 2022 22:25:13 +0200
Message-Id: <20220427202513.46996-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_DP_AUX_CHARDEV and DRM_DP_CEC boolean Kconfig symbols enable code
that use DP helper functions, exported by the display-helper module.

But these don't select the DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_HELPER
symbols, to make sure that the functions used will be present. This leads
to the following linking errors if CONFIG_DRM_DISPLAY_HELPER is set to m:

  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
  SYSMAP  System.map
  SORTTAB vmlinux
  OBJCOPY arch/arm64/boot/Image
  MODPOST modules-only.symvers
ERROR: modpost: "drm_dp_dpcd_write" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
ERROR: modpost: "drm_dp_read_desc" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
ERROR: modpost: "drm_dp_dpcd_read" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
make[1]: *** Deleting file 'modules-only.symvers'
make: *** [Makefile:1749: modules] Error 2

Note: It seems this has been an issue for a long time but was made easier
to reproduce after the commit 1e0f66420b13 ("drm/display: Introduce a DRM
display-helper module"). Adding a Fixes: tag just to make sure that this
fix will be picked for stable once the mentioned change also lands there.

Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/display/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index f84f1b0cd23f..d7a413a2c6cc 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -32,6 +32,8 @@ config DRM_DISPLAY_HDMI_HELPER
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
@@ -40,6 +42,8 @@ config DRM_DP_AUX_CHARDEV
 config DRM_DP_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	depends on DRM
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
-- 
2.35.1

