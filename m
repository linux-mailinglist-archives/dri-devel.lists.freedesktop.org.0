Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B507F0196
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2890C10E349;
	Sat, 18 Nov 2023 17:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2DD10E343;
 Sat, 18 Nov 2023 17:42:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so5026955e9.1; 
 Sat, 18 Nov 2023 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329361; x=1700934161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=Dirh13s/Cu5eOmg4N83HyvozfVdybFAm3SXUMuWDNF7SuwNsSvb9kKt4dpVZQpQ832
 ymLCURjToNzdKZfdj9U9HYoBNoe2BDLalDACSR8xUp9PlKE5c54okflhchv+BH4sm76Z
 GkvopiSCe+pT+Y9hqdmJvYCKaVPeu+Th/0qPMu/XKPmLNb6qaFaClT7leLctX+WawQmq
 VNF9koxNQbnltfVGGaBBKZ9Ovvk1jtzQFSnx4UX0urmR7heWQ4r6YEHmdqixxMi2FvhS
 r8TFV6RfG1j4w+07C2EqVV8jBfSxNCxgT+VulIGEyvzXjJlxN865GCgi4xtOIyrbTK6w
 dc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329361; x=1700934161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=UcDjQDu6/4yPs0AdK2Wn0NMj6eyrQfWV7IIaqMHbJUNfe2eRRsnDpbhzxOu3dRiDz9
 tELn+3NJLPueOwld4FKWh8NlWVa63xdPogFh5TrgOni3sl5jSV5SOS/kHK4lTFzu8+me
 h2hBiqAp7/8R8J4bqE4QEljTR2aPGmAb+QBntpUwDgLG7Wx2PN218AXSt6jgs78jHyJx
 dRs5quyHv/uuSKwO2AsTXBQBufv7bs66fNRSp2chNg7Nn/NSdKuPfLHBau69dBA26bcM
 Je+IZytrFoN+WZZPAWB2k57hFqKF6t4tjpGxu7yFXjRrcAkHOAxBjU19Kc2anpF1+cmK
 4nTQ==
X-Gm-Message-State: AOJu0Yy4l9roclBFWotANZF26QB4iB53ZQnQ49Yog11pRfosfkJso5Wo
 B87QHYLJu1MQrnPRT9/lTi8=
X-Google-Smtp-Source: AGHT+IEkxDeGvExBagSpF2r2LyZYIYynbcTphCNzYg+c+I50dSmhTAOksLkHYQ3bRD9pqUIHOvui6Q==
X-Received: by 2002:a05:600c:35d6:b0:405:95ae:4a94 with SMTP id
 r22-20020a05600c35d600b0040595ae4a94mr2254158wmq.5.1700329360770; 
 Sat, 18 Nov 2023 09:42:40 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:40 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Date: Sat, 18 Nov 2023 18:42:15 +0100
Message-ID: <20231118174221.851-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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

