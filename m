Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB653471131
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 04:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0010E2CB;
	Sat, 11 Dec 2021 03:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB5010E2CB;
 Sat, 11 Dec 2021 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639193422; x=1670729422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BEaZhcHjzNij4JfvZoYIfigGS3BGxvo9sUtZYtDT1Vg=;
 b=ReQgugHAVpQwPFoWLbcfEpPszqUcz1rpJPMfjef8jZy9dlWbePe/ejDZ
 BAT4opOxtFyrToA6mg0m3bJQlnvKgOvKC86sAPpi7OacCdbfUXN8XFCo7
 uN2sS0b1qABCWaocW5FI+O8+essT3CByJwfmkjoRluRSTpxu57SMJ8OyX
 G71Xn/mh40mvfakc5o6CDjptR2VftTp3UVh1cVVIxPZ8COoxR7asrPMhz
 dQDUIR8LpWcmrD7lZPpkPJ/9du8HPHHqDGmYyaO24+yWx00cM9aLVukTZ
 DptFA4HjXe1LpUlvtIVLjoYz1Q+XSHjKjypnDPIX1KTYrdc3Ock6hkNot A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="324769667"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="324769667"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 19:30:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="613144196"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 19:30:21 -0800
Date: Fri, 10 Dec 2021 19:24:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/guc: Add extra debug on CT
 deadlock
Message-ID: <20211211032457.GA8882@jons-linux-dev-box>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-6-matthew.brost@intel.com>
 <57f7200d-1ebc-2a20-513e-3822e5bb5963@intel.com>
 <f9938176-8f9c-cdd5-93ad-15046bc95703@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9938176-8f9c-cdd5-93ad-15046bc95703@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Dec 10, 2021 at 05:45:05PM -0800, John Harrison wrote:
> On 12/10/2021 17:43, John Harrison wrote:
> > On 12/10/2021 16:56, Matthew Brost wrote:
> > > Print CT state (H2G + G2H head / tail pointers, credits) on CT
> > > deadlock.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > index a0cc34be7b56..ee5525c6f79b 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > @@ -523,6 +523,15 @@ static inline bool ct_deadlocked(struct
> > > intel_guc_ct *ct)
> > >           CT_ERROR(ct, "Communication stalled for %lld ms, desc
> > > status=%#x,%#x\n",
> > >                ktime_ms_delta(ktime_get(), ct->stall_time),
> > >                send->status, recv->status);
> > > +        CT_ERROR(ct, "H2G Space: %u\n",
> > > +             atomic_read(&ct->ctbs.send.space) * 4);
> > > +        CT_ERROR(ct, "Head: %u\n", ct->ctbs.send.desc->head);
> > > +        CT_ERROR(ct, "Tail: %u\n", ct->ctbs.send.desc->tail);
> Actually, aren't these offsets in dwords? So, scaling the dword space to
> bytes but leaving this as dwords would produce a confusing numbers.
> 

Copy + pasted from CT debugfs but yes it is slightly confusing. I'd
rather leave the head / tail in native format but I'll add info to both
the space / pointers print indicating the units.

Matt

> John.
> 
> > > +        CT_ERROR(ct, "G2H Space: %u\n",
> > > +             atomic_read(&ct->ctbs.recv.space) * 4);
> > > +        CT_ERROR(ct, "Head: %u\n", ct->ctbs.recv.desc->head);
> > > +        CT_ERROR(ct, "Tail: %u\n", ct->ctbs.recv.desc->tail);
> > > +
> > >           ct->ctbs.send.broken = true;
> > >       }
> > 
> 
