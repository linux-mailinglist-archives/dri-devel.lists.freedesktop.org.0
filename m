Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE370A115
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 22:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7B10E0D5;
	Fri, 19 May 2023 20:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5A210E0D5;
 Fri, 19 May 2023 20:56:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73B1F657D2;
 Fri, 19 May 2023 20:56:06 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 8EEC1C433D2;
 Fri, 19 May 2023 20:56:04 +0000 (UTC)
Date: Fri, 19 May 2023 16:56:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 4/4] drm/i915: Expose RPS thresholds in sysfs
Message-ID: <ZGfiYracxton0/S5@rdvivi-mobl4>
References: <20230428081457.857009-1-tvrtko.ursulin@linux.intel.com>
 <20230428081457.857009-5-tvrtko.ursulin@linux.intel.com>
 <3b2a7f29-6490-00d0-8f29-f8bd5cea0d11@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b2a7f29-6490-00d0-8f29-f8bd5cea0d11@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 09:44:53AM +0100, Tvrtko Ursulin wrote:
> 
> On 28/04/2023 09:14, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > User feedback indicates significant performance gains are possible in
> > specific games with non default RPS up/down thresholds.
> > 
> > Expose these tunables via sysfs which will allow users to achieve best
> > performance when running games and best power efficiency elsewhere.
> > 
> > Note this patch supports non GuC based platforms only.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
> 
> [snip]
> 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index a5a7315f5ace..f790e81546ff 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2588,7 +2588,12 @@ static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
> >   	ret = mutex_lock_interruptible(&rps->lock);
> >   	if (ret)
> >   		return ret;
> > -	*threshold = val;
> > +	if (*threshold != val) {
> > +		*threshold = val;
> > +		intel_rps_set(rps, clamp(rps->cur_freq,
> > +					 rps->min_freq_softlimit,
> > +					 rps->max_freq_softlimit));
> > +	}
> >   	mutex_unlock(&rps->lock);
> >   	return 0;
> 
> This hunk belongs to a previous patch - moved locally.

I probably missed something then becuase I didn't miss this in any
of the previous patches. To the point that this looked like a new
separated patch.

> 
> Regards,
> 
> Tvrtko
