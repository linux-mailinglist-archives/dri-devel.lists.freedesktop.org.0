Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D0973DAC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 18:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431E310E88E;
	Tue, 10 Sep 2024 16:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LhtGBZYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C700310E88E;
 Tue, 10 Sep 2024 16:49:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AEGH1R026724;
 Tue, 10 Sep 2024 16:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WRfTqMixwBg5SoLzyK2dFDLuqgG8kDpuG6PKjOadqIA=; b=LhtGBZYGnYBflcZh
 uS6/VzRRzlEEmcZnqfHKQNhZJfM0HhoGdVvfn3BBbOU0RvgHXgIffquZiI4Iw9UQ
 hztowMOu8Xaz+8qWy+92vbDqx1geC8j2oreu6A6BgTSyvhfK7eq12HYkKYFJ9Jw7
 bZXFsURKSd1Fi2YSlTYMW+WCn2TZEd54DpXb2YwCVgeb5y3l2gGNo0L69LHYH9yH
 G6zzMJRYwetsl2Khs34oOMNmiGy5pJQOVxWxw3cV0DPC481Czz0J3/vMk08TLYri
 dVnU6gvTu2P2lMNDiRR5im3EJ6CtlRYHlFHPnfM+hSxWPvknZR8YjesSmBUHiH2Z
 k9B0Tw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6e6rbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 16:49:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AGnDmR004165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 16:49:14 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 09:49:08 -0700
Date: Tue, 10 Sep 2024 22:19:04 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Connor Abbott <cwabbott0@gmail.com>, Antonino Maniscalco
 <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
Message-ID: <20240910164904.7ibuhbkcwh3jdzdd@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
 <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
 <CAF6AEGvv60CS43dCijsUCzELLn=t1PJQVCzMx01cFJsNJ1Uk9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvv60CS43dCijsUCzELLn=t1PJQVCzMx01cFJsNJ1Uk9g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mQtTwW6fkpMvxOSgBMwIcuWuwxw0wPov
X-Proofpoint-ORIG-GUID: mQtTwW6fkpMvxOSgBMwIcuWuwxw0wPov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409100125
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

On Mon, Sep 09, 2024 at 07:40:07AM -0700, Rob Clark wrote:
> On Mon, Sep 9, 2024 at 6:43 AM Connor Abbott <cwabbott0@gmail.com> wrote:
> >
> > On Mon, Sep 9, 2024 at 2:15 PM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> > >
> > > On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> > > > On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> > > >> This patch implements preemption feature for A6xx targets, this allows
> > > >> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> > > >> hardware as such supports multiple levels of preemption granularities,
> > > >> ranging from coarse grained(ringbuffer level) to a more fine grained
> > > >> such as draw-call level or a bin boundary level preemption. This patch
> > > >> enables the basic preemption level, with more fine grained preemption
> > > >> support to follow.
> > > >>
> > > >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > > >> ---
> > > >>   drivers/gpu/drm/msm/Makefile              |   1 +
> > > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
> > > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> > > ...
> > > >
> > > > we can use the lighter smp variant here.
> > > >
> > > >> +
> > > >> +            if (a6xx_gpu->cur_ring == ring)
> > > >> +                    gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > > >> +            else
> > > >> +                    ring->skip_inline_wptr = true;
> > > >> +    } else {
> > > >> +            ring->skip_inline_wptr = true;
> > > >> +    }
> > > >> +
> > > >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > > >>   }
> > > >>
> > > >>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> > > >> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > > >
> > > > set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> > > > not. This is currently not tracked separately for each ring. Can you
> > > > please check that?
> > >
> > > I totally missed that. Thanks for catching it!
> > >
> > > >
> > > > I wonder why that didn't cause any gpu errors in testing. Not sure if I
> > > > am missing something.
> > > >
> > >
> > > I think this is because, so long as a single context doesn't submit to
> > > two different rings with differenr priorities, we will only be incorrect
> > > in the sense that we emit more page table switches than necessary and
> > > never less. However untrusted userspace could create a context that
> > > submits to two different rings and that would lead to execution in the
> > > wrong context so we must fix this.

Yep, it would be a security bug!

-Akhil

> >
> > FWIW, in Mesa in the future we may want to expose multiple Vulkan
> > queues per device. Then this would definitely blow up.
> 
> This will actually be required by future android versions, with the
> switch to vk hwui backend (because apparently locking is hard, the
> solution was to use different queue's for different threads)
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/11326
> 
> BR,
> -R
