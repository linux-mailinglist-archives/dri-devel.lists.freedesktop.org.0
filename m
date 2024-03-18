Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD887EC06
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FFB10EC74;
	Mon, 18 Mar 2024 15:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vguBsArG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F510ED05
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:23:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4146178270dso1069015e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710775382; x=1711380182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sut0DqIpwqX91jrZWIRaSBuVK+4YCVtsDkrn+V+ry8M=;
 b=vguBsArGG81h2M49jcRfLCN9dB1+xhb8BxuTBR9vEhywU7umi8z5+LLIsXB7h+Kzs7
 e/FU2NTdEqWutI0kbXkC4iffsNfvCpmYJokR3GZ6LPBpQ3e7SFQno/FpuQJU2Ch0e46p
 3j6j0rxVVoGODToA+7h0VwYhUVkmiFhjr9rx4EbSFXW1v0UuIQbly2WAR350BKyConqm
 HkxUd0DyijokvOfd652jYM+JZ5hltIl9ijRK5Uf587R4kLMf0TlgoopFcoqpuSchcib5
 cdj1TlpAkzw2u9wwUdDLCOCddz6gfNJ4tL5UBwNnOArRn2VbAu6gobMYl6SVWsPHJs3+
 ifSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710775382; x=1711380182;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sut0DqIpwqX91jrZWIRaSBuVK+4YCVtsDkrn+V+ry8M=;
 b=CvyLFuome+kjxjkPH3pEqiHWE5eMuF4qdcRp6L01JOVOpr0jQzW5y+uI05kd+S0Jpb
 +o2ewBKJ04heQzoCoCxBoxSMFXT5uz/FSFURszcGXJ6Mt69M7+gPDXv2KWL8cCaPwkw+
 9z+FqhCl5p3rDm84IA8K5lZ0ZHJeI4QkXAhi8ELU38+8/DOuqcsaZUxE95no0CBVtJ88
 L0R17WeeSAt0PpK4SFiJmfiiN9PLr9SntMcoDRgXJ7r7xQNHUxbPJQbFMRHYpHKPP8IZ
 CkQ10ZDLfLvTlPrIcUMgndXIJM9t7cfYl6hZrhSFkt+Jvtkzx+Fo9KKJi2HTQAkG5Sv+
 NmOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwFPknshlrupjGbAjze4AsOdkp9sHY+hyWrwNu9lK0KUw0h2kbfX386LrpgogQUI1yl613iftl5YQFRn4MylgfQya/R3eCuDq0FNEDmbqu
X-Gm-Message-State: AOJu0YwmFNu+5huvKriMcV4R2OxrBEiQsJXN5ETH8oRNtMVyu0M2nlOg
 6J8o4SnHtYjTyoJqo6UghTc1W3xbIg09eqZfzlJDS2srwLW63Utfy5ir86BQrT8=
X-Google-Smtp-Source: AGHT+IGXNkgAFahUOxtfKfiWh1w3pGZblZ1/BUAf+/1flkV9GmtT/uu/WYWOcC3ZLpemGuq4U4wCcw==
X-Received: by 2002:a05:600c:444c:b0:414:12ef:83a9 with SMTP id
 v12-20020a05600c444c00b0041412ef83a9mr1675347wmn.20.1710775382539; 
 Mon, 18 Mar 2024 08:23:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b00413294ddb72sm15047500wmo.20.2024.03.18.08.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:23:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Phong LE <ple@baylibre.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240316174419.1170460-1-sui.jingfeng@linux.dev>
References: <20240316174419.1170460-1-sui.jingfeng@linux.dev>
Subject: Re: [PATCH] drm/bridge: it66121: Remove a duplicated invoke of
 of_device_is_available()
Message-Id: <171077538170.2168000.2876052780716705591.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:23:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 17 Mar 2024 01:44:19 +0800, Sui Jingfeng wrote:
> The calling of of_device_is_available() in it66121_probe() is duplicated,
> as the of_graph_get_remote_node() has already do the check for us. There
> is no need to call it again, thus delete the later one.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: it66121: Remove a duplicated invoke of of_device_is_available()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2c7d26555845ca5fb70353b4b77d8f6c4e32e54c

-- 
Neil

