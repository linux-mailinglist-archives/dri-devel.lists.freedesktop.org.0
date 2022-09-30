Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6A45F0D46
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE05510ED21;
	Fri, 30 Sep 2022 14:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B321510ED21;
 Fri, 30 Sep 2022 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664547565; x=1696083565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F58cMeBr5bBgEWRI8zvTrTMwUw7dIxvTR6vfVIlERyU=;
 b=CBDROqWA5i4538DuAlkZe1nqqJjdaKKDwUqmjfNqGcaqqG28nVuKF2W3
 lBWC9UNV0WYNbDphn28JxkEzI1mTxjHPwkySijUY7ny0Arj6A1Jc+NySG
 BXIeaZL2iQWuk80CQwTaSpAWd/u+XFtMFM5+O9PAxd3AXN6Qr+C9Z3AKc
 pa44qqzPMLttEc4OnSM5sqmfKE5ryC3OK+59YEZfxSI9ugqdjWYhyeeVN
 YxuFBr45FT2CH30SDqp2PN0PH9/7goYbToy6h6j8i8OSI8Ge4dCo+TeJr
 qFeUHDAAFJI+rTWOm/Yvc5WCGraL6TSu1RGWxEgJ6e+x+dnbEy33VTTpa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="303110482"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303110482"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 07:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="573875507"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="573875507"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga003.jf.intel.com with SMTP; 30 Sep 2022 07:19:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 17:19:07 +0300
Date: Fri, 30 Sep 2022 17:19:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <Yzb6203nHF8fVH/W@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yzb0uNjB5FpjCIjq@intel.com>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 04:52:56PM +0300, Ville Syrjälä wrote:
> On Thu, Sep 29, 2022 at 06:43:15PM +0000, Simon Ser wrote:
> > This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> > commits, aka. "immediate flip" (which might result in tearing).
> > The feature was only available via the legacy uAPI, however for
> > gaming use-cases it may be desirable to enable it via the atomic
> > uAPI too.
> > 
> > - Patchwork: https://patchwork.freedesktop.org/series/107683/
> > - User-space patch: https://github.com/Plagman/gamescope/pull/595
> > - IGT patch: https://patchwork.freedesktop.org/series/107681/
> 
> So no tests that actually verify that the kernel properly rejects
> stuff stuff like modesets, gamma LUT updates, plane movement,
> etc.?

Pondering this a bit more, it just occurred to me the current driver
level checks might easily lead to confusing behaviour. Eg. is
the ioctl going to succeed if you ask for an async change of some
random property while the crtc disabled, but fails if you ask for
the same async property change when the crtc is active?

So another reason why rejecting most properties already at
the uapi level might be a good idea.

-- 
Ville Syrjälä
Intel
