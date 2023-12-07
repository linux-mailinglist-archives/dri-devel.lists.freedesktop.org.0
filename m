Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD058085D3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C77C10E869;
	Thu,  7 Dec 2023 10:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEBC10E869;
 Thu,  7 Dec 2023 10:54:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c0e7b8a9bso11016675e9.3; 
 Thu, 07 Dec 2023 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701946496; x=1702551296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZPaAye3nkWneLsD62Nfqghe2VakCTzAP/KB7XhFCdQ=;
 b=Id0H5ltVksK/mt4eycM/bv/OwgFh7T+SSUPWkV4+7/C5UMu/AKyhycTmnnVXs0GtvW
 rzDDHqfPLGl90bDD4dDVPGVVmPdzGmp9mmbRUswO69CcTWbxmO1qewOCPDyInuj0EWmW
 oM8IpXi9a+7J01zRtBLSec/ou2yuseOcC7mXxgUAuoJBkXHe/WwPwoPmR3gTC7t7wEAW
 sJdQnAXEkv4F7WlRhjmcMuq+FL8Zgo0jHuMnBOa4UKsrSrP8uPqWlWbYbpjkyoh2Nlff
 WepcJXG66bpso97JAXYV3GzH40600vUnChidDQqpIEDVN50P5I7Z+2sjV13ACVxTvbUi
 K7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701946496; x=1702551296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZPaAye3nkWneLsD62Nfqghe2VakCTzAP/KB7XhFCdQ=;
 b=kNzK2jofFFr29RF4AqR6bdHRVrxjgQuehb+fRy57uPvHZGtumcRbD9emNvj+jehSTD
 beXgGx+gcD8MulYX5M8XTqvNbChQEW9asLcorXmBeShyPGxBMgUZ8OKj0Vvn1MZEWkA8
 2rvF3w8PunqsDsKTRdDRBZvqJoqsPO1LwFYd8sacbaQFwULz3sNjsVs1pkOM+CIlQ5lM
 8wSYy/OLzZkSh/hIXHz7b3cEn9bnLnx0FsNBxOeT/mV0KFlHlDDkMJEKI+lQjfdHB14O
 0F6Tdpd8PzJ+SoMm7BaNW3f6ViksrSztI4Sp72P0kbnq2NbbJgo6HhnF/g7R4+Obd1ws
 pH3g==
X-Gm-Message-State: AOJu0YwL89dM5RM8tB2+R2+cVUojQVech7+F0MPvH1rzee2CFkmCxnIs
 pDv8PmOKFD62Vakeo7rT6sGfWu8/ptN35w==
X-Google-Smtp-Source: AGHT+IEikmXKg4AE8MRP27nizvNW5SUNa0ZVvzQXagahn5GdC2FJ1hW+EiTdLdRtyapIAcw+LWO1lg==
X-Received: by 2002:a05:600c:54f1:b0:40b:5e59:ccd4 with SMTP id
 jb17-20020a05600c54f100b0040b5e59ccd4mr1457662wmb.181.1701946496021; 
 Thu, 07 Dec 2023 02:54:56 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 e11-20020a05600c4e4b00b0040b48690c49sm1514762wmq.6.2023.12.07.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 02:54:55 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Charlene Liu <charlene.liu@amd.com>,
 Sung Joon Kim <sungkim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake
 "SMC_MSG_AllowZstatesEntr" -> "SMC_MSG_AllowZstatesEntry"
Date: Thu,  7 Dec 2023 10:54:54 +0000
Message-Id: <20231207105454.3138964-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a smu_print message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
index d6db9d7fced2..6d4a1ffab5ed 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
@@ -361,26 +361,26 @@ void dcn35_smu_set_zstate_support(struct clk_mgr_internal *clk_mgr, enum dcn_zst
 	case DCN_ZSTATE_SUPPORT_ALLOW:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10) | (1 << 9) | (1 << 8);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_DISALLOW:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = 0;
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg_id = DISALLOW, param = %d\n",  __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg_id = DISALLOW, param = %d\n",  __func__, param);
 		break;
 
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW_Z10_ONLY, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW_Z10_ONLY, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_Z10_ONLY:
 		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
 		param = (1 << 10) | (1 << 8);
-		smu_print("%s: SMC_MSG_AllowZstatesEntr msg = ALLOW_Z8_Z10_ONLY, param = %d\n", __func__, param);
+		smu_print("%s: SMC_MSG_AllowZstatesEntry msg = ALLOW_Z8_Z10_ONLY, param = %d\n", __func__, param);
 		break;
 
 	case DCN_ZSTATE_SUPPORT_ALLOW_Z8_ONLY:
-- 
2.39.2

