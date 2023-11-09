Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7767E72F4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 21:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764D10E90A;
	Thu,  9 Nov 2023 20:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0710E909;
 Thu,  9 Nov 2023 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699562117; x=1731098117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kBsCSBnWQCB51hsV05oddKau35cCLo6WCL8eUx470rw=;
 b=m1ouIe2mUcuRbOs6PCBDWn5voSgaIwz364A5wRH+WGQhijNp3K3nZD+k
 LOycZovFHXO1t38HCQ65B9aXEZOgICwyzl1MIUwDDs7i+7dmEXNS7L5eb
 5fQFgbuHF76GvJJv0TAGwhrKtk79r8OP2TCKP7e7Waq9JvSIo3O72XEzw
 ticvuMffkbr86d9SAKm52CYANvoMpRvS2QkKzF22jveJD9CecZOFJy2F/
 YhuzeIcBkZkKlxCYaIQ1GeYmJlWXw+1WUXl7WKt065vGDQkiTkATJl2Xt
 rGFg7/8HXQGztQqdOWK9GYEkJp78ORtADQbrSlSnmtpv/VTDZHuQAC9xc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369405613"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="369405613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 12:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="757001599"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="757001599"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 09 Nov 2023 12:35:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:35:12 +0200
Date: Thu, 9 Nov 2023 22:35:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Message-ID: <ZU1CgB5XaO9VsBHJ@intel.com>
References: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
 <ZU0zYaFkpZJoUcZE@intel.com>
 <72f09667-24d5-403a-ba9a-3465c681fec3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72f09667-24d5-403a-ba9a-3465c681fec3@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Nov 09, 2023 at 12:01:26PM -0800, Belgaumkar, Vinay wrote:
> 
> On 11/9/2023 11:30 AM, Ville Syrjälä wrote:
> > On Thu, Nov 09, 2023 at 11:21:48AM -0800, Vinay Belgaumkar wrote:
> >> We read RENDER_HEAD as a part of the flush. If GT is in
> >> deeper sleep states, this could lead to read errors since we are
> >> not using a forcewake. Safer to read a shadowed register instead.
> > IIRC shadowing is only thing for writes, not reads.
> 
> Sure, but reading from a shadowed register does return the cached value

Does it? I suppose that would make some sense, but I don't recall that
ever being stated anywhere. At least before the shadow registers
existed reads would just give you zeroes when not awake.

> (even though we don't care about the vakue here). When GT is in deeper 
> sleep states, it is better to read a shadowed (cached) value instead of 
> trying to attempt an mmio register read without a force wake anyways.

So you're saying reads from non-shadowed registers fails somehow
when not awake? How exactly do they fail? And when reading from
a shadowed register that failure never happens?

> 
> Thanks,
> 
> Vinay.
> 
> >
> >> Cc: John Harrison <john.c.harrison@intel.com>
> >> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> >> index ed32bf5b1546..ea814ea5f700 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> >> @@ -451,7 +451,7 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
> >>   
> >>   		spin_lock_irqsave(&uncore->lock, flags);
> >>   		intel_uncore_posting_read_fw(uncore,
> >> -					     RING_HEAD(RENDER_RING_BASE));
> >> +					     RING_TAIL(RENDER_RING_BASE));
> >>   		spin_unlock_irqrestore(&uncore->lock, flags);
> >>   	}
> >>   }
> >> -- 
> >> 2.38.1

-- 
Ville Syrjälä
Intel
