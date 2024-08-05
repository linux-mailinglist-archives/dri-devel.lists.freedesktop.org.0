Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D36594820E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638810E28E;
	Mon,  5 Aug 2024 19:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HOplSHU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BCD10E162;
 Mon,  5 Aug 2024 19:07:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475C9avS000420;
 Mon, 5 Aug 2024 19:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PmXKmmE8mhxPHJoh9iy5H4c/
 6TQngI+cxRP2LH5NW30=; b=HOplSHU9F6by8nU1YxrsCSFWmjgcybHcxkKcuNE+
 rvaZ4Cbr3E/TVrN+hmMLQteE2ITRPIRw5BXld/vAauZ9vffa+83oeDzYyjarBMGf
 k+bTVAQJyrgGpGtLxPmZYE4fEX+kCwTJ/00/zCIUvPIFHrpwti5HSLzLXWgBrcm0
 iV1h70fpdbdh+WrvOyL1L+kSQxLf2GZXI8TUaZthrXQ0Gd+Se0I2ERtEqnsshg+t
 B2/Zf5fLCB0mlUbUzZpdq5xxdTZH97DTVVgZ6ncK9whJ+zdENsKFyHYjIH/9v6my
 O5OPZS+JO4xhbIqEyr0lQIZ7fjHHI8pdpPvjV0etV2bSPQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbvgd2kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 19:07:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475J7q52021607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 19:07:52 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 12:07:48 -0700
Date: Tue, 6 Aug 2024 00:37:44 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
Message-ID: <20240805190744.vi3553ht6q3mi4s2@hu-akhilpo-hyd.qualcomm.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-3-vladimir.lypak@gmail.com>
 <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>
 <ZqziDJlrhvSnijpw@trashcan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqziDJlrhvSnijpw@trashcan>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: J-fGG7FMtbjQU2Ae89ggPEt3ZSwArtS0
X-Proofpoint-ORIG-GUID: J-fGG7FMtbjQU2Ae89ggPEt3ZSwArtS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_07,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050137
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

On Fri, Aug 02, 2024 at 01:41:32PM +0000, Vladimir Lypak wrote:
> On Thu, Aug 01, 2024 at 06:46:10PM +0530, Akhil P Oommen wrote:
> > On Thu, Jul 11, 2024 at 10:00:19AM +0000, Vladimir Lypak wrote:
> > > Two fields of preempt_record which are used by CP aren't reset on
> > > resume: "data" and "info". This is the reason behind faults which happen
> > > when we try to switch to the ring that was active last before suspend.
> > > In addition those faults can't be recovered from because we use suspend
> > > and resume to do so (keeping values of those fields again).
> > > 
> > > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> > > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > index f58dd564d122..67a8ef4adf6b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > > @@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> > >  		return;
> > >  
> > >  	for (i = 0; i < gpu->nr_rings; i++) {
> > > +		a5xx_gpu->preempt[i]->data = 0;
> > > +		a5xx_gpu->preempt[i]->info = 0;
> > 
> > I don't see this bit in the downstream driver. Just curious, do we need
> > to clear both fields to avoid the gpu faults?
> 
> Downstream gets away without doing so because it resumes on the same
> ring that it suspended on. On mainline we always do GPU resume on first
> ring. It was enough to zero info field to avoid faults but clearing
> both shouldn't hurt.
> 
> I have tried to replicate faults again with local preemption disabled
> and unmodified mesa and couldn't do so. It only happens when fine-grain
> preemption is used and there was a switch from IB1.

So, I guess gpu is going to rpm suspend while there is pending
(preempted) submits present in another ringbuffer. Probably the other
fixes you have in this series make this not necessary during rpm suspend.
But we can keep as it is harmless and might help during gpu recovery.

> This made me come up with explanation of what could be happening.
> If preemption switch is initiated on a some ring at checkpoint in IB1,
> CP should save position of that checkpoint in the preemption record and
> set some flag in "info" field which will tell it to continue from that
> checkpoint when switching back.
> When switching back to that ring we program address of its preemption
> record to CP_CONTEXT_SWITCH_RESTORE_ADDR. Apparently this won't remove
> the flag from "info" field because the preemption record is only being
> read from. This leaves preemption record outdated on that ring until
> next switch will override it. This doesn't cause issues on downstream
> because it won't try to restore from that record since it's ignored
> during GPU power-up.

I guess it is fine if you never go to rpm suspend without idling all
RBs!

-Akhil

> 
> Vladimir
> 
> > 
> > -Akhil
> > >  		a5xx_gpu->preempt[i]->wptr = 0;
> > >  		a5xx_gpu->preempt[i]->rptr = 0;
> > >  		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> > > -- 
> > > 2.45.2
> > > 
