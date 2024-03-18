Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164187E567
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845D10F4E0;
	Mon, 18 Mar 2024 09:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MUqNpBlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6910F4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:09:10 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-412e784060cso29520855e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710752948; x=1711357748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjcfkHxBxUl/qIQt/Ofx5WFnmYUZXoas2jOxK15tT+U=;
 b=MUqNpBlOfY0tPpkaYOg3GbIPB9EnKZ4P0ggGsdYnvbdFrXJNEoREr7ml6GCtGtc13g
 0i+LwvRVpzt7OMm59suWDcZYPSHN93PqefRejHPGOQujBMtggXwXR4+2Un31uy+hb/xL
 uUt7jQ+uO865PqhGVxGcaF0p/OqKRTY2ZnsKG0+o7e8uSJnV2kPG2meUf10PvSolCjdh
 mEsVVVLD+hVufdiErd46HA2VptFe0uMocetQLo1nyFDZpyQjk1QjlTEegaG440/TzEiw
 NB/M3mIauRFJUYT/+Cf1piT5C3oZdpfaf7C9Ql9fGBxtf1TUt0lQ54ChigLde8PoNal4
 YBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710752948; x=1711357748;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjcfkHxBxUl/qIQt/Ofx5WFnmYUZXoas2jOxK15tT+U=;
 b=rQrpVNSF+AV6TWEzA61ato/FkmMKb7lTP4i3rpQuVHzso0BX9bYUmGIvAmy/dRsGXP
 PGn0auAUyLG1KJYNYAz5zu5GN2tGTT2KR95eaQ4fPKCnOKN6nkuXdE5/dC3St5C9eMnh
 9ksmmxAyCHSSkiNg9+UerybDUvbljJhUshg/55JjOG7iU8Id3Ba+h0Yyi8iyGNm4vukq
 WpdsLWJgA3Qm4vxcviHbRidvydcBDrhieb+aDyBFYJaU2hkpWVhuPkv3L/s5s7/u7wHZ
 9GA+yBH3Hu5dVX9kQli2qkKv6BgDKsXUIqC07lCXjfY/2jPFTm4OXkA8RX/Lo1Dv47Dp
 7FRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7AlCpu9uGPjbEWc/1eFq2hcZn0qPV2r2ZH6dvsgEBNkxLkd9BDIuyIVFHGi10l/qAva1XmmCTN/I/jPbBE17rmoXur7T+tnRtrtWsvqqM
X-Gm-Message-State: AOJu0Yyi/PCoaA5HC4RGXpPupui75SWw30w0ZpvXl9h1WBEaR353WE3E
 Twsx7ke3FWLyeDGu002jpuyyQwGs/70FbDtMnMQqNo2M3S5iLgnUq13jknVjU6g=
X-Google-Smtp-Source: AGHT+IGu5diyfcVwRWLR4Yg7B7pmlWNzDuDfX75UM7cmY/NusuEIrSALQsCIn5bPVMuxM9z9I8g2Wg==
X-Received: by 2002:a05:600c:1d13:b0:414:1072:4b36 with SMTP id
 l19-20020a05600c1d1300b0041410724b36mr1564266wms.0.1710752948485; 
 Mon, 18 Mar 2024 02:09:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c1d8500b00414109c66f7sm2491149wms.38.2024.03.18.02.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 02:09:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
Message-Id: <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 10:09:07 +0100
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

On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> bridge/panel.o to drm_kms_helper object, we need to select
> DRM_KMS_HELPER to make sure the file is actually getting built.
> 
> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
> be properly available:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc

-- 
Neil

