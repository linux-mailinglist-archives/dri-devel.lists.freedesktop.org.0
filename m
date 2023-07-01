Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0163B7447D9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE3D10E07B;
	Sat,  1 Jul 2023 08:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82C210E53F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 08:01:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51cb40f13f6so3003987a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jul 2023 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688198504; x=1690790504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/7TuI/hQwkZhyymEuytfw8tljO+CF4LNtsLy3kjnEs=;
 b=Ou/rDZBt62vQN0g6wf8sflLQ5ypZfVU4sHRXMyBJBFWIjv9gqQQLTCW8EuKRyG+NBR
 xIjScWjY5dZgKHSHb9rlP8TnNy0on9Y8TcqwZ1UzOn8GrFjI0qhSNC6opsr3C8vcxj4v
 KibRH8x4qmo93VqHlE6Dr/B1pTtee/5+fgVlV9wtt10SAMxLe1UswkSjz5eQ5BFk1rTO
 aZmeLwwNeabJtPoDohYLsGNztEwTH6mjAuDrKhZi/I4BSmNsLP4PJOIfnj8s0Cvmd383
 8Zq2GzVGIbNP+8T/GLoqX/B0e4spM8/Pdr9htwsjSif/G/lHJM5Ig4Svo0dXK9dc/6RD
 NfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688198504; x=1690790504;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/7TuI/hQwkZhyymEuytfw8tljO+CF4LNtsLy3kjnEs=;
 b=K35puhcPDfW3pg5NGUAFue9DGiVqtDjRaQKATvaNtbseTWDGmaVTrQEw8XkcPOBRWl
 LcWSJIovjaXmGhrv+l2XhMgLwOVVDvE7KXGktKwf1pKQK0p4Ps1RYW3SIMbL8p8jfHhs
 7MupaNCpQWG4+aD+zoRtAc+vigRTa77loaBntYsjJJfARRASHDqPcvOVq+6gFK0UgAIg
 oxAFDhq4pdswt3U5GkXGVfIzC5+jZRKRRVV/aBQ398XF0m3wlCFwZ4LMZ4zt8eI9ojd7
 o9SCamStm73jlBSCoky/5M5ziE2FgD1IfjGbED3FsWKXKE3ep9liIMWlEp9OLaEJyDEf
 n6rQ==
X-Gm-Message-State: ABy/qLY/syjlozYcTwsgzUmnSz/tdjIYBm1Td1KzkfYMG5xwOiJxLX99
 hqa/JIPBYuIZGhyJMTX5CXxd9Q==
X-Google-Smtp-Source: ACHHUZ5F8xUIAMknqjsoPu2of+I/Txby9lVW5dSl1hKwXHTjXld0F3vDjgHEZdD7r802EbZERuvF+g==
X-Received: by 2002:a17:907:2c66:b0:991:fef4:bb7 with SMTP id
 ib6-20020a1709072c6600b00991fef40bb7mr4187077ejc.73.1688198503859; 
 Sat, 01 Jul 2023 01:01:43 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
 by smtp.gmail.com with ESMTPSA id
 bm4-20020a170906c04400b00973ca837a68sm8996694ejb.217.2023.07.01.01.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 01:01:43 -0700 (PDT)
Message-ID: <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
Date: Sat, 1 Jul 2023 10:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
Content-Language: en-US
To: Tuo Li <islituo@gmail.com>, inki.dae@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, airlied@gmail.com, daniel@ffwll.ch,
 alim.akhtar@samsung.com
References: <20230630021906.1035115-1-islituo@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230630021906.1035115-1-islituo@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, BassCheck <bass@buaa.edu.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 baijiaju1990@outlook.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2023 04:19, Tuo Li wrote:
> The variable crtc->state->event is often protected by the lock 
> crtc->dev->event_lock when is accessed. However, it is accessed as a 
> condition of an if statement in exynos_drm_crtc_atomic_disable() without
> holding the lock:
> 
>   if (crtc->state->event && !crtc->state->active)
> 
> However, if crtc->state->event is changed to NULL by another thread right
> after the conditions of the if statement is checked to be true, a
> null-pointer dereference can occur in drm_crtc_send_vblank_event():
> 
>   e->pipe = pipe;
> 
> To fix this possible null-pointer dereference caused by data race, the 
> spin lock coverage is extended to protect the if statement as well as the 
> function call to drm_crtc_send_vblank_event().
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>

I cannot find this report. This is an open source work and public
collaboration. The "Reported-by" usually means that the issue was
reported to us, in some way, usually in public. Can we see the report?
Otherwise adding non-public, non-verifiable reports is useless and
clutters our report-credit-system.

Best regards,
Krzysztof

