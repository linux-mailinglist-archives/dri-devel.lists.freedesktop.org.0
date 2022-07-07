Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591FC56A89E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 18:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7809A10E747;
	Thu,  7 Jul 2022 16:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FB110E87C;
 Thu,  7 Jul 2022 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657212695; x=1688748695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fzvG9KcXakJp0NGkoS5P9K5pudVXmEkaIJ6d4P/hRKk=;
 b=K++uit/0nMjxudNkIFR9KAE+Kk+XArduHYuz65IGzhb/jip8md9nCT3u
 rB7gmbMTEI6TYBNc78Wgh+opUhw83BsbznjlvOs2yoHqUdiFhe9oi5avn
 tHOpVq1ZZ/Mu0cFAQ9VB0DuzFfRuE56Cwm1fMjhc0fWwM6ZCvdReNXQ5R E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jul 2022 09:51:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 09:51:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 09:51:33 -0700
Received: from [10.111.163.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 09:51:31 -0700
Message-ID: <240422bd-ba5e-d250-d8ac-ef6651a97977@quicinc.com>
Date: Thu, 7 Jul 2022 09:51:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/mdp5: Fix global state lock backoff
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220707162040.1594855-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220707162040.1594855-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2022 9:20 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We need to grab the lock after the early return for !hwpipe case.
> Otherwise, we could have hit contention yet still returned 0.
> 
> Fixes an issue that the new CONFIG_DRM_DEBUG_MODESET_LOCK stuff flagged
> in CI:
> 
>     WARNING: CPU: 0 PID: 282 at drivers/gpu/drm/drm_modeset_lock.c:296 drm_modeset_lock+0xf8/0x154
>     Modules linked in:
>     CPU: 0 PID: 282 Comm: kms_cursor_lega Tainted: G        W         5.19.0-rc2-15930-g875cc8bc536a #1
>     Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : drm_modeset_lock+0xf8/0x154
>     lr : drm_atomic_get_private_obj_state+0x84/0x170
>     sp : ffff80000cfab6a0
>     x29: ffff80000cfab6a0 x28: 0000000000000000 x27: ffff000083bc4d00
>     x26: 0000000000000038 x25: 0000000000000000 x24: ffff80000957ca58
>     x23: 0000000000000000 x22: ffff000081ace080 x21: 0000000000000001
>     x20: ffff000081acec18 x19: ffff80000cfabb80 x18: 0000000000000038
>     x17: 0000000000000000 x16: 0000000000000000 x15: fffffffffffea0d0
>     x14: 0000000000000000 x13: 284e4f5f4e524157 x12: 5f534b434f4c5f47
>     x11: ffff80000a386aa8 x10: 0000000000000029 x9 : ffff80000cfab610
>     x8 : 0000000000000029 x7 : 0000000000000014 x6 : 0000000000000000
>     x5 : 0000000000000001 x4 : ffff8000081ad904 x3 : 0000000000000029
>     x2 : ffff0000801db4c0 x1 : ffff80000cfabb80 x0 : ffff000081aceb58
>     Call trace:
>      drm_modeset_lock+0xf8/0x154
>      drm_atomic_get_private_obj_state+0x84/0x170
>      mdp5_get_global_state+0x54/0x6c
>      mdp5_pipe_release+0x2c/0xd4
>      mdp5_plane_atomic_check+0x2ec/0x414
>      drm_atomic_helper_check_planes+0xd8/0x210
>      drm_atomic_helper_check+0x54/0xb0
>      ...
>     ---[ end trace 0000000000000000 ]---
>     drm_modeset_lock attempting to lock a contended lock without backoff:
>        drm_modeset_lock+0x148/0x154
>        mdp5_get_global_state+0x30/0x6c
>        mdp5_pipe_release+0x2c/0xd4
>        mdp5_plane_atomic_check+0x290/0x414
>        drm_atomic_helper_check_planes+0xd8/0x210
>        drm_atomic_helper_check+0x54/0xb0
>        drm_atomic_check_only+0x4b0/0x8f4
>        drm_atomic_commit+0x68/0xe0
> 
> Fixes: d59be579fa93 ("drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> index a4f5cb90f3e8..e4b8a789835a 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> @@ -123,12 +123,13 @@ int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>   {
>   	struct msm_drm_private *priv = s->dev->dev_private;
>   	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> -	struct mdp5_global_state *state = mdp5_get_global_state(s);
> +	struct mdp5_global_state *state;
>   	struct mdp5_hw_pipe_state *new_state;
>   
>   	if (!hwpipe)
>   		return 0;
>   
> +	state = mdp5_get_global_state(s);
>   	if (IS_ERR(state))
>   		return PTR_ERR(state);
>   
