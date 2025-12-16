Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75328CC1ECA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A217E10E8F4;
	Tue, 16 Dec 2025 10:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x1n3sntI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E637710E91B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:15:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so2021145f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880133; x=1766484933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TC7nDl1wifuEDkf59f4yFIQZTBJ14bBd1H1iofC4YrY=;
 b=x1n3sntI3OIJbCr7lqjf323YAy+34buAYu6u40dj2rSIhfKXw01deawy2Aqh2lK24u
 8OYOe4J9Jlo3qK0g66dmp813yGa8Rvhh4qYII1FGTEAx1K2XBD5JI7RThRxkf+h5NjBj
 GEDKDKW6uidFbs9qlzzxzXiWlPTdLpHA7qZITmeZKbaDiXTsTzrJBFMbPcFctCQci/ao
 9MKKRa+HZwsZW3nC8zXXfi/fRZ/OElfzBfchddmlzBYogziJ1ky3y4FMdqZbPO59CLiJ
 v0QowXAIp22jbNQ+/AgDVorRoB0uGCo57erN2ENO+1n6NaefHFUSywob9KGOawlJLcQr
 do7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880133; x=1766484933;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TC7nDl1wifuEDkf59f4yFIQZTBJ14bBd1H1iofC4YrY=;
 b=K6tCs4LcAkz+/MVJuhnWmGH5VoWnZhiXYsHXkf4g7WGwo+toGKxVUvOWr+WyT9g01j
 0NeDW2HV+Z4ji0GX1EZ+1xt+PS7JohP01fZTho5WVaPpl7snlGRa/3QZi0POgZSgsRFJ
 ymV6JqSsLb0yjrbzi8+lovIlA0n3IPmdrVXoVfYiMPo8LJ70j2xb0GIpX5sFyDrntjkX
 bInG+yoNTJ3mG/XvKJu/ZgVL5TzWU26Q3pRbSfCTSErfyZJddnXcCCAext+XUf1etPto
 7JteMSek+NspsBTOFIJypOufrIbQZYNJ55g2MANNoYhwh6wFxcauHU7P6s9wWoGQ0BoL
 hTmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCDIoR1pInVT3uLtYHKFL8Ujztgyk9faG6062+7mTNXzVKs4/vVi+RhkcXNkiqIoOQ/of5Pkax/fI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoLDH9Bg78tCz+H7CQ9+FR+bW6GdxWTnfqD3ssXq8CY7c533f8
 ZbTQeO4g7cxWvcEH9zVGih6iP9sM2pNoGmxMJ5AVZNiVQLD3/YdBEHz3je5o1Unf6EE=
X-Gm-Gg: AY/fxX4o8Va2ONOmxA+JhLreNxW08eHTMSzPf9arlnXFPAUmW9kFLgcr+nRGEHRCNkD
 e2aEwCpHUNmvdS+xnjN+MgqiylXdO2evD6BCzc5pFSs923IWFN379ngazbW/hCNfjOh4F+16s9p
 8XouaVmvW/2AmCffhB4dblysjPD+8oDKUc5rZlHVt9rLBrl+W3kmtrVowniZtDorZNXKFxBCsVx
 9JTtWGJvnlpPB8gzbZo6io5/DBnuj8SXpmTcAjYvUso6sVoPgBg7Sja/dbyKMyMcOQKdIR4ASwi
 1GnrXwLLB9i4qigOy3WrjQTBhcKNv/as3BC6LBJcCkAGC+44zzINehxhkg/cQCVEdbZNc2AkBt1
 MpYVvX5iA2/fLoTncefLjoV2nOCbZLbSrmdQ9o0zqgIUDuPDKl5BnUqyWzpUoorLK5BG+YNI8Tv
 gLb8VKpskrmIHyWqjx2afC5CeLZvOi8TrFcz5lTjj4GTn8p+8b3G52v/Lc48tDCnw=
X-Google-Smtp-Source: AGHT+IFNmWmeVfREbnlawrLbiJWYchJrdkbwmJ5e2QA/GyR67dJoN5aj8rejIsQe3Lih0MgLxHiC9A==
X-Received: by 2002:a05:6000:4010:b0:430:f2ee:b219 with SMTP id
 ffacd0b85a97d-430f2eeb65emr10561462f8f.25.1765880133260; 
 Tue, 16 Dec 2025 02:15:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2?
 ([2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f4126477sm18772676f8f.10.2025.12.16.02.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 02:15:32 -0800 (PST)
Message-ID: <8ef57d2e-9a43-434f-89d6-e99c0892abef@linaro.org>
Date: Tue, 16 Dec 2025 11:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: osd-osd101t2587-53ts: migrate to
 mipi_dsi_turn_on_peripheral_multi
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Matt Smith <matthew.j.smith2@outlook.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <PH3PPFAB08B9FD3DE70CD833C0C470243EE99D4A@PH3PPFAB08B9FD3.namprd19.prod.outlook.com>
 <e80fd81e-fba2-4385-9fed-9d82b2e5b2cf@linaro.org>
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
In-Reply-To: <e80fd81e-fba2-4385-9fed-9d82b2e5b2cf@linaro.org>
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

On 11/20/25 08:52, Neil Armstrong wrote:
> On 11/20/25 03:25, Matt Smith wrote:
>> Documentation/gpu/todo.rst lists to transition away from using
>> deprecated methods in drm_mipi_dsi.c, so migrating from
>> mipi_dsi_turn_on_peripheral to mipi_dsi_turn_on_peripheral_multi.
>>
>> Used commit e139c0eb22ce ("drm/panel: mantix-mlaf057we51: transition
>> to mipi_dsi wrapped functions") as a reference.
>>
>> Signed-off-by: Matt Smith <matthew.j.smith2@outlook.com>
>> ---
>>   drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
>> index 2334b77f348c..45baf2c238d2 100644
>> --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
>> +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
>> @@ -58,13 +58,14 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
>>   static int osd101t2587_panel_enable(struct drm_panel *panel)
>>   {
>>          struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
>> -       int ret;
>>
>> -       ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
>> -       if (ret)
>> -               return ret;
>> +       struct mipi_dsi_multi_context dsi_ctx = {
>> +               .dsi = osd101t2587->dsi
>> +       };
>>
>> -       return ret;
>> +       mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
>> +
>> +       return dsi_ctx.accum_err;
>>   }
>>
>>   static const struct drm_display_mode default_mode_osd101t2587 = {
>> -- 
>> 2.49.0
>>
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

This doesn't apply anymore, please rebase.

Neil
