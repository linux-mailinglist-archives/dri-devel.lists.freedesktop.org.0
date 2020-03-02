Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EFF175FCF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E66E5AB;
	Mon,  2 Mar 2020 16:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1AB6E5A2;
 Mon,  2 Mar 2020 16:34:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EED3D8053E;
 Mon,  2 Mar 2020 17:34:01 +0100 (CET)
Date: Mon, 2 Mar 2020 17:34:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200302163400.GA24668@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
 <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
 <87blpfqffp.fsf@intel.com>
 <20200302093919.GD2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302093919.GD2363188@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=4_UfdizR9aQRNRrqBdMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel / Jani.

> On Mon, Mar 02, 2020 at 11:22:34AM +0200, Jani Nikula wrote:
> > On Sat, 29 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >> The header-check infrastructure was dropped again - see:
> > >> fcbb8461fd2376ba3782b5b8bd440c929b8e4980
> > >
> > > Uh I'm disappoint :-/
> > 
> > To say the least. I thought it was a good *opt-in* feature for whoever
> > wanted it. But the part that got the backlash was applying it to
> > absolutely everything under include/. And then it got removed
> > altogether. From one extreme to the other. Nuts.
> > 
> > > Adding Jani in case he missed this too. I guess maybe we should
> > > resurrect it for drm again (and with a file pattern starting in a
> > > .dot).
> > 
> > We have a local implementation in i915/Makefile again. It uses 'find' to
> > find the headers which is fine in i915, but the parameters need to be
> > adjusted for drm to not be recursive. -maxdepth 1 or something. Also
> > need to add another local config option. Sad trombone.
> 
> Splitting this up into two threads.
> 
> Could we extend this to drm headers again too? Sad thrombones indeed, but
> at least here we could still the proper fanfares ... Maybe something like
> have the Makefile snippet in drivers/gpu and then keep a list of
> directories (or file glob patterns probably better) in there that it
> should check.
> 
> I really liked this entire idea very much.
> 
> Oh also maybe switch the temp files over to dotfiles, so Linus doesn't get
> upset (which really I think is all  that Linus expected, but I guess
> people just panic and revert).

I will try to give it a spin by adding the feature back to kbuild,
but without the excessive use.
And with dot-files so the run does not disturb.
So we avoid different sub-systemes makes there own small solutions.

Give me a few weeks - need to land some exciting (not) binding
patches for panel/ first.
Anyone else up to the task, then I will be happy to review.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
