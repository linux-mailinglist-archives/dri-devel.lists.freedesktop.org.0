Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A647F05B9
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2CD10E1D3;
	Sun, 19 Nov 2023 11:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0410E1D1;
 Sun, 19 Nov 2023 11:28:37 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so4657524a12.2; 
 Sun, 19 Nov 2023 03:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393316; x=1700998116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
 b=XkiULVtf20Bn3eEyr64K7RWOsJwqsL83pqESsvQSgf7xOdfuYctByVdBsO3Jy4Nxc0
 YxC9fkmHQp5cx0b6MPXssdxtgJwUfRqNN65Gy0ozH6XL1h4tfdSUgN3chE7wagXhpABS
 WRmh2k1ivYnN05MF2TNzqnLvbxm+UIV4koLnm00d8wxXaqS7tY1hcsRMhv6e1PFeVZIq
 XM7IdMR28dKKo1rzNuoCCkYvJ/K4c3Am2pM5XqAEbaRClk8bWoU4XVkH5dTMN9m/isZN
 XleBNbdIHTYE9sKRbVIohq9yfw+oj6+p+p4uY6qdem0osw60IPiTQYizdL31D1C8+mVl
 I5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393316; x=1700998116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
 b=uz4sSJzh51MYNo4mmpOZO81pcrdlVY2f2DFHEnOtgNq+2Vny/Bl36JmOWDkhGjCocR
 FEFX1W67Oy+s38MJ38GzHqg1Xx7JFLDsvv5Kx3EDtBnXwnl7O5l61nc87CPmZO3hqjtr
 A6NxA9I+boGYi3Tex3l1nbkJReBFecmTmn/FkfDuoPnnDdUUBiNbMplti0tcOEznACDM
 ru0lXHV0Euz1JQXOV+KgcNqOi9AfpSFicGIBr/IUkFkyyIOXwHEQ2RUq7AvoOdPbC+9u
 hxARXPjO+EpYBD9ZzPcTrRjlhkUwxGEq8ZH4bpbWmGUmMODiMBctDs41+ZwQluwn6RbP
 66ww==
X-Gm-Message-State: AOJu0Yy0i13jhrcD5yG1/trDrIXs97KhCNap/PPdCkHW9PeCphjhuOnC
 4j6ZS3n5Ds9WXY6mrI9IQDc=
X-Google-Smtp-Source: AGHT+IHI2Q6G5KgXpMdvYcK+AMXMsl9sksekFidT3A1JwDhyvE5DtqVUCJVruR3PsUB6x6IR6xT6Zg==
X-Received: by 2002:a17:906:74cb:b0:9fa:783b:c197 with SMTP id
 z11-20020a17090674cb00b009fa783bc197mr2843048ejl.13.1700393315790; 
 Sun, 19 Nov 2023 03:28:35 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:35 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v3 07/20] drivers/gpu/drm: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:12 +0100
Message-ID: <20231119112826.5115-8-hkallweit1@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-i2c@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c     |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 82608df43..d79cb13e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -175,7 +175,6 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 314d066e6..3d174390a 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -918,7 +918,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);

