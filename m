Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF0986C33
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 08:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CDE10EA8F;
	Thu, 26 Sep 2024 06:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v2c90A2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A810EA8F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:00:59 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso6727071fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 23:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727330457; x=1727935257; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ILy1gmaChDb8kjYQrj+oZMRoRoxb+hbZeapN9RMmuKk=;
 b=v2c90A2ROf3Trr8X9g8KvYsM/7sIBmkqntL2DD201elbI+Sdm8f+nF9CG28N8Ri9bi
 d3e/TOaiyEmsneUezdmJa5uk22rmU6fbHDGlKoGAvcxfe9857JnJdSiFEGAccEaBzs5m
 Lav9CdIPl+xtTneQVQh5LW2PQnPNkIeJsb6W3nju0bQrHNZvLcm1/WJ366EE4CKT9cDt
 G9EvN7TNEklLBUsf6QzXoMKC6NqG284YMZ11XKkM7m/c8Devd3kONGNLslxzoiEUDIFk
 w95G0/7R1zh8B8yauytbfhxOT4lUGmoG01Yxw0tuzEDN4Edp+S7I/u8e3U7RyMCTqDLu
 n/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727330457; x=1727935257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILy1gmaChDb8kjYQrj+oZMRoRoxb+hbZeapN9RMmuKk=;
 b=uUzuJIimTSV1WMRuSRIHK6DQiNkTndqVojH7RuYDd3oKBL5HJb0+5L5IuVtlAKZFE1
 qkZ6AVjG0RtDeBgsVNVN83iQFbJaLUlmhCHkDr3zKQoM/eYDb+8w1hHFH7P+gnN+NDTE
 mayehVBizeEvwQh8S1K/T7YttthzErmRlURZxrNtDmK3ghDo75hdXoWbfvvOL42oNfT0
 dEJfNWZQgoqVfEkDvH7T6mF5xruMUBGIB+4HPe1ny4Nuf2xvDry02e3QSJ/7swIdtiIf
 ZyEM3Oo/sePRpdVpROWMz47sXKz6YQRfaR82lPrcu+dwe+Gm2Cmr7DbCV0RHGDyKN1GD
 j6Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzRO6wTQk2njIMP+lwVbvS4UDTxnfXSOYWPOuawwAIo2u4C2nFKduk3e//aFStBo3fqNwFOJHKIdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7sbgFEQZmiLczSvfjgzQqUY9wDNVFVX+aQhVJ8Ol/5bDWeK8W
 Q0J/b2RpuFfAxrKAD2oO5zPkJONTtZoaH3zgZEgcn6VIdwT3WEvr2j2XahM1ijs=
X-Google-Smtp-Source: AGHT+IF3zAWXPj1hxe8OqEL5ya4nM2XcgbVEqmQK5WYyGuJNygjvKW4VKCBqLHmEaR5Sbg+uW3uJLw==
X-Received: by 2002:a05:6512:12c4:b0:536:7c31:cb21 with SMTP id
 2adb3069b0e04-53877553493mr3634739e87.35.1727330457366; 
 Wed, 25 Sep 2024 23:00:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0bbcsm711541e87.46.2024.09.25.23.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 23:00:56 -0700 (PDT)
Date: Thu, 26 Sep 2024 09:00:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, 
 Simona Vetter <simona@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 ] gpu: drm: replace of_graph_get_next_endpoint()
Message-ID: <bsvoitn4ygjm7ftiqex7knppf6ykiqort4wf3rb4vlsw6gnu2c@kze7w2f3plha>
References: <87setn8eju.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87setn8eju.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, Sep 26, 2024 at 12:05:42AM GMT, Kuninori Morimoto wrote:
> From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
> 
> of_graph_get_next_endpoint() doesn't match to this concept.
> 
> Simply replace
> 
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
> 
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v3 -> v4
> 	- based on latest linus/master branch
> 
> v2 -> v3
> 	- based on latest linux-next/master
> 	- Add someone to "To" who is thought to be Maintainer
> 
>  drivers/gpu/drm/drm_of.c                              | 4 +++-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
