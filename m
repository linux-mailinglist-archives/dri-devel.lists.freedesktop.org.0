Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441978D1148
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DCD10FD99;
	Tue, 28 May 2024 01:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Br8rP8Lb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F188910FD99
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 01:02:08 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5241b49c0daso357892e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716858127; x=1717462927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YyAxoHilgrk8yTu5a6z1lAdisdBZ34CZ+2kOXUlJDWg=;
 b=Br8rP8Lb1WGXsAeMWn06JUZV9VV8qEXD3tiULFBEMbt567C3QAJlzBitroRNL8S3Ii
 M9STwV9tNyx8ztKCCVFtln5pdtb8A5ZP+qkHUWYP7I5A8IJ+uc2joGJp6GmwCC6/6H8G
 UtdXSwGXfbZ9VCzLCFLcFG7No1x46tzdHrHEVfk9ypZWDmjm2NsFMQILIvwmCNALCfdt
 MkNgJzKT5HpTktKZABXQhSbvpDiiNB32nY331EPykIr+DEICUXFL10opJ8goOBOw9tyb
 eCSM+S0/NL7P2ZB8QNdXDKXUcnMlLDAwTV3Xd/lsNebg9QMZiJ6GFsLcyhuLpLJRXYNL
 YjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716858127; x=1717462927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyAxoHilgrk8yTu5a6z1lAdisdBZ34CZ+2kOXUlJDWg=;
 b=ahRRPHdJn6GY5R/bXFs+F8P7vU9gg1C99iCxO7cHaseIs2gPlWOAS7dPsSmYEDQjwu
 yH+JS8k1zAtP46R/wU5ethRUtBOCl410IIBAZIVwffR0/UkqWcujO6MkIdFHrYnsN/Ww
 pyvTmlwsyLr6TpQvEOooxCHZMBk/2JLxmXdAL5boO9DqMIkP/frNcU7fIrrMy55XTtMl
 k+i5p6phibtNEbMsMTBAq+EnXFe9NNHM2xjmt1y7Z4ORaV0BLWnbfB5A79oNtNAkf7DP
 ONIBCfRF9zabFaqYSYXOf5/eAL6p2jmzEXE7VP3PT3Sva/F5VmiB55LpcX9dHJtyZURi
 gV/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+aptrMdDB3uSHhs7tp9l+SuJzw68CBwXuDzwmmjlh7GM6WJ3bu/HzefyWyC7fiJd+WUt2FPzwsDKxILZoSrDalvuZQ71NN8FKFMqJ4N8/
X-Gm-Message-State: AOJu0YxPn6IA1hNJe8NFnxlBHpZXW3Ta5PJleWp+wzj/buqGVoC19bFK
 vgyPGNjnEE515mILy3cvHX0knB5bGHYVFe90PrPLIpW8CGRppO7hyFyENkEFdyM=
X-Google-Smtp-Source: AGHT+IEQ1go2DE2vSmAmNQguv151cKtPHWKixqKjqFT5FdpVV7xbcj5tzLUBy3oX+M3iCDABhJj8OA==
X-Received: by 2002:a19:2d56:0:b0:51f:452f:927b with SMTP id
 2adb3069b0e04-52966ca6423mr6095364e87.45.1716858126970; 
 Mon, 27 May 2024 18:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e887a56sm819467e87.23.2024.05.27.18.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 18:02:06 -0700 (PDT)
Date: Tue, 28 May 2024 04:02:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v15 17/29] drm/doc: Remove unused Broadcast RGB Property
Message-ID: <pybexd4vummb2mgn3kgfc52hcbsk7nb6eumizsoschfbevgevd@4i53cplvtbtq>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-17-c5af16c3aae2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-17-c5af16c3aae2@kernel.org>
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

On Mon, May 27, 2024 at 03:58:06PM +0200, Maxime Ripard wrote:
> The Broadcast RGB property has been documented as three separate entries
> so far, each with a different set of values.
> 
> The first one is pretty much the generic one: it's used by i915 and vc4,
> and is the one used by all the compositors.
> 
> The second one is used by the gma500 driver, and is a subset of the
> first one: it can have the values "Full" or "Limited 16:235", but lack
> the "Automatic" value.
> 
> The third one however isn't used by any driver and documents the values
> "off", "auto" and "on".
> 
> It's unclear where the last one comes from. It was first documented in
> commit 6c6a3996f2c5 ("Documentation: drm: describing drm properties
> exposed by various drivers") which adds a number of properties used by
> drivers, but without mentioning which driver was using what property.
> 
> Grepping at the 6c6a3996f2c5 commit however, it looks like no driver is
> actually using it, and a quick look at the entire kernel history doesn't
> show any match either.
> 
> At the time though, gma500 had an "audio" property used right next to
> Broadcast RGB that did have the "off", "auto" and "on" values in the
> same order.
> 
> As such, it was probably a copy/paste or scripting error back then, and
> there's never been such property used in the kernel.
> 
> Either way, it certainly hasn't been used in a decade or two so we can
> just get rid of it.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
