Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06376645DA3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DCC10E3D1;
	Wed,  7 Dec 2022 15:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 660C010E3CF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:30:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57BCBFEC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 07:30:06 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60EF73F73B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 07:29:59 -0800 (PST)
Date: Wed, 7 Dec 2022 15:29:48 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm: mali-dp: Add check for kzalloc
Message-ID: <Y5CxbDENPVbyqM6C@e110455-lin.cambridge.arm.com>
References: <20221207092118.20603-1-jiasheng@iscas.ac.cn>
 <17efaae0-9b6c-86ea-5fec-568d024d229f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17efaae0-9b6c-86ea-5fec-568d024d229f@arm.com>
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 07, 2022 at 01:59:04PM +0000, Robin Murphy wrote:
> On 2022-12-07 09:21, Jiasheng Jiang wrote:
> > As kzalloc may fail and return NULL pointer, it should be better to check
> > the return value in order to avoid the NULL pointer dereference in
> > __drm_atomic_helper_connector_reset.
> 
> This commit message is nonsense; if __drm_atomic_helper_connector_reset()
> would dereference the NULL implied by &mw_state->base, it would equally
> still dereference the explicit NULL pointer passed after this patch.

Where?

> 
> The current code works out OK because "base" is the first member of struct
> malidp_mw_connector_state, thus if mw_state is NULL then &mw_state->base ==
> NULL + 0 == NULL. Now you *could* argue that this isn't robust if the layout
> of struct malidp_mw_connector_state ever changes, and that could be a valid
> justification for making this change, but the reason given certainly isn't.

I appreciate the input and I agree with your analysis, however I don't have the same
confidence that compilers will always do the NULL + 0 math to get address of base.
Would this always work when you have authenticated pointers or is the compiler going
to generate some plumbing code that checks the pointer before doing the math?

> 
> Arithmetic on a (potentially) NULL pointer may well be a sign that it's
> worth a closer look to check whether it really is what the code intended to
> do, but don't automatically assume it has to be a bug. Otherwise, good luck
> with "fixing" every user of container_of() throughout the entire kernel.

My understanding is that you're supposed to use container_of() only when you're sure
that your pointer is valid. container_of_safe() seems to be the one to use when you
don't care about NULL pointers.

Best regards,
Liviu

> 
> Thanks,
> Robin.
> 
> > Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
> > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > ---
> >   drivers/gpu/drm/arm/malidp_mw.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> > index ef76d0e6ee2f..fe4474c2ddcf 100644
> > --- a/drivers/gpu/drm/arm/malidp_mw.c
> > +++ b/drivers/gpu/drm/arm/malidp_mw.c
> > @@ -72,7 +72,11 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
> >   		__drm_atomic_helper_connector_destroy_state(connector->state);
> >   	kfree(connector->state);
> > -	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> > +
> > +	if (mw_state)
> > +		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> > +	else
> > +		__drm_atomic_helper_connector_reset(connector, NULL);
> >   }
> >   static enum drm_connector_status

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
