Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5BB58163
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E125F10E4FA;
	Mon, 15 Sep 2025 15:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x4Pdobj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784E10E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:58:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 32D70C8F1ED;
 Mon, 15 Sep 2025 15:58:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F8586063F;
 Mon, 15 Sep 2025 15:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3CAA2102F2A5C; 
 Mon, 15 Sep 2025 17:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757951911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DamnrMPL+mXDLfGrUw/hnqqyh2Urrlm64DKRH83FzbA=;
 b=x4Pdobj0zrZkumQ8rF0dGvCIOsihT6/tmEvJOSyK4ZM0dL/TEFffUsWfNHpA7tCnZz0rHY
 ExaPG8VC8y1PjnbyfB7XnWAEIz4TkImhBHb4IKjMRMm8ZZyEgTKXoArnZPj6QGAkVIJH0H
 IIshDWowrJo0o6E4Qj4bAE+bmOu0ZLKHwPfybuNEM2HA+rXIqVe0nSF01e2O8xQnIXYSkv
 37ShdxkQoV3IIJRYSlJ66AmfcAlGv0A+JgYl2xlCzlQlSXQ238ykgpGR+RUAst5M9VW6tH
 9rvsThszzjgCcqgxGhPD+tl7fpmY+TlomeJ0GcyyTukkii93hp4ksi0OVYd1tg==
Date: Mon, 15 Sep 2025 17:58:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Chaoyi Chen
 <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 7/9] drm/bridge: remove drm_for_each_bridge_in_chain()
Message-ID: <20250915175805.6e8df6ef@booty>
In-Reply-To: <20250915-optimal-hornet-of-potency-efa54a@penduick>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
 <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-7-edb6ee81edf1@bootlin.com>
 <20250915-optimal-hornet-of-potency-efa54a@penduick>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon, 15 Sep 2025 14:22:24 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Fri, Aug 08, 2025 at 04:49:14PM +0200, Luca Ceresoli wrote:
> > All users have been replaced by drm_for_each_bridge_in_chain_scoped().
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  .clang-format            |  1 -
> >  include/drm/drm_bridge.h | 14 --------------
> >  2 files changed, 15 deletions(-)
> > 
> > diff --git a/.clang-format b/.clang-format
> > index 1cac7d4976644c8f083f801e98f619782c2e23cc..d5c05db1a0d96476b711b95912d2b82b2e780397 100644
> > --- a/.clang-format
> > +++ b/.clang-format
> > @@ -167,7 +167,6 @@ ForEachMacros:
> >    - 'drm_connector_for_each_possible_encoder'
> >    - 'drm_exec_for_each_locked_object'
> >    - 'drm_exec_for_each_locked_object_reverse'
> > -  - 'drm_for_each_bridge_in_chain'
> >    - 'drm_for_each_bridge_in_chain_scoped'
> >    - 'drm_for_each_connector_iter'
> >    - 'drm_for_each_crtc'
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index a8e2f599aea764c705da3582df0ca428bb32f19c..6adf9221c2d462ec8e0e4e281c97b39081b3da24 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -1358,20 +1358,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
> >  						       struct drm_bridge, chain_node));
> >  }
> >  
> > -/**
> > - * drm_for_each_bridge_in_chain() - Iterate over all bridges present in a chain
> > - * @encoder: the encoder to iterate bridges on
> > - * @bridge: a bridge pointer updated to point to the current bridge at each
> > - *	    iteration
> > - *
> > - * Iterate over all bridges present in the bridge chain attached to @encoder.
> > - *
> > - * This is deprecated, do not use!
> > - * New drivers shall use drm_for_each_bridge_in_chain_scoped().
> > - */
> > -#define drm_for_each_bridge_in_chain(encoder, bridge)			\
> > -	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
> > -  
> 
> I think I'd go a step further and rename
> drm_for_each_bridge_in_chain_scoped to drm_for_each_bridge_in_chain,
> there's no need to have a "scoped" variant if it's our only variant.
> 
> It can be done in a subsequent patch though.

Sure, that's the plan. There's a note in patch 3:

Note 1: drm_for_each_bridge_in_chain_scoped() could be renamed removing the
        _scoped suffix after removing all the users of the current macro
        and eventually the current macro itself. Even though this series is
        converting all users, I'd at least wait one kernel release before
        renaming, to minimize issues with existing patches which would fail
        building.

> For the entire series:
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Great, thanks!

I'll wait a few more days before applying.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
