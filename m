Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB98AF6C5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 20:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EA1112A86;
	Tue, 23 Apr 2024 18:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kxAoW/EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F246F10FB98;
 Tue, 23 Apr 2024 18:42:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N9pqQs009943;
 Tue, 23 Apr 2024 18:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=fi+Yeyjbs3lHGzE5VRRS5LlzgImkm2F7nnTS/uUtKaU=; b=kx
 AoW/EL/jbcXACnypdoEvCrf7BIid6wG7T/eQIEwJImlKXeqP/YjljVHheaa/VKUC
 jgSyDllLKtEX0XX3L5kKkRs0hTc7XkoQw33cPYHjSPVNBeWEnWbiMpfmDZ4fTExI
 V0fVeOgsnNuWrRl/+BelHTdnv7ZaGEdTrkwql1IQt2gWTdPuXyO9LxoHejCiLxry
 BcZN+PjmLyp0srAJsGhWWH0MzaXiiPcLd2ofxUwgxKl5NzlqsPwduht9OZFybt+h
 ZaObPQqR7yBsOCsdYvPHIHfhz+YI//VL03i2EPJUHxNUGGo48gvhgaikizp3N8XN
 ClHjK/Fas34RvQeZ3r+Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpapmhhmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 18:40:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43NIeVV4022523
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 18:40:31 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 11:40:30 -0700
Message-ID: <15f18424-834a-65dc-9c39-8c744abce0a6@quicinc.com>
Date: Tue, 23 Apr 2024 11:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/7] drm/msm/dpu: Always flush the slave INTF on the CTL
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean
 Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, Chandan Uddaraju
 <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, Sravanthi
 Kollukuduru <skolluku@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Jordan
 Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Vb2Pp9EBEyMwbxjyfOZsQQHuPjcOv84F
X-Proofpoint-GUID: Vb2Pp9EBEyMwbxjyfOZsQQHuPjcOv84F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_15,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404230043
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



On 4/16/2024 4:57 PM, Marijn Suijten wrote:
> As we can clearly see in a downstream kernel [1], flushing the slave INTF
> is skipped /only if/ the PPSPLIT topology is active.
> 
> However, when DPU was originally submitted to mainline PPSPLIT was no
> longer part of it (seems to have been ripped out before submission), but
> this clause was incorrectly ported from the original SDE driver.  Given
> that there is no support for PPSPLIT (currently), flushing the slave
> INTF should /never/ be skipped (as the `if (ppsplit && !master) goto
> skip;` clause downstream never becomes true).
> 
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_cmd.c?ref_type=heads#L1131-1139
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ---
>   1 file changed, 3 deletions(-)
> 

Yes, I agree with this, even though I did think earlier that intf master 
flush was sufficient , I cross-checked the docs and this is the right way.


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

