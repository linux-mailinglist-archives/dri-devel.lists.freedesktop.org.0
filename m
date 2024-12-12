Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4D9EDEEE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 06:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC410E414;
	Thu, 12 Dec 2024 05:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nPNTCbkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FDC10E467;
 Thu, 12 Dec 2024 05:31:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD59G002087;
 Thu, 12 Dec 2024 05:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=y9+wJ+4THMZ6aKAeDHGQEFe1
 hJ+XvdzKUMLTnVrjnRQ=; b=nPNTCbkfWfCu1Te64iYQgIXGCFr8bTR33PE4GjrL
 9kVDhksvM8ujfIKTSZFleSwdeavUPq7cAvuAdyFGTD6UianYJ2zMVCK+dkESgpHn
 Ej5e9dBFYyr3EZCwTnh1fHJa9iaKen0r3icOq5f27zqDZhlekAKrZfUrIVWpHd0u
 ynf2kx7+zX/u0q+0Xw+suOzNnbHmotFLP0X9hLw2NmHGA1ACCZ2kuZfoUWbKhFL2
 0R7d/tdlT/nO7hjpuZz5+q2F8gmrv9mXFqjmbn3DHKmZzy4pqg4P+L1wo8rIsJSR
 63si0/SyuyHETlHcmZqV5BjP0xLY1rqB8CkCvaTL2+rFHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9v76c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 05:31:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC5V804029685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 05:31:08 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 21:31:03 -0800
Date: Thu, 12 Dec 2024 11:01:00 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Marc Zyngier <maz@kernel.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>, Akhil P Oommen
 <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Elliot Berman
 <quic_eberman@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86sequsdtp.wl-maz@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-GUID: tyQb_xK72c8u2XdN2OgQP_4VMJmSutu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=968
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120037
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

On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> On Wed, 11 Dec 2024 00:37:34 +0000,
> Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > 
> > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +#ifdef CONFIG_ARM64
> > > > +	/*
> > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > +	 */
> > > > +	if (is_kernel_in_hyp_mode())
> > > > +		goto direct_switch;
> > > 
> > > No, please. To check whether you are *booted* at EL2, you need to
> > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > none of the driver's business, really. This is still absolutely
> > > disgusting from an abstraction perspective, but I guess we don't have
> > > much choice here.
> > > 
> > 
> > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > available for modules? Do you prefer exporting
> > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > try something like [1]?
> 
> Ideally, neither. These were bad ideas nine years ago, and they still
> are. The least ugly hack I can come up with is the patch below, and
> you'd write something like:
> 
> 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> 		blah();
> 
> This is obviously completely untested.
> 

I have tested your patch. It works as intended. Thanks Marc.

> It also doesn't solve the problem of the kernel booted on bare-metal
> at EL1, or with a hypervisor that doesn't change the programming
> interface of the device under the guest's feet. Eventually, someone
> will have to address these cases.
> 

Noted, Thanks.

~Pavan
