Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899799F4E4F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:51:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D459E10E9AE;
	Tue, 17 Dec 2024 14:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cCH/COIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFCA10E9AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:51:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436341f575fso41408615e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734447083; x=1735051883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=cCH/COIam4E7/G8bfXBdPAsGnghywC1eG+hr7Ws/eq6c1K3qg5jBGylNiEaMiCRKBe
 2FXkd3dIFuOgHyAfY1vw9kG43OvWyhq1Q/W98+vPzJHJ8TW91WKnKxIPoaSU6IzWyWbC
 jM2XiNHpRcxOFGJT4ieu8oiQ82Dy4xVg5AlMFCp6KeUq03doGF4uZgrOCJfGBbsXGxdV
 gTlMHlTLKKmcS3dYvVWXTJNqwj+42ATvQGzz2QZbtLqqJWcZ/2uxdiqsICv2l3IPthtd
 5n6fc3uqevDLdz893B6TgtjwKLXu0UJ7uXRUKix7xa80y5DLjlOEMvse21ieibvw6zbG
 wOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734447083; x=1735051883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
 b=Vh/B/XYKMLvmufMYvGp2XpPzbr+SgoNHvboMMpq1YE2TSg+CmdStNHU4MkZUDYW4Mv
 ENfQ59BwwBnnTOAeqs3jNhNQ2cifzlPdA+nwTnsSkhGfyxlrPGMiiZ8MEugi9SPedCb1
 G0o3hcGtwPh3PK75r+j/8feSG4TDahjMn9wFxMP/RFXJWgzBFpxyim0FFrEALxdYS5U8
 7TiZcu9FDZ+iOxzxcoaGxtjUCRiHX2WoA024LDo+Bh/stgQH8XLdhvcF/+1k+oMniMdt
 0cWlWnOkYm5oocJTm8VWnmbkDyGpS7XQAbU+s4V8WSHSAQP8S1DSimgrPg3njKguQ5yq
 Vq1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUXJZc7l2/z9ILSpVoF3dqodVlvkLCzj51fNWAyJtYk3xvr0VimelpmjT4jr/OHPgCdnIcm4BvQj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSygeWHC9wgGBBTCx1muh80Kq7k8Cli0+5VteoQi2x9y+qpmcU
 W3OGuXDToVEHqJsAsczUQy3zsVO00mVTWSaxK9lbqzUSB/X8kd9NbunFT3ww9xP53+tEgoerk0G
 eB5s=
X-Gm-Gg: ASbGnct9KVfQ3S62M5NW9E7ks3FjG0jBzoyVkpluKpRAGn/7hi2Hz0qL7FagVihu9Ar
 zUDjx2YZ5yWJgM0YiYFmLTu7+ye3oD5+o0yEPHebOIkVS15ccU2COyFM+2eMS7V7jdP0VJw4+Q9
 P/CVQg8Po/Lp1BtIj9Y2mThGHCIqdDSvM0NtkN9ByWJjpqH6bREV7t0REjExZIv+icFJiGRniqm
 EkajPU5DmwS31yHW/aG/+lRbQcNFBSBLGcSto7XvHv3woSkcJoi0288R7O97Wi+r3BYmAMB2pC2
 iA==
X-Google-Smtp-Source: AGHT+IGjHbqNp8cDdsy6Oq2RFM1IUlLm39Klwx1ZEdjDhrhBRuiF6MponH/ZmYHPq50ykB3CjppPKw==
X-Received: by 2002:a05:600c:524c:b0:436:2238:97f6 with SMTP id
 5b1f17b1804b1-4362aa1af5emr139392875e9.1.1734447082898; 
 Tue, 17 Dec 2024 06:51:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:51:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:14 +0100
Subject: [PATCH v6 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-1-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uvbHEXTw+a2tX2idu+ViK6cwh2GKBsinSbc9Nbsj/3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/lMatVkt4Mbak1GnvvuBsBxUWPqGuUF+iBtsMV
 ZxctFHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5QAKCRB33NvayMhJ0XNdD/
 wMDYuo87ZbvQDlNKrmg8m0TKTmuzm6Vi8bZ3YqXCP+JZa4822CmGwkEoCMpy2dn3nHL8bEwwWt3I06
 TlNlLLJmtgWNPSYCqRBBu0SPu3CWmVSQzBHvOEFva6zze1oehdzK7WZYM8PzIq6y/f2abdOqCSWlzs
 dkqMewThz50/CrE6YZmEtrCWxZYo+PA5/BrZgemHNkSpJjxA0mwkwyuHRyK3WHHC41mvEccAcOfMG/
 vzk2M1kTD8iTO1LvOT0ASuwue9nWylLizEoDA/fRH7z/5jMng3lrarbv5HBCeWYfb9NHmiFP//T/EB
 79ZH01G0JTHBG3RgVZ2JVpDGxnQFJJJE15nQ6/zsDMvvHwxKQ7kNvb32njY5tznZvKHauF0CkavYH6
 QIxL+7i+Fy717scnA++eGiLrQeb+uzRpeb0uz0ke63g59Ru5fIid4D5Rh9gT4DjrgxEQH6QNXdcmCQ
 HhCP73/ItzDMjYnX8GB6a7A3pvwSQIv8yYFURipLw4SU42X3AEdGOK5I5BL6V0z1SYKmu9hWa8BdOG
 ybYtYdHXJAcjRr54JiAtdZTy7m+KBqRuVROgNqyiFZT34WWUc7v+zO76YqwoCOgl4Ybg1+68scunp2
 lc6/bYCbilN3gEb+/YzdCp86qkRcYXyvP9JQIblzS6XmK/ZfZG6i6y9Xm44A==
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

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1

