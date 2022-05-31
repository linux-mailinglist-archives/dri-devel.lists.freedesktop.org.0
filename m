Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858F5395AB
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DFF1127ED;
	Tue, 31 May 2022 17:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62F6112B82
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 12:54:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jekstrand) with ESMTPSA id 4FE421F43915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654001639;
 bh=hzRjm42Hl7UwWHTs3RrvSKA+U4i3PUsqXTJ+89I8KQ4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=CkQyl099VOElQIhAufMaWnUE17r7A7fvlP9AH7vxitzc9BSRrrzvRSVh6oOYJRQ/L
 Xo5dezY5Jxam58Wphc6+J5pWZU/fw+2a/K06aWq/A+46m1KHK1vANDFx/7jfvAwu1r
 LxuGjVNSpIThlmEu66YByhKhs5vWqwtgaUmnnf1qDLtsrEtRYy6Z3kJTWIkoDh9lSc
 FlTHz0F3CNFiVm+TFml7rcOSgpo5euGIuF5Utufeax1enwtXNOQML/vfCvKNpz3bA0
 K8ZSkBOqQawORpLvOsgfS/+uxbpmcbTBzfClOH764J1mk1qwRBbRwONVlRrGSX+oWX
 QgipQ0fot5SSA==
Message-ID: <35f5f6228207da2f91aa6930772a43c3cf7db979.camel@collabora.com>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
From: Jason Ekstrand <jason.ekstrand@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>, Simon Ser <contact@emersion.fr>
Date: Tue, 31 May 2022 07:53:50 -0500
In-Reply-To: <YpR/oRRWmzQZU1kI@kroah.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com> <YpRwI7xm5Wtxyiz8@kroah.com>
 <y8_aHkQfpnkFGxtmlPCl1oeVug9pmGRyNP3JadMxYgQBfR0bnNo84pdtiMu3VptPHmcHlqwh0u8ntE7tZ6TWCzCMSLnBK_71fbLUY-ykN40=@emersion.fr>
 <YpR/oRRWmzQZU1kI@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 May 2022 17:56:46 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-30 at 10:26 +0200, Greg KH wrote:
> On Mon, May 30, 2022 at 08:15:04AM +0000, Simon Ser wrote:
> > On Monday, May 30th, 2022 at 09:20, Greg KH
> > <gregkh@linuxfoundation.org> wrote:
> >=20
> > > > > +static struct attribute *dma_buf_caps_attrs[] =3D {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&dma_buf_sync_file_imp=
ort_export_attr.attr,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL,
> > > > > +};
> > > > > +
> > > > > +static const struct attribute_group dma_buf_caps_attr_group
> > > > > =3D {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.attrs =3D dma_buf_cap=
s_attrs,
> > > > > +};
> > > >=20
> > > > Didn't we had macros for those? I think I have seen something
> > > > for that.
> > >=20
> > > Yes, please use ATTRIBUTE_GROUPS()
> >=20
> > This doesn't allow the user to set a group name, and creates an
> > unused
> > "_groups" variable, causing warnings.
>=20
> Then set a group name.
>=20
> But you really want to almost always be using lists of groups, which
> is
> why that macro works that way.

I think I see the confusion here.  The ATTRIBUTE_GROUPS() macro is
intended for device drivers and to be used with add_device().  However,
this is dma-buf so there is no device and no add_device() call to hook.
Unless there are other magic macros to use in this case, I think we're
stuck doing it manually.

--Jason


> >=20
> > > > > +
> > > > > +static struct kobject *dma_buf_caps_kobj;
> > > > > +
> > > > > +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_buf_caps_kobj =3D =
kobject_create_and_add("caps",
> > > > > &kset->kobj);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dma_buf_caps_kobj=
)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D sysfs_create_g=
roup(dma_buf_caps_kobj,
> > > > > &dma_buf_caps_attr_group);
> > >=20
> > > Why do we have "raw" kobjects here?
> > >=20
> > > A group can have a name, which puts it in the subdirectory of the
> > > object
> > > it is attached to.=C2=A0 Please do that and do not create a new
> > > kobject.
> >=20
> > I see, I'll switch to sysfs_create_group with a group name in the
> > next version.
>=20
> No, do not do that, add it to the list of groups for the original
> kobject.
>=20
> thanks,
>=20
> greg k-h

