Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FD732173
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210010E54F;
	Thu, 15 Jun 2023 21:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8964710E54F;
 Thu, 15 Jun 2023 21:18:09 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35FKxPW5028162; Thu, 15 Jun 2023 21:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=HcRlgerHm4BuBMUBcx/cr+KzgxacLDuQaHvFXbRGX+M=;
 b=bVybtEwlSK5YX7+QRb1bkx9Zvx28v7NW4ZxcFQ71tmSEdQRFfarYIHSuFEdYIAqDajwK
 SmGDdS0AHqt3kH7222v+CHw5PC16grtad6AV5xIDEbX5KH9/d/eKUM9U/suRygSLO12C
 kT6PpU0v7WiKtdaxiCcXwzQKqxUYwHLZf837vT45rBJviGcXSzOcM5SyR9G5WZtrTbVr
 0baK6Pf977ptFaXYd9naE01KEgloyKEIeY6hzhWRAM2IqMH9RPspLjVBezTRqvy6K5Mk
 pJ0tKca/gNMjT7Dad9ukoAEbnXIu93mDkFMsreIRBXX2Pj1bnD0WuY1uWxBHRnt17rSM 6g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r89dw038r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 21:18:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35FLI1Ml019107
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 21:18:01 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 15 Jun 2023 14:17:56 -0700
Date: Fri, 16 Jun 2023 02:47:53 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 07/18] drm/msm/a6xx: Add a helper for
 software-resetting the GPU
Message-ID: <iayrosqwgsxw7f3fx5eoqreglnx6ckwlrtmelfc4xl4gunpmbr@46rpcgl6nkoh>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-7-69c68206609e@linaro.org>
 <jplt5g5xuphbnci73pdtaxd63fguxtgtp4c37kc7ehavzrjbau@kamshezxnvgy>
 <001d7571-5e9f-4f60-f6d0-35806a3e51c5@linaro.org>
 <rd4mte26n22xlgx5umerpgr66b4wfi7mdm6ovszafyinrg3q4c@g227oj3nh2vc>
 <e0141f93-b3d8-cc3e-7b2d-32618351ba10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e0141f93-b3d8-cc3e-7b2d-32618351ba10@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YfWn7U_EkUMbzoF88__VQMKspnQr0ouP
X-Proofpoint-ORIG-GUID: YfWn7U_EkUMbzoF88__VQMKspnQr0ouP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_16,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150183
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:59:23PM +0200, Konrad Dybcio wrote:
> 
> On 15.06.2023 22:11, Akhil P Oommen wrote:
> > On Thu, Jun 15, 2023 at 12:34:06PM +0200, Konrad Dybcio wrote:
> >>
> >> On 6.06.2023 19:18, Akhil P Oommen wrote:
> >>> On Mon, May 29, 2023 at 03:52:26PM +0200, Konrad Dybcio wrote:
> >>>>
> >>>> Introduce a6xx_gpu_sw_reset() in preparation for adding GMU wrapper
> >>>> GPUs and reuse it in a6xx_gmu_force_off().
> >>>>
> >>>> This helper, contrary to the original usage in GMU code paths, adds
> >>>> a write memory barrier which together with the necessary delay should
> >>>> ensure that the reset is never deasserted too quickly due to e.g. OoO
> >>>> execution going crazy.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  3 +--
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
> >>>>  3 files changed, 13 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> index b86be123ecd0..5ba8cba69383 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> @@ -899,8 +899,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
> >>>>  	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
> >>>>  
> >>>>  	/* Reset GPU core blocks */
> >>>> -	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, 1);
> >>>> -	udelay(100);
> >>>> +	a6xx_gpu_sw_reset(gpu, true);
> >>>>  }
> >>>>  
> >>>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> index e3ac3f045665..083ccb5bcb4e 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -1634,6 +1634,17 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
> >>>>  	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> >>>>  }
> >>>>  
> >>>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
> >>>> +{
> >>>> +	gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
> >>>> +	/* Add a barrier to avoid bad surprises */
> >>> Can you please make this comment a bit more clear? Highlight that we
> >>> should ensure the register is posted at hw before polling.
> >>>
> >>> I think this barrier is required only during assert.
> >> Generally it should not be strictly required at all, but I'm thinking
> >> that it'd be good to keep it in both cases, so that:
> >>
> >> if (assert)
> >> 	we don't keep writing things to the GPU if it's in reset
> >> else
> >> 	we don't start writing things to the GPU becomes it comes
> >> 	out of reset
> >>
> >> Also, if you squint hard enough at the commit message, you'll notice
> >> I intended for this so only be a wmb, but for some reason generalized
> >> it.. Perhaps that's another thing I should fix!
> >> for v9..
> > 
> > wmb() doesn't provide any ordering guarantee with the delay loop.
> Hm, fair.. I'm still not as fluent with memory access knowledge as I'd
> like to be..
> 
> > A common practice is to just read back the same register before
> > the loop because a readl followed by delay() is guaranteed to be ordered.
> So, how should I proceed? Keep the r/w barrier, or add a readback and
> a tiiiny (perhaps even using ndelay instead of udelay?) delay on de-assert?

readback + delay (similar value as downstream). This path is exercised
rarely.

-Akhil.

> 
> Konrad
> > 
> > -Akhil.
> >>
> >> Konrad
> >>>
> >>> -Akhil.
> >>>> +	mb();
> >>>> +
> >>>> +	/* The reset line needs to be asserted for at least 100 us */
> >>>> +	if (assert)
> >>>> +		udelay(100);
> >>>> +}
> >>>> +
> >>>>  static int a6xx_pm_resume(struct msm_gpu *gpu)
> >>>>  {
> >>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>>> index 9580def06d45..aa70390ee1c6 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>>> @@ -89,5 +89,6 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
> >>>>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
> >>>>  
> >>>>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
> >>>> +void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
> >>>>  
> >>>>  #endif /* __A6XX_GPU_H__ */
> >>>>
> >>>> -- 
> >>>> 2.40.1
> >>>>
