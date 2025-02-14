Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E53A364D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54210ED25;
	Fri, 14 Feb 2025 17:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRPJGjpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323C110ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739554894; x=1771090894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FLlT1lmIZZAzOsgsCw15DJ9e4diOdJyzbKQsrWxvO5o=;
 b=MRPJGjpxkL6LOnTtleKeIBPbwu3Q2qIK3RCuncZqqHKowMYvOvf3nr3q
 xhMuAPslwSI8BdDjLV9Cj3BDV5eSgk4CRwXHVYJngKgP231vhXGGl94nM
 PTWeW5OH03fnJHqqNgwEmQ2qhVi40/AK4wt04fucaapI/HcuYy7nkJb9+
 714G0pHtaBrnjQaOdYR+y1yRFfVCED+rDN6Hzx/Ph6zfFKniXL3sYO03X
 7sy5C9KuSqhdc9SSRAnMJh1kHDqAcr7laeGofvFDqq3MiJYHIXI5boezd
 NP2n4GMGAn4BAG4eW3rW2HNYAN3DCVha/FtuaRSwztZUxGJ3TmiGSM69j w==;
X-CSE-ConnectionGUID: 8mLYmlauTlCZW3JeuTn8/w==
X-CSE-MsgGUID: iJ0WymRgRSefl4H7IYF2wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44077376"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44077376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:41:34 -0800
X-CSE-ConnectionGUID: ZJ+8fGyZRTKD+reQCLHTqA==
X-CSE-MsgGUID: n5OIn65zTqyYbBUfXUqvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113713816"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 14 Feb 2025 09:41:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Feb 2025 19:41:30 +0200
Date: Fri, 14 Feb 2025 19:41:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
Message-ID: <Z6-ASitAVCBD4QP-@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de>
 <ZvUwCVNPzp1UGY6h@intel.com>
 <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de>
 <Z64EzooZqdfLg0pM@intel.com>
 <f075b0f7-3d01-4eb7-b772-825de7a1e001@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f075b0f7-3d01-4eb7-b772-825de7a1e001@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2025 at 11:47:42PM +0100, Helge Deller wrote:
> On 2/13/25 15:42, Ville Syrjälä wrote:
> > On Thu, Sep 26, 2024 at 12:13:04PM +0200, Helge Deller wrote:
> >> On 9/26/24 11:57, Ville Syrjälä wrote:
> >>> On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
> >>>> Hi Ville,
> >>>>
> >>>> On 9/23/24 17:57, Ville Syrjala wrote:
> >>>>> Currently setting cursor_blink attribute to 0 before any fb
> >>>>> devices are around does absolutely nothing. When fb devices appear
> >>>>> and fbcon becomes active the cursor starts blinking. Fix the problem
> >>>>> by recoding the desired state of the attribute even if no fb devices
> >>>>> are present at the time.
> >>>>>
> >>>>> Also adjust the show() method such that it shows the current
> >>>>> state of the attribute even when no fb devices are in use.
> >>>>>
> >>>>> Note that store_cursor_blink() is still a bit dodgy:
> >>>>> - seems to be missing some of the other checks that we do
> >>>>>      elsewhere when deciding whether the cursor should be
> >>>>>      blinking or not
> >>>>> - when set to 0 when the cursor is currently invisible due
> >>>>>      to blinking, the cursor will remains invisible. We should
> >>>>>      either explicitly make it visible here, or wait until the
> >>>>>      full blink cycle has finished.
> >>>>
> >>>> are you planning to send follow-up patches to address those shortcomings?
> >>>
> >>> Nope. I don't really care about those as I never plan to
> >>> turn the cursor blinking back on after turning it off via
> >>> udev.
> >>
> >> Sad, but OK. I will look into this when I find time.
> >> I'd hoped to push those patches upstream during this merge window,
> >> but then I think I have to delay them at least until kernel 6.13.
> >
> > What happened to these? Not seeing them anywhere...
> 
> The issues above are not fixed yet, so they are still parked in my for-next-next tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/log/?h=for-next-next

Those issues are already present in the current code, so
I'm sure what's the point of holding this up due to them.

-- 
Ville Syrjälä
Intel
