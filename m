Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2685275B25
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D70F6E077;
	Wed, 23 Sep 2020 15:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F126E077
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:06:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600873596; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=IaimSPUJbwscieRTas1qOVe4R5tD4hrlB8skTNUaUyU=;
 b=wqB9a61tGBVKWzXO806h8ZRjHVrJhyqrP6nn9v+8/Ki6k+ZEeL202vcAHOodW4KNE73knzay
 V+eahK9SD22GVypbUdjgsTD3gEflBIKYYIgSLULaszYxG7YPEwTsQlk9vgHcjOV6w1t/Wb7D
 61qsYIXItJnhf6mpfT4OOV9fuRU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f6b647048c378a4cb6b8816 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 15:06:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16268C433F1; Wed, 23 Sep 2020 15:06:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AD2AC433C8;
 Wed, 23 Sep 2020 15:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AD2AC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 23 Sep 2020 09:06:19 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: Re: [PATCH v2] drm/msm/a6xx: Fix a size determination in
 a6xx_get_indexed_registers()
Message-ID: <20200923150618.GE31425@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, smasetty@codeaurora.org,
 jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Markus.Elfring@web.de
References: <20200914022949.129-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914022949.129-1-zhenzhong.duan@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus.Elfring@web.de, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 10:29:49AM +0800, Zhenzhong Duan wrote:
> It's allocating an array of a6xx_gpu_state_obj structure rather than
> its pointers.
> 
> Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> v2: Update commit message per Markus, thanks
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b12f5b4..e9ede19 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>  	int i;
>  
>  	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
> -		sizeof(a6xx_state->indexed_regs));
> +		sizeof(*a6xx_state->indexed_regs));
>  	if (!a6xx_state->indexed_regs)
>  		return;
>  
> -- 
> 1.8.3.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
