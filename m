Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DDA7F05AC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C710E1CF;
	Sun, 19 Nov 2023 11:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30A10E1CF;
 Sun, 19 Nov 2023 11:28:33 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso477329566b.0; 
 Sun, 19 Nov 2023 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393312; x=1700998112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=hgTISipO1I0B/8TC7A4rgIxsAbbgVofohpkPQVuGv6uDmzT1xOG8ZYDo68eS7GLlM/
 EIyFsw+XT6xdLlaXGBrUAzK+McKKiexigNcGBilqykVSgtXdUVZsg4W+QxG/89yBrTkE
 bAJbFfO6W2t5tB7JxmdITmzuM0iix3cCol7g/UhLJhZhPqMgdg29sz/7OC+44trRJnCq
 Mpem7uuSfgfHXHbI3Dgi5SX+Gee1RlXZhGW1uM42lMphZo1hFIyipvfMEGLgKGB7gf3+
 FN0nKqK8TpqSeuI9UQ9FOHXPyK+j5cDRS/iGW2O4kaPYTqHqZZQuNfeiCxv8HEMJnH85
 c+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393312; x=1700998112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
 b=XjK8mWmi4d3E8RtTGNkfF5Y6pHgNMi+2jg1UwlRHHMwgeRpUFBRlUacpV0IJ8A8esh
 zu33PUi2ak7VOY/7CqXvTSFLuvJJHAodTEzwDuQrQbd9AKxGWaAlPHFOb62Ccqz1eN5J
 7LvUIrhwFSytJEwGcl7I2K4UQ2vtPasGHGUIY5L1Ek13DvD9HCU1IgsReTZiI+dlJfZW
 MbJDuQAk+Iz7H1s/GFxYvFG4ll+dYDQbRSS6v0UIvsi3s6pCwSaCRXvxMyOaqR3ydNMG
 vueKfnhDYNFILkdUCNUHwC3sbUUZejzWHMLEFOF0PWk93AXJODhBjMKixqS0rrUlWDdf
 U7Bw==
X-Gm-Message-State: AOJu0YwH9C4ZoYDjLTUnSsCaNthBNpP+PtkBoblk74lfAqiQKwn8U/IT
 M9UYdy72YFig+sT6VfuUWY8=
X-Google-Smtp-Source: AGHT+IHCBymhmMkLDgf8c72aSm6rVzHfrFKwC46JDn+N6dKLAc0aMYGmFbO3t7kmKygycOOk6QrJ/A==
X-Received: by 2002:a17:907:6d0a:b0:9a5:b878:7336 with SMTP id
 sa10-20020a1709076d0a00b009a5b8787336mr3794771ejc.7.1700393312239; 
 Sun, 19 Nov 2023 03:28:32 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:08 +0100
Message-ID: <20231119112826.5115-4-hkallweit1@gmail.com>
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

