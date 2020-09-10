Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A4263FC7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D41C6E2E0;
	Thu, 10 Sep 2020 08:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861A36E2E0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:29:42 +0000 (UTC)
Date: Thu, 10 Sep 2020 08:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599726579;
 bh=X4IG22GpQpqKSSx7HsvNklpB9ebMbqqLxemFhbOEBqM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MuJ64J84VvefiM2vOXJXlInOEhROPdGiH1EQfyfuV1Mf/Faip/qxoX7+ZEe15h3Kb
 5mv0b1ouYkXAkG544QhjE1vE6r9+9WZRJoQ/7QYd0I27SzWnuktf2MGgIlUpg5r8Mi
 lv/7LMGEaixyf4TYx6EFoSG2UmZ3+cjA7WK3YF6CFwJUPt9LXrQTv6dfja1/FbIQhw
 2V+Dx50egvHXGsUIC6WmCYWKgxWDScOthxA0SD9RagRms4EyJaYNLedRc7xo4aMd3W
 xBd9WlXcGt6ulpQiBaZo1cVW4gZ4sKSa8AhCNOdMRE15fzqcU1XLrSL/H176mlio6/
 JnJIjnbvfpxVw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <4ggVpoPfSS2JmnPLixWtD-1pcm-aPl0DBELYyqKh6boZxra-xibFZpLbxrykyvxFpW6xs5-R89O2iqdAgnoRaoMAs-DNOFRLKYWR-cZas2I=@emersion.fr>
In-Reply-To: <20200910081836.GG438822@phenom.ffwll.local>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
 <20200910081836.GG438822@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, September 10, 2020 10:18 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
>
> > On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu laurentiu.palcu@oss.nxp.com wrote:
> >
> > > Hi all,
> > > I was wondering whether you could give me an advise on how to proceed further
> > > with the following issue as I'm preparing to upstream the next set of patches
> > > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > > respectively. Then the output from those 3 pipes is blended together and then
> > > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > > needed.
> > > Currently, downstream, we have all those CSCs and LUTs hard-coded into a header
> > > file. Based on the colorspace, range, gamut selected for the output and/or
> > > plane input, we pick up the right CSCs and LUTs from that header file to
> > > configure our pipes... I guess this solution does the job, userspace doesn't
> > > need to care much about how to generate those tables. But, it's also not very
> > > flexible in case there is an app smart enough to know and actually generate
> > > their own custom tables. :/
> > > Looking through the dri-devel archives, I've seen that there was a tentative to
> > > implement a more or less generic per-plane LUT/CSC solution but it didn't make
> > > it in due to lack of userspace consumers...
> >
> > Apart from full color management mentioned by Pekka, are there other
> > use-cases for these per-plane props?
> > One thing I can think of is that some drivers annoyingly only apply the
> > per-CRTC gamma LUT to the primary plane. I think it would make more
> > sense to not attach a gamma prop to the CRTC and instead only attach it
> > to the primary plane to make that clear. But I guess that would also
> > break existing user-space?
>
> Uh, which drivers? This would be a driver bug (and there's been plenty of
> those where the cursor has the wrong color temp and fun stuff like that).
> We need to fix these driver issues instead of lamenting in userspace that
> it's all kinda broken :-)

Apparently this is bug with the old radeon driver [1]. It works fine on
all i915 setups I've tried, and also works fine on amdgpu (with DC).

I've opened a radeon bug.

[1]: https://github.com/swaywm/wlroots/issues/968

> > The gamma LUT is currently used by some compositors to implement "night
> > light"/redshift-like features.
> >
> > > Adding CSC and degamma LUT properties for each plane as well as a gamma
> > > LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> > > entirely on userspace to fill in those tables. But userspace has to know
> > > how to generate those LUTs and colorspace conversion matrices in the
> > > first place...
> >
> > So it wouldn't be enough for user-space to fill these gamma LUTs with
> > linear ramps and get colors that look fine? Would the process be more
> > involved? Would user-space need to know about the driver and generate
> > gamma LUTs depending on the driver?
> > That would be a show-stopper.
>
> Yeah we can't expose such an uapi, instead what I have in mind that the
> in-kernel lut/csc for yuv/broadcast rgb and whatever else are mixed in
> with what userspace provides. That means a slight loss of precision and
> we'll have to have a nice fixed point math library for this stuff in the
> kernel. But color correction hw is too special between vendors that I
> don't think there's any other solution. E.g. even on intel we sometimes
> have dedicated register bits/hw functions for yuv/rgb broadcast value
> range and whatever else, and on other platforms we need to do that by
> adjusting the lut/csc.

Yeah, that makes sense to me.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
