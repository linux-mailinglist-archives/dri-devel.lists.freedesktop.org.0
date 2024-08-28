Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B889630E4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0DD10E5B7;
	Wed, 28 Aug 2024 19:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Zr08nFW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108CE10E5B7;
 Wed, 28 Aug 2024 19:23:48 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM1QA012835;
 Wed, 28 Aug 2024 19:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aVl1um6bdKcTVasU9ob3zV0YqUw8q5eZh9fCTXeP//Q=; b=Zr08nFW+YDSNYQqi
 T/dCkkmS/FM2/CdLRRf/5SR8JW8X/7zxddmr7+R0FAAA03u4QoHg5zKn/OpkKCHN
 hArgmr60z0gYrqZ345V/Q2i523NDba6z1q1gmfFD3/+glTXmWfcabLS9mkNmnmDb
 c/ffLLFHqt+D+8xdalNI/Sc8zJB8mfEDAqzt68L7inDkQdQJhOVCQQ12+6pzdin1
 LcWQF/U0po/+wIVNCziotm2wnpCiHYe2KqWEHHIU5KScmy7FnW6yjvrrapYa97o/
 OwQwTS/Z+heBCKXxc/uS86Ibzupu5ny67YniQ1niLpWvmT/uUvNLjS9Yna6Vk75Q
 3vg/JA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv12uxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 19:23:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SJNEl6024206
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 19:23:14 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 12:23:08 -0700
Date: Thu, 29 Aug 2024 00:53:04 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Antonino Maniscalco <antomani103@gmail.com>, Connor Abbott
 <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <20240828192304.dojqyvbnqzhy63na@hu-akhilpo-hyd.qualcomm.com>
References: <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
 <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
 <57064da3-190c-4554-b085-d56daf979933@gmail.com>
 <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
 <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3wUa4nw9YNeQ19SOTO4mINAVLHXBHVQr
X-Proofpoint-ORIG-GUID: 3wUa4nw9YNeQ19SOTO4mINAVLHXBHVQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280141
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

On Wed, Aug 28, 2024 at 06:46:37AM -0700, Rob Clark wrote:
> On Wed, Aug 28, 2024 at 6:42 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Aug 27, 2024 at 3:56 PM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> > >
> > > On 8/27/24 11:07 PM, Rob Clark wrote:
> > > > On Tue, Aug 27, 2024 at 1:25 PM Antonino Maniscalco
> > > > <antomani103@gmail.com> wrote:
> > > >>
> > > >> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> > > >>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> > > >>>> On Fri, Aug 23, 2024 at 10:21 AM Connor Abbott <cwabbott0@gmail.com> wrote:
> > > >>>>>
> > > >>>>> On Thu, Aug 22, 2024 at 9:06 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > >>>>>>
> > > >>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> > > >>>>>>> On Mon, Aug 19, 2024 at 9:09 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > > >>>>>>>>
> > > >>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
> > > >>>>>>>>> This patch implements preemption feature for A6xx targets, this allows
> > > >>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> > > >>>>>>>>> hardware as such supports multiple levels of preemption granularities,
> > > >>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
> > > >>>>>>>>> such as draw-call level or a bin boundary level preemption. This patch
> > > >>>>>>>>> enables the basic preemption level, with more fine grained preemption
> > > >>>>>>>>> support to follow.
> > > >>>>>>>>>
> > > >>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > >>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > >>>>>>>>> ---
> > > >>>>>>>>
> > > >>>>>>>> No postamble packets which resets perfcounters? It is necessary. Also, I
> > > >>>>>>>> think we should disable preemption during profiling like we disable slumber.
> > > >>>>>>>>
> > > >>>>>>>> -Akhil.
> > > >>>>>>>
> > > >>>>>>> I don't see anything in kgsl which disables preemption during
> > > >>>>>>> profiling. It disables resetting perfcounters when doing system-wide
> > > >>>>>>> profiling, like freedreno, and in that case I assume preempting is
> > > >>>>>>> fine because the system profiler has a complete view of everything and
> > > >>>>>>> should "see" preemptions through the traces. For something like
> > > >>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
> > > >>>>>>> because we disable saving/restoring perf counters, but that has to
> > > >>>>>>> happen in userspace because the kernel doesn't know what userspace
> > > >>>>>>> does.
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> KGSL does some sort of arbitration of perfcounter configurations and
> > > >>>>>> adds the select/enablement reg configuration as part of dynamic
> > > >>>>>> power up register list which we are not doing here. Is this something
> > > >>>>>> you are taking care of from userspace via preamble?
> > > >>>>>>
> > > >>>>>> -Akhil
> > > >>>>>
> > > >>>>> I don't think we have to take care of that in userspace, because Mesa
> > > >>>>> will always configure the counter registers before reading them in the
> > > >>>>> same submission, and if it gets preempted in the meantime then we're
> > > >>>>> toast anyways (due to not saving/restoring perf counters). kgsl sets
> > > >>>>> them from userspace, which is why it has to do something to set them
> > > >>>>
> > > >>>> Sorry, should be "kgsl sets them from the kernel".
> > > >>>>
> > > >>>>> after IFPC slumber or a context switch when the HW state is gone.
> > > >>>>> Also, because the upstream approach doesn't play nicely with system
> > > >>>>> profilers like perfetto, VK_KHR_performance_query is hidden by default
> > > >>>>> behind a debug flag in turnip. So there's already an element of "this
> > > >>>>> is unsupported, you have to know what you're doing to use it."
> > > >>>
> > > >>> But when you have composition on GPU enabled, there will be very frequent
> > > >>> preemption. And I don't know how usable profiling tools will be in that
> > > >>> case unless you disable preemption with a Mesa debug flag. But for that
> > > >>> to work, all existing submitqueues should be destroyed and recreated.
> > > >>>
> > > >>> So I was thinking that we can use the sysprof propertry to force L0
> > > >>> preemption from kernel.
> > > >>>
> > > >>> -Akhil.
> > > >>>
> > > >>
> > > >> Right but when using a system profiler I imagined the expectation would
> > > >> be to be able to understand how applications and compositor interact. An
> > > >> use case could be measuring latency and understanding what contributes
> > > >> to it. That is actually the main reason I added traces for preemption.
> > > >> Disabling preemption would make it less useful for this type of
> > > >> analysis. Did you have an use case in mind for a system profiler that
> > > >> would benefit from disabling preemption and that is not covered by
> > > >> VK_KHR_performance_query (or equivalent GL ext)?

Please consider this as a friendly suggestion based on Conner's clarification.
Not a blocker. TBH, I don't have clairty on the profiling story in Mesa!

> > > >
> > > > I would think that we want to generate an event, with GPU timestamp
> > > > (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
> > > > could display multiple GPU timelines and where the switch from one to
> > > > the other happens.
> > > >
> > > > I'm a bit curious how this is handled on android, with AGI/etc.. I
> > > > don't see any support in perfetto for this.
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >> Best regards,
> > > >> --
> > > >> Antonino Maniscalco <antomani103@gmail.com>
> > > >>
> > >
> > > Looking at KGSL they seem to use ftrace and I don't see it doing
> > > anything to get a timestamp from some GPU timer, really not sure how
> > > that would be put in a gpu timeline.

Yeah, we usually rely on ftraces which is good enough to measure preemption
latency.

-Akhil.

> >
> > I suspect it would require some work on perfetto trace-processor.  It
> > can ingest ftrace events (but those would end up being something
> > driver specific).  Maybe with u_trace and some tracepoints in the
> > 'ambles something could be done that would be more driver agnostic
> > (but idk if that would work for gpu's where preemption happens more
> > autonomously in the fw)
> 
> btw how to handle tracing preemption probably shouldn't hold up
> sending the next iteration of this series.  There isn't that much more
> time to get this in v6.12, and I think better visualization of
> preemption is going to take some work outside of the kernel.
> 
> BR,
> -R
