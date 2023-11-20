Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27A7F1F90
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E910E1BB;
	Mon, 20 Nov 2023 21:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2295510E1B5;
 Mon, 20 Nov 2023 21:46:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40a46ea95f0so22466115e9.2; 
 Mon, 20 Nov 2023 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516790; x=1701121590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=KCV+ty5FKQ2YOgq9Hs/1j7wZr6s7xdYZYl8UBFfR/jtRtlyhPJJWc1kg+RYOFdJvn7
 HlbZfu+1FPbt9ZdzICzpFYXkk9PN2IgpN/S/SAMfJp9rdq1poadnc2d7Q+2XwlvhtxL6
 JvTPHClm14MTjWklHAgHhiNy8AGzhClDncHWtCAgGJ/5Y5fmgLTHq5KW5Z/+lPhAyfgf
 eomcgfX/I1M2oIZ/DBh7mb4B5rDi1kIm1RHhNvndoSOWfGby6Vcnv2pvhmjyGVtznBGZ
 G9RFmi1KiSjIhqeluhfPjO13L5s3EAak83NyD5sSpfPEfmLrqC2kVxD8lqbiJYl0WB8r
 cQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516790; x=1701121590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=kfaR7VjCaq/L/dlhP+6X2tLxdX/xjG0KY98+BAB5ZEegVg4cw+osgvBozteUm7p1dl
 zPdg1qxem+vKjDBM9sqUd3BD2JGbmJLoWm8PROg2H+tM/aWXvy2MalFpiMy1A3dDfbT7
 IJnFAjVmegGy7MC50WaCzhToEh72idR5hqcE2v59OTEUJhpOwlPqaTvje2WFW4NcbdZa
 zQDcEBZpK6gddKp6pYkgBa3zDWpej51MP4Ftu7ykTSZ+ehcGKqJEf/+0j5FqX5b7oUdY
 LZxhBvQcyqXb1L2u0dsB+oUPef+eVVDp3FHRSN9iRpbrY055GCVtex0yXxgmCyIDazs7
 mZIA==
X-Gm-Message-State: AOJu0Yx+tk0uhrMOBd1meNKnCLk4LhcjZa+Sx+2RXEIVtPGPz28OocNH
 mep2T3M8oVKcRgvsnvMap8E=
X-Google-Smtp-Source: AGHT+IGkGQ59cG9edqQvwqmwpMO+1LuO35o+25wMSjuR193ctRjhKyTjuIwWviwx/q0Qr5EuxLxwOQ==
X-Received: by 2002:a5d:62c4:0:b0:332:c648:c646 with SMTP id
 o4-20020a5d62c4000000b00332c648c646mr2880040wrv.53.1700516790376; 
 Mon, 20 Nov 2023 13:46:30 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:30 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v4 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:06 +0100
Message-ID: <20231120214624.9378-4-hkallweit1@gmail.com>
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

