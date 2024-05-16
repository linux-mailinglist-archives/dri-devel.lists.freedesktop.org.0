Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B18C78AA
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B52010ED13;
	Thu, 16 May 2024 14:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h+rLoDzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3251810ED13;
 Thu, 16 May 2024 14:50:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8wWer027342;
 Thu, 16 May 2024 14:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=7LC7lcmJyov9Qi/efmiSV
 LbqbpOslruMoQMnmaayvGc=; b=h+rLoDzSfJm971uPBV9guJzeWth+r4jJSs6YE
 AGpwRWaU3+p1i5/2HMZpFIwMdJqR5xYeM6T4RpP4ExU8InVlaM1YZGYUh90LxN7e
 SnAoFn2mUDRRPH7x3gtdfmRLxL9kH/yVTvf8++Jv6DRHzfdnsYOHhVvKsHpchvOA
 N7ARMaSb85e6Lyy8wadVJ3/hToco06bJ5J9852t6d2nUFHzV6Gw5lDNy1KOW0smj
 FZvh2l3wtqmAizGi3LCcbiGLksbnm8c8S+6ZX+7UeWxmbslgwenYP/sI+YP+ONJ8
 OAd07XBpjg9M6wuFWXtHlHiuiuHm/O3CFZCRWgHNWM8gkXEjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvxhvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 14:50:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEoErJ026535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 14:50:14 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:50:09 -0700
Date: Thu, 16 May 2024 20:20:05 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Andrew Halaney <ahalaney@redhat.com>, Will Deacon <will@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HCAGNcshZ20vdCVu8DRxPqG465O0ngvi
X-Proofpoint-ORIG-GUID: HCAGNcshZ20vdCVu8DRxPqG465O0ngvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxlogscore=966 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160104
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

On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> On Wed, May 15, 2024 at 12:08:49AM GMT, Akhil P Oommen wrote:
> > On Wed, May 08, 2024 at 07:46:31PM +0200, Konrad Dybcio wrote:
> > > Memory barriers help ensure instruction ordering, NOT time and order
> > > of actual write arrival at other observers (e.g. memory-mapped IP).
> > > On architectures employing weak memory ordering, the latter can be a
> > > giant pain point, and it has been as part of this driver.
> > > 
> > > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > > readl/writel, which include r/w (respectively) barriers.
> > > 
> > > Replace the barriers with a readback that ensures the previous writes
> > > have exited the write buffer (as the CPU must flush the write to the
> > > register it's trying to read back) and subsequently remove the hack
> > > introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
> > > status in hw_init").
> 
> For what its worth, I've been eyeing (but haven't tested) sending some
> patches to clean up dsi_phy_write_udelay/ndelay(). There's no ordering
> guarantee between a writel() and a delay(), so the expected "write then
> delay" sequence might not be happening.. you need to write, read, delay.
> 
> memory-barriers.txt:
> 
> 	5. A readX() by a CPU thread from the peripheral will complete before
> 	   any subsequent delay() loop can begin execution on the same thread.
> 	   This ensures that two MMIO register writes by the CPU to a peripheral
> 	   will arrive at least 1us apart if the first write is immediately read
> 	   back with readX() and udelay(1) is called prior to the second
> 	   writeX():
> 
> 		writel(42, DEVICE_REGISTER_0); // Arrives at the device...
> 		readl(DEVICE_REGISTER_0);
> 		udelay(1);
> 		writel(42, DEVICE_REGISTER_1); // ...at least 1us before this.

Yes, udelay orders only with readl(). I saw a patch from Will Deacon
which fixes this for arm64 few years back:
https://lore.kernel.org/all/1543251228-30001-1-git-send-email-will.deacon@arm.com/T/

But this is needed only when you write io and do cpuside wait , not when
you poll io to check status.

> 
> > > 
> > > Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
> > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > 
> > I prefer this version compared to the v2. A helper routine is
> > unnecessary here because:
> > 1. there are very few scenarios where we have to read back the same
> > register.
> > 2. we may accidently readback a write only register.
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > index 0e3dfd4c2bc8..4135a53b55a7 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> > >  	int ret;
> > >  	u32 val;
> > >  
> > > -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> > > -	/* Wait for the register to finish posting */
> > > -	wmb();
> > > +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> > > +	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
> > 
> > This is unnecessary because we are polling on a register on the same port below. But I think we
> > can replace "wmb()" above with "mb()" to avoid reordering between read
> > and write IO instructions.
> 
> If I understand correctly, you don't need any memory barrier.
> writel()/readl()'s are ordered to the same endpoint. That goes for all
> the reordering/barrier comments mentioned below too.
> 
> device-io.rst:
> 
>     The read and write functions are defined to be ordered. That is the
>     compiler is not permitted to reorder the I/O sequence. When the ordering
>     can be compiler optimised, you can use __readb() and friends to
>     indicate the relaxed ordering. Use this with care.
> 
> memory-barriers.txt:
> 
>      (*) readX(), writeX():
> 
> 	    The readX() and writeX() MMIO accessors take a pointer to the
> 	    peripheral being accessed as an __iomem * parameter. For pointers
> 	    mapped with the default I/O attributes (e.g. those returned by
> 	    ioremap()), the ordering guarantees are as follows:
> 
> 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> 	       with respect to each other. This ensures that MMIO register accesses
> 	       by the same CPU thread to a particular device will arrive in program
> 	       order.
> 

In arm64, a writel followed by readl translates to roughly the following
sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
above? I am assuming iomem cookie is ignored during compilation.

Added Will to this thread if he can throw some light on this.

-Akhil

> 
> > 
> > >  
> > >  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> > >  		val & (1 << 1), 100, 10000);
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index 973872ad0474..0acbc38b8e70 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
> > >  	}
> > >  
> > >  	/* Clear GBIF halt in case GX domain was not collapsed */
> > > +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > 
> > We need a full barrier here to avoid reordering. Also, lets add a
> > comment about why we are doing this odd looking sequence.
> > 
> > > +	gpu_read(gpu, REG_A6XX_GBIF_HALT);
> > >  	if (adreno_is_a619_holi(adreno_gpu)) {
> > > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > >  		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> > > -		/* Let's make extra sure that the GPU can access the memory.. */
> > > -		mb();
> > 
> > We need a full barrier here.
> > 
> > > +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
> > >  	} else if (a6xx_has_gbif(adreno_gpu)) {
> > > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > >  		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> > > -		/* Let's make extra sure that the GPU can access the memory.. */
> > > -		mb();
> > 
> > We need a full barrier here.
> > 
> > > +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> > >  	}
> > >  
> > > -	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> > > -	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> > > -		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> > > -
> > 
> > Why is this removed?
> > 
> > -Akhil
> > 
> > >  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
> > >  
> > >  	if (adreno_is_a619_holi(adreno_gpu))
> > > 
> > > ---
> > > base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
> > > change-id: 20240508-topic-adreno-a2d199cd4152
> > > 
> > > Best regards,
> > > -- 
> > > Konrad Dybcio <konrad.dybcio@linaro.org>
> > > 
> > 
> 
