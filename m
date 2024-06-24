Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5D9146A9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223010E070;
	Mon, 24 Jun 2024 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FLIlkFza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1410E070
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:49:08 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso42839491fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719222547; x=1719827347; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8m390afH3EHC94T9TLjGH5rkccIMRXz02pwQnKceOW4=;
 b=FLIlkFzapyM+CS/ZwaRqB/Yn8MXuXiGsR31VRKyFgs4bIbynGEWgENodjgwjFYfmNs
 C0phoK1k0QhjlkSLosL+NIxEVjXGwdP4Lbmp6SjMTVocCVuHhHBLLh9eOJWH8KIRndv1
 t1wUIzdoMQL87zgnGUy8u9vfHzJ992O3L3MayJQ25VtmCiSuCHqVCanJmvc0YhhE6mMU
 tlQvp6juimSeJ3YfQxtfyZCCh0oc+RipmHq3wM7X9aucn+zWWKXk8kP1uKfSzEwHEx0R
 /5mz2M2pxt170cQoJZE4+Woax8LsRuihlvgSOWd7gAgbFGt9qxj7ExXWCv35DjYji0gw
 xOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719222547; x=1719827347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8m390afH3EHC94T9TLjGH5rkccIMRXz02pwQnKceOW4=;
 b=bFbmZJLDXxrKwJSv3xQL27SV7bFZbgLdp6dw6mIbOwNcA+d9mg/9CxA5Qx9d9Gt0MQ
 3nJyHgtnrFJ/fNS+LALHdvzI2xk9Oj8u/eMytw6La2HOQ1bufydYLL42oMpJ5qQ1/IB7
 iuVCia0dTq7fQHmGiEtM0Y2p9uthNtSmKimUghjFPoPJv61q6osSBZE5OTuIi24AlF1v
 ce7Hx5nEd3Bg/Nuq78y5TAvoUnDv1RDycK659wGFI1dJgCvt03Edy3kh4g2pMelsUs0A
 14jvoanatPIVS0sVQolO5sJdkFrN68GaFTFjkH0bSs9vq0NBBNoWonPyGOGJMA2xqUmb
 y9ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpVCC8unpBNQscz6wIsJf4R6LacYlMFc/42ROQJS8mbJO+pTP+qWy4ahzvfGlRd+NZih+H2rqUlU0G8fsfiQLSc6gHT4ryCLFb88ri+oEI
X-Gm-Message-State: AOJu0YyC+rnZL0nKSNfIHm3nGSNxhQWz2KQBQY1mPZmlorQsux2/GT6X
 RfXbWJHUZa+xgXsFRWlbQmYsFJ3Pv02U6vCc/cwr95tZTQdyO4UQVAcotfB6nbM=
X-Google-Smtp-Source: AGHT+IEdXV9FcgPiWFVGfg2bBJoCKqvS4QWdUnkhT4ii7J+rnercJlEkzH8zVTvYWjDnzWYF+vW+Ig==
X-Received: by 2002:a05:651c:154b:b0:2ec:61b5:2162 with SMTP id
 38308e7fff4ca-2ec61b521d6mr14914311fa.25.1719222546838; 
 Mon, 24 Jun 2024 02:49:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d601733sm9272031fa.22.2024.06.24.02.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:49:06 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:49:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Marek Vasut <marex@denx.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-ID: <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
 <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
 <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
 <o4bwopeuyxm6344oqqm3e7p3xcx76aw2trsiuhhfyhel2e7po7@sz2jaj6i7kqd>
 <71e809fa-b471-4bb3-8f7d-e497397c0de4@ti.com>
 <bebvl4vycvpkdqjlz3xi33t7qtb4oj7mriywxmahfemyee3uxk@m3nbraynomg2>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
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

On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
> 
> 
> On 22/06/24 17:49, Dmitry Baryshkov wrote:
> > On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
> >>
> >>
> >> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
> >>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
> >>>> On 16.02.24 15:57, Marek Vasut wrote:
> >>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
> >>>>>> Ok. Does anyone have a worry that these patches make the situation
> >>>>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
> >>>>>> are not set up early enough by the DSI host, the driver would break
> >>>>>> with and without these patches.
> >>>>>>
> >>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
> >>>>>> I'd like to merge these unless these cause a regression with the DSI
> >>>>>> case.
> >>>>>
> >>>>> 1/2 looks good to me, go ahead and apply .
> >>
> >> Isn't there any way for the second patch to move forward as well though?
> >> The bridge device (under DPI to (e)DP mode) cannot really work without
> >> it, and the patches have been pending idle for a long time. =)
> >>
> >>>>
> >>>> My local patches still apply on top of 6.10-rc4, so I don't think this
> >>>> ever happened. What's still holding up this long-pending fix (at least
> >>>> for our devices)?
> >>>
> >>> Neither of the patches contains Fixes tags. If the first patch fixes an
> >>> issue in previous kernels, please consider following the stable process.
> >>>
> >>> If we are unsure about the second patch, please send the first patch
> >>> separately, adding proper tags.
> >>>
> >>
> >> Thanks Dmitry! I can send the patches again with the required fixes
> >> tags (or just patch-1 if we cannot do anything about patch-2).
> > 
> > The problem with the second patch is that it get mixed reviews. I can
> > ack the first patch, but for the second one I'd need a confirmation from
> > somebody else. I'll go on and apply the first patch later today.
> > 
> 
> Thanks Dmitry!
> 
> However, would it be okay if I instead add another patch that makes 2
> versions of the "tc_edp_bridge_funcs", say "tc_dpi_edp_bridge_funcs" and
> "tc_dsi_edp_bridge_funcs", that have all the same function hooks except
> for the .edid_read()?
> 
> The dsi edid_read() will remain the same, and Tomi's patch - patch 2/2 -
> will only fix the dpi version of the edid_read()?
> 
> The bridge already has the capability to distinguish a DSI input from a
> DPI input. This can be leveraged to decide which set of functions need
> to be used without any major changes.

I'd prefer if somebody with the DSI setup can ack / test the second
patch.

-- 
With best wishes
Dmitry
