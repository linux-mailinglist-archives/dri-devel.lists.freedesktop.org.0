Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676487EC08
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1A10ED05;
	Mon, 18 Mar 2024 15:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t9t7+7nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF7810E9BC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:23:03 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41461a047c0so638055e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710775382; x=1711380182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Twv+JvklLp9BaiBbFAxQP4duO8HXQ31vQnaAdXX0vqU=;
 b=t9t7+7nNPCde7EdJH4NaPeJL/N5m0fAZVDibC5Gz4H7gVWwlixJbcQdg2Otrj4vx0g
 B3KpUo2hwnnod91JHeoCqrYJ/tmq5ouF6S4iw8pzo0xjuORPSJ1h8h7z3W5pD+CyY5re
 hr+e2j7Q2Ac+QKVOJTw9N1jaLX0CcSsS6UfZFux6b0q6xLLXxSuswRcYQYyxLXp4XeK0
 qwSfqiI/MR5OFEipxPcT4C5TWbFuhHePM90nyKLdD04h+BMtcQKNnpwIbAAGzj0CH42k
 PVPBQy1SNKDGqEu3xuaOY1HOYKL3eVXbN6BsrEVjQ3BRFpMISIuUOoX6V53Ey+2kMX+R
 HT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710775382; x=1711380182;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Twv+JvklLp9BaiBbFAxQP4duO8HXQ31vQnaAdXX0vqU=;
 b=w5f7QpnBXy2XGIm1FtX7aPWxXWX/KvP4bliTMKmwmO4PnOlk/l6RO83hIbFEGtwuXt
 8WsrqSOQpktFYE6TXqb8vPKSEnTMrG5SkxM0hGEGK5W+5T7ApTJ8WSiBXf4bcbfNF1uu
 c3FTgO/cJ/xv8soSsUjCOiJUnBLLW6AeEYErnOv03BqZpY/o0uqw2G1tU1xib90Hl2s7
 904oLy8KfwOEF6NJz1Sm2mzqLr9ldWtqSx/F09UFVHDzyZdk5Py0FQDnVlB7b4ggxih3
 2+1V4+uduR1vECC9b0KQv1Ev9W+gpnFEEnsfxt4WWneQx9wtSOCpwmvTrVraoC0DAJG9
 45JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9doerED8iBFKtthIa3KA2l/qTSl+7pndU9p1tERZV6KWwD8+SqimRfY31zgq84ZsQEziYXawL4KnGoxm6/bSJMoeRKtCL0NrKW+l/rk21
X-Gm-Message-State: AOJu0Yx8w7HrEIzQ/cpYTB1ctLBx96nBlMUqhR6K98jD18aOVdrlRoLO
 suv61aT44BKRdked7XB3/CNmSFjYWnTr7gQVobgNlB2Ux6xQQztwHW+tdZoiX5I=
X-Google-Smtp-Source: AGHT+IGvK4rbbO+qQM1IvrwjNxX04794KUSmFHWIS20CyIXRJPL5YFBAsGz7LbwTbujJus3OJTfCvg==
X-Received: by 2002:a05:600c:1393:b0:414:286:fd4e with SMTP id
 u19-20020a05600c139300b004140286fd4emr6302133wmf.22.1710775381632; 
 Mon, 18 Mar 2024 08:23:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b00413294ddb72sm15047500wmo.20.2024.03.18.08.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:23:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240316170513.1159724-1-sui.jingfeng@linux.dev>
References: <20240316170513.1159724-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
Message-Id: <171077538075.2168000.12618964417804464733.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:23:00 +0100
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

On Sun, 17 Mar 2024 01:05:13 +0800, Sui Jingfeng wrote:
> To reduce boilerplate, use of_graph_get_remote_node() helper instead of
> the hand-rolling code.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d576e5e235c9df1cdfe62db958b77c0b0023d08c

-- 
Neil

