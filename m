Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D311099B207
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 10:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDCC10E1EB;
	Sat, 12 Oct 2024 08:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YdwlhCdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46A10E1EB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 08:15:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5398939d29eso3495668e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728720953; x=1729325753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98Avhm8RF4Q1UREJOF0ug2jybyp+VJAFuutUoDh5cao=;
 b=YdwlhCdmL4eW92h8+vp1LkVYHKmgfGZHnp/kBEoN5W1MTZKZKr/s74qffkzlSVZxfE
 eW8sJTbUWS/maUAXqvYRFie5fdZM4Ll/DJii9Mow4nK6FvJAmO75FdW1hGeoiTHxiULe
 hAxatGfGAH40M+oLtooUz++2fYmvhw22vomq1VjbROdIuPw7c8zFmrO7RgNudkUBF45+
 X+E8PlqKrARKqbt09yQff+rk2QUCcD1PrTvKnhYzNCnHZ+tWHQvjbfyYRngKZAexSOzv
 35yYlziSK+j/sHJ/nGXMEDo3c+FbdwRWFTKswr/WCMUCa/r6eWSd246ptoEDCIysa9j0
 D0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728720953; x=1729325753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98Avhm8RF4Q1UREJOF0ug2jybyp+VJAFuutUoDh5cao=;
 b=gwSY+IiJlxDbt/iZ1e9IQ/oYDQdjAe8AsHftD/PyAElH5rx25/dvVOHxeiZLamTRuW
 f1RqXz43+F+Kxfv4Y38qwsUAmGXTAOqv0V95ttiku8dd6ijoss65eyJcnx9kDiWR2OkT
 Fk5dGYFCHvMUC1xVq89V3Hs+vwn6ZafG0JM0+1zn5Sam4splyAW5i40yhpo7zkx78EYX
 5VMjan+yPY7wM3h+vW1p2swUJjR2yGYI+0Oil8HAkcCWPOflghlhPs3NC/uRCR6VZXpC
 Fhosl8yNSp5mcqn3FpGiZGqfL89rz+d3UI++WpZtu5BefW4KqeqsDi05Alri5I6vfnRU
 nOwQ==
X-Gm-Message-State: AOJu0Yxmog7QUNrqhE04NsF+YJwLMH/id2ta0S4lKfOcvctafcXEBgTi
 4dbNu5bxcbPyhQJ7cnX3haSfLtVdN+MMYKoX6F91qd9x4eMBD0VCTt9bSIIaF2Y=
X-Google-Smtp-Source: AGHT+IGgU2DIDo2BCzgiYQv6VUZx5oN0m+5FPxjeT4o7Oi65BfD6CL0NSjctE1q+BkuYP1KMk5kOfg==
X-Received: by 2002:a05:6512:3e05:b0:539:95f0:a05d with SMTP id
 2adb3069b0e04-539da5b344cmr2428747e87.58.1728720952823; 
 Sat, 12 Oct 2024 01:15:52 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0ea9sm862700e87.186.2024.10.12.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 01:15:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: (subset) [PATCH RFC 0/5] drm: add DRM HDMI Codec framework
Date: Sat, 12 Oct 2024 11:15:50 +0300
Message-ID: <172872070672.2226967.8196347515267088542.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
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

On Sat, 15 Jun 2024 20:53:29 +0300, Dmitry Baryshkov wrote:
> While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> framework, I stumbled upon an issue while handling the Audio InfoFrames.
> The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> there was no simple way to get the drm_connector that stayed at the end
> of the bridge chain. At the same point the drm_hdmi_connector functions
> expected to get drm_connector instance.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/bridge: lt9611: use HDMI Connector helper to set InfoFrames
      commit: ac4627c304e7a09068d0e2dba34d21e492649f8d

I'm pushing this patch separately from the rest of the series, it provides an
example of converting DRM bridge driver to the HDMI Connector framework.

Best regards,
-- 
With best wishes
Dmitry

