Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A118C210
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 22:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E8C6EA83;
	Thu, 19 Mar 2020 21:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03D86EA83
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 21:07:17 +0000 (UTC)
Date: Thu, 19 Mar 2020 21:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584652035;
 bh=5bP7iIernZzAQzbdyqpsuaAxejRhGgA4VsKNXrWt9Yw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=kvGWbJM0sG6/yzFzVSOKwjN0po2cCe6jx4ZhBgTmVVc2+qheETpII0MUVFFSmkzZy
 KjuT5ZttGmYU0BMmTKEEOLzcbcSaluYqaxwe4c6Q2zBfzmzEItcH36/UvoDNSv1q1l
 AfdUNBoTH6AwhH29QM7fZq5OSyBhDnJ3tB9391ss=
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <da1Sy2AQg2pW3xtrqoF7yjUF5NpTkwSyooPGrnbBX8P5AEM283ODYI-kLYU1R76B27Zx7WT3uTg3s2B9ko1-KVTYRM7S0dpkjSPJM-Ehm8w=@emersion.fr>
In-Reply-To: <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
 <20200319171633.2ee4afa4@eldfell.localdomain>
 <217ab553-9c16-329d-bbbd-02067a2ccd6e@redhat.com>
 <cusw9Ckx7IvPc-ZlCsXaODZMOjTyxPm5__u0Ufcri1Ug8ulqzDDcXZDK2joUHyK8EbwuYV_e0fj5ejMi_4oVfZi6WHgAlKBcz0LZoyvmcjA=@emersion.fr>
 <817f61b4-2b27-fd96-9e42-79ba2a6889bc@redhat.com>
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

> >>> Is that something that should be done?
> >>> If the hotspot property also had a "disabled" value, then Weston could
> >>> set the hotspot to disabled when it is using the cursor plane for
> >>> non-cursor content and not lose the feature. And of course set hotspot
> >>> correctly when it in fact is a cursor (but for what input?).
> >>
> >> I believe cursor planes in the affected virtual gfx-cards do not
> >> really have a mode where they can actually be used as a generic overlay
> >> plane, certainly not in a useful manner (if anything works it will all
> >> be software emulation), implementing a hotspot disabled mode would be
> >> tricky and this would needs to be duplicated in all virtual-gfx cards
> >> kms drivers.
> >>
> >> If I understood Daniel's proposal for how to deal with this properly,
> >> then only cursor planes which actually need them would get the new
> >> hotspot x/y properties. If we do that then Weston could use the
> >> presence of the hotspot x/y properties to detect if it is dealing
> >> with a proper hw plane which can also be used as a generic
> >> plane; or a virtual-gfx cards cursor-plane, and then just not
> >> bother with trying to use the plane as a generic hw plane.
> >>
> >> Would that work?
> >
> > That would need to at least be hidden behind a DRM capability, otherwise
> > it would break existing user-space ignoring the hotspot props (e.g.
> > current Weston).
>
> Current Weston is already broken, fixing that is what this whole
> thread is about.
>
> The virtual gfx-cards drivers simply must now the hotspot for things to
> work; and a capability is not going to help here for 2 reasons:
>
> 1) Short of disabling seamless mode there is nothing the virtual
> gfx-cards drivers can do when clients do not pass the hotspot info;
> and in some cases they cannot even do this as it is under control
> of a userspace agent process with its own channel to the hypervisor.
>
> 2) Most existing clients which obviously do not set this to-be-introduced
> capability already pass the hotspot info using the DRM_IOCTL_MODE_CURSOR2
> ioctl. Disabling seamless mode when this to-be-introduced capability is
> not set would cause a huge regression for all these existing clients.

Compositors which don't support the hotspot prop are and will continue to break
seamless mode. Setting the prop will never be mandatory, because all user-space
today doesn't do it.

Since we need to update all user-space to add support for this prop, it would
be a good idea to recognize user-space that doesn't support it. Doing something
sensible with user-space that doesn't support the prop is up to the virtual
driver.

If we have a capability, the virtual driver could for instance not advertise a
cursor plane at all if user-space won't correctly set the hotspot anyway.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
