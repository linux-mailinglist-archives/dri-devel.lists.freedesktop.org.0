Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3018C11F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 21:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99946EA5F;
	Thu, 19 Mar 2020 20:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0F06EA5F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:14:54 +0000 (UTC)
Date: Thu, 19 Mar 2020 20:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584648891;
 bh=KPSx7PI5cn3peNZdQg9NpRn7EbNvQVBCiKBlw1XWLE0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=imqvV/1A2rQ3HzKmAxWfs3pSkM6nO4X+Aad4+CAaJaHitZse6Rej1UMLdIbJSyKVC
 i9Eg/e0YNL/PWhtj4mm7SB9/v7KjRtAc/KM+UJzQn4L0nFJKhSixiZo6cqk07WPksM
 +Sd6FTZJH2jsGRjOn+dJRFVJCj69lvGaQm5mJix4=
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
In-Reply-To: <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
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

On Thursday, March 19, 2020 7:18 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> > > > The only way to fix that is to stop Weston from putting non-cursor
> > > > content on the cursor plane.
> > >
> > > Correct.
> >
> > Is that something that should be done?
> > If the hotspot property also had a "disabled" value, then Weston could
> > set the hotspot to disabled when it is using the cursor plane for
> > non-cursor content and not lose the feature. And of course set hotspot
> > correctly when it in fact is a cursor (but for what input?).
>
> I believe cursor planes in the affected virtual gfx-cards do not
> really have a mode where they can actually be used as a generic overlay
> plane, certainly not in a useful manner (if anything works it will all
> be software emulation), implementing a hotspot disabled mode would be
> tricky and this would needs to be duplicated in all virtual-gfx cards
> kms drivers.
>
> If I understood Daniel's proposal for how to deal with this properly,
> then only cursor planes which actually need them would get the new
> hotspot x/y properties. If we do that then Weston could use the
> presence of the hotspot x/y properties to detect if it is dealing
> with a proper hw plane which can also be used as a generic
> plane; or a virtual-gfx cards cursor-plane, and then just not
> bother with trying to use the plane as a generic hw plane.
>
> Would that work?

That would need to at least be hidden behind a DRM capability, otherwise
it would break existing user-space ignoring the hotspot props (e.g.
current Weston).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
