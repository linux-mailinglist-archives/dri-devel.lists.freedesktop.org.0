Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFDA03D3F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D79B10E1E6;
	Tue,  7 Jan 2025 11:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DPsUCdO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE2B10E1E6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:06:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2853056566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736247925; x=1736852725; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JINas9gXEeJz7rcdz67KY3tt8Mqk5Hz6CTYnyoJPpTs=;
 b=DPsUCdO/ZbeXExXPqQ2HBkmPPsHsLTJ+vbM+RHd6CaY5ZtLCtny1jXYnZCukJQqV+S
 22/aJDSwQnirujuWnoyZrfz5MLnDCD8dK6eb2wiVsfEQaEggyfEMRzYw0Ipne/tFxwjl
 gtWEHpOfClZY3Oibe309WvfK+8+mMtdFhHTMsiC+Y4NfwnQUvYuy5R0DrGkovRVUAkbW
 bx2Wr75kYU60pF24VBAzJLmibc0K/421NdyICcKCqDWBVGxLEWQeX9FBkodixsPpR/0P
 3TE+Y+dpTi0y67I7WilA/rQ8AEaeucRvBKtkGbVAoi1HWM+5w9tP3w+HAcIvJQ6V7ICY
 plTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736247925; x=1736852725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JINas9gXEeJz7rcdz67KY3tt8Mqk5Hz6CTYnyoJPpTs=;
 b=PnKqzznG9x9Bg6BqZoEk21I8g7FtEWoz1lkI6xxvaICd3c4aPyh46wtiRUh78lmiPD
 539DKD4C7ysLDSgRkElpbk1m6CjC9W7GCCrFHpJOG8lF+L+xAB100D1jaZHz3MQ91wSn
 GGn/P13nAKYQCcfZtOCs6ADTmzdqN3XN1zzCWCfof8I5aBAn+ewVwAAICLDXD+L+1R1J
 GPoVN47ngKmIcdMsenHytHNjQ+5NqVozGwYzh2VC0EQEqXKqH0DKF51fFe+EUl7TeK94
 sdX25VPPZs7ErKM3nCySQFPmDTqDE9VeqDj9Bk+6awrxhpqIq7oqcwhxTbaW5aaLGyCX
 IfkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUroraAWi6BOF9StDNhCW+Qw5JFki2xMSv4JZCI6emD+jpek5ACNiU7lusDiKE1M2BmtuVJNbzJMyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhiLoPmFmI1eYRVF2xYbHtNqEeZV18fsKCWBVTTWFIh2Ut+xKw
 ZNWAlxMuKOkNCD89Rh0bHhLCVi6SQ0Tq9/BA1yJvt9eDWqQi4FmukuKxn51Tgqm4qb2AWfMaiuk
 bPjA=
X-Gm-Gg: ASbGncsf+NUdSvETIsqQfvElWOFPxc53yfTYKNgSDm7KirTBmYgJBDKSUPPXorfYggC
 zxXNo86qxdZbqOYsiZvlz0LEG3Eja1XrG1EuIMkUuL2v2ah/miMkhzia3YvCNWrlkmPyEstKRBh
 yvDS5TiqQvhFQcdi+gtSh0/FJx5Z3HTm3kjVWLRC4keDGrcXnfeIKAQRQcaP52FavAWlCDUb6Gj
 8HsA9A2VpjaZdd+GIZ9AjnwN/g96Eeo3wdcN3VdvSQaKK4lsxC+Yqo83fKFhuVzSJz7nW57YQwL
 32es+p/+tnz6UoQ/NvZTs8Nl37LyZpMeL6IS
X-Google-Smtp-Source: AGHT+IE0zfPqdYbHJt8ILQi+9nj0qarNfhAx8Xa50MPg5cctWnzkdXY68gv9r+BrM9ugjLbK6znTyw==
X-Received: by 2002:a05:6512:304f:b0:540:5253:6af2 with SMTP id
 2adb3069b0e04-54229525548mr16213576e87.12.1736246119653; 
 Tue, 07 Jan 2025 02:35:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542236001c0sm5227326e87.81.2025.01.07.02.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 02:35:18 -0800 (PST)
Date: Tue, 7 Jan 2025 12:35:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <2ay7s3nokg2yyks2t7df6niee7z3a2jhgqw7elumk3lirdvjbk@qqrnkbwcfqly>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250106-quick-exuberant-jellyfish-cddde2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-quick-exuberant-jellyfish-cddde2@houat>
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

On Mon, Jan 06, 2025 at 03:49:48PM +0100, Maxime Ripard wrote:
> On Mon, Jan 06, 2025 at 02:24:00PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 6 Jan 2025 at 12:39, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Most of these comments affect your earlier patches, but let's work on
> > > the API-level view.
> > >
> > > On Tue, Dec 31, 2024 at 11:39:58AM +0100, Luca Ceresoli wrote:

> > >         if (IS_ERR(priv))
> > >            return ERR_PTR(priv);
> > >         bridge = &priv->bridge;
> > >
> > >         ...
> > >
> > >         drm_bridge_add(bridge);
> > > }
> > >
> > > Would work just as well.
> > >
> > > I also don't think we need explicit (at least for the common case)
> > > drm_bridge_get and drm_bridge_put calls for bridge users.
> > > drm_bridge_attach and drm_bridge_detach can get/put the reference
> > > directly.
> > 
> > As I wrote previously, I think drm_bridge_attach() might be too late for that.
> > It sounds like drm_of_get_panel_or_bridge() and of_drm_find_bridge
> > should increment the refcount, possibly adding a devres action to put
> > the reference.
> 
> We probably need both. drm_bridge_attach adds the bridge pointer to the
> encoder bridge_chain list, so if we had something like
> 
> bridge = drm_of_find_bridge();
> drm_bridge_attach(encoder, bridge);
> drm_bridge_put(bridge);
> 
> We could have a dangling pointer.

Yes... So, both drm_bridge_attach and drm_of_find_bridge() should take
the refcount.

Just as an idea, it might be nice to add refcounting to bridges_show(),
so that we can easily verify that refcounting works correctly.

-- 
With best wishes
Dmitry
