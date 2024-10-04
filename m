Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63057990065
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 12:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E00910E1C1;
	Fri,  4 Oct 2024 10:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2d4Zwks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E5110E1C1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728036072; x=1759572072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=163bqd0iuLnMhogyWnlC00hLdJCcoBI98++uZ9481Gg=;
 b=R2d4Zwks1Gx58VF5fReEY1hRgLvsqZXcmF8l7Bn4RdtLP/BHyP8+BURy
 rl8Cs63j6wUUFC3bi2jJUdwoL87KF+cwfnXaz6dsq5e6OMFySayZSenkJ
 y0OeRoq3W8PI/wL7jqzte+n+mtd4gJfVLxypVPKF2pqgl4Cy01r1G9H3A
 baBwIu5nzqRn78FoJ1RQd+6gzZ9t4wVI2sPYiZKwB8gdztjwZRQXpajsb
 o06UtB+vxNCX+2s4I+Oa8umodL/rt1ud6s+3d1EoM9HedHJX8led3AHX8
 XwCoTQm3qj1CClvIKg8tYMIk4pztMKRDqheqxUd429FQLQtYtbFCkQ/Du g==;
X-CSE-ConnectionGUID: cUaWQkoDQgGl6LZKUcyiKg==
X-CSE-MsgGUID: 2R5g/qRvS06ac2WsGBUTcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27402348"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27402348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:01:11 -0700
X-CSE-ConnectionGUID: CDv8BwIfQki7bxb0eOOtMg==
X-CSE-MsgGUID: B6nuMCvNRc+191Y0Eh9AKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74764683"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:01:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:01:06 +0300
Date: Fri, 4 Oct 2024 13:01:06 +0300
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
Message-ID: <Zv-84gdD85CqVeh5@intel.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
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

On Fri, Oct 04, 2024 at 11:17:02AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.10.24 um 18:15 schrieb Luck, Tony:
> >> Thanks for the bug report. Can you provide the output of 'sudo lspci
> >> -vvv' for the graphics device?
> > Thomas,
> >
> > Sure. Here's the output (run on the v6.11.0 kernel)
> 
> Thanks. It doesn't look much different from other systems. IRQ is also 
> assigned.
> 
> Attached is a patch that fixes a possible off-by-one error in the 
> register settings. This would affect the bug you're reporting. If 
> possible, please apply the patch to your 6.12-rc1, test and report the 
> result.

Didn't one of these weird variants have some bug where the
CRTC startadd was not working? Is this one of those?
That to me sounds like maybe linecomp has internally been
tied to be always active somehow. Perhaps that would
also prevent it from generating the interrupt...

Anyways, sounds like someone should just double check whether
the status bit ever get asserted or not. If yes, then the
problem must be with interrupt delivery, otherwise the
problem is that the internal interrupt is never even
generated. In the latter case you could try using the
vsync interrupt instead.

-- 
Ville Syrjälä
Intel
