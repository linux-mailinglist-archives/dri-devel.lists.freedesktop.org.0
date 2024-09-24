Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A669984886
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 17:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D11210E710;
	Tue, 24 Sep 2024 15:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OVkwwJeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24DD10E70E;
 Tue, 24 Sep 2024 15:23:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O7dqv8024167;
 Tue, 24 Sep 2024 15:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 daqGuTN1gbac8T66RCCgehmJvQXJmb+nqPqmmmC/GRA=; b=OVkwwJePsiqmfhbX
 n5zzJybdM2OkQs6PhTdPIx6F6gNZrSEhjqU39jws2bwOKqvrePCCMqgUqUX0yxJR
 gLvcoJi0KHFj4NzinBwTlvwtBpaKZNb9mOUxiNk1rzplc3l7CU3TO7DyydifjMCb
 XvJ84jUZgXMSMWpOWdVk/XaO7jC19QWQoG5nsqXWe4TZE/hUIGW3V0B2xPoxf2qE
 rydHHqHAxYIqN6K5vzIwZt0sYsdKCqIZHK3tRynU4WaivY2SEZdI3rYnunXDzZUe
 e98oSHgCzR9eNuxoCE2NtIIqkVh7p7/UFFW6XeStObD2qqRlKXrF2b6YrVmA3yDh
 AlVx3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwersm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 15:22:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OFMZnR012304
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 15:22:35 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 08:22:29 -0700
Date: Tue, 24 Sep 2024 20:52:25 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Antonino Maniscalco <antomani103@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
Message-ID: <20240924152225.tf6etddoiuiusber@hu-akhilpo-hyd.qualcomm.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
 <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
 <29fee642-440a-4b68-909b-a7c391d5a842@gmail.com>
 <CAF6AEGsuduEZDAg3nMpEiaA8nMO4fR8cH8j3k+K160+CvzaO6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsuduEZDAg3nMpEiaA8nMO4fR8cH8j3k+K160+CvzaO6Q@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: o5_Emvc4l-Wd9fqfjaPwjt0mjCEns-6X
X-Proofpoint-ORIG-GUID: o5_Emvc4l-Wd9fqfjaPwjt0mjCEns-6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240110
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

On Tue, Sep 24, 2024 at 07:47:12AM -0700, Rob Clark wrote:
> On Tue, Sep 24, 2024 at 4:54 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > On 9/20/24 7:09 PM, Akhil P Oommen wrote:
> > > On Wed, Sep 18, 2024 at 09:46:33AM +0200, Neil Armstrong wrote:
> > >> Hi,
> > >>
> > >> On 17/09/2024 13:14, Antonino Maniscalco wrote:
> > >>> This series implements preemption for A7XX targets, which allows the GPU to
> > >>> switch to an higher priority ring when work is pushed to it, reducing latency
> > >>> for high priority submissions.
> > >>>
> > >>> This series enables L1 preemption with skip_save_restore which requires
> > >>> the following userspace patches to function:
> > >>>
> > >>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> > >>>
> > >>> A flag is added to `msm_submitqueue_create` to only allow submissions
> > >>> from compatible userspace to be preempted, therefore maintaining
> > >>> compatibility.
> > >>>
> > >>> Preemption is currently only enabled by default on A750, it can be
> > >>> enabled on other targets through the `enable_preemption` module
> > >>> parameter. This is because more testing is required on other targets.
> > >>>
> > >>> For testing on other HW it is sufficient to set that parameter to a
> > >>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
> > >>> allows to run any application as high priority therefore preempting
> > >>> submissions from other applications.
> > >>>
> > >>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
> > >>> added in this series can be used to observe preemption's behavior as
> > >>> well as measuring preemption latency.
> > >>>
> > >>> Some commits from this series are based on a previous series to enable
> > >>> preemption on A6XX targets:
> > >>>
> > >>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
> > >>>
> > >>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > >>> ---
> > >>> Changes in v4:
> > >>> - Added missing register in pwrup list
> > >>> - Removed and rearrange barriers
> > >>> - Renamed `skip_inline_wptr` to `restore_wptr`
> > >>> - Track ctx seqno per ring
> > >>> - Removed secure preempt context
> > >>> - NOP out postamble to disable it instantly
> > >>> - Only emit pwrup reglist once
> > >>> - Document bv_rptr_addr
> > >>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
> > >>> - Set name on preempt record buffer
> > >>> - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com
> > >>>
> > >>> Changes in v3:
> > >>> - Added documentation about preemption
> > >>> - Use quirks to determine which target supports preemption
> > >>> - Add a module parameter to force disabling or enabling preemption
> > >>> - Clear postamble when profiling
> > >>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > >>> - Make preemption records MAP_PRIV
> > >>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
> > >>>     anymore
> > >>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
> > >>>
> > >>> Changes in v2:
> > >>> - Added preept_record_size for X185 in PATCH 3/7
> > >>> - Added patches to reset perf counters
> > >>> - Dropped unused defines
> > >>> - Dropped unused variable (fixes warning)
> > >>> - Only enable preemption on a750
> > >>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> > >>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> > >>> - Added Neil's Tested-By tags
> > >>> - Added explanation for UAPI changes in commit message
> > >>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
> > >>>
> > >>> ---
> > >>> Antonino Maniscalco (11):
> > >>>         drm/msm: Fix bv_fence being used as bv_rptr
> > >>>         drm/msm/A6XX: Track current_ctx_seqno per ring
> > >>>         drm/msm: Add a `preempt_record_size` field
> > >>>         drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> > >>>         drm/msm/A6xx: Implement preemption for A7XX targets
> > >>>         drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> > >>>         drm/msm/A6xx: Use posamble to reset counters on preemption
> > >>>         drm/msm/A6xx: Add traces for preemption
> > >>>         drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
> > >>>         drm/msm/A6xx: Enable preemption for A750
> > >>>         Documentation: document adreno preemption
> > >>>
> > >>>    Documentation/gpu/msm-preemption.rst               |  98 +++++
> > >>>    drivers/gpu/drm/msm/Makefile                       |   1 +
> > >>>    drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
> > >>>    drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
> > >>>    drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
> > >>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
> > >>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> > >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 ++++++++++++++-
> > >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 ++++++++
> > >>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++++++++++++++++++
> > >>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> > >>>    drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> > >>>    drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
> > >>>    drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
> > >>>    drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> > >>>    drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
> > >>>    drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> > >>>    drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> > >>>    .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> > >>>    include/uapi/drm/msm_drm.h                         |   5 +-
> > >>>    20 files changed, 1117 insertions(+), 66 deletions(-)
> > >>> ---
> > >>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > >>> change-id: 20240815-preemption-a750-t-fcee9a844b39
> > >>>
> > >>> Best regards,
> > >>
> > >> I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 from Yocto)
> > >> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preemption in default value
> > >> and forced to 1, and I've seen no regression so far
> > >>
> > >> On SM8550, I've seen a few:
> > >> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for response
> > >> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *ERROR* Unexpected message id 2743 on the response queue
> > >> but it's unrelated to preempt
> > >>
> > >> and on SM8450:
> > >> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     completed fence: 331235
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 7.3.0.1:     submitted fence: 331236
> > >> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 fence 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000000000000000/0000
> > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
> > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 7.3.0.1: hangcheck recover!
> > >> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt support.
> > >>
> > >> So you can also add:
> > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> > >>
> > >
> > > Niel,
> > >
> > > On my x1e device, all submissions were somehow going into only a single
> > > ring, even the compositor's. Not sure why. So effectively preemption was
> > > not really exercised. I had to force one of the two benchmark I ran
> > > using the "highprio" mesa debug flag force submittions to ring 0.
> >
> > I think that is because GL applications (so most compositors) run
> > through zink which does not forward GL preemption to vulkan so yeah, for
> > GL applications the only way of getting preemption is the debug flag.
> 
> I guess if it is mesa 24.2.x or newer it would be using the gallium
> driver.  Which I guess would need xAMBLE stuff wired up.  Outside of
> fd6_emit_restore() and fd6_gmem.cc there isn't really any state emit
> in IB1, so I guess it probably wouldn't be too hard to get preemption
> support wired up.
> 
> BR,
> -R
> 
> > Unfortunately this is not easy to fix in Zink because it creates one
> > VkDevice at screen creation and uses it for all GL contexts. Since GL
> > priority is provided per context and at context creation time Zink has
> > no way of handling this.
> >
> > Once TU will support more than one queue it will be possible for Zink to
> > create one queue per priority then pick one at context creation time.
> > Doing so would require a new vulkan extension for per queue global
> > priority. I had started working on this some time ago
> > https://gitlab.freedesktop.org/antonino/mesa/-/tree/priority_ext?ref_type=heads
> > but this solution will only be viable once TU can expose more than one
> > queue.
> >

Thanks, both of you for the clarification. Glad about the
improvements planned for both freedreno and zink.

-Akhil.

> > >
> > > If possible it is a good idea to check the new preemption traces to
> > > ensure preemption kicks in.
> > >
> > > -Akhil
> > >
> > >> Thanks,
> > >> Neil
> >
> >
> > Best regards,
> > --
> > Antonino Maniscalco <antomani103@gmail.com>
