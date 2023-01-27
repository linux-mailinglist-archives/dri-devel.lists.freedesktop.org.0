Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E767DF9C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7710E175;
	Fri, 27 Jan 2023 09:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E3C10E175;
 Fri, 27 Jan 2023 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674810068; x=1706346068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2TLAv5yoehuOmKKwEoPNMS6OOx6MF/jlylA1g9bcRxU=;
 b=EcP2ktaAyGPpCozEBxiKznrd5UIuhvxPyWBm/XmfjlIh2M4K2FaRn52f
 4nR5AW6xxVHqEWgzewYuHcgRMbRNgLF8DnvzBs4sjcKQ8mxOE8R0fjPhs
 MWvIhyOIsazKMrvFWSXotTQEsX7qovfJ3IS18xNQvMVinSBqx41HvuPvQ
 ggJoCwsWHrgUTz1Segclqr2JAR55oFc1aTB+LabdGX5zByGP2TG9aLpqz
 svws+vrkNpIESZ926x8r0HG1JkZ0P+IQGj+Ml5kxUwZUBhEOm9nbb6QUr
 XoGib6GYjj2EmRSea8Iifmch8OPaTV0TDX2il0S2I0wH9GlTaXx5z+x2i g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328332815"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="328332815"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 01:01:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="837055304"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="837055304"
Received: from rhamza-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 01:01:02 -0800
Date: Fri, 27 Jan 2023 10:00:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Message-ID: <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gwan-gyeong,

thanks for the review and the thorough explanation.

On Fri, Jan 27, 2023 at 08:50:26AM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 1/11/23 5:36 PM, Andi Shyti wrote:
> > On Wed, Jan 11, 2023 at 03:18:38PM +0200, Jani Nikula wrote:
> > > On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > > > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > 
> > > > During module load not all the punit transaction have completed
> > > > and we might end up timing out, as shown by the following
> > > > warning:
> > > 
> > > Root cause?
> 
> Hi Andi, looking at the log where this problem is reported,
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1294/bat-atsm-1/igt@i915_module_load@resize-bar.html#dmesg-warnings17324
> 
> <4> [268.276908] i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> 
> In the code above, the call stack is output, and the return value of
> intel_pcode_init() returns -11 (-EAGAIN).
> 
> <3> [268.329058] i915 0000:4d:00.0: [drm] *ERROR* gt0: intel_pcode_init
> failed -11
> 
> 
> If you simplify the function call flow, you can see it as below. (The call
> of _wait_for(COND, timeout_base_ms * 1000, 10, 10) in skl_pcode_request() is
> omitted)
> 
> -------------------------------------------------------------------------
> intel_pcode_init()
>  |
>  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
>                        DG1_UNCORE_GET_INIT_STATUS,
>                        DG1_UNCORE_INIT_STATUS_COMPLETE,
>                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>        |
>        +-> skl_pcode_try_request()
>              |
>              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
>                                            500, 0, true);
> 
> -------------------------------------------------------------------------
> static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
> 		          u32 *val, u32 *val1,
> 			  int fast_timeout_us, int slow_timeout_ms,
> 			  bool is_read)
> {
> ...
> 
> 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
> 		return -EAGAIN;
> 
> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
> 	intel_uncore_write_fw(uncore,
> 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
> 
> 	if (__intel_wait_for_register_fw(uncore,
> 					 GEN6_PCODE_MAILBOX,
> 					 GEN6_PCODE_READY, 0,
> 					 fast_timeout_us,
> 					 slow_timeout_ms,
> 					 &mbox))
> 		return -ETIMEDOUT;
> 
> ...
> }
> -------------------------------------------------------------------------
> 
> The case where skl_pcode_request() returns -EAGAIN can be considered as the
> following scenario.
> 1. 1. When checking the GEN6_PCODE_MAILBOX register status before writing
> the value to the GEN6_PCODE_DATA register in __snb_pcode_rw(), it is always
> BUSY

correct! We fail with EAGAIN because we are not able to
communicate with the punit because the punit is busy.

Talking about this case we are in boot time and the gpu is
performing its boot routine, the punit as well. While the punit
is working we try communicate with it, but unfortunately, being
busy, we fail with -EAGAIN exactly where you pointed.

Adding an extra wait_for_register_fw, i.e. waiting until the
PCODE_READY register tells that the punit is ready, makes sure
that the read/write will succeed.

Thus Chris has added a 10 seconds wait before the very first read
and write. If the punit is not ready we don't fail with -EAGAIN
and give up the driver loading as it happens now. But we give it
another chance trying to probe it again later.

> 2. _wait_for(COND, timeout_base_ms * 1000, 10, 10) of skl_pcode_request()
> returns -EAGAIN if the GEN6_PCODE_MAILBOX register indicates BUSY even after
> waiting 500us after writing a value to the GEN6_PCODE_DATA register in
> __snb_pcode_rw()

Isn't it the same as '1'?

> (Even if skl_pcode_request() gives a timeout of 180 seconds, the time used
> each time __snb_pcode_rw() is called is up to 500us. The rest of the time is
> used for sleep.)

There is one big, massive, huge difference... the timeout in
skl_pcode_request() after the read/write, not before. So that at
the first communication we fail, return -EAGAIN and give up
probing without starting any timer.

Be aware of the fact that the timeout is not for the current
communication, but for the next one. De facto we start the
timeout after communicating, this makes sure that the next
communication will work.

But no one makes sure that the very first communication works
during probe. Thus the extra wait.

> In the situation where the problem is reported, it is not possible to
> confirm exactly which scenario code causes the problem with the current log
> information, and it seems that additional analysis is needed to confirm it.
> If the hardware takes more than 500us to succeed after PCODE_MAILBOX write
> under certain circumstances, it is thought that the root problem causing the
> problem should be fixed.

Actually I have tested it and indeed the extra check on the
PCODE_READY is needed and makes the driver probe correctly.

Thanks,
Andi
