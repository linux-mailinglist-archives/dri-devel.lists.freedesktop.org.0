Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F97F0172
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BAE10E338;
	Sat, 18 Nov 2023 17:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4814510E336;
 Sat, 18 Nov 2023 17:42:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c87acba73bso1396411fa.1; 
 Sat, 18 Nov 2023 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329349; x=1700934149; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=NS+YbM7ysVb7lWQSSsU/b0b1kEbXeOdCjkLG8JC1xquBVzJZRnE2Uz6SIqbYeIss2E
 kcAQX6GginkvltkmDvaC7WBfmxtcnOJbBNG1V5h18hWeVvUvJv6i8HxlGyWssQcjcaS9
 LBQEUWBmt0LTfLUG0PmpPJML4BQiikj4IHrF2JT1p0dzxfIWWHztK9AT3Hv9YkF9d37i
 n1hpLHIPcRhW14DruuzrmNn82ivzX7K5VE98JoTPkIgPw8sZKZETZsfJk37Y0jh+2FQq
 hMS6AfNQa6yfMBGRIBoZq8ueEE3V7ZhLnNgNdIEGuF2sEnn9alrBUVydcWSfEhALSZ+E
 XPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329349; x=1700934149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=vCcmi1LwKAcarUYb7bo1OKsMd59L1tx5bqxj9xq9As+9ZQNCvPHk25YlzL/XZpJuLc
 4IU1wJN6M+arPa1ZRRkFZIvNf559YTaJ9voD5FnAic5UNF6wI74+6naW7ZqSWs/k0tgV
 n6owD2LW/6zDVzWWycsKA2XJ8Zjb30ZM8SmlNr2tVB0asrXO591U04/VXmK3adIrDAfb
 Bdb4xba5sKrE9jZC1SFnii3S6p8BtDEjq8sN+er17MSqFpRjVRSr0NoTxzwckbzcjpwv
 61kkyskH+SFy73aVaaLjLa4jfjbtPt2jbG5acsa5o32jI6lv589BLKK1GqSNzKV5QK6K
 QvwQ==
X-Gm-Message-State: AOJu0YxMUyyhSd0NMEk3XsHoQfVW1krDK77XlWzkl6lJYJAQeYA/LfnB
 xhNrdHSXuH/iUzOaLgRpDH0=
X-Google-Smtp-Source: AGHT+IHnFgNWvQQzwc0XOhpUWTcrcN2j6CYFonTN+gof5Zy5XsRr775SK97ByQAzYdXjmLv3xio01A==
X-Received: by 2002:a2e:82cc:0:b0:2c8:3254:bde5 with SMTP id
 n12-20020a2e82cc000000b002c83254bde5mr1493466ljh.50.1700329348922; 
 Sat, 18 Nov 2023 09:42:28 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:28 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v2 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:03 +0100
Message-ID: <20231118174221.851-4-hkallweit1@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
v2:
- adjust tag in commit subject
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f99f6754..ae1edc6ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
 	if (!i2c)
 		return NULL;
 	i2c->base.owner = THIS_MODULE;
-	i2c->base.class = I2C_CLASS_DDC;
 	i2c->base.dev.parent = &adev->pdev->dev;
 	i2c->base.algo = &amdgpu_dm_i2c_algo;
 	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);

