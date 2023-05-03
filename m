Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8746F5ED6
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFB410E331;
	Wed,  3 May 2023 19:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0925310E331;
 Wed,  3 May 2023 19:05:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343Ij7CI012812; Wed, 3 May 2023 19:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cb/VMdVwgEPXQT62oiBRxVF1vZnwMJcO2714Wua2bXw=;
 b=b1WKfJzeCUe8WIrkJmV5RxXhSDirvTs3+5PoTVxx6zZip+lLHAlpCsPtVJNKKEAqyPKs
 FCA13+BJDc+3aGy3H+Ft9ebb26LUVatMRFkMICQKMbmsoubRZ/BFRYaCfqNQbFCWT1zz
 gaxZkUczmFwa+C9cDuhEI853D/w3gsdRxwy47sCYuB+wwRC90X/vly1lSMtd3pdfH7Ot
 SSpsZg9XrRAxNeGOxYGT8nc+e5quiVz+/XoyFnYijfrhYSMAjFyikaEDNO033MLWZA8n
 +JYsRQckYXMYu4QDpQLfJNdUXEF/8yPGjDh2sHQMtIW3Kcl2mco7aOoUfvCXew5T1rt8 UA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbn0a976k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 19:05:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343J4xwJ008707
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 19:04:59 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 12:04:59 -0700
Message-ID: <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
Date: Wed, 3 May 2023 12:04:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] drm/msm/dpu: Enable compression for command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-4-6bc6f03ae735@quicinc.com>
 <hxqxnfcydzyfrlvihmil3gecan6p6xyjw44gielu63ltgtqul7@xwvoprzofq6g>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <hxqxnfcydzyfrlvihmil3gecan6p6xyjw44gielu63ltgtqul7@xwvoprzofq6g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gFbj3G2AZMZ5pKzZo4LBgf5w9nJCJKDY
X-Proofpoint-ORIG-GUID: gFbj3G2AZMZ5pKzZo4LBgf5w9nJCJKDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_13,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030164
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 12:28 AM, Marijn Suijten wrote:
> On 2023-05-02 18:19:15, Jessica Zhang wrote:
>> Add a dpu_hw_intf op to enable data compression.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 2 ++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 74470d068622..4321a1aba17f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> 
> Can we have INTF DCE on video-mode encoders as well?

Hi Marijn,

Currently, there's no way to validate DSC for video mode as I've only 
made changes to support DSI for command mode. We are planning to post 
changes to support DSC over DP, which will include changes for video mode.

> 
>> @@ -72,6 +72,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>   				phys_enc->hw_intf,
>>   				true,
>>   				phys_enc->hw_pp->idx);
>> +
>> +	if (phys_enc->dpu_kms->catalog->caps->has_data_compress &&
> 
> As per my suggestion on patch 3/4, drop the flag and check above and
> only check if the function is NULL (below).

Acked.

> 
>> +			phys_enc->hw_intf->ops.enable_compression)
>> +		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>   }
>>   
>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 671048a78801..4ce7ffdd7a05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -64,10 +64,16 @@
>>   
>>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> 
> These should probably be reindented to match the below... And the rest
> of the defines use spaces instead of tabs.

Fair point, though I think fixing the whitespace for these 2 macros 
specifically might be better in a more relevant series.

With that being said, I'll change the spacing of the DATA_COMPRESS bit 
to spaces instead of tabs.

> 
>> +#define INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
>>   
>>   #define INTF_MISR_CTRL			0x180
>>   #define INTF_MISR_SIGNATURE		0x184
> 
> This does not seem to apply on top of:
> https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-10-27ce1a5ab5c6@somainline.org/

Seems like I'm missing some patches from that series on my working 
branch. Will rebase on top of the full series for the v2.

> 
>>   
>> +static inline void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> 
> Why inline?  This is used as a pointer callback.

Acked, will remove the inline.

> 
>> +{
>> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, INTF_CFG2_DCE_DATA_COMPRESS);
> 
> dpu_hw_intf_setup_timing_engine() also programs INTF_CONFIG2.  Is it
> double-buffered, or is that config **always** unused when DSI CMD mode
> is used in conjunction with DSC/DCE?  Otherwise this should perhaps OR
> the bitflag into the register, or write the whole thing at once in
> dpu_hw_intf_setup_timing_engine()?

For command mode, INTF_CONFIG2 is unused aside from setting 
DATA_COMPRESS for DSC.

Since setup_timing_engine() is only used for video mode, the 
corresponding changes will be made in the DSC v1.2 for DP changes.

> 
>> +}
>> +
>>   static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>   		const struct intf_timing_params *p,
>>   		const struct dpu_format *fmt)
>> @@ -325,6 +331,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>>   		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>>   	ops->setup_misr = dpu_hw_intf_setup_misr;
>>   	ops->collect_misr = dpu_hw_intf_collect_misr;
>> +	ops->enable_compression = dpu_hw_intf_enable_compression;
> 
> And per the same suggestion on patch 3/4, this is then wrapped in:
> 
>      if (cap & BIT(DPU_INTF_DATA_COMPRESS))
> 
> (or similary named) flag check.

Acked.

Thanks,

Jessica Zhang

> 
>>   }
> 
> This also doesn't seem to apply on top of the INTF TE [1] support
> series, even though it depends on DSC 1.2 DPU support(s?) [2] which
> mentions it was rebase(d) on top of that.
> 
> [1]: https://patchwork.freedesktop.org/series/112332/
> [2]: https://patchwork.freedesktop.org/series/116789/
> 
> - Marijn
> 
>>   
>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 102c4f0e812b..99528c735368 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -60,6 +60,7 @@ struct intf_status {
>>    *                     feed pixels to this interface
>>    * @setup_misr: enable/disable MISR
>>    * @collect_misr: read MISR signature
>> + * @enable_compression: Enable data compression
>>    */
>>   struct dpu_hw_intf_ops {
>>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>> @@ -82,6 +83,7 @@ struct dpu_hw_intf_ops {
>>   			const enum dpu_pingpong pp);
>>   	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
>>   	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>> +	void (*enable_compression)(struct dpu_hw_intf *intf);
>>   };
>>   
>>   struct dpu_hw_intf {
>>
>> -- 
>> 2.40.1
>>
