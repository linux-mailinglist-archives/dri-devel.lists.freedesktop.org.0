Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC0264BDD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 19:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1806E140;
	Thu, 10 Sep 2020 17:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751126E140
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:51:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C45A3B;
 Thu, 10 Sep 2020 19:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599760301;
 bh=y3StJQ6KbephI8BRJDpv5lraVinrNsZ9pLVCmo7EXnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7wZtnDhwQWY274tMcCsFv6LWkhqWcWkS/1pQaVjEEX42wqVjeyuJKjnyLyMiawaW
 xb/QHgnBellk3M2Pfq4L3iQkbSE6kTo0VoYnZ58i1w24yXwqwzJNK3etw16s9+hQXX
 tfM7Y7JUQU5sZE9QCBT+udxehUy7GQd1Cf93FUdk=
Date: Thu, 10 Sep 2020 20:51:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910175113.GG3940@pendragon.ideasonboard.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
 <20200910132803.14dc028d@eldfell>
 <20200910105618.GE3940@pendragon.ideasonboard.com>
 <5f39e5ee-bf2b-e4dc-7584-7e6cd4c5b104@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f39e5ee-bf2b-e4dc-7584-7e6cd4c5b104@amd.com>
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
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vitaly,

On Thu, Sep 10, 2020 at 01:09:03PM -0400, Vitaly Prosyak wrote:
> On 2020-09-10 6:56 a.m., Laurent Pinchart wrote:
> > On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
> >> On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote:
> >>> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
> >>>> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
> >>>>> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
> >>>>>> On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
> >>>>>>      
> >>>>>>> Hi all,
> >>>>>>>
> >>>>>>> I was wondering whether you could give me an advise on how to proceed further
> >>>>>>> with the following issue as I'm preparing to upstream the next set of patches
> >>>>>>> for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> >>>>>>> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> >>>>>>> respectively. Then the output from those 3 pipes is blended together and then
> >>>>>>> gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> >>>>>>> needed.
> >>>>
> >>>> Hi,
> >>>>
> >>>> hmm, so FB -> CSC -> LUT -> CSC -> blending?
> >>>>
> >>>> Is it then
> >>>> 	blending -> LUT -> CSC -> encoder
> >>>> or
> >>>> 	blending -> CSC -> LUT -> encoder?
> >>>
> >>> The DCSS pipeline topology is this:
> >>>
> >>> FB1->CSC_A->LUT->CSC_B-\
> >>> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
> >>> FB3->CSC_A->LUT->CSC_B-/
> >>>
> >>> Basically, CSC_A is used to convert to a common colorspace if needed
> >>> (YUV->RGB) as well as to perform pixel range conversions: limited->full.
> >>> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
> >>> convert to the colorspace used by the output (like RGB->YUV).
> >>
> >> I didn't realize that it would be correct to do RGB-YUV conversion in
> >> non-linear space, but yeah, that's what most software do too I guess.
> >>
> >>>> Are all these LUTs per-channel 1D LUTs or something else?
> >>>
> >>> LUTs are 3D, per pixel component.
> >>
> >> Sorry, which one?
> >>
> >> An example of a 3D LUT is 32x32x32 entries with each entry being a
> >> triplet, while a 1D LUT could be 1024 entries with each entry being a
> >> scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
> >> you need just one for the color value triplet mapping.
> >>
> >> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
> >> channel mixing that a CTM can.
> >>
> >> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
> >> blocks exist...
> >
> > Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
> > R-Car), having a separate CSC can give more precision (as well as
> > allowing the two problems to be decoupled, at a relatively low hardware
> > cost).
> 
> If you put nonlinear signal to 3DLUT then your
> precision would be improved.
> How many bits each color value has in 3DLUT ?

The whole display pipeline uses 8 bits per component.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
