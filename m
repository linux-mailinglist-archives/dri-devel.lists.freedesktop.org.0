Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20803C20F5B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D8310E9F3;
	Thu, 30 Oct 2025 15:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T/C/YCNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFD710E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:35:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso10018915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761838505; x=1762443305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMjHugVum7QNRx23N0Xydg5pEWW7JC7mvFaBCaZk2OI=;
 b=T/C/YCNflbweA8T1AnLRWbgRcwMDM0WIbx/9lPUiuTujAGmZCVJfMkIOOZpp62biKZ
 mOZaVoppH+YEo7sl3Z4V2abQ/Sd/QTUav3eskEWxPlpZid8h+Pi6Jb7W5k5UMmYMfa/3
 W4wHiYm5pmTJPGPk1VZ+lOptN0tRa7g0UNGlGGjCfwdpZQ9fyzYxihCNA2k0AOTAdiVs
 XpPhUw2PKojLukQ5etdqwF7EB7u8MqazR7q9nL+/tUlnV3YQQ16ozg1BnT03jBGRPiiE
 hy/j7Wcm8FUC47TY6e7zWxs1rrbH3r6jWTcwKmAxwiLbRBsTYQPQxra1IZ7BfotpEHOK
 3hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761838505; x=1762443305;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMjHugVum7QNRx23N0Xydg5pEWW7JC7mvFaBCaZk2OI=;
 b=DN+iFzdzsLDB6DBcMm8mGpk9uCqGpemqMscfjWNFd/0sczCDl3HupNq/gUPmqM1Nsj
 IQm32A/dLuzPBu6toZjKn8DqZ7uUy7tCvJ6wiUB1+YRlg0/7Vl1180U22tFjVrRKcE5H
 c6gLcSrDOQTLKiS/SsNiHaN5OFBhzbAZogpDI+bH0/DdHEYmaY3MfOct5VJK/ZAYUxuD
 d40JUh5nYzHTQOfipIfN5K5HA3JEqRl/SOEQhyxaVjM+SqMt7xhdiKfdXGWVHF9CGFsL
 ZmX6jIBQqRAWyrSAXDiKvk5ppdkVbQq1OHPRgKYgXtyX40CotBRPAYF7r2SwZ+yUCtFc
 fpaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGHudPLqJTr7vkxArOnJ/jMQwqSCOWuWCrWiuE5+IsbTqinLIhCtAOf/ZMVCnp3rRR2afMqNgSruc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNpLmE/N1su+YibJXUAum+4jz5solUgbKhhPY2pINXxKFa/mBD
 CQS90UUObYC32doWZdPjzK+5s8OayeRUEZcCSdNdyu0LoNmFhr4IMBzUVXbNTqFsTLQ=
X-Gm-Gg: ASbGncvfxLpIW+o/c+KFJb8c3nNDn7UlN1CAsTbstMdJxsFkyH8rGN1GmYt3RY9Qv5z
 1LrWdfetvLUDAIya1CJ7v/U2wIDWoVznm29Pr38nHjOU25+ROL2qW5yItz/1FuBlsb8n6UF9pUG
 Id6dgvEDlqlaYZHCoynEe1ipzbzDppMeJy+wZvx1z4TeOSWhzx5XsoGK0vULFldLEjJvkEJVZwJ
 jVLzq2bmQtSf/aJhdgY0Plxk1AQteXxWMxefyEF6uFx2JC1WGHF6rb/E/urFbdg/QJAPtGO8xfY
 fvBQZQiWVKYFK56w8UXGW1rM8NpAHnEsO8vdSVaLfZwXinlXQdT6fJ4dXspDOzeM27uSW6SYsa6
 X1bjQw+PUk3vYoR2OrZn+V2ogvZTg9fB80dpfwW3sPUN/IdyBzbkOjZqSryRQvusx9kMkO77ZPg
 fvl9rIYMcy3Q0+wuLOiijSxSM7MstIO5w=
X-Google-Smtp-Source: AGHT+IHZeYrq8+mRtX1lTeY4B5rTgJhAiC8nhVTLREWZuzfET2A3NjWN8gRpSGrW1jSySlURYEGMqA==
X-Received: by 2002:a05:600c:a08:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-477308c9355mr946125e9.27.1761838504411; 
 Thu, 30 Oct 2025 08:35:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm32976206f8f.8.2025.10.30.08.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 08:35:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20251030-topic-drm-fix-panel-synaptics-tddi-v1-1-206519d246e8@linaro.org>
References: <20251030-topic-drm-fix-panel-synaptics-tddi-v1-1-206519d246e8@linaro.org>
Subject: Re: [PATCH] drm/panel: synaptics-tddi: fix build error by missing
 regulator/consumer.h include
Message-Id: <176183850374.52027.4493661188023999045.b4-ty@linaro.org>
Date: Thu, 30 Oct 2025 16:35:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Thu, 30 Oct 2025 09:28:28 +0100, Neil Armstrong wrote:
> Fix up for "backlight: Do not include <linux/fb.h> in header file"
> interacting with [1] from the drm-misc tree.
> 
> [1] commit 3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: synaptics-tddi: fix build error by missing regulator/consumer.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66610c08e954e6a995c2504934e54f8945f9ee49

-- 
Neil

