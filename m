Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D495905543
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4503A10E887;
	Wed, 12 Jun 2024 14:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u7CenXqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2A10E885
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:36:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so6906435e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718203010; x=1718807810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10RrM/p3EK+MrQ2L7mQTBTup46vdiah1TdTSnhIWRqY=;
 b=u7CenXqWuhUzTGDUyFrMSplVe4qETsQQELdAil+tXKnkchJjBSjuodBMpSoWqktnyD
 MKloYVSkUA+USt1SlkGhqHxFRXh8EJbeD0Yvpq+KElsQli8XtkGEGmD2ZHPvFfntEHkq
 xFJmgIb/7t8wuvL5yuzowdfQzfMvX1NMebwczNCaFRQZtBXyyikkr/i5GlMSm6aPWwcJ
 H7rhMpsMdYQxzIrKbqazAXZpD6SlMGH3QXHTPeJFvpcG7D4AXmHUDzVgU3ZPwXlds+gv
 FjJEMqd8QW3UiChKfXUcou/Bkz9hSarvC+RRWExL0diB40NUm/8/hpZn58X+7mloBxcl
 8Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718203010; x=1718807810;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10RrM/p3EK+MrQ2L7mQTBTup46vdiah1TdTSnhIWRqY=;
 b=ZGC5CDO0cJCHpaGJKE6pwDk3BBtsw0lBXBoFdsYkEh99hxPkjmUtPr1zdYMgB0Tkaq
 +QuuijMFYXZ8DQ6Yf6NZjn9S7+hVHHor7XhuYtJAEcQiYu0A8q55wz/vHXTXScycXua1
 dVQh0OkQ+2k9KPAbOE+ryYd+DbTYIiXw0RJ6sKbG7OyXmiUOzwmNQszDMvN26uvIHATt
 TP98of5QnfL/ni3IC9lCxR6KeBJXaS91teYRZEAk1rwvh/aRIxHkxxbFMsnrkDpqF/R8
 aiMObLTNJDXOOO6YFTsYDwpBisTwVdt+BOkVrqQBrXsA5UNS3Y7kvQ29lUHwrUh5eyHJ
 Pf/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4OItLuaHZyREq5pyH1PEeBHukFF1g6wHWujOz74GHYgGEbHGyqewYbo8Mazs29QX8vBKL8xIx9t6se56wVGvju8imwot4gJZ7JAWD1vIi
X-Gm-Message-State: AOJu0YyaHBkJ/cKc7Vib+nkABT2NSirYINCn3DXMWERjhoWrubMUGNOB
 TR0AtGJILdWYLVbfV8bCUqtbRc/J3p56fIhflEcbeEeQVk9yXM1bri8WEGkraV4=
X-Google-Smtp-Source: AGHT+IGvtLPVOtiFWrgMFyq9DtbW8o4WCqj67/qU+pmqjeeXy6OzoyX7cuk/Ir5K/S3ibokmn4Z8CA==
X-Received: by 2002:a05:600c:3d91:b0:421:7ab8:59c with SMTP id
 5b1f17b1804b1-422863b43ffmr22542885e9.10.1718203009895; 
 Wed, 12 Jun 2024 07:36:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f25dc3f07sm7881118f8f.79.2024.06.12.07.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 07:36:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 linus.walleij@linaro.org, dmitry.baryshkov@linaro.org, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240612133550.473279-1-tejasvipin76@gmail.com>
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH 0/2] fix handling of incorrect arguments by mipi_dsi_msleep
Message-Id: <171820300907.2526372.2735368790944027690.b4-ty@linaro.org>
Date: Wed, 12 Jun 2024 16:36:49 +0200
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

On Wed, 12 Jun 2024 19:05:41 +0530, Tejas Vipin wrote:
> mipi_dsi_msleep is currently defined such that it treats ctx as an
> argument passed by value. In the case of ctx being passed by
> reference, it doesn't raise an error, but instead evaluates the
> resulting expression in an undesired manner. Since the majority of the
> usage of this function passes ctx by reference (similar to
> other functions), mipi_dsi_msleep can be modified to treat ctx as a
> pointer and do it correctly, and the other calls to this macro can be
> adjusted accordingly.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel : himax-hx83102: fix incorrect argument to mipi_dsi_msleep
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a13aaf157467e694a3824d81304106b58d4c20d6
[2/2] drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66055636a146c435cd226fb5a334176304652f3c

-- 
Neil

