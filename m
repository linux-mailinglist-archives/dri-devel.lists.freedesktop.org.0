Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ECF9187C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F710E955;
	Wed, 26 Jun 2024 16:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lh9jUpcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0924610E955
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:45:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-424ad991cbbso8471985e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719420328; x=1720025128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlOaZtVdd0CpZF25pGFNkZ1asY8XjIo6XmcoG9NHsQg=;
 b=lh9jUpcSbqkTrAcBTbuB6UCmkC8oiCrqoEfi14ZyEPweIEX8by9BAKgW9slQgbUcPX
 bA2ajrYCdjxMfSzsNFPDoEKsQN7VbL0fe+V1gkRyTmpUNEJO2REazthJWn/GBQluY/Tp
 1enXenelnO36PSWMW7SQ0fro/V8OlOLpukwkKJpklCsyymIc8ZrL9ovrjO1xzgN/fMWz
 iPwROr4rY+n4GpH90GVwMSyGmYj6aPnWSoVGqf6YywDlrhe0+501yVAtO/LiH8iYsBsD
 r1FQqbKwh5WE7IflokjJkXKs0ah4Xs4Czax5q//nA+bBC57fwj9DiZGQ5GcLB0/Tp2xB
 4tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719420328; x=1720025128;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlOaZtVdd0CpZF25pGFNkZ1asY8XjIo6XmcoG9NHsQg=;
 b=QWi2d0wAT45RCCkoVVwjCplQq3tF5n6TQiprn+uvbz2aaQ/d2VzxxXu8b/ld7wiANU
 QziTD+PQoFkYfsQRmyf2fgBcd47nPaiF4Ylb9LAOg+YYcm+S+Hyy+HQj27MoZONj0YrH
 Myw7wz0zRGDvJ1aPHnjrmxBIlFn8KWvnYvfWBFyRuzsIXFrAnkyai/3D6jMswda8fUGk
 p+AueNPfq+qgHNyQCevk5T5hYehhQdWF+DneW2ECGUXEYWgLB61x2CajhEjaLPMZ6XNl
 J1SRigli28jSda6oQ6N+qJhw4oS23OER2HxaliEyU45aCtP2C3hbHfaAyeFjMPpSCzUJ
 h1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo24/JFE0RyzhwQCi9Br8iQjf9wEom887RjNLVqMem1I/Wbmglviy41Y19gqXC43jOkuv4n+9HjfHE3xI0hLN0uXCKdBQy8PjV63pSXbEj
X-Gm-Message-State: AOJu0YxzrTdg64K5R6iId6mWs8L66wwUtcKahnCZeibLHPhLTcEXOwrN
 FUy3NVIf4MPcfLl715VIlBCqrg6kb2hi8fe3SrQPK5/sLZg5fEF8zPkW1rp900Y=
X-Google-Smtp-Source: AGHT+IEWju8KnTUHctzPYHWPozmNa5BV076n8oWeDx8hIxgYshz+W2PMOtZyyIMeTQcmp4dp313nTw==
X-Received: by 2002:a05:600c:16d4:b0:424:a406:ad52 with SMTP id
 5b1f17b1804b1-424a406adb7mr32279735e9.19.1719420327933; 
 Wed, 26 Jun 2024 09:45:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c825f752sm31945865e9.20.2024.06.26.09.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 09:45:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240626142212.1341556-1-jbrunet@baylibre.com>
References: <20240626142212.1341556-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/3] drm: panel: add support lincolntech LCD197
 panel
Message-Id: <171942032709.3067283.3359858132781303992.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 18:45:27 +0200
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

On Wed, 26 Jun 2024 16:22:06 +0200, Jerome Brunet wrote:
> This patchset adds support for the Lincolntech LCD197 1080x1920 DSI panel.
> 
> Changes since v1 [1]:
>  * Rebased on drm-misc-next
>  * Drop vendor prefix change (lincolntech recently added)
>  * Use mipi_dsi_dcs_*multi()
>  * Drop the shutdown callback
>  * Insert mipi_dsi_usleep_range() for _multi usage as suggested.
>  * Downcase hexadecimal values
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: panel-simple-dsi: add lincoln LCD197 panel bindings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47d5c1934edcbda13d4fab4d7019b9ec8be0fe08
[2/3] drm/mipi-dsi: add mipi_dsi_usleep_range helper
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3ebc76c424bc0f0768f5c346667e8f51217917ba
[3/3] drm/panel: add lincolntech lcd197 support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c5207ed4638314aca89afb45629902288efe5f4e

-- 
Neil

