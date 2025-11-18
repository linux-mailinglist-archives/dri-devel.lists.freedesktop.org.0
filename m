Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8DC6BF26
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 00:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694D910E543;
	Tue, 18 Nov 2025 23:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4d+rPDO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6m1HCnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8586810E205
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:07:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIG3RdY3176704
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=F/3h8YHCsdho8aVvrfvugC36nylgn1evTxl
 6ZxJO100=; b=U4d+rPDOzsbe8dltT8QMp03Nn2/t1kava2bH32bxra+3fYDWtDz
 hzC7AjIasF1TKUMiTlx41TXIrFWpsb7TxKPddz381LP6QnDzPe6kH1KV/tbGbqw6
 PrPiM943qmd4K7TTAr+dXJa3O20/mPN7tTjgFhkq22hB8v/uGDBEN1yYGP4mC3sj
 vEOrmdPnKMHnHCJs81jrXUZCJYJx96z6vabE7drGBB6kLh0lfDW29Kp8X0FlRcEZ
 cH45K0U+rewlfKdEQuO6jl7Xot0ryZZ7zRzngPKT27L28HaqXdFRtW3wMVlLLviO
 aq0hmbfD5P0l3iqXSBMRhmOom7Xe5JCGlTQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv02166n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:07:02 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-3e80c245742so10350116fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763507222; x=1764112022;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/3h8YHCsdho8aVvrfvugC36nylgn1evTxl6ZxJO100=;
 b=C6m1HCnzjzdct2MWhhqVTK69PzkYospbiN7TmH8OY4g0QaR6xoSQHs3FpONLsbrqnU
 B/ZOK/mgsdoJXYK4JH7orvrVuu5t4qicWe+mqM0pgMyQsdZq7e3Qe5HvtS89WS3K+eMu
 6Kx+sbT7DN5b1gCGeUXYQw6Y11/HWqgh6x91B8U9NU7w5TNycS7yMpfbPfF+0JYRAXiK
 7lT4nniN6rOnLNfujsoh7QEV5YJDO5/YOGDFyNLTANtMOjnerXttTGuBP04PDcMKmBl4
 Xzoj2AGr4q7BNYNPmwTGhrnpUlgx1NMk7FTjV7jJNLRruMBrH+3IGraURi4b480dCweH
 zA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763507222; x=1764112022;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/3h8YHCsdho8aVvrfvugC36nylgn1evTxl6ZxJO100=;
 b=bIPkBHA+6P4xzsuzF2N9FrD4tbM+Cpxw48WTABiP10WGPeTS9RBkazyL1cPvLAvnsh
 7baDnuPJ+zlP3VrWzvSVkCutt7XDjwYLoBKYBP7WVnzVBDrqQ8ZKxw/wjlvXNYLrkbq9
 29PDxV/Jv3PdEhyZSjBnoaFuZ/vKWrdkMaOxD2DYnXB3rdpqL7zI1pDAdLFEzlqoWUoI
 NRe94x1b2Y1YrSQKKpvTIUsnZ9LOXoUNC1us1FLUQ0ZXnRn3bfxgohZq0IBREsJKIKLZ
 aDns8ycfBKuTqO1hxrpZkIvMlTLcWBPnz91G7q8v1JWJpEvgpxb/VghdM4pocWUgcoTb
 iOgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBKd9XQcFlpHREZbqOoizh30+l3lnPu5FlgTqP48ztivZ3DGY8tShokwY53a1o6KqDeg/OSeD/9x0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEmzxlIWl6Dwmu50yb/rgMNcyMsVPmw1AGycHphO5UnA4FmnVC
 EeoSrlfRMPUUoqX3Hxmmtf/azOQdNgGcMBnMOiEKdsxYMV/oVNvRKNtOTEzFV0PL6BBB9HWURe/
 4lrFJXmKZSFBv6tBDrDmCgfjvoyHkcJiAY8naCNcr8YD8q+3cjgCqyI3Y1YssSE4wjTUrkp8VXW
 nr9cxs+F+7KggqzAkjLOSarG9mPVzDmjvUJHRkcvnLyTB3ZQ==
X-Gm-Gg: ASbGncs7Ed9sRK05nKZ/bI0T2OJP7otC9Qgj2mDg8HHy5clb6xDPEwdTOQu1/imdLZs
 FJve1CLVMV5AhkU9bbtltNMNpXr0Lgv9iZv4P5IhMLxWSU+BJNcIL7dlI8Ea+62SN+sWK5zzHSd
 PU0GuSc8eeCyDq4x23qvcFJRX5QAXdcBPZo7T0CWNFVej25fecO0lcz+7aLLH2WtpApQ==
X-Received: by 2002:a05:6870:178e:b0:381:e796:fbdd with SMTP id
 586e51a60fabf-3e869184d8cmr8964686fac.35.1763507221719; 
 Tue, 18 Nov 2025 15:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUP1CxGrV0D7O030YCOk1ptzP7b4KK9i9lk0k1a7Hj0q7tftAkHAmLxtV7Qu3qRI1aBNqXbBK4sU44ckzwyfQ=
X-Received: by 2002:a05:6870:178e:b0:381:e796:fbdd with SMTP id
 586e51a60fabf-3e869184d8cmr8964674fac.35.1763507221170; Tue, 18 Nov 2025
 15:07:01 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:06:50 -0800
X-Gm-Features: AWmQ_bl9TBEL3cnTzDyZ-qHEr5wUIW788ooSn-00N0v5fkUaPB7Hapd43GHGD8k
Message-ID: <CACSVV00sFi65XrZipHCU3C0bYji7vgu7OgWvLeOQ1Cg475_pUA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2025-11-18 for v6.19
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: im_-OhPhLjLQUHK2DxnFLPaGwNR0y64a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE4NyBTYWx0ZWRfX20XYf0LgaO99
 3izx3azSZEAe9Igpz4TKXFvx+kAqKE4ZUUcGOsvkmvdldRz/XTIvLz82ZNl85LGfSWOOY3fLnWH
 WZjo06K+Zkt2xPeZTLU/Xe4LuBCf74OmobF1rqpikS0KMuz/q8eS+bazsE6ArUX0y30BeXm70Kf
 xPJQiEoAy7B9cliR5dGuuX7+1cd6MEHHcofcbwLylVsMX4ll+I4iFQS1kq8s463a0A7LijOmJtx
 tLsiJtbXDBAO/IR6XYfsYxUxdFJHZQH11vkMPyYveFTCLh+iKNtVg+M532ez3T/h0FNxaCT3mjP
 TU+qAVj7HIC4YKs8+sPSMqalyIDB4dA3C1GlhhVWKx+a69+BZ93JEnX0n526ydWMQLwA2EbrUIS
 oi6ia3r6GpI37i6Z/9AAJNyau7Aldw==
X-Authority-Analysis: v=2.4 cv=ad9sXBot c=1 sm=1 tr=0 ts=691cfc16 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=s54uQsvZatRMKIvkDIgA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: im_-OhPhLjLQUHK2DxnFLPaGwNR0y64a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180187
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

Pull for v6.19, as described below.

Includes the first gen8 devices:
- x2-85: Snapdragon x2 elite compute (laptop) chipset, GPU and Display support
- a840: Snapdragon 8 Elite Gen 5 GPU support.  (Display support is on
list, but wasn't quite ready to merge.)

Mesa support for the new gen8 GPUs is at:

 https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38450

Sorry this is running a bit late, it took a bit longer than planned to
push mesa support for gen8.  And then inevitably drm/ci found some
issues at the last minute.


The following changes since commit f67d54e96bc9e4e20a927868f02c2e9d1aa09751:

  Merge tag 'amd-drm-next-6.19-2025-10-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-10-31
22:08:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2025-11-18

for you to fetch changes up to 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530:

  dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU (2025-11-18 09:04:13 -0800)

----------------------------------------------------------------
Changes for v6.19:

GPU:
- Gen8 support: A840 (Kaanapali) and X2-85 (Glymur)
- A612 support
- A few NULL check fixes

MDSS:
- Added support for Glymur and QCS8300 platforms

DPU:
- Enabled Quad-Pipe support, unlocking higher resolutions support
- Added support for Glymur platform
- Documented DPU on QCS8300 platform as supported
- Misc small fixes

DisplayPort:
- Added support for Glymur platform
- Added support lame remapping inside DP block
- Documented DisplayPort controller on QCS8300 and SM6150/QCS615 as
  supported

----------------------------------------------------------------
Abel Vesa (6):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur

Akhil P Oommen (22):
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/a6xx: Skip dumping SCRATCH registers
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
      drm/msm/a6xx: Share dependency vote table with GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      drm/msm/a8xx: Add support for Adreno X2-85 GPU
      dt-bindings: arm-smmu: Add Kaanapali and Glymur GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU

Anna Maniscalco (1):
      drm/msm: make sure last_fence is always updated

Christophe JAILLET (1):
      drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()

Connor Abbott (1):
      drm/msm: Wait for MMU devcoredump when waiting for GMU

Dmitry Baryshkov (3):
      drm/msm: fix allocation of dumb buffers for non-RGB formats
      drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
      drm/msm/a2xx: stop over-complaining about the legacy firmware

Gopi Krishna Menon (1):
      drm/msm: Add NULL check in vm_op_enqueue()

Huiwen He (2):
      drm/msm: Fix NULL pointer dereference in crashstate_get_vm_logs()
      drm/msm: fix missing NULL check after kcalloc in crashstate_get_bos()

Jessica Zhang (1):
      drm/msm/dpu: Fix adjusted mode clock check for 3d merge

Jie Zhang (1):
      drm/msm/a6xx: Add support for Adreno 612

Jun Nie (10):
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Use dedicated WB number definition
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: Reference DAI schema for DAI properties

Neil Armstrong (1):
      drm/msm: dsi: fix PLL init in bonded mode

Randy Dunlap (1):
      drm/msm/disp: fix kernel-doc warnings

Rob Clark (7):
      drm/msm: Fix GEM free for imported dma-bufs
      drm/msm: Fix pgtable prealloc error path
      drm/msm: Reject MAP_NULL op if no PRR
      drm/msm: Ensure vm is created in VM_BIND ioctl
      Merge remote-tracking branch 'drm/drm-next' into msm-next-robclark
      MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
      drm/msm/registers: Fix encoding fields in 64b registers

Vignesh Raman (1):
      drm/ci: disable broken MR check in sanity job

Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

Xiangxu Yin (5):
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration
      dt-bindings: display/msm: dp-controller: Add SM6150
      dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      dt-bindings: display: msm: sm6150-mdss: Fix example indentation
and OPP values

Yongxing Mou (4):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   17 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     |  264 +++
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |  286 +++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |   40 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   16 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 MAINTAINERS                                        |    1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |    2 +-
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  385 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  335 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  438 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   31 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   74 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   74 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1201 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 +--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   56 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  541 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  118 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   47 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  442 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |    3 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |   13 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    9 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |  117 ++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   18 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   27 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    9 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   36 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   21 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   11 +
 drivers/gpu/drm/msm/msm_iommu.c                    |    5 +
 drivers/gpu/drm/msm/msm_mdss.c                     |    2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 2199 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  121 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  299 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  361 +++-
 drivers/gpu/drm/msm/registers/gen_header.py        |   19 +-
 78 files changed, 7418 insertions(+), 2310 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_gpu.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_enums.xml
