Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA39901F3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8216410E27D;
	Fri,  4 Oct 2024 11:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH6l7QAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA3E10E27D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728040761; x=1759576761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UOWZJFKpML73IlQ6o+LvzPf40yeT7jaOHflbgJeoTGE=;
 b=LH6l7QAWG5E4LQfdPy+S0rE2YulAtBR8A/A5dxD8KuUCLThRTggpxrgu
 9wVP1/ivLf2Bxa9I/2tWzog00x6sX05aoxJhNEPx2ChWQsJGHkQKv4xkn
 kP0JxETJAV0bAv7V0As7FkF5VJJYNtocnBZDb22fRpn5fn8nZYr/a3Npr
 QhCVmkewt5nkyprKuwajwBqrm7mIkyaRnCriY/wJQeysF3AIu7Ie6kvmC
 z5RbXu1c42Mr/Ceowqd5mhrQGZo9DQuARXQP0uDk9T21Ld0Bu8NbM4UB6
 im24Im5kbcfbQopWMSne+0LGOQyfjQ0w8JgwZLCF4R/Nh+bkM65ivYS67 A==;
X-CSE-ConnectionGUID: hGF+6sv1SqWyBkPE0z70bw==
X-CSE-MsgGUID: /+x8uhcTQ+ap1AuK2HlRbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27074523"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27074523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 04:19:20 -0700
X-CSE-ConnectionGUID: v0waPDa9Sj+ab+uHrm+pVQ==
X-CSE-MsgGUID: u6zUrdi2QuKRIDIvZKgdyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74784437"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 04:19:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 14:19:15 +0300
Date: Fri, 4 Oct 2024 14:19:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Luck, Tony" <tony.luck@intel.com>,
 "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Message-ID: <Zv_PM8-x5GZWFLGk@intel.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <Zv-84gdD85CqVeh5@intel.com>
 <f034dcb4-fe1d-4a2d-b917-1ca489b1d00b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f034dcb4-fe1d-4a2d-b917-1ca489b1d00b@suse.de>
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

On Fri, Oct 04, 2024 at 01:03:21PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> thanks for your help.
> 
> 
> Am 04.10.24 um 12:01 schrieb Ville Syrjälä:
> > On Fri, Oct 04, 2024 at 11:17:02AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 02.10.24 um 18:15 schrieb Luck, Tony:
> >>>> Thanks for the bug report. Can you provide the output of 'sudo lspci
> >>>> -vvv' for the graphics device?
> >>> Thomas,
> >>>
> >>> Sure. Here's the output (run on the v6.11.0 kernel)
> >> Thanks. It doesn't look much different from other systems. IRQ is also
> >> assigned.
> >>
> >> Attached is a patch that fixes a possible off-by-one error in the
> >> register settings. This would affect the bug you're reporting. If
> >> possible, please apply the patch to your 6.12-rc1, test and report the
> >> result.
> > Didn't one of these weird variants have some bug where the
> > CRTC startadd was not working? Is this one of those?
> 
> Yeah, but it seems unrelated.
> 
> > That to me sounds like maybe linecomp has internally been
> > tied to be always active somehow. Perhaps that would
> > also prevent it from generating the interrupt...
> 
> Linecomp is usually set to vtotal and that disables the irq. When set to 
> vblank_start/vdisplay_end, it acts like a vblank IRQ. But the other 
> matrox drivers I saw (fbdev, Xorg-video-matrox) set the value -1, while 
> mgag200 doesn't. So there really is an off-by-one error.

For the purposes of the interrupt it shouldn't matter
at all what the linecomp value is, as long as it's
between 0 and vtotal. The patch seemed to just care
about vblkstr which doesn't seem relevant to me.

> 
> >
> > Anyways, sounds like someone should just double check whether
> > the status bit ever get asserted or not. If yes, then the
> > problem must be with interrupt delivery, otherwise the
> > problem is that the internal interrupt is never even
> > generated. In the latter case you could try using the
> > vsync interrupt instead.
> 
> I didn't want to go into full debugging while there's a low-hanging fix 
> to try first. I'll probably take that patch anyway even if it doesn't 
> fix the reported bug.
> 
> Wrt. vsync: isn't that way to late for vblank events? Does DRM give any 
> timing guarantees? (It doesn't AFAIK.) Or does it just mean that a 
> vblank has happened at some point in the past?

It doesn't really matter when the interrupt gets signalled
as long as it's after vblank start. And since the hardware
doesn't even have double buffered register and IIRC doesn't
really care when you reprogram eg. the start address it should
matter even less. Not that it looks like you even try to
do any atomic updates from the vblank handler, so I guess
you just want this for throttling purposes?

-- 
Ville Syrjälä
Intel
