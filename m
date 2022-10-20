Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35D606577
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71C510E4F5;
	Thu, 20 Oct 2022 16:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467BB10E1FD;
 Thu, 20 Oct 2022 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666282336; x=1697818336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e+g8eWaHmm8lmomVC++HUnHoR1ppSUnPPO8atDjLPoA=;
 b=P0jtHU62Yac3uvM9j3JiLwGTF76fEhHqAJfiTmghE5rWK6nzJe2R5JBb
 Mzy00V5LrVqyfdIzwLk8VmVEw92je+yZxmT11AQTr6WzSWrQZpbMBGxb4
 sQZrOumuL5YyIdsxhDcTpzx9wvaMzrr4ZxPe25/ODjLD22cAO4DXRfiqk
 pAS9RjhSh9Sncq+mho3nL8YvLx3nq1T3Q9MYL/bY3OEa0S3m5vtJ9BVwj
 T8xNTvViumrWSV848bp3BgohyAXNRgLYHShoYaa/HOcZpXWHOA/XB3Eis
 kD5Dgaex5uWHI9XsnSSVYVX1TiUaENLWwzToGhE0IlFPM9rIXcFIYW5Rh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287158488"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="287158488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719147223"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="719147223"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 20 Oct 2022 09:09:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Oct 2022 19:09:30 +0300
Date: Thu, 20 Oct 2022 19:09:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Y1Fyuh12g/gt3Izn@intel.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yy7/6oTBW2lqVSK1@kroah.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> > hi Greg, Dan, Jason, DRM-folk,
> > 
> > heres follow-up to V6:
> >   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
> >   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> > 
> > It excludes:
> >   nouveau parts (immature)
> >   tracefs parts (I missed --to=Steve on v6)
> >   split _ddebug_site and de-duplicate experiment (way unready)
> > 
> > IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> > 
> > If these are good to apply, I'll rebase and repost the rest separately.
> 
> All now queued up, thanks.

This stuff broke i915 debugs. When I first load i915 no debug prints are
produced. If I then go fiddle around in /sys/module/drm/parameters/debug
the debug prints start to suddenly work.

-- 
Ville Syrjälä
Intel
