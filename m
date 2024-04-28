Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C968B4AA1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE66110FA80;
	Sun, 28 Apr 2024 08:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGp83fJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAF910F99E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 03:30:07 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3c709e5e4f9so2209285b6e.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714275006; x=1714879806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kQ5VTPH2nor9MJto5pDIHRFuErP8fLZdpGXB3ZZ2RNE=;
 b=PGp83fJFnN+lqg3xlZDPQF4m5s/ETQShrfd6RaPuhl9UzIxae9539lkTXcUs3mIQ/L
 DOZp1U9l0wchogfAF0WWzYdP7aocxjqhjNUk4IUqOPViC3KzOw/PtC+8+FSPe6LWBNhb
 ocbIW+60C0HMgoRVk5Ua8nG1p4BepjkcY5ajxvOUowRADgZNATu0dhcaFxP7/Rwdtl2Q
 /beHMIFshTY1pkpztI1AKxXbhHzYAczKT7qGVLqawTeAhMXexcEe2AQapKt9Ng5p82zH
 qiqHyiuMWTg+0d4R64iANiWVOsz6cihtJs+CwizBhJgQKv9uxsyZc7AHFSdxFMqNZL1z
 LtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714275006; x=1714879806;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kQ5VTPH2nor9MJto5pDIHRFuErP8fLZdpGXB3ZZ2RNE=;
 b=PTd51488ofMs3YytQHLykJDflgnWrGL0tjFTjn6E8Z9H3H6wkeFAU0BTGH7MCjtDqX
 /T/vsLxliLaYnf3BcvbSPeQUHzshdElLgZGOjTqF2ccUfoikv1dgVnfKwaiktsJlA3GQ
 Qlda5WY3vYBPZgUHV29qMWeSOyccpS0aC8Hz29rWaVtD2nhjltx7CZU0taS3EvTsoIXz
 6pFyLX2f2nBsrlKCHDz0sQbZKJSo06Eb69MhqPRDF06JMEbfA6JlZ05oxEK8maUqw7NX
 JoInpcoAxdYc4TVVVWxnWzLmI+gLpUg3d1PANQu9Pvso5eGV8MDvr5QLywNmkuWSdthg
 WmGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyApe5edg6LiFaQseirHt5wM1y5luKtCCQ6AXLdCspo9gVzinLIL0q+NxIvq1DnbHC48ehKFYs/9EPG2YvaxB1lDeV5IJsD//qdvOzvt1d
X-Gm-Message-State: AOJu0Yyw8sDCZWB4ad1g1RbO7E/j+4oxHYjLgDJE18Er8INcsxeCqxWL
 0WAv8o99pYujU4Ty0ap1EwOQDGY17L3Bfe/jOUOdwAn7f5ghuGL5
X-Google-Smtp-Source: AGHT+IGJkj+yYHDRxtFh21/KcaEEA+iw75QHG9gavNpfANp/PSWXvk5mSppHJic7qjN9s62bkRVoDQ==
X-Received: by 2002:a05:6808:1594:b0:3c8:41ed:8738 with SMTP id
 t20-20020a056808159400b003c841ed8738mr9142094oiw.22.1714275006042; 
 Sat, 27 Apr 2024 20:30:06 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a62bd08000000b006ea81423c65sm17563901pff.148.2024.04.27.20.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 20:30:05 -0700 (PDT)
Message-ID: <89aa81f6-8945-4448-b298-b66ec4d386fe@gmail.com>
Date: Sun, 28 Apr 2024 11:29:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/panel: Add driver for Synaptics TD4328 LCD panel
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-4-e0aa05c991fd@gmail.com>
 <c792a2dd-3183-4d39-bda5-4a8c30a476ff@linaro.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <c792a2dd-3183-4d39-bda5-4a8c30a476ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024/4/24 23:58, Bryan O'Donoghue wrote:
> On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
>> From: Xilin Wu <wuxilin123@gmail.com>
>>
>> Add support for the 1920x1080 LCD panel driven by the Synaptics
>> TD4328 IC, as found on AYN Odin 2.
>>
>> Co-developed-by: Junhao Xie <bigfoot@classfun.cn>
>> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> 
> checkpatch.pl --strict somepatch
> 
> CHECK: Alignment should match open parenthesis
> #207: FILE: drivers/gpu/drm/panel/panel-synaptics-td4328.c:150:
> +static int td4328_get_modes(struct drm_panel *panel,
> +             struct drm_connector *connector)
> 
> total: 0 errors, 2 warnings, 1 checks, 269 lines checked
> 
> ---
> bod

Ack. Will fix in v2.

-- 
Thanks,
Xilin Wu

