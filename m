Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796AB565B61
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E610EC1C;
	Mon,  4 Jul 2022 16:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972E210E028;
 Mon,  4 Jul 2022 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656924182; x=1688460182;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z5AgiPRT1LGOtg/2zx17iOgDnsUMebMSOWAh7X2B8b0=;
 b=HVtTpeiBOJ2BFoi1oNCL1I5ULt39ZC8Z7unaN04jthDQDDwF6FrV6P5E
 7pGyuEpGok3fd/pMJZz2TznodLscvY4JE5sYt9C9EsQ1ecWo5XD7HNScz
 znMneRbeYswySIOhA8Gb1No8OFuA2zJ96Q1+FAClqRFacKM1WAf/65KNa
 mrZKC7Y8iYRA9jerdFBUD3On3IKmXX51djoChhnbDMRhL5tqGGWPBuFTY
 0KEwYf4ZjE+thT4B0OiUYfHm8CqeTCnUnhN9W6ypSsIp0b91bfTUMx9Q3
 9FamvK9BrF7l21alQrgfL0xXu04MT/IGMLOwdGeKSri6sRP2wEU8nosSU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="263494937"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="263494937"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 01:43:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="619194805"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 01:42:55 -0700
Date: Mon, 4 Jul 2022 10:42:52 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 5/6] drm/i915/gt: Serialize GRDOM access between
 multiple engine resets
Message-ID: <20220704104252.1ab7c579@maurocar-mobl2>
In-Reply-To: <4c46e69e-9af7-3c20-7569-7a4b5897ec7d@linux.intel.com>
References: <cover.1655306128.git.mchehab@kernel.org>
 <5ee647f243a774927ec328bfca8212abc4957909.1655306128.git.mchehab@kernel.org>
 <YrRLyg1IJoZpVGfg@intel.intel>
 <160e613f-a0a8-18ff-5d4b-249d4280caa8@linux.intel.com>
 <20220627110056.6dfa4f9b@maurocar-mobl2>
 <d79492ad-b99a-f9a9-f64a-52b94db68a3b@linux.intel.com>
 <20220629172955.64ffb5c3@maurocar-mobl2>
 <7e6a9a27-7286-7f21-7fec-b9832b93b10c@linux.intel.com>
 <20220630083256.35a56cb1@sal.lan>
 <9477a8f1-3535-ed7f-c491-9ca9f27a10dc@linux.intel.com>
 <20220630170134.3f89e0a3@sal.lan>
 <4c46e69e-9af7-3c20-7569-7a4b5897ec7d@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Jul 2022 08:56:53 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 30/06/2022 17:01, Mauro Carvalho Chehab wrote:
> > Em Thu, 30 Jun 2022 09:12:41 +0100
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> escreveu:
> >  =20
> >> On 30/06/2022 08:32, Mauro Carvalho Chehab wrote: =20
> >>> Em Wed, 29 Jun 2022 17:02:59 +0100
> >>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> escreveu:
> >>>     =20
> >>>> On 29/06/2022 16:30, Mauro Carvalho Chehab wrote: =20
> >>>>> On Tue, 28 Jun 2022 16:49:23 +0100
> >>>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>        =20
> >>>>>> .. which for me means a different patch 1, followed by patch 6 (mo=
ved
> >>>>>> to be patch 2) would be ideal stable material.
> >>>>>>
> >>>>>> Then we have the current patch 2 which is open/unknown (to me at l=
east).
> >>>>>>
> >>>>>> And the rest seem like optimisations which shouldn't be tagged as =
fixes.
> >>>>>>
> >>>>>> Apart from patch 5 which should be cc: stable, but no fixes as agr=
eed.
> >>>>>>
> >>>>>> Could you please double check if what I am suggesting here is feas=
ible
> >>>>>> to implement and if it is just send those minimal patches out alon=
e? =20
> >>>>>
> >>>>> Tested and porting just those 3 patches are enough to fix the Broad=
well
> >>>>> bug.
> >>>>>
> >>>>> So, I submitted a v2 of this series with just those. They all need =
to
> >>>>> be backported to stable. =20
> >>>>
> >>>> I would really like to give even a smaller fix a try. Something like=
, although not even compile tested:
> >>>>
> >>>> commit 4d5e94aef164772f4d85b3b4c1a46eac9a2bd680
> >>>> Author: Chris Wilson <chris.p.wilson@intel.com>
> >>>> Date:   Wed Jun 29 16:25:24 2022 +0100
> >>>>
> >>>>        drm/i915/gt: Serialize TLB invalidates with GT resets
> >>>>       =20
> >>>>        Avoid trying to invalidate the TLB in the middle of performin=
g an
> >>>>        engine reset, as this may result in the reset timing out. Cur=
rently,
> >>>>        the TLB invalidate is only serialised by its own mutex, forgo=
ing the
> >>>>        uncore lock, but we can take the uncore->lock as well to seri=
alise
> >>>>        the mmio access, thereby serialising with the GDRST.
> >>>>       =20
> >>>>        Tested on a NUC5i7RYB, BIOS RYBDWi35.86A.0380.2019.0517.1530 =
with
> >>>>        i915 selftest/hangcheck.
> >>>>       =20
> >>>>        Cc: stable@vger.kernel.org
> >>>>        Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing b=
acking store")
> >>>>        Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>        Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>        Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>        Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> >>>>        Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >>>>        Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel=
.com>
> >>>>        Reviewed-by: Andi Shyti <andi.shyti@intel.com>
> >>>>        Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>        Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i9=
15/gt/intel_gt.c
> >>>> index 8da3314bb6bf..aaadd0b02043 100644
> >>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> >>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> >>>> @@ -952,7 +952,23 @@ void intel_gt_invalidate_tlbs(struct intel_gt *=
gt)
> >>>>            mutex_lock(&gt->tlb_invalidate_lock);
> >>>>            intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> >>>>    =20
> >>>> +       spin_lock_irq(&uncore->lock); /* serialise invalidate with G=
T reset */
> >>>> +
> >>>> +       for_each_engine(engine, gt, id) {
> >>>> +               struct reg_and_bit rb;
> >>>> +
> >>>> +               rb =3D get_reg_and_bit(engine, regs =3D=3D gen8_regs=
, regs, num);
> >>>> +               if (!i915_mmio_reg_offset(rb.reg))
> >>>> +                       continue;
> >>>> +
> >>>> +               intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> >>>> +       }
> >>>> +
> >>>> +       spin_unlock_irq(&uncore->lock);
> >>>> +
> >>>>            for_each_engine(engine, gt, id) {
> >>>> +               struct reg_and_bit rb;
> >>>> +
> >>>>                    /*
> >>>>                     * HW architecture suggest typical invalidation t=
ime at 40us,
> >>>>                     * with pessimistic cases up to 100us and a recom=
mendation to
> >>>> @@ -960,13 +976,11 @@ void intel_gt_invalidate_tlbs(struct intel_gt =
*gt)
> >>>>                     */
> >>>>                    const unsigned int timeout_us =3D 100;
> >>>>                    const unsigned int timeout_ms =3D 4;
> >>>> -               struct reg_and_bit rb;
> >>>>    =20
> >>>>                    rb =3D get_reg_and_bit(engine, regs =3D=3D gen8_r=
egs, regs, num);
> >>>>                    if (!i915_mmio_reg_offset(rb.reg))
> >>>>                            continue;
> >>>>    =20
> >>>> -               intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> >>>>                    if (__intel_wait_for_register_fw(uncore,
> >>>>                                                     rb.reg, rb.bit, =
0,
> >>>>                                                     timeout_us, time=
out_ms,
> >>>>    =20

...

> What about intel_engine_pm_is_awake, what will you do with that one?

Ok, let's keep this series plain simple. I'm dropping PM awake logic
as you suggested on v3, keeping just the bare minimal required to
fix the selftest breakage.

That actually means that we're not considering on such backports that TLB=20
cache invalidation does add performance penalties and might cause apps
to break.

I suspect that we'll need to also backport at least some of the other
patches like the PM awake logic and the one that avoids TLB cache=20
invalidation when the memory was not touched by userspace, but let's
focus first on fixing the regression pointed by selftest.

Regards,
Mauro
