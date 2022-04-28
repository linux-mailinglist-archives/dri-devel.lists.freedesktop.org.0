Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB286512E2B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024ED10F53F;
	Thu, 28 Apr 2022 08:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE2610F53F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651134170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R9+SPpuY/53xWbtQcQ19Ca0p6As0qKIDguvyi3xRKuA=;
 b=bwkvI8+G+/8dFrmlm21Ozb/rCmRnjpdEeKYOWTrk2iSsHZbCqZhVsQQfH9DexMEU0QP+rc
 sgdLBtP4s0esBU8PgjjMHiLuioDH7pxcuRutSZsNaKGjSR9BjMx8ojHGx+xtd63CElRAWQ
 BUfsBXt/toZy+cNBIcuc8skt/Yvmh8E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-6VhELRsEMdqPqPLxVopbYQ-1; Thu, 28 Apr 2022 04:22:49 -0400
X-MC-Unique: 6VhELRsEMdqPqPLxVopbYQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 y11-20020a7bc18b000000b0038eac019fc0so1247554wmi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 01:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R9+SPpuY/53xWbtQcQ19Ca0p6As0qKIDguvyi3xRKuA=;
 b=rZ3Ml5wdh8yXn/7QohO4221bn5+5YR1mNmlq5JxQKgmsqUseXOApOMhtB0IyriZHTK
 ElPYCHropzdB9Yn90DMWe2hjZhqJpgh3PmbwyZb3eHgoN2X50x/OOt+VPOyaIhuFQ+/Q
 6ycL/Z3r/cHDcGiXCRc3cXEQVGHrai3kjA59ixpg4tPM7tVt10aYqjAjIn5gUYEdDpde
 6Tyl+JHg2h6WvKGI8Wyn73ug7eUmCfwSziSJoh/NQo/xp6goYBRHkl0dgqkQcoyYhuX9
 dq7AtXQP+L8uvR7KAKs4blQKB8gjrXHAifk38KAVX0TVXH9FymQi6H7xtrB40cr9yp6f
 IPWg==
X-Gm-Message-State: AOAM530qOBpKIxdrskMZ5UNNdd68hMEMKA7SRoPL45QJLJkV+lZViqit
 SOpV6uXjV/7IpkS8FTydoziq74CWDO3eUQ1tthET4tLgTCFKCWfDMpypGymQQN6X/eEYs6ITOpY
 Swb8BDLIQeE1UnI1/8FwusjLd9XLS
X-Received: by 2002:a5d:6085:0:b0:20a:d53f:4b82 with SMTP id
 w5-20020a5d6085000000b0020ad53f4b82mr19218156wrt.179.1651134167702; 
 Thu, 28 Apr 2022 01:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAOxNIujfjjGnE4mnlBE81yQgSXJdlVH3vXVmWZHIbbWYWf867nQI0LV9aNfKV3cxaxvCXtA==
X-Received: by 2002:a5d:6085:0:b0:20a:d53f:4b82 with SMTP id
 w5-20020a5d6085000000b0020ad53f4b82mr19218142wrt.179.1651134167439; 
 Thu, 28 Apr 2022 01:22:47 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm16468356wrf.10.2022.04.28.01.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 01:22:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV and
 DRM_DP_CEC
Date: Thu, 28 Apr 2022 10:22:44 +0200
Message-Id: <20220428082244.390859-1-javierm@redhat.com>
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

Besides making these symbols to select CONFIG_DRM_DISPLAY_DP_HELPER, make
them to depend on DRM_DISPLAY_HELPER, since can't be enabled without it.

Note: It seems this has been an issue for a long time but was made easier
to reproduce after the commit 1e0f66420b13 ("drm/display: Introduce a DRM
display-helper module"). Adding a Fixes: tag just to make sure that this
fix will be picked for stable once the mentioned change also lands there.

Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Also make DRM_DP_AUX_CHARDEV and DRM_DP_CEC depend on DRM_DISPLAY_HELPER
  (Thomas Zimmermann).

Changes in v2:
- Explain better the issue in the change description.
- Only select DRM_DISPLAY_DP_HELPER and not DRM_DISPLAY_HELPER.

 drivers/gpu/drm/display/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index f84f1b0cd23f..1b6e6af37546 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -31,7 +31,8 @@ config DRM_DISPLAY_HDMI_HELPER
 
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
-	depends on DRM
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
@@ -39,7 +40,8 @@ config DRM_DP_AUX_CHARDEV
 
 config DRM_DP_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
-- 
2.35.1

