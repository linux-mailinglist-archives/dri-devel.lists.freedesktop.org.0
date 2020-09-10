Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4052644B7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83286E903;
	Thu, 10 Sep 2020 10:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ABE6E903
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:53:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8B43B;
 Thu, 10 Sep 2020 12:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599735221;
 bh=gOR34y0gxz5biQp96enPlx5qrBhK6/KYs1PlPeE0pYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PTlUyIj4t2cG3M4RfiR1rD6vZaRJO/srqLinFIu106BOeSdfX/8SeMXSZzCrOhU1y
 WuHDKcnNRS9iXo2h+F0VwsG3gqsi85ch2jUE1NW1RQYqOvlPcoZSvuIKsTLeBt6q8R
 uUR5A7CJmjIk1PLQNgKFRItszhOxDNnVeexMp3C4=
Date: Thu, 10 Sep 2020 13:53:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910105314.GD3940@pendragon.ideasonboard.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910115026.58dffaf1@eldfell>
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
> 
> > On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
> > > On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
> > >   
> > > > Hi all,
> > > > 
> > > > I was wondering whether you could give me an advise on how to proceed further
> > > > with the following issue as I'm preparing to upstream the next set of patches
> > > > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > > > respectively. Then the output from those 3 pipes is blended together and then
> > > > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > > > needed.
> 
> Hi,
> 
> hmm, so FB -> CSC -> LUT -> CSC -> blending?
> 
> Is it then
> 	blending -> LUT -> CSC -> encoder
> or
> 	blending -> CSC -> LUT -> encoder?
> 
> Are all these LUTs per-channel 1D LUTs or something else?

If we want to define the color pipeline, we need to also take into
account 3D LUTs that use the full R,G,B value as an index in a 3D table.
In practice the table is decimated of course, otherwise it would take
too much space. The R-Car DU supports this feature in the output path:

	blending -> CSC -> 3D-LUT -> LUT -> encoder

> What ever the KMS UAPI for these is going to be looking like, it
> obviously needs to define all this. So I'm guessing we need to define
> the abstract color pipeline of KMS in general that includes everything
> any driver might want to expose. Then each driver picks the blocks in
> the pipeline it wants to expose and the other blocks are assumed to be
> "identity transform".
> 
> Without such general abstract color pipeline defined and documented it
> is very unlikely IMO for generic userspace to make use of the driver
> features.
> 
> All blocks must also default to identity transform. A block
> unimplemented by a driver is the same as a block not used or understood
> by a KMS client.
> 
> Userspace that does not understand all the blocks will need to use the
> "harmless default values". This then ties in with what I've discussed
> with danvet before: when you are VT-switching from one KMS client to
> another, how do you reset the full KMS state (including blocks you
> don't understand) to the same state you had before. The other KMS
> client may have messed them up while you were gone.
> 
> All this default value talk is to ensure that the abstract KMS color
> pipeline can be extended without breaking existing userspace.
> 
> ...
> 
> > > > So, how should I continue with this one? Any pointers?  
> > > 
> > > Hi,
> > > 
> > > I can't help you, but I can say that we are currently in the process of
> > > designing a color management and HDR extension for Wayland, and I'm
> > > sure in the long term I would like to use per-plane color space
> > > transformation features of KMS in Weston eventually.
> > > 
> > > IOW, one more userspace that is going to be taking advantage of such
> > > features as long as they are not too driver-specific.  
> > 
> > Personally I think best to wait for userspace to come up with color
> > manager protocols, that should give us a much clearer idea of what the
> > kernel interface should look like. Since hw is pretty special in this
> > area, I expect we'll have to do a bunch of impendendance mismatching in
> > the kernel anyway.
> 
> Speaking of that, where should we scream if we feel like we are missing
> KMS properties to get the best out of color management and HDR in
> Weston, assuming we're not kernel devs?
> 
> Who to Cc?

You can CC me for Renesas. I'm not necessarily the most knowledgeable
person on this topic, but I can at least dispatch to developers who
could help.

> We currently have intel and AMD hardware at hand if that makes any
> difference.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
