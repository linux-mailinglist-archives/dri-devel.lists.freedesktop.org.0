Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E179EB40DE0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136DE10E825;
	Tue,  2 Sep 2025 19:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bkYeAaTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3F10E825
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:30:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 469148BF;
 Tue,  2 Sep 2025 21:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756841333;
 bh=uubYWsLB8sHbJ6sg4su53nUp1k3XLRTGP2lt3u71QCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkYeAaTg/SyaEP1d9BCrHM0cdmikJ7k+Tvc3/DVxY3o8lNkxczQYu6ItqIGnlcdUw
 bSFDZtIKmWtvsanhO8wJQbJPxlt0ewK/T6YBI4jy5/9MbXbXgPYdje6WlOSi2CeZCa
 RI/BLA6BMZVPZXZU0br31o3NqDV994r5cAGXuXLQ=
Date: Tue, 2 Sep 2025 21:29:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/29] drm/atomic_helper: Skip over NULL private_obj
 pointers
Message-ID: <20250902192940.GS13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-4-14ad5315da3f@kernel.org>
 <adba0c39-228b-4311-83d1-09aa71ddb911@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adba0c39-228b-4311-83d1-09aa71ddb911@suse.de>
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

On Tue, Sep 02, 2025 at 03:13:30PM +0200, Thomas Zimmermann wrote:
> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> However, can this happen? Private state objects without state data?

I was going to ask the same. The commit message should explain why.

> > ---
> >   drivers/gpu/drm/drm_atomic.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index b356d26faad4acaa25c1fe6f9bd5043b6364ce87..9b198610791d19c7fd276ca59264a961d21caf43 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -295,10 +295,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
> >   	}
> >   
> >   	for (i = 0; i < state->num_private_objs; i++) {
> >   		struct drm_private_obj *obj = state->private_objs[i].ptr;
> >   
> > +		if (!obj)
> > +			continue;
> > +
> >   		obj->funcs->atomic_destroy_state(obj,
> >   						 state->private_objs[i].state);
> >   		state->private_objs[i].ptr = NULL;
> >   		state->private_objs[i].state = NULL;
> >   		state->private_objs[i].old_state = NULL;

-- 
Regards,

Laurent Pinchart
