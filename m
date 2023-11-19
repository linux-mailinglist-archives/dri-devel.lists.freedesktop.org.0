Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB197F05D0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6F10E1E6;
	Sun, 19 Nov 2023 11:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859BF10E1E2;
 Sun, 19 Nov 2023 11:28:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d216597f64so465832266b.3; 
 Sun, 19 Nov 2023 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393323; x=1700998123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=DU3Poux8VJSwHrI0VFEtnfCwmZlZau01PNZ2Q1F2TZ4OzNQz8sYCsfTFCMQJ0rROCT
 StzQ6OuThx7oAEVqYfuFfCT43pDruW/5XNw+gzgbsqqU3JO19EmmcsSTgvlEDwWhmmss
 lU5i/IUJyYoEIxIIOKlY0Hok/L9s7XroP69WDIzozYZ+YHQEM0NF0tsX2TwOCJmXYMIX
 ZEYtGrdLvlEr49xN/8s/RY+k+PMY1WTYzZH3JMz+IuuGGYsjgm6boxuUkjxw4LSVurZH
 H+84lUmn1Hg2P/e7FnZHyKjMOKBByppAcWOgSPBfDGJgqg1eZTpqgMoV1Y3li1AW3O72
 g6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393323; x=1700998123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=BeRxGYPBFTZejiyS/r1GXf2c6yGczAMM22634DuDni8Y/vqKwCdgf6k2rXZO+n9pYI
 inygkkuvm6+NvrzH5mWh0zVoO+BV43osYy7USELfQH+/Bnf6PaspjeZKPKSe3r8t34as
 WxQ15qqczzu8ibvRv3qvwQTLTI7oaM3gsPJm49ba/xmPe3l1P6ScO/YhI5KxBYaTu2XE
 qxrI3V3elrGYcCNC4UDRlqW9oqK8lfXmcTlrYksD6Ex8l2MKO+1HN/CF4o5Bz0GV9tnr
 Ke6VgnGyNPP4IwV6H7O2bKN5lXxsVvJpGtO4r6gY/z+TGrb41cuwbBIxxE117t3vXG7b
 SgdA==
X-Gm-Message-State: AOJu0YxUO9H2nMEPW9r5xPyB45/rhe9IiO2HMXA4nDTEcHj4yJlBH1Ur
 m9CTdkOhuaMv52jHESNCoRw=
X-Google-Smtp-Source: AGHT+IF98s8aEn0w1sgMJYs8s2hcKMxZPSkooSx15XAU5tgESM/m3QK98+ws4NtnHf+xbrajq9DL3g==
X-Received: by 2002:a17:906:1859:b0:9e8:2c4d:40d4 with SMTP id
 w25-20020a170906185900b009e82c4d40d4mr4394226eje.30.1700393322803; 
 Sun, 19 Nov 2023 03:28:42 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:42 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 12:28:20 +0100
Message-ID: <20231119112826.5115-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 40d7b6f3f..e9e4dcf34 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
 		}
 
 		bus->adapter.owner = THIS_MODULE;
-		bus->adapter.class = I2C_CLASS_DDC;
 		snprintf(bus->adapter.name,
 			 sizeof(bus->adapter.name),
 			 "i915 gmbus %s", gmbus_pin->name);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index a636f42ce..5e64d1baf 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
 	ddc->ddc_bus = ddc_bus;
 
 	ddc->ddc.owner = THIS_MODULE;
-	ddc->ddc.class = I2C_CLASS_DDC;
 	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
 		 port_name(sdvo->base.port), ddc_bus);
 	ddc->ddc.dev.parent = &pdev->dev;

