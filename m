Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80E7F5B49
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5BA10E6F6;
	Thu, 23 Nov 2023 09:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299F110E6F4;
 Thu, 23 Nov 2023 09:40:49 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso947425a12.1; 
 Thu, 23 Nov 2023 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732447; x=1701337247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jjxI0Bhxo2VvjdWdUiaiba2vg3SpmPuRCWUjk40Qtf4=;
 b=ZbcoaF2mg0npuueJO6auRVuAxLyrUf1j7sdYFyM2imouqWwyg9KWMHyKbIqfKTZThv
 JlhR3UzFzH6fXS1PSrSJUX7HJhcj8HzJcFVSFl8R5t/XuDidK8CNIiRp+e4gYchxURbh
 B3BmnDXg2AoOaf3tyYwKKYKINITe1OgmDyaMnISMjh3wI2l+8hee4TOeK3Ql68um2C9F
 KsSICZkfBcuepI5zl/pc0HIMiqaD8mUtnviW0QeQ6bdrj45dT9sWcKLKdpu3WWw84tus
 VcmSHd7Qbht0tuc0bSormb1ExtzAQth5Ynl4XMuBtXUIqq9f7ifs9EpZDltDnhIWMO/P
 zeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732447; x=1701337247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjxI0Bhxo2VvjdWdUiaiba2vg3SpmPuRCWUjk40Qtf4=;
 b=a4ah32TdHNJ9UuUuc0ODyUrVzH7n2L1Q+4Yo8fjxp8cYS4hxiESiJUCAseXDUVPJ/Y
 8kDEs9ZWUD7V2RNpMPJsZFpX/XeaWYuP1nziluiskQg5/anfvBoZ88BcBg3Z1IhwFxiS
 uV+JB+qIuGfYwooZmA0jieTgD6ApFtyq0v7GZeqKJwynCsyy9x6BwaG/l3fID/y1xvtt
 Om+hZvpCNYfnPO0k0Uw53s6EJNYln09wBU5PWqim7/uV4E2y6rsICq0mBxg6K8AcX9j0
 f0E1o7UVOTarM6UIFFVtVUuJq+//TYVGsdVaqWxEI6I8B9ebOYtlhkN2tJyAXXPseQtQ
 N6YQ==
X-Gm-Message-State: AOJu0YxyuyvLhJMAAIwGHeHtByGmXOhTld3zz+VqAWXVqAtgyzQD5pw3
 sJsz06lPL2DhLBBbs8GEgKs=
X-Google-Smtp-Source: AGHT+IECDb65WJFfHKu5SLZ2mOzLFfopB3AUFOLDwQ98H15uIbQ5s5jWEv8KNWp+97LCJrRr5q5rCA==
X-Received: by 2002:a17:907:9087:b0:9bf:63b2:b6e2 with SMTP id
 ge7-20020a170907908700b009bf63b2b6e2mr3326670ejb.26.1700732447203; 
 Thu, 23 Nov 2023 01:40:47 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:23 +0100
Message-ID: <20231123094040.592-4-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

