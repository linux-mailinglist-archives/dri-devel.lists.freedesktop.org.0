Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F36A38CB2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D0410E5C5;
	Mon, 17 Feb 2025 19:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j39bFOoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB36B10E5C9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:47:56 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5454f00fc8dso1881263e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821675; x=1740426475; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p/HiC3hU7W8x9xtMSQInvGC02cUUR7tDCJw/WUMoZi4=;
 b=j39bFOoqkh8uviCW55Radi5aWUAyzd9azgeYZPyQlWBfQeNxUyX9O1VPIJVcGrpGl3
 fkj6hefjj6GbKCakPvQgPtMYAWXs4H/DP3AADMRPhcYHCxSiozJRN4lAKGAaEBdPuxpI
 U2Ig5TVtOPvbq0HeRv9pBtALSEkicwieVKxzXVoSjo+pf7gNoO2Z3o2vmJE3wGXHuLns
 /iA1hUUUpFVRMh2t4Em6PCUsQ4g/3/2ypu61ml1dtKp8REMRUmIyfixLBbDJBn38BXBd
 h8skfLVz5+iwYscE5P5nQaopppUgPH5Z4uJlPsFVzS4vSLPfQQVqlXBvMKGL/OTSQGzY
 3u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821675; x=1740426475;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/HiC3hU7W8x9xtMSQInvGC02cUUR7tDCJw/WUMoZi4=;
 b=MsQOTGLrBER3IWGQ+v+TrI7KA0aPDwcDBRO1rj9gzQJwO7uyv5TTmIUweLkFVOxJs5
 l6qHA2kL2oLUJIKsEAHWrraVfJRQ8AAAQZBSZgrAtc0NRTjE7yp159GKbykcsDjBuUDq
 1DgTYhkxSJhULUxqnyPj812PGYrt0C3qvIlal+cDsJCRGuUj6Au7tfAP8FIXh6B+wNVg
 BgIE7toSicyleXiWGv0tQf/mJqx1oYjFsuu5POcyol4gV4OObpqA/D3DeY99OcBNCANe
 rfKPaULSplJIw9HMrRz0r6nCfDCjoO+uWNJQ/t8qp0I2NpA84YzkhGujDRfjwnqQjYwx
 cqNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG9u6htc9Rwo+PAbyUymaM2LePSgF7U4VwohT0r1iYEdq9dJBvbzW4cFmzZPWp0+z51NUWD4dYL/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkMOJCEvqM75ZKf2qhGvpoZpXfYjt6F5kvJIQWrWT1VZEVKZBp
 XUqySZCTNjhkXPrYtDb9y0PC/WQ5oLRrpHzslYrKLKDmOnxieCEqv+ioCkugT0s=
X-Gm-Gg: ASbGncvzsrETHhomw9WCnYNvtmh+lYznf2O1Av9DlBk9+TY1xaU2AYzIjc0l9/7vstw
 Ot2xFb76hWxtsRgO0iqwD81A0D4Jg80TdVPVwgCPAAiwbbvTlMXKyZ+EPW49lPTGcQiMD+Ru+To
 Y4COk6OaFMJqlEYskkk1Gqg+z8Nmgq3uDJdNaVBh0L8PPJPH6D4wQaW8wMoJc9GHWyPmzkMvSdO
 XyLLBWty7PssJsXiA6WCsFoOk2t1iGdtNReq+3t0uCnKdJUAfgaTjETBgt8fhrXK33AMGCIt/vx
 AriIARALCBkWebApFTxP6Yb0qfzM26F2a4KY8tIeiQIAvqq1Nq1j6vb5M3+EYTSPHu7dVdg=
X-Google-Smtp-Source: AGHT+IEyW9gnl6AxRgNf+cTRw4yWiriWXFGVNouMOXVj5teJibUT/tWX/bcCfAWYd9bPM73A2ArFrg==
X-Received: by 2002:a05:6512:ba6:b0:545:2fa7:5a8b with SMTP id
 2adb3069b0e04-5452fe3aaafmr3876097e87.27.1739821675112; 
 Mon, 17 Feb 2025 11:47:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452684a9eesm1408371e87.32.2025.02.17.11.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:47:53 -0800 (PST)
Date: Mon, 17 Feb 2025 21:47:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <dksptjtgipcuuivp3tud5lhghoiqrak5t33m5pz4jtssegz75t@fanvtjdmy2pp>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
 <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
 <20250214-arrogant-strong-hoatzin-efdcd8@houat>
 <yy37e4kne7i2hl7coix6v7vajb5bm4zohod4fdzayvxr52l57u@cxturs2uxgcm>
 <Z7Nl8JiFncngynNy@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Nl8JiFncngynNy@phenom.ffwll.local>
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

On Mon, Feb 17, 2025 at 05:38:08PM +0100, Simona Vetter wrote:
> On Fri, Feb 14, 2025 at 03:29:12PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 02:07:18PM +0100, Maxime Ripard wrote:
> > > On Thu, Feb 13, 2025 at 06:35:15PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> > > > > Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> > > > > pointer to other currently bound entities. They are all considered
> > > > > relevant only for non-atomic drivers, and generally perceived as
> > > > > deprecated in favour of the equivalent pointers in the atomic states.
> > > > 
> > > > I think there is a significant difference between mentioned fields and
> > > > drm_bridge.encoder: the former fields are variable and can change. The
> > > > latter one is static and set at the bridge attachment time. Nevertheless
> > > > I think it is a good idea to deprecate it.
> > > 
> > > I'm sorry, it's not clear to me here what you want here either. Do you
> > > want me to change anything to that patch?
> > 
> > Well... I was thinking if we should expand the commit message. Most
> > likely it's fine though. In the end, I've r-b'ed the patch.
> 
> I think this one is wrong, since the bridge->encoder link is static. This
> is unlike the connector->encoder->crtc chain, which isn't, and where you
> really want to go through the atomic states or you get funny stuff.
> 
> I don't think we have bridge chains with multiple connectors though, so
> this is fairly academic and so maybe still a good idea to make this all
> more flexible? Unless I've missed the memo and atomic bridges have
> flexible routing, and in that case yes this shouldn't be used.

No, bridges are still attached to a single encoder, however I see
Maxime's idea in uniformity. It's easier to remember that all direct
pointers are deprecated rather than remembering that bridge->encoder is
static, but everything else is dynamic and should be accessed through
the state.

> 
> Mildly confused ...
> -Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
With best wishes
Dmitry
