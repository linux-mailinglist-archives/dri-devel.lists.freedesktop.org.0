Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB0A8136E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 19:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9D10E27E;
	Tue,  8 Apr 2025 17:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HP81XvJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD61410E218;
 Tue,  8 Apr 2025 17:22:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3240282f8f.3; 
 Tue, 08 Apr 2025 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744132955; x=1744737755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=HP81XvJfVFiMRTG5Duh6KscIHDeW61zmxQhjplMKeg84Prsv/KguimRrKHtvR95ixt
 BQoJDb4ZvXzyatECl9UQ+JjySdf6Axb9ywGK4Gg9f0NpMDO3PzqFfd9n/EUbsfHh9ViM
 5dzX71jwX5YSEVqFPzb5AiBccVnjDNSSddV/0MXzeoHBTr2u6rySFgS69YP8dGTN/Yut
 7M12qwLJ/YPoU2+votpZ1wVCisST+hA+W5dGDHMZU8LKI4bokxxIi2e6brq8M+DWYZ34
 a7lgRxVqORM+pKy+nwuiIw7rGy6vhg9Xy6jY1o4F0A6FSpNKw9Jfmb+24xW8xsruV/Qr
 bUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744132955; x=1744737755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4URTuU4OqPDMxhBgu52MpzTH+LX835ANJbVjlWk8JY=;
 b=xEnaOj9kJG0266C3EymmvLi01Xlkwa4tZxTfKe3RO1TDsyDB9NHXVSdT7D6KbDEptx
 gN6150W50Hh+SZAKMEi4VlZtBFF4FR81gBqBNwEhWVmTsOi3Wi4PNm8LVrh4SDTb3bpd
 myajWWtLYBEAXqj5pcJz8IxOXOQbI/cyVcoOW6rIcM70vv4/+ldvxYnjOx9FgIwvL8vB
 B8Am4MUtnNd2qDvl6CtxLcPm9+VsgaCCrseXyYKUBt66MYyzpyygEeRqpoRtPIOGCvej
 3EiLcUcE0BSNWRtH3HBFUuAWdHs4Y03a/5bYRpqqsdN8k4rvES3wopOxQnXqz/0HYprP
 Iqdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxpR4YI/kq7DQyA1QFm8GX40Rd4AnZqT7lktFUkII6Abe8kjnDR7XuoHAjU8yH1V1SqULbcvkl6lou@lists.freedesktop.org,
 AJvYcCXnqF23uFZriFEmHQpE0rB5UKejABfRva+tLdbb3fcoucjZbPGllDtc7LxZB5Xd188vIS5SBF1s2so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoxEyc7KZU/Pk44C7MtluO17i1UYCPspGFayxCr26dak77eCCA
 lESdBQosjkkOo7xiUnDH1n2FDIZCdcKtoPQZ9wds1ECKzDJv73vk
X-Gm-Gg: ASbGncvXjke7DNL5tl3esc8FkBc7pQLtozUcxH/MSeznctCep2WT4GwZ7ijs/LksSQb
 E9fSkKUKB5qwoe7cnj5p6dvNlhE2kitlIjf1XqkOF3C+831nNsqZSuOgAqi08ZkHgtGkPZiVrjP
 pg7nv+9X4KIfpApI+75+650fR716hI53NwDBcT09mwezeKlspR5qob8tIMQGLox//shIk3HT7Dr
 Vj6VSmf3TKDx2XJDn4apJCDYE4PrDXLCQW7Sb1d+4/8h7kuvD2ciSNXdXqWGAkUKcuB0Yie170n
 7J/XOSlWekqd/OysOei2X3HEm/SID+b1TZYcWCarive2E/PPUgfKGzvY
X-Google-Smtp-Source: AGHT+IGF2ELWn/bt4SThTAhIsS85ycBVt4QmEGy6AROd0iJukYlBEQMvgJpx007p2eIQD1aBh/DVGw==
X-Received: by 2002:a5d:64c4:0:b0:39c:1257:c7a3 with SMTP id
 ffacd0b85a97d-39d87ce3284mr16492f8f.59.1744132955207; 
 Tue, 08 Apr 2025 10:22:35 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:5b45:5642:beb0:688f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096896sm15729953f8f.19.2025.04.08.10.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 10:22:34 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, lumag@kernel.org,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref
Date: Tue,  8 Apr 2025 18:22:23 +0100
Message-Id: <20250408172223.10827-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
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

_dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
before the sanity checks which can lead to a NULL pointer dereference if
phys is NULL.
 
Fix this by reordering the dereference after the sanity checks.
 
Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Moved Signed-off tag below Fixes tag
- Moved dpu_enc declaration to the top and initialisation below sanity checks

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..0bd1f2bfaaff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1667,7 +1667,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+	struct dpu_encoder_virt *dpu_enc;
 
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
@@ -1678,6 +1678,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		DPU_ERROR("invalid pingpong hw\n");
 		return;
 	}
+
+	dpu_enc = to_dpu_encoder_virt(phys->parent);
 
 	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
 	    dpu_enc->cwb_mask) {
-- 
2.39.5

