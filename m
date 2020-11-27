Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA322C6673
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD976EDAE;
	Fri, 27 Nov 2020 13:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BD86EB8C;
 Fri, 27 Nov 2020 13:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmbjHsIDnHmywVbr59xE64W8BWWC+sC7+K2qxUKlK71qeegyldwW2uxNyq8+Riw2qc65vjSlpLWu58nz3FQtoBjaK6xc40gyAIi68oHcEiohRAxKZn8umoNxMvXzq4T6Lh6d2CR3bnKXEi7wU3kbXhOX/fQYcTA+Z7MXeslZISaO990CpEhTAQc1qC3BI0ExYA1rbLCwlDBeHNH5tLZ/sGWIejV7Uh7BpR+dARTozGo7hurXk5qcHxoZvmmuunCFqqarw+93w7NLvQTKvG89nt4Fg5arsv7MpIWskRNryEI2eEMQLdz5vXbweI2QmTpmqBGkwCmzk9uMsUb+WxADTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0W+ePiLGJbEjJ87XmH6fmphTByuLINXwHHNwoRumU8=;
 b=L47IY3E5ODV4IoKikTnbHngN+ipJuZsLx17GcJp5KUI1sQ7hn8zriz2OP92nxjWwFPpGCjS5Hl+H9EYvDGz8bf5ndMditGxG0GqvAAYPT4XRgG8WziCZKBDgdCR2XRuYtet9xuLXEQhua9YNcYngAu+VAJuyQOLuOhlP/gbEZ8AaPVfUgeiIh6vnbCeLGibfFBIcSYKljYO5HeJNb0KuYoeJ3G5gmtT4Vnq+cMgvp/Phx1VhmTbCKVQoMZDLfyfR1LHuWAonvyM/KvXKpLqEruUozwX3iGUP3WE/A19VwdenjooVKlHa8PrLPaz8G//rCsPyH1H8+WYH7mBhq/BzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0W+ePiLGJbEjJ87XmH6fmphTByuLINXwHHNwoRumU8=;
 b=wvl/FGK7U5Xf5RTbLE452KfzUxGyTeKymRMjY9m6DfSTggmVZR5Bl3Hx6uMl7jZ0sg2gzg2voMARHwlxcOMQqTtdoiP+98cOtEPdYJbbvAK8jPzWJMCbTahkK99jDXlzCLDnJ1G5LLgsR+9J9d6dQySnKQx9yXMz8Qh7AsoPbaM=
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3116.namprd12.prod.outlook.com (2603:10b6:5:38::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Fri, 27 Nov 2020 13:12:18 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 13:12:18 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post device
 unplug
Thread-Topic: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post
 device unplug
Thread-Index: AQHWv8Y7UCcLwWP0B0GTFJ1BNWsG+anXYoQAgAAsKQCAAQWcAIAAkBmAgALZsvI=
Date: Fri, 27 Nov 2020 13:12:18 +0000
Message-ID: <DM6PR12MB4340694885D1EE07361B330AEAF80@DM6PR12MB4340.namprd12.prod.outlook.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-11-git-send-email-andrey.grodzovsky@amd.com>
 <20201124144938.GR401619@phenom.ffwll.local>
 <36fdb2f8-2238-6321-201e-a25a3a828fc5@amd.com>
 <CAKMK7uE=AfP2p=UKjG=TFuFh8d0vphyHndxxEqqNNa+ouX48AQ@mail.gmail.com>,
 <1fcc5e3a-36d8-846d-032c-25fb8defd486@amd.com>
In-Reply-To: <1fcc5e3a-36d8-846d-032c-25fb8defd486@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2607:fea8:3edf:49b0:3ca0:d57:1062:a8e9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0d2907a-43d0-46ff-8643-08d892d6119e
x-ms-traffictypediagnostic: DM6PR12MB3116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3116134666BBBBB7CB14EBE9EAF80@DM6PR12MB3116.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Gt3HVYd73dG9KHfJiSTnJ7Qen1oyXN/gPNJgAscyOP3fdlTrp9IlRpBAor/7HD/N6737SwL+4Z92qduPHH8Fs7gDcfXzo/RAf9+6BLi86jcnz63wa5hJ5T94mLk0bl6yPbO6emhLAizI+KG6RSLTEN1Z7+IZIg4puZboEzBAHIxRSDtSjLeeP2dLlLkoqRPG3s+8oWAzh6/rh9n3hz1S5j8r8mXC0uKCQ0+MwUjswRmluiavzMYJLUEmfHPuM+h39WbfGFPP97m4hypcUa2cF4n2sxmRJkn3Ubq40z1zKAXGe8v7BMf0rxXv5X41rfzEtPgRXiW55hqkSYjUUaBKNI/rKJHOUVN1rYjKfqOldv9FY8FlqfCMyewxfmBpmD5QSKP7kftiV+iuqsVRMQvW3/D6SjyVNhG0RlkC/pV8EV1Tv3vvmNz4Stq/B6sqWFnrM15p3dAWT5zd4VpJI3ICw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(66946007)(66446008)(66556008)(66476007)(9686003)(64756008)(71200400001)(6916009)(8676002)(55016002)(4326008)(8936002)(52536014)(166002)(76116006)(91956017)(86362001)(66574015)(2906002)(83380400001)(478600001)(316002)(966005)(33656002)(6506007)(54906003)(53546011)(7696005)(186003)(5660300002)(7416002)(87944003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?ZUcaCXG4rgx10/9Ei1I+/aqnFSf7O2f+oPwQYgf0kqAh3QHnBdURE2NU?=
 =?Windows-1252?Q?+6vmz5VMzgRqYaAlyFqEDliZhybK36z8TKEwe9be26F4CBSVVA4rXtju?=
 =?Windows-1252?Q?KeKSyKBKWvd7NLa5H5vtT75xvlqeK0zN1umJwhSYvalXHAFRRGXwnvUD?=
 =?Windows-1252?Q?bV4o7AMcVbTo9eguWwKZIhIULQ26/p1gPSPLd6HGCyLT5WKCTS5mx07j?=
 =?Windows-1252?Q?/vBZZH6YZ/VKf1Z5IaXNlkyaC7+R1zfIutDvC9t95Lyvxt/7Zcp6MUny?=
 =?Windows-1252?Q?67zGzATcHAyBpPZFYCbN8uQGf6RAzDb1wzjPgJfziRjAvPuJVRpnLzSh?=
 =?Windows-1252?Q?/Ip+kHzPCzf58g9I6VkycGKkofdNuBnjQUwhn3NdKcYDXE8gbhJ2Ux+W?=
 =?Windows-1252?Q?pP9t8c1vpaqIUjpOme1n8RKk9n37d6fwhqePSCTpUlurXlDW2dsAASOn?=
 =?Windows-1252?Q?DCHMdi7dLwnF7tlaO+ov7hhk8MAVbMP4kwNkFBmUc9Yn1klQCmdwjaGB?=
 =?Windows-1252?Q?KTUqMoyWyYjQj3Skrqx6LCXiHYwZuCBL8lFk5wqwUknrewCVX8Y+q1Cw?=
 =?Windows-1252?Q?9a+8pH1um7m4tOU79xN45oXCHz0++Hv6WVvKejPXqwvXgFKo9olId5Iy?=
 =?Windows-1252?Q?CALahX887B9TAfh2PyAndpI00vgOC1kogBG/SBG3k5b3L9QNOdpJRCUn?=
 =?Windows-1252?Q?SfDl3IyYmJG4skt7sBXmZsAX2gr8/gVdRc5rBjlK2Tm1J71M1rR+WjFO?=
 =?Windows-1252?Q?EmtIOIT5u1hEePhkT+bVVjQAKLeDGjFyCxPFbmcPvnRere71KTJpHpgA?=
 =?Windows-1252?Q?lVLlW9Ih6BrqBzmoicaGkyqEikyrBEM7gL0/LSew7hIycX6+7eewf9bS?=
 =?Windows-1252?Q?fGbmmZ8SYpFyfYYCrj8kNmIqW8rnQ1abKRK6Mtx0NshlgU8xVYvQHnTR?=
 =?Windows-1252?Q?Z5Rji9lFMgdF1PYcbjtvYdFgAy6Ho6ZlSf0WegdIEKHiqduVQivBdRjR?=
 =?Windows-1252?Q?8g00gF8d2etJ0yCp6GtFtKivyjZwIUIsOpdTLnezN8n5MJXUCYJ98UUg?=
 =?Windows-1252?Q?tZ5Hx71GmHwZeZWHqhZeucnqM+/UL3zq8wtB3tvSJHkqV2mlL3D0aRpm?=
 =?Windows-1252?Q?9Rw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2907a-43d0-46ff-8643-08d892d6119e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 13:12:18.8098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMXlr1Vj7QT3FCJi2S5D5rB1mbDtKyvpEO9HL7BYgd8LeUabbiMOX+x/PEiaO0soRjHZ1is608R/8Fycgv54gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?Windows-1252?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1919690942=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1919690942==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4340694885D1EE07361B330AEAF80DM6PR12MB4340namp_"

--_000_DM6PR12MB4340694885D1EE07361B330AEAF80DM6PR12MB4340namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hey, just a ping on my comments/question bellow.

Andrey
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: 25 November 2020 12:39
To: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; dri-devel <dri-devel@list=
s.freedesktop.org>; Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; R=
ob Herring <robh@kernel.org>; Lucas Stach <l.stach@pengutronix.de>; Qiang Y=
u <yuq825@gmail.com>; Anholt, Eric <eric@anholt.net>; Pekka Paalanen <ppaal=
anen@gmail.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Greg KH <g=
regkh@linuxfoundation.org>; Wentland, Harry <Harry.Wentland@amd.com>
Subject: Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal post dev=
ice unplug



On 11/25/20 4:04 AM, Daniel Vetter wrote:

On Tue, Nov 24, 2020 at 11:27 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com><mailto:Andrey.Grodzovsky@amd.com> wrote:




On 11/24/20 9:49 AM, Daniel Vetter wrote:


On Sat, Nov 21, 2020 at 12:21:20AM -0500, Andrey Grodzovsky wrote:


Avoids NULL ptr due to kobj->sd being unset on device removal.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com><mailto:andrey.=
grodzovsky@amd.com>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
  2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index caf828a..812e592 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -27,6 +27,7 @@
  #include <linux/uaccess.h>
  #include <linux/reboot.h>
  #include <linux/syscalls.h>
+#include <drm/drm_drv.h>

  #include "amdgpu.h"
  #include "amdgpu_ras.h"
@@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struc=
t amdgpu_device *adev)
             .attrs =3D attrs,
     };

-    sysfs_remove_group(&adev->dev->kobj, &group);
+    if (!drm_dev_is_unplugged(&adev->ddev))
+            sysfs_remove_group(&adev->dev->kobj, &group);


This looks wrong. sysfs, like any other interface, should be
unconditionally thrown out when we do the drm_dev_unregister. Whether
hotunplugged or not should matter at all. Either this isn't needed at all,
or something is wrong with the ordering here. But definitely fishy.
-Daniel




So technically this is needed because kobejct's sysfs directory entry kobj-=
>sd
is set to NULL
on device removal (from sysfs_remove_dir) but because we don't finalize the=
 device
until last reference to drm file is dropped (which can happen later) we end=
 up
calling sysfs_remove_file/dir after
this pointer is NULL. sysfs_remove_file checks for NULL and aborts while
sysfs_remove_dir
is not and that why I guard against calls to sysfs_remove_dir.
But indeed the whole approach in the driver is incorrect, as Greg pointed o=
ut -
we should use
default groups attributes instead of explicit calls to sysfs interface and =
this
would save those troubles.
But again. the issue here of scope of work, converting all of amdgpu to def=
ault
groups attributes is somewhat
lengthy process with extra testing as the entire driver is papered with sys=
fs
references and seems to me more of a standalone
cleanup, just like switching to devm_ and drmm_ work. To me at least it see=
ms
that it makes more sense
to finalize and push the hot unplug patches so that this new functionality =
can
be part of the driver sooner
and then incrementally improve it by working on those other topics. Just as
devm_/drmm_ I also added sysfs cleanup
to my TODO list in the RFC patch.



Hm, whether you solve this with the default group stuff to
auto-remove, or remove explicitly at the right time doesn't matter
much. The underlying problem you have here is that it's done way too
late.

As far as I understood correctly the default group attrs by reading this
article by Greg - https://www.linux.com/news/how-create-sysfs-file-correctl=
y/
it will be removed together with the device and not too late like now and I=
 quote
from the last paragraph there:

"By setting this value, you don=92t have to do anything in your
probe() or release() functions at all in order for the
sysfs files to be properly created and destroyed whenever your
device is added or removed from the system. And you will, most
importantly, do it in a race-free manner, which is always a good thing."

To me this seems like the best solution to the late remove issue. What do
you think ?


 sysfs removal (like all uapi interfaces) need to be removed as
part of drm_dev_unregister.


Do you mean we need to trace and aggregate all sysfs files creation within
the low level drivers and then call some sysfs release function inside drm_=
dev_unregister
to iterate and release them all ?


 I guess aside from the split into fini_hw
and fini_sw, you also need an unregister_late callback (like we have
already for drm_connector, so that e.g. backlight and similar stuff
can be unregistered).


Is this the callback you suggest to call from within drm_dev_unregister and
it will be responsible to release all sysfs files created within the driver=
 ?

Andrey




Papering over the underlying bug like this doesn't really fix much,
the lifetimes are still wrong.
-Daniel




Andrey








     return 0;
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ucode.c
index 2b7c90b..54331fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -24,6 +24,7 @@
  #include <linux/firmware.h>
  #include <linux/slab.h>
  #include <linux/module.h>
+#include <drm/drm_drv.h>

  #include "amdgpu.h"
  #include "amdgpu_ucode.h"
@@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)

  void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
  {
-    sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
+    if (!drm_dev_is_unplugged(&adev->ddev))
+            sysfs_remove_group(&adev->dev->kobj, &fw_attr_group);
  }

  static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
--
2.7.4








--_000_DM6PR12MB4340694885D1EE07361B330AEAF80DM6PR12MB4340namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div>Hey, just a ping on my comments/question bellow.</div>
<div><br>
</div>
<div>Andrey</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> 25 November 2020 12:39<br>
<b>To:</b> Daniel Vetter &lt;daniel@ffwll.ch&gt;<br>
<b>Cc:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel &l=
t;dri-devel@lists.freedesktop.org&gt;; Christian K=F6nig &lt;ckoenig.leicht=
zumerken@gmail.com&gt;; Rob Herring &lt;robh@kernel.org&gt;; Lucas Stach &l=
t;l.stach@pengutronix.de&gt;; Qiang Yu &lt;yuq825@gmail.com&gt;; Anholt,
 Eric &lt;eric@anholt.net&gt;; Pekka Paalanen &lt;ppaalanen@gmail.com&gt;; =
Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Greg KH &lt;gregkh@li=
nuxfoundation.org&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 10/12] drm/amdgpu: Avoid sysfs dirs removal p=
ost device unplug</font>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#FFFFFF">
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 11/25/20 4:04 AM, Daniel Vetter wrote:<=
br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">On Tue, Nov 24, 2020 at 11:27 PM Andrey Grod=
zovsky
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Andrey.Grodzovsky@amd.c=
om">&lt;Andrey.Grodzovsky@amd.com&gt;</a> wrote:
</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">

On 11/24/20 9:49 AM, Daniel Vetter wrote:
</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">On Sat, Nov 21, 2020 at 12:21:20AM -0500, An=
drey Grodzovsky wrote:
</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">Avoids NULL ptr due to kobj-&gt;sd being uns=
et on device removal.

Signed-off-by: Andrey Grodzovsky <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c   | 4 +++-
  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 +++-
  2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index caf828a..812e592 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -27,6 +27,7 @@
  #include &lt;linux/uaccess.h&gt;
  #include &lt;linux/reboot.h&gt;
  #include &lt;linux/syscalls.h&gt;
+#include &lt;drm/drm_drv.h&gt;

  #include &quot;amdgpu.h&quot;
  #include &quot;amdgpu_ras.h&quot;
@@ -1043,7 +1044,8 @@ static int amdgpu_ras_sysfs_remove_feature_node(struc=
t amdgpu_device *adev)
             .attrs =3D attrs,
     };

-    sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;group);
+    if (!drm_dev_is_unplugged(&amp;adev-&gt;ddev))
+            sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;group);
</pre>
</blockquote>
<pre class=3D"x_moz-quote-pre">This looks wrong. sysfs, like any other inte=
rface, should be
unconditionally thrown out when we do the drm_dev_unregister. Whether
hotunplugged or not should matter at all. Either this isn't needed at all,
or something is wrong with the ordering here. But definitely fishy.
-Daniel
</pre>
</blockquote>
<pre class=3D"x_moz-quote-pre">

So technically this is needed because kobejct's sysfs directory entry kobj-=
&gt;sd
is set to NULL
on device removal (from sysfs_remove_dir) but because we don't finalize the=
 device
until last reference to drm file is dropped (which can happen later) we end=
 up
calling sysfs_remove_file/dir after
this pointer is NULL. sysfs_remove_file checks for NULL and aborts while
sysfs_remove_dir
is not and that why I guard against calls to sysfs_remove_dir.
But indeed the whole approach in the driver is incorrect, as Greg pointed o=
ut -
we should use
default groups attributes instead of explicit calls to sysfs interface and =
this
would save those troubles.
But again. the issue here of scope of work, converting all of amdgpu to def=
ault
groups attributes is somewhat
lengthy process with extra testing as the entire driver is papered with sys=
fs
references and seems to me more of a standalone
cleanup, just like switching to devm_ and drmm_ work. To me at least it see=
ms
that it makes more sense
to finalize and push the hot unplug patches so that this new functionality =
can
be part of the driver sooner
and then incrementally improve it by working on those other topics. Just as
devm_/drmm_ I also added sysfs cleanup
to my TODO list in the RFC patch.
</pre>
</blockquote>
<pre class=3D"x_moz-quote-pre">
Hm, whether you solve this with the default group stuff to
auto-remove, or remove explicitly at the right time doesn't matter
much. The underlying problem you have here is that it's done way too
late.</pre>
</blockquote>
<p>As far as I understood correctly the default group attrs by reading this=
<br>
article by Greg - <a class=3D"x_moz-txt-link-freetext" href=3D"https://www.=
linux.com/news/how-create-sysfs-file-correctly/">
https://www.linux.com/news/how-create-sysfs-file-correctly/</a><br>
it will be removed together with the device and not too late like now and I=
 quote<br>
from the last paragraph there:</p>
<p>&quot;<span style=3D"color:rgb(34,34,34); font-family:Verdana,Geneva,san=
s-serif; font-size:15px; font-style:normal; font-variant-ligatures:normal; =
font-variant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; widows:2; word-spacing:0px; background-color:rgb(255,255,255); text-deco=
ration-style:initial; text-decoration-color:initial; display:inline!importa=
nt; float:none">By
 setting this value, you don=92t have to do anything in your</span><br styl=
e=3D"box-sizing:border-box; color:rgb(34,34,34); font-family:Verdana,Geneva=
,sans-serif; font-size:15px; font-style:normal; font-variant-ligatures:norm=
al; font-variant-caps:normal; font-weight:400; letter-spacing:normal; orpha=
ns:2; text-align:start; text-indent:0px; text-transform:none; white-space:n=
ormal; widows:2; word-spacing:0px; background-color:rgb(255,255,255); text-=
decoration-style:initial; text-decoration-color:initial">
<tt style=3D"box-sizing:border-box; color:rgb(34,34,34); font-size:15px; fo=
nt-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; f=
ont-weight:400; letter-spacing:normal; orphans:2; text-align:start; text-in=
dent:0px; text-transform:none; white-space:normal; widows:2; word-spacing:0=
px; background-color:rgb(255,255,255); text-decoration-style:initial; text-=
decoration-color:initial">probe()</tt><span style=3D"color:rgb(34,34,34); f=
ont-family:Verdana,Geneva,sans-serif; font-size:15px; font-style:normal; fo=
nt-variant-ligatures:normal; font-variant-caps:normal; font-weight:400; let=
ter-spacing:normal; orphans:2; text-align:start; text-indent:0px; text-tran=
sform:none; white-space:normal; widows:2; word-spacing:0px; background-colo=
r:rgb(255,255,255); text-decoration-style:initial; text-decoration-color:in=
itial; display:inline!important; float:none">&nbsp;or&nbsp;</span><tt style=
=3D"box-sizing:border-box; color:rgb(34,34,34); font-size:15px; font-style:=
normal; font-variant-ligatures:normal; font-variant-caps:normal; font-weigh=
t:400; letter-spacing:normal; orphans:2; text-align:start; text-indent:0px;=
 text-transform:none; white-space:normal; widows:2; word-spacing:0px; backg=
round-color:rgb(255,255,255); text-decoration-style:initial; text-decoratio=
n-color:initial">release()</tt><span style=3D"color:rgb(34,34,34); font-fam=
ily:Verdana,Geneva,sans-serif; font-size:15px; font-style:normal; font-vari=
ant-ligatures:normal; font-variant-caps:normal; font-weight:400; letter-spa=
cing:normal; orphans:2; text-align:start; text-indent:0px; text-transform:n=
one; white-space:normal; widows:2; word-spacing:0px; background-color:rgb(2=
55,255,255); text-decoration-style:initial; text-decoration-color:initial; =
display:inline!important; float:none">&nbsp;functions
 at all in order for the</span><br style=3D"box-sizing:border-box; color:rg=
b(34,34,34); font-family:Verdana,Geneva,sans-serif; font-size:15px; font-st=
yle:normal; font-variant-ligatures:normal; font-variant-caps:normal; font-w=
eight:400; letter-spacing:normal; orphans:2; text-align:start; text-indent:=
0px; text-transform:none; white-space:normal; widows:2; word-spacing:0px; b=
ackground-color:rgb(255,255,255); text-decoration-style:initial; text-decor=
ation-color:initial">
<tt style=3D"box-sizing:border-box; color:rgb(34,34,34); font-size:15px; fo=
nt-style:normal; font-variant-ligatures:normal; font-variant-caps:normal; f=
ont-weight:400; letter-spacing:normal; orphans:2; text-align:start; text-in=
dent:0px; text-transform:none; white-space:normal; widows:2; word-spacing:0=
px; background-color:rgb(255,255,255); text-decoration-style:initial; text-=
decoration-color:initial">sysfs</tt><span style=3D"color:rgb(34,34,34); fon=
t-family:Verdana,Geneva,sans-serif; font-size:15px; font-style:normal; font=
-variant-ligatures:normal; font-variant-caps:normal; font-weight:400; lette=
r-spacing:normal; orphans:2; text-align:start; text-indent:0px; text-transf=
orm:none; white-space:normal; widows:2; word-spacing:0px; background-color:=
rgb(255,255,255); text-decoration-style:initial; text-decoration-color:init=
ial; display:inline!important; float:none">&nbsp;files
 to be properly created and destroyed whenever your</span><br style=3D"box-=
sizing:border-box; color:rgb(34,34,34); font-family:Verdana,Geneva,sans-ser=
if; font-size:15px; font-style:normal; font-variant-ligatures:normal; font-=
variant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2; tex=
t-align:start; text-indent:0px; text-transform:none; white-space:normal; wi=
dows:2; word-spacing:0px; background-color:rgb(255,255,255); text-decoratio=
n-style:initial; text-decoration-color:initial">
<span style=3D"color:rgb(34,34,34); font-family:Verdana,Geneva,sans-serif; =
font-size:15px; font-style:normal; font-variant-ligatures:normal; font-vari=
ant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2; text-al=
ign:start; text-indent:0px; text-transform:none; white-space:normal; widows=
:2; word-spacing:0px; background-color:rgb(255,255,255); text-decoration-st=
yle:initial; text-decoration-color:initial; display:inline!important; float=
:none">device
 is added or removed from the system. And you will, most</span><br style=3D=
"box-sizing:border-box; color:rgb(34,34,34); font-family:Verdana,Geneva,san=
s-serif; font-size:15px; font-style:normal; font-variant-ligatures:normal; =
font-variant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2=
; text-align:start; text-indent:0px; text-transform:none; white-space:norma=
l; widows:2; word-spacing:0px; background-color:rgb(255,255,255); text-deco=
ration-style:initial; text-decoration-color:initial">
<span style=3D"color:rgb(34,34,34); font-family:Verdana,Geneva,sans-serif; =
font-size:15px; font-style:normal; font-variant-ligatures:normal; font-vari=
ant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2; text-al=
ign:start; text-indent:0px; text-transform:none; white-space:normal; widows=
:2; word-spacing:0px; background-color:rgb(255,255,255); text-decoration-st=
yle:initial; text-decoration-color:initial; display:inline!important; float=
:none">importantly,
 do it in a race-free manner, which is always a good thing.&quot;</span></p=
>
<p><span style=3D"color:rgb(34,34,34); font-size:15px; font-style:normal; f=
ont-variant-ligatures:normal; font-variant-caps:normal; font-weight:400; le=
tter-spacing:normal; text-align:start; text-indent:0px; text-transform:none=
; white-space:normal; word-spacing:0px; background-color:rgb(255,255,255); =
text-decoration-style:initial; text-decoration-color:initial; display:inlin=
e!important; float:none">To
 me this seems like the best solution to the late remove issue. What do<br>
you think ?</span></p>
<p><span style=3D"color:rgb(34,34,34); font-family:Verdana,Geneva,sans-seri=
f; font-size:15px; font-style:normal; font-variant-ligatures:normal; font-v=
ariant-caps:normal; font-weight:400; letter-spacing:normal; orphans:2; text=
-align:start; text-indent:0px; text-transform:none; white-space:normal; wid=
ows:2; word-spacing:0px; background-color:rgb(255,255,255); text-decoration=
-style:initial; text-decoration-color:initial; display:inline!important; fl=
oat:none"><br>
</span></p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre"> sysfs removal (like all uapi interfaces) ne=
ed to be removed as
part of drm_dev_unregister.</pre>
</blockquote>
<p><br>
</p>
<p>Do you mean we need to trace and aggregate all sysfs files creation with=
in<br>
the low level drivers and then call some sysfs release function inside drm_=
dev_unregister<br>
to iterate and release them all ?</p>
<p><br>
</p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre"> I guess aside from the split into fini_hw
and fini_sw, you also need an unregister_late callback (like we have
already for drm_connector, so that e.g. backlight and similar stuff
can be unregistered).</pre>
</blockquote>
<p><br>
</p>
<p>Is this the callback you suggest to call from within drm_dev_unregister =
and<br>
it will be responsible to release all sysfs files created within the driver=
 ?</p>
<p>Andrey</p>
<p><br>
</p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">

Papering over the underlying bug like this doesn't really fix much,
the lifetimes are still wrong.
-Daniel

</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">
Andrey


</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">
</pre>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">
     return 0;
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ucode.c
index 2b7c90b..54331fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -24,6 +24,7 @@
  #include &lt;linux/firmware.h&gt;
  #include &lt;linux/slab.h&gt;
  #include &lt;linux/module.h&gt;
+#include &lt;drm/drm_drv.h&gt;

  #include &quot;amdgpu.h&quot;
  #include &quot;amdgpu_ucode.h&quot;
@@ -464,7 +465,8 @@ int amdgpu_ucode_sysfs_init(struct amdgpu_device *adev)

  void amdgpu_ucode_sysfs_fini(struct amdgpu_device *adev)
  {
-    sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;fw_attr_group);
+    if (!drm_dev_is_unplugged(&amp;adev-&gt;ddev))
+            sysfs_remove_group(&amp;adev-&gt;dev-&gt;kobj, &amp;fw_attr_gr=
oup);
  }

  static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
--
2.7.4

</pre>
</blockquote>
</blockquote>
</blockquote>
<pre class=3D"x_moz-quote-pre">


</pre>
</blockquote>
</div>
</body>
</html>

--_000_DM6PR12MB4340694885D1EE07361B330AEAF80DM6PR12MB4340namp_--

--===============1919690942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1919690942==--
