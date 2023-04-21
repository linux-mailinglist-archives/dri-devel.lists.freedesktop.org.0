Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C697B6EB5B7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 01:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB44410E32A;
	Fri, 21 Apr 2023 23:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7F110E107;
 Fri, 21 Apr 2023 23:25:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LMemKM027312; Fri, 21 Apr 2023 23:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jo698b9kC38YuFkFAulLL8uZp9Tf9BwRfwEyBVmKSGw=;
 b=MuowO5y7WcL98JrpPA1Mh5Vxsh+VrWqvSyYxmKMX99TVZcIevHPvllQUKZhKjKrmz7ZT
 rTQs/84OzlPxOMOa1vRlN/qq5UdNjBr5g9HC0bEl737UywFanVXeTpajuuit7/beGOhy
 FSNNbZ4ODXJb8SLUTRS+vKGw1Ym+0GsivGYKO+42wcm1w71560vGqZ9Vsqq7LUWQNYr1
 Maez7ybTT+LD6adVEMBwL8HKXJohg0wkceBvwVvnQwXXjaZT8GZWnAQ8Ihd707R5NzTB
 r4H8lj92n4IQmUbyOq+CuBSzMAHtpEP9NUbOfSaqtZTPbzHGgAIyIb5hTmDezs2bCGIC DA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3phdhugu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 23:25:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33LNPHWS013848
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 23:25:17 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 21 Apr
 2023 16:25:16 -0700
Message-ID: <50d22e0c-84b3-0678-eb06-30fb66fd24cf@quicinc.com>
Date: Fri, 21 Apr 2023 16:25:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Pass catalog pointers directly from
 RM instead of IDs
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean
 Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
References: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1IVxCeOGBIg5Mg6pf_XbadZAjZAzk-sK
X-Proofpoint-ORIG-GUID: 1IVxCeOGBIg5Mg6pf_XbadZAjZAzk-sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxlogscore=897 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210205
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/21/2023 1:53 PM, Marijn Suijten wrote:
> The Resource Manager already iterates over all available blocks from the
> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
> uses an _xxx_offset() helper to search for and find the exact same
> catalog pointer again to initialize the block with, fallible error
> handling and all.
> 
> Instead, pass const pointers to the catalog entries directly to these
> _init functions and drop the for loops entirely, saving on both
> readability complexity and unnecessary cycles at boot.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Overall, a nice cleanup!

One comment below.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 39 ++++------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 12 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
>   23 files changed, 139 insertions(+), 375 deletions(-)
> 

<snipped>

> -struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m)
> +struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> +		void __iomem *addr)
>   {
>   	struct dpu_hw_intf *c;
> -	const struct dpu_intf_cfg *cfg;
> +
> +	if (cfg->type == INTF_NONE) {
> +		pr_err("Cannot create interface hw object for INTF_NONE type\n");
> +		return ERR_PTR(-EINVAL);
> +	}

The caller of dpu_hw_intf_init which is the RM already has protection 
for INTF_NONE, see below

         for (i = 0; i < cat->intf_count; i++) {
                 struct dpu_hw_intf *hw;
                 const struct dpu_intf_cfg *intf = &cat->intf[i];

                 if (intf->type == INTF_NONE) {
                         DPU_DEBUG("skip intf %d with type none\n", i);
                         continue;
                 }
                 if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
                         DPU_ERROR("skip intf %d with invalid id\n", 
intf->id);
                         continue;
                 }
                 hw = dpu_hw_intf_init(intf->id, mmio, cat);

So this part can be dropped.

>   
>   	c = kzalloc(sizeof(*c), GFP_KERNEL);
>   	if (!c)
>   		return ERR_PTR(-ENOMEM);
>   
> -	cfg = _intf_offset(idx, m, addr, &c->hw);
> -	if (IS_ERR_OR_NULL(cfg)) {
> -		kfree(c);
> -		pr_err("failed to create dpu_hw_intf %d\n", idx);
> -		return ERR_PTR(-EINVAL);
> -	}
> +	c->hw.blk_addr = addr + cfg->base;
> +	c->hw.log_mask = DPU_DBG_MASK_INTF;
>   

<snipped>
