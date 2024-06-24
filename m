Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67A9145D8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E197510E3BE;
	Mon, 24 Jun 2024 09:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IYq6l00l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FD010E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:05:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-366dcd21604so1400043f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719219941; x=1719824741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qDsnR1NTYULm2Qyr/0Z4JWIlfl2ul0qrSxAF9LCYgs=;
 b=IYq6l00l6VabryQhoDOnr6Y4eQfcq1hTRmaVwoMggJM30vkhRXVT5M2oG64oAhLYwb
 YE6+nIgsEjheLErlixmtyWjMqjzmE8vJqZ7OSjBPooNsROmjCeJPFEDzmypjoa//JsAi
 S9/JLt94jUpf6o5bjukQMMd+Y7uIq2cGhuRCdnLYDrfaQeIbX4GmNwstUp8AzXwnxhHz
 9qq3QWVfjxklef3OzmcvH5QLpjxsZvmCRpUxVOJj76yQwyzylqFQU4oLM+q9PYiWclBN
 6iLQqW7ZxCy/N6LRcVsunvn5fvL/jOLBdRAXeHt0rNUjGTa/SnMKjbp84hF7OZMZ4Mw1
 Rirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719219941; x=1719824741;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qDsnR1NTYULm2Qyr/0Z4JWIlfl2ul0qrSxAF9LCYgs=;
 b=mzykCmfOabeYtK3q8ULIiVcOJ/6nMl9qPXpD1SjYzihjEV5KxLr55SVXZKUMHguMUB
 kFPJkieBuVlHNNbF/SldFtaKKXJ1v3vGSq2AD5LiVndlfEdlv83tVZ6132AphZczdRjY
 98oN+fniw5oGy7hSCLTUK0SeSuxvORfGJwzz+14NJKFq04ftDQ7eZK7JKuR8n0CEwBy4
 A5KRHUEC2kj9PwLufUnpupYbMC19cx2K6eFrLOOYguDqHNmF6E+SU3cD0YL8okww5gxb
 DUHwizfA3SYnkvbBybMHiaOM2lQQT8Nmo0DLnpc+0QSmiV6x368zYwYflYc69QNCenX3
 OLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV62HJXTCC/6IVZ8UPSp4d2i3la7KLdyFRSjT5mTDL2aLfy0nkN9i6E6uP/CMbBbTTVcDd4fF3LE7rotsDVpMErLcctj07667wrFymzETho
X-Gm-Message-State: AOJu0Yxmwf0di+flEbm/cYTxY3Am58WVuo8bgVM3LOCAZv4RH6FM88Hj
 ypW+rjNB6MCv8vOxIJDEtXghpxzYU4xYhYD5VydPWWBHTVNWvPR3/giMPKYckDo=
X-Google-Smtp-Source: AGHT+IHJ13EztZCrxyJ2oWYkDSiBq4khT95V1IBke5urv+CpUbkCFJ0o9+6cXaFY/cRJQW7JELbj9w==
X-Received: by 2002:adf:f6d0:0:b0:35f:231e:ef87 with SMTP id
 ffacd0b85a97d-366e7a3634fmr3398119f8f.29.1719219940648; 
 Mon, 24 Jun 2024 02:05:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3664178f5f7sm9323088f8f.19.2024.06.24.02.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:05:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, Tejas Vipin <tejasvipin76@gmail.com>
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240620181051.102173-1-tejasvipin76@gmail.com>
References: <20240620181051.102173-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH v3] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
Message-Id: <171921993991.3622623.9693135969867849523.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 11:05:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 20 Jun 2024 23:40:49 +0530, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> raydium-rm692e5 panel.
> 
> Additionally, the error handling in rm692e5_prepare() is changed to
> properly power the panel off in the case of a wider range of
> initialization commands failing than before.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: raydium-rm692e5: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/699f411dceb4766aabcac05cb4fbeb530e6c257b

-- 
Neil

