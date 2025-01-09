Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED2A075E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C939210EDA7;
	Thu,  9 Jan 2025 12:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vfstXENS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640710EDA7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:41:13 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so7214471fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736426472; x=1737031272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R7tMXX4qdRYGFciUc1sdwNNpuk6x7gkAmHud+GC2Ng4=;
 b=vfstXENSWAHnDaUUCDUPeh2wjt8B4nsPmFuBa2fO0auCjjIChGDhal1+/wLFjGxxAq
 glxUedNeN4Ff87Ne/4uY7Iu5d/iZ7D2zLAWBwKLcUjpIEOu/Wd9VErwYSigRj+fCQo2h
 5gkQtD8DCgvlClYt+VwjeYhevmscmrvwDm+XJ9q3O7LEDOah7JlgxQkikvwrl9DA6qWN
 15H+Y+Z64HAv+VUfzxUBMi5wkMN4T+ukAc+HkzVEjtM/n2W289AEY6Y2GtJo4op71ZxB
 pxtFPwiy/sBXib7p6t5rG/I0VDaaY2EPMHoGG5r4LU7NRnEdRKVOZfdZ2J1F9nPNmeK7
 3A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736426472; x=1737031272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R7tMXX4qdRYGFciUc1sdwNNpuk6x7gkAmHud+GC2Ng4=;
 b=duKP6x/64NL0kqxD/dUyeSSlKpDKoM9c38zO3LGdp4en9Hr5C+VGu1iRC9OVc5Q+pO
 777WRTn7y3O+4B4fX5rSU9SOWi3FntZg1Tl+KKd6sQD7zuZDqFGVe5E7dndYdwhCrSKY
 pdtqc53KPrmDpgn0hrDmuHpkZT+dk59/j3o2ZHvBiPrQxep0NR90NvB9XVHuWHivV7I6
 5iNVELDDqc2sHfryzOB5UncU0sZI3hS7OTCxcyz2Q6QtjEKNxjCf8RkISh0eOVs/z+pj
 8D0azYULnn2wEx1oFz/5Wy7ah+iGYH1SWygPsQEyA4Hw4nefjyNYIq65hSNWT/idcwcc
 pA8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0yL5ujQUFrTCw9cut/WlJRWYNMLR+Ps4Y3nqIb5/fdCDm3jl7C0mWWxfHpCViX9WTnx6QY7Ezjgc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxRSW+VQ/IC1wE2IIkJKvL53tdjmUr5hfQ2NtxPkAg4bGJMbsJ
 1OaEyvDdfu6RN9VpEkhsPnakdOgw3OJK5D1VPaTuHs7qwONtaF26t2QvTvIAuKY=
X-Gm-Gg: ASbGncvOcIpdkXuGfkUE+Sw2kyrIXDLlYsF/1AG3v5viT5pKEEwQaCFTvot3x9eKoGQ
 E8fGqaYQ4B8+98BP8AP4/+aKYdaVWH/3g0AIIL++mcf6o8pkg33p0jiXaWqocB1S/NHSRU7P2qG
 J4egdzQc48DwXekAU9ARXIXzdzxBGyMRHB4S5Dc+fhOHCKKeXfPYVUwtF4kx95rz1qJyWEQFs96
 dXvAICKF+anH7jcpIPzD+UUUUjZHbBru9HhwG+i/w8cJpekdVdhhBH42VAscpPEdOCmqVVB8ELH
 sZD4L3SRgYd/qNksMm+tbjQou3skz7Zra6Jv
X-Google-Smtp-Source: AGHT+IEwvFACO52C3ryh5S7HnArGMLvYQPYGuxGvrDUpjWDgL5Aq/3itURjeK26UKQyFNf6mWWqB1A==
X-Received: by 2002:a05:6512:3d27:b0:542:2388:3f09 with SMTP id
 2adb3069b0e04-542845b20bdmr1837748e87.37.1736426471690; 
 Thu, 09 Jan 2025 04:41:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a72sm185201e87.151.2025.01.09.04.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:41:11 -0800 (PST)
Date: Thu, 9 Jan 2025 14:41:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 08/20] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <7tvoipnypxzkzu235vc2n4jehcxgfkmgd5op5j6cqibqwmnlkg@vpftfenswtrq>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-9-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:13AM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> 
> Changes in v4:
> - remove unnecessary &phy_configure_opts_dp.lanes assignments in
>   analogix_dp_set_link_bandwidth()
> - remove needless &phy_configure_opts_dp.lanes and
>   &phy_configure_opts_dp.link_rate assignments in
>   analogix_dp_set_lane_link_training()
> 
> Changes in v5:
> - include <drm/drm_print.h> for dev_err()
> - use drm_err() instead of dev_err()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
