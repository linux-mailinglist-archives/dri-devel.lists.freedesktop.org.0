Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F565FF439
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 21:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013BD10E06B;
	Fri, 14 Oct 2022 19:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AF510E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 19:45:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id c23so4349899qtw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U555cJ7oEdcMNPdYOmtxquYWZkPSsvlm43vBiYFKjFY=;
 b=CdFCrSGnPb39F/CIvynt9LAkFxUyTv4a7VuY3XVngkJj9X1jjjNV08qKes2/58FZMp
 1GQn9IIfIj7BAJLqmzKqDsxrPsc2LzwOdiftR7Zd7YCfVJ694NlgI2C0AVag1XYfcBih
 Im58IfhTl0zNsHfcoa1BddM73lkdldug7xFxgrOpP9SoEgOCwT9uQ35cackwPL952K6X
 sYE9YCovERBHAZGgvFXdod0wjCtipAtB2lcgWgqW9hUU4kTMYvDIGysF/M+/oj/UrRBR
 gQNZDEt2/cbcnOrJwXNhKsE3pTLmMlw+G9t7PhGYE6oKUJoNXRG2zTdcy7Q1JmjcKNP6
 ZUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U555cJ7oEdcMNPdYOmtxquYWZkPSsvlm43vBiYFKjFY=;
 b=Zbez12YzwmHWdXMi2kMpgRbBrCwelj7o32+Fm5Nvcu1kft1OWu8BuIyI4UHkPXlviE
 H/hjWKdBiqGFfqFLToZk8KnRTrRrzxDTiisaTYJPlbRh0Q2cZsTh9V8lInWF9h/+PvMU
 BjZ8id6nvzy4ApytR8fkxYbn65YbldrzboCjut4jBfkZl4tmZ5EG3bxijLniDE/4L0Zz
 OfZFXSBKV1hfp9bDLhmTqpW5UORGGcnlzluCoWZT7Sj5Yu4kP7f0Mw69i0o0srPO6O2z
 FkYKiKACOY5PGNiDCkeuBttAMiLqgAJlszYbyqdQumRnACqTd1sNCs8AN5yOizt63kcg
 FE6A==
X-Gm-Message-State: ACrzQf2NhaFF/XEGFO9LxF+maOUXE6thN3DErJy1fUHuDhB9RvmVHg8u
 FS3Q0aV3cha84AglDBkcHmk=
X-Google-Smtp-Source: AMsMyM5YwovOdmOixZxoCjVDQ3U5mtCE1JsPE8AHNwdOKu781m6RHftPl9Vq+OUrVZz+2BWZWmsacw==
X-Received: by 2002:a05:622a:83:b0:35d:44c1:e026 with SMTP id
 o3-20020a05622a008300b0035d44c1e026mr5718168qtw.298.1665776732330; 
 Fri, 14 Oct 2022 12:45:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 u3-20020a05620a454300b006eed094dcdasm1548628qkp.70.2022.10.14.12.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 12:45:31 -0700 (PDT)
Message-ID: <d8921e07-7444-33df-5d64-e5940f2665f8@gmail.com>
Date: Fri, 14 Oct 2022 12:45:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
 <20220815-rpi-fix-4k-60-v3-3-fc56729d11fe@cerno.tech>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-3-fc56729d11fe@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/22 02:13, Maxime Ripard wrote:
> The firmware allows to query for its clocks the operating range of a
> given clock. We'll need this for some drivers (KMS, in particular) to
> infer the state of some configuration options, so let's create a
> function to do so.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
