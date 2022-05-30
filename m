Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6043E53766A
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 10:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD73F10E0F4;
	Mon, 30 May 2022 08:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A73A10E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:15:09 +0000 (UTC)
Date: Mon, 30 May 2022 08:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653898507; x=1654157707;
 bh=lqX7WjwqqQ+R/XaVh0cGUEjmNZ8aRljFXvzY1q85z6Y=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=icMEmJyWVVkCwMFTDND2hYHTlPETZ+0ZHA1cFqWdYCSy7H4pxc0BBx/bk/qqpc12Z
 01EiAEpHC0BcFEJx182OiJ2HL8gAHlyFP/sWGDz0+sdfJJkhc5V1TXqzBwSJ7uzN29
 bEpasxmxOFYYbZewoMmO/qLVppi+0Key56jQi9Xjc+ykqQyCi52OEIFWcypwHH85sD
 rhc9ktkLCQkkzug09dBaItEg+NWKrwPH+T9rFH2/2R2mKPni9OXKGRdtybkpUmpZ2o
 3Req+y8f68CFcp1c+A8eqOBMfJfGHlSqJGW1p7brKha1s8Pqu6BpprLmP1ZqEVihkt
 G9ZkT1w1SLiXw==
To: Greg KH <gregkh@linuxfoundation.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <y8_aHkQfpnkFGxtmlPCl1oeVug9pmGRyNP3JadMxYgQBfR0bnNo84pdtiMu3VptPHmcHlqwh0u8ntE7tZ6TWCzCMSLnBK_71fbLUY-ykN40=@emersion.fr>
In-Reply-To: <YpRwI7xm5Wtxyiz8@kroah.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com> <YpRwI7xm5Wtxyiz8@kroah.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, May 30th, 2022 at 09:20, Greg KH <gregkh@linuxfoundation.org> wr=
ote:

> > > +static struct attribute *dma_buf_caps_attrs[] =3D {
> > > +=09&dma_buf_sync_file_import_export_attr.attr,
> > > +=09NULL,
> > > +};
> > > +
> > > +static const struct attribute_group dma_buf_caps_attr_group =3D {
> > > +=09.attrs =3D dma_buf_caps_attrs,
> > > +};
> >
> > Didn't we had macros for those? I think I have seen something for that.
>
> Yes, please use ATTRIBUTE_GROUPS()

This doesn't allow the user to set a group name, and creates an unused
"_groups" variable, causing warnings.

> > > +
> > > +static struct kobject *dma_buf_caps_kobj;
> > > +
> > > +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> > > +{
> > > +=09int ret;
> > > +
> > > +=09dma_buf_caps_kobj =3D kobject_create_and_add("caps", &kset->kobj)=
;
> > > +=09if (!dma_buf_caps_kobj)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09ret =3D sysfs_create_group(dma_buf_caps_kobj, &dma_buf_caps_attr_=
group);
>
> Why do we have "raw" kobjects here?
>
> A group can have a name, which puts it in the subdirectory of the object
> it is attached to.  Please do that and do not create a new kobject.

I see, I'll switch to sysfs_create_group with a group name in the next vers=
ion.

Thanks for the pointers!
