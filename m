Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED449EC52B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DD510EA69;
	Wed, 11 Dec 2024 06:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cwx5Gojo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3354410EA29;
 Wed, 11 Dec 2024 00:37:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGa3Uh024768;
 Wed, 11 Dec 2024 00:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bmIRd3iGai9B8GwQnitcTjV6
 mPEycuUXQCqAtqWaspI=; b=cwx5GojoORS34usLwO6coUU47gO6SMjRDwh+Gz0Q
 7xzGgYSS22GTCw0bCquQtxw6NunQm/Cudm5yjax4Cvcgit3494QMcWMac89qE0sv
 MUmFU+3hvVHIWDao1AnK/b9v/4TVaGqs8x+sGoXL9uWH7fmKsTdYGnsIvPZqXbO+
 DBBR09U0cAmS14/2+l6Hogn8wNtSxsUQ14kuLpvXC5QUCz9EBfui1p5dosR3i1jn
 W5Wzgy47NK0Y8X7GfkNegIxG95AgIemN7Hmg2GQUNspvaRo8DYr6Fw2zYCplJxyd
 fE83H/3y5cfYHAm4Qf9Wkelfxgt3KYeAgkZ2VjJsPUju3g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceettc8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 00:37:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0bgdg009896
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 00:37:42 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:37:37 -0800
Date: Wed, 11 Dec 2024 06:07:34 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ed2fs03w.wl-maz@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-ORIG-GUID: ZVxb1h32_u863zORd3fXSAbJrr3RcbYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 mlxlogscore=839
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110002
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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

On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > +{
> > +	int ret;
> > +
> > +#ifdef CONFIG_ARM64
> > +	/*
> > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > +	 */
> > +	if (is_kernel_in_hyp_mode())
> > +		goto direct_switch;
> 
> No, please. To check whether you are *booted* at EL2, you need to
> check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> none of the driver's business, really. This is still absolutely
> disgusting from an abstraction perspective, but I guess we don't have
> much choice here.
> 

Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
available for modules? Do you prefer exporting
kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
try something like [1]?

[1]
https://lore.kernel.org/lkml/1443649252-10702-1-git-send-email-ralf@ramses-pyramidenbau.de/#t

Thanks,
Pavan
