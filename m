Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86077942C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FFF10E6B1;
	Fri, 11 Aug 2023 16:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5C110E6B1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:17:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so3470437e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691770668; x=1692375468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B2gSBPKAlfj96SXmOm7KUFn9UQg8rFevKIpSF4EFD0s=;
 b=VbF1MsQVpjuK29p6lUu0cazT3/Cq+2NXuthRHhd8u5uDDMW/p0J++4lL/oWuaqzhsF
 a/mMZxAiJF1Sl11AVKy9iik9m2YmTr1ljou4gIYOGVvv6XTZNx7KKj4KaspbA2xpkV9T
 pb3nm5HgEKXCKj3U5bmPTevnzp881LXdE5nwREQayrI3y675HdNGSHiS2nV8pV42RoJS
 x8hhpZwFVsfi5eizMOaWA12LQx6fJOhgrY9SMsCgIZAgPLgp58so2WKpzY0qDcRCeXAs
 jSozEFRUN9p8i+IsKQ0hZtu9EwdQJgkTix4/kEoYZlZKufStdRag8W3SfEcvaB4blIVD
 VM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770668; x=1692375468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B2gSBPKAlfj96SXmOm7KUFn9UQg8rFevKIpSF4EFD0s=;
 b=WYdP0y5AjhtTDILs1SX8ojrARSaL1sRouq0syegi/gzFZO66f0mRd0UG7V45ydkDcB
 WEY1Mr1MRX7szEWVkBo3SFtp9Jf32QSz3Vbnc6hCalSHPo4edVpE+EdmtbkqVR6HQLcj
 w6Ans6RHYE2SXrIllRtVjXYL6QIWseXPze0vabL2zKCZQyidKIPkiwvFpKpItRqRWrC3
 4fl8IgSKd+dKPj4kbaUT06HRT36n9ZDB5tbyyLrHwtcCs1Vml26nHBL48T25Y5h6eX+U
 shdZAZxSuYEoDpYVp/xLylk1sqkS9kaOV4C1jqDb5S+ZdstkMguo+h50IVFcInP8M0KH
 rULQ==
X-Gm-Message-State: AOJu0YwAVFiSBL/i03VJKNAcYFJVDJ+BjXn7u7CcnmRN7fYnn8kk438U
 ZQe8IZyRskopMS01320t5gY=
X-Google-Smtp-Source: AGHT+IHR5UUVXRQtpaX+qj7roLMDkQXkVR/6t2Q956x1Qp4fFtaEciJEI/y8z28z2ZUo8amjjAUWjQ==
X-Received: by 2002:a05:6512:3e1e:b0:4f8:7897:55e6 with SMTP id
 i30-20020a0565123e1e00b004f8789755e6mr2152260lfv.45.1691770667954; 
 Fri, 11 Aug 2023 09:17:47 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 5-20020ac24825000000b004fe0c3d8bb4sm783212lft.84.2023.08.11.09.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:17:47 -0700 (PDT)
Message-ID: <09c63a63-4967-4289-9538-e144842de8c3@gmail.com>
Date: Fri, 11 Aug 2023 19:19:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] drm/bridge: tc358768: Fix use of uninitialized
 variable
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-1-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-1-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/2023 13:44, Tomi Valkeinen wrote:
> smatch reports:
> 
> drivers/gpu/drm/bridge/tc358768.c:223 tc358768_update_bits() error: uninitialized symbol 'orig'.
> 
> Fix this by bailing out from tc358768_update_bits() if the
> tc358768_read() produces an error.
> 
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 819a4b6ec2a0..bc97a837955b 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -216,6 +216,10 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
>  	u32 tmp, orig;
>  
>  	tc358768_read(priv, reg, &orig);
> +

no need for blank line

> +	if (priv->error)
> +		return;
> +
>  	tmp = orig & ~mask;
>  	tmp |= val & mask;
>  	if (tmp != orig)
> 

-- 
Péter
