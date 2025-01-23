Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD01A1A2EB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDC810E7DE;
	Thu, 23 Jan 2025 11:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vrSEHOWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5201110E7DE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:29:40 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c52000dso839047e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631779; x=1738236579; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ywUpj3PvGs7O6YC27wxHtXRfoNnEiXLhmb6FDXD8qK8=;
 b=vrSEHOWR8o2ihRSoMfFNUt8PIMZjwjRg/mfafGOlVoqJ59FEGUIJZNU8aIhYNuT2lu
 jhTKq4S4jAMeVB3V1M1+9lkcLeIYAlQNgusnCRTAK50l+5zXnE6dQRlUb9GHnaMlIjF/
 vpB/RI/pjrrSnzWZlQJ2o2lLSiq//E8D2i5+GlKFOH1idtqeDYEz5L5Lewb4Xve7sTFg
 N4sZoOgeP/cw4Hww4rhj3sURpnNrjXcgPG2T9JWAcyclBGaug+ABJOzEC5ZN+55bEAPU
 JcDkRzqjkDjdKMTBAb8v3rzq5RKauvVbQoE+o3247N/QV1ZuqsczgTMcw31mb6pn/8kw
 ah6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631779; x=1738236579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywUpj3PvGs7O6YC27wxHtXRfoNnEiXLhmb6FDXD8qK8=;
 b=pky7qQE3PGS0hCxJBrcPrYTRa31fXMIDGjTHXScHl0TOYueZE2OjpionHcOfpxsNxl
 rvolucY5NRWTlOE12zWMxd2CCEOdl005f4h0QSyzK2/lD+8IW3IdGTs1FCwiS9GpLr9p
 bWcmbZrYDAH8LH7LOBkKRhgFmBJhvtFgUrZyJ63CgX+XraiiPZPF8o1P5wGo+7GB40fX
 PkpbcfnFkXYJBw+hOFrP2u7PHlc4YzbhVeGsNMPjT6wiGtteB8ZsREX2aiuka5vuBHzu
 sc/KYv3O7CEg2xKIgviWZYlj+RdZyCHqxfmHT/WuQAYmamTtYfKhajNXCe7lUPJ9m8mF
 nQog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUabmBGtsA11dVEpVDdZplCFFYxkkCSxpINot4C5fwY8REMK5pEObNl5uUWJAUDELyWQNRsvNMi64k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVfvFrXTaeJROLDxxba/XNMNIyLKBXC8sSTFU+SN+NiAy1ZFgz
 QZqb6TdVXgEdRH7R4mwdIk3S7AXHDtuhdBTs4uK8hOj+K+uop3yFc8m1n+aEKSCvm1uNG6PfVuQ
 bQ8Q=
X-Gm-Gg: ASbGncutk1y3af6hGRyjkc5cL+7JaEIs1k1rS2f8HY3fiOo4q+Xh099uIwoi8sXcQ8z
 ByXCqAAjtdXC6e5evIvCjP8ImHkgm/2KP8k1RxO7AciA6s7aUNFgxD4nKVxWN1ccA8rTEwgc7So
 FXKKD8AGUXXOwZEFpZjpbxm0nsG41UVROGfOUbv9S+D1cxJX83c9CYDrqkQto3rc92S+SXdMKAS
 mDb//N7/9Ijmh8R7dCAOjSDhqGGibR7XMNYp0Z55Tq7UUI8rrWJld3k40AKo6Am0UTnYYMslGjj
 oxtmchAqS2m43J3UibFwBqlJwQoaS1hFmz5isxg4SfWuMa7vGU75AbnytEWI
X-Google-Smtp-Source: AGHT+IH/IRIwigEV36zPfTMvutci/xM95ud1AjoiE5XvAxHbcLlm2/4wSeaGwe0S+EmSvBufcEVLsw==
X-Received: by 2002:a05:6512:2346:b0:542:297f:4f64 with SMTP id
 2adb3069b0e04-5439c280a83mr10948852e87.43.1737631778565; 
 Thu, 23 Jan 2025 03:29:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543bae0ba76sm771974e87.8.2025.01.23.03.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:29:38 -0800 (PST)
Date: Thu, 23 Jan 2025 13:29:35 +0200
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
Subject: Re: [PATCH v6 11/14] drm/rockchip: analogix_dp: Add support for RK3588
Message-ID: <k4hno2c46ys3unusw4emhkevp3yezhtgyy566vfyfju3efyei2@twict2pypjug>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-12-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:44PM +0800, Damon Ding wrote:
> RK3588 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block. There are also two independent
> eDP display interface with different address on RK3588 Soc.
> 
> The patch currently adds only the basic support, specifically RGB output
> up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
> features.
> 
> In additon, the above Analogix IP has always been utilized as eDP on
> Rockchip platform, despite its capability to also support the DP v1.2.
> Therefore, the newly added logs will contain the term 'edp' rather than
> 'dp'. And the newly added 'apb' reset control is to ensure the APB bus
> of eDP controller works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
