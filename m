Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2449A733711
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E4710E08B;
	Fri, 16 Jun 2023 17:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269810E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:01:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GCMXFK008494; Fri, 16 Jun 2023 17:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6D4zbM1R1dWhpc0rGEZM5E0WKEDTNNLzwkUrRXIoYQA=;
 b=kNB0EDMySDCya0aTFOaiZEGPbuV/5/gAe3pD/P7pTwVV5HPDfwGFwD4eX/510/fEUp3w
 nm/CcO1ruuwKmRElbZ18EGicXOFftwXDxz0zrUbM9jHuz7wOMQ7IhAkjeT8qhVqw3e3Z
 BbnTprx9tdKaMn4dHaLkg5i+u3SsVtWI7PROMqgZwecNMaVAJoM2soAbbxkmqfH52fGS
 M1lwblpQqR+Vz5QQUkaEZUHElLmoDS/PUiyJqI8OA38FhpgxQanFrodFcQRIsPUhdHqr
 iCRbMvLEmAz7OP9v+OHzxRYJAul6CyYTwP3Ws7V1w1KU6UmZRhjR/PzUe43WxQeZDX8N 9g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r8n09h06h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 17:01:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35GH1PX7001256
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 17:01:25 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 16 Jun
 2023 10:01:00 -0700
Message-ID: <3fe4fe6a-5dc7-3d8c-938f-99a771650067@quicinc.com>
Date: Fri, 16 Jun 2023 11:00:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <zackr@vmware.com>,
 <contact@emersion.fr>, <linux-graphics-maintainer@vmware.com>
References: <20230615094206.4424-1-tzimmermann@suse.de>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230615094206.4424-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: H8ZBaqUWNrxIndT3bYY3JJ4krw3nytev
X-Proofpoint-ORIG-GUID: H8ZBaqUWNrxIndT3bYY3JJ4krw3nytev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxlogscore=936 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160153
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/2023 3:31 AM, Thomas Zimmermann wrote:
> Set drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle()
> for all DRM drivers. Even drivers that do not support PRIME import
> or export of dma-bufs can now import their own buffer objects. This
> is required by some userspace, such as wlroots-based compositors, to
> share buffers among processes.
> 
> The only driver that does not use the drm_gem_prime_*() helpers is
> vmwgfx. Once it has been converted, the callbacks in struct drm_driver
> can be removed.
> 
> Simon Ser implemented the feature for drivers based on GEM VRAM helpers
> in [1]. This patchset generalizes the code for all drivers that do not
> otherwise support PRIME. Tested by running sway with gma500 hardware.
> 
> [1] https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@emersion.fr/
> 
> Thomas Zimmermann (3):
>    drm: Enable PRIME import/export for all drivers
>    drm: Clear fd/handle callbacks in struct drm_driver
>    drm/prime: Unexport helpers for fd/handle conversion
> 
>   Documentation/gpu/todo.rst                    | 14 +++++
>   drivers/accel/ivpu/ivpu_drv.c                 |  2 -
>   drivers/accel/qaic/qaic_drv.c                 |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 -
>   drivers/gpu/drm/armada/armada_drv.c           |  2 -
>   drivers/gpu/drm/drm_ioctl.c                   |  4 +-
>   drivers/gpu/drm/drm_prime.c                   | 62 ++++++++++---------
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  2 -
>   drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 -
>   drivers/gpu/drm/i915/i915_driver.c            |  2 -
>   drivers/gpu/drm/lima/lima_drv.c               |  2 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 -
>   drivers/gpu/drm/msm/msm_drv.c                 |  2 -
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 -
>   drivers/gpu/drm/omapdrm/omap_drv.c            |  2 -
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 -
>   drivers/gpu/drm/pl111/pl111_drv.c             |  2 -
>   drivers/gpu/drm/qxl/qxl_drv.c                 |  2 -
>   drivers/gpu/drm/radeon/radeon_drv.c           |  2 -
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 -
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 -
>   drivers/gpu/drm/tegra/drm.c                   |  2 -
>   drivers/gpu/drm/v3d/v3d_drv.c                 |  2 -
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 -
>   drivers/gpu/drm/xen/xen_drm_front.c           |  2 -
>   include/drm/drm_drv.h                         |  6 ++
>   include/drm/drm_gem_dma_helper.h              | 12 ++--
>   include/drm/drm_gem_shmem_helper.h            |  6 +-
>   include/drm/drm_gem_vram_helper.h             |  4 +-
>   include/drm/drm_prime.h                       |  7 ---
>   30 files changed, 62 insertions(+), 96 deletions(-)
> 

Surely the maintainers of the 22 drivers touched by this series should 
be in the to list or something?  Speaking for myself, threads that 
directly address me trigger my "priority" filters.

Series looks sane to me, but I'd like to see what you do for a v2 to 
address the existing comments.

For the QAIC part -

Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

-Jeff
