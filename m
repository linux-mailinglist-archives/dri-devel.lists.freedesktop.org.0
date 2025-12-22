Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561DCD58EB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F108D10E5F8;
	Mon, 22 Dec 2025 10:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjWUDFfQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAgKYZJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471C10E5F4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM5hBPs2191547
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=r5yEEbJ1h77
 cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=; b=SjWUDFfQc+mpaVxxFqvCDxq3/qu
 FEXsBPNKY/k3yowBwXnpEW/FCvS79IR+SXEjRW9YgouJvC9UZWMbjiCZlgfQDziz
 kRQIsYgVbdAX6L9zM8c39VM7GHxp2zZcDGDn7kUBuWb0cSd2a8bLd4gzkg+0WqqU
 MAAHgysJkaOxwpy+6tFIPpbwNsJ0k5Y0isRQaJr3DNlj7Wck+VUtuyk03AkFj6mV
 8M/wlBF+nhVMLwAKFubEJU1GIKnbRR76hH3MA1V8P584cBrldNFpV/DOZ4t5gnfa
 ufuHMainpBfED6/Q1asUznXH55sWEf4h/SmGlKhpI9oBGvPNo6rFozDH98g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8ucg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a316ddbacso93140606d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399097; x=1767003897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
 b=VAgKYZJMo2kALg8whgFcKHr8UUK+DPDG9rWfTQxS6EsPc0d5ssenX30LYUfJIa9H6V
 r3Pm+cH0A61JV7STJvSfY7vzhDEtNsY38mEi3Fqbf+n0420qxnuxeEXt7aZN+oBvJRLm
 7SkiOYdJ35gvrXaffE7KMjVeoUG085/qvtrJ54X0v1spVVM5aKF1n4OiOoJFg5oEtQw9
 PkBFH6D+Av+N5GCluP4+y5o5YSQcR9lneRcf0U0o60UHfQ1bDv8PAYkDynLQw3oPmTEX
 cjWbwhw5ugxaPC+W/h9OhJXFe+9epND6aJU4+Yzs/qNimE7WzJYkkQXNfO/MmRJ0qfa6
 af0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399097; x=1767003897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r5yEEbJ1h77cc5KTEZHgojGWBkSJ/q25QiaB6fdvsdE=;
 b=u5J6eZ8XzuA4tXqLUh27zP9CzZbKuKhkECmuX/Vbq5EadKN03NEL22/r/vor16zqs1
 Pc02MRs17sAw9nqCR7BiMRIRUeFVMrwjUilcwct7WxDwruDCBJf1BEQbAsjbhe9D/IHx
 HoKI2/GjKnCRfFNu3ivgCxZJcV/4x/scdyGQasrPBy1kDWbNEV15fJlsww1183zKDap/
 tLoLxyemb0vSiBJUuRTbwoUBep8mQjIOWQCqjXx8W7x9emaQ/JPOgMsgO+4aAOc9MIUF
 G3askWvVjkO4Fo0b4oSJhNF3Jj/h1I0lIwaWQF8SqiYt665S0J7Ii7QqKZQEG6nj9R9W
 jv0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0WDKnDOkZ8YKcckniqMRBdD2wUl3BYZ3m3RS29LUzXBxKZUe1sP1vbdDWb+O64WF7ffDd/y4JuQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+uw/S+7Su2M7hiX4tfcOTAHyiCMUS7rwggPm//JaO3Mkg1ljr
 xyIqTIwfDxv0aUrpe43PtXoQFw9diHOE8UYeBIqsF+sc9dsW8ZQE55qz89mcFTf4lSMpXkD18tV
 rIws4fO4ueU7j9GSb59zR6YNbPni2y9EAWNLa111T63rK/vXD2q2x42yqo0F33UbgjYg9UI0=
X-Gm-Gg: AY/fxX6bh2loXzwG6KubV17REsnb0X1K/Gx+X0yIqGRReNVoWf006DV7VKOBKroqKEG
 ySE6iZS72g81TnxDAqx7HOEA2PsHLWMeb8LJkDbpMGM5WW7b+zBoOCvZmGdVqlqgX+H50VzxQwO
 Qqgw2Q71S4To/TaspZqfPLLWIdtTlD8hP6puqqL+gJ3nxcGyI/M56MSUIXfyG3DWgsYl4hRHlPO
 pMTmzVduDsRwl+MmWFuRmD8YPf0i2IMzv0RLIpA1E6ZoDNtLQyNF67tiqUqP7a8CAtGY9M4d9c5
 pDxL/4VuUzjKFQTwjvTd2JOMEnuhxv8J8ORP5V1pI1wj0lMYPxWwB4I5x3SI9GmgcRzlioTJWjT
 gGHeeXNcMyzYzbHwmtRmgpDmjAFrGSgdg6K1vHbYlW9jy2DwfXOZji3AUm0+Wdngfuf4=
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr184689706d6.37.1766399096784; 
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1CYIqkjr3zp/RkKgn4YLOMNIlAJHmGvQ9whNuk0P5xefXhTdEEm9trZuQpyBGny8zBVJ6wQ==
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr184689416d6.37.1766399096353; 
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:56 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:54 +0800
Message-Id: <20251222102400.1109-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69491c79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hYg4dbXq4j5tZlskCswA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 3CNr5LxqLQKT3Uok5dx22BSwFIbacW7U
X-Proofpoint-GUID: 3CNr5LxqLQKT3Uok5dx22BSwFIbacW7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX7xvoItoDPVmP
 0OSESO/2dIgcaN71CDWd/pg1SzrcBgcHtFQmk45dQLrhp0IwgjgsoKjtOHdZmKFWW6cqWqgQJJO
 jvq2UCEvtXs50w/pPbsFXqaJQ1XHuwOyImyZIr2ZT08BO92po874pfbvKrviEFHEyw3PPW096Tk
 XMvnn5OLnvkqYIDo/6+eDCnOxglc65JW1b9hRO+eIQ6k/P+vWTO/yv669Q9J3LhOcAUNCRHp7Jw
 EYfnqPsrjJ3mkFpQVxDh1+ADz1XH7qNEb0GhaEPwQAzEsUxKWhrU9dZS/77sznFLU98i0rfpBxO
 LRDBtb6VA3fcfxYmLSFKz+yvpNiiYp7ytW3hT/BKHnYAqPWN91z2O++GexQh6yfWY+kS02O/MS/
 uB3d2a5VyTxMsHFVt5+WyoOtIbz6Z04lbosrBk+eyQETOP92DaWXSLnQ7L/b8Leds1eh7ew/frE
 fZWCWwgtwYlc5g/Q7Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

Add mdss support for the Qualcomm Kaanapali platform.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..7d78d16f8802 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_6_0)
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
@@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -554,6 +561,7 @@ static const struct msm_mdss_data data_153k6 = {
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
-- 
2.34.1

