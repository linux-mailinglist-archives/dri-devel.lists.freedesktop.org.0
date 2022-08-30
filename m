Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29955A5E5C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EF410ED3A;
	Tue, 30 Aug 2022 08:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1002110ECCF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661848903; x=1693384903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ohscrdQ7oHXKrXL12sHJ8LJr7s161Sc7HqkuvrFABVM=;
 b=iu7HClZxzJ59Pv35/WvyxVcqmWY16snMjJpWI8zWSsKulByIYPjVTsHu
 MieTiLITl4b7y7vvET/ZuM6gq+o71u7EiRcy31gPEdWL3fQu6lzgP3zC8
 8UTWv6uUNSWOK0mE/HRAzjt0a0ViGTVdYgBYA5toOiDtJ6czfcukZFDNe
 F51ZE/HH/0TSYM/HXuhNwnNJN7JlTH97Az4GewrK7A5+9sweP0IF6Di74
 w/rzse29a0URMMwWI96tOFkPPd9+Yyhogph/MlzyVRI31XIXftOmTDERB
 jLB/v2umXb1rsClF+W0c9k+vsx8YJbFJHsYJruybboh6DFtrqNeq6iLce A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="274869252"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="274869252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 01:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="700911244"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 30 Aug 2022 01:41:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 11:41:39 +0300
Date: Tue, 30 Aug 2022 11:41:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <Yw3NQ2MmhJbsxV3h@intel.com>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
 <20220830111626.77307042@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830111626.77307042@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 11:16:26AM +0300, Pekka Paalanen wrote:
> On Mon, 29 Aug 2022 15:37:52 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > CC Ville for the ASYNC bits, see below.
> > 
> > On Friday, August 26th, 2022 at 10:53, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > 
> > > > +/**
> > > > + * DRM_MODE_PAGE_FLIP_EVENT
> > > > + *
> > > > + * Request that the kernel sends back a vblank event (see
> > > > + * struct drm_event_vblank) when the page-flip is done.  
> > > 
> > > ...with type = DRM_EVENT_FLIP_COMPLETE?
> > > 
> > > This was a bit new to me, because libdrm abstracts vblank and pageflip
> > > events into different APIs.  
> > 
> > Indeed.
> > 
> > Maybe should clarify what "done" means here? Would "when the page-flip has been
> > displayed on-screen" be correct?
> 
> Good idea, but definition is not quite that AFAIU. I would understand
> "displayed" as "turned into light" or at least fully sent to the cable,
> when we are talking at this level of detail.
> 
> Hence, "has been displayed" is not it because the flip-done event is
> emitted before the new FB contents have been scanned out. That scanout
> cycle is only starting when the flip is done. The flip timestamp should
> correspond to the time when the first real pixel of the new FB hits the
> monitor cable.
> 
> A flip is done, when it is guaranteed that the next (or on-going, in
> case of tearing) scanout cycle will use the new FB, IOW the hardware
> programming has been done I believe.
> 
> If the flip is sync'd to vblank, the timestamp is as above, but the
> actual event might be emitted somewhat before or after the instant of
> the timestamp. Some drivers can predict the timestamp so can send the
> event early, others don't.
> 
> If the flip is tearing, then I'm not sure what the timestamp is or when
> the event is emitted.

For i915 we emit the event when the hardware has indicated the
flip has completed (ie. it has really started scanout from the
new fb). After that you can safely reuse the old fb without
accidentally doing frontbuffer rendering. It takes a bit of
time (some smallish number of scanlines) for the hardware to
flush the FIFOs/TLBs/whatever.

And IIRC we just send the last sampled vblank timestamp for
the event. That is, the timestamp should look the same as
for a sync flip submitted during the previous frame. I was
thinking of making it more or less show the current time
of the flip done indication as that's when the scanout
from the new fb starts, but pretty much everyone else was
of the opinion that there is no point in doing that.

-- 
Ville Syrjälä
Intel
