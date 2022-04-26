Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14339510959
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052AA10E03B;
	Tue, 26 Apr 2022 19:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D091A10E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651002907; x=1682538907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=11/3XsrFO2q64lEch62CHlvlDR8zBrxarz0xr3tiTKU=;
 b=JTazWrIGQtvU3INpss+TKQ53TaAcbhAHwevOrBDcmAeyuAhw98b29oyX
 DHHqrM0hCg3crczfibwdJefy/X4Qh1o//Ck0uuhuxdKYCEj9o39yA5OoE
 F98pullSvVId7LeowtXxWiPxUH/Fvs38mlwmmycx19KJKyZ4E26nIVgDZ
 JxGI6n6ynY4URpIdnYKW2XEha/waM6ECjcNcw3pdNoS7gjWmAns89Z6cJ
 JGRpYwLP/btZa5dhWK7aoveuhhXRIIjbJwu5on/Eo4LlfNVx/FtbQ8xh5
 +MqMxPTsU3pYNt6YDA1KGSzyPElRitVuUoHkDgV3zCELqeKciZ+iVoFZC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328645430"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="328645430"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558500122"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga007.jf.intel.com with SMTP; 26 Apr 2022 12:55:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 22:55:03 +0300
Date: Tue, 26 Apr 2022 22:55:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: How should "max bpc" KMS property work?
Message-ID: <YmhOFwnCpghIBeF7@intel.com>
References: <20220426113502.224d0a90@eldfell>
 <CADnq5_N8AmTq-G04JcfrHKDv8SOvOwZwsmmZd=PU+Nc0GRwybw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N8AmTq-G04JcfrHKDv8SOvOwZwsmmZd=PU+Nc0GRwybw@mail.gmail.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 03:38:25PM -0400, Alex Deucher wrote:
> On Tue, Apr 26, 2022 at 4:35 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > Hi all,
> >
> > I'm working on setting HDR & WCG video modes in Weston, and I thought
> > setting "max bpc" KMS property on the connector would be a good idea.
> > I'm confused about how it works though.
> >
> > I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issues/612
> >
> > Summary:
> >
> > - Apparently the property was originally added as a manual workaround
> >   for sink hardware behaving badly with high depth. A simple end user
> >   setting for "max bpc" would suffice for this use.
> >
> > - Drivers will sometimes automatically choose a lower bpc than the "max
> >   bpc" value, but never bigger.
> >
> > - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
> >   definitely want to raise it.
> >
> > If I always slam "max bpc" to the highest supported value for that
> > property, do I lose more than workarounds for bad sink hardware?
> >
> > Do I lose the ability to set video modes that take too much bandwidth
> > at uncapped driver-selected bpc while capping the bpc lower would allow
> > me to use those video modes?
> 
> You wouldn't lose workarounds for amdgpu, you'd just lose potential
> modes.  The reason we added this feature in the first place was
> because users bought new 4K monitors and the driver capped them at
> 30Hz because we always defaulted to the highest supported bpc.  We got
> tons of bug reports about 4k@60 not being available and that was due
> to the fact that the bpc was set to something greater than 8.  I'm not
> sure what the right answer is.  It really depends on whether the user
> wants higher bpc or faster refresh rates and possibly additional
> higher res modes.

IMO the right answer is to do mode filtering based on the min bpc.

-- 
Ville Syrjälä
Intel
