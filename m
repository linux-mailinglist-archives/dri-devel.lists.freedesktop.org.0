Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1658B19232
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14F510E4DB;
	Sun,  3 Aug 2025 03:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VhGsDdkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8510E4D0;
 Sun,  3 Aug 2025 03:59:52 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3e3d0cba6a7so12047565ab.0; 
 Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193592; x=1754798392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
 b=VhGsDdkmvW61gM4H9qXQt8IWGSYyCsx5JWhRxZK/+xaS8WXnWDISEnszDGOyKFcdnO
 FHcPP+XYTZNjh527err/XVBmg8FmjccPZosa8JwTCAzL+DRfGU+ZGrfThA/ViWziQnmz
 DiPVD/o9MGGPvLHU5mxPyArBxcmIGbrUgdNS9heloK2cJSO6fN4Muv67NgJYoxK6koMq
 taLJWTYXs0fWKIikzdMT3oVmJYygnmpIRpqENxvqf1iIJf6kmvSndQOkB8aIBXguCl6L
 EF3WY4henVEzhT8Vi8yZM3UG9RXTadmVN9k7jqiLwNwulAsNWg26kFRvwdTLfP7jAjg1
 CmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193592; x=1754798392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
 b=rQZe5aUXw7FHN862LiZOZj6TyjoUXbu+JJeWOkGHJ/1peK4FFJRYRXGET2PWni9/Iq
 7uWNDJBU9vxG6sJo3MQ/Zb9CACID2OK2GaWF1hCH7D1Hlyzy8e05L49AAycK4gg3qYoP
 PWXkUa4RK+lobeikCbwPqTytqBI31zWzJFanhg8rs1REEDVoCY4hz8AwPOHPV859j128
 5lWu+71QbxTANu9L+ELXRTfoVGKZlMpeyF3HVeT2qTA61m9gWCIypyHqDErKVQg+Gdpm
 57B99Kj1qNufUp96Pp86zCp5YNTZHw2m+V3nAk0ECsjR1Vf2wPe3dzSznAgRvLrQbsWm
 DfLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIk4a5RayMpUdAbB3sU6UMF0GMHe2Abc2Bc6V9ledsU9mb9ziNDqmOBVSD12UohjvFKpfCR9IpIMNx@lists.freedesktop.org,
 AJvYcCVmwSOUgDQ6vfDTenlk+x0rz2yhNStq1lw4wzAzr3Wg1r7LdbGbdWEB1t5qHLv0JujN0RhL/V7i3OsLnkT9qw==@lists.freedesktop.org,
 AJvYcCVt4L7bwBBEkGPw9wp9hlXzXqo5qee1ymCTWjh9C/8+r2gc/LgY4RDE3NeATWhtvm7TmMeYPwiR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytJY3h2ZNl0wz5zN55/IOqH5FDdxIHN91uYVUqyiETYBuYJDyZ
 BHYndkzEwxrcPVSOp5w4WwhBHe2BCLa8a2k72ZwRul8Huek7u5y6D0tV
X-Gm-Gg: ASbGnctQZzhHrYHCfIf0YQBlp6sGMQzmVqzHNE+TOP/eAulfejftpj4Zh5Z54xjLPam
 I9o31DyIriFNRz7l8F1VEAsqstLAzYYtTWF60LJahgS2H1byHxVOY/97Y9fT/yxLQFyfW28SeWI
 TTY2293JA5y0z53UxKPJB1dnlpknzgbpJMHg6jNMpbHpugt7gewgvPE14xHCIjLU8zsnKPkTP/9
 HScWirYagLmtbqkiX65rB2obkygAxhpqp3bWcsDosIOsHI76ZTJcZOxtU+BvA2GktLzx4Eu0XUg
 JzHTYMf/XPBWyIMhWAquffPWudPdzxaGN4Hz9GwUv2GeTy32T+HIeZhmZS42iogSHVuB0XhocUP
 3WJ+6qYLGUjC5OwL49cox7TVAztcI6Jyv9uC6KONMN/LSXrpkBxXCLICCb6YOpQqPnIY/oasOG1
 auHw==
X-Google-Smtp-Source: AGHT+IEyhw5mUB/eNoeEely1BTFanJ4yHz9P0sfCu6Pe+TFRcVR4LSDg6aFmHhG3P/FtSBF/ZASr8Q==
X-Received: by 2002:a05:6e02:1fe8:b0:3e4:b9a:8ae7 with SMTP id
 e9e14a558f8ab-3e4161081afmr88579355ab.7.1754193591790; 
 Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 54/58] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Sat,  2 Aug 2025 21:58:12 -0600
Message-ID: <20250803035816.603405-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb4..c18577a3153d6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.50.1

