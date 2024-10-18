Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D59A4A08
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 01:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1810E24F;
	Fri, 18 Oct 2024 23:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jOwLr7HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AF410E24F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 23:22:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so3450361e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729293771; x=1729898571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX1Ed3MLmjAUFYDzujQv0rzYaNVm2pPy+pKKKWr8v3w=;
 b=jOwLr7HSWvGb9KS79fVoOKKNQMzF+fdM+qY7Ox6tg0elLrfwD8IXN1e2Lu5e9CnQ3c
 22V8Gq/SewtF6/Ajx6eIA5Tg+yXT3jLsQeNHb3cx8AwYvEgiUbPBD6wv2qrG34kasLqr
 DcJJLsU1rZdvrG4WDt5caIOdeEbIVqYmB7V3vyKd/SpsWig8dQOABBnzSYBtqyHqFJCH
 vBClVh4votYdl0uWxYVFWz0e4ideY+HvWZSMkn9nJMQQ5PkTAH7TI23vPqIRGnzv/BpB
 wndVFX97EDJr/UOjtOeffZFcYoyINrR6IH6UANpHSm72EzZ8cAMZQtn4Hoz/+DN5hS8V
 83vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729293771; x=1729898571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX1Ed3MLmjAUFYDzujQv0rzYaNVm2pPy+pKKKWr8v3w=;
 b=Ho9jTUuqtiN/CtDnfvG7kFifAqYuDNxL7bUGc80K2hlIyFmhUJHBQYYfVaGvKpWrOO
 7OCuB9xdEeERl+bO/5w8yBOm4U2wvbQpFgVFg6vwO+fWTummjR2Zd7Lz9xpCOzEIiLlE
 Z51EvnJaFs++7HZ6Uh4vUhyf0qurYFs9l/7hgPASOE8NfTJhbei/t1rT7XKDAEsbdN0R
 mMD1SAtwMGFoIQZU/efJQ/76zWwvYpej84ArZYR5AO0moHQV5oelwousR/58VCsVZP5N
 PCKXAHLEFzDe73wPxO1IlQ/2bbj3ivQdC03W6CB1w1w4dV5ki1fQE95N4HzPG5eYAufx
 KNwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSbTlQtysy0xMkfqEpbU9fRtkRSRFUI1N5jt/SnE83X26hZ0FB0nfAMdI8NP7JSspOEqSavNQl7TU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2xPp9QMUxEEXURXmA057ur8w1Wh4Y7043yWi+pmpBeNCcL3Y6
 t0Mdj1/WLIy6D2cd/+qvQ9HeXGtkoQKaezqQJTxrBgzIO4dn6AHghdYyssSciDE=
X-Google-Smtp-Source: AGHT+IGyfftMjWZHfQWKqWoQYQ8JI+p/ypISrL5eJ6+gCuABF4WiTfoXGbQLBF2l4svs55N/Vw1Axg==
X-Received: by 2002:a05:6512:3192:b0:539:fa3d:a73 with SMTP id
 2adb3069b0e04-53a154e7966mr2320766e87.39.1729293771084; 
 Fri, 18 Oct 2024 16:22:51 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b9151sm349825e87.75.2024.10.18.16.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: u.kleine-koenig@baylibre.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 David Lechner <david@lechnology.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Alex Lanzano <lanzano.alex@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Add driver for Sharp Memory LCD
Date: Sat, 19 Oct 2024 02:22:47 +0300
Message-ID: <172929376314.2587927.2624699121778996381.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015230617.3020230-1-lanzano.alex@gmail.com>
References: <20241015230617.3020230-1-lanzano.alex@gmail.com>
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

On Tue, 15 Oct 2024 19:05:42 -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
> 
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] dt-bindings: display: Add Sharp Memory LCD bindings
      commit: 12f6baa472e097d4d55dfef9eacc36b04071bdc1
[2/2] drm/tiny: Add driver for Sharp Memory LCD
      commit: b8f9f21716fecac41d083ec8c77809ecd0b100d8

Best regards,
-- 
With best wishes
Dmitry

