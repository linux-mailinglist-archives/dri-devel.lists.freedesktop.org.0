Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAF7BA9962
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C0310E1AE;
	Mon, 29 Sep 2025 14:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VPxxUDtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDF10E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:31:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5AA57C8F1EA;
 Mon, 29 Sep 2025 14:31:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC77D606AE;
 Mon, 29 Sep 2025 14:31:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F3B4102F16F4; 
 Mon, 29 Sep 2025 16:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759156300; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xjTOCvFdY4AQNlquU9JgemAA95m0AG2lPPK+gJ1mSgQ=;
 b=VPxxUDtl11bkw/rkUE/A+VjJ0kUI6xgmqsZYhopAaSOFiSx0IOViaggmVpfg/VjmCJEfdk
 udZKT9ZsvEaI1h1dPA4wcmvUzxxca2ElIpCkRgrLbAl0Q6q0ZcVGzDg8huD9/dFkpgLMhb
 SCwLHgLxn8CtRcRzu2KFP04l2OqbW4fT1Fu0XebVQay8PYoXCQZNf7qrzMlbeqAvpTKn6h
 1z2QjkJ6rv6uiTcHJoAg6b+QLLIv2vHCuatdu6nQ4Igau/RxwLTz5hL0gnVB2A6eHFYjom
 zAJApIqQNovmcYsTDCfuhajAvFxGJpJd6rHfuee0i851gMT5+uUuEHaaj3Av9A==
Date: Mon, 29 Sep 2025 16:31:27 +0200
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
Message-ID: <20250929163127.5ad20e05@booty>
In-Reply-To: <20250929-flat-koel-from-nibiru-665d49@houat>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
 <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-2-23b62c47356a@bootlin.com>
 <20250929-flat-koel-from-nibiru-665d49@houat>
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

Hi Maxime,

On Mon, 29 Sep 2025 14:45:10 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Sep 26, 2025 at 05:59:43PM +0200, Luca Ceresoli wrote:
> > drm_encoder_cleanup() modifies the encoder chain by removing bridges via
> > drm_bridge_detach(). Protect this whole operation by taking the mutex, so
> > any users iterating over the chain will not access it during the change.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 3261f142baea30c516499d23dbf8d0acf5952cd6..3a04bedf9b759acd6826864b7f2cc9b861a8f170 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -195,9 +195,11 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  	 * the indices on the drm_encoder after us in the encoder_list.
> >  	 */
> >  
> > +	mutex_lock(&encoder->bridge_chain_mutex);
> >  	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
> >  				 chain_node)
> >  		drm_bridge_detach(bridge);
> > +	mutex_unlock(&encoder->bridge_chain_mutex);  
> 
> You were claiming that the mutex was to prevent issues with concurrent
> iteration and removal of the list members. list_for_each_entry_safe() is
> explicitly made to protect against that. Why do we need both?

You're right saying we don't need both. With a mutex preventing the list
from any change, we can actually simpify code a bit to use the non-safe
list macro:

-	struct drm_bridge *bridge, *next;
+	struct drm_bridge *bridge;
...
+	mutex_lock(&encoder->bridge_chain_mutex);
- 	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
+ 	list_for_each_entry(bridge, &encoder->bridge_chain,
 				 chain_node)
 		drm_bridge_detach(bridge);
+	mutex_unlock(&encoder->bridge_chain_mutex);
 
But it's not fully correct that list_for_each_entry_safe() protects
against concurrent removal. As I see it, all the _safe variants of
list_for_each*() macros protect against one specific and frequent use
case:

	list_for_each_entry_safe(curs, n, some_list, membername) {
		...
		list_del(&curs->membername);
		...
	}

So the _safe variant protect from removing the element at the current
iteration (*curs). It does so by taking the following element pointer in
advance, in the auxiliary variable @n. But _concurrent_ removal (the
topic of this series) means the element being removed could just be the
following one.

Consider this sequence:

 1. start loop: list_for_each_entry_safe() sets;
    pos = list_first_entry()   = <bridge 1>
    n   = list_next_entry(pos) = <bridge 2>
 2. enter the loop 1st time, do something with *pos (bridge 1)
 3. in the meanwhile bridge 2 is hot-unplugged
    -> another thread removes item 2 -> drm_bridge_detach()
    -> list_del() sets bridge->next = LIST_POISON1
 4. loop iteration 1 finishes, list_for_each_entry_safe() sets:
    pos = n (previously set to bridge 2)
    n   = (bridge 2)->next = LIST_POISON1
 5. enter the loop 2nd time, do something with *pos (bridge 2)
 6. loop iteration 2 finishes, list_for_each_entry_safe() sets:
    pos = n (previously set to LIST_POISON1) -> bug

Do you think this explains the need for this series?

If it does, I should probably add this to the cover letter and maybe
patch 1.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
