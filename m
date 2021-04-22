Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB313686C4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 20:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781B6E5AB;
	Thu, 22 Apr 2021 18:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71DF6E5AB;
 Thu, 22 Apr 2021 18:51:54 +0000 (UTC)
IronPort-SDR: XjEaaeFQqvSgQ14rlgXmYjzLPe1Y1t8Sgx6AtSNvwqzDaSrcX9dTHHNLVYtVodhp6KCVYpWClK
 NKOPcyFlsqIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="175438289"
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; d="scan'208";a="175438289"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 11:51:54 -0700
IronPort-SDR: 53GYaL8ca1IhBNbJfGJqKXsZvAf8Qy/JQ7WWEMp4yhZgwB/MZmKUaBLnLfwE3VDtAbhTbWWWiU
 NP4Gi+TWIPLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; d="scan'208";a="464055868"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 22 Apr 2021 11:51:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Apr 2021 21:51:50 +0300
Date: Thu, 22 Apr 2021 21:51:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIHFxuoGabGElClS@intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIFGt+I8LMckYyVG@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Currently we try to detect a symmetric memory configurations
> > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > either only set on a very specific subset of machines or it
> > just does not exist (it's not mentioned in any public chipset
> > datasheets I've found). As it happens my CL/CTG machines never
> > set said bit, even if I populate the channels with identical
> > sticks.
> > =

> > So let's do the L-shaped memory detection the same way as the
> > desktop variants, ie. just look at the DRAM rank boundary
> > registers to see if both channels have an identical size.
> > =

> > With this my CL/CTG no longer claim L-shaped memory when I use
> > identical sticks. Also tested with non-matching sticks just to
> > make sure the L-shaped memory is still properly detected.
> > =

> > And for completeness let's update the debugfs code to dump
> > the correct set of registers on each platform.
> > =

> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Did you check this with the swapping igt? I have some vague memories of
> bug reports where somehow the machine was acting like it's L-shaped memory
> despite that banks were populated equally. I've iirc tried all kinds of
> tricks to figure it out, all to absolutely no avail.

BTW looking at the patches/dumps in eg.
https://bugs.freedesktop.org/show_bug.cgi?id=3D28813
I can't immediately see a single thing that is actually using
the correct register offsets for cl/ctg. So I'm a bit sceptical
about how well this was researched in the past.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
