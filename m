Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A1A2B56F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 23:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B080610E971;
	Thu,  6 Feb 2025 22:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Q9z2w8Ds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC3810E971;
 Thu,  6 Feb 2025 22:45:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EiRZY021405;
 Thu, 6 Feb 2025 22:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zfgsPQw8s8ghTcllTkWKTRRAIy24vbp5oisCLthTWJo=; b=Q9z2w8DsVB/AIsFr
 E9QVNOhdM8sTpNLJi23j04wgj5MtVE2xSKB04i3wD39bJeFk/8jt7jiziYVlLE+Y
 EInU9r8ainarcoo9OTQqh8N3rTItm3+1PAD69kP7S+dpUAd82Y3iO4i+mbQCAe0X
 /1roD5j6SI5I9ledydgs3HqItGaGrXvEWzQqCYvVTnf44/H8CtxvpNTO2hW2sabS
 z5gG2QmRyoMdx5YosNoHiHvrzFbBsBatM9OBmeVpKAuvQYYiWELNTdIS6+x0h6Ba
 oycaMO4yZ7ATPi1nEKPvjks96RhDd/I+TW6Rd7njlylUqu8V5qisd0ZPJn+W8ASV
 R6Hiqw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44my4114ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2025 22:45:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516MjKFh027963
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Feb 2025 22:45:20 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 14:45:20 -0800
Message-ID: <cbf66ae4-9f52-4f8f-b569-6a71f8b55a4f@quicinc.com>
Date: Thu, 6 Feb 2025 14:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <zoswzhubdq7ezxpecz72ki5kloyyedqo232toiol4r7hi244me@52rzudflyl52>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <zoswzhubdq7ezxpecz72ki5kloyyedqo232toiol4r7hi244me@52rzudflyl52>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: maaWke4PvaBycpp9UB42ZiOih83EjHTJ
X-Proofpoint-GUID: maaWke4PvaBycpp9UB42ZiOih83EjHTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_07,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060178
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



On 1/29/2025 9:51 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 07:20:32PM -0800, Jessica Zhang wrote:
>> DPU supports a single writeback session running concurrently with primary
>> display when the CWB mux is configured properly. This series enables
>> clone mode for DPU driver and adds support for programming the CWB mux
>> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
>> the CWB hardware blocks have only been added to the SM8650
>> hardware catalog and only DSI has been exposed as a possible_clone of WB.
>>
>> This changes are split into two parts:
>>
>> The first part of the series will pull in Dmitry's patches to refactor
>> the DPU resource manager to be based off of CRTC instead of encoder.
>> This includes some changes (noted in the relevant commits) by me and
>> Abhinav to fix some issues with getting the global state and refactoring
>> the CDM allocation to work with Dmitry's changes.
>>
>> The second part of the series will add support for CWB by doing the
>> following:
>>
>> 1) Add the CWB mux to the hardware catalog and clarify the pingpong
>>     block index enum to specifiy which pingpong blocks are dedicated to
>>     CWB only and which ones are general use pingpong blocks
>> 2) Add support for configuring the CWB mux via dpu_hw_cwb ops
>> 3) Add pending flush support for CWB
>> 4) Add support for validating clone mode in the DPU CRTC and setting up
>>     CWB within the encoder
>> 5) Adjust the encoder trigger flush, trigger start, and kickoff order to
>>     accomodate clone mode
>> 6) Adjust when the frame done timer is started for clone mode
>> 7) Define the possible clones for DPU encoders so that WB encoders can
>>     be cloned by non-WB encoders
>>
>> The feature was tested on SM8650 using IGT's kms_writeback test with the
>> following change [1] and dumping the writeback framebuffer when in clone
>> mode. I haven't gotten the chance to test it on DP yet, but I've
>> validated both single and dual LM on DSI.
>>
>> To test CWB with IGT, you'll need to apply this series [1] and run the
>> following command to dump the writeback buffer:
>>
>> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
>> ./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \
>>
>> You can also do CRC validation by running this command:
>>
>> ./build/tests/kms_writeback [--run-subtest dump-valid-clones]
>>
>> NOTE: this series depends on Dmitry's modeset fixes [2]
>>
>> [1] https://patchwork.freedesktop.org/series/137933/
>> [2] https://patchwork.freedesktop.org/series/142905/
>>
>> ---
>> Changes in v5:
>> - Rebased onto MSM modeset fixes series (Dmitry)
>> - Reordered RM refactor patches to prevent breaking CI and to avoid
>>    breaking when partially applied (Dmitry)
>> - Switch CWB resource reservation to reserve CWB mux first (Dmitry)
>> - Reworded commit messages to be clearer (Dmitry)
>> - Change CDM check to fail only if both DP and WB outputs are
>>    requesting the CDM block simultaneously (Dmitry)
>> - Use helper to grab dsc config in dpu_encoder_update_topology
>> - Link to v4: https://lore.kernel.org/r/20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com
>>
>> Changes in v4:
>> - Rebased onto latest msm-next
>> - Added kunit tests for framework changes
>> - Skip valid clone check for encoders that don't have any possible clones set
>>    (this is to avoid failing kunit tests, specifically the HDMI state helper tests)
>> - Link to v3: https://lore.kernel.org/r/20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com
>>
>> Changes in v3:
>> - Dropped support for CWB on DP connectors for now
>> - Dropped unnecessary PINGPONG array in *_setup_cwb()
>> - Add a check to make sure CWB and CDM aren't supported simultaneously
>>    (Dmitry)
>> - Document cwb_enabled checks in dpu_crtc_get_topology() (Dmitry)
>> - Moved implementation of drm_crtc_in_clone_mode() to drm_crtc.c (Jani)
>> - Dropped duplicate error message for reserving CWB resources (Dmitry)
>> - Added notes in framework changes about posting a separate series to
>>    add proper KUnit tests (Maxime)
>> - Added commit message note addressing Sima's comment on handling
>>    mode_changed (Dmitry)
>> - Formatting fixes (Dmitry)
>> - Added proper kerneldocs (Dmitry)
>> - Renamed dpu_encoder_helper_get_cwb() -> *_get_cwb_mask() (Dmitry)
>> - Capitalize all instances of "pingpong" in comments (Dmitry)
>> - Link to v2: https://lore.kernel.org/r/20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com
>>
>> Changes in v2:
>> - Moved CWB hardware programming to its own dpu_hw_cwb abstraction
>>    (Dmitry)
>> - Reserve and get assigned CWB muxes using RM API and KMS global state
>>    (Dmitry)
>> - Dropped requirement to have only one CWB session at a time
>> - Moved valid clone mode check to DRM framework (Dmitry and Ville)
>> - Switch to default CWB tap point to LM as the DSPP
>> - Dropped printing clone mode status in atomic state (Dmitry)
>> - Call dpu_vbif_clear_errors() before dpu_encoder_kickoff() (Dmitry)
>> - Squashed setup_input_ctrl() and setup_input_mode() into a single
>>    dpu_hw_cwb op (Dmitry)
>> - Moved function comment docs to correct place and fixed wording of
>>    comments/commit messages (Dmitry)
>> - Grabbed old CRTC state using proper drm_atomic_state API in
>>    dpu_crtc_atomic_check() (Dmitry)
>> - Split HW catalog changes of adding the CWB mux block and changing the
>>    dedicated CWB pingpong indices into 2 separate commits (Dmitry)
>> - Moved clearing the dpu_crtc_state.num_mixers to "drm/msm/dpu: fill
>>    CRTC resources in dpu_crtc.c" (Dmitry)
>> - Fixed alignment and other formatting issues (Dmitry)
>> - Link to v1: https://lore.kernel.org/r/20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com
>>
>> ---
>> Dmitry Baryshkov (3):
>>        drm/msm/dpu: fill CRTC resources in dpu_crtc.c
>>        drm/msm/dpu: move resource allocation to CRTC
>>        drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>>
>> Jessica Zhang (11):
>>        drm/msm/dpu: Add CWB to msm_display_topology
>>        drm/msm/dpu: Require modeset if clone mode status changes
>>        drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
>>        drm/msm/dpu: Reserve resources for CWB
>>        drm/msm/dpu: Configure CWB in writeback encoder
>>        drm/msm/dpu: Support CWB in dpu_hw_ctl
>>        drm/msm/dpu: Adjust writeback phys encoder setup for CWB
>>        drm/msm/dpu: Start frame done timer after encoder kickoff
>>        drm/msm/dpu: Skip trigger flush and start for CWB
>>        drm/msm/dpu: Reorder encoder kickoff for CWB
>>        drm/msm/dpu: Set possible clones for all encoders
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 229 +++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 416 ++++++++++++---------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 293 ++++++++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  14 +-
>>   13 files changed, 752 insertions(+), 329 deletions(-)
>> ---
>> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
>> change-id: 20240618-concurrent-wb-97d62387f952
>> prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
>> prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
>> prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd
> 
> No, it's not a full list. Please use b4 prep --check-deps to check
> dependencies. See the following errors:

Hi Dmitry,

Ah, I should've put my changes on drm-misc-next instead of trying to 
pull in the merged drm changes on top of msm-next... The deps list is 
fixed now.

Thanks for the heads up,

Jessica Zhang

> 
> $ b4 shazam -H 20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com
> Grabbing thread from lore.kernel.org/all/20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 15 messages in the thread
> Analyzing 174 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v5 1/14] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
>    ✓ [PATCH v5 2/14] drm/msm/dpu: move resource allocation to CRTC
>    ✓ [PATCH v5 3/14] drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>    ✓ [PATCH v5 4/14] drm/msm/dpu: Add CWB to msm_display_topology
>    ✓ [PATCH v5 5/14] drm/msm/dpu: Require modeset if clone mode status changes
>    ✓ [PATCH v5 6/14] drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
>    ✓ [PATCH v5 7/14] drm/msm/dpu: Reserve resources for CWB
>    ✓ [PATCH v5 8/14] drm/msm/dpu: Configure CWB in writeback encoder
>    ✓ [PATCH v5 9/14] drm/msm/dpu: Support CWB in dpu_hw_ctl
>    ✓ [PATCH v5 10/14] drm/msm/dpu: Adjust writeback phys encoder setup for CWB
>    ✓ [PATCH v5 11/14] drm/msm/dpu: Start frame done timer after encoder kickoff
>    ✓ [PATCH v5 12/14] drm/msm/dpu: Skip trigger flush and start for CWB
>    ✓ [PATCH v5 13/14] drm/msm/dpu: Reorder encoder kickoff for CWB
>    ✓ [PATCH v5 14/14] drm/msm/dpu: Set possible clones for all encoders
>    ---
>    ✗ No key: ed25519/quic_jesszhan@quicinc.com
>    ✓ Signed: DKIM/quicinc.com
> ---
> Total patches: 14
> ---
>   Base: using specified base-commit 86313a9cd152330c634b25d826a281c6a002eb77
>   Deps: looking for dependencies matching 2 patch-ids
>   Deps: Applying prerequisite patch: [PATCH v2 1/2] drm: allow encoder mode_set even when connectors change for crtc
>   Deps: Applying prerequisite patch: [PATCH v3 2/2] drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
> Magic: Preparing a sparse worktree
> Unable to cleanly apply series, see failure log below
> ---
> Applying: drm: allow encoder mode_set even when connectors change for crtc
> Applying: drm/tests: Add test for drm_atomic_helper_commit_modeset_disables()
> Applying: drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> Patch failed at 0003 drm/msm/dpu: fill CRTC resources in dpu_crtc.c
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1230
> error: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: patch does not apply
> error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:719
> error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> 
>>
>> Best regards,
>> -- 
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 
> -- 
> With best wishes
> Dmitry

