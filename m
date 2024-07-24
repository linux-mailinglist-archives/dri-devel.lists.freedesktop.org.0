Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4A93B312
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DC089F38;
	Wed, 24 Jul 2024 14:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wf9jxroh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A50989F38
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721832662; x=1753368662;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bjLDQzZfw4xW/reuySijNClaossK1D/OHY9Pjl913No=;
 b=Wf9jxrohphuzNVwhKZrsJZdcmQdr5Vsv964002ef7rxvFCV98+2CJXqw
 gQOrauVuBnZLHQuXzf+CYZRVOSn4nqmU71hWYHXgyx/W8c3S/UUsRRa/k
 w0ClLL6FJgmom/RL4n6JAJzrejp8RnXknL8+H9ZOpzi8CCz7MPX9zQa/o
 iEFRdM7Jw2sdOWXD1zf+OdVPJFZfo7LOZEjAtMw/r6db6tKPZLUAAvMvF
 PdCsS1M3LbY5KHXEYUmG2V+5v/1f7bIeeL0MuQV+lHyg89AmlcUvOB2sy
 M8RMyzI9yQ/gk7jqfHwmyISxGhhe/hvAWamuIAu2rKh/ZJ6tWzMbNWFLD w==;
X-CSE-ConnectionGUID: iWigbrWBS+mYwxvv8wCFNQ==
X-CSE-MsgGUID: vLmHnNa5R0uTzvbzmshthQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19653042"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19653042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:51:01 -0700
X-CSE-ConnectionGUID: oYO7cn40Q9y3SmfvsC+BEg==
X-CSE-MsgGUID: lCg1yNbCQ5uQghJ7uOOqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83218555"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:50:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 make24@iscas.ac.cn, mripard@kernel.org, noralf@tronnes.org,
 sam@ravnborg.org, stable@vger.kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/client: fix null pointer dereference in
 drm_client_modeset_probe
In-Reply-To: <20240724105535.1524294-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87ikwvf6ol.fsf@intel.com>
 <20240724105535.1524294-1-make24@iscas.ac.cn>
Date: Wed, 24 Jul 2024 17:50:52 +0300
Message-ID: <87jzhakfn7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 24 Jul 2024, Ma Ke <make24@iscas.ac.cn> wrote:
> On Wed, 24 Jul 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Wed, 24 Jul 2024, Ma Ke <make24@iscas.ac.cn> wrote:
>> > In drm_client_modeset_probe(), the return value of drm_mode_duplicate() is
>> > assigned to modeset->mode, which will lead to a possible NULL pointer
>> > dereference on failure of drm_mode_duplicate(). Add a check to avoid npd.
>> >
>> > Cc: stable@vger.kernel.org
>> > Fixes: cf13909aee05 ("drm/fb-helper: Move out modeset config code")
>> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>> > ---
>> > Changes in v3:
>> > - modified patch as suggestions, returned error directly when failing to 
>> > get modeset->mode.
>> 
>> This is not what I suggested, and you can't just return here either.
>> 
>> BR,
>> Jani.
>> 
>
> I have carefully read through your comments. Based on your comments on the 
> patchs I submitted, I am uncertain about the appropriate course of action 
> following the return value check(whether to continue or to return directly,
> as both are common approaches in dealing with function drm_mode_duplicate()
> in Linux kernel, and such handling has received 'acked-by' in similar 
> vulnerabilities). Could you provide some advice on this matter? Certainly, 
> adding a return value check is essential, the reasons for which have been 
> detailed in the vulnerability description. I am looking forward to your 
> guidance and response. Thank you!

Everything depends on the context. You can't just go ahead and do the
same thing everywhere. If you handle errors, even the highly unlikely
ones such as this one, you better do it properly.

If you continue here, you'll still leave modeset->mode NULL. And you
don't propagate the error. Something else is going to hit the issue
soon.

If you return directly, you'll leave holding a few locks, and leaking
memory.

There's already some error handling in the function, in the same loop
even. Set ret = -ENOMEM and break.

(However, you could still argue there's an existing problem in the error
handling in that all modeset->connectors aren't put and cleaned up.)


BR,
Jani.







>
> Best regards,
>
> Ma Ke
>
>> 
>> > Changes in v2:
>> > - added the recipient's email address, due to the prolonged absence of a 
>> > response from the recipients.
>> > - added Cc stable.
>> > ---
>> >  drivers/gpu/drm/drm_client_modeset.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> > index 31af5cf37a09..750b8dce0f90 100644
>> > --- a/drivers/gpu/drm/drm_client_modeset.c
>> > +++ b/drivers/gpu/drm/drm_client_modeset.c
>> > @@ -880,6 +880,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>> >  
>> >  			kfree(modeset->mode);
>> >  			modeset->mode = drm_mode_duplicate(dev, mode);
>> > +			if (!modeset->mode)
>> > +				return 0;
>> > +
>> >  			drm_connector_get(connector);
>> >  			modeset->connectors[modeset->num_connectors++] = connector;
>> >  			modeset->x = offset->x;
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
