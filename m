Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098E977C0E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE3810ECD0;
	Fri, 13 Sep 2024 09:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qa3LkR4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2D110ECC9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:18:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374c5bab490so1938113f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726219117; x=1726823917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KD7pHCmBcsgB2DArG/S7aZbZ+GCS6w6lP+HY1VMGzI=;
 b=Qa3LkR4ON7Y/+yK6TMqBUnYL3K4bzdZH1w2faqjQGxaRZLjZ+ptAa+5+ZtikJbJMJV
 BM7MjNCk35IzMzvG5Jdf6/dFYSQ3OQNubWQOzVCYWjWhLfIsYEq6HTU+yvsckv8uRLm/
 mK39p1inJb7s4ffLI+aPq84S2EM7p042ZiyYW9LZNOmGLZcchbncEKw4BU21bL7UPzw4
 W+icsgjbrhmVlgkSvQ/C1X0sZ/J47+z3+8wSA+Pxq1yK9uQSrOvPdYd7iOvy8j3c9pg2
 7eBl5eW5J6ANe7KDZIuhCVhQFAnrr1z68oOVfRKyUAkfBTzs4BZYpN9Ol+nVyHfxYpDW
 Ja6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726219117; x=1726823917;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KD7pHCmBcsgB2DArG/S7aZbZ+GCS6w6lP+HY1VMGzI=;
 b=L1VoNXB8IWHMrp4rYCbGNnrV0OgNP8xYwfEcHtHqbmQetg74Obq+ueBB/Lpa12gVp/
 bbfqlpzpJQMoVn1JUi/kebrDBnJzqFpzIGba6OLVkvi+JFzIgUFWErRWhPypLdh4SLT/
 Rpl14zM01tEhmkBBGxvUoCTVeQkDAEkZ0LR/+DntM7XLTN9FjILUrRXiJ7NM9teh6yWJ
 xMzwODuFMadvGKxfL/W10QHQUeKcUienfGLE/YInoKM7S8xw8YBy50qP54yV7A7Jo89q
 YXHwMbLnVqYsG0jTcmn1o0qvKmZm6oIYnPr1PsjsixIeKCboDz+bdX2r5aNRkD9/aKW7
 e3NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkrVaUXiGAXke/SNT7H45c1u/NvJQkmCAAONVqmFcUze1r4yjhKq+TV2S7YHnZRx2zNQAkY7w9i3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCHZjfmJttT83vv59c2HfD5dM/QHeIeTJWfJ74+314FzKC4Anp
 eQMFEmMkJcvyl+42jiJ98LzhNApFXBN3FoSx8XlYc6RQNLpTEYkTKOGeD7UwqZQ=
X-Google-Smtp-Source: AGHT+IHMezkuVRNZUXSaSOzfE0wCiGluS32q4ou3UZOYqqvg/BDHgGPVBLZ4ko4U2Kzbn7syHXVa0Q==
X-Received: by 2002:a05:6000:bc7:b0:374:b6e4:16a7 with SMTP id
 ffacd0b85a97d-378a8a0b864mr6850478f8f.8.1726219117307; 
 Fri, 13 Sep 2024 02:18:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de0e2sm16258982f8f.105.2024.09.13.02.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 02:18:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
In-Reply-To: <20240911200125.2886384-1-andriy.shevchenko@linux.intel.com>
References: <20240911200125.2886384-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/panel: sony-acx565akm: Use %*ph to print
 small buffer
Message-Id: <172621911647.1200554.4675756324644604163.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 11:18:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Wed, 11 Sep 2024 23:01:25 +0300, Andy Shevchenko wrote:
> Use %*ph format to print small buffer as hex string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: sony-acx565akm: Use %*ph to print small buffer
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9550e2394fc09bf105a246221660da980c2dbd66

-- 
Neil

