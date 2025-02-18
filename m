Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBEA39058
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 02:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8923B10E32B;
	Tue, 18 Feb 2025 01:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="I9SHbfJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE43D10E32B;
 Tue, 18 Feb 2025 01:23:44 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAg5va014197;
 Tue, 18 Feb 2025 01:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qMEutTQVuGjBpi2D26yi/Ff62sncQlmCdz6+YwL3Rkw=; b=I9SHbfJdDRfxLLcQ
 OMZcaeo+ERBKdhronzl3b40hibxW9hzXFr4YrUFXV9qxfIF+Gz4ypbTl5UPVXXCB
 JZ5TA7t9cVlPSghFYLGTwJGKVJ3NXaLP9cExGAp//XvLKNN4YQAD9SOSF2QZK8xe
 ImNo1n/HfgpX3H9gzuFY7kwLvkj4FaOMblasU/DcMm0Hx6PqVio3VNZjEWvpAaiz
 AXhF/CC2bD+lXt4nvF/h6Lc0puPOikI96C2NV4P5AnFo1lOQ9iGfhZIJ1TxfnqAp
 iBXmmNccpQqCe81YbNzgUKMWmhazLJIH+DY1xFizh0QPedOYiGNJCTNJPdZIjaT3
 NLfLrg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tu7xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 01:23:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I1NebU007543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 01:23:40 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 17:23:40 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: (subset) [PATCH v3 0/4] drm/msm/dsi/phy: Improvements around
 concurrent PHY_CMN_CLK_CFG[01]
Date: Mon, 17 Feb 2025 17:23:29 -0800
Message-ID: <173984160581.1759776.15253644637290957859.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yik5yCM9l82EwYzBK7JPIH-3VsrL1uxf
X-Proofpoint-ORIG-GUID: yik5yCM9l82EwYzBK7JPIH-3VsrL1uxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=782 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180006
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


On Fri, 14 Feb 2025 16:08:40 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Define bitfields in patches 1-3, so move there parts from patch #4
> - Use FIELD_GET
> - Keep separate cached->bit_clk_div and pix_clk_div
> - I think this implements entire feedback from Dmitry
> - Link to v2: https://lore.kernel.org/r/20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org
> 
> [...]

Applied to msm-fixes, thanks!

[1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      https://gitlab.freedesktop.org/drm/msm/-/commit/588257897058
[2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      https://gitlab.freedesktop.org/drm/msm/-/commit/5a97bc924ae0
[3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      https://gitlab.freedesktop.org/drm/msm/-/commit/73f69c6be2a9

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
