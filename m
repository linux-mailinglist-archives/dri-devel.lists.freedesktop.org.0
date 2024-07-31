Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1B8943104
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 15:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3D710E25D;
	Wed, 31 Jul 2024 13:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q5uPtrnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0CB10E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:35:17 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso66129491fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722432915; x=1723037715; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2nuFog//dQJyQDurmfY02l3W/M3VEET6dFsY5XpmaxY=;
 b=q5uPtrnuCGoqTn/23Le1wOscn/FfviH3wlrkPQJ8+z03WbMiKcv559DLm4N6euZbES
 Trmpwry10GvwwaqpZ8b10usHR+6CF9yxkON7szzeWMpnLwaB8vK8EMRZLOV6Fkr2tES2
 LNuPiseLQnK28LtlypnTm/TiPmAxw52BeMjzOAb7qcpFzl7T3UglgL4zw0gZhg0azWaM
 lO6f4anaaoXfx3Uwzy6s2x9P+JRjRId6yTS/g9Dq3jrAJ8baHNhog0bc1cHf9nXmXCIy
 zn93hXYX4DTghxwEtl9kQkK/ulYjcD+urg6dP+0Cu1fuzjlWX+D9FIrKDwOjHDpHqb9W
 j3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722432915; x=1723037715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nuFog//dQJyQDurmfY02l3W/M3VEET6dFsY5XpmaxY=;
 b=inzZ9IPV4gh9PE+zIb4KTYqdoPJXKvaogSb6FJxl21sSnOrycumoWMcLc4p+OunfSI
 7sUzx1nB5Jg/gxXJkGLa7vifSyC04oWWRjkHsTDcRvUcUwYB4isAJgHyjLQwVXg3LLIZ
 s9jonVv5tB1a73O62zU6qDn+3c/yp0qJkcJgxNWHQOjyzDadcYH4OWgcJ8DMpAR/M1XK
 1szRkfQDzahEB5IZWJkcetsMCQvl+R/9Psx2lewDNUhbdC06aGv3xzTeq5Qt+nDPmbpr
 pF9e1G421ofRiwvDOQiIPz6eW2v6ilYjsuSFMnZuTZKF2urcasNPqHhup5ckLO+w1e+G
 ohOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMCkbPPUJcO7DfDK8n1ciSsDcVNCmk6aEBLnzp2wZJ8NerCmJJEn2vGN9z3R//pCIcX51GQ8tN4xHX4WeixUQLDhkSY8p77drH+5edELrm
X-Gm-Message-State: AOJu0Ywk5f650CLTAJssrA9Zk7Ap/MU9T43uPqlqhLfU7EfNW6gSvuzr
 am/Et9CjcoisNKEuLsv2vCTw96lyXZgMG9rw82eKCZW/CxBrxWwYJPXGQ2txqMk=
X-Google-Smtp-Source: AGHT+IGK97ZT6lgO5zmLXsUMfHQ0g2+ejUm5/06nq2BG7Njg79hsOrPZXa8iT9IXsNx5sVJEXLv2jw==
X-Received: by 2002:a2e:9608:0:b0:2ef:2443:ac8c with SMTP id
 38308e7fff4ca-2f12ee422eemr90180411fa.31.1722432915136; 
 Wed, 31 Jul 2024 06:35:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf30a74sm19598871fa.41.2024.07.31.06.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 06:35:14 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:35:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm670: add gpu
Message-ID: <l7qdl43tyrdw6yuupd2ym47ztmb2jhb5tzswme4yoitipsqrai@qalxt7hjmt4c>
References: <20240730013844.41951-6-mailingradian@gmail.com>
 <20240730013844.41951-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730013844.41951-9-mailingradian@gmail.com>
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

On Mon, Jul 29, 2024 at 09:38:48PM GMT, Richard Acayan wrote:
> The Snapdragon 670 has the Adreno A615 GPU. Add it along with its device
> tree dependencies.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)

> +
> +		gmu: gmu@506a000 {
> +			compatible = "qcom,adreno-gmu-615.0", "qcom,adreno-gmu";
> +

[...]

> +
> +			status = "disabled";

Probably no need to. The rest LGTM.

> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry
