Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A699A4EE8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCF010E31C;
	Sat, 19 Oct 2024 14:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S9wauakT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CD810E31C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:57:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539f84907caso3581144e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729349836; x=1729954636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9j8gEdaXjCgYvssEU5IyYldyfPJ7EgCEc7AKiV0Wplo=;
 b=S9wauakTHwEcZv/4Ih3Wf4VchYPK9u/d2DlzKh5zZjSTq6i6vjtxcUSQXdV2zW78P0
 mnbLjEIHOQTfcZPd3qKUB2taZ31pRxSF9z0zuzyiDHx+C5Bhf8BGjRB9sEga+ni/7KS+
 Z3vf/K6M8EOMrX0RPQTnMc9RxWZQS/pWHfMQKiK5xZ2qPN0RLTnRLhSvlNN56W1JYAn1
 LYuVM/KbGjshtnwfNvcYqhfo5rjXjgpF48FMnuDi+cS0Ml/auq+gffkOrCIISDlYWICe
 UpWBSAs/2NdG0/CI/ERsbxJwleP5NZ3BrBx4tsxbxYWm3dkfUA3vL7dEHDjlKJKfWClw
 qG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729349836; x=1729954636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9j8gEdaXjCgYvssEU5IyYldyfPJ7EgCEc7AKiV0Wplo=;
 b=SqNhBncS8prVJxe954qHiG6iM6SEZKaFTm+P9exY4ArLSZZIR7M3kQi7IaDYscuCwT
 WfEpWeD7iwUt5ivV6SH/qazOkuBpIr+vhHshPpjVtrJ+sVlMxx71/czcIwNcuFPxtlqi
 HhInt3uzR7dIcqgJ2OFtlg7QD913IR2di55el/eh6xjspWuEKZtNXzU7h0pHZPWaHcPK
 RMkmWuoNFo1oYfYbopDch1EJ3PdLW0CRjO5AabnLq6oRDGt1BNHeU4oG1Fi+fgzJ4JhS
 xSqhj4SVgTdu35i1hr+/raEg8VoM3+w0eYcd1NvigU0RFHgkiUh8g5dd40oYmUqR7at/
 Fcmg==
X-Gm-Message-State: AOJu0YwQE2uF7shJCYFIVjUBPJTbEMGPFFLPsc4+TOhDwEy9xZ/cSXdf
 2ONG12+M81NViGnJQBM0o9Wq4MyxAKT9zYwDQkJudAtVvHx9ujtZ3FReG/h+7d4=
X-Google-Smtp-Source: AGHT+IF6G/RBVCJ37Wkr6byblq1JGc4buk0lZZCEyfBOLwQBxZWy4M9lW7077J1jd9gHkbNS4kARzw==
X-Received: by 2002:a05:6512:3a82:b0:539:ed5e:e226 with SMTP id
 2adb3069b0e04-53a1522a891mr3517985e87.26.1729349835560; 
 Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15214f1dsm551788e87.288.2024.10.19.07.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
Date: Sat, 19 Oct 2024 17:57:07 +0300
Message-ID: <172934981948.2755496.13654719356285263322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 25 Sep 2024 17:42:39 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> 

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: dpc3433: Constify struct regmap_config
      commit: b895a1805e0b01d523afa71818cb97a5d2655fcf
[2/6] drm/fsl-dcu: Constify struct regmap_config
      commit: 9239d961ce9d95ec13e241407d0320228e664d68
[3/6] drm/mediatek: dp: Constify struct regmap_config
      commit: 02f686d17c4305a0b5e2a9de749664dfe9c0f63e
[4/6] drm/meson: Constify struct regmap_config
      commit: 0bcbddb7ef0edb8b4ca994033128e955bb8b1b74
[5/6] drm/panel: ili9322: Constify struct regmap_bus
      commit: 6a92271233fb4789f69a9ba9410b23e2e5ab30e2
[6/6] drm/sprd: Constify struct regmap_bus
      commit: 420fb223fe6049f5eecac0d28136df5bc5699ea2

Best regards,
-- 
With best wishes
Dmitry

