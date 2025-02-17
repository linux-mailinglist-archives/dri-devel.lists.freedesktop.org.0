Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D13A37E27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 10:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EEB10E262;
	Mon, 17 Feb 2025 09:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vMmYyioZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0C10E262
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 09:14:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so42877625e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 01:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739783652; x=1740388452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsAb4tkD7Ik8TD1TTeWRRl79j5QY70My3fQR2gIl6KU=;
 b=vMmYyioZ1XKJJJ1tLitDEk2xOzkaMzovOosdTdANrNJ10+6WWznFFR0h4kkBa/9ZL0
 qMGIS4UAwLJUovTplJi7oM+fpkl4ZF+a8QJ9a9UORyZE4q8PgmHddxJFR802+vVwZwbw
 OuIJ6tg3vU3FfgVKjHQpnWcPeUlOx0lgNqmDWctaYB2Rq/r33Z9HNUIHqiP61JeqboaW
 DCUYjH79VQ3VTk1oIaQeOWV1kL63lz+SMOel2OMZgRfjHHUkY7Q6xyGOXkqy2ZptoKNC
 s7xP8PN18/cnffcWNwh5xyrAhCXLeDtsQfzkLqbUjNfvqqr4B9AvfzR+hcvz2g6HdcPs
 Irvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739783652; x=1740388452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AsAb4tkD7Ik8TD1TTeWRRl79j5QY70My3fQR2gIl6KU=;
 b=ZEquq9KRkK8ejp0V7EK0pGKZfu8gwTNcGL5WcUnN8gELJonKQ0gNmkPTeWtp3LzQHq
 7ZZ638V5cUTDK+xqBBSA8lPlPE/NdMeJmOa64QGP0RT/1m7e1JThVF+VExS6qmdRAdR6
 BTsns4Nz0QhDA/LSzTPiYy7Tl09V+Z5ALc1DScicEPacwq8m+XgYD+qdhTr8FjAkP1/2
 oIkTPCZ3oXS+4dRzdYVfdBBcnO1efPxrknQJ7G9P7tBc5oBN+EC/AxVomjmI4oUTKVz0
 i7zbWg4eNTnbP6TvDt90HSOXb+hnDaeEzMYJPtbYvf3ySfniXNFN4IMn82g9anrBh/WT
 Y8Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJcLMh8PYT8CdSbcu+IXpEKVT2CNK+xsU5b3tG4HtI25tlNWMdhxDa/8tbAl5IfFuQC/RHPJO+o8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuDps3+EkxCdx9QVedeJRdLJ4VpfZLd2AinIeHt1gYy56/K2+5
 4MoUkG7sv7JQJC4Zulfo8xPizCXTVvWq/9LOkMoM02sEbSanTVB0TlXuRqZ9CFk=
X-Gm-Gg: ASbGnct+2Qg6+wuFHDI51G4oc7XjR+gOazQrOpwipyF5WO1Ku7bi8iz+AbohPD5fC3k
 u6ahIRLlttHewqMIBp45UYoLQAQ82QBkSGSVxCsyXdmAnZrjSltdP0qVJFcKhuQkCbL+/BiVgTa
 k5jQKM6zj+oOBxRdWdemcXpgcr/mkUk6owsD+KngO+qG2n52WKQRIcmDeeJ7FoQrC4mAW1cg/e1
 PhUle7ctchyvrqMUsrjSlz8yFKsBXHqAeYLxkyV590fB5xXYCyols+gcKZtuAiMbVJI6KGtTav+
 LoJZo5fWBQah
X-Google-Smtp-Source: AGHT+IFIlBeAZb5vN6e4NXiu0d0pn+xPZEoW8MDcpO9pxDLmvRza+J2zgnL1eO91jEkWPo632r0vFw==
X-Received: by 2002:a05:600c:3b8c:b0:439:3e46:4b1c with SMTP id
 5b1f17b1804b1-4396e6d7c2amr65788675e9.2.1739783652154; 
 Mon, 17 Feb 2025 01:14:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398ad9e1d7sm7938105e9.19.2025.02.17.01.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 01:14:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alexandru Ardelean <aardelean@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpiolib: Make code more robust by using
 for_each_if()
Date: Mon, 17 Feb 2025 10:14:10 +0100
Message-ID: <173978364829.132597.11040060815053957420.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
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


On Thu, 13 Feb 2025 20:23:59 +0200, Andy Shevchenko wrote:
> Instead of opencoding with long lines, use for_each_if() macro
> which makes intention clearer and less error prone.
> 
> In v2:
> - moved original for_each_if() implementation to the global header (Bart)
> 
> Andy Shevchenko (2):
>   drm: Move for_each_if() to util_macros.h for wider use
>   gpiolib: Switch to use for_each_if() helper
> 
> [...]

Applied, thanks!

[1/2] drm: Move for_each_if() to util_macros.h for wider use
      commit: b82e90c6f987e8f930523313eb803209cf9c6c97
[2/2] gpiolib: Switch to use for_each_if() helper
      commit: c60fa3ba030a4d95b55fcca8945dacac89c542a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
