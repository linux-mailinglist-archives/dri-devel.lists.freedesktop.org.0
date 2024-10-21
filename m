Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73D9A9303
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 00:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BAA10E5B8;
	Mon, 21 Oct 2024 22:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SD2QvFNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7910E5B7;
 Mon, 21 Oct 2024 22:09:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LKfrJ0029542;
 Mon, 21 Oct 2024 22:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wpi7o+07TDt9MzAXwaqEjlsG
 7+hYbr7RYO3nHtxlHmo=; b=SD2QvFNjfRKCxEmdlgivknQwgtNpKaChveNeCVqg
 oaYYKP0Q+wS7V+d/F0ZA/B3vaaph6ZO/8zK/kyiQcYXbGIQi7QIRoC0+XD4t/AG8
 aA3zJSoLv34YwX3uZTrYnTBaAEADleKh9HsMiG+xzl414/3rUQ6KjxsrCrhPRe6l
 wjMzULcJhSGLaPjJAbHd5FffmTzFU4yAcuoABU2oSnsOElyCZr7z0vXGZtU9byoB
 VHtIVSgoZV6HkafQTqDHPZtkdDBT9e+B88Mvx0YdiS5CLFeXawgE7QyQWMDLC7YD
 70xE7olMEH8e/r31qbza/tQyquRl6HMIwb1AM/z7MQn6yg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc67be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 22:09:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LM9OXp029974
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 22:09:24 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 15:09:18 -0700
Date: Tue, 22 Oct 2024 03:39:14 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
Message-ID: <20241021220914.vrxiyeoxjyxweovu@hu-akhilpo-hyd.qualcomm.com>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
 <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NsB4opqiPqmhR1jwMIwzlPqCN0S6yBOw
X-Proofpoint-ORIG-GUID: NsB4opqiPqmhR1jwMIwzlPqCN0S6yBOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=985 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210158
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

On Mon, Oct 21, 2024 at 11:38:41AM +0200, Konrad Dybcio wrote:
> On 11.10.2024 10:29 PM, Akhil P Oommen wrote:
> > ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> > the power consumption. In some chipsets, it is also a requirement to
> > support higher GPU frequencies. This patch adds support for GPU ACD by
> > sending necessary data to GMU and AOSS. The feature support for the
> > chipset is detected based on devicetree data.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> 
> [...]
> 
> > +
> > +	/* Initialize qmp node to talk to AOSS */
> > +	gmu->qmp = qmp_get(gmu->dev);
> > +	if (IS_ERR(gmu->qmp)) {
> > +		cmd->enable_by_level = 0;
> > +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
> > +	}
> 
> I'm still in favor of keeping qmp_get where it currently is, so that
> probe can fail/defer faster

Sorry, I somehow missed this email from you until now.

If it fails, then it probably doesn't matter if it is a bit late. But for defer, isn't there
some optimizations to track the dependency from devicetree data? I am
not entirely sure!

Since qmp node is related to ACD, I felt it is better to:
  1. Keep all acd probe related code in a single place.
  2. Be more opportunistic in skipping qmp_get() wherever possible.

But if you still have strong opinion on this, I can move it back in the
next revision (v3).

-Akhil

> 
> Konrad
