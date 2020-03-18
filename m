Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B8189F86
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5536E2A9;
	Wed, 18 Mar 2020 15:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9966E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:22:18 +0000 (UTC)
Date: Wed, 18 Mar 2020 15:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584544936;
 bh=fu417ZOCDm8wQGhODu8TTyFaK34sS3KYXJbyZ21kszc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=wtMwNirYTdB5+/kgKPtC05V84pBpBee5j6JRtai6IEIfTxIEm+Y21kYQdUw2QhvZT
 3W8pxe0D5qfFu8PB0bmz9U317OJCmDzY3TuzweKx7Cc0/YfNoDTiOuHlIENpQUD4hN
 zOKCsGGWEjGw7lVqYtE2+texNX8/QFrzPz1X3gcw=
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
In-Reply-To: <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Hi,
>
> On 3/18/20 3:38 PM, Simon Ser wrote:
> > Hi,
> >
> >> 1) Letting the VM-viewer window-system draw the cursor as it normally
> >> would draw it.
> >
> > Why is this important? Can't the VM viewer hide the cursor and use a
> > sub-surface to manually draw the cursor plane configured by the guest?
>
> Because then moving the cursor as seen by the user requires a round trip
> through the VM and that adds latency, esp. when the VM viewer is viewing
> a VM which is running somewhere else over the network.

The video output has latency anyway. Using the host cursor will make
the primary plane and cursor plane desynchronized.

> Also note that a subsurface is a Wayland specific solution, where as
> the VM-viewer may be running on X11, Windows, Mac OS, etc.

I'm sure other window systems have similar solutions. You could always
blend the cursor yourself.

> > This would also allow the compositor running inside the VM to correctly
> > have control over the cursor position, which is necessary for pointer
> > constraints.
>
> Vms basically have 2 mouse modes:
>
> 1) Seamless, this works well for all apps which don't do weird things
> with the cursor. This is what 99% of users want
>
> 2) Grab/confine the mouse on the first click inside the VM-viewer window
> and constantly warp it to the center so that it can move "endlessly"
> combined with drawing the VM's mouse cursor as a software sprite.
>
> Combined with a special key combo to release the cursor and allow it
> to leave the VM window in case the user wants to interact with anything
> else on their desktop. AKA the "this user experience sucks" mode which
> sometimes is necessary for guests which don't support absolute input
> coordinates, or for special use cases.
>
> Mode 2. can be used in case of apps inside the guest which want need
> to constrain the pointer to stay inside a part-of the vm-viewer window,
> note that the most prominent example of such apps are VM-viewer's
> themselves and the whole purpose of seamless mode is to not need this
> less then ideal user experience mode.

If you don't care about synchronization and breaking pointer constraints
in the guest, yes a new KMS plane property will be required. This sure
sounds like abusing the KMS interface though.

> Anyways as I mentioned in the p.s. to my original mail already, this
> is exactly NOT the kind of feedback I'm looking for. Seamless mode
> exists, it has done so for at least a decade, probably a lot longer.
>
> It works everywhere, across multiple platforms and hypervisors,
> except with the KMS atomic API. The need to set hotspot coordinates
> is not something which is up to discussion from my pov. What is up
> for discussion is how to extend the KMS atomic API to allow this.

That's not how it works.

I'm sorry to say that, but I don't think asking a project to support a
feature just because you want that feature is a good mind set. You'll
need to convince people maintaining the project that adding the feature
is a good idea whether you like it or not.

A new feature is always up for discussion. Atomic KMS is missing the
feature, and this can't be seen as a regression, because it never had
the feature.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
