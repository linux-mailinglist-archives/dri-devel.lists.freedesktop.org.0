Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5EA6491E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07C10E3DD;
	Mon, 17 Mar 2025 10:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZgCDtb/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391A710E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:14:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-394780e98easo2686806f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742206455; x=1742811255; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MkFf4kCvzevanXv5Ra3CouyTzGW5e0hWlak1EUbm37A=;
 b=ZgCDtb/mDIBeuCfcl/qWJmnaMotrquoIMYKRRFhJ6XPERm8M/uo6pD8axl3G9V0+TW
 nrpcWkX6srwwWXa7k/jKFKjh/bT6bz/j/eiA2htMLuv0lMOTWTs28mHlaRVLhHqJT2e5
 UH5ZiZ9OcQq4PnSiwYWBGak8jBgG4WzvWvpbWSsD2LREOcM1ZruS7UuodOp+I9ctKspt
 w/ORM1tbNi1tpcjMEPmC5kIJfl5oLyh6NAyPRRMFgQkIpLF04a3rU6r4WSWaHw2t6z+A
 GCrEIml7ucwuzWfo0YvsJckqu9+hpUiIXnvwZkRm3ijYq/1Z1CgH0Dyvl+WLhExCbCjO
 x34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742206455; x=1742811255;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MkFf4kCvzevanXv5Ra3CouyTzGW5e0hWlak1EUbm37A=;
 b=SHiAoxF8wOSI2TyzVJLdufmBO5VL5EnrLTeiveUcc2jLFlGoY/SxxZBMSif6nWjtc7
 /9vrHqxutF/0uWKVw03z47o6yBpZ5BqgNnUk4i5RRCEz7Scd6lqV23NzEDE+vxOZQUDH
 /r5+lZGJ2Ug3TPshawAgaDv7vtLGnjDClrJBzUOvOE0yTspnxHNkPzefoO8mvVgM9M4F
 fCjdHYDZOjvoo5n0LzH7rbZpBqfcav0h5za4ZbTOdfGzbXX3I34BI9N6oooTtP964okS
 voylTcB3bXgh6shpFj6+GdN0MZvy18ADMxTMTqMMaUprcNjWiGFo+6d7BaU28f0HeyoV
 lx4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKOdpdwydx7lYmA0015eRXZ/aTTyQqW0IT5qj6f8T9+209r8dP/QUrundFXbEKjeitz5YrsPcwz4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6mXSQP7H0/2imIgCWjb26IknA1+V8uZIpE72f2372IBUrkXG2
 owKWSYUYbGUHkvzWxpbFP0r+75e4BQYJLXA2rEHU6ucrkpqBgON8aEwO8wqmm2U=
X-Gm-Gg: ASbGncuGmufY10nuES3lg+VexEZ7qKt+V/5+wsyWDgY1/yIIBv8TQ9kCW0gUCTnrzrF
 58kfPT3JoPPL3yopHGqW/0ANPt0wmz3Oz/YuMc58/m3dGA8AT4HgGlRe5Hcwj/odQaR5CFETqnZ
 lcQQmyC4NV6zJQoqxeuEMJAT0mdr+s5QDu+4dFIy1M62pXCIMY1uw8m/bmeERu05UnGdN7g69nq
 5Ho1/i9JE/ZVlOJM9oIqadGLfuoyvjT64q0Q48nkTSq7LPJTrzKBhoi8WF4F2nQcBpY45c0rd0z
 ZZlmqt103djKK8mfZwWk1/P6IqxPhINkylmGzCQyWEn4wHjxdm0o/gnmnc10LTrI7WVOTK+bXXl
 X6j/qG3dJ2oUqaZDSPRSCFg==
X-Google-Smtp-Source: AGHT+IFg8DYdHdUMxV4ttCgnYaZlXCiwiHVT/Zz0plPz8BiWoKXgYkhHYAZJWNOA3PzN0BKVDvL6AQ==
X-Received: by 2002:a5d:64c9:0:b0:391:39ea:7866 with SMTP id
 ffacd0b85a97d-3971d8faedcmr15996408f8f.19.1742206454898; 
 Mon, 17 Mar 2025 03:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:55a6:4776:6e68:e626?
 ([2a01:e0a:3d9:2080:55a6:4776:6e68:e626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe6a1c7sm100284585e9.39.2025.03.17.03.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 03:14:14 -0700 (PDT)
Message-ID: <78758343-b9f9-4920-977c-cab4b5f84679@linaro.org>
Date: Mon, 17 Mar 2025 11:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>,
 Doug Anderson <dianders@chromium.org>
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tejas Vipin <tejasvipin76@gmail.com>
References: <20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com>
 <CAD=FV=XUN7CcnjURs6xfVAFqvZ1WR86y8nQm=OMcrV_hYjq5RQ@mail.gmail.com>
 <CAN9Xe3TpwwBtfXD7oii3VR8-ijDN_WQe9JUTC5bE_7vFQVRN3w@mail.gmail.com>
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
In-Reply-To: <CAN9Xe3TpwwBtfXD7oii3VR8-ijDN_WQe9JUTC5bE_7vFQVRN3w@mail.gmail.com>
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

On 16/03/2025 18:40, Anusha Srivatsa wrote:
> 
> 
> On Fri, Mar 14, 2025 at 10:20 AM Doug Anderson <dianders@chromium.org <mailto:dianders@chromium.org>> wrote:
> 
>     Hi,
> 
>     On Thu, Mar 13, 2025 at 9:47 PM Anusha Srivatsa <asrivats@redhat.com <mailto:asrivats@redhat.com>> wrote:
>      >
>      > @@ -181,24 +162,15 @@ static int r63353_panel_prepare(struct drm_panel *panel)
>      >  static int r63353_panel_deactivate(struct r63353_panel *rpanel)
>      >  {
>      >         struct mipi_dsi_device *dsi = rpanel->dsi;
>      > -       struct device *dev = &dsi->dev;
>      > -       int ret;
>      > +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>      >
>      > -       ret = mipi_dsi_dcs_set_display_off(dsi);
>      > -       if (ret < 0) {
>      > -               dev_err(dev, "Failed to set display OFF (%d)\n", ret);
>      > -               return ret;
>      > -       }
>      > +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>      >
>      > -       usleep_range(5000, 10000);
>      > +       mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
>      >
>      > -       ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>      > -       if (ret < 0) {
>      > -               dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
>      > -               return ret;
>      > -       }
>      > +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>      >
>      > -       return 0;
>      > +       return dsi_ctx.accum_err;
> 
>     nit: the one caller of r63353_panel_deactivate() doesn't actually look
>     at the error code, so this could be a function that returns "void".
>     That was true even before your patch, though. I wouldn't mind a
>     followup patch that fixed this. ;-)
> 
> 
> This is anyway not merged, Maybe better to fix right now instead of a follow up patch?

If you can, yeah fix it now !

> 
>     In any case, the patch looks reasonable to me now.
> 
>     Reviewed-by: Douglas Anderson <dianders@chromium.org <mailto:dianders@chromium.org>>
> 
> 
> Thanks :)
> 
> Anusha


Thanks,
Neil
> 
> 
>     Happy for someone else to apply it if they want. If not, I'll snooze
>     this for ~a week to give others a chance to comment and then plan to
>     push to drm-misc-next. 
> 
> 
> 
>     -Doug
> 

