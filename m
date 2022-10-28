Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38421611A2B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 20:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F110E8AA;
	Fri, 28 Oct 2022 18:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF18C10E8A5;
 Fri, 28 Oct 2022 18:33:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SAsqh1016745;
 Fri, 28 Oct 2022 18:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=D0lmQtYsP2sAfYk9mMKID7PcUZDPOUW3YzJiwXK2JzE=;
 b=G7xuzpIe+o+RtP1kNlaXmiWnRzm1/SbP439CrEd9o6micKe5IyTzdOMmwDrOW2L7+EC5
 8uxyv2GxmhbEq7RAUXhl5DUo1xeUaCkB/5RpExT3UGkAAkhQZ8ZT2QSL+fUjfSy06ZMT
 vTczZSXd9Vn0WCtaRp3a3z0gGKf+FV63X3EjulCOR0dLXXCEX705jDYSqycMjZacWMSM
 P8ynIfzGyoX0Kap1GtHZZZdfahLsNDQ6JdiJRdarJZ2UraQ84CL9ZPO8cpiQunKHATck
 IdYuALWyP0hHhap6Gpeh5N1QInKd0WXevtplitOI1eq16jc1K9bXi4rwxHbDIU7DBlcz 2w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfw05c6t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 18:33:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29SIXQ98019269
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 18:33:26 GMT
Received: from [10.38.246.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 28 Oct
 2022 11:33:23 -0700
Message-ID: <99744fda-a3b8-f97a-294c-78e512d865bc@quicinc.com>
Date: Fri, 28 Oct 2022 11:33:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 00/10] drm/msm: Fix math issues in MSM DSC
 implementation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221026182824.876933-1-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221026182824.876933-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mHQt4GtM411GT24KVna7PtTSVR7uxgxe
X-Proofpoint-ORIG-GUID: mHQt4GtM411GT24KVna7PtTSVR7uxgxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280116
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn

On 10/26/2022 11:28 AM, Marijn Suijten wrote:
> Various removals of complex yet unnecessary math, fixing all uses of
> drm_dsc_config::bits_per_pixel to deal with the fact that this field
> includes four fractional bits, and finally making sure that
> range_bpg_offset contains values 6-bits wide to prevent overflows in
> drm_dsc_pps_payload_pack().
> 
> Altogether this series is responsible for solving _all_ Display Stream
> Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
> smartphone (2880x1440p).
> 
> Changes since v3:
> - Swap patch 7 and 8 to make sure msm_host is available inside
>    dsi_populate_dsc_params();
> - Reword patch 6 (Migrate to drm_dsc_compute_rc_parameters()) to more
>    clearly explain why the FIXME wasn't solved initially, but why it can
>    (and should!) be resolved now.
> 
> v3: https://lore.kernel.org/linux-arm-msm/20221009184824.457416-1-marijn.suijten@somainline.org/T/#u
> 
> Changes since v2:
> - Generalize mux_word_size setting depending on bits_per_component;
> - Migrate DSI's DSC calculations to drm_dsc_compute_rc_parameters(),
>    implicitly addressing existing math issues;
> - Disallow any bits_per_component other than 8, until hardcoded values
>    are updated and tested to support such cases.
> 
> v2: https://lore.kernel.org/linux-arm-msm/20221005181657.784375-1-marijn.suijten@somainline.org/T/#u
> 
> Changes since v1:
> 
> - Propagate r-b's, except (obviously) in patches that were (heavily)
>    modified;
> - Remove accidental debug code in dsi_cmd_dma_add;
> - Move Range BPG Offset masking out of DCS PPS packing, back into the
>    DSI driver when it is assigned to drm_dsc_config (this series is now
>    strictly focusing on drm/msm again);
> - Replace modulo-check resulting in conditional increment with
>    DIV_ROUND_UP;
> - Remove repeated calculation of slice_chunk_size;
> - Use u16 instead of int when handling bits_per_pixel;
> - Use DRM_DEV_ERROR instead of pr_err in DSI code;
> - Also remove redundant target_bpp_x16 variable.
> 
> v1: https://lore.kernel.org/linux-arm-msm/20221001190807.358691-1-marijn.suijten@somainline.org/T/#u
> 
> Marijn Suijten (10):
>    drm/msm/dsi: Remove useless math in DSC calculations
>    drm/msm/dsi: Remove repeated calculation of slice_per_intf
>    drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on
>      modulo
>    drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
>    drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
>    drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
>    drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
>    drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC
>      values
>    drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
>      bits
>    drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent
>      bits
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  11 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c         | 121 ++++++---------------
>   2 files changed, 37 insertions(+), 95 deletions(-)
> 
> --
> 2.38.1
> 

To keep the -fixes cycle to have only critical fixes (others are 
important too but are cleanups), I was thinking of absorbing patches 
7,8,9 and 10 alone in the -fixes cycle and for patches 1-6, will go 
through the 6.2 push.

Let me know if there are any concerns if we just take patches 7,8,9 and 
10 separately.

Thanks

Abhinav
