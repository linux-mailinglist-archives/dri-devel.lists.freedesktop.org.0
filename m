Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47382A56482
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32E310E9BB;
	Fri,  7 Mar 2025 10:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DRGVePfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DAD10E9BB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:00:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so18214285e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 02:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741341643; x=1741946443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ZiZ03YGBKb3coEK6nEaoU1/wKBDZKe/oaQy1DX/VsZI=;
 b=DRGVePfnmqjTlrDyjORlrFIj0V3tdyvUbN6/reRWFUMZJFxlbY2xhp4AuOe1IR+vzk
 p8lsmSOY30o4Rr7NQQNAJ6hLlYK04OElUJlQ6Zs3I5FZvZLCw2Mz1oQ4XOdN1Tqwpe3S
 2wHz2QGiqV6SvyLKgW+HAts7UqVIWX6OUfreN2aVh+0wJBjFB0qR/AouK7epMaJcW3+b
 I2iKjURKaEPK0ImGkZowz5cZ3zYfwTS7kSmvtvWIja58PtRSnDo2FrrCZeUV1XWQQM+a
 gSp01PR7hLEyQeZ4bpBi9BOb7crGqxWyTXgBIVhK4X0S9OnYnIGW9LEftXXGwjyyL4iI
 f5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741341643; x=1741946443;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZiZ03YGBKb3coEK6nEaoU1/wKBDZKe/oaQy1DX/VsZI=;
 b=ix1PammTzVqY0uZ0m4czl+824vLjaaKg1geqceVjCCscOpY1Ts8c208Tf2oO9y8tfo
 jrxljB8lQscRL1l5YYjX1No99n3naKHYR091CjjJSCPM0YwV/7Im1H3do06pDvw9+TFb
 6Mcjwj3xCJDCxHMe0zUy2/gKqRKwrGsJ3S4eOAf2+MrCe/JKHQOLI8bra5AAaxWShrKO
 OI8W49jSE0ixbDj9l82fJLmfhIcliZztTdzSksC3PxX6fG7ffZIZTvTlM8t/Ruym1VBe
 kRBWtiM/A+8s4zAZxQ1hXTls4BkOxwh2gIWbNVOJBXbkSK2qgWK1VE6cIYwA2kJHLcUg
 +wJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyncmJuDvGb6NyoY5RARuwdJZFFOcf2EiSdBs9AuLSbaSqlbN+gHYdCgo66imBL8qeSVmw6/9M7V4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZmo4C2cPVafL8NSLdRpSXgCVjCIuP+UN7ypFVpGcva5MCpsmU
 L5lVt+mt6Eaa12jkV77AK8ZnPBUFpLRR0AoG81fwI5McfPSn0ZqR0ExhCDvdVeU=
X-Gm-Gg: ASbGncsCIbXC4hJbJ+4h+CTTwl7D99eLYd7eC3mIOVMoErENWpbNVuFUk4muYQIlb3S
 t3MEWzpfORzCnG8qVmOz/t0N3zH/I6Q7JmHYJ+fpmDq3hHvm1VGrnqjSGlW/MgDKnd2g04wpFdd
 V/KUAaiT3Qci2g1p59iUlPwW7UwpgCAAWyWo6ujIcg4CXcj8/UFij/FzTc2Vot4DQJcRPwKluj6
 HVZvmmY9bybjg325IvGQYi0TyUBzNmQiLWGRgeHHTIjALavofDG66OghJGi2d8Jco7VWwy6VVfq
 4TIIncLWYLm0fFfy047JZe2ajwHbGqsTuKDTjHKqrWR+utEkOzN3IrDBhclmUQM8c9xx2ShBKXm
 D4VT99oTzydqmfHZfsmWpaw==
X-Google-Smtp-Source: AGHT+IFPQHVquoDW1pJCsGtMWexMsdgKcxI80ZyycE0KtKJsDWGaMQZbcZcmjt9/NZ4f7dBj3xOoxg==
X-Received: by 2002:a05:600c:524d:b0:439:86fb:7325 with SMTP id
 5b1f17b1804b1-43c60231b64mr25000755e9.31.1741341642950; 
 Fri, 07 Mar 2025 02:00:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1ea4:9158:5668:7977?
 ([2a01:e0a:982:cbb0:1ea4:9158:5668:7977])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c102e01sm4915052f8f.93.2025.03.07.02.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 02:00:42 -0800 (PST)
Message-ID: <9696fd4c-b53f-41c4-9f8e-ae24d055210b@linaro.org>
Date: Fri, 7 Mar 2025 11:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
 <0d473dc1-cbbe-4a1e-933a-938438db24f5@gmail.com>
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
In-Reply-To: <0d473dc1-cbbe-4a1e-933a-938438db24f5@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2025 18:38, Tejas Vipin wrote:
> 
> 
> On 3/6/25 10:58 PM, Doug Anderson wrote:
>> Hi,
>>
>> On Thu, Mar 6, 2025 at 6:05 AM <neil.armstrong@linaro.org> wrote:
>>>
>>> On 06/03/2025 14:43, Tejas Vipin wrote:
>>>> Changes the novatek-nt36523 panel to use multi style functions for
>>>> improved error handling.
>>>>
>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
>>>>    1 file changed, 823 insertions(+), 860 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>>> index 04f1d2676c78..922a225f6258 100644
>>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>>> @@ -23,10 +23,12 @@
>>>>
>>>>    #define DSI_NUM_MIN 1
>>>>
>>>> -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
>>>> -             do {                                                 \
>>>> -                     mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
>>>> -                     mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
>>>> +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq...)      \
>>>> +             do {                                                            \
>>>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);      \
>>>> +                     dsi_ctx1.accum_err = dsi_ctx0.accum_err;                \
>>>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);      \
>>>> +                     dsi_ctx0.accum_err = dsi_ctx1.accum_err;                \
>>>
>>> Just thinking out loud, but can't we do :
>>>
>>> struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
>>>
>>> #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)      \
>>>                  do {
>>>                          dsi_ctx.dsi = dsi0;                                     \
>>>                          mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
>>>                          dsi_ctx.dsi = dsi1;                                     \
>>>                          mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
>>>
>>> ?
>>>
>>> So we have a single accum_err.
>>
>> Even though the code you used was what I suggested in IRC, I like
>> Neil's suggestion better here. What do you think?
> 
> I like Dmitry's suggestion [1]. If we went ahead with this we'd also
> only need to equate the accum_err for the few msleep calls. Since it
> does change the behavior, I'd like to hear another opinion on it before
> I go ahead with it.

As noted by Douglas, my solution doesn't change the current behaviour,
and I don't feel it's fine to leave one of the 2 DSI links fully configure
while stopping on error on the other one, it will lead to incomplete situations
and the debug purpose is not really acceptable, either it works or it fails entirely.
Leaving an half configured panel can damage it on some OLED like technologies.

Neil

> 
> [1]: https://lore.kernel.org/all/p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb/
> 
>>
>> Other than that, it looks good to me.
>>
>> -Doug
> 

