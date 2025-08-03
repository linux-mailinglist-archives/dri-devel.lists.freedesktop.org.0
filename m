Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09821B1920B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387EF10E4C6;
	Sun,  3 Aug 2025 03:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mFFVwZue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C95E10E4C6;
 Sun,  3 Aug 2025 03:59:29 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3da73df6c4eso25013465ab.0; 
 Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193569; x=1754798369; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
 b=mFFVwZueXnNiZwuZHLkvO0O5vyP6Oi0L9MVkKsVfUe0JFW3HqLxtCbnPlk5WTZeRT2
 NZa2vskpYOSRzwnvSiBuJ4dsCvhgInU6nLXEIfn/4SvykMCBg8ZLlGUNDfD/FJBXR0Bp
 CCmSUXUQga8BMqgc/ohzDS+ZKnoguxEXxKOAY74Rt+ydbyfp7c9BFk808i3khxJ3KSFK
 1zYkS09Qci95+AuQTSBBqzHjVtQg7NgDrQtxkQmXBPHB1JSH+4TrsuEPNS/09mEQ4CSo
 8Q2PE5lyTy+L57MhB+630DOedfcdS4oucCP5gOZMq79N2uB63BNc3YuPkColasPkaLCN
 h6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193569; x=1754798369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
 b=QxItNVqVWoZkl7kbMqCfrp4xQ9Of5C0JDEU6RZaMzTBofBOpT5kYn1tupQ8r4ppRf4
 fo6X2kg89li/IC/prgXuQ3BmUmKoZelULIjnwKAU/s5JeHBVyETJypMyZLmXFCc25Sdd
 rVWH7P9beHPYeXdckMDZ4VloqR9HDQB16pcizueDSjKLPCEDM7MyL6VLt4rUHz/OJGYv
 9uiLbpn/0OK2ob82QahqlMDDx74coJMdCn9AJJe5gOW4A8kL/blTE5iMae2ZFK8gOfgL
 /frs6X7OOivgNw5rcyqNU8B1MD8n1i9BR8TXv7cacoZhiMKvxZKzvcxMWMjaMbX3k1xG
 AMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUznqJda3++S0/0NIw1/dBBAtQggPupmpT/DRasPxus6llVGcKgy/vLMnipniiX7YxgsIGm1JxW/hDS@lists.freedesktop.org,
 AJvYcCWCqeryd/aAAUpUz9dNjxcilUHlXqz1ofkMjtFqSmJ/RVdviyUwhLKhoqBS0gil0YXyGdTuVO1CQ0AN16VRYQ==@lists.freedesktop.org,
 AJvYcCX3BDghcahPlE2B6UoIzRSZYbXsDr1kJwZ9cQ9oeZ5vaWobF7Dc7aj3pilfQ3nJcYFzmzLTiHWt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwguVdmhJ0Im15HZRTS+VpWnlWfvUrK9Ny3/vEZHxdArB2pUf5W
 yGkY8asLrpgEkg5fvyLdMo16KQZZNyQNzHxOqfFiDFBOCVXkB106Mf/E
X-Gm-Gg: ASbGncsyoIPZ5GZ+xGjAfc+UX49YzEOdA3+wgaD1cXyA86+gnFWHSswEOcPwUN6kV9f
 xseJxPWMMIEUEWt0T8yexhII6dHFTMlXSoIO/O26rTMBCM5r8Hl23j2q5MQUQbBRQVZ7O8xef49
 Cyk85/mGo6LzrDswQnNjm8oAbG0trlE5SIPAbXCf9RBreXSEWy5ZG/HZvwDZpJuzNnw33kp3mHJ
 i8yj0O/0yFuosGyTiTj44NMjTrnWrC0ACFDUoL2zEDRLMpULPbsrfe5CH0ryFb/Qr2rcQ6xynN9
 jN0wYHempmKu+8mrboDvDVnRrXCyla8k5wUvoQ8qIUMSN8K1qtiQzHt45RJSdua9NdpVpAGeKRp
 qNhe3wNMSNzw6kQCqH9tcmXUc4QsG5JtO3qhsMCrsqD+nGLUafWyJRjOdsp3gQoK7/VjCyvuIqc
 rIBA==
X-Google-Smtp-Source: AGHT+IGth3u4prFPioIoRO0ZqX+noSjESd93MJR6zagV7L9uNGSa8yCZng+SW2QdyW/djCNVq3SQ3g==
X-Received: by 2002:a05:6e02:8e:b0:3dd:89b0:8e1b with SMTP id
 e9e14a558f8ab-3e4161b3e64mr95013645ab.15.1754193568672; 
 Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
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
Subject: [PATCH v4 37/58] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Sat,  2 Aug 2025 21:57:55 -0600
Message-ID: <20250803035816.603405-38-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da7..b235e1e8c6180 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -245,17 +245,7 @@ int amdgpu_umsch_mm_fwlog;
 int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.50.1

