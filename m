Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E885CC838B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790910E356;
	Tue, 25 Nov 2025 06:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nGru6I3e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdKXTqg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB4610E35A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gn261741250
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mTEpnqQDbzn
 otcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=; b=nGru6I3eZC4Kcyl6h6QAt5wjHNE
 p54D/D6y+YCW+milCaEbwqgSkbm5emB1ToEVha66h0J3d5C47xMcRadiuKI5aq7F
 17g5V3LcFsMGQVphlPRLd1KJ6FdRIwUtbfMa2wbOPM3e3nD8EBd21tCR/exefokk
 KD5s4ZZ4qfHXSqkpaaZyWQVYvbvg22xxzRuEsq/1mSzQtW7q2DJ2oUCrSDNA5rA3
 VZNAAsfRP84O7IepjIGTxO6PfG/WCBPcnJkvJAjtsPcHjAWE/rjXnso7KJdxy3Zs
 331vKNQ4Yr6svyaXhvmEtuZGXCTep3Us0zNCIb8Y+GrRqUPCTyaSZW7JPVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteba84t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2e2342803so1392441185a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053361; x=1764658161;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mTEpnqQDbznotcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=;
 b=RdKXTqg5NHILdX0unUeig8n2unj71H5WR9nUaEJPrcSNwMsqUFwYYGeQdhbAhiZLLX
 /XxsUoMoHrxQr+fjfifwSPdaJDW1H2SN4FXzON74wo0uxZ4EmYeNOkEyB/1vgMnBmBfd
 oK60YGiEXzoFTiDEMbKgHu+t1uylAuYwCPn93tb/fDNoC3KNJBN/MWgPZKpgTUHiblZh
 H0Vg/TGc9uNWdyVwijEuTsG8rtAIFV6HEiVaWB4xoyP9pKq3NKzhFuNEN8PR06LqtyL9
 U9/+Qzk5xSunSPYncGb0lrMAMaduD7HH2o8uJ3roSx5xPCNJZp+a1af0GdbcFARtsLiO
 KGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053361; x=1764658161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mTEpnqQDbznotcGF0MdKYZhvxCR/jGVEFQI5zYSrPmA=;
 b=dV0R0DhSgfSQjGH0PZGnFhDtzbFC2Qx2LyFKVvpgx0PV8nW0IFYfkDEZrQpjZi2Dd8
 PSQPnRlAIH17NR026AjuXgo1yVhSC7xGhtTgW/iUEj/0tNwq3JoeTzasbG73d0nLKWCv
 z1E0ikR/f84zIVsDQ5iqK0qNe16kAK21/HHzllNod4aBGtZpfl8GWOlVbnTB7AdtqmiW
 wkga6f4bqp8fD9mHBrLbLkQFBXydp01NePCxwZ0QeqvAPdI175Wcwe8BVLnZ2BoYGHdL
 kVGK4nhr2moVqNDJNJK93ydd8So5SKnlsfNDrtz5DATTDXsK8VDK3IQSe2zMsXF97cZ8
 62Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH/Ark5VTxCOghATJPvMVaUTuwrFbHI1ZKwUxaoB5g1nmfXZ9myhP+mbRSNPMpANOCemeyMeJQVTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbmxMvPXLSHyfHQxNIa2tHBjY+7B5JWt/mFhI8bb42JG4AdrOP
 aLx4kSAz3hwhAnX5RLo0kCiduYeMyY3G7yV39HamrSasdp2bDEdHAqNo4Tszu0GhbbRGM5GhUu8
 SZcrr2Kukibmvh3aonXYjWBhBVE2SVj1BnoVxOyJx7RW081IoHeIrXyYrEsyWdTQ5Gfhg7zQ=
X-Gm-Gg: ASbGncvg1nCBt//T1yY5Fhux5hpjxSsm29uU6mcTA/mwecNLv/4HCgglkGqOMy/0Jnc
 TcqDRzylj93eCBYeveNWPOhhH6EAxFpBoNkoL27jFqWHFTGOiDhWXUfWJWfPhH9ww1YMHHu/XgK
 TDfnEQm/5M3DClYIA+7IDMumyzaY2mRv+hnogd5uQ7ltVhiTqKkgZ+BusFoO7O39v3RelLfAPHc
 BF4UfHr6DEzpND3zIEWMr40dRR7sIKv7Tcb8fIrolFNYP0HNHCjnv4O45+rwuZ1CPhUILc0sRl1
 XFv/hCw7rLONKs58kSA1hQrQ2e5WhbOt3dIlwKEDeKKCk8AjBeNAhWdOfN9YRYwNiQv0nXU4QdI
 UulmyFqY3QaOiTL7CompwW4HbY/VIyfN+7hK1ND1c5knNy39S8j9WcGeWKe5D16ssvZmqCi0=
X-Received: by 2002:a05:622a:118b:b0:4ee:9b1:e32 with SMTP id
 d75a77b69052e-4efbd90ca3cmr25013031cf.12.1764053360779; 
 Mon, 24 Nov 2025 22:49:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGplJtM6PIhFpmRcTZ2wr4latOAgppymuITWXHdQsTlNhCo4gWclBzktAKtg0xrwFlPEesmIg==
X-Received: by 2002:a05:622a:118b:b0:4ee:9b1:e32 with SMTP id
 d75a77b69052e-4efbd90ca3cmr25012451cf.12.1764053359837; 
 Mon, 24 Nov 2025 22:49:19 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:19 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 06/10] drm/msm/dsi/phy: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:54 +0800
Message-Id: <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: geEcPqGOh5UbcLI0SShIMDMZ63bdvZI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXwrF+Nw8wFQLE
 CVfoZPkTiydePjuDtWMdeivI7SOnBREn4LfKbyNAGKjRuOt7A17SBDSYNfON5T9BA0V6Y+VwUOe
 WencC7Esbh8Prz9n2/BkCI7hb+ctWij+lJWaQGjXh9D2b//DpXIJymhfALyIJeTg7PfCg4X6eHc
 DVPCQXxmPiqBy9oL4lLDnL8emfDcUEs9U/BdDZEdchqd1hFzNwkw12/KZYbM8+FTZMgz/hsw8Hu
 GxMHTNbFzWBbbq86lEeYJHP67RAtWl7F2ZE5I1NDPD+SO7hY8F2Tw2bDb0sPTy2UcwIiJUgkW1e
 OT9v0takvKcJnFcNkLGIJj/GrDDznMMfqLvMdSo63QG8dJdJhUhziivFXwEYETPpnNwxJD8W60Z
 +INzXxyxnVjxZHGrSNs4obbTTCvL5w==
X-Proofpoint-ORIG-GUID: geEcPqGOh5UbcLI0SShIMDMZ63bdvZI6
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69255171 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650, However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..c01784ca38ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

