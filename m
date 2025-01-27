Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D9A2011E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 23:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FC610E30D;
	Mon, 27 Jan 2025 22:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pbptS2Lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2843210E30D;
 Mon, 27 Jan 2025 22:52:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 23585A41B90;
 Mon, 27 Jan 2025 22:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E66C4CED2;
 Mon, 27 Jan 2025 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738018339;
 bh=k21KZFwkFjIEiEi+SPMzunnRmZUOqoJ6creHbo8FtdA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pbptS2Lzae0TNyBamqrRguII90DP0knYpTVK56BmN7jaFirfIqyHgXkgO7nLS0qsu
 NopEwesOr9Fzvak+V0aB5OsaXw3UOofK8lJJvVP+n1JCeVJ6uu1RLI3Sb5S31QKdBu
 5r5feDmrJIN1c3+uu2XTC8TCTo4x3W+XVGTRbTTUpZFX3kolr/uERDWufv20t0d0MG
 f2nMbX5Z6YcMsG8IsGGnXLp6fr4Q53AeqjAIaVwwLBPros07/vLWGFKuDhFVoIuiVA
 H0FeSV9c47mK7c/36L0fygjwZshGTuZx5L93yol6d5U/ogL3d87JJiUrsBVIleC4U8
 ulz+tKMVb2Oyw==
Message-ID: <8ec7d5d90529c27bc6f099cb67a915d9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jan 2025 14:52:17 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Krzysztof Kozlowski (2025-01-27 05:21:05)
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/=
dsi/phy/dsi_phy.h
> index fdb6c648e16f..7541ffde6521 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -6,6 +6,7 @@
>  #ifndef __DSI_PHY_H__
>  #define __DSI_PHY_H__
> =20
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>

It doesn't matter but I think most folks prefer putting the dt-bindings
after linux includes.

>  #include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/regulator/consumer.h>
