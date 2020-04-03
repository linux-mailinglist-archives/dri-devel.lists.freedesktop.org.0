Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997819D6D7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 14:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B996E114;
	Fri,  3 Apr 2020 12:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CAE6E114
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 12:39:03 +0000 (UTC)
Date: Fri, 03 Apr 2020 12:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585917541;
 bh=ImCE5WjBCjvT5anPYYqvrnbL9317ofwHM55SqI8k8fU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=klT/tVhLFz40dhTM3vecl+tjRxJc/MEDW3u7g5sVDYGWqg5wboU/DC4mahWMLkQdw
 5+PWc9rojjOzevyZ5mkRaBCuSunpPBmhtwoTVJ7z5mGBQaw04pGUBiIIy9pKzAglEP
 DnXh/FJRO7UUd2Zzp36YObcQCPP0maZSh0PMcpSk=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <k5yRNTOMD1TpC3d6lv7pVxNyDrKEPJrCT8Syw18SEgUEXDpdAZPkOU0LDnSDfEeGyTjq2-QshBGwk8DO4lELhy5yQn-sf0faWHajiK4PDLk=@emersion.fr>
In-Reply-To: <20200403152400.55fe5eac@eldfell.localdomain>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <20200403152400.55fe5eac@eldfell.localdomain>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, April 3, 2020 2:24 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 03 Apr 2020 10:15:21 +0000
> Simon Ser contact@emersion.fr wrote:
>
> > Hi all,
> > I've been working on a library called libliftoff 1. This library allows users
> > to set KMS properties on a hardware planes abstraction called layers.
> > Basically, library users create as many layers as they want with the KMS
> > properties they want, and libliftoff will map layers to actual hardware planes
> > when possible. The layer-to-plane mapping is dynamic. In other words, when
> > setting a layer's properties, the library user can't guess which KMS plane will
> > be used (if any).
> > This works fine for many properties, but doesn't work for enums and bitfields 2.
> > The KMS UAPI expects clients to retrieve the list of enum entries for each
> > object via drmModeGetProperty. The KMS UAPI allows a lot of freedom here: each
> > driver and even each plane can assign a different meaning to a given enum
> > value. For instance, in theory a plane could expose a "rotation" property where
> > 0x01 means "rotate-180", while another plane could expose a "rotation" property
> > where 0x01 means "rotate-90".
> > This makes things complicated for all KMS clients, not only for libliftoff. All
> > clients need to have an internal enum for e.g. "rotation", then when applying
> > properties to a plane needs to convert their internal value enum to the
> > per-plane enum value.
> > However, this isn't true for all properties. A bunch of properties have
> > hardcoded values in the UAPI headers. Looking at my copy of drm_mode.h I can
> > see DRM_MODE_SCALE_, DRM_MODE_DITHERING, DRM_MODE_LINK_STATUS_,
> > DRM_MODE_ROTATE_, DRM_MODE_REFLECT_ and DRM_MODE_CONTENT_PROTECTION_*.
> > (That's why I said "in theory" when I referred to the "rotation" property
> > above.)
> > I understand the intent is to allow adding new KMS properties without having to
> > update the UAPI headers. However having a nice KMS UAPI for dynamically listing
> > all enum entries for a property doesn't forbid us from also exposing the values
> > in the UAPI header to make things easier and simpler for user-space.
> > Additionally, I've heard Pekka saying that it would be nice to have constants
> > for property names in the UAPI headers. Indeed, this would prevent
> > hard-to-debug typo issues. I have a very good example of such a typo issue that
> > took literally hours to debug, with X11 atoms which also use free-form strings
> > like KMS properties 3.
> > If we have constants for property names in UAPI headers, it wouldn't be a big
> > hurdle to also have constants for enum values alongside.
>
> To clarify, the property names would be of the form
>
> #define DRM_KMS_PROPERTY_KERBLAH "KerBlah"
>
> while enum values would be integers, i.e. the raw values.
>
> Daniel Stone did have a good counter-argument to defining property
> names: userspace would be full of
>
> #ifndef DRM_KMS_PROPERTY_KERBLAH
> #define DRM_KMS_PROPERTY_KERBLAH "KerBleh"
> #endif
>
> anyway as long as they cannot rely on the headers to be recent enough.
> (The typo is intentional.)

Well, it depends on the user-space policy for dependencies. Weston
chooses to only bump its dependencies version when strictly necessary,
so Weston could choose to continue to use the hardcoded strings. OTOH,
other projects like wlroots have a different policy and require the
latest versions of its dependencies, and can use the constants from the
headers.

> > Are there any use-cases for defining a standard property which uses different
> > enum values depending on the driver/device/object (ie. the same enum value
> > can have a different meaning depending on the driver/device/object)?
> > At the very least, having a clear policy for both kernel public headers and
> > user-space would help a lot. Right now it's unclear for both parties what to do
> > regarding enum values.
> > What do you think?
>
> I do not think it is unclear at all. You have to query the kernel for
> value by string names. Maybe it's not clearly communicated though?

What's unclear right now is that half the enum properties have
constants in the UAPI headers (maybe more than half actually?). So
looking at the UAPI headers it's not clear whether this is just an
oversight (someone forgot to add enum values), or whether the policy
has changed. I only know about the policy because I asked, it's not
documented anywhere.

> But I also don't have anything against changing that policy, if kernel
> maintainers agree.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
