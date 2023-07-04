Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854217475B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312F710E2D4;
	Tue,  4 Jul 2023 15:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288A10E2D0;
 Tue,  4 Jul 2023 15:55:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3649CQY2004740; Tue, 4 Jul 2023 15:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8Dfj7CGwCb846Fiy1vylo4CUzVUOus05nf8Dn25oYKM=;
 b=CAJjlM6vsUQunwhAu1U/B/qrDWtD/i6/Nqb+rQlfdCclLaGfjThfTU9mYYXhXRfnqtlt
 R9SlFcq6zS8dcWDVGjCVW2vL/vpo7LX5UjJo4Y2UyVQwTDr2IfMwTTJD4sOZigSnx0bA
 k4LiSCVXJQswuE7h43EOPOZ92nuYm4FmkTsy/5QZjxHr89oDEt5Cby910uGF3AGwVcBe
 GUVjRwugZ57hjex8izZgiMRoHUqWGHFZcq00DConXVQJqd3oDN21XPwjsKSq/gJ+usD4
 RFEE9Fg/3og1rSQ0xhnrdpZ+QusdjEvYIJT06tiXAuSpH3/ImZvFlDE8oiNJEsH1Mgxq ow== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm0he2wqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 15:54:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 364FswYV005731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jul 2023 15:54:58 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 08:54:56 -0700
Message-ID: <02d7d9c1-6ac4-bf65-d335-e83a2a422e96@quicinc.com>
Date: Tue, 4 Jul 2023 08:54:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/14] drm/msm/dpu: rework core_perf debugfs overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230704150354.159882-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9oz8Z5OwkJ9qldUOOeXNYK0Q_N365ovT
X-Proofpoint-ORIG-GUID: 9oz8Z5OwkJ9qldUOOeXNYK0Q_N365ovT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_10,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040138
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> Currently debugfs provides separate 'modes' to override calculated
> MDP_CLK rate and interconnect bandwidth votes. Change that to allow
> overriding individual values (e.g. one can override just clock or just
> average bandwidth vote).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Can you break this out into a separate series on its own?

I would like to spend more time on this and dont want to hold up the 
rest of the cleanup part of the series for this.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 ++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
>   2 files changed, 9 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 42c03a5f1f3e..23a29f159eff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -17,20 +17,6 @@
>   #include "dpu_crtc.h"
>   #include "dpu_core_perf.h"
>   
> -/**
> - * enum dpu_perf_mode - performance tuning mode
> - * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
> - * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
> - * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> - * @DPU_PERF_MODE_MAX: maximum value, used for error checking
> - */
> -enum dpu_perf_mode {
> -	DPU_PERF_MODE_NORMAL,
> -	DPU_PERF_MODE_MINIMUM,
> -	DPU_PERF_MODE_FIXED,
> -	DPU_PERF_MODE_MAX
> -};
> -
>   /**
>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>    * @kms:  pointer to the dpu_kms
> @@ -229,18 +215,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   	if (!kms->num_paths)
>   		return 0;
>   
> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> -		avg_bw = 0;
> -		peak_bw = 0;
> -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +
> +	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> +	peak_bw = perf.max_per_pipe_ib;
> +
> +	if (kms->perf.fix_core_ab_vote)
>   		avg_bw = kms->perf.fix_core_ab_vote;
> -		peak_bw = kms->perf.fix_core_ib_vote;
> -	} else {
> -		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>   
> -		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> -		peak_bw = perf.max_per_pipe_ib;
> -	}
> +	if (kms->perf.fix_core_ib_vote)
> +		peak_bw = kms->perf.fix_core_ib_vote;
>   
>   	avg_bw /= kms->num_paths;
>   
> @@ -294,12 +278,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>   	struct drm_crtc *crtc;
>   	struct dpu_crtc_state *dpu_cstate;
>   
> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> +	if (kms->perf.fix_core_clk_rate)
>   		return kms->perf.fix_core_clk_rate;
>   
> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
> -		return kms->perf.max_core_clk_rate;
> -
>   	drm_for_each_crtc(crtc, kms->dev) {
>   		if (crtc->enabled) {
>   			dpu_cstate = to_dpu_crtc_state(crtc->state);
> @@ -416,54 +397,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   
>   #ifdef CONFIG_DEBUG_FS
>   
> -static ssize_t _dpu_core_perf_mode_write(struct file *file,
> -		    const char __user *user_buf, size_t count, loff_t *ppos)
> -{
> -	struct dpu_core_perf *perf = file->private_data;
> -	u32 perf_mode = 0;
> -	int ret;
> -
> -	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
> -	if (ret)
> -		return ret;
> -
> -	if (perf_mode >= DPU_PERF_MODE_MAX)
> -		return -EINVAL;
> -
> -	if (perf_mode == DPU_PERF_MODE_FIXED) {
> -		DRM_INFO("fix performance mode\n");
> -	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
> -		/* run the driver with max clk and BW vote */
> -		DRM_INFO("minimum performance mode\n");
> -	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
> -		/* reset the perf tune params to 0 */
> -		DRM_INFO("normal performance mode\n");
> -	}
> -	perf->perf_tune.mode = perf_mode;
> -
> -	return count;
> -}
> -
> -static ssize_t _dpu_core_perf_mode_read(struct file *file,
> -			char __user *buff, size_t count, loff_t *ppos)
> -{
> -	struct dpu_core_perf *perf = file->private_data;
> -	int len;
> -	char buf[128];
> -
> -	len = scnprintf(buf, sizeof(buf),
> -			"mode %d\n",
> -			perf->perf_tune.mode);
> -
> -	return simple_read_from_buffer(buff, count, ppos, buf, len);
> -}
> -
> -static const struct file_operations dpu_core_perf_mode_fops = {
> -	.open = simple_open,
> -	.read = _dpu_core_perf_mode_read,
> -	.write = _dpu_core_perf_mode_write,
> -};
> -
>   int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   {
>   	struct dpu_core_perf *perf = &dpu_kms->perf;
> @@ -488,8 +421,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   			(u32 *)&catalog->perf->min_llcc_ib);
>   	debugfs_create_u32("min_dram_ib", 0600, entry,
>   			(u32 *)&catalog->perf->min_dram_ib);
> -	debugfs_create_file("perf_mode", 0600, entry,
> -			(u32 *)perf, &dpu_core_perf_mode_fops);
>   	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
>   			&perf->fix_core_clk_rate);
>   	debugfs_create_u64("fix_core_ib_vote", 0600, entry,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index c965dfbc3007..1b791b170c6b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -26,14 +26,6 @@ struct dpu_core_perf_params {
>   	u64 core_clk_rate;
>   };
>   
> -/**
> - * struct dpu_core_perf_tune - definition of performance tuning control
> - * @mode: performance mode
> - */
> -struct dpu_core_perf_tune {
> -	u32 mode;
> -};
> -
>   /**
>    * struct dpu_core_perf - definition of core performance context
>    * @dev: Pointer to drm device
> @@ -42,7 +34,6 @@ struct dpu_core_perf_tune {
>    * @core_clk: Pointer to the core clock
>    * @core_clk_rate: current core clock rate
>    * @max_core_clk_rate: maximum allowable core clock rate
> - * @perf_tune: debug control for performance tuning
>    * @enable_bw_release: debug control for bandwidth release
>    * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
>    * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
> @@ -55,7 +46,6 @@ struct dpu_core_perf {
>   	struct clk *core_clk;
>   	u64 core_clk_rate;
>   	u64 max_core_clk_rate;
> -	struct dpu_core_perf_tune perf_tune;
>   	u32 enable_bw_release;
>   	u64 fix_core_clk_rate;
>   	u64 fix_core_ib_vote;
