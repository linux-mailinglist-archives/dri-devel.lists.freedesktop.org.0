Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A60B40DDC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4210E826;
	Tue,  2 Sep 2025 19:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SwiRAFAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63810E826
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:26:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57780C6D;
 Tue,  2 Sep 2025 21:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756841149;
 bh=J8LNkrfiezQAqyBhHhwpLFw/dcn1bpXtzNnUel98Hlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwiRAFAqrRavxtKZfgs+MeQA6mcZb+d591ZHk8oEJeDNKyKKrbLcXbUFzaU53/AUc
 dEqpB8dA0EBUbSYy8iQDX1cCx/SLYltqFKeBz9FjqRzyukRGdhKEuhY2Gb3P/6YB4u
 l/ikem4dofLn5S0Kl3cGZScngwMw+M/oqmgLUFW4=
Date: Tue, 2 Sep 2025 21:26:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/29] drm/atomic: Fix unused but set warning in
 for_each_old_private_obj_in_state
Message-ID: <20250902192636.GR13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-3-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-3-14ad5315da3f@kernel.org>
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

Thank you for the patch.

On Tue, Sep 02, 2025 at 10:32:31AM +0200, Maxime Ripard wrote:
> The for_each_old_private_obj_in_state() macro triggers a compiler
> warning if the obj parameter passed to it isn't used in the code block.
> 
> Add a similar workaround than in most other macros.
> 

I'd squash this with the previous patch, and also address the other
similar macros.

> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 689a29bdeb4a06672ab6fffecb513d58ff6e07f9..f13f926d21047e42bb9ac692c2dd4b88f2ebd91c 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1112,10 +1112,11 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>   */
>  #define for_each_old_private_obj_in_state(__state, obj, old_obj_state, __i) \
>  	for ((__i) = 0; \
>  	     (__i) < (__state)->num_private_objs && \
>  		     ((obj) = (__state)->private_objs[__i].ptr, \
> +		      (void)(obj) /* Only to avoid unused-but-set-variable warning */, \
>  		      (old_obj_state) = (__state)->private_objs[__i].old_state, 1); \
>  	     (__i)++)
>  
>  /**
>   * for_each_new_private_obj_in_state - iterate over all private objects in an atomic update

-- 
Regards,

Laurent Pinchart
