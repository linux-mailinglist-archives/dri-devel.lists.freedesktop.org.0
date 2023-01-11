Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC7665EB4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CAC10E759;
	Wed, 11 Jan 2023 15:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E510E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673449496; x=1704985496;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=jxDJ3ooBqVnTaczv1GXFLe+oPshX0iJRCjOYwPWvPAA=;
 b=Me6LGiWRatKnounnQIsk5sf+uAxcT4c++7GoDBRpTVGaN9smtxMbuhai
 Cv/3rKNzuh7hDMyN4QpPWqK1VQwiQrgAUk9FFcNzOdE7uc05dk69hYSdJ
 UpTlYIyTPn2rjvY44sHzA2g+4uEZNbl0+lVWTlhX+xCu1oMZ5NE1ji5xC
 iDb3c5aIHHU5UU3UZacwKFbbrUEVK6h5oadOdq1kIhl9PAoYoyhWmj+i1
 PMLsBOkFZ9dJsj9pzxc9BT78mB+voQDWFDmWwvUbyQUfo48Q/pmEj/fDO
 4JNndB4BS0rt6+nugPh+TKOrFfHqdu3DoBhbZzWmpzBlQdzz7cik8BC0+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350662843"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="350662843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 07:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687955288"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="687955288"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 11 Jan 2023 07:03:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Jan 2023 17:03:30 +0200
Date: Wed, 11 Jan 2023 17:03:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Norris <briannorris@chromium.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Sean Paul <seanpaul@chromium.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <Y77PwoqlfUS5JK7q@intel.com>
References: <20230105174001.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
 <Y7hgLUXOrD7QwKs1@phenom.ffwll.local>
 <Y7hl0Z9PZhFk8On9@phenom.ffwll.local> <Y7h3cuAVE2fdS9K3@google.com>
 <Y7iFAJqGNXA7wHoK@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7iFAJqGNXA7wHoK@phenom.ffwll.local>
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

On Fri, Jan 06, 2023 at 09:30:56PM +0100, Daniel Vetter wrote:
> On Fri, Jan 06, 2023 at 11:33:06AM -0800, Brian Norris wrote:
> > On Fri, Jan 06, 2023 at 07:17:53PM +0100, Daniel Vetter wrote:
> > > - fake vblanks with hrtimer, because on most hw when you turn off the crtc
> > >   the vblanks are also turned off, and so your compositor would still
> > >   hang. The vblank machinery already has all the code to make this happen
> > >   (and if it's not all, then i915 psr code should have it).
> > 
> > Is a timer better than an interrupt? I'm pretty sure the vblank
> > interrupts still can fire on Rockchip CRTC (VOP) (see also the other
> > branch of this thread), so this isn't really necessary. (IGT vblank
> > tests pass without hanging.) Unless you simply prefer a fake timer for
> > some reason.
> > 
> > Also, I still haven't found that fake timer machinery, but maybe I just
> > don't know what I'm looking for.
> 
> I ... didn't find it either. I'm honestly not sure whether this works for
> intel, or whether we do something silly like disable self-refresh when a
> vblank interrupt is pending :-/

Intel hardware doesn't enter PSR while the vblank interrupt is enabled.

-- 
Ville Syrjälä
Intel
