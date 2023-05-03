Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4C6F5230
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB0B10E1C7;
	Wed,  3 May 2023 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C8110E1C7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683100138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmyPpCl5gOc4OtQ98Y8NJqVvJQ3s7pHLbEFK1ignAE4=;
 b=Ky9TqJTCWK48ePiJCydlMoPc8+Hz5GwPUw7GC6q4pL8LGM32WLRFaKLX1DBy3Qri0f1C4g
 lB5QUG4gUJgc9fp5Iuk5Fb0bpfpsndW9mC6Np4T22fX8Vb859cpCnHL6decywjkCe3UtW3
 P1gRY2b5PQq9oBYUjUZRgenfL7RUFKY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-1p2LQZD6M22M-9i7qRONPw-1; Wed, 03 May 2023 03:48:57 -0400
X-MC-Unique: 1p2LQZD6M22M-9i7qRONPw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so15169455e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 00:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683100136; x=1685692136;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i8GuagGh12Y8dqwOG9xS20hgt65TOsDgcxOw1iS+qhg=;
 b=NcYbhTxcaOz9n5NF+D5xS/d1ff+X3hEwhKcEmZiif1QsPeySnG9873wcaJo4L2eNBh
 tuHaAZmnGnzO4TkqtRCS2KB/m/yWtKde2TG48UpsU4mMoBy9dtg9NxP3AwogYGI4V+h3
 kszqhYYLO4LsGmikTOoOpplQGDfLt13uigniSCh2Bhr5+EfF3g7J7GlJW+gCKeMThnBR
 J55xaVoOj2r0q6jcgkt3QOQng7VPK8kdkK5ck2IYDKbtN8CNOUoqzpMR4Fba5eXTUSIg
 SY3AcYswog2oaxiXwhCp8Mt8K1eV4Fuxj/aJLl4pH7fjp51XZfL7ir7ej8EJZfL/ssB+
 0wPQ==
X-Gm-Message-State: AC+VfDwDpmVTn2qIdurrWKgc7D788v82dS289OBHaSrpopSitmDAhEiq
 EHpKGrWUwP5+ByeKWU/5i5PEbXpPN1raM67U42PIpmQJzU0qXwHGy8WbAdshg1iuB2qzKleo8v0
 xdc6FmtSoo/klnbQtxVU7Irch7pSV
X-Received: by 2002:adf:e647:0:b0:306:3153:d2fe with SMTP id
 b7-20020adfe647000000b003063153d2femr4822118wrn.27.1683100136084; 
 Wed, 03 May 2023 00:48:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eW0PIBX8uPAgG/Q8Ux09ES8w2XRlQ17kdIQmtm473aruCX7JTiFMviLSM1O6xcF9inhGdBg==
X-Received: by 2002:adf:e647:0:b0:306:3153:d2fe with SMTP id
 b7-20020adfe647000000b003063153d2femr4822101wrn.27.1683100135671; 
 Wed, 03 May 2023 00:48:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc301000000b003eddc6aa5fasm1011062wmj.39.2023.05.03.00.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:48:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
In-Reply-To: <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
Date: Wed, 03 May 2023 09:48:54 +0200
Message-ID: <87y1m5x3bt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zackr@vmware.com> writes:

> On Tue, 2023-05-02 at 11:32 +0200, Javier Martinez Canillas wrote:
>> !! External Email
>>=20
>> Daniel Vetter <daniel@ffwll.ch> writes:
>>=20
>> > On Mon, Jul 11, 2022 at 11:32:39PM -0400, Zack Rusin wrote:
>> > > From: Zack Rusin <zackr@vmware.com>
>> > >=20
>> > > Cursor planes on virtualized drivers have special meaning and requir=
e
>> > > that the clients handle them in specific ways, e.g. the cursor plane
>> > > should react to the mouse movement the way a mouse cursor would be
>> > > expected to and the client is required to set hotspot properties on =
it
>> > > in order for the mouse events to be routed correctly.
>> > >=20
>> > > This breaks the contract as specified by the "universal planes". Fix=
 it
>> > > by disabling the cursor planes on virtualized drivers while adding
>> > > a foundation on top of which it's possible to special case mouse cur=
sor
>> > > planes for clients that want it.
>> > >=20
>> > > Disabling the cursor planes makes some kms compositors which were br=
oken,
>> > > e.g. Weston, fallback to software cursor which works fine or at leas=
t
>> > > better than currently while having no effect on others, e.g. gnome-s=
hell
>> > > or kwin, which put virtualized drivers on a deny-list when running i=
n
>> > > atomic context to make them fallback to legacy kms and avoid this is=
sue.
>> > >=20
>> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
>> > > Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plan=
e list
>> > > (v2)")
>>=20
>> [...]
>>=20
>> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> > > index f6159acb8856..c4cd7fc350d9 100644
>> > > --- a/include/drm/drm_drv.h
>> > > +++ b/include/drm/drm_drv.h
>> > > @@ -94,6 +94,16 @@ enum drm_driver_feature {
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * synchronization of command submissi=
on.
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> > > =C2=A0=C2=A0=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(6),
>> > > +=C2=A0=C2=A0=C2=A0 /**
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRIVER_VIRTUAL:
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Driver is running on top of virtual hard=
ware. The most significant
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * implication of this is a requirement of =
special handling of the
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor plane (e.g. cursor plane has to a=
ctually track the mouse
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor and the clients are required to s=
et hotspot in order for
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * the cursor planes to work correctly).
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> > > +=C2=A0=C2=A0=C2=A0 DRIVER_VIRTUAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D B=
IT(7),
>> >=20
>> > I think the naming here is unfortunate, because people will vonder why
>> > e.g. vkms doesn't set this, and then add it, and confuse stuff complet=
ely.
>> >=20
>> > Also it feels a bit wrong to put this onto the driver, when really it'=
s a
>> > cursor flag. I guess you can make it some kind of flag in the drm_plan=
e
>> > structure, or a new plane type, but putting it there instead of into t=
he
>> > "random pile of midlayer-mistake driver flags" would be a lot better.
>> >=20
>> > Otherwise I think the series looks roughly how I'd expect it to look.
>> > -Daniel
>> >=20
>>=20
>> AFAICT this is the only remaining thing to be addressed for this series =
?
>
> No, there was more. tbh I haven't had the time to think about whether the=
 above
> makes sense to me, e.g. I'm not sure if having virtualized drivers expose=
 "support
> universal planes" and adding another plane which is not universal (the on=
ly
> "universal" plane on them being the default one) makes more sense than a =
flag that
> says "this driver requires a cursor in the cursor plane". There's certain=
ly a huge
> difference in how userspace would be required to handle it and it's way u=
glier with
> two different cursor planes. i.e. there's a lot of ways in which this cou=
ld be
> cleaner in the kernel but they all require significant changes to userspa=
ce, that go
> way beyond "attach hotspot info to this plane". I'd like to avoid approac=
hes that
> mean running with atomic kms requires completely separate paths for virtu=
alized
> drivers because no one will ever support and maintain it.
>
> It's not a trivial thing because it's fundamentally hard to untangle the =
fact the
> virtualized drivers have been advertising universal plane support without=
 ever
> supporting universal planes. Especially because most new userspace in gen=
eral checks
> for "universal planes" to expose atomic kms paths.
>

After some discussion on the #dri-devel, your approach makes sense and the
only contention point is the name of the driver feature flag name. The one
you are using (DRIVER_VIRTUAL) seems to be too broad and generic (the fact
that vkms won't set and is a virtual driver as well, is a good example).

Maybe something like DRIVER_CURSOR_HOTSPOT or DRIVER_CURSOR_COMMANDEERING
would be more accurate and self explanatory ?

> The other thing blocking this series was the testing of all the edge case=
s, I think
> Simon and Pekka had some ideas for things to test (e.g. run mutter with s=
upport for
> this and wayland without support for this in at the same time in differen=
t consoles
> and see what happens). I never had the time to do that either.
>

I understand that every new feature needs tests but I fail to see why
the bar is higher for this feature than others? I would prefer if this
series are not blocked due some potential issues on hypothetical corner
cases that might not happen in practice. Or do people really run two or
more compositors on different console and switch between them ?

>> Zack, are you planning to re-spin a v3 of this patch-set? Asking because
>> we want to take virtio-gpu out of the atomic KMS deny list in mutter, bu=
t
>> first need this to land.
>>=20
>> If you think that won't be able to do it in the short term, Bilal (Cc'ed=
)
>> or me would be glad to help with that.
>
> This has been on my todo for a while I just never had the time to go thro=
ugh all the
> remaining issues. Fundamentally it's not so much a technical issue anymor=
e, it's
> about picking the least broken solution and trying to make the best out o=
f a pretty
> bad situation. In general it's hard to paint a bikeshed if all you have i=
s a million
> shades of gray ;)
>

Agreed. And I believe that other than the driver cap name, everyone agrees
with the color of your bikeshed :)

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

