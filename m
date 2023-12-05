Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A0804C77
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5100C10E4B6;
	Tue,  5 Dec 2023 08:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87F10E4C8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:34:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-332fd81fc8dso4336888f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701765238; x=1702370038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNjw1GI2DMeeEO8a0ncjg93cZ43siJyc4WqEwC9FgsU=;
 b=CDxZL/lhjqBURdJyRlIR5+VSyEloIcnEWv+iRCZ1JF8kS9iAnVrwlH/1Qc8uEJp4Gw
 30IOM8bccKH9dKtWgAY/z5cCIBCUUVFUJkT5mB8Ru7NfekgBUTUvqInpVKj7WnxgckOz
 LVtHDBZhUZAAmgAYCLjBYUVU+lcIn5K0hrJ8HsrHkiur9L4sPjA9pvguziUq+JGI9NLj
 ze391FWy5X14/EkgoYpwfanrYdY1evYWIVMJrLNxhu8T5NrgU9GQXjaY8b9sx/M+LhAT
 OrQCYWe13R6xWCaxlxvPA2vg+7XnsVDpJbek6Qpj1yD3wgc1CIYi+axsvtwWrn2BAhiI
 XxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701765238; x=1702370038;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNjw1GI2DMeeEO8a0ncjg93cZ43siJyc4WqEwC9FgsU=;
 b=bbnuQe14aD6AtVFNmCkIL+DLmQUbO2G1fUFDn2uGpFHsD2K4dSTgZ4ecDoCY44+gPy
 sNkaVUWxDZV4160c6HB+G+RyP6yQW2LjmZvdnnyNrr8lVS9TBSxLdoR1MJ9hzYb0hX8M
 vQOnjzOXXsojiY9O+aNLG8sBJ2S2C+uFXrlv2/Uz3ft+swrcnr9UoQtletoQHGHn1Ihs
 PbymlO1Hq5fAu5JkZyHtEPw+KTvuuxBJW/cpRpO77vTl6ILXkzps6QAjpEKzrVWddWiX
 6TGSlAKLLiau0Ny/lUbsjSqPOOILQjZUQJyT77Fp964bs9xQ1o79i+COyvNyoMxpGEKn
 zLDA==
X-Gm-Message-State: AOJu0YwPoLK3E/jd3savwIdfzUUdej3NYOFW4jweKDe2JxHdQQjwlwO3
 p1QVSYnSPerd9/J9Wgl6iY4Y6A==
X-Google-Smtp-Source: AGHT+IF0NaHC2CSMSyi42s+sZrJ71IPfvZMrDM4yBLR4DfR9kixwjhIfCu8gd8tkDM25n22BlG0fJw==
X-Received: by 2002:a1c:4c11:0:b0:40b:5e21:e270 with SMTP id
 z17-20020a1c4c11000000b0040b5e21e270mr252919wmf.93.1701765238424; 
 Tue, 05 Dec 2023 00:33:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bd22-20020a05600c1f1600b004090798d29csm18012765wmb.15.2023.12.05.00.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 00:33:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20231204072814.968816-1-arnd@kernel.org>
References: <20231204072814.968816-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
Message-Id: <170176523748.4093903.5105511607949310724.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:33:57 +0100
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 04 Dec 2023 08:27:36 +0100, Arnd Bergmann wrote:
> A dependency on this feature was recently introduced:
> 
> x86_64-linux-ld: vmlinux.o: in function `tc358768_bridge_pre_enable':
> tc358768.c:(.text+0xbe3dae): undefined reference to `drm_display_mode_to_videomode'
> 
> Make sure this is always enabled.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=26513300978f7285c3e776c144f27ef71be61f57

-- 
Neil

