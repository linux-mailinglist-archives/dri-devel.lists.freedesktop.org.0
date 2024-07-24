Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3084593ADAB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6D10E4DA;
	Wed, 24 Jul 2024 08:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ps0EbnBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B50710E506
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 08:00:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ef283c58f4so40281591fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721808005; x=1722412805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=renq8SnFNGcgtGRRjEZ70Zi7VgeT79AsJsQAEIb2hJw=;
 b=ps0EbnBCuK9+Wxs8qFmM4c1m4o1mGxpyY6GH3me0VAj19V7UUlizL/zgoiiuxNkdBo
 Y9YbjSKq0oU5FQuzoNMMOItGOsyUNFkpCJRIzDNJpkYR8nlTvaA7NFMM2pP8a2BgAh5r
 9pvyvnvi2JEh68rlVvH7XFb3isPqUXzpU+U/TsWDYkGmJMTyeWMTIMwE1qxVGpRcTYN/
 DlrQLKS6+Tv/IcBfBNRINrwo9mRSLCaOBDw1Jxwb+qt5qWTeVO+i2FN1pDtkVZJllRiG
 54Nksnmzo1o85mYBBis+BDhY+dJgBvnn0uTZyrANB2O4697VGe/ELWqjJx2lLrvIhl59
 QX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721808005; x=1722412805;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=renq8SnFNGcgtGRRjEZ70Zi7VgeT79AsJsQAEIb2hJw=;
 b=S8X1nnjetO0LNWs4fbJipZoQDjD1O4Zkq4mn/L8LsdCm8hqpw4U1n6vHjcRw2B374r
 klPSkF5AmP4oghKUoBNmPvb/hL2JGm8+x1nrGW5W26upBCktfVC0poMDegiOEXOMbsFl
 16CFNW07dDRI8yR9aYxIWIoUGRTLX9mr+EoEdwumD7xG8iNlv0S7CMgB7esSaq9ytOYM
 xEkbb/XE5IpK0p+rgdfsuCtEr5w9c8hHl/t1MKrQX7siEWtATKaXrSJD4Qw0hLDiXlZw
 dcRIUVeLVg2UbWzeUBjdHyh0tlzGqhpekVyXF0pUJ68cntmaIlHrFD5v9kM50KcBiUWZ
 XY+g==
X-Gm-Message-State: AOJu0Yy8eVOnXpAeHVut+MklZFPVc06XITcf0r/anTvC+TAhaTfOAvEw
 +TMz1aAN2+CdPVyqiSH+1/cClU3LRTQP1ajGtTZEGxRCQeo2qnEhDa0JRzHCNPQ=
X-Google-Smtp-Source: AGHT+IFa22i6Jk+2hjtI8jnMqIJA7MFmqyU7o5ILqZrK5p9+YamOmkqBiQxhUbuPBuqJHpi1g/dV3w==
X-Received: by 2002:a2e:9214:0:b0:2ef:2c20:e061 with SMTP id
 38308e7fff4ca-2ef2c20e213mr61203471fa.22.1721808005049; 
 Wed, 24 Jul 2024 01:00:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f1f52b8dsm33884015e9.1.2024.07.24.01.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 01:00:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org
In-Reply-To: <20240724005700.196073-1-marex@denx.de>
References: <20240724005700.196073-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Document Densitron
 DMT028VGHMCMI-1D TFT on ILI9806E DSI TCON
Message-Id: <172180800420.4044086.5272410290132063328.b4-ty@linaro.org>
Date: Wed, 24 Jul 2024 10:00:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

Hi,

On Wed, 24 Jul 2024 02:55:52 +0200, Marek Vasut wrote:
> Document Densitron DMT028VGHMCMI-1D 480x640 TFT matrix 2.83 inch panel
> attached to Ilitek ILI9806E DSI TCON in the ILI9806E bindings.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Document Densitron DMT028VGHMCMI-1D TFT on ILI9806E DSI TCON
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aa48c30f096bc10a583c2294d87713f2802986c2
[2/2] drm/panel/panel-ilitek-ili9806e: Add Densitron DMT028VGHMCMI-1D TFT to ILI9806E DSI TCON driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2108cdcee58b06460a8ecb106d15ab69f5bd49fc

-- 
Neil

