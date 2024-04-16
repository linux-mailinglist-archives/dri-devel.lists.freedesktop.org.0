Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDD8A7569
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D509510F210;
	Tue, 16 Apr 2024 20:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dJy5pJv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC11D10F210
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:20:58 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-518b9527c60so3730036e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713298857; x=1713903657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qywwJq5nbSjHA1aLQQKg5o6c3/lkaJluN4xzLrwZMAw=;
 b=dJy5pJv1ucQJcL09HdktbWlbae9Us8lQJDg8fZBUglAyCzqbwIyEJdVKe8cptiihzf
 7FejmxW9pQELJ/n8YA6cYruOM98dY2EG3h+P3WHirqr1S92YyVQRHm7WnLRS9Z24iopp
 vf27tcjAKnQelix+uZcAOvwmh8qStJUadudanzm/UC+ubzfMkONnWBfE+zkcZCpGYl8+
 WqrNL0HPESv8oo+w7f/18PGJACoqO51uwgRMr8jikFR+XPXH5cJH2q55SN5Bb1Bhg44i
 UKKUHW6/Z4mhUVwHGMAXnuVScnrAWZ6nqNXzbXKawSMG/RcSbLV4HIdumSp6+RCvAVWh
 u0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713298857; x=1713903657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qywwJq5nbSjHA1aLQQKg5o6c3/lkaJluN4xzLrwZMAw=;
 b=peYOZdIGfrbUiXjn1LXWWQ1ziGrk5WIrEzEBY0D+pqVJRSuAvnBcbQvr623oH3g5A1
 8/F4IecETkBKqbsOH2mqsl3QOio7Sdh/eO973X0+E28qKN4/Bc9+eIKwnJKKspthYGoH
 ejl4B3L9wOLDrfq37XHN++QoTfQQX5KzXFXY1SBDq5vQ5230JDHi+PgL7ZG0u7FuhzAW
 Ro4Fi55x/QMQqzs2lAwFuFblMvgQp/FNXHcuLPJFDRfCTWcWAl2kAvHcR5Gq7Y8Meyh5
 7xdxy2GpR3Xj5PBP/LhCeVjToCfgskmUGpt9ee01CabwhLwFERzPIirBRqlQKZr9x9XB
 okeQ==
X-Gm-Message-State: AOJu0Yx4biCswnXJw6oYajfbJ9hrhZY94RzXY2ODrMr7524xQh6KhXIO
 9nXAMwidDkSO+KgqXXmANyXT2tVBdPxcdyByu63H7hAonI5siabOn1/oWj5jJB8=
X-Google-Smtp-Source: AGHT+IGvXeB5YIW/C8iZDJh9O5u8lqiFkQF8Sa94t87snOvbhlCLdYH6yE/raC6L6AjmGsPjbyDCtw==
X-Received: by 2002:ac2:410a:0:b0:518:c69b:3a04 with SMTP id
 b10-20020ac2410a000000b00518c69b3a04mr6070306lfi.0.1713298856688; 
 Tue, 16 Apr 2024 13:20:56 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::227]) by smtp.gmail.com with ESMTPSA id
 g10-20020a19e04a000000b00515b5cd2361sm1719519lfj.164.2024.04.16.13.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 13:20:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Kaehlcke <mka@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/6] drm/panel: small fixes for visionox and
 novatek panel drivers
Date: Tue, 16 Apr 2024 23:20:54 +0300
Message-ID: <171329879926.1936150.2583859281547375422.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
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

On Thu, 04 Apr 2024 13:07:58 +0300, Dmitry Baryshkov wrote:
> While taking a glance at the novatek-nt36672e driver I stumbled upon a
> call to unregister the DSI device for the panel, although it was not the
> panel driver that registered the device.
> 
> Remove this call and a similar call from the visionox-rm69299 driver.
> While we are at it, also optimize regulator API calls in these two
> drivers and in the novatek-nt36672a driver.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/6] drm/panel: visionox-rm69299: don't unregister DSI device
      commit: 9e4d3f4f34455abbaa9930bf6b7575a5cd081496
[2/6] drm/panel: novatek-nt36682e: don't unregister DSI device
      commit: 941c0bdbc176df825adf77052263b2d63db6fef7

Other four patches were not reviewed and they are not fixes, so they are still
pending.

Best regards,
-- 
With best wishes
Dmitry

