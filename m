Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317B85FAF1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1A10E94C;
	Thu, 22 Feb 2024 14:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="SkX3qMOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EB610E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 14:19:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6e48ec75944so1425600b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 06:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1708611548; x=1709216348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WGPosRtMSArWndWjzJ9481uweCFGTHltu8X2CabZAF8=;
 b=SkX3qMOz2RGL3HkXMlT3cur9G1GouD9J1WV3pG9oBV1foOyIDIsHoo0ICmE9jTHZI5
 mYj6e4mcl655zhWWTQLX/fpPk20ON4UURAG2oK0RUcbtDJudVQuCmrzz4OqQExYbjM8n
 2d/pCGT2WRTpqinNG92gbz5TFWGRDDO+RWi88/HBhU6nzTEXJZjHz296KeH5wMEDI+XO
 Y9NvW0/1xoIAbeQ0wA8fip0ZW+BtVPJjWoJH5U7ZLAGqRNiVvFN5s//fmkpOGMXOEOyi
 FZwOK6upgKpRetT31hvag/wizFoa+bl8G0p7hjcrsv1r3IaoIiZb3+vFvT6gBKowth6u
 JWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708611548; x=1709216348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGPosRtMSArWndWjzJ9481uweCFGTHltu8X2CabZAF8=;
 b=MS+qmBIj9VTb4lmuilNS4kpQxlY9Us2FC2hA2Ptka5HOATNJCvP/2etQhWqMC8H3Gp
 2I/HpC5PsNAQV5T1s9ziHtndwaWSh1bhYnRIJULH56I+NLX/1VR9YqEzoPd6vnspKrji
 dzGP1sfYTnH29qLYNwvFrX/8Z2W2a3k6RRB9COtt7KjZ1c+z0o/jp2Ssn2DPO1rXFr5X
 uu+wj2Ql9smWqOoRDrMzJuTVfPZwzG2Ac3LRa9ZAMP2JjsgH1VBo3J6M86peSkX8/vWD
 aNiaUKk5e0P14qANX1sB7kQlArtZyy6HRzhJ0lChn06QnE/mFQE9NkXsm8GYZOnHpatm
 rD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGRtacfRdImzrmC7HfWpuEmPKdUyYmYlR6DAklYkJpYoNnYW7U9vRajgoYBr/PHILKaeVH+eazBalnAUMB2yvacMWVVgR56rVNp+JR8QYC
X-Gm-Message-State: AOJu0YxbH8mZFXWwh7AgYWySKQuTk+jZwfYnllBS8cwGD0+6IrD0aVWj
 kcm7pxT18kAPd09FCBAixG95Xs+hF5a064AOEcXkfSlR83n1K5E8SYMmUZnDXuY=
X-Google-Smtp-Source: AGHT+IHeireBxnEc2NlixryU2+IL2Al6qrZ952mZYAql+oMsMKKQF7Ttr/F3G4+bmBhDgUqAzV4gwA==
X-Received: by 2002:a05:6a20:e68c:b0:19e:44c9:cdd4 with SMTP id
 mz12-20020a056a20e68c00b0019e44c9cdd4mr20657777pzb.14.1708611548072; 
 Thu, 22 Feb 2024 06:19:08 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:63:8e10:b166:c84d:a12c:b836])
 by smtp.gmail.com with ESMTPSA id
 t185-20020a6281c2000000b006e0fc1ed2b7sm11021583pfd.134.2024.02.22.06.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 06:19:07 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: David Tadokoro <davidbtadokoro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Remove duplicated function signature from
 dcn3.01 DCCG
Date: Thu, 22 Feb 2024 11:19:00 -0300
Message-Id: <20240222141900.295254-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
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

In the header file dc/dcn301/dcn301_dccg.h, the function dccg301_create
is declared twice, so remove duplication.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
index 73db962dbc03..067e49cb238e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
@@ -56,10 +56,4 @@ struct dccg *dccg301_create(
 	const struct dccg_shift *dccg_shift,
 	const struct dccg_mask *dccg_mask);
 
-struct dccg *dccg301_create(
-	struct dc_context *ctx,
-	const struct dccg_registers *regs,
-	const struct dccg_shift *dccg_shift,
-	const struct dccg_mask *dccg_mask);
-
 #endif //__DCN301_DCCG_H__
-- 
2.39.2

