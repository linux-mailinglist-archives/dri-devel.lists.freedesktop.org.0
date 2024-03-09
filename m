Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4B87715E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 14:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6737112067;
	Sat,  9 Mar 2024 13:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AEnBv473";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046411206A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 13:29:42 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so1630618276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709990981; x=1710595781; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7Taks8J4Q9sFVLRwiypdMlNYDVyNw9PbFVLyOKOfmc=;
 b=AEnBv473yJqd02B40Uy4tJhbc8OyCBB/eJSn6LWyOvlJ5opQ4rcoE2RdlmtjHQjX39
 /AQJZv9l4a+XFP7zR0IEEleLDBrqCt3BMsIs6daXuBR5DZJ5DuFI4nG4x/tRJPNVltaj
 X4xFzK6fp8XPGB7XWPKB6vUaabbNTkC7V6yexjagdDMohg1Kr4psWOYgd5IrJ/jX7KWM
 bRyFaVfypmLS7QRNscGALyGlmqS2+20QPN0GsB3ua89ryWkn3QkcA8rKf8d0B/3mNiM0
 nJyA+RYsEZEgfOZ+t2kgMLlTaIZBO4DX0G+Xt9lDVlS4a3jydZUdxJnU/aufdS2wAOMQ
 nbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709990981; x=1710595781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7Taks8J4Q9sFVLRwiypdMlNYDVyNw9PbFVLyOKOfmc=;
 b=JQRoFbCQu5qPXsczFHgkpstiUdS/Kpcm9r763Mf3JmM8Quws9+2x/bYj7wj1lqbxtv
 hNGRIaMb4+KQUEgQhubW8NxEfxB0kSiCXf3NVaDtoA12xUQ7XzEeFn1Ypp8ESThtrYir
 IdRwrRZbnNW2am0MM7tESmdmsp4l0/Olz3P4plOR886AiLiGjWdDGgp+9iMIhHrfmG5V
 FUpNUUHUW9TFc2NCaQvm3zQatiSl54EEOlfbhqSOA1Ic4m4OqhUQRKLTMRL34/yYrd4X
 YtS/x0tYCErQJI86wRhIhTY086PoCa42SsPsTssvH9Iz62X1IITPpt/Tgqca1I7UZdUC
 nxFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvA5hjjuAaI+5hZsaAr9CAloalyGApqFD+6gP/8eC+iyll0rDEt7FZHDo8U+FjsRTZReobar8I2JbN4KDOhexcUWFL8eJkYwwMjI3vq2iI
X-Gm-Message-State: AOJu0YyfTNIldXZfn/FRs7eMdGlnVXj8iMURnzjZ+DyescCMhH88ds9+
 u7ZyigD99EBGAL1mJbhoNE6ffNkVeO4X0AMVuYpAN6By9hkL+sFtV8Hg5bGtapqEsQW+L3dq7Ty
 mTGOctwX5iksYGWmNqwHx1r5yEWyXJuwoo9HpUA==
X-Google-Smtp-Source: AGHT+IEU99pr/n1rIb3maLzCnZ8v4EqdMm5b+eo+nyeZpNwNODRAEJabBbvcmArDjxlPH5orGzupS8f8fkVQ6IaybiE=
X-Received: by 2002:a25:aa84:0:b0:dd0:467:2e48 with SMTP id
 t4-20020a25aa84000000b00dd004672e48mr984517ybi.40.1709990981142; Sat, 09 Mar
 2024 05:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
 <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
 <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
 <CAA8EJpp3yd33pYweL_exrXMJ3g-m7-yjJrjiVMVMevOadBtt8g@mail.gmail.com>
 <28492cfb-5327-46d5-8c08-233f1786ff44@linux.dev>
In-Reply-To: <28492cfb-5327-46d5-8c08-233f1786ff44@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 15:29:29 +0200
Message-ID: <CAA8EJpphapGxz9ztD7FUE5y_CVuuz=gySbOJquNXSw29vexKgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 9 Mar 2024 at 14:03, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2024/3/9 18:39, Dmitry Baryshkov wrote:
> >> The code path of "creating a connector" plus the code path of "not creating a connector"
> >> forms a 'side-by-side' implementation imo.
> >>
> >> Besides, I have repeated many times: the DT already speak everything.
> >> Device drivers can completely know if there is a display connector OF device created and how many
> >> display bridges in the whole chain. If there are connector device node in the DT, then it should
> >> has a device driver bound to it(instead of create it manually) for a perfect implementation. As
> >> you told me we should not*over play*  the device-driver model, right?
> > Please, don't mix the connector node in DT and the drm_connector. If
> > you check the code, you will see that the driver for hdmi-connector,
> > dp-connector and other such devices creates a drm_bridge.
>
>
> OK, I'm not mixed them, I'm very clear from the very beginning. I have checked
> the code years ago. Let's make it clear by iterating one more time:
>
> If DT contains one or more HDMI connector node, then there will be one or
> more display connector platform devices created by OF core, Then, according to
> your "don't overplay device-driver model" criterion or modern drm bridge standard,
> we shouldn't create a display connector instance in the drm birdge driver, right?

Yeah, if the platform is updated, yes, we do. If there is an
hdmi-connector node, I can only assume that the DRM driver also has
been updated to pass the DRM_BRIDGE_ATTACH_NO_CONNECTOR. In such case
the lt9611uxc driver will not create the drm_connector and everything
works as expected. If this is one of the legacy platforms, the DRM
driver will not pass the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, but at
the same time the DT will not have the connector node.

>
> As otherwise we will have two display connector driver (or code) for a single entity,
> right?
>
> Another side effect is that
> when you create a hdmi display connector instance manually without reference to the
> DT, then *you made an assumption!*. But there are users who have don't a different
> need(or  different typology), for example, they need to read edid directly from the
> KMS driver side. This may because the i2c bus is directly connected to the connector
> part, but the display bridge's I2C slave interface. sii9022, it66121 and tfp410 support
> this kind of usage.
>
> So the real problem is that it is a policy level code  when you creating a hdmi
> display connector instance manually without reference to the DT in a common drm bridge
> driver, not a mechanism.

Only if requested by the DRM driver itself.

--
With best wishes
Dmitry
