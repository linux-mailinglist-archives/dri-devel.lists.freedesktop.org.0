Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24644A2D1C
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 09:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5EE10F70D;
	Sat, 29 Jan 2022 08:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jan 2022 08:30:38 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5694F10F6DB;
 Sat, 29 Jan 2022 08:30:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 444F9CE284F;
 Sat, 29 Jan 2022 08:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AED5C340E5;
 Sat, 29 Jan 2022 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643445032;
 bh=LmS6TDU/ucq+n9hRSsa4AQxVYWYfepde97p1cN1bCsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2BwzNVJeD3uuyqaJ4EXIsk7Dwgrcm4eTfSCBkcnUsZHXoJ/taxE3koywyfkt7XuSa
 6CuQcQPDaVS4pzRk9Hlew2NbGOTDajfAPm+y+RomuL2YpqbVQ36TamuMymC6up9f26
 UocQBfhhoOjMLgZL+cXVDqTUbGFT4Bd8uWVX4qMI=
Date: Sat, 29 Jan 2022 09:30:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Message-ID: <YfT7JaD7N0AZRS59@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 08:57:56PM +0100, Karol Herbst wrote:
> On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > > I pushed this already but I will go ahead and send a revert for this patch.
> > > Will cc you on it as well.
> >
> > This seems short-sighted.  If the patch is valid I see no reason to
> > not accept it.  I'm not trying to downplay the mess umn got into, but
> > as long as the patch is well scrutinized and fixes a valid issue, it
> > should be applied rather than leaving potential bugs in place.
> >
> > Alex
> >
> 
> Even though knowing that malicious code can be introduced via
> perfectly fine looking patches, and sometimes one will never spot the
> problem, this patch isn't all that bad tbh.
> 
> So should we reject patches out of "policies" or should we just be
> extra careful? But not addressing the concerns as Greg pointed out is
> also kind of a bad move, but also not knowing what the state of
> resolving this mess is anyway.

If you think the change is correct, and are willing to sign off on it,
that's fine for now.

The big issue here is that the umn.edu "researchers" are not folling the
very basic and simple proceedures that we worked to set up with them,
and have resumed sending buggy patches to the kernel community.  If you
think this one is not a problem, then feel free to keep it.

As I just now told their administration, it is very difficult to tell
malice from incompetence.  If this is malice, then we need to defend our
community.  If this is just incompetence, then the university has to
handle that as the contributions are coming in their name, _and_ we also
need to defend from that.  What we have tried in the past for this group
is obviously not working, so we now will need to do something else.

{sigh}

greg k-h
