Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF35FC1F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 10:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFBD10E14F;
	Wed, 12 Oct 2022 08:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430910E14F;
 Wed, 12 Oct 2022 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665563161; x=1697099161;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NIc23BcaMRZEE9D455/Rz/Z0DMm9jbzOaJUmqTtzqEY=;
 b=RD8ytB2jmpAdlzF8W49y96VhxPoRZ88YQj0FSZ/DxjMtlgWXOwUZkwex
 oMBP60a0GR4utT9tKu40cujV2oyqPX4SpJWzWW+2bJte2RDUw1CFmalLt
 tuL1suwi49ckwiC3CWpVKzuhwYekwcz6zax2LflHvxKrljcLxzj17f5R1
 YLKPLJwbM3PnqqiXWyi2drHq5vC0V7c4OUV7W0XmUUfVrWuz9TVWiD079
 plSdG5t+kMxZhf+j+VlQDvb+C6seif256upaCKNItJWxDiL4Bt5+C5Bb6
 8G0ca0N+JYSuVJUuktEtGsswDE8i+ChI7Cm43/959JXsFUYTjOKshK3iW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="366733646"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="366733646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 01:26:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871828338"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="871828338"
Received: from freeb-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.24])
 by fmsmga006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 01:25:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
In-Reply-To: <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com> <87wn96yggd.fsf@intel.com>
 <CA+FNwmJRZ-5BwuXykp3R6tQagQgunMC9EhfL9CRyi+Ff47TXhA@mail.gmail.com>
Date: Wed, 12 Oct 2022 11:25:59 +0300
Message-ID: <87v8opwiqw.fsf@intel.com>
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

On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> wrote:
> Currently the EDID is requested during the resume. But since it's
> requested too early, this means before the filesystem is mounted, the
> firmware request fails. This make the DRM driver crash when resuming.
> This kind of issue should be prevented by the firmware caching process
> which cache every firmware requested for the next resume. But since we
> are using a temporary device, the firmware isn't cached on suspend
> since the device doesn't work anymore.
> When using a non temporary device to get the EDID, the firmware will
> be cached on suspend for the next resume. So requesting the firmware
> during resume will succeed.
> But if the firmware has never been requested since the boot, this
> means that the monitor isn't plugged since the boot. The kernel will
> not be caching the EDID. So if we plug the monitor while the machine
> is suspended. The resume will fail to load the firmware. And the DRM
> driver will crash.
> So basically, your fix should solve the issue except for the case
> where the monitor hasn't been plugged since boot and is plugged while
> the machine is suspended.
> I hope I was clear. Tell me if I wasn't. I'm not really good at explaining.

That was a pretty good explanation. The only thing I'm missing is what
the failure mode is exactly when you claim the driver will crash. Why
would request_firmware() "crash" if called for the first time on the
resume path?

I'm not sure I care much about not being able to load the firmware EDID
in the suspend-plug-resume case (as this can be remedied with a
subsequent modeset), but obviously any errors need to be handled
gracefully, without crashing.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
