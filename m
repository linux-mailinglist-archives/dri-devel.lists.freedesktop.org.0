Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9F91EA48
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 23:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57010E1CA;
	Mon,  1 Jul 2024 21:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jvi6U6i8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246F310E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 21:26:23 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so40353341fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 14:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719869181; x=1720473981; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lG+JTJvNaTsx2cpjMTyaI6tn2wbOXbE/jDkjfJHAqlg=;
 b=Jvi6U6i8iMETJawnOZzHASuWihrNBtVaGx1kWkLyH37DfPbK6CvgYh3yBt+1geq5vD
 e5/f4vaqRqHmA2W16NgJGLMMEE2rSvSE+l7rtYX8VylitE1le28d8ry909EdTFugVe8/
 CyufLsE+6SiMJ3VqXbPzM9Tk2U+TaGI0N8KvLLhGJq56uQ7i7KkkqxZ125fOQdpj5ZIY
 1ZSznHbCzQGgT5TMkzIhIZf/vtboZkgb3KDxoxCQJ/4lSkSfqzRjPzOj37Kq1vS5xO6I
 QgS1rwFZtn13P3D+2WXrsBdWsuaEr9IoxTwpqpdWkheQbl/7z75RHWzmz1R9A72BR09j
 eK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719869181; x=1720473981;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG+JTJvNaTsx2cpjMTyaI6tn2wbOXbE/jDkjfJHAqlg=;
 b=L6za/JrX2S6DeiKyKR73yABIb8XwA/x4w3QcgAt4H9F4bnq1ZGV4Eho12CEbcCCTk3
 mo7yWIVzhVuo9RXNBZU2JccURIb3GF+0G6HjlWemTbKx6AtxJf6nYBfO+ojGZdAMceKN
 wSvKXRBZzvtiYlixd+wGuOmy905M8DEqszPitKFXXwLuIBJQwSc/VD3x6EF2U6Mw0CJL
 /F3QbbefH7DxUwRWBsRvfOHazUw81h9+yF5ZzJxuLKHykuZ9lBjUYTHJv7a5MvlG1dGr
 g2/pZsySVkOpSWdGTI7k05frvOsYJE8w7IdPw2GhZ9CdHSr+RewhN8/tT5FFCt8dG2fr
 H40g==
X-Gm-Message-State: AOJu0Yy3Qzf/rghGnJY+QxHFID/qUA2wGINlRyf8IadAJlIM98NAc8Pe
 FUH0KPGOAZ+rHfizjUxwuD1aVEUL5uoiOszdWTQZUUfNjgiSRcTfvL4w1SX53Rk=
X-Google-Smtp-Source: AGHT+IEOaI0UGr5D8W4vE8UUdTiDNkZ7ce5/GmxI2Bt3GxosQ91A560A6XtUvaXsnfS/pDrDtd0Xpg==
X-Received: by 2002:a2e:7c02:0:b0:2ec:51b2:2cb6 with SMTP id
 38308e7fff4ca-2ee5e3754e4mr40498301fa.27.1719869181101; 
 Mon, 01 Jul 2024 14:26:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee6a86f339sm5528391fa.6.2024.07.01.14.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 14:26:20 -0700 (PDT)
Date: Tue, 2 Jul 2024 00:26:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/bridge: adv7511: Fix Intermittent EDID failures
Message-ID: <4qarlw55zijv7vgl3q4t4cvxlzjeql4cr5734bgozhc7ddc7q2@2f3wis3c64cq>
References: <20240630221931.1650565-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630221931.1650565-1-aford173@gmail.com>
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

On Sun, Jun 30, 2024 at 05:19:31PM GMT, Adam Ford wrote:
> In the process of adding support for shared IRQ pins, a scenario
> was accidentally created where adv7511_irq_process returned
> prematurely causing the EDID to fail randomly.
> 
> Since the interrupt handler is broken up into two main helper functions,
> update both of them to treat the helper functions as IRQ handlers. These
> IRQ routines process their respective tasks as before, but if they
> determine that actual work was done, mark the respective IRQ status
> accordingly, and delay the check until everything has been processed.
> 
> This should guarantee the helper functions don't return prematurely
> while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
> 
> Reported-by: Liu Ying <victor.liu@nxp.com>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> V3:  Remove unnecessary declaration of ret by evaluating the return
>      code of regmap_read directly.
> 
> V2:  Fix uninitialized cec_status
>      Cut back a little on error handling to return either IRQ_NONE or
>      IRQ_HANDLED.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
