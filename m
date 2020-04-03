Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DE19D4DF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 12:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663796EB64;
	Fri,  3 Apr 2020 10:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37E36EB64
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 10:15:32 +0000 (UTC)
Date: Fri, 03 Apr 2020 10:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585908930;
 bh=T87XiPF08eMOjcksKrHeJmI5qFvsKPWXOENY6bsymN0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=YlNptfyqDgUB8Maj57WLvUsCC0pL29Ehd8ipOoHTlh8Ser8vO2YMqNA0oqOZMs497
 FMHP/2ukR/Cn0ooAelkrJomWZbNbKKUMD0YGVJIHBn1xaXSGZmPD6QQR7KMRB2osLy
 n6w5L+7U9lBPppx+MKPMPd7QUZqEihD/mQQ+PXRo=
To: DRI Development <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: KMS enums and bitfields UAPI
Message-ID: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've been working on a library called libliftoff [1]. This library allows users
to set KMS properties on a hardware planes abstraction called layers.
Basically, library users create as many layers as they want with the KMS
properties they want, and libliftoff will map layers to actual hardware planes
when possible. The layer-to-plane mapping is dynamic. In other words, when
setting a layer's properties, the library user can't guess which KMS plane will
be used (if any).

This works fine for many properties, but doesn't work for enums and bitfields [2].
The KMS UAPI expects clients to retrieve the list of enum entries for each
object via drmModeGetProperty. The KMS UAPI allows a lot of freedom here: each
driver and even each plane can assign a different meaning to a given enum
value. For instance, in theory a plane could expose a "rotation" property where
0x01 means "rotate-180", while another plane could expose a "rotation" property
where 0x01 means "rotate-90".

This makes things complicated for all KMS clients, not only for libliftoff. All
clients need to have an internal enum for e.g. "rotation", then when applying
properties to a plane needs to convert their internal value enum to the
per-plane enum value.

However, this isn't true for all properties. A bunch of properties have
hardcoded values in the UAPI headers. Looking at my copy of drm_mode.h I can
see DRM_MODE_SCALE_*, DRM_MODE_DITHERING, DRM_MODE_LINK_STATUS_*,
DRM_MODE_ROTATE_*, DRM_MODE_REFLECT_* and DRM_MODE_CONTENT_PROTECTION_*.
(That's why I said "in theory" when I referred to the "rotation" property
above.)

I understand the intent is to allow adding new KMS properties without having to
update the UAPI headers. However having a nice KMS UAPI for dynamically listing
all enum entries for a property doesn't forbid us from also exposing the values
in the UAPI header to make things easier and simpler for user-space.

Additionally, I've heard Pekka saying that it would be nice to have constants
for property names in the UAPI headers. Indeed, this would prevent
hard-to-debug typo issues. I have a very good example of such a typo issue that
took literally hours to debug, with X11 atoms which also use free-form strings
like KMS properties [3].

If we have constants for property names in UAPI headers, it wouldn't be a big
hurdle to also have constants for enum values alongside.

Are there any use-cases for defining a standard property which uses different
enum values depending on the driver/device/object (ie. the same enum value
can have a different meaning depending on the driver/device/object)?

At the very least, having a clear policy for both kernel public headers and
user-space would help a lot. Right now it's unclear for both parties what to do
regarding enum values.

What do you think?

Thanks,

Simon

[1]: https://github.com/emersion/libliftoff
[2]: https://github.com/emersion/libliftoff/issues/39
[3]: https://github.com/swaywm/wlroots/pull/1335
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
