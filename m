Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93724BE8C3F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4794010EBE5;
	Fri, 17 Oct 2025 13:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="doJgGRPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B010EBE5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:12:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so316259166b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1760706755; x=1761311555; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8drcKWNAi+zMP2KK5ndN4M8ywLJ52BdkCEh7QRMWbE=;
 b=doJgGRPRN1OZZLsf3SSYe4MOfSDVrXABivq/jDt5e002l0IvvzeEfyVZx9e8el85tE
 HRXWIb8/CQZ6J9lpW6Vj5AiS1+sXXSDr57duQEr4pPJQV7+x6LlT5qpWaKeDVtuEmU0/
 GPpPPfZTHCyGM0M91TKibNOKAWSmWwU5W+qEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706755; x=1761311555;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R8drcKWNAi+zMP2KK5ndN4M8ywLJ52BdkCEh7QRMWbE=;
 b=Po2xxn2gSwG/6pPWYpkgFiWveViIeRPxoxtKgIwJN485Bucu9p4KHY6mGrUGbtBGLm
 EjxXTSudVUdvB2PpyqLOuMb/IArbjHkgg0M0Fgqw8u0UB7/pCxhsVefF1j0SmFwyLOW9
 2fgb5MO4I6Edc8OzCuNl0f5EyUdGRuJgmb5gZHAyYc58uldSuVW+htbyNMtWhxu/Q3jh
 Wm8nlZc3ZfhvE7rH+k+Nuc6my7OOxCcKeITdKWHTCeLJnUyqQ0WYn3aqKMqOL3KftVOs
 Y8SYbRsDOxlyjGGDUcNoM9lReVfKxDXwJuI1iC7sR4QmTMl5ujr2KDuqkKT72rN8gGEF
 qGXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVseaaV6dhFV8v0m1RE1ncn+/71VyzRg1W+mhclr6adbUQqcUN9ca7ub82KF944+1lw9NKM89p2uo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwU+cWzRGL05qgPZcctXRk4cKeRncrk/qT/F7AgU3SJmjUJAkF
 HsClxrVeO+r/ZDAHj4ceXRm3CFeIgleldJqobesXCVUwZPxgXffvdFlxn+gZugmxmoU=
X-Gm-Gg: ASbGnctUYickPRdEny0zgr2fHu76I8CQbtNH4BHeTL3PN2PRa16pxcvtBrcCfuAXiIS
 kKrrpxn3DT+kgoVUcC2kk4Zbf6aVBL3jnnVKMYFI9AL+xoYSazyiFw/xK2lvun6ev7RXRZiAJKH
 oDJjfTmb1tH0aDVhbM9WmKa+oQxHXJjjVsQlkZWZsvVdKmp/PKvMZP4V3Z+TY9SzE/GcO/zETWo
 OD2iTeR8Mk2kg1XBx0UlP9BXMBZ0V/zicr4dOS7BwQJ2bCiunuwZC3Ch6YjocpGtDkVl1dV36Sz
 zVR3/wFArBRyx+ucNc9XbovunsYZPB2Nn/1YUIUqAxlN/gX5qZR51WqI0f+20Vb+qERuFj3lAaW
 JkyBApuMind4fXgrUfVZwx2LpHVVGRy8ADui/vZ3KAKshu0wI3669fADhtjGBTw7XK6QsaDtVtG
 VsM26ouhDZ2P2QPM/fJ2EMjo9OURbzc7z5
X-Google-Smtp-Source: AGHT+IEMtwbVyTQnnInJbTsw7KR4oYloKA7FU2ZIGPqsvz+QRaG+CGdXd8qcNMVx7WoYarGXqRzumQ==
X-Received: by 2002:a17:906:b04:b0:b64:97ef:a636 with SMTP id
 a640c23a62f3a-b6497efa657mr264996066b.31.1760706754548; 
 Fri, 17 Oct 2025 06:12:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cba45ad2fsm818093466b.35.2025.10.17.06.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 06:12:33 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:12:31 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <aPJAvzROMCnFwRJc@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x>
 <20250923-rigorous-tamarin-of-cookies-2f1a25@penduick>
 <hd7gjmsbxjfaffxaxvnafzlq6rf625nxqfmcrllnndl6yigtaq@o6vaotpu55by>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hd7gjmsbxjfaffxaxvnafzlq6rf625nxqfmcrllnndl6yigtaq@o6vaotpu55by>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Sep 23, 2025 at 01:30:43PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 23, 2025 at 11:45:49AM +0200, Maxime Ripard wrote:
> > On Mon, Sep 15, 2025 at 09:40:57PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, Sep 02, 2025 at 10:32:38AM +0200, Maxime Ripard wrote:
> > > > In order to enable drivers to fill their initial state from the hardware
> > > > state, we need to provide an alternative atomic_reset helper.
> > > > 
> > > > This helper relies on each state having its own atomic_state_readout()
> > > > hooks. Each component will thus be able to fill the initial state based
> > > > on what they can figure out from the hardware.
> > > > 
> > > > It also allocates a dummy drm_atomic_state to glue the whole thing
> > > > together so atomic_state_readout implementations can still figure out
> > > > the state of other related entities.
> > > > 
> > > > Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_helper.c | 382 ++++++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/drm_mode_config.c   |   1 +
> > > >  include/drm/drm_atomic_helper.h     |   1 +
> > > >  include/drm/drm_bridge.h            |  21 ++
> > > >  include/drm/drm_connector.h         |  26 +++
> > > >  include/drm/drm_crtc.h              |  19 ++
> > > >  include/drm/drm_plane.h             |  27 +++
> > > >  7 files changed, 477 insertions(+)
> > > > 
> > > > +	drm_for_each_encoder(encoder, dev) {
> > > > +		struct drm_connector_state *enc_conn_state;
> > > > +		struct drm_crtc_state *enc_crtc_state;
> > > > +		struct drm_bridge *bridge;
> > > > +
> > > > +		/*
> > > > +		 * It works a bit differently for bridges. Because they are
> > > > +		 * using a drm_private_state, and because
> > > > +		 * drm_atomic_private_obj_init() asks for its initial state when
> > > > +		 * initializing, instead of doing it later on through a reset
> > > > +		 * call like the other entities, we can't have reset xor
> > > > +		 * readout.
> > > 
> > > Would it make sense to unify the way the bridges / priv_obj handle the
> > > state with the rest of the object types?
> > 
> > I would be all for it, but I think this is pretty much the same
> > conversation we had in my recent bridge improvement series. Aren't
> > bridges not assumed to have atomic support and thus we can't really do
> > something better here?
> > 
> > Or should we move all bridges to be atomic?
> 
> I think I had something smaller on my mind: make drm_private_obj /
> drm_bride provide the initial state during the reset call, like all
> other entities.

Yeah something like that crossed my mind too.
-Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
