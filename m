Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943384AD879
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C85810E347;
	Tue,  8 Feb 2022 12:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9190110E347;
 Tue,  8 Feb 2022 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644324957; x=1675860957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kleICkGbwhejDj2oVP4S9JBo3krBcFPb2HJSJ1hQSDk=;
 b=NUCw4pAcEoQTF+qlIkin/nSVq0strd78Fm44ICtLwlyBohzR7PuB6gQh
 xjAHdcH8HFxLparvluzDpj9hkw0Ac0YKAVrTSayHstE/JXF78s9pO0Kiu
 4pAE5GIbz2+knPzcjYCBFm/iF90DaF0v8CJEJWFAv/lxuXhEzSar8Upar
 cN3e0G+fWUqRkHK66GiNddFnxQGtQ3QW0kByKvyvDrObNDaShZfnJSyqz
 MAlOiY2U+s9gHeChhZyuW/dh0m/Jlb8XuRRb9bGf3/j15eKII3vwlBVQD
 DwpMS7wMK0Q5m8T2ImfTaiSzJ2Q9iZkKAA9YRYspudAUVEl7/mLfEwe/x w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335343176"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="335343176"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 04:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="678097543"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 08 Feb 2022 04:55:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 14:55:53 +0200
Date: Tue, 8 Feb 2022 14:55:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link
 training based on errata
Message-ID: <YgJoWUYRVjJDQFq4@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
 <bda92c2540e661c39613167b53b5e5388a57a730.1643878928.git.jani.nikula@intel.com>
 <Yf0P8kLCFcotNVkl@intel.com> <87k0e5ra3h.fsf@intel.com>
 <YgI6Pxspeg2yNr2s@intel.com> <87fsotr1zi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsotr1zi.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 02:12:33PM +0200, Jani Nikula wrote:
> On Tue, 08 Feb 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Feb 08, 2022 at 11:17:22AM +0200, Jani Nikula wrote:
> >> On Fri, 04 Feb 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> >> > On Thu, Feb 03, 2022 at 11:03:54AM +0200, Jani Nikula wrote:
> >> >> +
> >> >> +		if (timeout) {
> >> >> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> >> >> +			drm_err(&i915->drm,
> >> >> +				"[ENCODER:%d:%s] Lane channel eq timeout\n",
> >> >> +				encoder->base.base.id, encoder->base.name);
> >> >> +			return false;
> >> >> +		}
> >> >> +
> >> >> +		if (time_after(jiffies, deadline))
> >> >> +			timeout = true; /* try one last time after deadline */
> >> >
> >> > Is there a reason we can't do this just before drm_dp_dpcd_read_link_status()
> >> > so we don't have to pass the timeout status from one loop iteration to
> >> > the next?
> >> 
> >> The point is to check one last time after timeout has passed, like you
> >> suggested in previous review, and I agreed.
> >
> > Sure but why can't it be something more like?
> >
> > timeout = time_after();
> > read_status();
> > if (bad)
> > 	bail;
> > if (timeout)
> > 	bail;
> >
> > I think we have it more like that in wait_for()/etc.
> 
> I was going to fix this, but then realized the "one more time" really
> only makes sense if it includes updating the signal levels and training
> set and then checking the status. I don't think there's point in "one
> more time" only covering the status read.

Hmm. Yeah, I suppose that is true. We can't really know when the sink
updated the status so checking for the timeout just before that might
have the same issue as checking entirely after the status check.

> 
> I've got the loop set up such that the flow is natural when entering the
> loop i.e. I'd rather not have the adjust in the beginning with some if
> (try != 0) check.
> 
> Or am I missing something?

Nah. I guess it's best leave it the way you have it now.

-- 
Ville Syrjälä
Intel
