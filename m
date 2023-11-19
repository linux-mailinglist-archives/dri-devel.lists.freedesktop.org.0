Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3667F053D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BE910E19C;
	Sun, 19 Nov 2023 10:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0689310E19D;
 Sun, 19 Nov 2023 10:14:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so460390466b.2; 
 Sun, 19 Nov 2023 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388892; x=1700993692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=Z0ToENAqsQLAQbCbW8QFiK4QslmA4LffzE+nlBDuU/sQmDO9/O1KLN5kjRDSoSwm3y
 E+Pg3pVohT7A8XNCq8FysFXmEdI/j6V5NbQcj2Avq+CB/MATJ3rfCpw0txEsoYaQLEwK
 B2BFWJ7VjfXNdp0Xgb4ylu7I7vfoVqQqtEBN3x7Cs3rUJFyr3yAk1zTpoj+hbdFhUDsR
 Xd6yGTDxp3jWfjMwXD5Yiw+nZ29WvSDWNslAwcOG/fSc3lLWe6QeVcQ0tsnqoiROaWMW
 CG6eIK8LcsK18RsTDe33qmkH5qiJJUrKk1sqB6wZviFWOFXb3kRTlosLIrKMNNdG184k
 3rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388892; x=1700993692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=rw0VA/u406Fd3CshmIQIHWFeDVN2CDia4Dlcn/NPzoL5YfwNuEC1gNkeT2jdxL5adu
 cYrR7Y1tj2Gg1LtAu1YPuXgX/etpykFa29JYqRmjRO12ADeXfHLdNoBhDQKcTDtXdFoQ
 KvFMFNkh2iNGhhej4l0ajMC/AyfRhXgNqgCMnk+L1n/q6e6E0nP5X1LCV8ACnBHAvxC+
 zpKTPihleCB+8HetTpZv6rKfSBwpItekNZnmzLzlkEx/fqaJpCKRpoI1crgluf817h3c
 B11ilBV7WFhgjOn+gTsXnj2R/retU4mRWveDOODrQ1Iiyu0LUOyKUnWOpdWNDenoZmcJ
 IKMw==
X-Gm-Message-State: AOJu0YydgS1h7i1mwJFWruM5wGCZY59MmJEWGTI4jUGmdQSyid8WB58B
 tHm1n5Ex/6muiDLCKdb737HMfAJXZoo72Q==
X-Google-Smtp-Source: AGHT+IHpCHj1EcCfnxWb2sNRSzs45S3cm1uALa2nvx3KgSG12OobKbSms5AW5GyKzojkEb4lxF1FVw==
X-Received: by 2002:a17:907:c018:b0:9bd:bbc1:1c5f with SMTP id
 ss24-20020a170907c01800b009bdbbc11c5fmr3589189ejc.35.1700388892263; 
 Sun, 19 Nov 2023 02:14:52 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:51 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:28 +0100
Message-ID: <20231119101445.4737-4-hkallweit1@gmail.com>
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

