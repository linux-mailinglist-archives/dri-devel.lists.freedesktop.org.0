Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB02746ABC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B8210E29E;
	Tue,  4 Jul 2023 07:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EAA10E002
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:35:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9926623e367so607391266b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688456153; x=1691048153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JgkFjDmJN4L2mqgKB/0BaH17v6L6ydu/UCB0MlAoBco=;
 b=XbB2CLRM6WmaMSTNEHIOJpeVYs4bCWJglJGn6V25auCeVm/GMm7BQ+zHJDDIuAoUoP
 EtBS1J62jz6pz3PEc4w8Lkw+tnRAHpF0Wvw7+Be3x1jMgWZ70up0ou0i5WzRYhYGr0+L
 kykn+LoNoRGk1ijBZrBNq+i5xKOKgJszEmyWgxNDtYImT/SKoDvlNqExo+495CilRhLK
 +Ok/X/pxJPZyh6NpNaJ/Pv0zbri5fyNQlF/p1vRhlNnOoaBoXOAvrxZR/uyWDBI4aCoa
 VwKX1lqhkIQONhRSle5dM4ROKmMoAyl8eOFZU79d0QTmF8Q2a/aWhCwZviVvmKtIViQ7
 G+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688456153; x=1691048153;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JgkFjDmJN4L2mqgKB/0BaH17v6L6ydu/UCB0MlAoBco=;
 b=N5+qxESCaOvt/qOslwResYDbeLQdskL3/D91uYqBttPf5PQ574+3B2s8itbDKShSMw
 BxNEUp16aWiaOvlQx2WvvO5U0mEztpxhaXE63RCAfo9EOVDQ12Lze/OcjUFPW9dYyzc6
 Ra/TXTFuVb6iEQpTKH2YytdD6FpIgPgzQqDHUR6+njwgq8tr7smT2VhtaM50/LrpV6tT
 jsfMbiH5BT2OVsTXz54ICbGgh3Yy+kNAk73kK/wGZ9u8F/uD8/zAmKPXnlDvY5Q0AHFI
 N5uKXTyBLxjf6HDy8fBKQ67B51U2eV+F16G+8+XJvg7iNeJS/oA0X6mLrNKrdNkbSXA3
 uo0Q==
X-Gm-Message-State: ABy/qLYiPjNkUCMi6YJ49PDixPMbxHrprD+gfUPp+3d3nlm6pQNHocIk
 ikzJT72qg+zxqYcB6DD81Nozwg==
X-Google-Smtp-Source: APBJJlF8KCRzGhgGld7oGDnmBvSCdNcyLsFRT7uwR9ICZAIjQ65DHVppLpZmPi1mo/hvSiAXP/RX5Q==
X-Received: by 2002:a17:906:ae51:b0:966:471c:2565 with SMTP id
 lf17-20020a170906ae5100b00966471c2565mr8331205ejb.48.1688456152720; 
 Tue, 04 Jul 2023 00:35:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a1709065ada00b00992025654c1sm9721649ejs.179.2023.07.04.00.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 00:35:52 -0700 (PDT)
Message-ID: <88edab79-5f9a-007d-f2e9-d264178fe80b@linaro.org>
Date: Tue, 4 Jul 2023 09:35:50 +0200
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
> Signed-off-by: Tuo Li <islituo@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

