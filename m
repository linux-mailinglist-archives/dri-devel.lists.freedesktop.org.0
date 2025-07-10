Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7151B00E15
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 23:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63F10E247;
	Thu, 10 Jul 2025 21:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8VnRS58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BB910E247;
 Thu, 10 Jul 2025 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752183990; x=1783719990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SkSh0wetm6VUD4XNZb2orp97nsNb8X/EJNSXd+YEpiQ=;
 b=L8VnRS58C5bBo+J3G71AEqP897vBzXelkd3j/hRzxUEPxnyzBIz9b7l/
 C3R9scMmQ2o4zgsJf2yLDLbS8QB8tJdXs3FHDyGywDsbk5DN9txxiRMUd
 cb0bmxIRuSFqvuGfWbPeK5SEcUhpI14F8q+7lrTMiQi1BRB6+KCc0fSjc
 KFN1i2pR+2Q3E/F5rH4ujGUt61HtYVzbX03TEvq5sPnEbV4hoWRjhO6Kj
 dilaRKflAISwmNzVMDGqH6DIEyRsfOhYmuMxEF1OxxeaYdJJ6FShWbcpG
 AMBHpJ2wVTQnBuPbCq+hiJiH5cl1QmjP07t9wMQ88dwpoes3EbK1GKewq Q==;
X-CSE-ConnectionGUID: /66cHZ67Q66XS2MhOZYBBA==
X-CSE-MsgGUID: ddm5/BlmSjyTxJfjVuPeKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="72060178"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="72060178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:46:26 -0700
X-CSE-ConnectionGUID: MSuuHwTRTZq3KRiiTiG+Sg==
X-CSE-MsgGUID: WWgD+5URQ+Wo2WQ8PZvIIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156547075"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:46:22 -0700
Date: Fri, 11 Jul 2025 00:46:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aHA0qzCZH-gWCfOD@black.fi.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
 <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
 <aG-U9JTXDah_tu1U@black.fi.intel.com> <aHANtkxkhI4_Nb6R@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHANtkxkhI4_Nb6R@intel.com>
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

On Thu, Jul 10, 2025 at 03:00:06PM -0400, Rodrigo Vivi wrote:
> On Thu, Jul 10, 2025 at 01:24:52PM +0300, Raag Jadav wrote:
> > On Thu, Jul 10, 2025 at 11:37:14AM +0200, Christian König wrote:
> > > On 10.07.25 11:01, Simona Vetter wrote:
> > > > On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
> > > >> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
> > > >>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> > > >>>> On 09.07.25 15:41, Simona Vetter wrote:
> > > >>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> > > >>>>>> Certain errors can cause the device to be wedged and may
> > > >>>>>> require a vendor specific recovery method to restore normal
> > > >>>>>> operation.
> > > >>>>>>
> > > >>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> > > >>>>>> must provide additional recovery documentation if this method
> > > >>>>>> is used.
> > > >>>>>>
> > > >>>>>> v2: fix documentation (Raag)
> > > >>>>>>
> > > >>>>>> Cc: André Almeida <andrealmeid@igalia.com>
> > > >>>>>> Cc: Christian König <christian.koenig@amd.com>
> > > >>>>>> Cc: David Airlie <airlied@gmail.com>
> > > >>>>>> Cc: <dri-devel@lists.freedesktop.org>
> > > >>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > > >>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > >>>>>
> > > >>>>> I'm not really understanding what this is useful for, maybe concrete
> > > >>>>> example in the form of driver code that uses this, and some tool or
> > > >>>>> documentation steps that should be taken for recovery?
> > > >>
> > > >> The case here is when FW underneath identified something badly corrupted on
> > > >> FW land and decided that only a firmware-flashing could solve the day and
> > > >> raise interrupt to the driver. At that point we want to wedge, but immediately
> > > >> hint the admin the recommended action.
> > > >>
> > > >>>>
> > > >>>> The recovery method for this particular case is to flash in a new firmware.
> > > >>>>
> > > >>>>> The issues I'm seeing here is that eventually we'll get different
> > > >>>>> vendor-specific recovery steps, and maybe even on the same device, and
> > > >>>>> that leads us to an enumeration issue. Since it's just a string and an
> > > >>>>> enum I think it'd be better to just allocate a new one every time there's
> > > >>>>> a new strange recovery method instead of this opaque approach.
> > > >>>>
> > > >>>> That is exactly the opposite of what we discussed so far.
> > > > 
> > > > Sorry, I missed that context.
> > > > 
> > > >>>> The original idea was to add a firmware-flush recovery method which
> > > >>>> looked a bit wage since it didn't give any information on what to do
> > > >>>> exactly.
> > > >>>>
> > > >>>> That's why I suggested to add a more generic vendor-specific event
> > > >>>> with refers to the documentation and system log to see what actually
> > > >>>> needs to be done.
> > > >>>>
> > > >>>> Otherwise we would end up with events like firmware-flash, update FW
> > > >>>> image A, update FW image B, FW version mismatch etc....
> > > > 
> > > > Yeah, that's kinda what I expect to happen, and we have enough numbers for
> > > > this all to not be an issue.
> > > > 
> > > >>> Agree. Any newly allocated method that is specific to a vendor is going to
> > > >>> be opaque anyway, since it can't be generic for all drivers. This just helps
> > > >>> reduce the noise in DRM core.
> > > >>>
> > > >>> And yes, there could be different vendor-specific cases for the same driver
> > > >>> and the driver should be able to provide the means to distinguish between
> > > >>> them.
> > > >>
> > > >> Sim, what's your take on this then?
> > > >>
> > > >> Should we get back to the original idea of firmware-flash?
> > > > 
> > > > Maybe intel-firmware-flash or something, meaning prefix with the vendor?
> > > > 
> > > > The reason I think it should be specific is because I'm assuming you want
> > > > to script this. And if you have a big fleet with different vendors, then
> > > > "vendor-specific" doesn't tell you enough. But if it's something like
> > > > $vendor-$magic_step then it does become scriptable, and we do have have a
> > > > place to put some documentation on what you should do instead.
> > > > 
> > > > If the point of this interface isn't that it's scriptable, then I'm not
> > > > sure why it needs to be an uevent?
> > > 
> > > You should probably read up on the previous discussion, cause that is exactly what I asked as well :)
> > > 
> > > And no, it should *not* be scripted. That would be a bit brave for a firmware update where you should absolutely not power down the system for example.
> 
> I also don't like the idea or even the thought of scripting something like
> a firmware-flash. But only to fail with a better pin point to make admin
> lives easier with a notification.
> 
> > > 
> > > In my understanding the new value "vendor-specific" basically means it is a known issue with a documented solution, while "unknown" means the driver has no idea how to solve it.
> 
> Exactly, the hardware and firmware are giving the indication of what should be
> done. It is not 'unknown'.
> 
> > 
> > Yes, and since the recovery procedure is defined and known to the consumer,
> > it can potentially be automated (atleast for non-firmware cases).
> > 
> > > > I guess if you all want to stick with vendor-specific then I think that's
> 
> Well, I would honestly prefer a direct firmware-flash, but if that is not
> usable by other vendors and there's a push back on that, let's go with
> the vendor-specific then.

I think the procedure for firmware-flash is vendor specific, so the wedged event
alone is not sufficient either way. The consumer will need more guidance from
vendor documentation.

With vendor-specific method, the driver has the opportunity to cover as many
cases as it wants without having to create a new method everytime, and face the
same dilemma of being vendor agnostic.

> > > > ok with me too, but the docs should at least explain how to figure out
> > > > from the uevent which vendor you're on with a small example. What I'm
> > > > worried is that if we have this on multiple drivers userspace will
> > > > otherwise make a complete mess and might want to run the wrong recovery
> > > > steps.
> > 
> > The device id along with driver can be identified from uevent (probably
> > available inside DEVPATH somewhere) to distinguish the vendor. So the consumer
> > already knows if the device fits the criteria for recovery.
> > 
> > > > I think ideally, no matter what, we'd have a concrete driver patch which
> > > > then also comes with the documentation for what exactly you're supposed to
> > > > do as something you can script. And not just this stand-alone patch here.
> > 
> > Perhaps the rest of the series didn't make it to dri-devel, which will answer
> > most of the above.
> 
> Riana, could you please try to provide a bit more documentation like Sima
> asked and re-send the entire series to dri-devel?

With the ideas in this thread also documented so that we don't end up repeating
the same discussion.

Raag

> > > >>>>>> ---
> > > >>>>>>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> > > >>>>>>  drivers/gpu/drm/drm_drv.c      | 2 ++
> > > >>>>>>  include/drm/drm_device.h       | 4 ++++
> > > >>>>>>  3 files changed, 11 insertions(+), 4 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > >>>>>> index 263e5a97c080..c33070bdb347 100644
> > > >>>>>> --- a/Documentation/gpu/drm-uapi.rst
> > > >>>>>> +++ b/Documentation/gpu/drm-uapi.rst
> > > >>>>>> @@ -421,10 +421,10 @@ Recovery
> > > >>>>>>  Current implementation defines three recovery methods, out of which, drivers
> > > >>>>>>  can use any one, multiple or none. Method(s) of choice will be sent in the
> > > >>>>>>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > > >>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
> > > >>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
> > > >>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > > >>>>>> -will be sent instead.
> > > >>>>>> +more side-effects. If recovery method is specific to vendor
> > > >>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> > > >>>>>> +specific documentation for further recovery steps. If driver is unsure about
> > > >>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> > > >>>>>>  
> > > >>>>>>  Userspace consumers can parse this event and attempt recovery as per the
> > > >>>>>>  following expectations.
> > > >>>>>> @@ -435,6 +435,7 @@ following expectations.
> > > >>>>>>      none            optional telemetry collection
> > > >>>>>>      rebind          unbind + bind driver
> > > >>>>>>      bus-reset       unbind + bus reset/re-enumeration + bind
> > > >>>>>> +    vendor-specific vendor specific recovery method
> > > >>>>>>      unknown         consumer policy
> > > >>>>>>      =============== ========================================
> > > >>>>>>  
> > > >>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > >>>>>> index cdd591b11488..0ac723a46a91 100644
> > > >>>>>> --- a/drivers/gpu/drm/drm_drv.c
> > > >>>>>> +++ b/drivers/gpu/drm/drm_drv.c
> > > >>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > > >>>>>>  		return "rebind";
> > > >>>>>>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> > > >>>>>>  		return "bus-reset";
> > > >>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
> > > >>>>>> +		return "vendor-specific";
> > > >>>>>>  	default:
> > > >>>>>>  		return NULL;
> > > >>>>>>  	}
> > > >>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > >>>>>> index 08b3b2467c4c..08a087f149ff 100644
> > > >>>>>> --- a/include/drm/drm_device.h
> > > >>>>>> +++ b/include/drm/drm_device.h
> > > >>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
> > > >>>>>>   * Recovery methods for wedged device in order of less to more side-effects.
> > > >>>>>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > > >>>>>>   * use any one, multiple (or'd) or none depending on their needs.
> > > >>>>>> + *
> > > >>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> > > >>>>>> + * details.
> > > >>>>>>   */
> > > >>>>>>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> > > >>>>>>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> > > >>>>>>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> > > >>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> > > >>>>>>  
> > > >>>>>>  /**
> > > >>>>>>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > > >>>>>> -- 
> > > >>>>>> 2.47.1
> > > >>>>>>
> > > >>>>>
> > > >>>>
> > > > 
> > > 
