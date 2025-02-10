Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A9A2E7C3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F510E4E3;
	Mon, 10 Feb 2025 09:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b6I63Avi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547A10E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so26690545e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179972; x=1739784772; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
 b=b6I63Avi2wyrK+ZQQnTzx7W/AP7caXcpgPIEBGGUOmF0cw5D7stDSjcVNLwuncSDYd
 CgOO24BeTOYcw6smwuZ0A57urYHjwbah6MaczZzVZEgf7n+DAlUnLHFIrqANhAdRMpO8
 tLF2DhGn0lZaAwR8tSqEA/pn3GfJYNlU+ctqEAwIwQJBOywpfEwmAUVNZHM+SoAsPOlu
 YlVlkBijGh2GG6BRuWGgP3mVTMWRsrnVGJVp3Vj/cjiUS7BIABJv6O+0YbQPXKVkoJ3i
 q2kNkgQJ6tLbVQzccd5ym5cjgAZeaYsD9R11ryDPIyx2KQIIc/WQSD80DtbRbV9wPQCk
 A0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179972; x=1739784772;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
 b=WZaBBKWhw1sOvHYGP6JvJIqCLxCXxFiIbTmVduReOmRjrRaPU4i4YKpcZeKnLKayVV
 WLh8+zns8wk1DA2ut1+3WiwbsM56RRLyJx69wsp6hbTDvnk7mJ5ECj+j9NhN02K3EVvx
 PQqlnGkKzeZdm6qMyqmn4dKxge9ocdN+pF978akxVzb5s/VplgYq4z7Szs5Z+nX0msqy
 IuWCQgAkjh9P1GjBGYZ4RCtGSytDzyfJ8Qc1oqEuIc/SzVeKdfzA5pBDQKXH2ApaNyXI
 vf6dMrB3uTbSEgj3ezBqR/hP5ZvvStkAB2X/C4CGckw2s+GlDT61LhsWyUySLbOPpYAG
 Doww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/LAalXO8wG9b9jH+ITXL3h2i/Vm/j4Pg2T1mAkqg3T23v3psEaQC9X1Xxra3gqAj4IR+5iT4t9qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlQXucP2d8gDaZNYeSmqpf7tvz+VhRt3TRRY6hvDLmhqJx/hjg
 +rpEl9ieR7l3ffZu9uIB3BH9hNyffiofvsduS9dKSK4F6QiJ4y3rm/KyZumd/9c=
X-Gm-Gg: ASbGnctkqw9+SWNjWT+DIhxBTtwJzqXq9RgrYMtnocFUMf4FSXP+mSzMGIoT7sqQBCU
 HS8EVEFvYWmOEqGOaQ+oe88PSImu7BznbcQBkdk3QkjFAcak9g5B3Ci+rFvvUlX7LDGm7tuE6EB
 ifTq/PmToSvszrA2IBtqTxwCTQVkNZlaeLAtjto36Q0GBflskp/mni+u4Ez3HBaj+qnT9yEIIOY
 7VS3T1sUgD/Xjp0GWKyogEbbGErs7Pq1kSIPTOoKIxPFqsak48O8hdcNvm/5x5kUdcvS4gdJzt9
 7lhUZYdUNm37rbx1qLA5MmJUQmAi2eUfIOnY
X-Google-Smtp-Source: AGHT+IGPRsAVtjDP7HsM+NAqH7eUh/kQaI2NDFRRj2xr8IRtRWGH/wInuxqz+Xygr498MK4srrSfQQ==
X-Received: by 2002:a05:600c:4650:b0:439:403a:6b77 with SMTP id
 5b1f17b1804b1-439403a6d76mr40653435e9.10.1739179972563; 
 Mon, 10 Feb 2025 01:32:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:42 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=98TJ0BDq/B4YwYQuRbdQZDol3K9UssuD5yxrzrrb764=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9m/jhlaXw4GK2ZFw2r5HIIYWGI8wOs/vFs1bM
 4LUMLfCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f1EEA
 CVf2PbRt814BXrKgCeDeA2obxDBQY4vpAFMPuW9T9FH8C0VmlsdRjFqkwhVNLcHre4+GEdx94UbecB
 2cwG0tLoWmlqT585vcpdMXvE26mJLSIHdmJpBfwYStCD1Jds3TrPyv2Rk8GYCi12jON2yAF5prLkPf
 g7hsylbkRM64QR7aeeC2QewzmRD+6i+6Dc01SN7cGfVWrxKpyGpJPsnzJlbQ+b6zasx2AeBM7H3W6P
 yYRQb9Xvi3Xb6wnTleV8hcmfKaqQ2MYYWfn3ccIZ2FM4fnqWQ9+VccI8tjFSq/yqLi1j9cixhH21bx
 gVJ2O/GDHRRha1ljW6ys2TG9FwQEHoNKUyPrCk6FQEggzmL+q5o9R8d5v8/KVqLVP1lWOiGa7r21LP
 F1Xb92S0KrefOBnAkP+5q8UE365lcAQoE4Y+4GGvr9GwHVnbHHwgi5bpsRJ+QEkmEetq1DWOnxW7kv
 5olTbozq86vjVFhls6KXGIQpMerdjlw4i72rvk2yA6YI1n64pqk3eYVP7L/ZJPt+XXsRJR5XPenQ4q
 j4yl1WnqjfjoUGJgidJ+R4GEbdwr7yoH/wWicOu6FqHHW1ARu878vtyh/Gs1I3gh4VemvZCSuWRlrA
 MvlSNpXVJIYcReMfFExJsSX+6+rah1WR9y1I47D/a8pcibKIDoQQJ6CmNxWw==
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

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..e89a2051648a97ea8a5870eb6f0a6e0fa7e880a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3656,8 +3656,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1

