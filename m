Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84127D429
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 19:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54F6E5C5;
	Tue, 29 Sep 2020 17:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A22E6E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 17:10:35 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B8D92071E;
 Tue, 29 Sep 2020 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601399435;
 bh=yeOAgtszboNZyIpMDHULVmYWzcVi/wr1D+owgmOWf8k=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=GtNtLUhdCOFNrHB3HGBsskZwghH2wKdL2glg2wSnt59jU03dflxktbsN0j2gVL78z
 zW7TF/l50z3Eswma+PSi4XZCxh20ZY7vEPIdubOPobJ8wzwZ4vqGTFE4JDVqWi+Jmo
 XpwXDh5LhsLDzdE/x/R1TVaNDAwRXK9Va8C/2Cr8=
Date: Tue, 29 Sep 2020 19:10:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Hostettler <textshell@uchuujin.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 jirislaby@kernel.org, Peilin Ye <yepeilin.cs@gmail.com>,
 syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 b.zolnierkie@samsung.com, deller@gmx.de, syzkaller-bugs@googlegroups.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
Message-ID: <20200929171040.GB1351851@kroah.com>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
 <20200928175956.GF24673@neutronstar.dyndns.org>
 <100dfd3f-3415-80ae-a6cf-30d15f7ca49f@i-love.sakura.ne.jp>
 <20200929105203.GG24673@neutronstar.dyndns.org>
 <20200929165657.GS438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929165657.GS438822@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 06:56:57PM +0200, Daniel Vetter wrote:
> On Tue, Sep 29, 2020 at 12:52:03PM +0200, Martin Hostettler wrote:
> > On Tue, Sep 29, 2020 at 10:12:46AM +0900, Tetsuo Handa wrote:
> > > On 2020/09/29 2:59, Martin Hostettler wrote:
> > > > On Sun, Sep 27, 2020 at 08:46:30PM +0900, Tetsuo Handa wrote:
> > > >> VT_RESIZEX was introduced in Linux 1.3.3, but it is unclear that what
> > > >> comes to the "+ more" part, and I couldn't find a user of VT_RESIZEX.
> > > >>
> > > > 
> > > > It seems this is/was used by "svgatextmode" which seems to be at
> > > > http://www.ibiblio.org/pub/Linux/utils/console/
> > > > 
> > > > Not sure if that kind of software still has a chance to work nowadays.
> > > > 
> > > 
> > > Thanks for the information.
> > > 
> > > It seems that v.v_vlin = curr_textmode->VDisplay / (MOFLG_ISSET(curr_textmode, ATTR_DOUBLESCAN) ? 2 : 1)
> > > and v.v_clin = curr_textmode->FontHeight . Thus, v.v_clin is font's height and seems to be non-zero.
> > > But according to https://bugs.gentoo.org/19485 , people are using kernel framebuffer instead.
> > > 
> > 
> > Yes, this seems to be from pre framebuffer times.
> > 
> > Back in the days "svga" was the wording you got for "pokes svga card
> > hardware registers from userspace drivers". And textmode means font
> > rendering is done via (fixed function in those times) hardware scanout
> > engine. Of course having only to update 2 bytes per character was a huge
> > saving early on. Likely this is also before vesa VBE was reliable.
> > 
> > So i guess the point where this all starts going wrong allowing the X parts
> > of the api to be combined with FB based rendering at all? Sounds the only
> > user didn't use that combination and so it was never tested?
> > 
> > Then again, this all relates to hardware from 20 years ago...
> 
> Imo userspace modesetting should be burned down anywhere we can. We've
> gotten away with this in drivers/gpu by just seamlessly transitioning to
> kernel drivers.
> 
> Since th only userspace we've found seems to be able to cope if this ioctl
> doesn't do anything, my vote goes towards ripping it out completely and
> doing nothing in there. Only question is whether we should error or fail
> with a silent success: Former is safer, latter can avoid a few regression
> reports since the userspace tools keep "working", and usually people don't
> notice for stuff this old. It worked in drivers/gpu :-)

This patch just ignores the ioctl and keeps on going, so userspace
"shouldn't" notice it :)

And it's in linux-next now, so all should be good.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
