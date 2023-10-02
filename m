Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E677B4C55
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0910E1A3;
	Mon,  2 Oct 2023 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44E910E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso6515099e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230709; x=1696835509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nf4pBGrQWkR1d9eK2zpSoqoXnEaG6SjbMffIpQ2BPaw=;
 b=U1Zmz3b+zPEhyqg/vhBcD36vkXKzW1M4f4wuauxlIpSuvMxRJgE56HAPu0/lW1MRw9
 M5GSUAr7WhvLdKwvOa+Xyjru58gpGRVcrzIgdhTbchX82DFKX3/170qBujeykVuDNhvg
 /+169ddLYaScq4uXCQ6kLZF1KOWVEFiAMfIwrvevSC5fTupIEzU9Ovy7i+qRSBiUxkLJ
 JOSy0Tk4htrWlGAA4WtIr6yuHDQ2c52d2045GWwDTwhYUinXE45D4vYqrp5/ASU1O11k
 9BDVTk5kZ/k6aP3C43XpYDUhC1QpgzW4NXT8BEXCWbMvZ5/OzoB0KIdyqpQhoWNgEtCZ
 EvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230709; x=1696835509;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nf4pBGrQWkR1d9eK2zpSoqoXnEaG6SjbMffIpQ2BPaw=;
 b=nGjJ44jd38bbQ3QhP5rlu+7GCjxk8Hq/hQP8ykJWaYo4xmxuZrA1AF/2OrF2LOOSBY
 ia0NLz0Xpz+oIudH5vZDH3HyjUWxhnRdZxQQOO1CTXGaUb1en8IHB9+Xi/dOIyiU4vpR
 6Ev4SONbyE+M2XBBeMxytVpi8r4i8Coc+r9PjuSRYPz674IBE5Pak4pOy/o5YY709X+4
 fScJVIYDuSQlT5o+guFO8oIRmAqOtX+l26l3Ly9c9j0paBjN2QyYO/ly1gyimNSLouVX
 OxI9IgktXXRrB4+hXGbVWmyVTUxPeulpd7lTGQeFYNM0pF2SwQJUnoNs4kcbh7+H+LXz
 VlOA==
X-Gm-Message-State: AOJu0YyOGpG+WaV4I6rCq6MhaT7nK5bo8d5fYGT74hhW1Cn8jbUlLJ4E
 fBOapYEjJIlQRDzKElXsPLKEkw==
X-Google-Smtp-Source: AGHT+IFUICv27iaz43fcdoCHCn19XLHU3Rfo2it3wCUxSjFwQc8FYbO4saa6ycVFUA2qgmxP3Qx5Kw==
X-Received: by 2002:a05:6512:2355:b0:502:ffff:feff with SMTP id
 p21-20020a056512235500b00502fffffeffmr9767677lfu.58.1696230708264; 
 Mon, 02 Oct 2023 00:11:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-dlpc3433-maple-v1-1-7d71170c010b@kernel.org>
References: <20231001-drm-dlpc3433-maple-v1-1-7d71170c010b@kernel.org>
Subject: Re: [PATCH] drm/bridge: dpc3433: Convert to use maple tree
 register cache
Message-Id: <169623070743.3600226.3322691055025945880.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:47 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 01 Oct 2023 01:42:24 +0200, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: dpc3433: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9a9f6fb5205a6cb189147bca1264311c4bf45163

-- 
Neil

