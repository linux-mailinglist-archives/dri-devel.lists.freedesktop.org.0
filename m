Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C307F5B59
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E53210E6FB;
	Thu, 23 Nov 2023 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9010E700;
 Thu, 23 Nov 2023 09:40:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a02ba1f500fso90860366b.0; 
 Thu, 23 Nov 2023 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732458; x=1701337258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rr795psFWS5/sYRWa84NPLDqDZJaWExrkcgD8My4bAU=;
 b=WhdyxvCeNEmrCBJD04s22vIYKeVuIquJFnjvXik/tiYDm+uTSSCXzqI6gyDBdX249g
 y2zF8R5P6g9vri52JX+gQKCeoUmtDi0ci2lIZ2UNkjYzCCO5JNp0YfVIhcNAgzQjlUf1
 G+x27yanD9x4ls2JsaTixx15OdwbFRF+brWduezn0K9ZNwrFv5VJ0RI09yJh33343Jya
 e60hj8J61mQZhLTyXl4cOLBGk2juQHvfW6Ai9zRRTGkuont9P/K9LD91sym84fvC5fAp
 FpfR6o72+ZvafhFlM6V9MPyYZ3KvZvg80hv1cTehOkHCq30RFHZZmfSkQr7RoQAx77+P
 N2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732458; x=1701337258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rr795psFWS5/sYRWa84NPLDqDZJaWExrkcgD8My4bAU=;
 b=iQ3cXTXUxdB+b/dvsfWBqrxtfUyiOQUKiBs6s1TT8qShYCXjhBEEFD7ZIaDYGNmD+b
 BavKiunXRzVqJus4ZjnPamuCZdDvUhaGlGj6ev/WRxMowXg30qGPvxxjW9FaOMrSae5y
 uwNsR8rk+gjT8nN52MQr8Ep5bkHeyGfgYsjQoCgrHawadGMfESovTWjRonnktBJJzN56
 WIHwtltEOmsMzV37CSsfq35yLfjYSlxQYFDnllki3tmAZV68tESRwKzFl3iyW07mfRUS
 MMDhZKakACdElpTuIR+uIU+9MhDxL0MTw9AArtTlAEAqUmXA7HECe1KV8r1qDPckdq7n
 GCTg==
X-Gm-Message-State: AOJu0YxyrZ0mNb2Pi8kqP9bwjAFp4W7NRxpBA13KtFZsfKhPzSm5UJVZ
 WZMIzmdrTqqjQt9U2TyNe1I=
X-Google-Smtp-Source: AGHT+IEG/JB/o9MucSUuFgW0Hx/NQMaV9GLQLv3jnO/TXJE6jD5ckNqjKF0YzoqBA/n4IjpIuJ4Oqw==
X-Received: by 2002:a17:906:4ed2:b0:9fa:a075:c329 with SMTP id
 i18-20020a1709064ed200b009faa075c329mr3506046ejv.61.1700732457677; 
 Thu, 23 Nov 2023 01:40:57 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:57 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v5 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Date: Thu, 23 Nov 2023 10:40:35 +0100
Message-ID: <20231123094040.592-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

