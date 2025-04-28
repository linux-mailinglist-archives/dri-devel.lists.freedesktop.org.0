Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91140A9FC79
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBAE10E28D;
	Mon, 28 Apr 2025 21:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xu9xX4Y9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C2610E3DB;
 Mon, 28 Apr 2025 10:46:34 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso806187966b.0; 
 Mon, 28 Apr 2025 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745837193; x=1746441993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wvbdr0JNuifyk5uUnYe0etbSIhAeqsQMJ4amy8aWMqQ=;
 b=Xu9xX4Y9PDpRze2ljijsDMjMVpjeiOKCVFK6kHUB8jA/TrgUgPTy1ZaBN/tBVMNpZX
 hEne19QZCxngBSKisRTKMNpqnXaqXspUxNO3Dd4NYw6X9BFWSVcmDs4bPcG+QNSgr3ha
 sXjlOoEx6NSnvnynISzH+lrU04a+K7gzeKiut+r4Ibqrnhjk290YxLhUfmWCEO3ZNDDv
 gkHcu+Mt98w6OW0Pbgapv2rV2bKJ6FSi+DBsuBAd246DKQ7dmaFB5wETivyy9TyN9uUZ
 HOvUmxUBEv9rSdx1tH6IcH0EPS8hVrSyG5EhvPOX41sHsm8gvTNHvf0NYJpCxOuj4jY5
 ajaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745837193; x=1746441993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wvbdr0JNuifyk5uUnYe0etbSIhAeqsQMJ4amy8aWMqQ=;
 b=JGVDk/N8wNp1xiDViUbM3+XZ0ERsJ1oes3qE97//7Y5KqU6kDZhyFkiMNVF8snw8i/
 ZLbVzHyT2C7XRJjItGGlvFsRQ06TzH/S/coEDrjetIioO6jskK7WaDEc+aePg2AN0PQT
 SVA6dQy4iEJN83AwEeKBA3WkwpwZjVUef9jX1D5kMAc0VX1gTOEsV2vCCHTwbK/6I+O1
 CQVMuoClRZ3FvO/y/LsMa4IuB9AQhIeynIVuk5CuFT/LEZVVGpmoZIl7F8o+ujt/cyEi
 bPiZbIMBmboU4sG2Ufy8abFI7sRO1dRVrXdm7xTbrapOUK4QBr+8SFDUdPYtYnedAF+o
 VnVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVasJlp20NJn9ludlBueEH/y/2jusZ4btTurD8jo9DzHnYHn0/xcyQCxLbDTLnk3NbqdgGhaHTL@lists.freedesktop.org,
 AJvYcCXPNwbJ9RxRvNDtniF0ZxG4dKwTRd5/qsD41mrPnOyyyejETcW+cZZLmwDD6C8XU+XlMC0Bwo70xzss@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEhe8IxbUEmo3CYZnV5w00x9KkpuNbml6XEpPrDrmO9bSPaKYX
 xDkFCOYvN9EuNEJiJHJ0J6rKNtxrj5Xo+oti5XsQM5UZWHwj2EQo
X-Gm-Gg: ASbGncsLsUTo6YmoA/uhkeyY4GEGBL2nxR2oEXkWraA9Qooh1BApD+68aZJRFEUAKnY
 3mipZvUdh8ZHuzm0bSyWVAogg5Wv38Alc00ID2/6wMvz397jJwxVxVuLBN+a8CdsDf78C6pmI3e
 y5y5pkbRqIoL7O9fa+PmOJ7Zdi35N2yYfS9FlU0n7WHwhsrQegFWofYmLuQ3Y7KnSMZiFXJoLbK
 FX2iG+CFSV0VQ+A89NBDjPc63YU5ZSIpgjkJbLDwLfL0lRRYUqkqL85IZ8bwxSah8guaoZ12q+c
 uTwla93ZQH8ftW4cox2AKcInaT2aMGBAe0Q9lKxUbxDLdQ==
X-Google-Smtp-Source: AGHT+IHwRoOppXIpij71zjuWnJJzu0zh59DkRNeg5ulYk+IyTgFGTV8x2J19ySlX5bz0MCG5VQ7icA==
X-Received: by 2002:a17:907:3e03:b0:ace:3a27:9413 with SMTP id
 a640c23a62f3a-ace739dd0b1mr912614666b.11.1745837192384; 
 Mon, 28 Apr 2025 03:46:32 -0700 (PDT)
Received: from noctura.suse.cz ([103.210.134.84])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ace6ed70b1fsm602497066b.157.2025.04.28.03.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 03:46:32 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
X-Google-Original-From: Brahmajit Das <listout@listout.xyz>
To: 
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/amd: Fix malformed kerneldoc comment
Date: Mon, 28 Apr 2025 16:16:14 +0530
Message-ID: <20250428104620.12699-1-listout@listout.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Apr 2025 21:45:29 +0000
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

One kerneldoc commets in amd_shared.h failed to adhere to required
format, resulting in these doc-build warnings:

./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'

Adding missing colon symbol and making kernel doc happy :)

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.49.0

