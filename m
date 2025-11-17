Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83996C64B6B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C3C10E3A3;
	Mon, 17 Nov 2025 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X63JmYTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA91610E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:51:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-477a219db05so7469645e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763391099; x=1763995899; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lMR46b4uQ8zvIZ4z4OEE92HyB4AJdF7hHAkE7g8Mulw=;
 b=X63JmYTwzK4jEkBZUd7avrpyiQYAABqtWC8UQLf0lWu793CGeYTsR+C7rTfuzdaPg5
 RpYRaJLmACXYorVxL2AZvIkXlueTvDOhyrUT74w5JHng4rlx1ZloSQpeO/tJ14SR+0fQ
 5n4XZTYT2RRuHiL+5yo/9kEvk2VBxIZAKEzeszVuqSoyd5WKHb3Zu27I6DeUkeyvWeog
 DlRbz0Q3/0+PyCfA8UniZx3n4YwIeDQR0mxZYP63tz3npn1eeE3XMfRC6p9CabFhelYI
 1+tDLzZvriBC+cP0kyC+mbxaKi4Mj2QEka05Jguv7g1NR/kjKEiBMimffVIfboaYfUru
 C9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763391099; x=1763995899;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMR46b4uQ8zvIZ4z4OEE92HyB4AJdF7hHAkE7g8Mulw=;
 b=CWtjVfysVW6J7du7gsmphHCaU9ttP9f6KwkNBxg59yLu9ch9WgJWJiKGoKGl8Y9rSC
 wgocHv+OpZ4uJkPY1fVoA2qeatgXiZnr6y2MuPfAKZM8lKi9WOxzJFCDBMdmi+Gx1K/c
 Yn6nHkOVRDiyEj5ij6JIsx6BZttdofx/wOLt35ylkjBTaR8VT0yqrNh9pH1STJm6svzu
 YQzZAbJxxArtezq/F0ZPOivNJIuGKLAwYvA1T8Yvv5kSlHrkdrPjGeiJavsA5Fu/UXYL
 4dNr3BqmogTFvgXCD1ChDAU8/K65MucZs0fh7sZVm0SxC563C3etfavruM7YKPInnke6
 +4aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqwKJ0SokThFKQmP5haxelYgaQ+E6t2MziaSWMmTln3bdsXvDMVN25W+U722PmdgJZy+SX/k9eVVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw59kaWWetKPUNw/YGYZ8ARA2V0qtnEF7K4cvpe6cpI9CjLqJ3k
 VdTGaRmFGMACzlE3Y8bDHG/IEzQSZ2F1TwzDh7adS64m7guTbFFMvg5VL7eTzMmjgvw=
X-Gm-Gg: ASbGncssp0Sx3X3rSFdWNyP0k31W1ssUBJuW8gcf4YvQFUBd8zIjt4m8dB1BKe5oQC+
 ZouUL+HKm0QbCb7bvCnXHbU4XM7KUJGQHyqj5o51bJpaqm2+DpRJs8BUap4hNrvpGQVG2/RuDry
 ePwYCXrbknnxUgNDH0k3qaAFJlw7T/4jFBXYLx2H8m399lk9hortyRBQQhDAwm/mERgLwDfS0bX
 F0mK/iLrHAmcsXPTNUyukXjCr4KOtKQQIrQqsC3Vc4ZzxMas6Nqs9Hd2sm4dTRII2XvSpO4vjXy
 Gc6b5m/uTc4Bd8H7uNhTNIzYho6o5F0Kvco+y1hS1buH8czMU6yTkZH+0LprO9vcM66eDo45b/g
 ygNxI1ZdLLrU/Co8AuIkJqmtCIlsJKNPDi+ymWSp690IKHOEFvW4SuPfH/gRAtseGivWV5Rx6kF
 zCRCZkRxK6XBrKs/zFYlld
X-Google-Smtp-Source: AGHT+IFuPywPKGEGfDcG3XySaSMUDElkhMg930wM60SJMl2cvSXCEeRs1HGQ0d5+jXggJVKqlRTvXg==
X-Received: by 2002:a05:600c:3b25:b0:477:7925:f7f3 with SMTP id
 5b1f17b1804b1-4778fe62d4emr106393025e9.14.1763391098818; 
 Mon, 17 Nov 2025 06:51:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779920f2cdsm154545895e9.10.2025.11.17.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 06:51:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 17 Nov 2025 15:51:35 +0100
Subject: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHY2G2kC/x2NywqAIBAAfyX23EIm2uNXooPYWntIRSOE6N+Tj
 gPDzAOZElOGuXkg0c2Zg68g2gbsYfxOyFtl6LteCSEGvEJki/kci+rQcUGjS0EfPLKLFmmcBiW
 Nk3rSUCMxUZX+wbK+7wfekRj+cAAAAA==
X-Change-ID: 20251117-topic-sm8x50-fix-a6xx-non-ifpc-e89753af3696
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qnOrNESQ4kON/eGGcc8Sg52LyYkaBgKNyQ10apooHYk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpGzZ5S/Sn5xg2lbtN0jzVUFE+xgIwzsnr0zl1qiee
 xlTeTreJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaRs2eQAKCRB33NvayMhJ0TcKEA
 Cp3vLfgyZV/hDlI9A1dwBvwNGc+uzV5ZkylAmSAPv3hAWBvcw3mq4TTw+LnJakjLZb0nXOPq2PHdcK
 L3CWwfsRsFeURz5ozIqInxLG5jT9v9FSqWjrGoQnL8KCaof57vtMAklYzI2jO2Dv2bgTEB9bsaACN3
 suTMY4sZNjkNTDGUMDcQIG1wgcrT7Rp2NxVuPzLdl8tgHs3J/mhwpIHZQJeElkAYi/cOYeLSJwm0KA
 ZGPSevrKW/mTfER99/05xgA/+UBFKOVGFB1Y/s/R+n5Ta7cpW2v7ncx95Nu/t3h/JCh1Nnm4xrB9fX
 P2UOphJWgWrllsm4k9fjM3s9JhzXwjpG3XvoCM+8yU1wVxXWrGfTbBODGSz+eL/d9bhPvClz2QeXgw
 Uxn9T60+KBwcdkyZjMkA8psb35SDwt1Of44NrECEyM3YmfT+QqIxkz8kC6xeMMv/fXnVUTNWLEOOhD
 OrHbodeOv46BCnDcc20Mn78UX2awHRn0u3Y2VLlKpYD08/71Sf96ER82hEBfaID7goZm1BlG+4M5UL
 8bft8AJJnjJTefgywiGKk0Qm80vKCGjyUHee2YTYzo/yIDR0yOO4g3AZPpPeMF0zQD6CSnq7Dx7i0y
 uW+hM3IBO1a5lsbpugcjFTu8Z4jYu3YVppZtY0H+QH/iMhDfCSdR13KNtsBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
if still deferenced in a7xx_patch_pwrup_reglist() which causes
a kernel crash:
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
...
pc : a6xx_hw_init+0x155c/0x1e4c [msm]
lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
...
Call trace:
  a6xx_hw_init+0x155c/0x1e4c [msm] (P)
  msm_gpu_hw_init+0x58/0x88 [msm]
  adreno_load_gpu+0x94/0x1fc [msm]
  msm_open+0xe4/0xf4 [msm]
  drm_file_alloc+0x1a0/0x2e4 [drm]
  drm_client_init+0x7c/0x104 [drm]
  drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
  drm_client_setup+0xb4/0xd8 [drm_client_lib]
  msm_drm_kms_post_init+0x2c/0x3c [msm]
  msm_drm_init+0x1a4/0x228 [msm]
  msm_drm_bind+0x30/0x3c [msm]
...

Check the validity of ifpc_reglist before deferencing the table
to setup the register values.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..7ee15f339438 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -831,15 +831,17 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
 
 	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
-	lock->ifpc_list_len = reglist->count;
+	if (reglist) {
+		lock->ifpc_list_len = reglist->count;
 
-	/*
-	 * For each entry in each of the lists, write the offset and the current
-	 * register value into the GPU buffer
-	 */
-	for (i = 0; i < reglist->count; i++) {
-		*dest++ = reglist->regs[i];
-		*dest++ = gpu_read(gpu, reglist->regs[i]);
+		/*
+		 * For each entry in each of the lists, write the offset and the current
+		 * register value into the GPU buffer
+		 */
+		for (i = 0; i < reglist->count; i++) {
+			*dest++ = reglist->regs[i];
+			*dest++ = gpu_read(gpu, reglist->regs[i]);
+		}
 	}
 
 	reglist = adreno_gpu->info->a6xx->pwrup_reglist;

---
base-commit: d6556aa99b8839819267e8167f04b715cfb5d4cf
change-id: 20251117-topic-sm8x50-fix-a6xx-non-ifpc-e89753af3696

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

