Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BB5FB179
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82B610E187;
	Tue, 11 Oct 2022 11:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429F10E2F1;
 Tue, 11 Oct 2022 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665487832; x=1697023832;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Zd0VpAaEHAgtHpQXOD1386a9dQV5VtC33NJFepBcYyA=;
 b=jiXEooiU3qlVy6aIauWXR7Tb3ajr0aTE3mEeXPw12hoF+d2KDC3bhpO1
 YKOmhhQR4ZltlhwbydxahaepaXhZBVKhTiMQw0flkc/LdjIbMeohyOSwG
 TI6jpfrIpvm8olWvBQSg9W1EjuwJNWG+7PKVLK+G+nYXHk5pGVaJ17qe4
 PB7/f9Mqouj+lbhF40eVt7ObJiydrJjEb12twA63hYuQy0aup2DfNXat+
 mTuw4Zi0K1ofpLtCmhN5wQP/05POmWdMQIPJ9R54ftCC88C+4EIdKLy9A
 NMhyacBjnStvAsK+IdLhdzOQYvdUAnHirNixUUeF7uQmqmPyho1X531AI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="305532800"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="305532800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 04:30:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="689201659"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="689201659"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 04:30:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC] drm: split build lists one per line and sort
In-Reply-To: <Y0VEnTB950XYrhBI@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221011100137.2838947-1-jani.nikula@intel.com>
 <Y0VEnTB950XYrhBI@ashyti-mobl2.lan>
Date: Tue, 11 Oct 2022 14:30:27 +0300
Message-ID: <87bkqiy4vg.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Jani,
>
>> While it takes more vertical space, sorted build lists with one object
>> per line are arguably easier to manage, especially when there are
>> conflicting changes.
>> 
>> Split anything with more than one object file.
>
> looks much better! Just an error below.
>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/Makefile         | 106 ++++++++++++++++++++++---------
>>  drivers/gpu/drm/display/Makefile |  14 ++--
>>  2 files changed, 84 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 25d0ba310509..c4e6ef321566 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -3,32 +3,70 @@
>>  # Makefile for the drm device driver.  This driver provides support for the
>>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>>  
>> -drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>> -		drm_file.o drm_gem.o drm_ioctl.o \
>> -		drm_drv.o \
>> -		drm_sysfs.o drm_mm.o \
>> -		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
>> -		drm_trace_points.o drm_prime.o \
>> -		drm_vma_manager.o \
>> -		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
>> -		drm_framebuffer.o drm_connector.o drm_blend.o \
>> -		drm_encoder.o drm_mode_object.o drm_property.o \
>> -		drm_plane.o drm_color_mgmt.o drm_print.o \
>> -		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>> -		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>> -		drm_client_modeset.o drm_atomic_uapi.o \
>> -		drm_managed.o drm_vblank_work.o
>> -drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>> -			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
>> -			    drm_memory.o drm_scatter.o drm_vm.o
>> +drm-y := \
>> +	drm_aperture.o \
>> +	drm_atomic.o \
>> +	drm_atomic_uapi.o \
>> +	drm_auth.o drm_cache.o \
>
> You forgot to split here and drm_cache.o goes after drm_bridge.o
>
> Other than this there are no errors, I checked them all.

Good catch! I double checked before sending and missed this anyway.

> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks!

>
> Andi
>
>> +	drm_blend.o \
>> +	drm_bridge.o \
>> +	drm_client.o \
>> +	drm_client_modeset.o \
>> +	drm_color_mgmt.o \
>> +	drm_connector.o \
>> +	drm_crtc.o \
>
> [...]

-- 
Jani Nikula, Intel Open Source Graphics Center
