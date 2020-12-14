Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDE52D9C74
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5D6E32A;
	Mon, 14 Dec 2020 16:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E16C6E32A;
 Mon, 14 Dec 2020 16:22:38 +0000 (UTC)
IronPort-SDR: Kec+48/YR1L2fLXlv9wk5xjBi+hDaV+3kDtqTblu3b/t/l+OnrVWrBuvaeMAVpne/Ghv4iP8it
 TuJhjP/UCRKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="193095108"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="193095108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 08:22:34 -0800
IronPort-SDR: H+QH7esplQt7GQkr+fZS75FR5nvDwEV2oQHH5F8FcwN5pS+bq/hylqRH1IIOsEzua8kAVP1+E3
 8/Sc4BkDMIfQ==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="367486855"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 08:22:31 -0800
Date: Mon, 14 Dec 2020 18:22:27 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Chery, Nanley G" <nanley.g.chery@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/framebuffer: Format modifier for
 Intel Gen 12 render compression with Clear Color
Message-ID: <20201214162227.GA3566534@ideak-desk.fi.intel.com>
References: <20201123182631.1740781-1-imre.deak@intel.com>
 <20201127143100.GB2144692@ideak-desk.fi.intel.com>
 <20201127151920.GI401619@phenom.ffwll.local>
 <20201127180604.GA2169344@ideak-desk.fi.intel.com>
 <0048c10f7b8047b18934e730ae57386c@intel.com>
 <20201201120456.GC2849269@ideak-desk.fi.intel.com>
 <ac393a9d1b774766a35c299915f0cca5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac393a9d1b774766a35c299915f0cca5@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "Pandiyan,
 Dhinakaran" <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 09:04:02AM +0200, Chery, Nanley G wrote:
> [...]
> > > We probably don't have to update the header, but we noticed in our
> > > testing that the clear color prefers an alignment greater than 64B.
> > > Unfortunately, I can't find any bspec note about this. As long as the
> > > buffer creators are aware though, I think we should be fine. I don't
> > > know if this is the best forum to bring it up, but I thought I'd
> > > share.
> > 
> > Yes, would be good to clarify this and get it also to the spec. Then the
> > driver should also check the alignment of the 3rd FB plane.
> 
> I plan to run some more tests and file a bug in the spec.

Ok, thanks. Note that this patch has a problem with synchornization and
based on Chris' response I'm planning to update it once I figured out
the proper way to map the CC plane. Until that you could still use it on
TGL if you wait for the RT result explicitly after the fast clear and
before flipping to it (that's what the IGT test does atm).

> I see that the IGT test only clears the fb once. Just to confirm, is the 
> clear color offset read from on every frame? Userspace would like to be 
> able to pass different clear colors for an fb.

Yes, every time you do a flip the kernel will re-read the CC value and
program it to the display.

--Imre
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
