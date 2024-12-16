Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9869F2C98
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AF010E098;
	Mon, 16 Dec 2024 09:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S/IxvpTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A010E098
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:09:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso42283485e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734340143; x=1734944943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
 b=S/IxvpTtKnKVGHmGzZtd0Z711zrx2QIULAAdRBnMvsb8P2NmJajnmBLqi2EEtRUNni
 KdJj5tIUVa6Nj32eTq9XmA7k9fsuj92p3rcwyGG2cXlBzbsb26CP2/1ZVLCkPo4G1+mn
 GSKeuOuhM3xt5ZAZYgTRhPu5rffy3JIUNsVjZbiloNJb5BzQw6GZRzC6BoagjeC2iWIr
 H1B9vf93u7+yVpffKw3LfjTRn3mRcsprTtwTndRlW9seAgIxNsMgLapiqPPOGOvE9x4b
 wPhlkyyY8rC6KkrjeJgL1mRFtuEjZPFLR+HYemNSBYlJkroiL8+mry251tYInlMXvXPr
 J5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734340143; x=1734944943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGBHS4QHf1CsUcSFjaZXRI9YWCCVYzt2h/iHstQ0laA=;
 b=xAO3TmqupsYnGRmdF/gCJxwdpoe0a55LSJjwWvEzL/jMWsPJmYZTgQt2HNK7tJG3bv
 SROSgswzCpLjuE4cGNNU2sqyRqgg7oQavQvWCx7YsMHEb4zXiyH6Tzv1EI+lJHEqDZLO
 n7n1djfQstEtmAGv6zdoG8rE1IoJFI560cSvPItK8n8Vw61D1jguC/weP/SU6o4wTQqg
 3mch6ZR3DLyL1fImQY/Ux6GLejE+EhJtZV+qZuzKn561YsDRorlQp08AcaxHIZYKSexg
 dJTZC5asBvuMJGsgNnzCvIaEsGzYvXipHtwurxU1ksxGFycOrewzX2qWNSQj5MVv1JjW
 qyUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXobxuH3VAhr7mk5hcTLs2mss9gw+u3LnkitFQUgKOE8WDMLjbF0LwO5tvpakgxu7CkFrpjMwMYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkqgVMl0+akVARS+5w5xGCZkVWrKO8mtUjxIQTcO1axUSSG468
 pvEZ9mY3tz9XwiYHRAxRQqL5sJUlu+Qv7cjW0DYDiJHG1YrJbtXJf1G+/+Hb1Q8=
X-Gm-Gg: ASbGnctx2DNRpmWBlG/6f2n9tkqs/mJqqY3vc59ojk9q0NP24xUs2kHGJvOrBNfEzjr
 LquVq/1WBgAxJAnSZOvt0kBg1E9pHH75mZItpSRPchpAK4VEHgn9NkjgEHq7qmnwJr01UGAYNAU
 vDcqZ4b6sh9f9Gj0i4nkbzDfeOIgAZENwbWNz8OG5cc6OzXPc8EbDmJGYz9pRsZGu/rYokzMqwE
 2QZynGc9+ntA4/xq5wUU+uO+G4jWMN5vv1WUthxVMNGxhaNVYvltA5g
X-Google-Smtp-Source: AGHT+IH72Dfr5eQ52hfcPTD2JDNeTzGbEvM+MfJLbWyJGQJuX1wyKsEB2Yp2W1KGB/T0MXX4Wu47cg==
X-Received: by 2002:a05:600c:871b:b0:434:e9ee:c3d with SMTP id
 5b1f17b1804b1-4362aa93cb0mr85374005e9.20.1734340143532; 
 Mon, 16 Dec 2024 01:09:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ddd7:943f:c7de:9971])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ef45sm133677185e9.26.2024.12.16.01.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:09:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues
 from recent patchset
Date: Mon, 16 Dec 2024 10:09:01 +0100
Message-ID: <173434013318.38429.808413721248542013.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 12 Dec 2024 18:36:27 +0000, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names property
      commit: 83a9752729c455a6bd9b7cf62198506180691931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
