Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420939BC39
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 17:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457E6E223;
	Fri,  4 Jun 2021 15:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025A6E108;
 Fri,  4 Jun 2021 15:49:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4489330wmc.1; 
 Fri, 04 Jun 2021 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Lds9gCzJwmMKr7vdvMacl9HXd9kFnM3fe++EpLc6XI=;
 b=Hb80MpfOc48FLtbkirFjbEeHKIL92v34ZABsiS1LKXskELp+cbV4SnZctXC1pYQFMv
 PPahz53BgO3B8SOX95O2xCs2EsnxxkmG77fM83vPaf3hISzo2jVh3jHNYCdskCRlQLBx
 YFho2iwtTwqrSmQGBofgEEC85Oylz7FvUzL2gy8aHm/1RqLJ6yZuL6Inas3lmNu9+51S
 vmkf7mzXutogHdltk/zkNlqMR1+pEVr6YXqllmzqdddtAAIQFqAPp4ESQzTiAkTkrytW
 B1rVndOCiWAbQbeL+5fsFdfumhgcRvXvtv25o3/eclON6TAC327dH7fTKtizmh9QMA8v
 ETfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Lds9gCzJwmMKr7vdvMacl9HXd9kFnM3fe++EpLc6XI=;
 b=TTlLvojWAFUgMUmgNU7GGriMPxjFk14a44GEj3dL8BSYRK8dBHbf9n7Jz3L1LwV1k6
 vlEeMo7qknQTjB437UAXHRRJnsL6FGI+aksWVtPDCIc7IRhecroExE+305HAEeXjpeoM
 fse0ts7iVCT/+HrokTHrq5wTVI9tedRGM//+DYqgzhR7rev6cw96Y3h+mG/AgFb2poZ/
 7BNmWFS2FisxeeStnXfLcVWkatopBV6E+T6vNk0pTIQ2NTyXrry4ej9SmhF00HR0upGP
 NAmoRJJqKJmqlBQSNeYcGhkXsas8c2gsstG8TViJPEDC7xM/3gOd9ksmBHjlY3CDl3ox
 P8ZA==
X-Gm-Message-State: AOAM532ByFi3oCUrcFQtWjBy25srk1EjSgY0IaHGibsEkoaWAiwJ75xU
 TVW06+vRvCkrQCfjykYH5iE=
X-Google-Smtp-Source: ABdhPJzaOYoCYA6fUg6Ei9tUTrEb0T4E+kCm+gsuurm0f2hxSqdutq+dX9WdDmPOKBTIyAj2E4Ktyw==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr4314530wmf.121.1622821754549; 
 Fri, 04 Jun 2021 08:49:14 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id n6sm5797743wmq.34.2021.06.04.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:49:13 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915: apply WaEnableVGAAccessThroughIOPort as needed
Date: Fri,  4 Jun 2021 16:49:05 +0100
Message-Id: <20210604154905.660142-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Currently as the workaround is applied the screen flickers. As a result
we do not achieve seamless boot experience.

Avoiding the issue in the common use-case might be hard, although we can
resolve it for dual GPU setups - when the "other" GPU is primary and/or
outputs are connected to it.

With this I was able to get seamless experience on my Intel/Nvidia box,
running systemd-boot and sddm/Xorg. Note that the i915 driver is within
initrd while the Nvidia one is not.

Without this patch, the splash presented by systemd-boot (UEFI BGRT) is
torn down as the code-path kicks in, leaving the monitor blank until the
login manager starts.

Same issue were reported with plymouth/grub, although personally I
wasn't able to get them to behave on my setup.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---

Supersedes
https://lore.kernel.org/dri-devel/20210516171432.1734268-1-emil.l.velikov@gmail.com/

Ville, others,

Patch is based against drm-intel/drm-intel-next and will apply cleanly
against drm-intel/drm-intel-fixes.

If possible, can one of the i915 maintainers apply it to the latter?

Thanks
Emil
---
 drivers/gpu/drm/i915/display/intel_vga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index be333699c515..7beef1206097 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_priv)
 	i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
 	u8 sr1;
 
+	if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
+		return;
+
 	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
 	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
 	outb(SR01, VGA_SR_INDEX);
-- 
2.31.1

