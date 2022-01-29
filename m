Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729C4A2D27
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B0610F96B;
	Sat, 29 Jan 2022 08:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023F110F967;
 Sat, 29 Jan 2022 08:32:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3BC1CB80EAC;
 Sat, 29 Jan 2022 08:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AC4C340E5;
 Sat, 29 Jan 2022 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643445150;
 bh=3ekBSUf3XpJYgU1w4+4Uzq8+Tw7omrg/rrrMVHvU9+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwwwFkTn1Y9dipsCk6jDkrYiIa4lZSTUypnip7Ydsg1jP6Igijb/OEMgy58DX5otZ
 tbCdbcR0QB4HuoZgjLprXJUSsr13LK0ivw2/HNAZcKcwZ/8DJlArv/zcwWIETQMgPH
 RP37klQCZrpZYUqA/2AkQNmKfylxp1VF23IN/ui8=
Date: Sat, 29 Jan 2022 09:32:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Message-ID: <YfT7m3muMAFzCooc@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
 <9457f3e139bdf3938e829e1affd01300c11c67dc.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9457f3e139bdf3938e829e1affd01300c11c67dc.camel@redhat.com>
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
 nouveau <nouveau@lists.freedesktop.org>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 02:57:36PM -0500, Lyude Paul wrote:
> On Fri, 2022-01-28 at 14:53 -0500, Alex Deucher wrote:
> > On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > > 
> > > Sigh-thank you for catching this - I had totally forgot about the umn.edu
> > > ban.
> > > I pushed this already but I will go ahead and send a revert for this
> > > patch.
> > > Will cc you on it as well.
> > 
> > This seems short-sighted.  If the patch is valid I see no reason to
> > not accept it.  I'm not trying to downplay the mess umn got into, but
> > as long as the patch is well scrutinized and fixes a valid issue, it
> > should be applied rather than leaving potential bugs in place.
> > 
> 
> Yeah - I sent a revert for this, but that was mainly just to make sure I
> didn't cause problems with Linus or something like that. If it's all the same
> I'd much rather just leave this patch in, as looking at the code the fix seems
> completely valid.

You will not cause any problem at all, don't worry about this, it's not
your fault or responsibility.  If you think the patch is fine, that's
great, no problems.  But be extra careful here, treat these developers
as you would with any other "they are known to send bad patches so are
safe to ignore if I don't want to deal with it" group that many of us
maintainers already have to defend against.

thanks,

greg k-h
