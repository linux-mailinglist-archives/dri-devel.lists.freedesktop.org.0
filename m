Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345974C879
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 23:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434F10E12A;
	Sun,  9 Jul 2023 21:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7A310E059;
 Sun,  9 Jul 2023 21:51:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 369LoqsD006096; Sun, 9 Jul 2023 21:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=//hNLQCxQJojF0Z4grwBRq1Jh4qS7v4et90KGoyFSvs=;
 b=iCCGMdQMpzGb/cRyT0omvIye65FQbG6Mm7rNyFss/FhrJtg3gXt8/x0h54VNjwUN+N43
 1kTdGzBRCe5LsCMW+g6WE9xRfZdeDumVJLV48yYQK54ZziHBjVgsunqO0rK4Jt/GB+53
 GhnEyvGlAtYVkfeDtFAPu9wV14/PWbdv95XkR3sxfaeuRrKnNxPrmxpQIhmAeq4pr6f6
 VlalzE8njy8hx20VPSnp1jCm55jKLq8F7uw8/2le0bgv0/SJDXekyAffcKPJwcm2GrSw
 LInvGua/d1Vwm+iyQekzjnTdIsztRKDBdIT1t55xeUY6zu7qAajBzlXx33EwYULtvTDT pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpxry2565-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jul 2023 21:50:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 369LopR2028736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jul 2023 21:50:51 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sun, 9 Jul 2023 14:50:47 -0700
Date: Mon, 10 Jul 2023 03:20:44 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jordan Crouse
 <jorcrous@amazon.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Check for the GPU IOMMU during bind
Message-ID: <2xnvyjlwuxft2uk2pirlbvbrg7krcb4alz7yyna72g4t2qrrfm@qtawbelv3n4l>
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
 <20230707150307.vb4otu5e6hwoadyf@amazon.com>
 <cc153fa9-b9e0-f714-ce5b-1a4a0cb55cc7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cc153fa9-b9e0-f714-ce5b-1a4a0cb55cc7@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0kHMDWBrY4vwMO9XHyagsCFiCcJgcAQk
X-Proofpoint-GUID: 0kHMDWBrY4vwMO9XHyagsCFiCcJgcAQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090206
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
Cc: freedreno@lists.freedesktop.org, Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-msm@vger.kernel.org, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 08:27:18PM +0300, Dmitry Baryshkov wrote:
> 
> On 07/07/2023 18:03, Jordan Crouse wrote:
> > On Thu, Jul 06, 2023 at 09:55:13PM +0300, Dmitry Baryshkov wrote:
> > > 
> > > On 10/03/2023 00:20, Jordan Crouse wrote:
> > > > While booting with amd,imageon on a headless target the GPU probe was
> > > > failing with -ENOSPC in get_pages() from msm_gem.c.
> > > > 
> > > > Investigation showed that the driver was using the default 16MB VRAM
> > > > carveout because msm_use_mmu() was returning false since headless devices
> > > > use a dummy parent device. Avoid this by extending the existing is_a2xx
> > > > priv member to check the GPU IOMMU state on all platforms and use that
> > > > check in msm_use_mmu().
> > > > 
> > > > This works for memory allocations but it doesn't prevent the VRAM carveout
> > > > from being created because that happens before we have a chance to check
> > > > the GPU IOMMU state in adreno_bind.
> > > > 
> > > > There are a number of possible options to resolve this but none of them are
> > > > very clean. The easiest way is to likely specify vram=0 as module parameter
> > > > on headless devices so that the memory doesn't get wasted.
> > > 
> > > This patch was on my plate for quite a while, please excuse me for
> > > taking it so long.
> > 
> > No worries. I'm also chasing a bunch of other stuff too.
> > 
> > > I see the following problem with the current code. We have two different
> > > instances than can access memory: MDP/DPU and GPU. And each of them can
> > > either have or miss the MMU.
> > > 
> > > For some time I toyed with the idea of determining whether the allocated
> > > BO is going to be used by display or by GPU, but then I abandoned it. We
> > > can have display BOs being filled by GPU, so handling it this way would
> > > complicate things a lot.
> > > 
> > > This actually rings a tiny bell in my head with the idea of splitting
> > > the display and GPU parts to two different drivers, but I'm not sure
> > > what would be the overall impact.
> > 
> > As I now exclusively work on headless devices I would be 100% for this,
> > but I'm sure that our laptop friends might not agree :)
> 
> I do not know here. This is probably a question to Rob, as he better
> understands the interaction between GPU and display parts of the userspace.

I fully support this if it is feasible.

In our architecture, display and GPU are completely independent subsystems.
Like Jordan mentioned, there are IOT products without display. And I wouldn't
be surprised if there is a product with just display and uses software rendering.

-Akhil

> 
> > 
> > > More on the msm_use_mmu() below.
> > > 
> > > > 
> > > > Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> > > > ---
> > > > 
> > > >    drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++++-
> > > >    drivers/gpu/drm/msm/msm_drv.c              | 7 +++----
> > > >    drivers/gpu/drm/msm/msm_drv.h              | 2 +-
> > > >    3 files changed, 9 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > index 36f062c7582f..4f19da28f80f 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > > @@ -539,7 +539,11 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
> > > >        DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
> > > >                config.rev.minor, config.rev.patchid);
> > > > 
> > > > -     priv->is_a2xx = config.rev.core == 2;
> > > > +     /*
> > > > +      * A2xx has a built in IOMMU and all other IOMMU enabled targets will
> > > > +      * have an ARM IOMMU attached
> > > > +      */
> > > > +     priv->has_gpu_iommu = config.rev.core == 2 || device_iommu_mapped(dev);
> > > >        priv->has_cached_coherent = config.rev.core >= 6;
> > > > 
> > > >        gpu = info->init(drm);
> > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > > index aca48c868c14..a125a351ec90 100644
> > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > @@ -318,11 +318,10 @@ bool msm_use_mmu(struct drm_device *dev)
> > > >        struct msm_drm_private *priv = dev->dev_private;
> > > > 
> > > >        /*
> > > > -      * a2xx comes with its own MMU
> > > > -      * On other platforms IOMMU can be declared specified either for the
> > > > -      * MDP/DPU device or for its parent, MDSS device.
> > > > +      * Return true if the GPU or the MDP/DPU or parent MDSS device has an
> > > > +      * IOMMU
> > > >         */
> > > > -     return priv->is_a2xx ||
> > > > +     return priv->has_gpu_iommu ||
> > > >                device_iommu_mapped(dev->dev) ||
> > > >                device_iommu_mapped(dev->dev->parent);
> > > 
> > > I have a generic feeling that both old an new code is not fully correct.
> > > Please correct me if I'm wrong:
> > > 
> > > We should be using VRAM, if either of the blocks can not use remapped
> > > memory. So this should have been:
> > > 
> > > bool msm_use_mmu()
> > > {
> > >   if (!gpu_has_iommu)
> > >     return false;
> > > 
> > >   if (have_display_part && !display_has_mmu())
> > >     return false;
> > > 
> > >   return true;
> > > }
> > > 
> > > What do you think.
> > 
> > I would have to see (and try) the real code but that seems like it might
> > be reasonable.
> 
> Sure, let me craft it then.
> 
> > I would like to hear from some of the a2xx users too
> > because this mostly affects them. On 3xx and newer you've always had the
> > option of not having a MMU for GPU or display but I can't think of any
> > use cases where you wouldn't want it.
> 
> msm8974 doesn't have (working) IOMMU driver. I also think there was an issue
> somewhere around sdm630/660. And the wonderful msm8992/4, IIRC, also don't
> have one.
> 
> Also the headless mode was quite useful for bringing up platforms, as it
> allowed us to test GPU separately (and ofc. in some cases even w/o MMU).
> 
> I have both a2xx (only iMX for now) and a3xx for the tests here, on my desk.
> 
> -- 
> With best wishes
> Dmitry
> 
