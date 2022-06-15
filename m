Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D087254C857
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DD210E351;
	Wed, 15 Jun 2022 12:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050DE10E351
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:20:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h23so13063948ljl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tzCBDGq5tGP2jW5rnyj4CLiseepU/qiH2K3m08j9gZQ=;
 b=K/iR/Jes4UImRpP9oPymqXSfBpOXxjBX/klSVMZxUQX0B3jmYTwpMevJVw9Bnm221j
 hnDovWtI96/30CVVsP8nOIgC04xORFFFdRaXazvIr16nw2ktjTJM9kqbmX6qxOUHbdYN
 flAiZIc9tn41EVx3SMnwQl+aS+ZW8fQIyVC61ZRxhzFKegIXXCtqpoHrNPjRqDdPb//V
 BcgAjnAiDKwsRvQSCpLnC5WXailqtBcceD0aJNOAU51RICuYtvzzrcV5f3ERlist4Btf
 sqixFsrqDMQwhOTWen74dmJLfvTH47zQFQCJbt80BhhyjwCvLkJkcz35nUBSWz7TNsoY
 btlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tzCBDGq5tGP2jW5rnyj4CLiseepU/qiH2K3m08j9gZQ=;
 b=WSkvjYbgLIDOlZOGK/pUPHdzY/434RSMtlAwa9Y0UOYVSSRraysYpbfRtgJPYHipBM
 F213LT9nql3pY4LILs8sdTCsd1CAETNqWCBwFI9nXQjofXhFEs+SZY+EGLiXTNIqzTqy
 SOA4sYS2hDflwcyKUzce3aA8qaDIFq5JCMCw16dim3YUxSmiiVOAAs6Gg20MidAghnwq
 tnYtNItSr3cev31m2eih+q+++Jvl69MF+DTtBUyKIE435KExqvBae7e3f33hVjcs7Gvm
 cGv6CVjb0J1xQxHmr+j5N6fnQdQdc5p8xYjmPDpRtqtu7NIhTu2b+gBjBYNGDgJtu7EP
 WjMA==
X-Gm-Message-State: AJIora9XrhZnCMVmIRgU18ezlJ7ms2J32nWxIw/ei6HAe/BdpvuGSxa/
 IU7NSzpxIHOZdaVZkqc5H9PHKA==
X-Google-Smtp-Source: AGRyM1tXizTF3DMpBDe2HwCwP04IOR9oCCKUA7x0NKnvosFst6z4y8wzPyxa9IaqrtXKhCjtZtRGaQ==
X-Received: by 2002:a2e:3315:0:b0:258:dfff:e252 with SMTP id
 d21-20020a2e3315000000b00258dfffe252mr5229345ljc.141.1655295654031; 
 Wed, 15 Jun 2022 05:20:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a19dc52000000b0047255d21128sm1786085lfj.87.2022.06.15.05.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:20:53 -0700 (PDT)
Message-ID: <e78fb0d3-a7ea-9f0b-ae42-fac76e54aa6a@linaro.org>
Date: Wed, 15 Jun 2022 15:20:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v2] drm/msm: add null checks for drm device to avoid crash
 during probe defer
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654249343-24959-1-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dianders@chromium.org, vpolimer@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, kalyant@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/06/2022 12:42, Vinod Polimera wrote:
> During probe defer, drm device is not initialized and an external
> trigger to shutdown is trying to clean up drm device leading to crash.
> Add checks to avoid drm device cleanup in such cases.
> 
> BUG: unable to handle kernel NULL pointer dereference at virtual
> address 00000000000000b8
> 
> Call trace:
> 
> drm_atomic_helper_shutdown+0x44/0x144
> msm_pdev_shutdown+0x2c/0x38
> platform_shutdown+0x2c/0x38
> device_shutdown+0x158/0x210
> kernel_restart_prepare+0x40/0x4c
> kernel_restart+0x20/0x6c
> __arm64_sys_reboot+0x194/0x23c
> invoke_syscall+0x50/0x13c
> el0_svc_common+0xa0/0x17c
> do_el0_svc_compat+0x28/0x34
> el0_svc_compat+0x20/0x70
> el0t_32_sync_handler+0xa8/0xcc
> el0t_32_sync+0x1a8/0x1ac
> 
> Changes in v2:
> - Add fixes tag.
> 
> Fixes: 623f279c778 ("drm/msm: fix shutdown hook in case GPU components failed to bind")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4448536..d62ac66 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -142,6 +142,9 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   
> +	if (!irq_has_action(kms->irq))
> +		return;
> +
>   	kms->funcs->irq_uninstall(kms);
>   	if (kms->irq_requested)
>   		free_irq(kms->irq, dev);
> @@ -259,6 +262,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	ddev->dev_private = NULL;
>   	drm_dev_put(ddev);
> +	priv->dev = NULL;
>   
>   	destroy_workqueue(priv->wq);
>   
> @@ -1167,7 +1171,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
>   
> -	if (!priv || !priv->kms)
> +	if (!priv || !priv->kms || !drm)
>   		return;
>   
>   	drm_atomic_helper_shutdown(drm);


-- 
With best wishes
Dmitry
