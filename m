Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A67746A9F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE99E10E29C;
	Tue,  4 Jul 2023 07:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6B10E29C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:27:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51d8fa4dbf9so5936533a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688455677; x=1691047677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3YoY+iSD6Np9p95iaJOkPaZT5d5FqBDJwy3gxODYPIM=;
 b=ZYwoymNdL4pHjRlq3LRAPmwddv8/opiq5FRFEUDc312dEzBw3nUl2ptJ81guCMMxkY
 Q0Jo+fxLK+NYOVRi+TgUFm55kxo4lgi42H0vZZUvsUSLxyiXkOmSwCgRoWJ6yB07OHgw
 kB6Bqp4U7xwf+RltOIXSkgdIflGTCilR+Yskip739qZZKZ9dV9qV8fEHfRATnCkI0MbI
 JpmJHH/aw9Rm4Sw7EfoBvFtYEJULviPOT/l2PCP0LccJfsPlzOu5zWXdATNa8pXisFMU
 jOJ+gvrNzf3k7QzkNY9em9+rbwdVr2xnGNDS0jffO01vH3ZgDyUou4cunpsMcZMzgni0
 4Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688455677; x=1691047677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YoY+iSD6Np9p95iaJOkPaZT5d5FqBDJwy3gxODYPIM=;
 b=FIx8DgjNXyL/f5qppu87zYe6UXlMKT6gSeN6PVDW8+ii9Fukyo/ep23OMSnGd5SOpI
 JNTdZZgWfaAFmFsltGF+6Pq1MUxnzLghqA0Aw/Qvt8r7PlM6qQVfxYXVYx1AYb4BeXea
 4zCiK6DK6adyILGJfnbvi9MVYvzPHwQgOzyistLjzcZpN80WbdFn7Y1oICleL/TYuLQF
 OdILpJsz/pC5GK6WfhPmKLXjI4xSxn6wK6RcP8k23iAvl2OO6chMSqJx4fkWJYt36uGh
 tPXUS9SThjQPCBp5Zo7vOPbPao9z8F7dC/lHkqAxrj02LUnfyJ6cGPULGXHR9ZIO6UNr
 cf2g==
X-Gm-Message-State: ABy/qLZwxqWl3WedkKolQ6x0P2Zkj4baGSZdfN8ndeZHloCE5MX9xgWG
 fdQSnanQkhrfhTTjR0M7Xn8gBg==
X-Google-Smtp-Source: APBJJlF3lwsUUl5he9hWhqVwK2wsuzCzvElTQPZv9+BAYLgg8PPM83ZwmFKGnT7RGtq4NA18Bx4BqA==
X-Received: by 2002:aa7:cb47:0:b0:51e:d4b:3c9d with SMTP id
 w7-20020aa7cb47000000b0051e0d4b3c9dmr4847864edt.23.1688455677150; 
 Tue, 04 Jul 2023 00:27:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a056402065500b0051de3c6c5e5sm6010424edx.94.2023.07.04.00.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 00:27:56 -0700 (PDT)
Message-ID: <1df9a1cd-980f-3f09-fbbb-bc24b80af8fb@linaro.org>
Date: Tue, 4 Jul 2023 09:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
Content-Language: en-US
To: Tuo Li <islituo@gmail.com>
References: <20230630021906.1035115-1-islituo@gmail.com>
 <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
 <CADm8Ten-1yBdQFaETvS19j=_UFC4GEJqH38DU=7xPXLkOnvvzg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADm8Ten-1yBdQFaETvS19j=_UFC4GEJqH38DU=7xPXLkOnvvzg@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kyungmin.park@samsung.com, alim.akhtar@samsung.com, baijiaju1990@outlook.com,
 linux-arm-kernel@lists.infradead.org, BassCheck <bass@buaa.edu.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2023 05:00, Tuo Li wrote:
> Hello,
> 
> Thanks for your reply! The report is publicly available at
> https://sites.google.com/view/basscheck/home. And this
> patch is from the 8th report on this website.


Great, thank you!

Best regards,
Krzysztof

