Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847326A6EFC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 16:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AE110E292;
	Wed,  1 Mar 2023 15:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8F10E18B;
 Wed,  1 Mar 2023 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677683117; x=1709219117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IoEvMpf6ZokrlCInLJGa/aRUKS94Xe6pqKLssh4Alwo=;
 b=Hr2jyDnUOwslRKiXnYcI1xkR107R2D7D55Ox3rRdMXw/3wF5ohUbdD5m
 fHGzU+3mkf2LU3k+oZ2pwt0MKHY81we5yG2WNlq7b9DEHYesoUOOWOVgw
 SZbrwwqyYi9RVrHM7/U02gye0E1oCUiPpbv94aLiSq9EthJ1vXT9bI1Tc
 /XTmVXihKXeAwUEhDa7Ji63sOSb/UornXf1uoEwinFv4yJ0Rv6jIbJj7c
 FJdTLAdx2mFUuCqVnEiRwndc5Iiu+DmE7MUSs1aNgDNv5oxq73JxPNlxk
 xbE1xBWjh6O4jH/wFY04A6HmJGb/3d4AfflcpC6O8Mjd429S+p6OsyeDS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318228844"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="318228844"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 07:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674588072"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="674588072"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 01 Mar 2023 07:05:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 01 Mar 2023 17:05:13 +0200
Date: Wed, 1 Mar 2023 17:05:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm/edid: Fix csync detailed mode parsing
Message-ID: <Y/9pqYAWvT9nMMTY@intel.com>
References: <20230227143648.7776-1-ville.syrjala@linux.intel.com>
 <20230228213610.26283-1-ville.syrjala@linux.intel.com>
 <87pm9sx3e1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm9sx3e1.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 10:49:26AM +0200, Jani Nikula wrote:
> On Tue, 28 Feb 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Remove the bogus csync check and replace it with something that:
> > - triggers for all forms of csync, not just the basic analog variant
> > - actually populates the mode csync flags so that drivers can
> >   decide what to do with the mode
> >
> > Originally the code tried to outright reject csync, but that
> > apparently broke some bogus LCD monitor that claimed to have
> > a detailed mode that uses analog csync, despite also claiming
> > the monitor only support separate sync:
> > https://bugzilla.redhat.com/show_bug.cgi?id=540024
> > Potentially that monitor should just be quirked or something.
> >
> > Anyways, what we are dealing with now is some kind of funny i915
> > JSL machine with eDP where the panel claims to support a sensible
> > 60Hz separate sync mode, and a 50Hz mode with bipolar analog
> > csync. The 50Hz mode does not work so we want to not use it.
> > Easiest way is to just correctly flag it as csync and the driver
> > will reject it.
> >
> > TODO: or should we just reject any form of csync (or at least
> > the analog variants) for digital display interfaces?
> >
> > v2: Grab digital csync polarity from hsync polarity bit (Jani)
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com> #v1
> 
> Yup. Fingers crossed.

Thought it best to give this plenty of time to soak, so pushed
to drm-misc-next. Thanks for the review.

-- 
Ville Syrjälä
Intel
