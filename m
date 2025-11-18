Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68DCC6A216
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D00A10E4DC;
	Tue, 18 Nov 2025 14:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K78lDah+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B9810E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:54:51 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C79151F37;
 Tue, 18 Nov 2025 15:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763477565;
 bh=rEndykavR1Bp2pXcKE17ceSr8fqk5mM+fNBsJMMcawU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K78lDah+uRDlZyjWdeOgv9XNEWH2w5dEmpryIyvzRPwCu1CYPJoiK3F2d19S+eHdW
 +5wcdzHRJitwZ1aHSF3qHBr5tusfFJbIscY4IshFXhvdVCBweRZUuQk4ceFi+RYBae
 8JnesU7Jm4Oo+7p/yqaS85+EW6rTlHVB2GgzQTUo=
Message-ID: <bbc06806-7316-41f0-a3b6-e64c3c9ca473@ideasonboard.com>
Date: Tue, 18 Nov 2025 16:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/atomic-helper: rcar-du: Enable CRTC early on
 R-Car DU
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-1-4fedf10b18f6@linaro.org>
 <20251118145051.GB22495@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251118145051.GB22495@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 18/11/2025 16:50, Laurent Pinchart wrote:
> Hi Linus, Marek,
> 
> Thank you for the patch.
> 
> On Tue, Nov 18, 2025 at 03:36:03PM +0100, Linus Walleij wrote:
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Introduce a variant of drm_atomic_helper_commit_modeset_enables()
>> which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> where the CRTC provides clock to LVDS and DSI, and has to be started
>> before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>>
>> This specifically fixes the case where ILI9881C is connected to R-Car
>> DU DSI. The ILI9881C panel driver does DSI command transfer in its
>> struct drm_panel_funcs .prepare function, which is currently called
>> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
>> and the DSI command transfer times out.
>>
>> Fix this by restoring the enable ordering introduced in commit
>> c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
>> and post-disable"), to enable CRTC early.
> 
> This will need to be tested on Gen3 and Gen4 hardware, with different
> types of output in addition to DSI. Unfortunately you're catching me at
> a bad time as I'm about to board a plane and won't have access to test
> hardware for a month :-/ We'll need volunteers.

I can do some tests on my whitehawk. But I'm not too worried, this is
just restoring the order we had earlier.

 Tomi

>> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>>  drivers/gpu/drm/drm_atomic_helper.c           | 24 ++++++++++++++++++++++++
>>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>>  include/drm/drm_atomic_helper.h               |  2 ++
>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index d5ebe6ea0acb..f03b93c72b8f 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>  }
>>  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
>>  
>> +/**
>> + * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
>> + * @dev: DRM device
>> + * @state: atomic state object being committed
>> + *
>> + * This function is a variant of drm_atomic_helper_commit_modeset_enables()
>> + * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
>> + * where the CRTC provides clock to LVDS and DSI, and has to be started
>> + * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
>> + */
>> +void
>> +drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
>> +						    struct drm_atomic_state *state)
>> +{
>> +	crtc_enable(dev, state);
>> +
>> +	encoder_bridge_pre_enable(dev, state);
>> +
>> +	encoder_bridge_enable(dev, state);
>> +
>> +	drm_atomic_helper_commit_writebacks(dev, state);
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
>> +
>>  /*
>>   * For atomic updates which touch just a single CRTC, calculate the time of the
>>   * next vblank, and inform all the fences of the deadline.
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> index 216219accfd9..b2403be4436b 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
>> @@ -544,7 +544,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>  	drm_atomic_helper_commit_planes(dev, old_state,
>>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
>>  
>>  	drm_atomic_helper_commit_hw_done(old_state);
>>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
>> index 53382fe93537..d7fb473db343 100644
>> --- a/include/drm/drm_atomic_helper.h
>> +++ b/include/drm/drm_atomic_helper.h
>> @@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
>>  					       struct drm_atomic_state *state);
>>  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>  					  struct drm_atomic_state *old_state);
>> +void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
>> +							 struct drm_atomic_state *old_state);
>>  
>>  int drm_atomic_helper_prepare_planes(struct drm_device *dev,
>>  				     struct drm_atomic_state *state);
> 

