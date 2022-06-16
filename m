Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1B54DA21
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB0611A087;
	Thu, 16 Jun 2022 06:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54111A087
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:03:08 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b7so373466ljr.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z/6CysC4KQFR6QV0a+LcXqbeuRwoBK9qA3xXzR01nNA=;
 b=jJBZf5sR+X/C0YJwR0nZXdlcP6Mg/UWZcz8pvAkxXWXvjtleJI2UT67Q1pyo/Zg3x3
 GMQOwt66Ow7g0H3TZ3boR173BdYaRDZuZcKwV5mTsMphMY5zkUze9XFajqwbN137oH7p
 9nXdbizZiMoQdjChe0JA+k1Q/nZc4RsC3XyCGmzBPcBamRUXXsertcCrfoIBIzKVpAY7
 T4RpbmlA4Kyer4WlrLJIj5mdeIWW526RKjW7IEdyAGeLqdNoXV4Ko4NGwk6WeUzCm8lD
 qT0W9NNYySWjIcRgJwO9EYetjK/yhYXNUC+NZBLl/XKRoJ7uORUn4ESP+qHJuaYkfF/N
 Qm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z/6CysC4KQFR6QV0a+LcXqbeuRwoBK9qA3xXzR01nNA=;
 b=yDP8NbLrSu33sWiXwbDEKUVbJWq3R9ThAFZkB01qHky8TcHq6JTqajTB/Dz2GpvIdq
 AmhQIwgiVD4FKZ1DbI516+/8aueoH6el1vbQ7BB6WzsZT4/m79kUxJOokUc6wR4SqPJK
 dV/DdBix4O8+xb0su4tLGEzxjWhQlwo7VRJtjUBATlBag0bF7UMeZLnKaNJcOW56R+2R
 Nh7t86e3//GrDKkOX9YMnxndMxOx4fe0GOrcoQFMlTq6c4SEy6XhpG0l4MLzC6G0g/2Y
 ZOqRcw7dutcrKbdBnN5INCeSMkPEFHLIP/MGpLBaQO5MNyXDC5q+SxmmPb2hRVvSCiYH
 Fs3g==
X-Gm-Message-State: AJIora84eCGwP+DifRnNp1iwYWkP06M9qVsxR3uwlHZNj8Y6m8ZPq4xm
 HDL+Qr0QJjyypZKxlNKqel1wrA==
X-Google-Smtp-Source: AGRyM1v86oTwwWaYY30N6Fge9WAZr/mqmx1kTvvedOKhIeoDmVomiiB8oAcjcTIUh/5Z5daZ7v4RjQ==
X-Received: by 2002:a2e:2e07:0:b0:25a:4bb3:a2c2 with SMTP id
 u7-20020a2e2e07000000b0025a4bb3a2c2mr75328lju.450.1655359386925; 
 Wed, 15 Jun 2022 23:03:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a2e9b0a000000b0025a43eb8c64sm119450lji.65.2022.06.15.23.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 23:03:06 -0700 (PDT)
Message-ID: <297160e7-3999-e20e-c25b-ee60758a8f5d@linaro.org>
Date: Thu, 16 Jun 2022 09:03:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/msm/dp: check core_initialized before disable
 interrupts at dp_display_unbind()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1654538139-7450-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2022 20:55, Kuogee Hsieh wrote:
> During msm initialize phase, dp_display_unbind() will be called to undo
> initializations had been done by dp_display_bind() previously if there is
> error happen at msm_drm_bind. In this case, core_initialized flag had to
> be check to make sure clocks is on before update DP controller register
> to disable HPD interrupts. Otherwise system will crash due to below NOC
> fatal error.
> 
> QTISECLIB [01f01a7ad]CNOC2 ERROR: ERRLOG0_LOW = 0x00061007
> QTISECLIB [01f01a7ad]GEM_NOC ERROR: ERRLOG0_LOW = 0x00001007
> QTISECLIB [01f0371a0]CNOC2 ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f055297]GEM_NOC ERROR: ERRLOG0_HIGH = 0x00000003
> QTISECLIB [01f072beb]CNOC2 ERROR: ERRLOG1_LOW = 0x00000024
> QTISECLIB [01f0914b8]GEM_NOC ERROR: ERRLOG1_LOW = 0x00000042
> QTISECLIB [01f0ae639]CNOC2 ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0cc73f]GEM_NOC ERROR: ERRLOG1_HIGH = 0x00004002
> QTISECLIB [01f0ea092]CNOC2 ERROR: ERRLOG2_LOW = 0x0009020c
> QTISECLIB [01f10895f]GEM_NOC ERROR: ERRLOG2_LOW = 0x0ae9020c
> QTISECLIB [01f125ae1]CNOC2 ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f143be7]GEM_NOC ERROR: ERRLOG2_HIGH = 0x00000000
> QTISECLIB [01f16153a]CNOC2 ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f17fe07]GEM_NOC ERROR: ERRLOG3_LOW = 0x00000000
> QTISECLIB [01f19cf89]CNOC2 ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1bb08e]GEM_NOC ERROR: ERRLOG3_HIGH = 0x00000000
> QTISECLIB [01f1d8a31]CNOC2 ERROR: SBM1 FAULTINSTATUS0_LOW = 0x00000002
> QTISECLIB [01f1f72a4]GEM_NOC ERROR: SBM0 FAULTINSTATUS0_LOW = 0x00000001
> QTISECLIB [01f21a217]CNOC3 ERROR: ERRLOG0_LOW = 0x00000006
> QTISECLIB [01f23dfd3]NOC error fatal
> 
> changes in v2:
> -- drop the first patch (drm/msm: enable msm irq after all initializations are done successfully at msm_drm_init()) since the problem had been fixed by other patch
> 
> Fixes: a65c95ff88f2 ("drm/msm/dp: stop event kernel thread when DP unbind")

Please. Stop using commit IDs from the private git tree.  I thought we 
have stumbled upon this during the last cycle, thus we won't see rogue 
commit IDs anymore. But I was wrong. I've got another complaint from 
Stephen. I'm going to fix this one manually, but please make sure to 
stop sending wrong Fixes tags in the future.

Generally I feel like this is a sign of an incorrect process on your 
side. The patches should be developed and tested against one of upstream 
trees (linux-next, msm-next or msm-next-lumag) and then backported to 
your integration/backports/stable/whatever. Since today the 
msm-next-lumag is included into the linux-next, so you can use 
linux-next as a basis.


> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index da5c03a..2b72639 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -309,7 +309,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>   	struct msm_drm_private *priv = dev_get_drvdata(master);
>   
>   	/* disable all HPD interrupts */
> -	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +	if (dp->core_initialized)
> +		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
>   
>   	kthread_stop(dp->ev_tsk);
>   


-- 
With best wishes
Dmitry
