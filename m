Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED9A2DA6E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0408610E0C5;
	Sun,  9 Feb 2025 02:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gllyAiGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965A10E0C5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:45:07 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5450475df04so944628e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739069106; x=1739673906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5E4Czvi+4b6NoImst1oTpYf2yNfwaBvKvGHOmPo0O/I=;
 b=gllyAiGFl3iqolHDdKL4iqO5MsfnTM9u/qiwtcLYJi+EQQecc1MB/altTGJ1Mshm7E
 h5jyVlG/D0FUPElpT4p0262THqq16xma2WJmzquW8EpbrXQ/rg6RV+Y0m0ZrsQxfZ3VL
 jJG1eXlLgqHvzlt9wCtuvk3f+p8WHMceGCM5oa2MfCp9qt7tT1MuGP3zW0E00zD3+wa7
 nNjUb6dL8U03Yk+PDMHFZp+iCjifBo71ZSc4qhmNHZdgjVCX8MILRLt0T8AhDj3y4LkS
 01Vw+XLcjhQcYWpKePEeiESJ0BU77nLFVrjDdnzBXLbbsXDyx0iQ7cP1iwWxJCCTbmL4
 QIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739069106; x=1739673906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5E4Czvi+4b6NoImst1oTpYf2yNfwaBvKvGHOmPo0O/I=;
 b=jER8sQWHdhEIIbTrthMIGOFA9K1+WyGSggy8QPaPPGyezgSZwBm3hJJQutRdJWInRg
 XThXCwppVK6Aj/7gqXXwkLalyZ20jE+5waKu33b67jEUtTg2E5SHw3blmGdGqzFz2PVf
 4FJNSllCIKBrsc8kd+5ha3si5rwu2QxzUFt97DSyXivo7ptFFnRYMnPmozLnEbkRdXf0
 W41UNp5ur+ee856zOKcfs+ZHbRZo29q0fvJmw62rvoDJxZe5k2QXghEW1hdWqe3cpzbI
 Q7cKUWHdqbb0zD4yQT+NzZ1Ymh7GlN67mV1PY0MgRv5uF0L92LlDfX9D/PNd1huinLeA
 TLnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI76tW8txw2YZV0SysIm5q/xMBtE5cpuBx9faK1YSBo3FFP9HGMOdhojDnMCkb8TLoCA+tJC8u2WA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUlK1T/GPoK/3E4epKNxwt4MUA1JWKLgERHgOnTB28x2E9tfgY
 ++jIEf+Hw/CrxZ4rmo75t5U5QrIXdGua7lmVOdMeBhTOO02Dp0imQBeTQYD6qMo=
X-Gm-Gg: ASbGncsNxlxEyZc7VLeho1JLC7QCeWbSNZjY4XzFjeOWi8USQQdZyGqRFm6KlBnE3JQ
 kRDcV5RwGpytyejeGSxo26ekMpjoMphhj1hBBAchhVrM9OzfPNMIrMeZI0kRjqYFd/wTbRR4uKH
 //mSf+VNetYYlzQF6HIQpt2I+SGy7vVvxkTjV2Gmf+TROgNp3aeoEr3hDXK3C2hNn4POkpTYNuF
 iqTtTBcaHJEDmRj/aBbkAg/VXe3l0Za71PL+XJBTzVbwcPL98Bwjx4mZ/8tafFMf2ppOw0AQByv
 7YdFfzn42k3pptenj7pIz40khG1L0rUJgNk3Y2XP02siRZZv/pQ/AJkdxInxE4IbnJ+Apko=
X-Google-Smtp-Source: AGHT+IHKVEnB/heAWEX5K5PYOtO1674PmCFwQZHj2jVxqeg1oJK7o9e3PbDB8ap5M6kBjp7L17/uSw==
X-Received: by 2002:ac2:4a75:0:b0:545:9e:bed5 with SMTP id
 2adb3069b0e04-545009ebf32mr1663142e87.47.1739069105957; 
 Sat, 08 Feb 2025 18:45:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505438d10sm309219e87.147.2025.02.08.18.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:45:04 -0800 (PST)
Date: Sun, 9 Feb 2025 04:45:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_disable()
Message-ID: <6vlxq3hwlq6dnslg5c2mzorvoiz2r5hq3abzytflv5rbj2lima@vx6mrw3ggd4h>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-12-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-12-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:40PM +0100, Maxime Ripard wrote:
> drm_atomic_bridge_chain_disable() disables all bridges affected by a new
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
