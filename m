Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E8944B7F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E56210E94E;
	Thu,  1 Aug 2024 12:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BUG1Y6Zb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F5D10E946;
 Thu,  1 Aug 2024 12:38:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717KRDf006305;
 Thu, 1 Aug 2024 12:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VYCw6YwUEX891kBKIdfEmI1nZ+u8bjnlBY6X3MIqy/M=; b=BUG1Y6ZbxLzG7zJd
 ijC3wgkV1NiLUkzcvH5JmYXKej3KLbQjvPLnUj5TPSCqF0wdRonmvn0XRDCRx4AZ
 B8Z/5SUEKkwqQEBN2PkZbXEEAL/OmZMOlayhi1nuzKEq0TlAD115BzKFDAHsBK/u
 SS31BOVc5Rrmqjdtlnyyu96vU7o30Ldn3KJt2F1R12yABBdSHwWqwTCc1vNvXZw8
 Edl3CT6jwGXgjYiaoQudEBgZiDPpZZyunn1siz0dyKj2rclHPyghpRT7CrFlRtz/
 aEn++mJY9LQ2FQpzFs+8k6b6gzpIj5nfSSOt2IKUoYsxQr0xSZhuQYr81Rui9nal
 HZKQrg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qjpjcenp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Aug 2024 12:38:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471CcVrL029477
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2024 12:38:31 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 Aug 2024 05:38:27 -0700
Date: Thu, 1 Aug 2024 18:08:23 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Vladimir Lypak <vladimir.lypak@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/msm/a5xx: disable preemption in submits by default
Message-ID: <20240801123823.geauowjux6r2ao72@hu-akhilpo-hyd.qualcomm.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-2-vladimir.lypak@gmail.com>
 <CAF6AEGsyhQfsfyNwZQa99HSKxy6uXQvf=ikEijjLOBnkXJ=-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsyhQfsfyNwZQa99HSKxy6uXQvf=ikEijjLOBnkXJ=-2g@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wnLHomIJUi7DfauNRmCHQ1nL4fNCY4Aq
X-Proofpoint-ORIG-GUID: wnLHomIJUi7DfauNRmCHQ1nL4fNCY4Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010082
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

On Mon, Jul 15, 2024 at 02:00:10PM -0700, Rob Clark wrote:
> On Thu, Jul 11, 2024 at 3:02 AM Vladimir Lypak <vladimir.lypak@gmail.com> wrote:
> >
> > Fine grain preemption (switching from/to points within submits)
> > requires extra handling in command stream of those submits, especially
> > when rendering with tiling (using GMEM). However this handling is
> > missing at this point in mesa (and always was). For this reason we get
> > random GPU faults and hangs if more than one priority level is used
> > because local preemption is enabled prior to executing command stream
> > from submit.
> > With that said it was ahead of time to enable local preemption by
> > default considering the fact that even on downstream kernel it is only
> > enabled if requested via UAPI.
> >
> > Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index c0b5373e90d7..6c80d3003966 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >         OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> >         OUT_RING(ring, 1);
> >
> > -       /* Enable local preemption for finegrain preemption */
> > +       /*
> > +        * Disable local preemption by default because it requires
> > +        * user-space to be aware of it and provide additional handling
> > +        * to restore rendering state or do various flushes on switch.
> > +        */
> >         OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
> > -       OUT_RING(ring, 0x1);
> > +       OUT_RING(ring, 0x0);
> 
> From a quick look at the a530 pfp fw, it looks like
> CP_PREEMPT_ENABLE_LOCAL is allowed in IB1/IB2 (ie. not restricted to
> kernel RB).  So we should just disable it in the kernel, and let
> userspace send a CP_PREEMPT_ENABLE_LOCAL to enable local preemption.

Ack. AFAIU about a5x preemption, this should work.

-Akhil

> 
> BR,
> -R
> 
> >         /* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
> >         OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
> > --
> > 2.45.2
> >
