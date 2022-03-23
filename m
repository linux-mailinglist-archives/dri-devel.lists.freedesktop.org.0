Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F44E5981
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7EF10E085;
	Wed, 23 Mar 2022 20:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169F210E085;
 Wed, 23 Mar 2022 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648065851; x=1679601851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m/gVPbIOUw/B6IAh4NLNKzlzl2sk9Z1Cv3s7AOPuzdg=;
 b=bCQhai7GgTzzrTeqMK6fY7Zdcon2A0fX06OQyMmHvZTdN5jdx6MSfeV9
 iPsdpgEHczvp9s3JTBl8/QMCJO8/IyzhGamDWKm1SMFpXSavxQIfrhogY
 A8nQuurvc/Ea+FJniX7/Rtv2cPbPZKNjnJE2gzEkfBgBgliMuHjEtc3jE c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 13:04:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 13:04:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:04:09 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:04:09 -0700
Message-ID: <8372aeac-3d54-44f5-8341-0f9b1b604871@quicinc.com>
Date: Wed, 23 Mar 2022 13:04:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/22] drm/msm: Use drm_mode_init() for on-stack modes
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-12-ville.syrjala@linux.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220218100403.7028-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/18/2022 2:03 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
> 
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M = E;
> + struct drm_display_mode M;
> 
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when != S
> + drm_mode_init(&M, &E);
> +
> S1
> 
> @@
> expression decl.E;
> @@
> - &*E
> + E
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..e7813c6f7bd9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -248,12 +248,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	unsigned long lock_flags;
>   	struct dpu_hw_intf_cfg intf_cfg = { 0 };
>   
> +	drm_mode_init(&mode, &phys_enc->cached_mode);
> +
>   	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
>   		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
>   		return;
>   	}
>   
> -	mode = phys_enc->cached_mode;
>   	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
>   		DPU_ERROR("timing engine setup is not supported\n");
>   		return;
> @@ -652,7 +653,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   {
>   	struct intf_status s = {0};
>   	u32 fetch_start = 0;
> -	struct drm_display_mode mode = phys_enc->cached_mode;
> +	struct drm_display_mode mode;
> +
> +	drm_mode_init(&mode, &phys_enc->cached_mode);
>   
>   	if (!dpu_encoder_phys_vid_is_master(phys_enc))
>   		return -EINVAL;
