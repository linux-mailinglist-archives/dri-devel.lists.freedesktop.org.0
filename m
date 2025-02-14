Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200BA35EF1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC7610EC9D;
	Fri, 14 Feb 2025 13:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L2K1dMw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7BF10EC94
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:26:16 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3091fecb637so5334241fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539575; x=1740144375; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xtcyLVKqe8TuXjrm6a7QBmXjMFai0ljcx+mgo7ftSgk=;
 b=L2K1dMw1+4TSUihz4onwaPkZDipD3gHmh3vU8GQGr9pIDRRu4kSa13UbPXR1ygWUaE
 ipP7zQf+yfWgs6vzoy55DW1wupNfigyhAqHYQaKD6gQbsw1SxILlzOzNXbDtXPcIKeUj
 txGHC8AaC/ojb+39fo7rNxDT5fNRi4biAKMoukqxRrv62E/EW/+iEPm8KGsS2+070j9h
 lnWe46IeUBc0pme0eJP7onjYyF7F+HTc0uukHQWsB9BztNrTJjEBtnrOGVEnOlB7ZfnH
 PGI2NmgK9VFzmdLzXILi6OwlTIbeBqGB7VkI/Br+lgaMcJKqYhM1TXqeRNGkfhtQgYp+
 3luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539575; x=1740144375;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtcyLVKqe8TuXjrm6a7QBmXjMFai0ljcx+mgo7ftSgk=;
 b=SHnl99yPGd+vazdWo0rAzPmv8yxJC6U3pccS8m/8wkJm/di0ZN3R0nOXfF8hLAVUWH
 oP76zZTqmIZSElwq4i6Pjr+65ke/CBMRPmPUtBYoHzGRMj5C51mRlONR9jS08Hn/Fy7M
 0bZ/7DY7tgtqsRbzOMAZINBE/p1GXKXAH2hUigt+QFPCBj0/vXL5V9Vo0/to8Y8E9Z/K
 kSm10cToI6FUX9F8udUI4JyxJCd6+eCQzx1RfH8s9yXHRYX/76sfK6TFRQuZ+CpV9IoW
 dBO8meFDvaE6yroxyEF6CizSjugtSIMxl+DJvpruX1hXI01jF2hP3deiECdn8QvNYA7a
 UvuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1OoMeeS0oFPgm3AzYmcj4aD8pxZT9EL+nxKYNpRzfGg5gHFNHBeE/wIqh+IaqspXTw0XS3Ja2pek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLi2THWFu/kOIxA6c53+wHt3evHBoE2ZsTYfsSLXUphHnynCn5
 ovBKds83UXNrgYZTw5zLj3p1NRb8WOUiZXP6YsithQJ0ULfIFvCD8z4oAAlYmcU=
X-Gm-Gg: ASbGnctzZhSepH4RbUwBc46VGDN3cRePfQ3bgISO4mg2k7TUTOD3ClahjYLEfMGxsWG
 tcRbhRDxOMfsO7J4fA7qqP/pE9ty0Gk+ay6W1972y+ukQ479/bmrA/uA7C7Tt8veejlD03H4sPq
 Enq+kQIWawYpD9MsZmQdivQaMUwG148xylq20a/ytonjk9uYenw1JZ8DL5Vhmm4EXt8Sx7Cw9MN
 NtWUmZSmXVdqanR5ss6N2t1a9nsHb0IadClUrqGItASg6oG6lQgbwgMh3tBEzq66fWKtRKj/PRV
 esBdFTpxslL7DKnJDWnnvbacvU7fhF6IeLKmv2SMS89R7l+5GiBNUyNBPRcw+zZ08SzbUzU=
X-Google-Smtp-Source: AGHT+IEEwoEsMm0mqK5dUwUP8dPwEw2WkrSX9yJSXwHrbo3H+703YZ8PIf8yI+CMDaqWEB2Htuehmg==
X-Received: by 2002:a05:6512:1318:b0:545:e2e:844a with SMTP id
 2adb3069b0e04-5451ddd7917mr2541333e87.38.1739539574807; 
 Fri, 14 Feb 2025 05:26:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09aa9asm535389e87.59.2025.02.14.05.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:26:13 -0800 (PST)
Date: Fri, 14 Feb 2025 15:26:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 30/37] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
Message-ID: <x2qp4dy7gsqns2czx5bml5ofdyfwsl7jhdmy5ptwslvoz3d56z@e7otlhrvmf5f>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-30-e71598f49c8f@kernel.org>
 <vjdpctck2afcjrt2rlgjtzmrkf4a5bg5ihymc53vuw6md576wd@kbb5y27a5woi>
 <20250214-icy-earthworm-of-happiness-6bca70@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-icy-earthworm-of-happiness-6bca70@houat>
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

On Fri, Feb 14, 2025 at 01:59:01PM +0100, Maxime Ripard wrote:
> On Thu, Feb 13, 2025 at 06:29:46PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 03:43:49PM +0100, Maxime Ripard wrote:
> > > The drm_atomic_bridge_check() runs the atomic_check callback if needed,
> > > or falls back to mode_fixup if it's not there.
> > > 
> > > Going forward, we'll need to setup the bridge atomic state even though
> > > drivers might not be implementing atomic_check at all.
> > > 
> > > We can thus switch to using drm_bridge_is_atomic() to take the atomic
> > > path, and do additional things there in the future, or go the mode_fixup
> > > route.
> > 
> > This will break bridges like tc358768, rcar_lvds and mtk_hdmi: they
> > implement atomic_reset() and mode_fixup().
> 
> What is your suggestion then? I kind of did what you were suggesting on
> patch 1, but it wasn't working. Then you want me to roll back to that,
> or something else?

Well, we just need to call mode_fixup. So something like:

	if (drm_bridge_is_atomic(bridge)) {
		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
							       bridge);
		if (WARN_ON(!bridge_state))
			return -EINVAL;
	}

	if (bridge->funcs->atomic_check) {
		/* drm_bridge_add() returns void, so there is no way to
		 * reject non-atomic bridges with atomic_check()
		 * callback.
		 */
		if (!bridge_state)
			return -EINVAL;
		ret = bridge->funcs->atomic_check(bridge, bridge_state,
						  crtc_state, conn_state);
		if (ret)
			return ret;
	} else if (bridge->funcs->mode_fixup) {
		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
					       &crtc_state->adjusted_mode))
			return -EINVAL;
	}



-- 
With best wishes
Dmitry
