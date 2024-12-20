Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F99F99B7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA91310E3C5;
	Fri, 20 Dec 2024 18:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Eq5GpUu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A210A10E28C;
 Fri, 20 Dec 2024 18:46:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKEftbF004119;
 Fri, 20 Dec 2024 18:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wH9sjjTLNsednl9KvYJYyboXzZHS5O4rpgDhve2StH0=; b=Eq5GpUu8wjbYV9ms
 o+PhSkCrSwHe5Q7v4KjPDQzpGHUrhzDnbQuCe+TJvelSkv5V681Pqi32XP0cb7Cj
 5nzcFAPBGvvoloqD1pjuA58TITCkdmpZX7z4+6kuT5AZB0HCD5dnnzJLrmtnf7cO
 uiOK4gXiWWS9WuMJOYwlRvL29GuL0z/rU366/wiQoxRAnG7e+N6Cm7XSjQnhyUwz
 3IOnlbqYTFaXgc8y1V08v5qvOl+q7eJ5AWiFB4uOJOCD25HclhhyDusk8dVXxk/h
 QFomQtdjguDVdtFqSuqKgugMpuVa36du3mZOXSgHbobISRa2sCNxAfwfGzlgA44a
 S9HnpQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43najt0pa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 18:46:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKIkWmI003227
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2024 18:46:32 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 10:46:30 -0800
Message-ID: <07fbc2c9-900a-4a88-8af0-cbe95fa2469e@quicinc.com>
Date: Fri, 20 Dec 2024 10:46:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
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
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <kx22rzwg5464f4m24u6ybnv3wcey2hffueg5pwd6t523lpjdsp@b4wj6qgcgvmk>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <kx22rzwg5464f4m24u6ybnv3wcey2hffueg5pwd6t523lpjdsp@b4wj6qgcgvmk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NNU6YpNTKzr0T8iAySDZkKyWFADho3UK
X-Proofpoint-ORIG-GUID: NNU6YpNTKzr0T8iAySDZkKyWFADho3UK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200151
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



On 12/19/2024 9:11 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 04:43:11PM -0800, Jessica Zhang wrote:
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
> 
> To provide a sensible baseline for both CWB and Quad-Pipe changes I'm
> going to pull patches 5-14 (those which refactor the resource allocation
> and also those adding support for the CWB hardware block). The core DRM
> patches should probably go in through drm-misc-next.

Ack, thanks for all the help with reviews!

- Jessica Zhang

> 
>>
>> The second part of the series will add support for CWB by doing the
>> following:
>>
>> 1) Add a DRM helper to detect if the current CRTC state is in clone mode
>>     and add an "in_clone_mode" entry to the atomic state print
>> 2) Add the CWB mux to the hardware catalog and clarify the pingpong
>>     block index enum to specifiy which pingpong blocks are dedicated to
>>     CWB only and which ones are general use pingpong blocks
>> 3) Add CWB as part of the devcoredump
>> 4) Add support for configuring the CWB mux via dpu_hw_cwb ops
>> 5) Add pending flush support for CWB
>> 6) Add support for validating clone mode in the DPU CRTC and setting up
>>     CWB within the encoder
>> 7) Adjust the encoder trigger flush, trigger start, and kickoff order to
>>     accomodate clone mode
>> 8) Adjust when the frame done timer is started for clone mode
>> 9) Define the possible clones for DPU encoders so that
>>
>> The feature was tested on SM8650 using IGT's kms_writeback test with the
>> following change [1] and dumping the writeback framebuffer when in clone
>> mode. I haven't gotten the chance to test it on DP yet, but I've
>> validated both single and dual LM on DSI.
>>
>> To test CWB with IGT, you'll need to apply this series [1] and this
>> driver patch [2]. Run the following command to dump the writeback buffer:
>>
>> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
>> ./build/tests/kms_writeback -d [--run-subtest dump-valid-clones] \
>>
>> You can also do CRC validation by running this command:
>>
>> ./build/tests/kms_writeback [--run-subtest dump-valid-clones]
>>
>> [1] https://patchwork.freedesktop.org/series/137933/
>> [2] https://patchwork.freedesktop.org/series/138284/
>>
>> ---
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
>> Dmitry Baryshkov (4):
>>        drm/msm/dpu: get rid of struct dpu_rm_requirements
>>        drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>>        drm/msm/dpu: move resource allocation to CRTC
>>        drm/msm/dpu: fill CRTC resources in dpu_crtc.c
>>
>> Esha Bharadwaj (3):
>>        drm/msm/dpu: Add CWB entry to catalog for SM8650
>>        drm/msm/dpu: add devcoredumps for cwb registers
>>        drm/msm/dpu: add CWB support to dpu_hw_wb
>>
>> Jessica Zhang (18):
>>        drm: add clone mode check for CRTC
>>        drm/tests: Add test for drm_crtc_in_clone_mode()
>>        drm: Add valid clones check
>>        drm/tests: Add test for drm_atomic_helper_check_modeset()
>>        drm/msm/dpu: Specify dedicated CWB pingpong blocks
>>        drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
>>        drm/msm/dpu: Add RM support for allocating CWB
>>        drm/msm/dpu: Add CWB to msm_display_topology
>>        drm/msm/dpu: Require modeset if clone mode status changes
>>        drm/msm/dpu: Fail atomic_check if CWB and CDM are enabled
>>        drm/msm/dpu: Reserve resources for CWB
>>        drm/msm/dpu: Configure CWB in writeback encoder
>>        drm/msm/dpu: Support CWB in dpu_hw_ctl
>>        drm/msm/dpu: Adjust writeback phys encoder setup for CWB
>>        drm/msm/dpu: Start frame done timer after encoder kickoff
>>        drm/msm/dpu: Skip trigger flush and start for CWB
>>        drm/msm/dpu: Reorder encoder kickoff for CWB
>>        drm/msm/dpu: Set possible clones for all encoders
>>
>>   drivers/gpu/drm/drm_atomic_helper.c                |  28 ++
>>   drivers/gpu/drm/drm_crtc.c                         |  20 +
>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  29 +-
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
>>   .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
>>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 208 ++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 463 ++++++++++++---------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  14 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   7 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  16 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  13 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  30 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  15 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c         |  73 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |  70 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  15 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  12 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 361 +++++++++-------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  13 +-
>>   drivers/gpu/drm/tests/drm_atomic_state_test.c      | 133 +++++-
>>   include/drm/drm_crtc.h                             |   2 +-
>>   26 files changed, 1172 insertions(+), 384 deletions(-)
>> ---
>> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
>> change-id: 20240618-concurrent-wb-97d62387f952
>> prerequisite-change-id: 20241209-abhinavk-modeset-fix-74864f1de08d:v3
>> prerequisite-patch-id: a197a0cd4647cb189ea20a96583ea78d0c98b638
>> prerequisite-patch-id: 112c8f1795cbed989beb02b72561854c0ccd59dd
>>
>> Best regards,
>> -- 
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 
> -- 
> With best wishes
> Dmitry

