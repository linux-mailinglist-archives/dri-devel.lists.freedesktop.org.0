Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D69A3EF2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 14:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CC910E0E2;
	Fri, 18 Oct 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h4dhWikB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CF810E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 12:56:56 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so2860407e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729256215; x=1729861015; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tlmikyeHLA1R+v/SeMY82cfNuK9qeutuFdS/0zXyK7I=;
 b=h4dhWikBh54P79I/Yw22ANp11bFdwMt2o2l6/kDUieGxD99Qj2yxKFivm9pIZL5Boo
 iEzo+kPLP+XoWjLdb0Hs1W++kATcufFc5IOrH5FNQYM0V2LvtBsLfKm5PrVVrGnPq0CJ
 EO1qHQUHV42GPIVV5rxDWLkbE9Giwu5EetXPduoROO7w54g4mQK+n3tWFkUWhYsumOON
 kqFvPWVbqFewYB/G9laEkr+4gmtcfI/inaiXtZVjXYQ07wLn2jsaWya58f4MUKFY/B8O
 6w0krPlWr81PzqKMijeiBEEE9RFyFott64/c4j/QvBU6GwXCcvY2aUzJ7wfgbBFNa9qM
 UlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729256215; x=1729861015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlmikyeHLA1R+v/SeMY82cfNuK9qeutuFdS/0zXyK7I=;
 b=o01Ls3p6DexZ/RjGsVJQN5hTARaItTdUAfzzozmpHpQABKyQFEb2E0nYCcNi6Ggu5Z
 +41tJxOo0Rajo0O77nqoTFDyGEtv5xDsdpAXwgMosABL+sBxhld6H2iXXDV4ewTWiSGl
 wjpwbzITa3rVcbEYjAQgvTtced2D83SGS5pVt7A9EvThOjSY6bjZvazgmZAcuKOhgIwo
 DKoIyUV3wd8ynD2hgiWe06WkQ2NjV9NIuC+yz8fNLcK3BS4FlpSzhtGRUmd/NVul+YDG
 Fs8u8pd7NIbS2XYHGQtu2XoiH/8QdlTfUk/cPddAzL661lhiGkxW5nV3nsCEKnDUM8HX
 VaHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkoDmWsM54SQU3mXZlE0oumxMM0CEU0Ds4voYiL8wjgzyRelQwd/yI3CBAxBoSRV2eu8rNs7TSQpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqA+2LiT+zqWcnsgrVSVrHW3NEkHPaEiOTH6wcKR8C0FMGUwcZ
 AkiTE/JEX6WI16OYtASE+LE8g0gtLnqkxKGFlsjyEMXqETBAXaS6+mQ1rzhGG5A=
X-Google-Smtp-Source: AGHT+IGp8BKiU5zwSiuqZHuPvclHSa+AFjqYaVWitnIZIJPqHYxSdeACmZOkLV/f3MXQCGakP7kHZg==
X-Received: by 2002:a05:6512:1051:b0:539:f10b:ff93 with SMTP id
 2adb3069b0e04-53a15229dc3mr1673369e87.27.1729256214774; 
 Fri, 18 Oct 2024 05:56:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211bb0sm210724e87.260.2024.10.18.05.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:56:54 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:56:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 01/10] drm/bridge: it6505: Change definition of
 AUX_FIFO_MAX_SIZE
Message-ID: <zltdkt5ynnfyetrxbqmazkj7l36olxueqkynka2orqzd4v6ji3@4odws5t4k4dt>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-1-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-1-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:13PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The hardware AUX FIFO is 16 bytes
> Change definition of AUX_FIFO_MAX_SIZE to 16
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
