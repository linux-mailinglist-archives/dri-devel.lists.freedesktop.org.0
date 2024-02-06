Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608084AFB6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8710E808;
	Tue,  6 Feb 2024 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HmfvssZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2E7112A95
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 08:15:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso41381395e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 00:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707207309; x=1707812109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=btHhwGxbZA6ve4BPec76cdv8nujipODBvqRCy/GsxP0=;
 b=HmfvssZJ8FNmefC4enT2o1oTZL3W5r3wnHxyTAPtTXTmat97YowsrLOicTMPem86Va
 0c9VOtLn8VdcpIPH+yUDdnNfWIUJh4l8kF8GfpsBBiKu1ToQ1PhMsvWWNJ/vqzOhfqlz
 WaZhYhRDGBOniWy+Ae28oTdcKu7zFctFlab/he/3zX2dWkQ9rwc8XmO0mrYCreaVHP+q
 1bftv69Wq79k3ngKXF2xiHiz7J1mqJja+gWP6meA5Hnb+rZwtR8MmigIRgj2gWryMmnS
 ySyNw4x3D8ppIK0i/JjD75HGWgpeIVW1N3D7I3YLPAqZkaxO4AiWRn7SVb99DMwuUAxR
 ZXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707207309; x=1707812109;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btHhwGxbZA6ve4BPec76cdv8nujipODBvqRCy/GsxP0=;
 b=Y80ATk8Z++iXzkOPYEzQsuSIkjnMBD+AeWK1YYqRFaV4Rb0VEUKkhNMg4xh7tCXYwn
 4xQeM8SobObDS3nA0DuNo79zMLL85k1V8ZaUfKyUrrxmumo4eTBsIuLc6X2ELeBmZQA2
 A1lHr6DTa2fI33nHOVpX8PGWG0PDq1MNJyzs+bsz5Aulku8J4Y4r1alRJtqdvRmO9CSq
 m2ItkvSQ2hufDUuqxSo/eZvcZ48UZ8J7koqfkCtweUjiIsg42Vg/JWbf6HA/UJY00vv/
 wcD/C7sOmjxbrdH8Dc2D6lZ08UELpdSFG7Xx8/8PWgP+E0sd2iJ0z3vOn0NbYMsNR/l7
 +D9w==
X-Gm-Message-State: AOJu0YyRNzfMVIauy7zAOXxcnU1HoFgOVvkbMO6WPi7a44iGcPTstAWd
 8Ye8V0YBsCS0NLQS9TFXtq8r0sahBkzYBsbQJE+Qyfd4GQImDoNynx7wmVINT0I=
X-Google-Smtp-Source: AGHT+IHAY0id2rUAFIshnMoMYXgfIfqBfIbwnjGvIxqn8bUK+f7tCiKlPakrEgJpmh+5BOErZSPgrA==
X-Received: by 2002:a05:600c:5117:b0:40f:de5c:d283 with SMTP id
 o23-20020a05600c511700b0040fde5cd283mr957164wms.26.1707207308987; 
 Tue, 06 Feb 2024 00:15:08 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX1hmKw70FzD7bJf7uUXsOKOKjCezkhFYawWz6xg07SYsxhvKv3q3I7MdZBhoJFAtFibPiY+lppQGWokiuhvJpriSDPCGWWvg9GaF5G7QtZAswh1dEJFg8W8CcMgLw1dSmZ7sXXdA/IfouRf7ndIcKbhlB1R8nIejdD7QFT2AuLEXE3QDRtu4Oi4rYDYAk4k0IDcxox5bzKqjI0HOIviksCiIkJYLHVrSo3nhX4vS6IVy1fKzFtFNMSlXsoM56I4rvi+O2xbGRj9kz3KHgEnYGW7BG/cV3dB8Ev9PwSfbQRIl9P27ThziXC2FZVj3+Jlge2Usk9R5sB807bUlqWsXWwVSOiA+sMVqobqtncNIZ7tlODknzocIf9K4Pin07cszcfsLJbcYxqSbHzjY0c2KXCuCElKyD5DbvxRvQth5ycDvE7GscwUWLpoMiCXYRVIqAsx9h1v5Y/xqvcGNdkra6z/tLvTUAGvo+QyfPCuxycSdJTyS8AYc47n3pa0WWh3uDgkfnfNC/HwE59mKN/BA33LBuxc+QNqaNaSnoPU7V56hOr9I8kkJbvLbZgJsa5Cqxe2jlspVAv1UUyjfXZIKAcaOCxtYPOtLxrfQATN8KauuCbNdn3Cm2rIgvzQ79N+KRpG/pYVbHUBQJPMN930iVtdqPu6BgzQo/5vadtYiABOIaTkDm9dxEWzDQ9gc/+UldTJhR77/lR/ab3nMd0CMaqhfoUDxpEm9UR5ywWQkLRcxzPNG9XG+Dtxoc1rqzY2HrQO0GkQQSoccVqaT2mSKOcmKsTnK5UAjicWvXQ+5nzh43HHTJVmXkmCgTn1Jh02bViz58Zh5/ZRwyEZ0FVR+dxOBpX3MuMDv2oTrc9nQullGCLh4UceAncr2COOFpejrRnrvdtoVdbEHEtkwBT9/T1eKNSQFZM9EvfufhNl9ATj7yb93zB3NW1ktFAneBRykJD1w
 huBWIWIirQQa/D77hagZ/LhIx3be1dMivkRxQWPWPFYjSmgBBx4KXysvRNuq0bi2acJDpi+BTqzK+7e5ufYEtNI1pXT54aVeY3fWAnDBMYVlXw1jxRAVFS3xEjM4URX69Ievl8tEmPTD5waLJpGY+w5LuYeqi+2NGkJ0XJkgDLdQY55mg7/dIs0m9u3A==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0033b3ceda5dbsm1440140wro.44.2024.02.06.00.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 00:15:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, 
 frieder.schrempf@kontron.de, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
Subject: Re: (subset) [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
Message-Id: <170720730748.2682504.5723443718654255772.b4-ty@linaro.org>
Date: Tue, 06 Feb 2024 09:15:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sat, 03 Feb 2024 10:52:40 -0600, Adam Ford wrote:
> The i.MX8M Plus has an HDMI controller, but it depends on two
> other systems, the Parallel Video Interface (PVI) and the
> HDMI PHY from Samsung. The LCDIF controller generates the display
> and routes it to the PVI which converts passes the parallel video
> to the HDMI bridge.  The HDMI system has a corresponding power
> domain controller whose driver was partially written, but the
> device tree for it was never applied, so some changes to the
> power domain should be harmless because they've not really been
> used yet.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[09/12] dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8933d29e7703f6f905bc84186b915b0ab4fe03bb
[10/12] drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1f36d634670d8001a45fe2f2dcae546819f9c7d8

-- 
Neil

