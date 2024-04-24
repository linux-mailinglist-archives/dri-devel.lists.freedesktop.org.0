Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DA8B02C0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DB7113890;
	Wed, 24 Apr 2024 07:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xfqw6U7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEEA112A9C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:59:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41a442c9dcbso25020135e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941995; x=1714546795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wq9o1Ti0M31cAYT/F0nnazs5C7j1Gk+kwmsgTDjsURM=;
 b=Xfqw6U7WjOqfcmB3Ed8jaKgRW4GX/k9ilpzC1sD931qGtscwvm7jauTWuP0mS4thM2
 miqTgVU5lqsDna/h4ZVZKqWVg3FhTuI52G9cQt1k8ydlKvtfs99BeLwsNAVgQce9YQtO
 4M7e0LQmNy+C8GYdF3FXUzifSmHl9kQavJeptSKACvTuUXtw7g7GsJFol+FvN5tLVTUs
 qqHH/B/kqiyCS1rMr2qJFw6osBJaLZ3Tl0Ph8UpMK/tm8RYRMFz7mU0KMLDE0HiAuHHz
 OBIZthbNAx3rxicPpEEuU90LBJo672XNSaxprQEYbXQKTeU0n4bi6GYC5odS7gSzj7sM
 tPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941995; x=1714546795;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wq9o1Ti0M31cAYT/F0nnazs5C7j1Gk+kwmsgTDjsURM=;
 b=KaRklESHndbjnS0+f2XTCmAqcRQV/UfrSWa2R4Nb/floaFO/jnc/1YJZsEupk7pwk4
 5kQrXRLpkTLQ1pyf5mQLC0hyrgGtmdbeUtWVeLTJpjHwb0rURL91vj6T3LDJkRLvl3uF
 tWUPQfG/MUx+fXrpqPiQ90tuhPoYi+5mciDeKOItKLhJXhDu/iLk0wezf3Issk3XsKa2
 kfHPqk2m7dn4FzrzfR/yTNuWAMAyox1AbFOYXaZdPIIGEn6pC/Q+uYn1oB17EgorC/mJ
 S7pxeGumeWFGW8wwkYHDLU7BQQG2mvWJVHuJ7uilElPNoLHghF6QigwLKa5AqXUJE3eN
 4C5A==
X-Gm-Message-State: AOJu0YxKOjDpv9+aeuaCOXpvHRuVsBSOSnxeUtQtYg6l7s6/D4MxlZVG
 uoUtRiWV3TRvDK6JDy+XNgbsBxoMPN3M5RiZhnw7CstAX5OVNN1xUIK2Z6/ww8Q=
X-Google-Smtp-Source: AGHT+IGCSTAUr1SuqlB5mnIWg/kCv5rAtu3zc5crQbZIa+vaZ/AfNy2G9N3lAZDizs74NJyugDcOyw==
X-Received: by 2002:a05:600c:190b:b0:41a:a5ff:ea3a with SMTP id
 j11-20020a05600c190b00b0041aa5ffea3amr1121547wmq.19.1713941994817; 
 Tue, 23 Apr 2024 23:59:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b004186c58a9b5sm22465392wmb.44.2024.04.23.23.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 23:59:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
References: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: adv7511: make it honour next bridge in DT
Message-Id: <171394199404.1308236.9174409183083522865.b4-ty@linaro.org>
Date: Wed, 24 Apr 2024 08:59:54 +0200
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

On Sun, 31 Mar 2024 23:45:48 +0300, Dmitry Baryshkov wrote:
> DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
> present at the port@1. This allows board DT to add e.g. HDMI connector
> nodes or any other next chained bridge. Make adv7511 driver discover
> that bridge and attach it to the chain.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: adv7511: make it honour next bridge in DT
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/14b3cdbd0e5b73824b7b2c7a4b1fbfd743044a5e

-- 
Neil

