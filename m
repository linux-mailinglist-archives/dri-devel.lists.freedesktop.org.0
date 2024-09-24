Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83D983D63
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847A010E22B;
	Tue, 24 Sep 2024 06:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yhkyMz2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8A10E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:53:25 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53653ee23adso4649148e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727160804; x=1727765604; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HX+NJAuqAMFoOraV+kSUG8Sd9N7pPiQZhihCSJbiCiA=;
 b=yhkyMz2CtnTEkcMN4pqHWmolL25joQ15QjLbC5cBCLeXv1evpiF5eiyt1MQ/OOK3e7
 qt46zPHIqiTSExDkrs5b//Qzdk6n7bY0+xhQMdvKfWXSyuem2zzLChnnsUPDNMMRBBdz
 k1BrOcaS6yKZ2YvOHLj5q97WMz3T3PtxnhyGQ07gTQDZ0KAAoV9JaI/S6BRHShXycbBC
 tVoTwWm7CyjEkxYh7BR02tZqYDAiBOHjTQKMNqkO+kwWBYLTGsAiAoz5CnEqv3uoPx5Z
 jlplEhoNGM7bwdMbibM5JSJBHyRoYO4IJB0CZbLOml+kBMZldYuBm+hrFEi1a+BIQK2/
 L6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727160804; x=1727765604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HX+NJAuqAMFoOraV+kSUG8Sd9N7pPiQZhihCSJbiCiA=;
 b=FlYDMp/889+WDJPWtzvu2ylxWbbXOm+6GL0akJ7CW2LOjuAHUUkKXqDEeORGNNGDQ4
 yQ8TXg0i+SlmwRT0EqvHJO9IuBuWi2yyH/J81lO9hSWU+onLdfBZzcqHZvUehK9gOlE7
 x5SzHJbDvZ//W6SU53Ut6L0lqkbEtZwg5E33jXynzdp7E2m7zLUpqnEXF4/8Xo6iVWLg
 eI4d6cwd8SXXDxb3SaCk1PJcPEX8N74s7mbZGw9/MpFxSk2xSb9c/wGvzyX4cMaWMKpc
 dPcZB1e5r5CXavU+QKeOtI2GUoSyJp5nQVvt9PfVjCWBEOPwFzT5dEtn93oui8f0ztZV
 /8Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyNLygisO/i8YPHVNWAt41yAawO4lyA1XmsCovHmy4q9P6ITRbIOx1+KfrWtPnzg35tze6b5+Dw+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB33larQ918apH0OYM6FggOipF+ztNOczTvCAjtrakopMsf2Im
 JiW4/BGur0pVFYM1LIcthO0dawMtqYCgIcM/ud0WMqaLS1J8cJEd6yT+ptjMtUo=
X-Google-Smtp-Source: AGHT+IGvMRTwMjApZK5PP1Mbu/n0xO0DngryCPpD/BLB9Ac8B4U3qg+XAdzsdXwgOiCc732J3oFtpw==
X-Received: by 2002:a05:6512:ba5:b0:533:97b:e272 with SMTP id
 2adb3069b0e04-536ad3b7db5mr6774890e87.41.1727160803952; 
 Mon, 23 Sep 2024 23:53:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8640220sm108903e87.142.2024.09.23.23.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 23:53:22 -0700 (PDT)
Date: Tue, 24 Sep 2024 09:53:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] drm/bridge: it6505: Drop EDID cache on bridge power
 off
Message-ID: <pq3dz7ldjfzs3mu4hkcgrlrugxgkgpzfxg23jccl6bkcky65lq@7mbo3ebjzat6>
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-3-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924035231.1163670-3-treapking@chromium.org>
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

On Tue, Sep 24, 2024 at 11:51:47AM GMT, Pin-yen Lin wrote:
> The bridge might miss the display change events when it's powered off.
> This happens when a user changes the external monitor when the system
> is suspended and the embedded controller doesn't not wake AP up.
> 
> It's also observed that one DP-to-HDMI bridge doesn't work correctly
> when there is no EDID read after it is powered on.
> 
> Drop the cache to force an EDID read after system resume to fix this.
> 
> Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
