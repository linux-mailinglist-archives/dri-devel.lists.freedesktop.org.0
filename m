Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A869F4B8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 13:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673D10E947;
	Wed, 22 Feb 2023 12:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB4110E442
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:38:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id n2so6550552lfb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
 b=GPy98UG1hDeEOAbM0MS3M8rzgN8mDX11UGL25N3HBRXisH1UpOsusVegf+3elyOg3x
 +Wcb5a0IZkREnVJKKWHsX7oYOjYtDEjIzjqeDqvdf3vFnlNO9WMykDg++hApTH8E8iz2
 Tj3xVjb27xBo+cB9OHps3IKea6jdpV0t018IEscafY4xBDi4oZHPQL9A5dUh5JvNtVm6
 R2oK5QRwIUgUmHehL3O9UlLpttppXdcyOS+HnDE9a4k5ATRBq6rjl0LWXZh2LlTSfTsr
 8Mso/9A+vQbbgZ5EeSduvwSMCAnHwMLtUp2/DzwL+LIFBs2dQsixQuVtTzztJFYVymGG
 4GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XKuEZcMqbM7zILS9cxxCfU68F8dK5XWQIn5402tHdEc=;
 b=AaStsH5oc1sJ8y6gWUHKgLJxZ2Mpou9MwYTtG493jv8AeUVBXRtZLwX/Jszl05Gx9B
 oOcL4F+xme95qPQfUU73MNNM/bRRVcI1UXhcwGAbmeiWv+YTH650uKfgQp1CZ9MMH7jY
 mTxvbMxph3UM3EQj1DIcrm2G4s4cAZtt3IP4U07RQILBcmWb7+e5xprsMN56vwXxjHIZ
 s0o8M62hyFTgauvMJ1WGETiPxSjnD2TmosA8a9aNEbdK3rmLEs0/HGFk4YBgGMc8ykd7
 QPGZ9y+RJj0TINNL7dpSucN0O5vRP1md72ErYN1Tl7Zxw0XEA3TohPVeWrxBYvV8BAa+
 FNsg==
X-Gm-Message-State: AO0yUKUfjOo3eWNqw5fNv2/kOUZ+fwgSJWCPPPaPVe/Vdgwvxbl7zzG5
 pPhforn1zeYM5yiqDQKozWcnzQ==
X-Google-Smtp-Source: AK7set8WUZHmq/ZcY7/crcIYkICMSvCczISO0Ju6oISPcKN2jF10u6hOClbBs7+/DIyEr6Y7bPl1wQ==
X-Received: by 2002:a05:6512:947:b0:4a4:68b8:f4f1 with SMTP id
 u7-20020a056512094700b004a468b8f4f1mr2922927lft.55.1677069479041; 
 Wed, 22 Feb 2023 04:37:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ac25589000000b004a9b9ccfbe6sm42818lfg.51.2023.02.22.04.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 04:37:58 -0800 (PST)
Message-ID: <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
Date: Wed, 22 Feb 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com
References: <20230222123712.5049-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222123712.5049-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 14:37, Thomas Zimmermann wrote:
> Do not run drm_fb_helper_unprepare() if fbdev allocation fails. Avoids
> access to an uninitialized pointer. Original bug report is at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
> Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/ # 1
> ---
>   drivers/gpu/drm/msm/msm_fbdev.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

