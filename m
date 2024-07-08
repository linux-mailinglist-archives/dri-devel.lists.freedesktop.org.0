Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42892A39C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 15:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A4910E352;
	Mon,  8 Jul 2024 13:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zHAKRpN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA2A10E352
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 13:27:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so4071295e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720445265; x=1721050065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLz+pzXsJ6l5mFHOSKbiVfzHPETHq+grSYLHo5ZTzRY=;
 b=zHAKRpN0g5o2gYHb54/P4F2HxNRU4FUqr4OFbYpfO9NVKJBtXszcFtdbEZMtXaP8yt
 IEA1eKXrAtvmemJSl3M4iF6AFk30he0Gnx6REFYUnIWOjeZ5P/tDkto+BTHxlLUv6Bor
 kbl1b3fWwPfzfgFjj6fCI/AcBDWrzWSQvAg0VzfW4Ht7v/xL4S6VgK03yxNQonIQ40A9
 vsHJ2FmVgbxPKtVdJ+1vb5A5sfkynbc+DAeyUW9CnTKsiNDRcaJJYApYjTxOBQzxiKh+
 a5tkhShB6R+hO2Sc1g7TFnHF3KwGpTMEtB7erXSnIVmkSAPsBZe3yBLpVaT+1dQq5eAA
 OO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720445265; x=1721050065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLz+pzXsJ6l5mFHOSKbiVfzHPETHq+grSYLHo5ZTzRY=;
 b=Jy4EHnH5nIPBHWE3lmmCr5R9JBuBb36irxPoW3o7xeQm552XyVjOzK38LusgzDufXr
 uQ/b2EzXIkaaBLzdnCbXHLlqiys+5Uq6WQ6M+0FSNrgTCI1je6LkVTxGteQq8IQR7E2D
 DLH3+e8CNGtKMM+ATd7Pnd42u2DLxsJJvyWHU4QCz70RvKyfsIOBR9S9D/e44J8dTgLt
 G4ebFGSDwoIXiKWJ7ErfIbaTtdIwuQT9dbbFWPxePyyHcRiSQAcDUkmuYEiTJrFs+yYM
 SW3lQuS8cK8D9Gt30YWo8BuH7VPUe3jLfDZVEgzJ8IBxsoq4/53yHoxOOabHIimBrIU9
 32wQ==
X-Gm-Message-State: AOJu0YzMlvKP95M7IZ+VvlqXc9n5hUILSVdEAPt3fU29hClJB2zgy/4a
 E8VydYLa8UEfwvUe36GdTTV3IwPnESeT9XRNvQTjyWpIWg7fOZh+AyXhVnJQKows5xFkc52m08f
 ZUho=
X-Google-Smtp-Source: AGHT+IFzFef/Tv8RS12QfjZA7cDHgbrsywJxw7p2DpGff9CwZ0w/u5TnUJ6q/+bCZgefSX1bAM+WBQ==
X-Received: by 2002:a19:c204:0:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-52ea06cc913mr7432147e87.42.1720445265038; 
 Mon, 08 Jul 2024 06:27:45 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ea910a4b8sm728047e87.202.2024.07.08.06.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 06:27:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Adam Ford <aford173@gmail.com>
Cc: aford@beaconembedded.com, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/bridge: adv7511: Fix Intermittent EDID failures
Date: Mon,  8 Jul 2024 16:27:38 +0300
Message-ID: <172044524823.2537680.15499072146875099672.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240630221931.1650565-1-aford173@gmail.com>
References: <20240630221931.1650565-1-aford173@gmail.com>
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

On Sun, 30 Jun 2024 17:19:31 -0500, Adam Ford wrote:
> In the process of adding support for shared IRQ pins, a scenario
> was accidentally created where adv7511_irq_process returned
> prematurely causing the EDID to fail randomly.
> 
> Since the interrupt handler is broken up into two main helper functions,
> update both of them to treat the helper functions as IRQ handlers. These
> IRQ routines process their respective tasks as before, but if they
> determine that actual work was done, mark the respective IRQ status
> accordingly, and delay the check until everything has been processed.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/bridge: adv7511: Fix Intermittent EDID failures
      commit: 91f9f4a37124044089debb02a3965c59b5b10c21

Best regards,
-- 
With best wishes
Dmitry

