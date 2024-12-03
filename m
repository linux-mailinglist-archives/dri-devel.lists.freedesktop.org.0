Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5249E1EAF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6B110E47B;
	Tue,  3 Dec 2024 14:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqk4wOMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EFD10E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733234912; x=1764770912;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=1vgb5I+p4PfXVR7FHAsBlaVB6byxIXF25/TD0XAhlNw=;
 b=mqk4wOMll3L9pGr415K5j7Ug6YsVLl8SixyyOiuFM83fuRmqkczHkXuT
 TdGHzCj/BN4J7cy6z5vNSU63KrPktkR7BRIY9MYBJvqDJiTf1dpxwe4hE
 k3fTuHCToJHLH7jRX9TSYzm2yd/WeCwbTfHCIXvxAJF0i1TlPzG+I42YS
 GLLH+7KNPPzlBHXy3VENvO9VxmSVSx4y5u9mj7yiEVFf3oUSMgBaE1Uz2
 ukTED9WbUBznlPsh8ltO9qCLMNVvhAGlDFDr55rhbflLitc8k/AhORiju
 3UvNsG/nHuGo+JcXQwW2e4bpj0T1kP7sPzoVJYwznTgzMqv+T5aygzecB g==;
X-CSE-ConnectionGUID: 64xycd2ERnmuozDAnduM8g==
X-CSE-MsgGUID: kwdbWRRATUGhn2WEAF7Rmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37384875"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37384875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:08:31 -0800
X-CSE-ConnectionGUID: OWm9m21qQL6Za5ni7Y/Hiw==
X-CSE-MsgGUID: NEHMPwSWROOzM+6RvEul9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="94278786"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:08:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, Caleb Connolly
 <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
In-Reply-To: <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com> <87y10x3u0x.fsf@intel.com>
 <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com>
Date: Tue, 03 Dec 2024 16:08:23 +0200
Message-ID: <87ed2o506g.fsf@intel.com>
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

On Tue, 03 Dec 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> On 03/12/2024 12:06, Jani Nikula wrote:
>> On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> Move the color conversions, blit and fill functions to drm_draw.c,
>>> so that they can be re-used by drm_log.
>>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>>> gpu drivers.
>> 
>> I started looking at this in patch 2:
>> 
>>> +#include "../drm_draw.h"
>> 
>> I think we should avoid #includes with ../ like this.
>
> Sure, I've added it in v8, after the clients moved to drm/clients/, but 
> I didn't think much about it.
>
>> 
>> Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
>> needs to add subdir-ccflags-y += -I$(src)/.. or something like that?
>> 
>> If it's supposed to be internal, I guess the latter, but then the
>> current convention is to have _internal.h suffix. All drm headers under
>> drivers/ have that.
>
> ok, I can rename drm_draw.h to drm_draw_internal.h, and add the include 
> in the Makefile.
>> 
>> Is this the first drm subsystem internal thing that's a separate module?
>> Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
>> being internal?
>
> It's not really a separate module, as it's built in the core drm module. 
> (the reason is that it's used by drm_panic too, which must be in the 
> core drm module).

Right, sorry, I got confused and looked at this the other way round.

drm_draw is part of drm.ko, drm log is part of drm_client_lib.ko, and
uses drm_draw, right?

So is drm_draw really internal if drm client uses it?

I don't really deeply care either way, but it bugs me when it's
somewhere in between. :)

Either include/drm/drm_draw.h or drivers/gpu/drm/drm_draw_internal.h,
the latter *possibly* with symbol namespace, but not a big deal.


BR,
Jani.


>
> I don't know much about symbol namespace, but I can add that if needed.
>
> Best regards,

-- 
Jani Nikula, Intel
