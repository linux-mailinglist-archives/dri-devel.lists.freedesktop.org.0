Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B376C7F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDBD10E4DC;
	Wed,  2 Aug 2023 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852B10E4DC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:06:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso69608535e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963590; x=1691568390;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNk+5FeNJPiJG592NX1er3sYDqhDbBZgamMwV29XaFU=;
 b=D6W60OMPxwjMSyLMYGaGQsrLp6NpG03niyWuWwIcs+oqG4p2HJChBDvNezZm6F807C
 vFbtiT2ggM8IxLlXQr9Xw8NsWhKCruGuW5iJPeT1b0c7BB9a8diJxMAp3L+9xyOCRxkM
 UbMACORbB7E7UD608w1/VLXx/IowIHWqJ29jR6tJlOlpSM3ZTbUtYEIvVUU7du5F6ur9
 6FiONAZOI91JbdIxdxp62vFoUCr+EOA/5Ek+FIkk1DBJigR5krc/ms5CR0SVj6llFGnS
 pG/STBO3IGpszsplU3eUZRDH3l+g7ZRHuSF4Gj8AccrBUSBzSyJGgZm6oJVb35/TkI1Y
 fxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963590; x=1691568390;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNk+5FeNJPiJG592NX1er3sYDqhDbBZgamMwV29XaFU=;
 b=LgibJ+QutquOWwGhT5G8B0Z9iEbj4aKrJG5xuY/J1ggOzS+PHIClGGXOG0VudqrrYx
 y0sdInAAgwZ6rpLMth2XkVLexoDskg7vRVWFmGzI0W81s8vUZ+0XSsTAqeJlEFzNe3rI
 FeCsnf1tKMWueRApsSZPAM4tWD1qnJ7POCcP/BF9WuOrFlappHZ6tKTO+Trq4JWEtkZh
 heX5gYJbEKJNeF0WZZerTM31oI8bBPxqfXdlx9quLBh9fn6fsCZXCOD9ojWzGawHkbzY
 EU5diMl5VJ0Xq/8zMb3vpaGMtJarmgWutX3RQuhfLv80BqhNz97/vct8seLNUYPEGa+R
 stXw==
X-Gm-Message-State: ABy/qLYYJxdZ6dZpXg69QxiY/ioJuxxMB8viX3VCH4ZtlXMGXacLgxBO
 LXF7z/kMok/apFB36w38aCfMhPOJEn2JM0ms2JgyOw==
X-Google-Smtp-Source: APBJJlHCdqOOXKiYMw7LUPV4j+hT7oQIKomGK4x4ZnBX8mHfERcZpD5jG8s6GHbktw4avi72qFd6jA==
X-Received: by 2002:a05:600c:cb:b0:3fb:fef3:53f8 with SMTP id
 u11-20020a05600c00cb00b003fbfef353f8mr4239074wmm.25.1690963590479; 
 Wed, 02 Aug 2023 01:06:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003fbe791a0e8sm1032290wmq.0.2023.08.02.01.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:06:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230802-drm-bridge-chain-debugfs-v4-1-7e3ae3d137c0@ideasonboard.com>
References: <20230802-drm-bridge-chain-debugfs-v4-1-7e3ae3d137c0@ideasonboard.com>
Subject: Re: [PATCH v4] drm/bridge: Add debugfs print for bridge chains
Message-Id: <169096358947.1556882.730502701298336758.b4-ty@linaro.org>
Date: Wed, 02 Aug 2023 10:06:29 +0200
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 02 Aug 2023 10:04:11 +0300, Tomi Valkeinen wrote:
> DRM bridges are not visible to the userspace and it may not be
> immediately clear if the chain is somehow constructed incorrectly. I
> have had two separate instances of a bridge driver failing to do a
> drm_bridge_attach() call, resulting in the bridge connector not being
> part of the chain. In some situations this doesn't seem to cause issues,
> but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: Add debugfs print for bridge chains
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8e4bb53c902ed2b06a2c4778e6dbb2c1eeec4960

-- 
Neil

