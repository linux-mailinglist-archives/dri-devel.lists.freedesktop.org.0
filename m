Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2864C1EEE8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85F10E917;
	Thu, 30 Oct 2025 08:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ehwwDjgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5AD10E917
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:17:42 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso582122f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761812261; x=1762417061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1gVKZ9YN8sZoUBOLwjil9dfNLuOB/p2Y81xFPY004kY=;
 b=ehwwDjgc3nbk0FBuO91v7gL2focJzirhD4Vs/LStHq3/8sLvJ7JGybP70Q4MrZzcEt
 hj2qNMrxCz7nzuTNokcjUriXLEWYgRRGc5FyAxOimoOOalcGuYQNRH42DLgLnH7HdHNV
 8IET06q0hCdTFZNYn2h3KCw+bDSeNT2KzooiAw79S2pxEmLivo9GUSbf5VpXuQhviS6P
 nNuJmntXIP9HwdUI76b+K7xKLx6imcoLJ27xHWQMvaWHlrvj8fdf2Io1g4iwH3MD3LuQ
 O1EcXDYRcL5kT5FTDXz+NYOsxfMhOPr6YxkH0ZtWt04luc9T1LatabYwd6TWiEjy28Lu
 yAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812261; x=1762417061;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1gVKZ9YN8sZoUBOLwjil9dfNLuOB/p2Y81xFPY004kY=;
 b=SflnIXrD7gHr5q0ylS/TtofNOGAmVckZAW/8L/ouZkxUa9B4Qifnt/rhaXMLIl06aF
 NN1nHPG/jpdAK1nGJx3j7mgj20ngyuMIFidzDuuXF04MVvzhBEHoxmHclnGh0APtAutz
 cN8nCkRLLlNXRi7kBezKafj5GOipzKREgHqXESpbQ2iXQ8NiT/3jyeCPEw+tgneD/19L
 GgVebmYVJkDKRU4tVncN1KU28yoih7r/Q2GUOXmPvxdBsdzhu7g3Bc4zb/KQpYz6qVv6
 2oaSJTSgldoYsxJ4y5anl9mPiEAqtjya211s/sGcYe8C8jiL0PnGocyTr8yeuId5essc
 lTNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeVMnmWLhqbTAq0tnVKAo6M5qmNYQbi7NYoHg48pabfX5OdTEYt2s/FDu9eeIaEO1ddbzNbuGnV/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRG9OJxA6lAxLtKmGywOPdMxqmei0Kh65/B1ySIXj6S/P9/ptn
 wq8ovP0yksoI1UvgrkcCabv30nyqXAzPtvUPEUijgbC4chd1Y8azQDKukrAxgp3Tqrs=
X-Gm-Gg: ASbGnctjlkYFzTtfipa3jGvV+hKIRsSmhikPmJbUqnPswb6FnWSXecIBkQo+GcCjyAU
 nDDKNmkqLlI4puOSCmU/jlw46pkoti1FxZ9q/Pkxge40Qf62gb2WdmYCKUNL2IrNVGHHSKlbj3a
 9vdixG8wpzlx4ymssRBV799l79m4MJOgblKcBBv6hws/ZQubCtxKmALkWE1uHKkiPiCZTK9kRmZ
 G4M0hQCw14pzKFslMakvKPfeksT0GJVHwqzjVr+6e0JkzOMhCadBODi9XZeFKHz20dQlKnCHxF/
 Q03+y4cKhAouEtjywBUKEKC3/T3CGykWh4RHTAHtpLrSmgq9EOsijM5DHQD9MVE1eHdTPqlb3ne
 4HGd8WOr12XSs8lKuvvEjqh2VcoTPuUl6sTyBXFvLegtrXFrI25VPHpFFd9WheV9gGqqU1+JN9y
 Ip8FSEHX825IUYpykgPUq5XfWi/u6A2zNmK0DMr6hLY4mFa8rD1/ZS
X-Google-Smtp-Source: AGHT+IGRMDnVKGMZu+9Y1CP/bFmSno7jyht49nowkG0CEnVkboBLPR5O/60eu2OsoH0/Yi48rzAk5g==
X-Received: by 2002:a05:6000:43c6:20b0:407:23f7:51 with SMTP id
 ffacd0b85a97d-429aef715c1mr3237226f8f.1.1761812261194; 
 Thu, 30 Oct 2025 01:17:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477?
 ([2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728aa8a9dsm26326715e9.13.2025.10.30.01.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 01:17:40 -0700 (PDT)
Message-ID: <8cd614ea-fed9-423e-a90d-8c4831426cbd@linaro.org>
Date: Thu, 30 Oct 2025 09:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: linux-next: manual merge of the backlight tree with the drm-misc
 tree
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251030151428.3c1f11ea@canb.auug.org.au>
 <86a0cf86-42e6-430b-b193-f60d6182f416@suse.de>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <86a0cf86-42e6-430b-b193-f60d6182f416@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/25 09:14, Thomas Zimmermann wrote:
> Hi
> 
> Am 30.10.25 um 05:14 schrieb Stephen Rothwell:
>> Hi all,
>>
>> After merging the backlight tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: array type has incomplete element type 'struct regulator_bulk_data'
>>     41 | static const struct regulator_bulk_data tddi_supplies[] = {
>>        |                                         ^~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_prepare':
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:15: error: implicit declaration of function 'regulator_bulk_enable' [-Wimplicit-function-declaration]
>>     72 |         ret = regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>>        |               ^~~~~~~~~~~~~~~~~~~~~
>> In file included from include/linux/dev_printk.h:14,
>>                   from include/linux/device.h:15,
>>                   from include/linux/backlight.h:12,
>>                   from drivers/gpu/drm/panel/panel-synaptics-tddi.c:8:
>> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>>        |                                                                                  ^
>> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>        |                                                           ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:72:37: note: in expansion of macro 'ARRAY_SIZE'
>>     72 |         ret = regulator_bulk_enable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>>        |                                     ^~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_unprepare':
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:9: error: implicit declaration of function 'regulator_bulk_disable' [-Wimplicit-function-declaration]
>>    101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>>        |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>>        |                                                                                  ^
>> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>        |                                                           ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:101:32: note: in expansion of macro 'ARRAY_SIZE'
>>    101 |         regulator_bulk_disable(ARRAY_SIZE(tddi_supplies), ctx->supplies);
>>        |                                ^~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c: In function 'tddi_probe':
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:15: error: implicit declaration of function 'devm_regulator_bulk_get_const' [-Wimplicit-function-declaration]
>>    183 |         ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_supplies),
>>        |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:201:82: error: expression in static assertion is not an integer
>>    201 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>>        |                                                                                  ^
>> include/linux/compiler.h:206:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>>    206 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>>     11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>        |                                                           ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:183:50: note: in expansion of macro 'ARRAY_SIZE'
>>    183 |         ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(tddi_supplies),
>>        |                                                  ^~~~~~~~~~
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c: At top level:
>> drivers/gpu/drm/panel/panel-synaptics-tddi.c:41:41: error: 'tddi_supplies' defined but not used [-Werror=unused-variable]
>>     41 | static const struct regulator_bulk_data tddi_supplies[] = {
>>        |                                         ^~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Caused by commit
>>
>>    243ce64b2b37 ("backlight: Do not include <linux/fb.h> in header file")
>>
>> interacting with commit
>>
>>    3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
>>
>> from the drm-misc tree.
>>
>> I have applied the following merge fix patch.  It (or something linke it)
>> should be applied to the drm-misc tree.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 30 Oct 2025 14:57:03 +1100
>> Subject: [PATCH] fix up for "backlight: Do not include <linux/fb.h> in header file"
>>
>> interacting with commit
>>
>>    3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
>>
>> from the drm-misc tree.
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> I think we can take your patch into drm-misc. Thanks for fixing this.

I'm preparing the patch right now.

Thanks,
Neil

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/panel/panel-synaptics-tddi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
>> index a4b3cbdebb6c..0aea1854710e 100644
>> --- a/drivers/gpu/drm/panel/panel-synaptics-tddi.c
>> +++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/regulator/consumer.h>
>>   #include <video/mipi_display.h>
> 

