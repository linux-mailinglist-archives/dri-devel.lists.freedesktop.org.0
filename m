Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7553F183
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 23:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899F3112054;
	Mon,  6 Jun 2022 21:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF47112054
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 21:20:07 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso2744409fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9PcUJMsE22PYq+FyjhmAfpnSlrIsq/ysnRAwNN0aJxE=;
 b=cFIig+iuLezd7UpzZyzFTJMfFClnhdvrZy+bypNFh4PXyrr1gsDRcuefxKgXq3e9NJ
 0b8HdCqqgAKQkawwFKrCrUAiqW4yi+IDGbAohG78cei+TRymvdabboTzOHh7iLDXgTmV
 W/fLZr0IYhAeYFX7hXPHRcOSNl/liIEM9qIo4qh6EUG5hwmVFExNfUcuyj4rXw44wYpy
 maSuNlyvsiQM0CDlWDq0Bi9K0QrfOj1zkoJPjcZQ+TSKvR14s0rF/v56ZQz9emef+nyk
 hGNtRCWsPK4X4XmZxxdM49nzhLKYuDFuQ6+E+a/amc9fW9jlTls7M6x0bE3q6RN3QqD7
 cesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9PcUJMsE22PYq+FyjhmAfpnSlrIsq/ysnRAwNN0aJxE=;
 b=pFkKSjZQHOhraHgAgRZ/E47FYFf/5sbQVx8Y7NLVE6yJgX8+9fKBCufF3xalhzaVfc
 5+M95c7W8uoNQG9eFijo8l051dsrTJs2eCOSjah9qYbuO8eQaiVT/6Rudq9B9lrbDcKP
 97TTqkLESjTTR0wbU5ACikqqKQhWyAnf0fyT7uFK125A7sBwAS/uRUNN+AMjRE7R2NUp
 gtMVRtaVu78mZXheGv4BUT9X607S8LgoFQONHS5mRBl+Ds4kPVZy/djUtxb9Whkn+YXf
 5aju0AhC56spHw7K5xfeWoqtl3An9SoC9xpbm29NfbQpwjubVMKSPeaKKD8I5SnUoayV
 cfCQ==
X-Gm-Message-State: AOAM533DQyGleR3/1JcTabydSkUmXsx2n0KQTbOFjEzSL5XD0qPI8DNv
 DA0IYbm7MrWIqMZNWYcq+/P2xg==
X-Google-Smtp-Source: ABdhPJxSVw0Ka4pnnTRj95ab0a4BoYO4I+R34kBd+OcFd6uj/aq/Jl7ry5WyjAv2FpyNUdgfw/2ctQ==
X-Received: by 2002:a05:6870:7099:b0:f1:b164:59ee with SMTP id
 v25-20020a056870709900b000f1b16459eemr14842915oae.21.1654550406920; 
 Mon, 06 Jun 2022 14:20:06 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 bc32-20020a05682016a000b0035eb4e5a6dasm8361956oob.48.2022.06.06.14.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:20:06 -0700 (PDT)
Date: Mon, 6 Jun 2022 14:22:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH] drm/msm: Fix double pm_runtime_disable() call
Message-ID: <Yp5wF2FJ0lCvkUGH@ripper>
References: <20220606211305.189585-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606211305.189585-1-luzmaximilian@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 06 Jun 14:13 PDT 2022, Maximilian Luz wrote:

> Following commit 17e822f7591f ("drm/msm: fix unbalanced
> pm_runtime_enable in adreno_gpu_{init, cleanup}"), any call to
> adreno_unbind() will disable runtime PM twice, as indicated by the call
> trees below:
> 
>   adreno_unbind()
>    -> pm_runtime_force_suspend()
>    -> pm_runtime_disable()
> 
>   adreno_unbind()
>    -> gpu->funcs->destroy() [= aNxx_destroy()]
>    -> adreno_gpu_cleanup()
>    -> pm_runtime_disable()
> 
> Note that pm_runtime_force_suspend() is called right before
> gpu->funcs->destroy() and both functions are called unconditionally.
> 
> With recent addition of the eDP AUX bus code, this problem manifests
> itself when the eDP panel cannot be found yet and probing is deferred.
> On the first probe attempt, we disable runtime PM twice as described
> above. This then causes any later probe attempt to fail with
> 
>   [drm:adreno_load_gpu [msm]] *ERROR* Couldn't power up the GPU: -13
> 
> preventing the driver from loading.
> 
> As there seem to be scenarios where the aNxx_destroy() functions are not
> called from adreno_unbind(), simply removing pm_runtime_disable() from
> inside adreno_unbind() does not seem to be the proper fix. This is what
> commit 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in
> adreno_gpu_{init, cleanup}") intended to fix. Therefore, instead check
> whether runtime PM is still enabled, and only disable it in that case.
> 
> Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 4e665c806a14..f944b69e2a25 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1057,7 +1057,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>  	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
>  		release_firmware(adreno_gpu->fw[i]);
>  
> -	pm_runtime_disable(&priv->gpu_pdev->dev);
> +	if (pm_runtime_enabled(&priv->gpu_pdev->dev))
> +		pm_runtime_disable(&priv->gpu_pdev->dev);
>  
>  	msm_gpu_cleanup(&adreno_gpu->base);
>  }
> -- 
> 2.36.1
> 
