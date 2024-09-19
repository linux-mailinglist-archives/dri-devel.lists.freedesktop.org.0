Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B297C4F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 09:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571E10E298;
	Thu, 19 Sep 2024 07:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuPMC8CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5610E248;
 Thu, 19 Sep 2024 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726731547; x=1758267547;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ODfC33vkjl5Yf6RGMiXR8bjuCMGJIUiedUkP2D7i3tI=;
 b=JuPMC8CLrDcrCRv9PYvxa5ra0pPsXQEcDMQsKbuhNStDeA6/pDImJCM2
 4CGB6UcQtnik8OLjoX/beB/3uy3Pn+oaRimSaW1aAyF+K0/GlAGzynW7x
 E/Nchz9UP+7ZAfvsZqms64yPYNUjNiUos3snBVdW2GB6j4GeczGDmedZx
 n9qOAE3B7jzsgsREjyLjoBycEbqP8Z+HXubVlMe5fDsJnYVD8Kw9Cv2E7
 Ce1dbhXj7w1kaXJWjuqwDy8QW3mEDtR4vw2dZi/TtovFOh3lRv+/aFnZY
 ONwf+EjZIIeEmdxAJtMH0yE7az1SlFh5Ljwfnj3DLO8OW0PvND93LIqi6 A==;
X-CSE-ConnectionGUID: S7AShmV3S0SpvoNsPlU32Q==
X-CSE-MsgGUID: u5fRRtNzS1qe9CCk0KI5zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25554594"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25554594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:39:06 -0700
X-CSE-ConnectionGUID: g7zlNAHdSMyGpSTokrPW0A==
X-CSE-MsgGUID: WxeJA5U5R1mOlkfqAp37cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74636348"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:38:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
In-Reply-To: <ZuujCuVxFnOAKdgR@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com> <87msk6d8jw.fsf@intel.com>
 <ZuujCuVxFnOAKdgR@black.fi.intel.com>
Date: Thu, 19 Sep 2024 10:38:51 +0300
Message-ID: <87r09g9jp0.fsf@intel.com>
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

On Thu, 19 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> On Tue, Sep 17, 2024 at 10:49:07AM +0300, Jani Nikula wrote:
>> On Tue, 17 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
>> > Now that we have device wedged event in place, add wedge_recovery sysfs
>> > attribute which will expose recovery methods supported by the DRM device.
>> > This is useful for userspace consumers in cases where the device supports
>> > multiple recovery methods which can be used as fallbacks.
>> >
>> > $ cat /sys/class/drm/card0/wedge_recovery
>> > rebind
>> > bus-reset
>> > reboot
>> >
>> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> > ---
>> >  drivers/gpu/drm/drm_sysfs.c | 23 +++++++++++++++++++++++
>> >  1 file changed, 23 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> > index fb3bbb6adcd1..b88cdbfa3b5e 100644
>> > --- a/drivers/gpu/drm/drm_sysfs.c
>> > +++ b/drivers/gpu/drm/drm_sysfs.c
>> > @@ -36,6 +36,8 @@
>> >  #define to_drm_minor(d) dev_get_drvdata(d)
>> >  #define to_drm_connector(d) dev_get_drvdata(d)
>> >  
>> > +extern const char *const wedge_recovery_opts[];
>> 
>> Data is not an interface. Please add a function for this.
>
> For a single user?

Yes.

Well, you kind of have two, and both places need to do bounds checking
on indexing the array. You also need to do bounds checking on the string
manipulation, you can't just strcat and assume it'll be all right.

BR,
Jani.


>
>> Side note, extern declarations for outside stuff don't belong in .c
>> files anyway.
>
> Sure.
>
> Raag

-- 
Jani Nikula, Intel
