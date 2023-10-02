Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC07B4C59
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45410E20A;
	Mon,  2 Oct 2023 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C610E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so132549115e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230709; x=1696835509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cu+Pw3V8CZGZb1GhpvcMQYnQKTsxIX2d8XmOXeqyg14=;
 b=skbZwwmN0vrmz6PBIR3vb9xRKQMD3xDRFX4bPYYKG5ww5FzTCX0THNyrz96aShdR0t
 FViRI8ggSly8g7szgsxJ4xVuL5TlgnDNfNn0vixQEKV7Vtjjv7V3Yl1loLvnKR1/c39K
 qIwUNE2M9gn69VKS+GSOColBve2CnoPnODiNsoz2VZLAzsUETTc1DLcHqm0HIuH36gX1
 u/8X/YAn3I0AvtccGEjWmImVA+OxMBt/8Vwq9orX35RdyhpobYpKsII1IySVBZ8uBLFw
 uowRiX7cTID5fhDefixCXt19aMNnm/VzWffqXrV93wbmIVcuOLLVQnW7TeGXm2gHIHye
 XxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230709; x=1696835509;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cu+Pw3V8CZGZb1GhpvcMQYnQKTsxIX2d8XmOXeqyg14=;
 b=IxY1Ewd9EByADS9GjlQAG/qFNAjrOaf2A+FwFeYzutBrcbziI7zKv6UG8arXSJIOxS
 4KFD57Pq9GRNbSPqoUFVWt5L7Vp5ifqf7/BEBewEJqAdBZYksjfPUzQ/l6fClHhhXd3H
 nfchYr0rQbZlTLL/qevtbvHiQQRwUgBqizoMLjVSP1V4mVNOV6u0al0Sh8C6jTbwHPGG
 MJCnMHltH0BcQR+HWkJEAI6JO4D/G10CLMq8qrDlOnNHBBXhZ4vMzMHM/lq1Vo6LSGV+
 5e6IycNJmYhgWz8dYnL6AYY8QgELxrgBfZzAEfk+LybPkmh/xQqOQUcriCCmspo9xweB
 yzTQ==
X-Gm-Message-State: AOJu0YzF2HZZxzJumb82YhJcbSa5zCQlb7A2nDham+Rv7ek5nvVnv6/N
 cr6YlpqZoajtsWkhIxDwpA8nLQ==
X-Google-Smtp-Source: AGHT+IF7M0r7YecLamPiSaTnqh4n0mbUCyT7C+0uE8yr8BE/ChptJ9Ip4V7LpXbEvzdVSlE7YnQlUA==
X-Received: by 2002:a05:600c:2208:b0:406:4242:e7df with SMTP id
 z8-20020a05600c220800b004064242e7dfmr8833207wml.35.1696230709611; 
 Mon, 02 Oct 2023 00:11:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-tc358767-maple-v1-1-f759fcc4bd98@kernel.org>
References: <20231001-drm-tc358767-maple-v1-1-f759fcc4bd98@kernel.org>
Subject: Re: [PATCH] drm/bridge: tc358767: Convert to use maple tree
 register cache
Message-Id: <169623070881.3600226.5478609228303935837.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 01 Oct 2023 01:43:13 +0200, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: tc358767: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4dd9368671fb7649dc914e661256a07250c271ca

-- 
Neil

