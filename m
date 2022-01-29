Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C784B4A3015
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 15:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D61C10E2F8;
	Sat, 29 Jan 2022 14:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BB910E2D9;
 Sat, 29 Jan 2022 14:47:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A980460DB7;
 Sat, 29 Jan 2022 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFEEC340E5;
 Sat, 29 Jan 2022 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643467636;
 bh=Zd8QO1OjYu/hqF3QMj1BM4GaGYurq0BPUV28vt7DEqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c71n5dgdTLW0ajX91qrGzlQjlP3TcPkoVQEdOFO+LD1K93szKSQoM8c/20G3CJjRn
 dq5NqIrM24Y2bsr7Zcd/rqi5Wdv+ZpBRjWb/+mloPZdH7E24kX7dhTTtrP46b5Vu9B
 9cLiJwonhOnOwZu7G0014AGme/kGcsBHpRBuedvg=
Date: Sat, 29 Jan 2022 15:47:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kangjie Lu <kjlu@umn.edu>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Message-ID: <YfVTcUA4MKknEawL@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
 <CAK8Kejr6E76u2kf_OKxC1RT_qsCWXDf7q4WcTC13-OJz5CseWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8Kejr6E76u2kf_OKxC1RT_qsCWXDf7q4WcTC13-OJz5CseWg@mail.gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 29, 2022 at 08:18:55AM -0600, Kangjie Lu wrote:
> On Fri, Jan 28, 2022 at 1:58 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > > >
> > > > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > > > I pushed this already but I will go ahead and send a revert for this patch.
> > > > Will cc you on it as well.
> > >
> > > This seems short-sighted.  If the patch is valid I see no reason to
> > > not accept it.  I'm not trying to downplay the mess umn got into, but
> > > as long as the patch is well scrutinized and fixes a valid issue, it
> > > should be applied rather than leaving potential bugs in place.
> > >
> > > Alex
> > >
> >
> > Even though knowing that malicious code can be introduced via
> > perfectly fine looking patches, and sometimes one will never spot the
> > problem, this patch isn't all that bad tbh.
> >
> > So should we reject patches out of "policies" or should we just be
> > extra careful? But not addressing the concerns as Greg pointed out is
> > also kind of a bad move, but also not knowing what the state of
> > resolving this mess is anyway.
> 
> 
> Seeing some discussion here, I feel I owe you some quick updates on
> the state. We sent three testing patches in August 2020, which is a
> serious mistake. We never did that again and will never do that again.
> All other patches including recent ones were sent to fix real bugs,
> not to introduce problems. Clearly, although most of the patches are
> valid, some patches are still not good enough, but it is not about
> malice. Fixing bugs in Linux isn't an easy task and takes so much
> effort.
> 
> We did not ignore the concerns pointed out by Greg, and have seriously
> taken some actions. For example, we explained how our static-analysis
> tool found the bugs, and members in my research group have internally
> cross-reviewed the found bugs. We sent these patches after contacting
> Greg---I thought Greg allowed us to send patches, but also requested
> us to work on the last process with our administration.

I do not recall saying anything like this at all.

On January 4, I wrote to you and your coworkers on the mailing list
message https://lore.kernel.org/r/YdQfCGf8qr5zZJef@kroah.com by saying:

	Note that your university is still in many kernel maintainer's
	ignore-list (myself included, I dug this up as I saw Fei's response.)
	Please work with your administration and the process that is currently
	happening in order to give you all the needed training so you will not
	keep causing these types of basic errors that keep your patches from
	being accepted.

	*plonk*

And then later in a private email to you on January 5 where you emailed
Kees and me to try to see if you were allowed to start sending patches
again, I said:

	A kernel developer with lots of experience has already offered to work
	with your university.  Hopefully that process has already started, if
	not, I suggest contacting your administration as they should know who
	this is.

and then I closed with:

	Right now you all are still on my "ignore email" lists for patches.

The patches recently submitted have been shown to be incomplete and in
some places, completely wrong.  I have contacted your administration
about this issue because they asked to know if there were any problems
in the future at our last discussion.  In that response today, I wrote:

	I know that incompetence can often times be hard to distinguish from
	malice, but given the track-record here, we are now going to have to
	treat this as malice.  If it is just incompetence, well, that's
	something that your organization needs to overcome.

	Either way, this is not something that the Linux kernel community should
	be forced to endure.

So to be explicit, so you do not misunderstand me somehow:

	No more patches from umn.edu should be accepted into the Linux
	kernel until further public notice.  They should be considered a
	"bad actor" given their prior history of submissions and lack of
	complying with the kernel community's prior requirements to
	them.

Is this understood?

greg k-h
