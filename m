Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE4A38EBF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA6110E043;
	Mon, 17 Feb 2025 22:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L/otBlqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A5D10E02F;
 Mon, 17 Feb 2025 22:10:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAisBn004459;
 Mon, 17 Feb 2025 22:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LZO4RmAwdWvHhYb8qMLxm/nSTg9V+VwwT6x0u1skeEc=; b=L/otBlqE+gbq85BM
 WgeeUrcJCMrF36W4W3MNERaOVQUehpx5Uka7cr1KpRacic2xBhZCLac+K2MC3P1i
 zju9KIh6k3FjaOpD8g95dSrdM9xr7azTUYO/BX4p//ucL1OdfA7vsFrlLQ0Ck7zj
 kWyBiVr5YLWj1JRZJ4R9qfaiQ59n67iQlnobHQDb4yyBsYpUcxLeSrzh9Zxwtfxy
 SLV/kg0Gdt8DC+avPjcLhz27hFMyIw5G145d7c25KSoNuqBNViKe/zCcn/zHO/+R
 4wvVPdaQkBCZay5MNZDpye56Na/9LK1sDj2HXIsXEg/YZj1W7jN/SHyan2uu/5pm
 5Wglfw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44v3mg1duj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:10:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMAiIR004908
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 22:10:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:10:44 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 00/35] drm/msm/dpu: rework HW block feature
 handling
Date: Mon, 17 Feb 2025 14:10:26 -0800
Message-ID: <173982978188.1706705.18136509869048284263.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rlyp48cn0jiv6PkP1lfCgzG4n7DNNeOI
X-Proofpoint-ORIG-GUID: rlyp48cn0jiv6PkP1lfCgzG4n7DNNeOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=927 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170173
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


On Sat, 14 Dec 2024 00:14:16 +0200, Dmitry Baryshkov wrote:
> Some time ago we started the process of converting HW blocks to use
> revision-based checks instead of having feature bits (which are easy to
> miss or to set incorrectly). Then the process of such a conversion was
> postponed. (Mostly) finish the conversion. The only blocks which still
> have feature bits are SSPP, WB and VBIF. In the rare cases where
> behaviour actually differs from platform to platform (or from block to
> block) use unsigned long bitfields, they have simpler syntax to be
> checked and don't involve test_bit() invocation.
> 
> [...]

Applied to msm-fixes, thanks!

[01/35] drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
        https://gitlab.freedesktop.org/drm/msm/-/commit/2f69e5458447
[02/35] drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
        https://gitlab.freedesktop.org/drm/msm/-/commit/af0a4a2090cc

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
