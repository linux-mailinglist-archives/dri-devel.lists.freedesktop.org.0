Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A87BB6747
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66710E052;
	Fri,  3 Oct 2025 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jG3/hduE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039AA10E052
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:37:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7BD451A10C7;
 Fri,  3 Oct 2025 10:37:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4F94A60683;
 Fri,  3 Oct 2025 10:37:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 813A3102F1C34; 
 Fri,  3 Oct 2025 12:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759487863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=75kSkB+I0miD0Bb2kpYkx4XA1f7qcppabY+aameF1eg=;
 b=jG3/hduEKrBJx342BIErz7wfjcwkgWsRRLxhKIW06dedGvedo0jbihWtMeAzEKeBiFrgtQ
 Zc+6ujqgTJlryila/su5k6/+9Ak3Eu/kVk9WE+6edx0yKwasLiiLb6EK/aeexs+J0Ughng
 SEoKMqFLYo4ypvyf31LcvBbdzf4GUf7BjwFdEUmayx9TKE+ERicG+dOra6wnyivT85cixr
 XKx9d/z0HVZej2f9lg6rUgvP22SeR2Y5LHqOLYq6vnFePSWmh2kQVpLl3li6l/ObpbJ5dh
 8NlqY/atQLrS3uwGp74x7bI8q28UU9rPj5bEA8CHPnrkb29XmTPpn3L9WgjPbw==
Date: Fri, 3 Oct 2025 12:37:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/encoder: drm_encoder_cleanup: take chain mutex
 while tearing down
Message-ID: <20251003123726.4bf38c76@booty>
In-Reply-To: <20250929163127.5ad20e05@booty>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-2-23b62c47356a@bootlin.com>
 <20250929-flat-koel-from-nibiru-665d49@houat>
 <20250929163127.5ad20e05@booty>
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

Hello,

On Mon, 29 Sep 2025 16:31:27 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > > --- a/drivers/gpu/drm/drm_encoder.c
> > > +++ b/drivers/gpu/drm/drm_encoder.c
> > > @@ -195,9 +195,11 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> > >  	 * the indices on the drm_encoder after us in the encoder_list.
> > >  	 */
> > >  
> > > +	mutex_lock(&encoder->bridge_chain_mutex);
> > >  	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
> > >  				 chain_node)
> > >  		drm_bridge_detach(bridge);
> > > +	mutex_unlock(&encoder->bridge_chain_mutex);    
> > 
> > You were claiming that the mutex was to prevent issues with concurrent
> > iteration and removal of the list members. list_for_each_entry_safe() is
> > explicitly made to protect against that. Why do we need both?  
> 
> You're right saying we don't need both. With a mutex preventing the list
> from any change, we can actually simpify code a bit to use the non-safe
> list macro:
> 
> -	struct drm_bridge *bridge, *next;
> +	struct drm_bridge *bridge;
> ...
> +	mutex_lock(&encoder->bridge_chain_mutex);
> - 	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
> + 	list_for_each_entry(bridge, &encoder->bridge_chain,
>  				 chain_node)
>  		drm_bridge_detach(bridge);
> +	mutex_unlock(&encoder->bridge_chain_mutex);

After looking at it better I realized the _safe variant here is still
needed as the current loop entry is removed inside the loop. The
non-safe version, at the end of the first iteration, would look for the
next element in the now-removed list_head, thus being derailed.

v2 on its way with this taken into account along with the other
discussed items.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
