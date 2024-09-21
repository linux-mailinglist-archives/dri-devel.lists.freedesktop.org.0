Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007597DEB3
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B082810E189;
	Sat, 21 Sep 2024 20:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y8uaesPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85E10E189
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:03:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso34006901fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726949014; x=1727553814; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=//dPyHa0UWKdAvWVcUz38Rp299z63kJ0pkS+sV7gK0g=;
 b=Y8uaesPqkTGXXEU+NSGlkTdEpzdNuSsbh37IkFACR00eXUXf3AhOiklZmmazkqaRUJ
 ldlfg0KH9/59UQpt06VVgWlgVHrg0CFr+OgjCIKjQk8uk0cQdRCH/pq7sU36OaeNHlh+
 WyFBxuF15fCgrZSLlWPF7XZyxwaMBnV21gYOZ/U0z9EZQUa/PBV9E8XInHjUUm6IivhL
 gLE5xFb9tzA2NPz7Y8X766Ham8bRJmLaTeXAvyJBlMBqCQK3kSajHkDm8QVXsrP5UrGc
 u9LdQj17BzMS0hvlHB+ROAXtszBRpshlBbedkIgBbeBZocpKRf9rxPxvHbYleWw1mRg7
 RFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726949014; x=1727553814;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//dPyHa0UWKdAvWVcUz38Rp299z63kJ0pkS+sV7gK0g=;
 b=ojXdE+mJLtz52TrPCAJ27r9hVy8s4CJHfKeNTjXLKsm3zQnuOp+FnaQI6VRwaPIVM0
 oZKJlELfLDLqjFQRfqJLPKkhnvldn17fPKQmQAWF+u5hTsrPMot3zoVSWAp1wWYAxvte
 C4Zja7YTzFF2hRTBojTCAGoAYl/6uCKh6fLKDAHsD6W+u0a6rEJW515aatRpSQO/06Ag
 1gBp4KKbuv2v6MDqTvjyKZI0Syo+xPfS9CgxVsHEH8G2Yz0UkTZQ/pqMhHyEaBL/uJ56
 mJyZ7tQI8GpX7oIiZ6Z1hEPiT8CjF9R0RYU+NqKmwYIvMkt9tyapB1xEviz4oAGJVSeP
 a87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwZjPx83IcnsD2c13f54u8yEdcYfQtBESU0b058JWSmTorxNqzPL5ZwcXaCm4/QISreqLJzIPmXmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycosOOIbCfQkDVqZn32nvir0rTc6zzOYO18/H7XV0EP1BFw0gn
 yD17CAf0FqbEi1j7yYYpcns85uDviFIY3kuTGh2iZya8mNXWVRbbi27dpFT6p6I=
X-Google-Smtp-Source: AGHT+IHl3CzloggE6ZkXGgjqllbtSWEeupLOO6YGSpU6Ugo9qQZmUJSybuhb9yX51HmSvfwAxUvdFg==
X-Received: by 2002:a05:6512:239a:b0:536:a4e1:5fa2 with SMTP id
 2adb3069b0e04-536ac2f4e47mr3637916e87.26.1726949014244; 
 Sat, 21 Sep 2024 13:03:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a86b1sm2754817e87.216.2024.09.21.13.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:03:32 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:03:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tjakobi@math.uni-bielefeld.de
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 GEEK
Message-ID: <b3rgwasctcww2gicpjmxdnt4333qcnvrt3mydprs4sfkqcksel@qx3lubcwdrjd>
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <40350b0d63fe2b54e7cba1e14be50917203f0079.1726492131.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40350b0d63fe2b54e7cba1e14be50917203f0079.1726492131.git.tjakobi@math.uni-bielefeld.de>
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

On Mon, Sep 16, 2024 at 03:18:55PM GMT, tjakobi@math.uni-bielefeld.de wrote:
> From: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> 
> Add quirk orientation for AYA NEO GEEK. The name appears without
> spaces in DMI strings. The board name is completely different to
> the previous models making it difficult to reuse their quirks
> despite being the same resolution and using the same orientation.
> 
> Tested by the JELOS team that has been patching their own kernel for a
> while now and confirmed by users in the AYA NEO and ChimeraOS discord
> servers.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
-- 
With best wishes
Dmitry
