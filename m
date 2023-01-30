Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D974C681811
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 18:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0310E027;
	Mon, 30 Jan 2023 17:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82CE10E027;
 Mon, 30 Jan 2023 17:58:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UHodMo023069; Mon, 30 Jan 2023 17:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T0Gw0uDvKcfSOofRb9wLkX8UfN4CkwRLUOpkaJ3t9uc=;
 b=U+eNmATzs3ZO7/hBhDnXlza/glU/tPlI6oPtmfg6sUNqPnen05MQyDKcZ56Zq6RxG6kb
 sX88kiiZFTEBVTMtf1/ixK/Ip76+oJWQOTkX6sn12m1gNikIXksA72oxX0QwMtYOogPW
 CpO0HJGg9yGPLdJweMPBFlG6Nnrh4dZbXRJ4NeDGdTmuWEjuUIYlWKsw+KOf4tajrvdD
 FXYJZ+gFs9ezfVPMAnxNZ1FQ6tD6vl3EPKvgoTpQNhCNmilw1x7fCU0YF7Dk7aNGzaHO
 CkT173R6oz7kWfJUKOPGbMk7REEvrjtsE7re3ehygD93wpsSssPW90ov2UmN/i6ZkWe5 PA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmfrgnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 17:58:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30UHwOYm009700
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 17:58:24 GMT
Received: from [10.110.115.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 09:58:23 -0800
Message-ID: <39a4f145-6190-db47-c334-a20cbf1a9808@quicinc.com>
Date: Mon, 30 Jan 2023 09:58:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dp: Clean up handling of DP
 AUX interrupts
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NsdjxEOS-atocLfLYUKKIwY9u9hhmAbn
X-Proofpoint-GUID: NsdjxEOS-atocLfLYUKKIwY9u9hhmAbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_16,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301300171
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, Sean
 Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2023 5:09 PM, Douglas Anderson wrote:
> The DP AUX interrupt handling was a bit of a mess.
> * There were two functions (one for "native" transfers and one for
>    "i2c" transfers) that were quite similar. It was hard to say how
>    many of the differences between the two functions were on purpose
>    and how many of them were just an accident of how they were coded.
> * Each function sometimes used "else if" to test for error bits and
>    sometimes didn't and again it was hard to say if this was on purpose
>    or just an accident.
> * The two functions wouldn't notice whether "unknown" bits were
>    set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
>    and if it was set there would be no indication.
> * The two functions wouldn't notice if more than one error was set.
>
> Let's fix this by being more consistent / explicit about what we're
> doing.
>
> By design this could cause different handling for AUX transfers,
> though I'm not actually aware of any bug fixed as a result of
> this patch (this patch was created because we simply noticed how odd
> the old code was by code inspection). Specific notes here:
> 1. In the old native transfer case if we got "done + wrong address"
>     we'd ignore the "wrong address" (because of the "else if"). Now we
>     won't.
> 2. In the old native transfer case if we got "done + timeout" we'd
>     ignore the "timeout" (because of the "else if"). Now we won't.
> 3. In the old native transfer case we'd see "nack_defer" and translate
>     it to the error number for "nack". This differed from the i2c
>     transfer case where "nack_defer" was given the error number for
>     "nack_defer". This 100% can't matter because the only user of this
>     error number treats "nack defer" the same as "nack", so it's clear
>     that the difference between the "native" and "i2c" was pointless
>     here.
> 4. In the old i2c transfer case if we got "done" plus any error
>     besides "nack" or "defer" then we'd ignore the error. Now we don't.
> 5. If there is more than one error signaled by the hardware it's
>     possible that we'll report a different one than we used to. I don't
>     know if this matters. If someone is aware of a case this matters we
>     should document it and change the code to make it explicit.
> 6. One quirk we keep (I don't know if this is important) is that in
>     the i2c transfer case if we see "done + defer" we report that as a
>     "nack". That seemed too intentional in the old code to just drop.
>
> After this change we will add extra logging, including:
> * A warning if we see more than one error bit set.
> * A warning if we see an unexpected interrupt.
> * A warning if we get an AUX transfer interrupt when shouldn't.
>
> It actually turns out that as a result of this change then at boot we
> sometimes see an error:
>    [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
This normal, when suspend/unplug the pll will  loss locked and at that 
time aux is not busy.
> That means that, during init, we are seeing DP_INTR_PLL_UNLOCKED. For
> now I'm going to say that leaving this error reported in the logs is
> OK-ish and hopefully it will encourage someone to track down what's
> going on at init time.
>
> One last note here is that this change renames one of the interrupt
> bits. The bit named "i2c done" clearly was used for native transfers
> being done too, so I renamed it to indicate this.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

> ---
> I don't have good test coverage for this change and it does have the
> potential to change behavior. I confirmed that eDP and DP still
> continue to work OK on one machine. Hopefully folks can test it more.
>
> Changes in v2:
> - Moved DP_INTR_AUX_XFER_DONE to the end of the if else chain.
>
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 80 ++++++++++++-----------------
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>   3 files changed, 36 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index cc3efed593aa..84f9e3e5f964 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -162,47 +162,6 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
>   	return i;
>   }
>   
> -static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
> -{
> -	if (isr & DP_INTR_AUX_I2C_DONE)
> -		aux->aux_error_num = DP_AUX_ERR_NONE;
> -	else if (isr & DP_INTR_WRONG_ADDR)
> -		aux->aux_error_num = DP_AUX_ERR_ADDR;
> -	else if (isr & DP_INTR_TIMEOUT)
> -		aux->aux_error_num = DP_AUX_ERR_TOUT;
> -	if (isr & DP_INTR_NACK_DEFER)
> -		aux->aux_error_num = DP_AUX_ERR_NACK;
> -	if (isr & DP_INTR_AUX_ERROR) {
> -		aux->aux_error_num = DP_AUX_ERR_PHY;
> -		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> -	}
> -}
> -
> -static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
> -{
> -	if (isr & DP_INTR_AUX_I2C_DONE) {
> -		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
> -			aux->aux_error_num = DP_AUX_ERR_NACK;
> -		else
> -			aux->aux_error_num = DP_AUX_ERR_NONE;
> -	} else {
> -		if (isr & DP_INTR_WRONG_ADDR)
> -			aux->aux_error_num = DP_AUX_ERR_ADDR;
> -		else if (isr & DP_INTR_TIMEOUT)
> -			aux->aux_error_num = DP_AUX_ERR_TOUT;
> -		if (isr & DP_INTR_NACK_DEFER)
> -			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> -		if (isr & DP_INTR_I2C_NACK)
> -			aux->aux_error_num = DP_AUX_ERR_NACK;
> -		if (isr & DP_INTR_I2C_DEFER)
> -			aux->aux_error_num = DP_AUX_ERR_DEFER;
> -		if (isr & DP_INTR_AUX_ERROR) {
> -			aux->aux_error_num = DP_AUX_ERR_PHY;
> -			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> -		}
> -	}
> -}
> -
>   static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
>   					     struct drm_dp_aux_msg *input_msg)
>   {
> @@ -427,13 +386,42 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>   	if (!isr)
>   		return;
>   
> -	if (!aux->cmd_busy)
> +	if (!aux->cmd_busy) {
> +		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
>   		return;
> +	}
>   
> -	if (aux->native)
> -		dp_aux_native_handler(aux, isr);
> -	else
> -		dp_aux_i2c_handler(aux, isr);
> +	/*
> +	 * The logic below assumes only one error bit is set (other than "done"
> +	 * which can apparently be set at the same time as some of the other
> +	 * bits). Warn if more than one get set so we know we need to improve
> +	 * the logic.
> +	 */
> +	if (hweight32(isr & ~DP_INTR_AUX_XFER_DONE) > 1)
> +		DRM_WARN("Some DP AUX interrupts unhandled: %#010x\n", isr);
> +
> +	if (isr & DP_INTR_AUX_ERROR) {
> +		aux->aux_error_num = DP_AUX_ERR_PHY;
> +		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> +	} else if (isr & DP_INTR_NACK_DEFER) {
> +		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> +	} else if (isr & DP_INTR_WRONG_ADDR) {
> +		aux->aux_error_num = DP_AUX_ERR_ADDR;
> +	} else if (isr & DP_INTR_TIMEOUT) {
> +		aux->aux_error_num = DP_AUX_ERR_TOUT;
> +	} else if (!aux->native && (isr & DP_INTR_I2C_NACK)) {
> +		aux->aux_error_num = DP_AUX_ERR_NACK;
> +	} else if (!aux->native && (isr & DP_INTR_I2C_DEFER)) {
> +		if (isr & DP_INTR_AUX_XFER_DONE)
> +			aux->aux_error_num = DP_AUX_ERR_NACK;
> +		else
> +			aux->aux_error_num = DP_AUX_ERR_DEFER;
> +	} else if (isr & DP_INTR_AUX_XFER_DONE) {
> +		aux->aux_error_num = DP_AUX_ERR_NONE;
> +	} else {
> +		DRM_WARN("Unexpected interrupt: %#010x\n", isr);
> +		return;
> +	}
>   
>   	complete(&aux->comp);
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 676279d0ca8d..421391755427 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -27,7 +27,7 @@
>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>   
>   #define DP_INTERRUPT_STATUS1 \
> -	(DP_INTR_AUX_I2C_DONE| \
> +	(DP_INTR_AUX_XFER_DONE| \
>   	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
>   	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
>   	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 1f717f45c115..f36b7b372a06 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -13,7 +13,7 @@
>   
>   /* interrupts */
>   #define DP_INTR_HPD		BIT(0)
> -#define DP_INTR_AUX_I2C_DONE	BIT(3)
> +#define DP_INTR_AUX_XFER_DONE	BIT(3)
>   #define DP_INTR_WRONG_ADDR	BIT(6)
>   #define DP_INTR_TIMEOUT		BIT(9)
>   #define DP_INTR_NACK_DEFER	BIT(12)
