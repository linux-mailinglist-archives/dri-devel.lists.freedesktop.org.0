Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B275B6D8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 20:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851410E16E;
	Thu, 20 Jul 2023 18:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C8210E16E;
 Thu, 20 Jul 2023 18:32:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36KD9b9Q025897; Thu, 20 Jul 2023 18:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=kGOlMFbCflD1d7VVfE/4020T6jW+U4T4eaCd1AlVqmA=;
 b=ha5Af8x0TKpSXLVreXkjdBtv5pujoKJE6jno1MPrr3Mma1yw4sT3/rd7k1JX1CsRM1ku
 H3Z8vUGzHtV5BHjquFyHEl3DJx/Y67K3QTqLByD8AF1R6Im+Wd0Z0s77/ZDHcNqtr0bt
 diuV14vMxPsz7V2d20K0LOVZ9cYP/L82jnoAd9hEpneCPE9Oe8y49o6ZwV2WwuVOX1V+
 4XyLmFRweOLNBLxfM5dR4C/2hIt4CqAOGx21NNY5zudVwkS16WHMrG8vZ+ZGdjOxs45O
 B0kUViWW+w4KdyxXwr/xp7+304GspF4Sl6DrVRmGNyX65E2x9khh+ebZYZ1Zf/MB5bx/ AA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxummt2j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 18:31:58 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36KIVvIG004689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 18:31:57 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 11:31:57 -0700
Date: Thu, 20 Jul 2023 11:31:56 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Check for the GPU IOMMU during bind
Message-ID: <20230720183156.GA2667611@hu-bjorande-lv.qualcomm.com>
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <d73f6733-e605-0cf8-7909-8cced6e3b70d@linaro.org>
 <20230707150307.vb4otu5e6hwoadyf@amazon.com>
 <cc153fa9-b9e0-f714-ce5b-1a4a0cb55cc7@linaro.org>
 <2xnvyjlwuxft2uk2pirlbvbrg7krcb4alz7yyna72g4t2qrrfm@qtawbelv3n4l>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2xnvyjlwuxft2uk2pirlbvbrg7krcb4alz7yyna72g4t2qrrfm@qtawbelv3n4l>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O4gJFukcmhiEIgTWW-UQ3xNayDMVqJ6b
X-Proofpoint-GUID: O4gJFukcmhiEIgTWW-UQ3xNayDMVqJ6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200155
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
Cc: Jordan Crouse <jorcrous@amazon.com>, freedreno@lists.freedesktop.org,
 Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 03:20:44AM +0530, Akhil P Oommen wrote:
> On Fri, Jul 07, 2023 at 08:27:18PM +0300, Dmitry Baryshkov wrote:
> > 
> > On 07/07/2023 18:03, Jordan Crouse wrote:
> > > On Thu, Jul 06, 2023 at 09:55:13PM +0300, Dmitry Baryshkov wrote:
> > > > 
> > > > On 10/03/2023 00:20, Jordan Crouse wrote:
> > > > > While booting with amd,imageon on a headless target the GPU probe was
> > > > > failing with -ENOSPC in get_pages() from msm_gem.c.
> > > > > 
> > > > > Investigation showed that the driver was using the default 16MB VRAM
> > > > > carveout because msm_use_mmu() was returning false since headless devices
> > > > > use a dummy parent device. Avoid this by extending the existing is_a2xx
> > > > > priv member to check the GPU IOMMU state on all platforms and use that
> > > > > check in msm_use_mmu().
> > > > > 
> > > > > This works for memory allocations but it doesn't prevent the VRAM carveout
> > > > > from being created because that happens before we have a chance to check
> > > > > the GPU IOMMU state in adreno_bind.
> > > > > 
> > > > > There are a number of possible options to resolve this but none of them are
> > > > > very clean. The easiest way is to likely specify vram=0 as module parameter
> > > > > on headless devices so that the memory doesn't get wasted.
> > > > 
> > > > This patch was on my plate for quite a while, please excuse me for
> > > > taking it so long.
> > > 
> > > No worries. I'm also chasing a bunch of other stuff too.
> > > 
> > > > I see the following problem with the current code. We have two different
> > > > instances than can access memory: MDP/DPU and GPU. And each of them can
> > > > either have or miss the MMU.
> > > > 
> > > > For some time I toyed with the idea of determining whether the allocated
> > > > BO is going to be used by display or by GPU, but then I abandoned it. We
> > > > can have display BOs being filled by GPU, so handling it this way would
> > > > complicate things a lot.
> > > > 
> > > > This actually rings a tiny bell in my head with the idea of splitting
> > > > the display and GPU parts to two different drivers, but I'm not sure
> > > > what would be the overall impact.
> > > 
> > > As I now exclusively work on headless devices I would be 100% for this,
> > > but I'm sure that our laptop friends might not agree :)
> > 
> > I do not know here. This is probably a question to Rob, as he better
> > understands the interaction between GPU and display parts of the userspace.
> 
> I fully support this if it is feasible.
> 

I second this.

> In our architecture, display and GPU are completely independent subsystems.
> Like Jordan mentioned, there are IOT products without display. And I wouldn't
> be surprised if there is a product with just display and uses software rendering.
> 

And we have SA8295P/SA8540P with two MDSS instances and one GPU.

Regards,
Bjorn
