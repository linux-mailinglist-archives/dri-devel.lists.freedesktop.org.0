Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF77F055E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C47710E1BC;
	Sun, 19 Nov 2023 10:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C947910E1C0;
 Sun, 19 Nov 2023 10:15:04 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so135156066b.1; 
 Sun, 19 Nov 2023 02:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388903; x=1700993703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=VxNgpcmNAn7eHe0lOWbCl8LRxwNfC8f5bYROqvoKOmtsiukJMxDImHhyhXrhc9NuLD
 gTKT77s5+mQ1MDyspaJNnQqEggAE2vFEL1Niaui1Kx+ZoBYM/SzlFCl/bDN2sytRbtcy
 GiAHzt2KCJhzvuqYGpiRPfjaFwC2m7/4zdz903+6iQYL0j7qrOm6yuqMz243b4vV52a3
 hKA7WgOwmoMK8jQCglTW7zcM+IM7m0n4VVuGXYO9ygJQth/PoRBqc+ayO3fdYN9TEJ/N
 u1EJIXFa47pEtDg9XUoIXLZSz20B24EHLj8iigzRVMKTrfj79F9MWbSvKk2EU4qnONX+
 gQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388903; x=1700993703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
 b=bpwx859zSfVneGwAkI6YZ78aa2bSbc1Pt7JtCNk1rwDK7qGzV78+8TFQJYRP96IuPH
 2yvV/2lpvWepr//6aeKiw7WflnDg2xTGEtUaMzrAPhAzvJHCtzpMvn0HKu9qhBE6vnhv
 +9R6C9qLx5VJCyCyuj6nqxcLJpU6YUhfz4Lpdt8idOZx9HchOxCIzycCar/fIHQsnOMO
 DMrvn1gOoCC5iWvK3bQKfWXBSyVFtkQOcI2iw8GmtFjxBX5kdIbDpjDdFzFc4qNukzMd
 Fw0+Jezb0s9BOvM+RjBX6IV1J+TtPG6RAfGxFUyK5wt/drQvkOSnO5SYOSkr3wywi1CB
 ejpA==
X-Gm-Message-State: AOJu0YxPdzRMdFpiSQzja2kgMcrQ9MTwF+FAb1CO0Xeq027ffJzVN5QQ
 TVjn37eyziwyOgzo1x37u5s=
X-Google-Smtp-Source: AGHT+IHP6byAlqIoVwDbbgjuChf3oN9zUpAvK+yJPawUfgKyxdFFP80iOw8k2baYpP8MVO/1Y6ukEg==
X-Received: by 2002:a17:907:1ca4:b0:9c7:5200:e4f4 with SMTP id
 nb36-20020a1709071ca400b009c75200e4f4mr4905232ejc.41.1700388903204; 
 Sun, 19 Nov 2023 02:15:03 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:02 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 11:14:40 +0100
Message-ID: <20231119101445.4737-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

