Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7F7FEC1D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A706910E6D8;
	Thu, 30 Nov 2023 09:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF2F10E6D2;
 Thu, 30 Nov 2023 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701337569; x=1732873569;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eCT5mnYmzJmDHGCTw6i3VLs8fmKBr5nglEsnTgCQy8s=;
 b=Gxk3ePs6qCU9n0AeUlw5O93cH6qaE8oPgIkyOMDjvdyYcf0jVSxGdqXF
 W2PscupntPOaJQGNg97Jg7Hi4Q9HBFn8bYNmX4NdcvE9QLZJuCAuHTsEt
 GO2TueUsis06NmUfKv3ssHSem7Q+IjCBIZOS+3U0qC8xf3+ugfi5p0pMz
 vq3qceHRfkIAKzNfPyfD7Pvv343PiOH/2JJwIZEY+1gaWnmO0Pj871hS2
 tnXqEI7GY/g7a/APnSPGxmSH9KMyOZSeTYxE7r84s57L0EgyTLqb4E5p3
 Kj+eJIgbGeIdIk9sFFaJ3DlMg0Mk4m0LEna2cgkFtpRLNNVNoQFgab857 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479499701"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="479499701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 01:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="10719844"
Received: from nemelina-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 01:46:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [RFC] drm: enable W=1 warnings by default across the subsystem
In-Reply-To: <87zfyva8qg.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231129181219.1237887-1-jani.nikula@intel.com>
 <72248f22-6337-487a-9979-a0d79e37a9ed@amd.com> <874jh362ta.fsf@intel.com>
 <eba23oyf4i3j6sdyqljjtgaz27brz4dxfrbtoddestjxwp5lr5@qxfj2b6szigc>
 <87zfyva8qg.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 30 Nov 2023 11:46:00 +0200
Message-ID: <87y1ef4lrb.fsf@intel.com>
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Danilo Krummrich <dakr@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023, Javier Martinez Canillas <javierm@redhat.com> wrote:
> Maxime Ripard <mripard@kernel.org> writes:
>
>> Hi,
>>
>> On Thu, Nov 30, 2023 at 10:52:17AM +0200, Jani Nikula wrote:
>>> On Wed, 29 Nov 2023, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>> > Cc: Nathan Chancellor <nathan@kernel.org>
>>> >
>>> > On 11/29/23 13:12, Jani Nikula wrote:
>>> >> At least the i915 and amd drivers enable a bunch more compiler warnings
>>> >> than the kernel defaults.
>>> >> 
>>> >> Extend the W=1 warnings to the entire drm subsystem by default. Use the
>>> >> copy-pasted warnings from scripts/Makefile.extrawarn with
>>> >> s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it easier to compare and keep
>>> >> up with them in the future.
>>> >> 
>>> >> This is similar to the approach currently used in i915.
>>> >> 
>>> >> Some of the -Wextra warnings do need to be disabled, just like in
>>> >> Makefile.extrawarn, but take care to not disable them for W=2 or W=3
>>> >> builds, depending on the warning.
>>> >
>>> > I think this should go in after drm-misc-next has a clean build (for
>>> > COMPILE_TEST builds) with this patch applied. Otherwise, it will break a
>>> > lot of build configs.
>>> 
>>> Oh, I'm absolutely not suggesting this should be merged before known
>>> warnings have been addressed one way or another. Either by fixing them
>>> or by disabling said warning in driver local Makefiles, depending on the
>>> case.
>>
>> I'm all for it, but yeah, we need some easy way to opt-in/opt-out. Some
>> drivers are pretty much unmaintained now and are likely to never fix
>> those warnings.

Then I'd go for enabling in drm level and disabling individual warnings
in the driver Makefile level if they won't get fixed.

> Maybe add a Kconfig symbol for it instead of making unconditional?
>
> Something like:
>
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-$(CONFIG_DRM_EXTRA_CHECKS)  += -Wextra -Wunused -Wno-unused-parameter
> ...

Then we'll have a ping pong of people not using W=1 or
CONFIG_DRM_EXTRA_CHECKS introducing warnings, and people using them
fixing the warnings...

I really do think making it unconditional is the only way.


BR,
Jani.


-- 
Jani Nikula, Intel
