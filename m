Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1640C19319
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864DF10E765;
	Wed, 29 Oct 2025 08:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAzbAbsB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3arr1g9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9286B10E765
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4uwjh3676847
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=EdJ5XVwZjIQjSum2gO2eMz
 oDRkugukciTJvMI0vr8xY=; b=VAzbAbsBqo2dGB8cRvOB6TTIhl7WTRAwvg0zh8
 T66C46wR/5Lnhqrmr1MElHUmYSaAE50PlpxMLJ5Tt0+uH67O11a51R5Vyn1Y0jde
 Swpx514DXclt1+oDxejTu8r4pWQOLupku6ffKO/6zGpW/Ohq7RjhsPwEGRrXobnp
 AATH+lYurjz+hIFaTeq4I/+x8hNQs2s69l1lwdlZ99kQelApHdrSOHDP44F0eNSg
 3uuypl1kP3O2WLfIhy4cKQjBNMeGhJatzBYUNj+FmqWm0wKdXRZ68NqMuGfqqtcO
 sM2Bg5PHdMMZfE4jPku6ehMLbOPteK9IMGy5DPUTueOKxxGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hugk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4eceefa36d0so121240311cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727908; x=1762332708;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EdJ5XVwZjIQjSum2gO2eMzoDRkugukciTJvMI0vr8xY=;
 b=I3arr1g9cI0F9Be2HIxsuhQqWy5RXknd+epCeRs+HqJfYRp/iXrd18/VKkFRMN/AV+
 No/LAcYr5ECVvKwmfU93mgDu4zpOvcoBUhvEz0IrqRnglAq5ogUjtzp6iUDZi5KIrUUK
 X5wLSFEEbtk/YO2XmJQilk75iIu5LWKJ8r4jz0yOswZ5N9BjRwMRVqYBQpZ4TdFVNImm
 ZKD62xigjk+guNkEORWkXEjj28CRTiZE5Sq6aKA4eO32P0BL08St0OuMGmMx8aO4s2Zj
 GgGTHUqkqgaSanc8XTHQ2oWGN9hHaTfuJuup39FKp9ju3M5sngvvD8mCgH+npqESRa4/
 t6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727908; x=1762332708;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EdJ5XVwZjIQjSum2gO2eMzoDRkugukciTJvMI0vr8xY=;
 b=PGLoKR5eQx+1JAbah07W85NnW7Y/NoO8y4bQKwyQHjdpq587YDHm652Xmw0Oo/YTkN
 1HdlPPUUSD8rD+J4E3Y/nbUDDr3QHdeHeidxAWOdSo80lRahmXYknuE8RkmLPwQYNw6w
 8EO/IYDbjk0GEDFM6p8IeOuZJ7xChEvMqaX9eN2da6AraneUgRAVt940CSXInELPFNNp
 +kjETNQED9R7IsRUJzaUNfsgF2ntL1+W9GE+nWlDSjMx7PQrcLLa7honPb7EPTQWtzts
 VR7JpJwqbmHGCYEqKN0HZ8YLjyeIuJtnMJUlKcD052FzqTYWxkHy2vgXtIqYt3gJEXVa
 jl8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4R8nn/jRDSD27P3Y6LAnafxmqy0ydr/PgOW0AuZt1maMR3cPfBStBsDw+a3lCMvIHV6MUGmRcM80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1qYn8/uWPMApabikHUIQPYwhLO0u2hI1On1qS5kr/k79td2nc
 BhJRACbAePkI14JQbykCGpz0aYlrUCVPee6N/DJHn0BHbMIdvZLJIqoobnDOMs2jx/y04dI88pY
 RkkUieWjPV/2UtX1J5usXgwWQz06gflJQv7YAhm4F9FmN3XgnfV9e64ECq7czqjPHsN89ED8=
X-Gm-Gg: ASbGncslY2bMTnfVl+TkyLqO/V7eU8dAaEe/POoR6Iag08olaeuJvj76b29G7Zes2Tp
 JvzZi6EjV2pOPKMeyivgsNtXAQbLIQopJ7zlF4RZJABgAUsqICNxZtVwflyWan7SMICkbl1p/yl
 LOlM5GvkX/cWeX1yD755/8rlqtrYzasRJM9kU9VcmD1zUER2AH615A4DeIgCh5YOO1DLMveOcRw
 yZsJoqTAWif0Buq5BfyALI/o5NIuPMcnd3IFREwVSgCxFOvEVRnwhASnrWAuMXd8saxaDaM7Wko
 hx8OIe07uNQ3zEz5g33gKPbW3ctict2iE9TCl+GuS6XL3QHMPGP32GLNSy2Mj8zWHhJFT0EKNfy
 /sQv1PRLpSnJ4O+UiY7X5VMI=
X-Received: by 2002:a05:622a:830f:b0:4eb:a3cc:1ac9 with SMTP id
 d75a77b69052e-4ed15cd5915mr23441381cf.77.1761727907546; 
 Wed, 29 Oct 2025 01:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuNmVSmGqIKXdVzY2SGwPRSg2aOaIBQSTK6fVMuCo0haTiXSz+hHplbi7mGl/WuWNIGZgtuA==
X-Received: by 2002:a05:622a:830f:b0:4eb:a3cc:1ac9 with SMTP id
 d75a77b69052e-4ed15cd5915mr23441151cf.77.1761727906925; 
 Wed, 29 Oct 2025 01:51:46 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:51:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v13 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Wed, 29 Oct 2025 16:51:33 +0800
Message-Id: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXVAWkC/3XOwWrDMAyA4VcpPs9FtpNZ6mnvMcaQY3k1rM0Sp
 2Gj9N3npoN1Zb0YJNDn/6iKjFmK2qyOapQ5l9zv62Dcw0p1W96/ic6xLpQF2wIa1ENX0AG87mI
 pmt2jSxAhMARVTz5GSflz8Z5fLvMow6Gy02WpAhfRXb/b5WmzShTYWA5da9GGRGQTMbGg54imS
 REcg/WgztY2l6kfv5bU2S/YTxT9jZq9Bt2Q960k45rUPPWlrIcDv5//Xddn8Wa8Mqy5MbAaQkG
 wdeQw0R2Dro32xqCzESKbKAgdwx3DwC9CcBtioCroOw5eGmz8fyWn0+kbfMfA+MoBAAA=
X-Change-ID: 20250818-qcs8300_mdss-a363f0d0ba0b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=5550;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=7kVlbAkDCQCDe4aVtg3u6UMy2XxDPO1ooPBBYjc+2TY=;
 b=OteZacENOO2t/4eWZgxpGCtymwEtS3GsBK0GFrHl6ziPCKEiuMlE2oJgYA9mMx014AfDGIXhf
 4KkYh5mMHxSAQN1Ie07rx9kZuToORBsOeGUnhtTLkZvIKMsP95UQLp7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901d5a4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=A9Q8OG8lNi9f-aPTaEwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1cwICC6lxMF4ZOPnkoexdS7-nNtRjjWD
X-Proofpoint-ORIG-GUID: 1cwICC6lxMF4ZOPnkoexdS7-nNtRjjWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NCBTYWx0ZWRfXzDZGtDYYjBVs
 4c9C1rGmIJGTtKHrtJ+pr9CQ+Yd90VgdVYgilbTq8dad2dtKmflcXAXGSAeIagF0hkZTTUyBDmF
 D6v6dH2eKcHhUwj2JB5jU8UgqTthnllDWmSypBaWFcpbiyS5nE9Zo4IW8SVK1wEozZDKze+bH1f
 ooNwGNcyDa/ZaZvcH2kmcxL3DKmLlDRfQEtMZQjDaV7c1QG1cciX/HOhE0gfqq+j3XWzuSYL3nn
 esEmhdxBDMo2BzQk0Lr2Riyq9i4S0+MxCJBP8VV9jK6Z+4dyL6uVAms0V+ay0Sfe4KD+eI0+pEm
 nbKwFibr6W8vz17p4Z2jYq11cpAN5pir7QWX6/tQHa82k2XG0/loHlQXnKyAZ+ygAyEPHIjr+le
 XoHq9b+av3krJxFTm/CmXNGJPP4ksw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290064
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

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v13:
- Rebase to latest linux-next and remove dependencies as they are already merged.
- Add back Reviewed-by tag for MDSS binding change.
- Link to v12: https://lore.kernel.org/all/20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com/

Changes in v12: Fixed review comments from Dmitry.
- Use SA8775P DP controller as fallback.
- Remove QCS8300 DP driver changes from this series.
- Update the corresponding modifications for the QCS8300 MDSS binding and remove Reviewed-by.
- Link to v11: https://lore.kernel.org/all/20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com/

Changes in v11: Fixed review comments from Dmitry.
- Rebase to MST bindings V8.
- Update the clocks-name for QCS8300 in dp-controller.
- Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com

Changes in v10:
- Rebase to MST bindings V7.
- Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
- Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com

Changes in v9: Fixed review comments from Dmitry.
- Updated the description of dp-controller DT binding.
- Add new clause only work for QCS8300(one DP controller with 4 streams).
- Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com

Changes in v8: Fixed review comments from Krzysztof, Dmitry.
- Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
- Fixed incorrect description for ubwc change.[Dmitry]
- Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com

Changes in v7: Fixed review comments from Dmitry.
- Rebase to next-20250818 and 4 pixel stream series V6.
- Add more description for the dp-controller dt-bingding change.[Dmitry]
- Reorder the MDSS change and UBWC change.[Dmitry]
- Switch to the OSS email.
- Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com

Changes in v6: Fixed review comments from Konrad, Dmitry.
- Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
- Optimize the description in MDSS dt-binding.[Dmitry]
- Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
- Add the DP controller driver change.
- Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com

Changes in v5:Fixed review comments from Krzysztof, Dmitry.
- Rebase to next-20250717.
- Change DP compatible to qcs8300-dp due to add 4 streams support.
- Add QCS8300 UBWC config change due to rebase.
- Add 4 streams clk and phy in the mdss yaml.
- Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com

Changes in v4:Fixed review comments from Krzysztof, Dmitry.
- Use the common style for the dt-bindings commits.[Dmitry]
- Update the commits msg for the mdss binding patch, explain why they
  reuse different platform drivers.[Krzysztof]
- Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com

Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com

---
Yongxing Mou (5):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   5 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 5 files changed, 303 insertions(+), 5 deletions(-)
---
base-commit: f9ba12abc5282bf992f9a9ae87ad814fd03a0270
change-id: 20250818-qcs8300_mdss-a363f0d0ba0b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

