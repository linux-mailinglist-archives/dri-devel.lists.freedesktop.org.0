Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D57F1FA0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EEF10E1FB;
	Mon, 20 Nov 2023 21:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9FB10E1EA;
 Mon, 20 Nov 2023 21:46:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so3793642f8f.0; 
 Mon, 20 Nov 2023 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516801; x=1701121601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=ftJU3xlmKd+/dCyQa3geV3tioPxXtjhY873yhc0O5faglDmKZ776dHSOZeGxF3O4ph
 X9SLs8124MxNt5ZYdoFTIJXM2oX7wMrjZ/aMGYLYNkkTh5/MVXukFp45QKwzFQ/hHvL9
 c3M4qeMnlBlSWzxgSPeMqwrABJjGl5o4jI8fIK7aDB3GoJJyyB9Zo9zZ2BV5wQ2HclF7
 ygEgilxeUsFKYiw8BRbLzNXUfq2c/FtKHAg2NTN/Jkbx3u+MUujVkc5gGDyY5WMvz7vk
 DNOV8TfquQW35L91Ei4OHQfYgpYmvXQ+7/Ywo2/3Z8ks2ijFkwp7joyOU9wmvVbFkwdG
 GiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516801; x=1701121601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=NlzeSawDxcT9BCoFy8/paJ0JGws6Ao2/XZThBKDdoFHp8G+ipFyGYdCBXpePSxwrtJ
 /lw0ISF1VBbvkzyUv7qSpzS7SZ0ZEcBNjJSNeuR/l4cfIqJ24Nk+ku+LSn5CXahH1pnf
 ud7RZ8NoJWPaxvxfwZVStWQDdQV8ShqdzAhv9MZnQzM3FtVSpH2vUK+3UO+VBYUZBn8T
 glbWamJwo0ebKtGfXw00TKSpO6aTsmrSotFpsxUMs/L0GF8vjhf5QNlBFCsrtYglmhm9
 X4zhRJuqW/+wbuKoyMvgLHOk10mZPI2wAMkNLiX9/6VIiBiToZV1/HIbxgtHC8XsnNci
 Bx0w==
X-Gm-Message-State: AOJu0Yyy7czctxOOmfaNk1f6T6mIVsGV44aQO1wBDoY+5Ado2kTWrrQB
 +u3HChWAeA7PyWU6AZzePAs=
X-Google-Smtp-Source: AGHT+IH3/XFzq2U/6agtXbj1oqhLy7Jth3QoBz9Hz0FwIflN3vy7qQTcPG492HCCqk1aqFe8zNZYvA==
X-Received: by 2002:a5d:6d87:0:b0:332:c49d:28f6 with SMTP id
 l7-20020a5d6d87000000b00332c49d28f6mr3843056wrs.13.1700516801468; 
 Mon, 20 Nov 2023 13:46:41 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:41 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Date: Mon, 20 Nov 2023 22:46:18 +0100
Message-ID: <20231120214624.9378-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

