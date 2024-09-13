Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC377977ABD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999110ECB5;
	Fri, 13 Sep 2024 08:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kPnTqNS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFBD10ECB5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:12:21 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c7d14191so1845698f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726215140; x=1726819940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9k9rYJMM4C+oTJ2nVf0030SJZ/ekryk/JdGG7NGdvs=;
 b=kPnTqNS4pMp37pNNXM38Vjiy205ewilWD0LXC5APVLk+FmghIiuDsBXSoUPJM1Wa5L
 6oUQ8pjthbV7d/I404rNUgKWxhoRSlW3gV6OCRF2NWFYxG84ZT3cdo2uCtEgN5Ym7sgW
 N04EiJ1SWuU+n7Aqka88vNgXe9kTA9HXeaH3YqR3YFCS7ZicrdSHxvTGck/JUrW4PKdf
 +MRgoxdLe27Mwxab3QOp2YUFHnpJ1XVGfZjDCvl2fyjluB1ll6XyO9tjm9I0qjG0IHeU
 mM5SdKBg6jiR4I3rtnNhMqSLJ96lm8beMvTxH2lEzxM+6Cjh1W+cgozTigBKWIOStgfV
 mOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726215140; x=1726819940;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9k9rYJMM4C+oTJ2nVf0030SJZ/ekryk/JdGG7NGdvs=;
 b=QItUOqMqqt4MnA/kMKgkCqa8p4dNivoLad1WE+rx57lfheAaQM6O3bC++0PquRBZKO
 9MZqResWAULkOneTfV9loS4t3kCM9epz9RrV0psTf0ZIIPYM82PgKXOgYWvRB2H/0gv0
 SLbrxhhCv3C+/WzuBRUp5DwSMaUW0YUC1ElLmRyUK4lNSsh7GsPXXrjCvY/PYk/rB6cq
 /4lkLJ4IuNm83zOifwVdK3gS5IbUAVgDlc0RVUO4H+bFbLXwVJYxi2Jp+1F2ix1FJhxM
 IozpJGr/+Tds5c8ucQWHD0r7KX09sxqYIDXdxfSc4Y45WQ68Gt0v32MXdFYgghTQjN2F
 OBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/fmZBP5p0Bqrj3ltki2gRZ3c6H6M1g5tNIhJhlc4FuvTn7pb1yFIlTJ0D6Ky1/X1c3oZ8d5B27g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQZMdbchx99XxenLUtQypU0KfUkBHfTwJ+v+XacT2iA4L/ciAH
 dmmaDyoXGBsJB3772kQkoiPGcxVrZ9fLJrvwhkQ/iJteNAOh904D+pLIafyyaiA=
X-Google-Smtp-Source: AGHT+IGUnlSGK+OFJ+A4+PSD8enQEtq3Bf6LxAtm0vLDr//sYtSjZ+IjAZVM1wrdWRVB6siwKSkUvw==
X-Received: by 2002:adf:ef06:0:b0:374:c692:42e2 with SMTP id
 ffacd0b85a97d-378a8a0b8d9mr7708566f8f.9.1726215139924; 
 Fri, 13 Sep 2024 01:12:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc137556esm106939955e9.1.2024.09.13.01.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 01:12:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
In-Reply-To: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
References: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
Subject: Re: [PATCH v2] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
Message-Id: <172621513881.966490.122670380841730948.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 10:12:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Sat, 07 Sep 2024 14:54:33 +0900, Dominique Martinet wrote:
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0d4b950e03fb1c1873c51916fd01ebafbbc48222

-- 
Neil

