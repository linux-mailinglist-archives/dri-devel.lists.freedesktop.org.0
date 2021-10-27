Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0443CA94
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55E6E896;
	Wed, 27 Oct 2021 13:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127F06E896
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:26:49 +0000 (UTC)
Date: Wed, 27 Oct 2021 13:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1635341206;
 bh=w6HVAxKY3nemfbYtlsbiq1NUaP8+wbxOMttcI7UtYfI=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mtky5xAv/mLfE3dFQg5YkFmBPTCsyh3kqd4HycPs0FVULerUVWc7y5vsnfl7RanK4
 qbeZiS5HlcR+YMx9htHOar6SzG+9sIlm/OPgofOeNa5TdP5eZL3GxI8QInQHcM7Pm1
 QBkG7YQQUXOmqDABHXw5kzV6sYywWqXkZysIXqHxZbbSK0g9JV33Y7wLeJTn8OJQL+
 vxu389spxJxeXRyy3KIrQFLRh8KRK5bcuwyI04R6CkSetCqbF9DvoMUj9L6xKh0A/c
 uaMPWQWv5rf7A4uX+SCGqXvfCBTXhVp7svEqIuPvhi9PDZRNQKV75BO9WHravrJVNE
 Fh6hMYkNVNl5w==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/6] drm/connector: use
 drm_sysfs_connector_hotplug_event
Message-ID: <RNH9PbVxj91eP3_LRm6KWpGuf5SLZnuzaspNJAqn_F9J_SqZ3n3sjt6Aa-S3WKd1fnz_sCuOBZNt9dBS72YXMn4QM5lHWb5Fwdz4tFDDrOo=@emersion.fr>
In-Reply-To: <20211027161514.431a5851@eldfell>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-4-contact@emersion.fr>
 <20211027161514.431a5851@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, October 27th, 2021 at 15:15, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:

> On Fri, 15 Oct 2021 16:33:43 +0000
> Simon Ser <contact@emersion.fr> wrote:
>
> > In drm_connector_register, use drm_sysfs_connector_hotplug_event
> > instead of drm_sysfs_hotplug_event, because the hotplug event
> > only updates a single connector.
> >
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index ec3973e8963c..a50c82bc2b2f 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -547,7 +547,7 @@ int drm_connector_register(struct drm_connector *co=
nnector)
> >  =09connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
> >
> >  =09/* Let userspace know we have a new connector */
> > -=09drm_sysfs_hotplug_event(connector->dev);
> > +=09drm_sysfs_connector_hotplug_event(connector);
> >
> >  =09if (connector->privacy_screen)
> >  =09=09drm_privacy_screen_register_notifier(connector->privacy_screen,
>
> Hi Simon,
>
> this might not work for Weston if I understand this right. Kernel is
> adding a new connector, which means userspace does not recognise the
> connector id in the uevent. Weston as it is right now would ignore the
> event rather than add the connector.
>
> The missing piece is for Weston to revert to the old fashioned "recheck
> everything" behaviour when hotplug uevent carries anything
> unrecognised. Grep for drm_backend_update_conn_props if you want to see
> for yourself.
>
> However, I wouldn't NAK this patch just for Weston, but I wonder if
> other software would ignore events because of this as well.
>
> A whole another question is, would anyone notice. I guess this can only
> be an issue with MST.

I think Weston should be fine: udev_event_is_conn_prop_change returns false
if there's no PROPERTY in the uevent. An uevent with just a CONNECTOR and n=
o
PROPERTY is something new. Weston already falls back to the old "reprobe th=
e
world" approach in this case.

So far the CONNECTOR+PROPERTY uevent fields have only been used for content
protection stuff. I'm not aware of other user-space using it (checked Kodi
just in case, it doesn't do content protection nor handles uevents at all).

> All the other changes in this series look fine to me, so them I can give
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks!
