Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80287EC05
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A219E10E9BC;
	Mon, 18 Mar 2024 15:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KNrnHHFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF57510E9BC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:23:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso16414315e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710775381; x=1711380181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eM5Vyp4val6gHlW4UCse9Nuq31PUAHMp+cCr8q2taE0=;
 b=KNrnHHFKjwe/9urskUxizX0Jud01G/ZQ0Ah5hg+tXUgqJVZ8MxdcdX2aj+hRPto6Nz
 iAegawcme9E3CVrNojVVcdGkgNz2o9P5KC/OZGWfBPakJFut7NpWX/P0IF9WYahFuwD3
 5X1NK7Juz41sLdz6UBWlleBc207hVy6oSJ3R9ya8en/w5cTJQwERJfIjAZFME/Z9QHGX
 tygJeNMgevA3NkLXvu904iR9LcoKi1R9r9io+o2F+/SHyAsefMYfidaLZwk0JaUzC2w/
 HOCy+PLAK+09ALH2mqy395v0kvEfNNh+JvcN+RXstD/SoCQ+r9ECjRgjrZ7N3CH0cL3f
 XauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710775381; x=1711380181;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eM5Vyp4val6gHlW4UCse9Nuq31PUAHMp+cCr8q2taE0=;
 b=mzDRLjsc9LpC9k9t8E8nafUtlGv/4CdZyaP51JW327n4JRSL4KUSATS7Lmvssi0cEb
 SHRTBmacXWZB6oauIbN3ISW6iQGjSNiyMdm3LNlwE5ApIvT+mm9cfugevssDJCOOsbkj
 89t2NkojDOVqki/qXkBr1aJzYm4SRSI3ufZQwfuqolNw0WNI8Knh0J4OyiwkllOCtk5k
 c5OpZV2OGsF8bvtxhHeUdk2R9dcCqDv3z1i3YgBPsXITbhzkPfsdsxrTo1C5nA/O7fME
 orN/xaBfy1Puf/lzJtj3ATJvxmwvBaeZKHeruqIHuxK9KEuFGnRJazsWwaQVix0OHrsm
 fHRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxn/hWWABuBu/Jx2oZ13nPnEpOp7QkGm0tZ4bBBq2juXwqVJIantKb4TJhIJ3pfbNHJkq59XdVRDqR1KuU8fMjQ4GrVIq+KgeuBHHOVLul
X-Gm-Message-State: AOJu0YzKNQKX9N0hokiMSPOFv1rVxn604YkBiTsK0kxO22nZF/tWPSc6
 gHV3UGm8OA0HoQ4FqvsY8E4EIfoY7lYSnzMBIsGtTCp0Owwv8rqOq+pDLq06mLo=
X-Google-Smtp-Source: AGHT+IHoIC01uPMLs6tirF+4ySOyl4RckmNhZ1au3ma150he5IpBM7GCFHMdYmG14h8iY7QX2EY+Lg==
X-Received: by 2002:adf:f68e:0:b0:33e:9f16:33c with SMTP id
 v14-20020adff68e000000b0033e9f16033cmr10363269wrp.18.1710775380663; 
 Mon, 18 Mar 2024 08:23:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b00413294ddb72sm15047500wmo.20.2024.03.18.08.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:23:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Phong LE <ple@baylibre.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240316160536.1051513-1-sui.jingfeng@linux.dev>
References: <20240316160536.1051513-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm/bridge: ite66121: Register HPD interrupt handler
 only when 'client->irq > 0'
Message-Id: <171077537978.2168000.7565900207355472778.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:22:59 +0100
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

On Sun, 17 Mar 2024 00:05:36 +0800, Sui Jingfeng wrote:
> If a specific design doesn't wire IT66121's interrupt signal output pin up
> to the display controller side, then we should not register the interrupt
> handler. Such a decision is valid usage, as we can fall back to polling
> mode. So, don't make the assumption that a specific board always supports
> HPD. Carry out a sanity check on 'client->irq' before using it, fall back
> to polling mode if client->irq < 0 is true. Such a design increases the
> overall flexibility.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: ite66121: Register HPD interrupt handler only when 'client->irq > 0'
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ba2d3e6709681b6c16ba8d65a23d72c706d82b5c

-- 
Neil

