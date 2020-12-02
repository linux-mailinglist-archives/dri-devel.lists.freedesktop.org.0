Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEDB2CC4E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 19:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF106EA8F;
	Wed,  2 Dec 2020 18:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B106EA8F;
 Wed,  2 Dec 2020 18:19:05 +0000 (UTC)
Date: Wed, 2 Dec 2020 19:20:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606933145;
 bh=VEyWbtTmb1x3b+wJ4eb2O6KrmsR6kESCM2SqrApGBJg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLZaOCyd2U3MYQCgavjDdJUlZWXhMrsLdusjjfFRTLa3yfqyxSy9qancuDerCtXdE
 yWiYQKxEm8zm91Fq1gXP0a8HvOxBK+mwuYP2BoM3f9+LMX5vQV/ZUw8zdanx1djsvb
 NOI2pxS8P3Cnze5nQZm+XMxZ2unzA8YU33X6eAU8=
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Message-ID: <X8fa3slOicbad0kN@kroah.com>
References: <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com>
 <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com>
 <X6wEbtSDm69gzFbR@kroah.com>
 <bc6cc476-4f09-1c0f-37b9-522723ecdc85@amd.com>
 <X8fQQpYDqsgGJUPt@kroah.com>
 <7a35f0d7-6e0c-0ebd-c6ea-6629335b85ff@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a35f0d7-6e0c-0ebd-c6ea-6629335b85ff@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 01:02:06PM -0500, Andrey Grodzovsky wrote:
> =

> On 12/2/20 12:34 PM, Greg KH wrote:
> > On Wed, Dec 02, 2020 at 10:48:01AM -0500, Andrey Grodzovsky wrote:
> > > On 11/11/20 10:34 AM, Greg KH wrote:
> > > > On Wed, Nov 11, 2020 at 10:13:13AM -0500, Andrey Grodzovsky wrote:
> > > > > On 11/10/20 12:59 PM, Greg KH wrote:
> > > > > > On Tue, Nov 10, 2020 at 12:54:21PM -0500, Andrey Grodzovsky wro=
te:
> > > > > > > Hi, back to this after a long context switch for some higher =
priority stuff.
> > > > > > > =

> > > > > > > So here I was able eventually to drop all this code and this =
change here https://nam11.safelinks.protection.outlook.com/?url=3Dhttps:%2F=
%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Damd-staging-d=
rm-next-device-unplug%26id%3D61852c8a59b4dd89d637693552c73175b9f2ccd6&amp;d=
ata=3D04%7C01%7CAndrey.Grodzovsky%40amd.com%7C29ff7efb89bd47d8488708d896e86=
e7c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637425272317529134%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3DVzc3fVofA6%2BMPSqHmBqcWavQLKWU1%2FXKJFun24irLf0=
%3D&amp;reserved=3D0
> > > > > > > was enough for me. Seems like while device_remove_file can ha=
ndle the use
> > > > > > > case where the file and the parent directory already gone,
> > > > > > > sysfs_remove_group goes down in flames in that case
> > > > > > > due to kobj->sd being unset on device removal.
> > > > > > A driver shouldn't ever have to remove individual sysfs groups,=
 the
> > > > > > driver core/bus logic should do it for them automatically.
> > > > > > =

> > > > > > And whenever a driver calls a sysfs_* call, that's a hint that =
something
> > > > > > is not working properly.
> > > > > =

> > > > > Do you mean that while the driver creates the groups and files ex=
plicitly
> > > > > from it's different subsystems it should not explicitly remove ea=
ch
> > > > > one of them because all of them should be removed at once (and
> > > > > recursively) when the device is being removed ?
> > > > Individual drivers should never add groups/files in sysfs, the driv=
er
> > > > core should do it properly for you if you have everything set up
> > > > properly.  And yes, the driver core will automatically remove them =
as
> > > > well.
> > > > =

> > > > Please use the default groups attribute for your bus/subsystem and =
this
> > > > will happen automagically.
> > > =

> > > Hi Greg, I tried your suggestion to hang amdgpu's sysfs
> > > attributes on default attributes in struct device.groups but turns ou=
t it's
> > > not usable since by the
> > > time i have access to struct device from amdgpu code it has already b=
een
> > > initialized by pci core
> > > (i.e.=A0 past the point where device_add->device_add_attrs->device_ad=
d_groups
> > > with dev->groups is called)
> > > and so i can't really use it.
> > That's odd, why can't you just set the groups pointer in your pci_driver
> > structure?  That's what it is there for, right?
> =

> I am probably missing something but amdgpu sysfs attrs are per device not
> per driver

Oops, you are right, you want the 'dev_groups' field.  Looks like pci
doesn't export that directly, so you can do:
	.driver {
		.dev_groups =3D my_device_groups;
	},
in your pci_driver structure.

Or I'm sure the PCI driver maintainer would take a patch like
7d9c1d2f7aca ("USB: add support for dev_groups to struct
usb_device_driver") was done for the USB subsystem, as diving into the
"raw" .driver pointer isn't really that clean or nice in my opinion.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
