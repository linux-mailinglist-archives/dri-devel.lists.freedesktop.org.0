Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01243512530
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E7910E949;
	Wed, 27 Apr 2022 22:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEC410E949
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 22:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651098123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qr4MU4/s4LvUq27SfddGnKVd9R5tIj+q1sHUP3u3fiM=;
 b=MXWdHpyXpkqjIiAJe/CN4qtCT6NTW+3GCJxnU3KaQh/nNMkHesA49hXXvlvG9mHmDqTpfZ
 7mH6R2QXP9590B7tESO3QMFRDeQ+M68ZLWi0dY+1BHDHjWAzdt76/UJ07MevMF3HXbtzJI
 dSWHukZpWza9M4lwRmuWQenvT4x5lD4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-0OXkY7qcMIqs57e5OHhGNA-1; Wed, 27 Apr 2022 18:22:02 -0400
X-MC-Unique: 0OXkY7qcMIqs57e5OHhGNA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v13-20020adfc5cd000000b0020ad3580cd0so1205176wrg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qr4MU4/s4LvUq27SfddGnKVd9R5tIj+q1sHUP3u3fiM=;
 b=MUiVfVtcmQ9qMktyCbZytrNmmoMPof1Sf0FCUpsBnc9ov4Ba2fMW8EAYNh94f6QSY/
 ptyL0zFyrmYyqLZSR7k3z84p8jpETa9fTjKnyDLDucCF83HUjtt/39t89/7MFUzA78ZK
 DD4IOO81YScZ8X/UAUDQMO+dnjZh+uakoOguNMX2sr7gJYaEhpm3zsjyNlilg2dL4Z1u
 LBTpsHl6/FkrfKSt7dRBbAG3Ssi8DMz15mckG82wunwmgQ/GJ7pcyjSB2WWZT97vu8GA
 48PJgQLgidEBcyy03nyJzUlgCoKzzDxgWvqTGkAWUycyNaqYy9Fa4JklJqIYIsbggnrC
 ngyA==
X-Gm-Message-State: AOAM531WVWYWpkMcLwXE7rro6PKd5MJsRwodlqw9K7z+KcsZdp1wHJ8a
 iE3j7TVwDMdSSkO8RKilfyFzR8U+h5JCKhY918FQdbgSKDRvCHMKn35PWslLWLEAZDI5xeDG8py
 b44lGKz/KaVDiWvmIQUSlwsPdg3LR
X-Received: by 2002:adf:f710:0:b0:20a:e189:9983 with SMTP id
 r16-20020adff710000000b0020ae1899983mr9956893wrp.24.1651098121485; 
 Wed, 27 Apr 2022 15:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRP5NVvfVLFQtoQbpfc/PozRMwNi4jv7Z/n1MdceTR2qQBqzUinnuR5+PQZQaDcs93GP369A==
X-Received: by 2002:adf:ef01:0:b0:20a:8068:ca5e with SMTP id
 e1-20020adfef01000000b0020a8068ca5emr23634532wro.661.1651096541322; 
 Wed, 27 Apr 2022 14:55:41 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0020a8781be70sm14377139wrr.12.2022.04.27.14.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:55:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV and
 DRM_DP_CEC
Date: Wed, 27 Apr 2022 23:55:28 +0200
Message-Id: <20220427215528.237861-1-javierm@redhat.com>
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

The DRM_DP_AUX_CHARDEV and DRM_DP_CEC Kconfig symbols enable code that use
DP helper functions, that are only present if CONFIG_DRM_DISPLAY_DP_HELPER
is also enabled.

But these don't select the DRM_DISPLAY_DP_HELPER symbol, meaning that it
is possible to enable any of them without CONFIG_DRM_DISPLAY_DP_HELPER.

That will lead to the following linking errors with the mentioned config:

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

Changes in v2:
- Explain better the issue in the change description.
- Only select DRM_DISPLAY_DP_HELPER and not DRM_DISPLAY_HELPER.

 drivers/gpu/drm/display/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index f84f1b0cd23f..9fe80c4e555c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -32,6 +32,7 @@ config DRM_DISPLAY_HDMI_HELPER
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
@@ -40,6 +41,7 @@ config DRM_DP_AUX_CHARDEV
 config DRM_DP_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	depends on DRM
+	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
-- 
2.35.1

