Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E13D6512
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AA872EB7;
	Mon, 26 Jul 2021 17:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F7C6FEFE;
 Mon, 26 Jul 2021 17:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzWuOeBe5UapLFWA/eblWdu5+W0BW63buj6R7APG98c0LWBo+gOIbXZ4RLlm75kizavVIYNtTT6Tu/EFbKDUAMJTPs9fvTilnQPXnD5mqld2yqkk70LGCWYkUF5dtbWfrKRUy1r5LuwMOyOgiVRWFBmlIF+hiDxHSJpUNyvhWGfVhhRbYQJbT3g+xH339ofjdHJtSyXGjNAfv0z1wjG+Q6bpA76jhB4JNSnQGx4NTAi/CzUmXyK7KJ1FYkR3Uf5wRVy/XnbtMe66GIkL6LdFoKyagYUN1yEdTSHoG9KWz2WZQZNsMBr2+f7/u6D6bmj4Kq7j2c+KmLLKwwjhSFBoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ9TzzJ4XtGBtIdf9kSeW/GE4Ri1Y6aV0E5K0kHJjbI=;
 b=R0nUM/juTryU2EBlzIkhae3KgDHSxn2cT4PRvPB4wzj4HPR9JdqIW69zFd5s3dkjEuw4GHp/NjTmGvdnIeVSXnk0hyorjSMVBx5HodLX+c28qmLA+WnmS3/VB9EJzcZ72ncYVa8bVGfkmxabrQdtz1u+pilFLubIaQzFzaL2nM6Njx+Ckab2PFgnn/MTt/cmr95YKnhQdFTsb64Fb1trbM1Vn4DMvTIedqiyaMNOuCTvU7T3GeuXLHBJsLWI0LM/uYA/9G3+nIoHo/D+5JHARyL6Nb0xbluyBsKlWe0vTH0IGWnFjFGjTFhOSxCjZDV4Tl0RX7IMb02M0Jm8WHkxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ9TzzJ4XtGBtIdf9kSeW/GE4Ri1Y6aV0E5K0kHJjbI=;
 b=UkIuC2NGjWIjw1MNB2S+UZ7NmSAZNnvi3xL0k8rgZNUJG+jSVTRpiYGpcFsDTcevLLjavkVbC5BVqCSRBDmGxugieqUZe5jLBFoimEBLsJ3Ua7rWHOTzSx5fp1B9sjbzKybrksLY9zIKPaH8uMfQSSpc8+SeX1LESLAyN+4/on0=
Received: from MN2PR12MB3232.namprd12.prod.outlook.com (2603:10b6:208:ab::29)
 by MN2PR12MB3360.namprd12.prod.outlook.com (2603:10b6:208:c7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 17:02:43 +0000
Received: from MN2PR12MB3232.namprd12.prod.outlook.com
 ([fe80::6069:6779:c25:af69]) by MN2PR12MB3232.namprd12.prod.outlook.com
 ([fe80::6069:6779:c25:af69%6]) with mapi id 15.20.4331.034; Mon, 26 Jul 2021
 17:02:43 +0000
From: "Taylor, Ryan" <Ryan.Taylor@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Topic: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Index: AQHXflLkCy71la2rCUa2W87adSo8CKtQokmAgADCeoCABBMNAIAABAwVgAAGgICAAADFwQ==
Date: Mon, 26 Jul 2021 17:02:43 +0000
Message-ID: <MN2PR12MB3232616CA236BAB8A669F2F4EAE89@MN2PR12MB3232.namprd12.prod.outlook.com>
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-2-Ryan.Taylor@amd.com>
 <CADnq5_NYP4Gp7DntrnSaSGHuZYzSs_1DfMAjUQv+ksE1jJ9ohw@mail.gmail.com>
 <DM5PR12MB2469E019BB91B58EA547B628F1E69@DM5PR12MB2469.namprd12.prod.outlook.com>
 <CADnq5_OnYuMrZ_s6XtYQeJR1dgqdoC4rnv5DKc3h4hEo0k+RVQ@mail.gmail.com>
 <MN2PR12MB32321AC70CD4369076E74E4FEAE89@MN2PR12MB3232.namprd12.prod.outlook.com>,
 <CADnq5_Nxrvm3JXheexoX5ftLxmeoS9O+8RECu1PV7ge7VN0Vyg@mail.gmail.com>
In-Reply-To: <CADnq5_Nxrvm3JXheexoX5ftLxmeoS9O+8RECu1PV7ge7VN0Vyg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-26T17:02:42.824Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76e96cbf-b84b-47e8-c9b7-08d950572f41
x-ms-traffictypediagnostic: MN2PR12MB3360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3360AF56E5B8D66F58640B18EAE89@MN2PR12MB3360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGaIBofkckK+jq2GYBTxCSacSJLWlWtuqvDEuyGZSwMt8xasv543Rz+d8ELKAGpoJhatjX6Ic27UYX1GwN3wtOcgXWqGG0lA7d/A4sHl+sdPj3bA7rLt8+TM9SgLvGHl4XghxaANTu8N/v2FAaUWzDmvVDpHl8RiDspygMwa3UWZNcVZLOb9AKbnSy98D+RChIhOErXZ5vvpNIpJAEFVdsVnmKHCRxmla+HydH18QKnxOodqORqrZSeIrpTBG8VE3Wh/BxOYGG1VM5/e6G292F8oCyRfvdOerAhLbRLR+y3TVpHARjFpJH5a9Me+WgQlJgxCZCwGX2vDE2u8OVAUqr1XSkgR+VI/ol25RHVrlMJZnSxQtrycFdaseP5ID4tDhXXWIaf0eZAaLv8E8W266ig8B432b+w0jVFf9U+YlcWYfEJ/6jXmIIF2fNfueCQbeQQyvwQsCBerTUY+Ff1C0vgZLco/KHQrTa91zlNmccurpw25QD1e3JFtPR4WIvKxBwSFwwqNm5Gzat/H4O7IY7kZ0Rna5mXws/Xhgk1rmVMFuzhqIoEmdxR7Yk/Tc8Auiu4+X1ciZahciamRMqWthroWGHJ4ITOo+C3ZEfkAeMvyxIU4LASe3jCbWwz0JFH94cSCDAyKwjllYn7yrD+mj65v/ra3sGRpIRWSULDZZ561T3FsOMPPaX4/bQvi1CdccC3JJqGYLvTosVwwhRdBrds7+4ubUyKyfFc0wN7c83KbT16T3b6TgwQepFFIXr9q+A6skMmA6rFfAbaR4DyCSOw2lQhIR1EfNA85SAPHDSQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3232.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(55016002)(6506007)(966005)(4326008)(508600001)(9686003)(8936002)(45080400002)(5660300002)(8676002)(53546011)(86362001)(64756008)(166002)(7696005)(316002)(83380400001)(66476007)(54906003)(71200400001)(66556008)(122000001)(38100700002)(76116006)(66946007)(2906002)(52536014)(6916009)(19627405001)(186003)(30864003)(33656002)(38070700004)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?COcjI4pUlRsrfT6NHL1tZIUyfu/Bl0HmZhAgLWmtcwviZn6r9AR0j5Hm/q/1?=
 =?us-ascii?Q?zLuRA014J642e+s4toyzOctX9iFsXMzzpYZXKesffhSNDX6RpRXDPA+KYwAK?=
 =?us-ascii?Q?zAG3DP/cAKUjZ9c0uF/WhbD2mXiw78zu1/rwQXDcZkwLlVqeUUYK1e99RrZc?=
 =?us-ascii?Q?HMCMFkhWHbEyxUy6Z2kH30uOAE0nIF5Yq2ceB2XTlYJZtCL7NecYeRrGyN6f?=
 =?us-ascii?Q?FXUnfJil40vNf752Pj1cw5epKOaenrB8IvCGhpt7yIjd2LSUKZRVwcBwILqy?=
 =?us-ascii?Q?i4+XCJGmLokMJNXBGdrkaw76Y8wF8AuYi6x7NGGrD4+yhV8RV89AQVwOj+X+?=
 =?us-ascii?Q?wsOqMYrPEXscWIfWXW1t4KpeOQWfbY7ufpBeZKuj6cEu+4BUdy8O+fSGf9M6?=
 =?us-ascii?Q?TK9elOmkVmIc6qvEC+AaWF9rAcxZ1OEFOEdeptLhox8UigzRRNL8pOErRMhk?=
 =?us-ascii?Q?RxltErgqWKENzrUlvqG8izz96SWhp5LPhmYruaHRZQKPL/CI3sQwDiLydIKi?=
 =?us-ascii?Q?Qs6kJTnqp1XqanlOG7SvdtfYxthLrL8qaa0n/gWzGitzNGZOckPTDqYawA6n?=
 =?us-ascii?Q?cx0Fx4dfpy6lUVPrHJj9IdRUi6a/A8kb8MPs/fmGKjb+I033Uv/XwEjDF0D+?=
 =?us-ascii?Q?9W9o37q9YU8WxTsZ701VkC9cPYm6im5ON7p5Vbx2YjqpbFH6Gzcr/pRTI0T1?=
 =?us-ascii?Q?WJ2Qx3CvtI5h/jiJHkMP5CHzqjT5mauOfyx2KHs7VNkucu9FPiqEWYlWGuEP?=
 =?us-ascii?Q?ijtAmattNXkYoeA2pwpFpdGZP8APxMMozY0p3VhneoDyuC1mQVVi0RZE1QSb?=
 =?us-ascii?Q?pVEqkpe95ydn6uGOwhD1IEW1jdy+TWkBQqKXP8iDO+gWaNoraJSjVmsuWRzd?=
 =?us-ascii?Q?gdSxd/o01VGZI2sxvz9jUt+VZ+3LLTZTOnIbZyGcocwuKptm0LazXMEpPii3?=
 =?us-ascii?Q?RC9Y5JnkArJ44gkgARBfTSKkS5M7qr5OkZT3XTSwCpklgkI4G1k1ylriAYpn?=
 =?us-ascii?Q?vZv+0uIUscCPQ2zsZQqNmP+sx7OBtuknQpMY39x8XvOjH1Az4XWoguVRmbs7?=
 =?us-ascii?Q?chGim4WovxdnKsLz2/Zacbzgz19dphrNieqgBJKjKiKy5Dl3IVVqsA0hK4ET?=
 =?us-ascii?Q?JlmiVDWYy2MqBbAzXcfbdixwDzjiDC4FnVcMIFlkOJXpjJzhgFSodyOjgqe9?=
 =?us-ascii?Q?C6rMSU8WNjZVrGf8EGMAOcgX4b10YZzkP/XLd6c+1wjs21k5KFA3lJOSsyk+?=
 =?us-ascii?Q?ik7+8Cc1h9uQnaSat1ZI42o8douocUbJOlGUtfcxX+m45QieR9dmJ5iV0ALN?=
 =?us-ascii?Q?Son/PCHz6EgZSSs1D/eQaQ2VXpPrDfknfWpPpkXWamW+r0nQgeinAcZeDfhN?=
 =?us-ascii?Q?k/kcUvqLKm326/Lh6+uROj1AcTt2?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB3232616CA236BAB8A669F2F4EAE89MN2PR12MB3232namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3232.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e96cbf-b84b-47e8-c9b7-08d950572f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 17:02:43.3633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+xuk+IOz6aGOVkiDJxDUwjDPaHRE7b3V73RdvcusG/1+Nad5pVSWkdZbuL+Gb1ExuL4KcGVmSlGf1LcVdZujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3360
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
Cc: kernel test robot <lkp@intel.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MN2PR12MB3232616CA236BAB8A669F2F4EAE89MN2PR12MB3232namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Sounds good, Thanks for clarifying. Thanks for the input Guchun.

Best,
Ryan
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Monday, July 26, 2021 9:58 AM
To: Taylor, Ryan <Ryan.Taylor@amd.com>
Cc: Chen, Guchun <Guchun.Chen@amd.com>; kernel test robot <lkp@intel.com>; =
Daniel Vetter <daniel.vetter@ffwll.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira=
@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Melissa Wen <melis=
sa.srw@gmail.com>; Maling list - DRI developers <dri-devel@lists.freedeskto=
p.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)

On Mon, Jul 26, 2021 at 12:39 PM Taylor, Ryan <Ryan.Taylor@amd.com> wrote:
>
> [AMD Official Use Only]
>
>
> Given that amdgpu_vkms contains code from both dce_virtual and vkms shoul=
d the identifier be changed to GPL-2.0+ OR MIT like in amdgpu_res_cursor.h?

Most of the code is from vkms so match vkms.

Alex


>
> Best,
> Ryan
> ________________________________
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Monday, July 26, 2021 9:21 AM
> To: Chen, Guchun <Guchun.Chen@amd.com>
> Cc: Taylor, Ryan <Ryan.Taylor@amd.com>; kernel test robot <lkp@intel.com>=
; Daniel Vetter <daniel.vetter@ffwll.ch>; Siqueira, Rodrigo <Rodrigo.Siquei=
ra@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Melissa Wen <mel=
issa.srw@gmail.com>; Maling list - DRI developers <dri-devel@lists.freedesk=
top.org>
> Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
>
> On Fri, Jul 23, 2021 at 10:07 PM Chen, Guchun <Guchun.Chen@amd.com> wrote=
:
> >
> > [Public]
> >
> > Look copy right statement is missed in both amdgpu_vkms.c and amdgpu_vk=
ms.h.
>
> It's there, it just uses the newer SPDX license identifier.
>
> Alex
>
>
> >
> > Regards,
> > Guchun
> >
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex=
 Deucher
> > Sent: Friday, July 23, 2021 10:32 PM
> > To: Taylor, Ryan <Ryan.Taylor@amd.com>
> > Cc: kernel test robot <lkp@intel.com>; Daniel Vetter <daniel.vetter@ffw=
ll.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; amd-gfx list <amd-gfx=
@lists.freedesktop.org>; Melissa Wen <melissa.srw@gmail.com>; Maling list -=
 DRI developers <dri-devel@lists.freedesktop.org>
> > Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
> >
> > On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote=
:
> > >
> > > Modify the VKMS driver into an api that dce_virtual can use to create
> > > virtual displays that obey drm's atomic modesetting api.
> > >
> > > v2: Made local functions static.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411
> > > +++++++++++++++++++++++  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |
> > > 29 ++  drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
> > >  7 files changed, 458 insertions(+), 11 deletions(-)  create mode
> > > 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
> > > b/drivers/gpu/drm/amd/amdgpu/Makefile
> > > index f089794bbdd5..30cbcd5ce1cc 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> > > +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> > > @@ -120,6 +120,7 @@ amdgpu-y +=3D \
> > >  amdgpu-y +=3D \
> > >         dce_v10_0.o \
> > >         dce_v11_0.o \
> > > +       amdgpu_vkms.o \
> > >         dce_virtual.o
> > >
> > >  # add GFX block
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > index 54cf647bd018..d0a2f2ed433d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -919,6 +919,7 @@ struct amdgpu_device {
> > >
> > >         /* display */
> > >         bool                            enable_virtual_display;
> > > +       struct amdgpu_vkms_output       *amdgpu_vkms_output;
> > >         struct amdgpu_mode_info         mode_info;
> > >         /* For pre-DCE11. DCE11 and later are in "struct amdgpu_devic=
e->dm" */
> > >         struct work_struct              hotplug_work;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > index d0c935cf4f0f..1b016e5bc75f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev *pde=
v,
> > >         int ret, retry =3D 0;
> > >         bool supports_atomic =3D false;
> > >
> > > -       if (!amdgpu_virtual_display &&
> > > +       if (amdgpu_virtual_display ||
> > >             amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
> > >                 supports_atomic =3D true;
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > > index 09b048647523..5a143ca02cf9 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > > @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
> > >         }
> > >
> > >         /* disable all the possible outputs/crtcs before entering KMS=
 mode */
> > > -       if (!amdgpu_device_has_dc_support(adev))
> > > +       if (!amdgpu_device_has_dc_support(adev) &&
> > > + !amdgpu_virtual_display)
> > >
> > > drm_helper_disable_unused_functions(adev_to_drm(adev));
> > >
> > >         drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel); diff
> > > --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > > new file mode 100644
> > > index 000000000000..d5c1f1c58f5f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > > @@ -0,0 +1,411 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_simple_kms_helper.h> #include <drm/drm_vblank.h>
> > > +
> > > +#include "amdgpu.h"
> > > +#include "amdgpu_vkms.h"
> > > +#include "amdgpu_display.h"
> > > +
> > > +/**
> > > + * DOC: amdgpu_vkms
> > > + *
> > > + * The amdgpu vkms interface provides a virtual KMS interface for
> > > +several use
> > > + * cases: devices without display hardware, platforms where the
> > > +actual display
> > > + * hardware is not useful (e.g., servers), SR-IOV virtual functions,
> > > +device
> > > + * emulation/simulation, and device bring up prior to display
> > > +hardware being
> > > + * usable. We previously emulated a legacy KMS interface, but there
> > > +was a desire
> > > + * to move to the atomic KMS interface. The vkms driver did
> > > +everything we
> > > + * needed, but we wanted KMS support natively in the driver without
> > > +buffer
> > > + * sharing and the ability to support an instance of VKMS per device=
.
> > > +We first
> > > + * looked at splitting vkms into a stub driver and a helper module
> > > +that other
> > > + * drivers could use to implement a virtual display, but this
> > > +strategy ended up
> > > + * being messy due to driver specific callbacks needed for buffer ma=
nagement.
> > > + * Ultimately, it proved easier to import the vkms code as it mostly
> > > +used core
> > > + * drm helpers anyway.
> > > + */
> > > +
> > > +static const u32 amdgpu_vkms_formats[] =3D {
> > > +       DRM_FORMAT_XRGB8888,
> > > +};
> > > +
> > > +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct
> > > +hrtimer *timer) {
> > > +       struct amdgpu_vkms_output *output =3D container_of(timer,
> > > +                                                        struct amdgp=
u_vkms_output,
> > > +                                                        vblank_hrtim=
er);
> > > +       struct drm_crtc *crtc =3D &output->crtc;
> > > +       u64 ret_overrun;
> > > +       bool ret;
> > > +
> > > +       ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> > > +                                         output->period_ns);
> > > +       WARN_ON(ret_overrun !=3D 1);
> > > +
> > > +       ret =3D drm_crtc_handle_vblank(crtc);
> > > +       if (!ret)
> > > +               DRM_ERROR("amdgpu_vkms failure on handling vblank");
> > > +
> > > +       return HRTIMER_RESTART;
> > > +}
> > > +
> > > +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc) {
> > > +       struct drm_device *dev =3D crtc->dev;
> > > +       unsigned int pipe =3D drm_crtc_index(crtc);
> > > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > > +       struct amdgpu_vkms_output *out =3D
> > > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > > +
> > > +       drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > +
> > > +       hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_M=
ODE_REL);
> > > +       out->vblank_hrtimer.function =3D &amdgpu_vkms_vblank_simulate=
;
> > > +       out->period_ns =3D ktime_set(0, vblank->framedur_ns);
> > > +       hrtimer_start(&out->vblank_hrtimer, out->period_ns,
> > > + HRTIMER_MODE_REL);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc) {
> > > +       struct amdgpu_vkms_output *out =3D
> > > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > > +
> > > +       hrtimer_cancel(&out->vblank_hrtimer);
> > > +}
> > > +
> > > +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> > > +                                            int *max_error,
> > > +                                            ktime_t *vblank_time,
> > > +                                            bool in_vblank_irq) {
> > > +       struct drm_device *dev =3D crtc->dev;
> > > +       unsigned int pipe =3D crtc->index;
> > > +       struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms=
_output(crtc);
> > > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > > +
> > > +       if (!READ_ONCE(vblank->enabled)) {
> > > +               *vblank_time =3D ktime_get();
> > > +               return true;
> > > +       }
> > > +
> > > +       *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expire=
s);
> > > +
> > > +       if (WARN_ON(*vblank_time =3D=3D vblank->time))
> > > +               return true;
> > > +
> > > +       /*
> > > +        * To prevent races we roll the hrtimer forward before we do =
any
> > > +        * interrupt processing - this is how real hw works (the inte=
rrupt is
> > > +        * only generated after all the vblank registers are updated)=
 and what
> > > +        * the vblank core expects. Therefore we need to always corre=
ct the
> > > +        * timestampe by one frame.
> > > +        */
> > > +       *vblank_time -=3D output->period_ns;
> > > +
> > > +       return true;
> > > +}
> > > +
> > > +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =3D {
> > > +       .set_config             =3D drm_atomic_helper_set_config,
> > > +       .destroy                =3D drm_crtc_cleanup,
> > > +       .page_flip              =3D drm_atomic_helper_page_flip,
> > > +       .reset                  =3D drm_atomic_helper_crtc_reset,
> > > +       .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_=
state,
> > > +       .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_st=
ate,
> > > +       .enable_vblank          =3D amdgpu_vkms_enable_vblank,
> > > +       .disable_vblank         =3D amdgpu_vkms_disable_vblank,
> > > +       .get_vblank_timestamp   =3D amdgpu_vkms_get_vblank_timestamp,
> > > +};
> > > +
> > > +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +                                          struct drm_atomic_state
> > > +*state) {
> > > +       drm_crtc_vblank_on(crtc);
> > > +}
> > > +
> > > +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +                                           struct drm_atomic_state
> > > +*state) {
> > > +       drm_crtc_vblank_off(crtc);
> > > +}
> > > +
> > > +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +                                         struct drm_atomic_state
> > > +*state) {
> > > +       if (crtc->state->event) {
> > > +               spin_lock(&crtc->dev->event_lock);
> > > +
> > > +               if (drm_crtc_vblank_get(crtc) !=3D 0)
> > > +                       drm_crtc_send_vblank_event(crtc, crtc->state-=
>event);
> > > +               else
> > > +                       drm_crtc_arm_vblank_event(crtc,
> > > + crtc->state->event);
> > > +
> > > +               spin_unlock(&crtc->dev->event_lock);
> > > +
> > > +               crtc->state->event =3D NULL;
> > > +       }
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_fu=
ncs =3D {
> > > +       .atomic_flush   =3D amdgpu_vkms_crtc_atomic_flush,
> > > +       .atomic_enable  =3D amdgpu_vkms_crtc_atomic_enable,
> > > +       .atomic_disable =3D amdgpu_vkms_crtc_atomic_disable, };
> > > +
> > > +static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_=
crtc *crtc,
> > > +                         struct drm_plane *primary, struct drm_plane
> > > +*cursor) {
> > > +       int ret;
> > > +
> > > +       ret =3D drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > > +                                       &amdgpu_vkms_crtc_funcs, NULL=
);
> > > +       if (ret) {
> > > +               DRM_ERROR("Failed to init CRTC\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static const struct drm_connector_funcs amdgpu_vkms_connector_funcs =
=3D {
> > > +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > > +       .destroy =3D drm_connector_cleanup,
> > > +       .reset =3D drm_atomic_helper_connector_reset,
> > > +       .atomic_duplicate_state =3D drm_atomic_helper_connector_dupli=
cate_state,
> > > +       .atomic_destroy_state =3D
> > > +drm_atomic_helper_connector_destroy_state,
> > > +};
> > > +
> > > +static int amdgpu_vkms_conn_get_modes(struct drm_connector
> > > +*connector) {
> > > +       int count;
> > > +
> > > +       count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX)=
;
> > > +       drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> > > +
> > > +       return count;
> > > +}
> > > +
> > > +static const struct drm_connector_helper_funcs amdgpu_vkms_conn_help=
er_funcs =3D {
> > > +       .get_modes    =3D amdgpu_vkms_conn_get_modes,
> > > +};
> > > +
> > > +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs =3D {
> > > +       .update_plane           =3D drm_atomic_helper_update_plane,
> > > +       .disable_plane          =3D drm_atomic_helper_disable_plane,
> > > +       .destroy                =3D drm_plane_cleanup,
> > > +       .reset                  =3D drm_atomic_helper_plane_reset,
> > > +       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate=
_state,
> > > +       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_s=
tate,
> > > +};
> > > +
> > > +static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
> > > +                                           struct drm_plane_state
> > > +*old_state) {
> > > +       return;
> > > +}
> > > +
> > > +static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
> > > +                                         struct drm_plane_state
> > > +*state) {
> > > +       struct drm_crtc_state *crtc_state;
> > > +       bool can_position =3D false;
> > > +       int ret;
> > > +
> > > +       if (!state->fb || WARN_ON(!state->crtc))
> > > +               return 0;
> > > +
> > > +       crtc_state =3D drm_atomic_get_crtc_state(state->state, state-=
>crtc);
> > > +       if (IS_ERR(crtc_state))
> > > +               return PTR_ERR(crtc_state);
> > > +
> > > +       ret =3D drm_atomic_helper_check_plane_state(state, crtc_state=
,
> > > +                                                 DRM_PLANE_HELPER_NO=
_SCALING,
> > > +                                                 DRM_PLANE_HELPER_NO=
_SCALING,
> > > +                                                 can_position, true)=
;
> > > +       if (ret !=3D 0)
> > > +               return ret;
> > > +
> > > +       /* for now primary plane must be visible and full screen */
> > > +       if (!state->visible && !can_position)
> > > +               return -EINVAL;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
> > > +                                 struct drm_plane_state *new_state) =
{
> > > +       struct amdgpu_framebuffer *afb;
> > > +       struct drm_gem_object *obj;
> > > +       struct amdgpu_device *adev;
> > > +       struct amdgpu_bo *rbo;
> > > +       struct list_head list;
> > > +       struct ttm_validate_buffer tv;
> > > +       struct ww_acquire_ctx ticket;
> > > +       uint32_t domain;
> > > +       int r;
> > > +
> > > +       if (!new_state->fb) {
> > > +               DRM_DEBUG_KMS("No FB bound\n");
> > > +               return 0;
> > > +       }
> > > +       afb =3D to_amdgpu_framebuffer(new_state->fb);
> > > +       obj =3D new_state->fb->obj[0];
> > > +       rbo =3D gem_to_amdgpu_bo(obj);
> > > +       adev =3D amdgpu_ttm_adev(rbo->tbo.bdev);
> > > +       INIT_LIST_HEAD(&list);
> > > +
> > > +       tv.bo =3D &rbo->tbo;
> > > +       tv.num_shared =3D 1;
> > > +       list_add(&tv.head, &list);
> > > +
> > > +       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> > > +       if (r) {
> > > +               dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
> > > +               return r;
> > > +       }
> > > +
> > > +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> > > +               domain =3D amdgpu_display_supported_domains(adev, rbo=
->flags);
> > > +       else
> > > +               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > > +
> > > +       r =3D amdgpu_bo_pin(rbo, domain);
> > > +       if (unlikely(r !=3D 0)) {
> > > +               if (r !=3D -ERESTARTSYS)
> > > +                       DRM_ERROR("Failed to pin framebuffer with err=
or %d\n", r);
> > > +               ttm_eu_backoff_reservation(&ticket, &list);
> > > +               return r;
> > > +       }
> > > +
> > > +       r =3D amdgpu_ttm_alloc_gart(&rbo->tbo);
> > > +       if (unlikely(r !=3D 0)) {
> > > +               amdgpu_bo_unpin(rbo);
> > > +               ttm_eu_backoff_reservation(&ticket, &list);
> > > +               DRM_ERROR("%p bind failed\n", rbo);
> > > +               return r;
> > > +       }
> > > +
> > > +       ttm_eu_backoff_reservation(&ticket, &list);
> > > +
> > > +       afb->address =3D amdgpu_bo_gpu_offset(rbo);
> > > +
> > > +       amdgpu_bo_ref(rbo);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
> > > +                                  struct drm_plane_state *old_state)
> > > +{
> > > +       struct amdgpu_bo *rbo;
> > > +       int r;
> > > +
> > > +       if (!old_state->fb)
> > > +               return;
> > > +
> > > +       rbo =3D gem_to_amdgpu_bo(old_state->fb->obj[0]);
> > > +       r =3D amdgpu_bo_reserve(rbo, false);
> > > +       if (unlikely(r)) {
> > > +               DRM_ERROR("failed to reserve rbo before unpin\n");
> > > +               return;
> > > +       }
> > > +
> > > +       amdgpu_bo_unpin(rbo);
> > > +       amdgpu_bo_unreserve(rbo);
> > > +       amdgpu_bo_unref(&rbo);
> > > +}
> > > +
> > > +static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helpe=
r_funcs =3D {
> > > +       .atomic_update          =3D amdgpu_vkms_plane_atomic_update,
> > > +       .atomic_check           =3D amdgpu_vkms_plane_atomic_check,
> > > +       .prepare_fb             =3D amdgpu_vkms_prepare_fb,
> > > +       .cleanup_fb             =3D amdgpu_vkms_cleanup_fb,
> > > +};
> > > +
> > > +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *d=
ev,
> > > +                                               enum drm_plane_type t=
ype,
> > > +                                               int index) {
> > > +       struct drm_plane *plane;
> > > +       int ret;
> > > +
> > > +       plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> > > +       if (!plane)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       ret =3D drm_universal_plane_init(dev, plane, 1 << index,
> > > +                                      &amdgpu_vkms_plane_funcs,
> > > +                                      amdgpu_vkms_formats,
> > > +                                      ARRAY_SIZE(amdgpu_vkms_formats=
),
> > > +                                      NULL, type, NULL);
> > > +       if (ret) {
> > > +               kfree(plane);
> > > +               return ERR_PTR(ret);
> > > +       }
> > > +
> > > +       drm_plane_helper_add(plane,
> > > + &amdgpu_vkms_primary_helper_funcs);
> > > +
> > > +       return plane;
> > > +}
> > > +
> > > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > > +                           struct amdgpu_vkms_output *output, int
> > > +index) {
> > > +       struct drm_connector *connector =3D &output->connector;
> > > +       struct drm_encoder *encoder =3D &output->encoder;
> > > +       struct drm_crtc *crtc =3D &output->crtc;
> > > +       struct drm_plane *primary, *cursor =3D NULL;
> > > +       int ret;
> > > +
> > > +       primary =3D amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMAR=
Y, index);
> > > +       if (IS_ERR(primary))
> > > +               return PTR_ERR(primary);
> > > +
> > > +       ret =3D amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
> > > +       if (ret)
> > > +               goto err_crtc;
> > > +
> > > +       ret =3D drm_connector_init(dev, connector, &amdgpu_vkms_conne=
ctor_funcs,
> > > +                                DRM_MODE_CONNECTOR_VIRTUAL);
> > > +       if (ret) {
> > > +               DRM_ERROR("Failed to init connector\n");
> > > +               goto err_connector;
> > > +       }
> > > +
> > > +       drm_connector_helper_add(connector,
> > > + &amdgpu_vkms_conn_helper_funcs);
> > > +
> > > +       ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODE=
R_VIRTUAL);
> > > +       if (ret) {
> > > +               DRM_ERROR("Failed to init encoder\n");
> > > +               goto err_encoder;
> > > +       }
> > > +       encoder->possible_crtcs =3D 1 << index;
> > > +
> > > +       ret =3D drm_connector_attach_encoder(connector, encoder);
> > > +       if (ret) {
> > > +               DRM_ERROR("Failed to attach connector to encoder\n");
> > > +               goto err_attach;
> > > +       }
> > > +
> > > +       drm_mode_config_reset(dev);
> > > +
> > > +       return 0;
> > > +
> > > +err_attach:
> > > +       drm_encoder_cleanup(encoder);
> > > +
> > > +err_encoder:
> > > +       drm_connector_cleanup(connector);
> > > +
> > > +err_connector:
> > > +       drm_crtc_cleanup(crtc);
> > > +
> > > +err_crtc:
> > > +       drm_plane_cleanup(primary);
> > > +
> > > +       return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > > new file mode 100644
> > > index 000000000000..5dab51fbecf3
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > > @@ -0,0 +1,29 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +
> > > +#ifndef _AMDGPU_VKMS_H_
> > > +#define _AMDGPU_VKMS_H_
> > > +
> > > +#define XRES_DEF  1024
> > > +#define YRES_DEF   764
> >
> > Squash in the 768 fix here.
> >
> > > +
> > > +#define XRES_MAX  16384
> > > +#define YRES_MAX  16384
> > > +
> > > +#define drm_crtc_to_amdgpu_vkms_output(target) \
> > > +       container_of(target, struct amdgpu_vkms_output, crtc)
> > > +
> > > +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
> > > +
> > > +struct amdgpu_vkms_output {
> > > +       struct drm_crtc crtc;
> > > +       struct drm_encoder encoder;
> > > +       struct drm_connector connector;
> > > +       struct hrtimer vblank_hrtimer;
> > > +       ktime_t period_ns;
> > > +       struct drm_pending_vblank_event *event; };
> > > +
> > > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > > +                           struct amdgpu_vkms_output *output, int
> > > +index);
> > > +
> > > +#endif /* _AMDGPU_VKMS_H_ */
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > > b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > > index 7e0d8c092c7e..642c77533157 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > > @@ -22,6 +22,7 @@
> > >   */
> > >
> > >  #include <drm/drm_vblank.h>
> > > +#include <drm/drm_atomic_helper.h>
> > >
> > >  #include "amdgpu.h"
> > >  #include "amdgpu_pm.h"
> > > @@ -40,6 +41,7 @@
> > >  #include "dce_virtual.h"
> > >  #include "ivsrcid/ivsrcid_vislands30.h"
> > >  #include "amdgpu_display.h"
> > > +#include "amdgpu_vkms.h"
> > >
> > >  #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
> > >
> > > @@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virt=
ual_connector_funcs =3D {
> > >         .force =3D dce_virtual_force,
> > >  };
> > >
> > > +const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {
> > > +       .fb_create =3D amdgpu_display_user_framebuffer_create,
> > > +       .atomic_check =3D drm_atomic_helper_check,
> > > +       .atomic_commit =3D drm_atomic_helper_commit, };
> > > +
> > >  static int dce_virtual_sw_init(void *handle)  {
> > >         int r, i;
> > > @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
> > >
> > >         adev_to_drm(adev)->max_vblank_count =3D 0;
> > >
> > > -       adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
> > > +       adev_to_drm(adev)->mode_config.funcs =3D
> > > + &dce_virtual_mode_funcs;
> > >
> > > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > > +       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> > > +       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
> > >
> > >         adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
> > >         adev_to_drm(adev)->mode_config.prefer_shadow =3D 1; @@ -399,1=
5
> > > +407,11 @@ static int dce_virtual_sw_init(void *handle)
> > >         if (r)
> > >                 return r;
> > >
> > > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > > +       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct
> > > + amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
> >
> > You can use kcalloc here.
> >
> > >
> > >         /* allocate crtcs, encoders, connectors */
> > >         for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> > > -               r =3D dce_virtual_crtc_init(adev, i);
> > > -               if (r)
> > > -                       return r;
> > > -               r =3D dce_virtual_connector_encoder_init(adev, i);
> > > +               r =3D amdgpu_vkms_output_init(adev_to_drm(adev),
> > > + &adev->amdgpu_vkms_output[i], i);
> > >                 if (r)
> > >                         return r;
> > >         }
> > > @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
> > >
> > > hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
> > >
> > >         kfree(adev->mode_info.bios_hardcoded_edid);
> > > +       kfree(adev->amdgpu_vkms_output);
> > >
> > >         drm_kms_helper_poll_fini(adev_to_drm(adev));
> > >
> > > --
> > > 2.32.0
> > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ist
> > > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7=
Cgu
> > > chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe488=
4
> > > e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7CTWFpbGZs=
b
> > > 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%
> > > 7C1000&amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqcxzPWjzmI%3D&a=
mp;
> > > reserved=3D0
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7CRyan=
.Taylor%40amd.com%7Cbaa2d803835b411fdc0408d95056aa89%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637629155949319404%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3DgqJcTtUbjxhBYg2k5rg1KunDoCJxPi%2BrrLOKrLb10RM%3D&amp;reserved=3D0

--_000_MN2PR12MB3232616CA236BAB8A669F2F4EAE89MN2PR12MB3232namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Sounds good, Thanks for clarifying. Thanks for the input Guchun.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Best,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Ryan<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Monday, July 26, 2021 9:58 AM<br>
<b>To:</b> Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;<br>
<b>Cc:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; kernel test robot &lt;=
lkp@intel.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;; Siqueira, =
Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.fr=
eedesktop.org&gt;; Melissa Wen &lt;melissa.srw@gmail.com&gt;; Maling
 list - DRI developers &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jul 26, 2021 at 12:39 PM Taylor, Ryan &lt;=
Ryan.Taylor@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [AMD Official Use Only]<br>
&gt;<br>
&gt;<br>
&gt; Given that amdgpu_vkms contains code from both dce_virtual and vkms sh=
ould the identifier be changed to GPL-2.0+ OR MIT like in amdgpu_res_cursor=
.h?<br>
<br>
Most of the code is from vkms so match vkms.<br>
<br>
Alex<br>
<br>
<br>
&gt;<br>
&gt; Best,<br>
&gt; Ryan<br>
&gt; ________________________________<br>
&gt; From: Alex Deucher &lt;alexdeucher@gmail.com&gt;<br>
&gt; Sent: Monday, July 26, 2021 9:21 AM<br>
&gt; To: Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
&gt; Cc: Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;; kernel test robot &lt;lk=
p@intel.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;; Siqueira, Ro=
drigo &lt;Rodrigo.Siqueira@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.free=
desktop.org&gt;; Melissa Wen &lt;melissa.srw@gmail.com&gt;; Maling list
 - DRI developers &lt;dri-devel@lists.freedesktop.org&gt;<br>
&gt; Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)<br>
&gt;<br>
&gt; On Fri, Jul 23, 2021 at 10:07 PM Chen, Guchun &lt;Guchun.Chen@amd.com&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; [Public]<br>
&gt; &gt;<br>
&gt; &gt; Look copy right statement is missed in both amdgpu_vkms.c and amd=
gpu_vkms.h.<br>
&gt;<br>
&gt; It's there, it just uses the newer SPDX license identifier.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Guchun<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Be=
half Of Alex Deucher<br>
&gt; &gt; Sent: Friday, July 23, 2021 10:32 PM<br>
&gt; &gt; To: Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;<br>
&gt; &gt; Cc: kernel test robot &lt;lkp@intel.com&gt;; Daniel Vetter &lt;da=
niel.vetter@ffwll.ch&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt=
;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Melissa Wen &lt;meli=
ssa.srw@gmail.com&gt;; Maling list - DRI developers &lt;dri-devel@lists.fre=
edesktop.org&gt;<br>
&gt; &gt; Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor &lt;Ryan.Taylor@amd.c=
om&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Modify the VKMS driver into an api that dce_virtual can use =
to create<br>
&gt; &gt; &gt; virtual displays that obey drm's atomic modesetting api.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; v2: Made local functions static.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Reported-by: kernel test robot &lt;lkp@intel.com&gt;<br>
&gt; &gt; &gt; Signed-off-by: Ryan Taylor &lt;Ryan.Taylor@amd.com&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp; |&nbsp;&=
nbsp; 2 +-<br>
&gt; &gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 +-<br>
&gt; &gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411<br>
&gt; &gt; &gt; +++++++++++++++++++++++&nbsp; drivers/gpu/drm/amd/amdgpu/amd=
gpu_vkms.h |<br>
&gt; &gt; &gt; 29 ++&nbsp; drivers/gpu/drm/amd/amdgpu/dce_virtual.c |&nbsp;=
 23 +-<br>
&gt; &gt; &gt;&nbsp; 7 files changed, 458 insertions(+), 11 deletions(-)&nb=
sp; create mode<br>
&gt; &gt; &gt; 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; &gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_v=
kms.h<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; &gt; index f089794bbdd5..30cbcd5ce1cc 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; &gt; @@ -120,6 +120,7 @@ amdgpu-y +=3D \<br>
&gt; &gt; &gt;&nbsp; amdgpu-y +=3D \<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v10_0.o =
\<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v11_0.o =
\<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vkms.o \<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_virtual.=
o<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; # add GFX block<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; &gt; index 54cf647bd018..d0a2f2ed433d 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; &gt; @@ -919,6 +919,7 @@ struct amdgpu_device {<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* display *=
/<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; enable_virtual_display;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_out=
put&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *amdgpu_vkms_output;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgp=
u_mode_info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_info;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For pre-D=
CE11. DCE11 and later are in &quot;struct amdgpu_device-&gt;dm&quot; */<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct work_=
struct&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; hotplug_work;<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; &gt; index d0c935cf4f0f..1b016e5bc75f 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; &gt; @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci=
_dev *pdev,<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, ret=
ry =3D 0;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool support=
s_atomic =3D false;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_virtual_di=
splay &amp;&amp;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_virtual_dis=
play ||<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; amdgpu_device_asic_has_dc_support(flags &amp; AMD_ASIC_MASK))<b=
r>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; supports_atomic =3D true;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; &gt; index 09b048647523..5a143ca02cf9 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; &gt; @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_devi=
ce *adev)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* disable a=
ll the possible outputs/crtcs before entering KMS mode */<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_has=
_dc_support(adev))<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_has=
_dc_support(adev) &amp;&amp;<br>
&gt; &gt; &gt; + !amdgpu_virtual_display)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; drm_helper_disable_unused_functions(adev_to_drm(adev));<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_fb_helpe=
r_initial_config(&amp;rfbdev-&gt;helper, bpp_sel); diff<br>
&gt; &gt; &gt; --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..d5c1f1c58f5f<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; &gt; @@ -0,0 +1,411 @@<br>
&gt; &gt; &gt; +// SPDX-License-Identifier: GPL-2.0+<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; &gt; &gt; +#include &lt;drm/drm_simple_kms_helper.h&gt; #include &lt;d=
rm/drm_vblank.h&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#include &quot;amdgpu.h&quot;<br>
&gt; &gt; &gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt; &gt; &gt; +#include &quot;amdgpu_display.h&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; + * DOC: amdgpu_vkms<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * The amdgpu vkms interface provides a virtual KMS interfa=
ce for<br>
&gt; &gt; &gt; +several use<br>
&gt; &gt; &gt; + * cases: devices without display hardware, platforms where=
 the<br>
&gt; &gt; &gt; +actual display<br>
&gt; &gt; &gt; + * hardware is not useful (e.g., servers), SR-IOV virtual f=
unctions,<br>
&gt; &gt; &gt; +device<br>
&gt; &gt; &gt; + * emulation/simulation, and device bring up prior to displ=
ay<br>
&gt; &gt; &gt; +hardware being<br>
&gt; &gt; &gt; + * usable. We previously emulated a legacy KMS interface, b=
ut there<br>
&gt; &gt; &gt; +was a desire<br>
&gt; &gt; &gt; + * to move to the atomic KMS interface. The vkms driver did=
<br>
&gt; &gt; &gt; +everything we<br>
&gt; &gt; &gt; + * needed, but we wanted KMS support natively in the driver=
 without<br>
&gt; &gt; &gt; +buffer<br>
&gt; &gt; &gt; + * sharing and the ability to support an instance of VKMS p=
er device.<br>
&gt; &gt; &gt; +We first<br>
&gt; &gt; &gt; + * looked at splitting vkms into a stub driver and a helper=
 module<br>
&gt; &gt; &gt; +that other<br>
&gt; &gt; &gt; + * drivers could use to implement a virtual display, but th=
is<br>
&gt; &gt; &gt; +strategy ended up<br>
&gt; &gt; &gt; + * being messy due to driver specific callbacks needed for =
buffer management.<br>
&gt; &gt; &gt; + * Ultimately, it proved easier to import the vkms code as =
it mostly<br>
&gt; &gt; &gt; +used core<br>
&gt; &gt; &gt; + * drm helpers anyway.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const u32 amdgpu_vkms_formats[] =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,<b=
r>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(str=
uct<br>
&gt; &gt; &gt; +hrtimer *timer) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_out=
put *output =3D container_of(timer,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output,<b=
r>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vblank_hrtimer);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc *crtc =
=3D &amp;output-&gt;crtc;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 ret_overrun;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret_overrun =3D hrtime=
r_forward_now(&amp;output-&gt;vblank_hrtimer,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;period_ns);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(ret_overrun !=
=3D 1);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_crtc_handl=
e_vblank(crtc);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;amdgpu_vkms failure on handling v=
blank&quot;);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return HRTIMER_RESTART=
;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)=
 {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev=
 =3D crtc-&gt;dev;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pipe =3D =
drm_crtc_index(crtc);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_vblank_crtc=
 *vblank =3D &amp;dev-&gt;vblank[pipe];<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_out=
put *out =3D<br>
&gt; &gt; &gt; +drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_calc_timestamping_=
constants(crtc, &amp;crtc-&gt;mode);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_init(&amp;out-=
&gt;vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out-&gt;vblank_hrtimer=
.function =3D &amp;amdgpu_vkms_vblank_simulate;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out-&gt;period_ns =3D =
ktime_set(0, vblank-&gt;framedur_ns);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_start(&amp;out=
-&gt;vblank_hrtimer, out-&gt;period_ns,<br>
&gt; &gt; &gt; + HRTIMER_MODE_REL);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crt=
c) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_out=
put *out =3D<br>
&gt; &gt; &gt; +drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_cancel(&amp;ou=
t-&gt;vblank_hrtimer);<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crt=
c *crtc,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *max_error,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ktime_t *vblank_time,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool in_vblank_irq) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev=
 =3D crtc-&gt;dev;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pipe =3D =
crtc-&gt;index;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_out=
put *output =3D drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_vblank_crtc=
 *vblank =3D &amp;dev-&gt;vblank[pipe];<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!READ_ONCE(vblank-=
&gt;enabled)) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; *vblank_time =3D ktime_get();<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vblank_time =3D READ_=
ONCE(output-&gt;vblank_hrtimer.node.expires);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON(*vblank_ti=
me =3D=3D vblank-&gt;time))<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * To prevent rac=
es we roll the hrtimer forward before we do any<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * interrupt proc=
essing - this is how real hw works (the interrupt is<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * only generated=
 after all the vblank registers are updated) and what<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the vblank cor=
e expects. Therefore we need to always correct the<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * timestampe by =
one frame.<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vblank_time -=3D outp=
ut-&gt;period_ns;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =
=3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_config&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomi=
c_helper_set_config,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; =3D drm_crtc_cleanup,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .page_flip&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_=
atomic_helper_page_flip,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D drm_atomic_helper_crtc_reset,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_stat=
e =3D drm_atomic_helper_crtc_duplicate_state,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state&=
nbsp;&nbsp; =3D drm_atomic_helper_crtc_destroy_state,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enable_vblank&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_enable_vblan=
k,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .disable_vblank&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_disable_vblank,<b=
r>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_vblank_timestamp&=
nbsp;&nbsp; =3D amdgpu_vkms_get_vblank_timestamp,<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc =
*crtc,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; &gt; +*state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_vblank_on(crt=
c);<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc=
 *crtc,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; &gt; +*state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_vblank_off(cr=
tc);<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *=
crtc,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; &gt; +*state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc-&gt;state-&gt=
;event) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;crtc-&gt;dev-&gt;event_lock);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (drm_crtc_vblank_get(crtc) !=3D 0)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
rm_crtc_send_vblank_event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
rm_crtc_arm_vblank_event(crtc,<br>
&gt; &gt; &gt; + crtc-&gt;state-&gt;event);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;crtc-&gt;dev-&gt;event_lock);<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; crtc-&gt;state-&gt;event =3D NULL;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_=
helper_funcs =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_flush&nbsp;&nb=
sp; =3D amdgpu_vkms_crtc_atomic_flush,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_enable&nbsp; =
=3D amdgpu_vkms_crtc_atomic_enable,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_disable =3D am=
dgpu_vkms_crtc_atomic_disable, };<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int amdgpu_vkms_crtc_init(struct drm_device *dev, st=
ruct drm_crtc *crtc,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct drm_plane *primary, struct drm_plane<br>
&gt; &gt; &gt; +*cursor) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_crtc_init_=
with_planes(dev, crtc, primary, cursor,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; &amp;amdgpu_vkms_crtc_funcs, NULL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init CRTC\n&quot;);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_helper_add(cr=
tc, &amp;amdgpu_vkms_crtc_helper_funcs);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_connector_funcs amdgpu_vkms_connect=
or_funcs =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fill_modes =3D drm_he=
lper_probe_single_connector_modes,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy =3D drm_conne=
ctor_cleanup,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset =3D drm_atomic_=
helper_connector_reset,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_stat=
e =3D drm_atomic_helper_connector_duplicate_state,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state =
=3D<br>
&gt; &gt; &gt; +drm_atomic_helper_connector_destroy_state,<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int amdgpu_vkms_conn_get_modes(struct drm_connector<=
br>
&gt; &gt; &gt; +*connector) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count =3D drm_add_mode=
s_noedid(connector, XRES_MAX, YRES_MAX);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_set_preferred_mode=
(connector, XRES_DEF, YRES_DEF);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_connector_helper_funcs amdgpu_vkms_=
conn_helper_funcs =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_modes&nbsp;&nbsp;=
&nbsp; =3D amdgpu_vkms_conn_get_modes,<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs=
 =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .update_plane&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomic_helper_u=
pdate_plane,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .disable_plane&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomic_helper_disabl=
e_plane,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; =3D drm_plane_cleanup,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D drm_atomic_helper_plane_reset,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_stat=
e =3D drm_atomic_helper_plane_duplicate_state,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state&=
nbsp;&nbsp; =3D drm_atomic_helper_plane_destroy_state,<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_plane_atomic_update(struct drm_plan=
e *plane,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane_state<br>
&gt; &gt; &gt; +*old_state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int amdgpu_vkms_plane_atomic_check(struct drm_plane =
*plane,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane_state<br>
&gt; &gt; &gt; +*state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc_state =
*crtc_state;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool can_position =3D =
false;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!state-&gt;fb || W=
ARN_ON(!state-&gt;crtc))<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crtc_state =3D drm_ato=
mic_get_crtc_state(state-&gt;state, state-&gt;crtc);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(crtc_state)=
)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return PTR_ERR(crtc_state);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_atomic_hel=
per_check_plane_state(state, crtc_state,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; can_position, true);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* for now primary pla=
ne must be visible and full screen */<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!state-&gt;visible=
 &amp;&amp; !can_position)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,<=
br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane=
_state *new_state) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_framebuf=
fer *afb;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object =
*obj;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *=
adev;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *rbo;=
<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head list;=
<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_validate_bu=
ffer tv;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ww_acquire_ctx =
ticket;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t domain;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!new_state-&gt;fb)=
 {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;No FB bound\n&quot;);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; afb =3D to_amdgpu_fram=
ebuffer(new_state-&gt;fb);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj =3D new_state-&gt;=
fb-&gt;obj[0];<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rbo =3D gem_to_amdgpu_=
bo(obj);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev =3D amdgpu_ttm_ad=
ev(rbo-&gt;tbo.bdev);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;li=
st);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tv.bo =3D &amp;rbo-&gt=
;tbo;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tv.num_shared =3D 1;<b=
r>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;tv.head,=
 &amp;list);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D ttm_eu_reserve_b=
uffers(&amp;ticket, &amp;list, false, NULL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;fail to reserve bo (%=
d)\n&quot;, r);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (plane-&gt;type !=
=3D DRM_PLANE_TYPE_CURSOR)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; domain =3D amdgpu_display_supported_domains(adev,=
 rbo-&gt;flags);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; domain =3D AMDGPU_GEM_DOMAIN_VRAM;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_pin(rb=
o, domain);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r !=3D 0)=
) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (r !=3D -ERESTARTSYS)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D=
RM_ERROR(&quot;Failed to pin framebuffer with error %d\n&quot;, r);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reservation(&amp;ticket, &amp;list=
);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ttm_alloc=
_gart(&amp;rbo-&gt;tbo);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r !=3D 0)=
) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unpin(rbo);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reservation(&amp;ticket, &amp;list=
);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;%p bind failed\n&quot;, rbo);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reserva=
tion(&amp;ticket, &amp;list);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; afb-&gt;address =3D am=
dgpu_bo_gpu_offset(rbo);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_ref(rbo);<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,=
<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm=
_plane_state *old_state)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *rbo;=
<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!old_state-&gt;fb)=
<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rbo =3D gem_to_amdgpu_=
bo(old_state-&gt;fb-&gt;obj[0]);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_reserv=
e(rbo, false);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r)) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;failed to reserve rbo before unpi=
n\n&quot;);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unpin(rbo);<=
br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unreserve(rb=
o);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unref(&amp;r=
bo);<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct drm_plane_helper_funcs amdgpu_vkms_prim=
ary_helper_funcs =3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_update&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_plane_atomic=
_update,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_plane_a=
tomic_check,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .prepare_fb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vk=
ms_prepare_fb,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cleanup_fb&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vk=
ms_cleanup_fb,<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_=
device *dev,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum dr=
m_plane_type type,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ind=
ex) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane *plan=
e;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane =3D kzalloc(size=
of(*plane), GFP_KERNEL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!plane)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return ERR_PTR(-ENOMEM);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_universal_=
plane_init(dev, plane, 1 &lt;&lt; index,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &amp;amdgpu_vkms_plane_funcs,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; amdgpu_vkms_formats,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ARRAY_SIZE(amdgpu_vkms_formats),<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; NULL, type, NULL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; kfree(plane);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return ERR_PTR(ret);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_plane_helper_add(p=
lane,<br>
&gt; &gt; &gt; + &amp;amdgpu_vkms_primary_helper_funcs);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return plane;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int amdgpu_vkms_output_init(struct drm_device *dev,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *output, int<br>
&gt; &gt; &gt; +index) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *=
connector =3D &amp;output-&gt;connector;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_encoder *en=
coder =3D &amp;output-&gt;encoder;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc *crtc =
=3D &amp;output-&gt;crtc;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane *prim=
ary, *cursor =3D NULL;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary =3D amdgpu_vkm=
s_plane_init(dev, DRM_PLANE_TYPE_PRIMARY, index);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(primary))<b=
r>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return PTR_ERR(primary);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_vkms_cr=
tc_init(dev, crtc, primary, cursor);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; goto err_crtc;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_connector_=
init(dev, connector, &amp;amdgpu_vkms_connector_funcs,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_CONNECTOR_VIR=
TUAL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init connector\n&quot;)=
;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; goto err_connector;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_helper_a=
dd(connector,<br>
&gt; &gt; &gt; + &amp;amdgpu_vkms_conn_helper_funcs);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_simple_enc=
oder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init encoder\n&quot;);<=
br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; goto err_encoder;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoder-&gt;possible_c=
rtcs =3D 1 &lt;&lt; index;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_connector_=
attach_encoder(connector, encoder);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to attach connector to enc=
oder\n&quot;);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; goto err_attach;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mode_config_reset(=
dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_attach:<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_encoder_cleanup(en=
coder);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_encoder:<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_cleanup(=
connector);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_connector:<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_cleanup(crtc)=
;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err_crtc:<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_plane_cleanup(prim=
ary);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..5dab51fbecf3<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; &gt; @@ -0,0 +1,29 @@<br>
&gt; &gt; &gt; +/* SPDX-License-Identifier: GPL-2.0+ */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#ifndef _AMDGPU_VKMS_H_<br>
&gt; &gt; &gt; +#define _AMDGPU_VKMS_H_<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define XRES_DEF&nbsp; 1024<br>
&gt; &gt; &gt; +#define YRES_DEF&nbsp;&nbsp; 764<br>
&gt; &gt;<br>
&gt; &gt; Squash in the 768 fix here.<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define XRES_MAX&nbsp; 16384<br>
&gt; &gt; &gt; +#define YRES_MAX&nbsp; 16384<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define drm_crtc_to_amdgpu_vkms_output(target) \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container_of(target, s=
truct amdgpu_vkms_output, crtc)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_=
block;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +struct amdgpu_vkms_output {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc crtc;<=
br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_encoder enc=
oder;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector c=
onnector;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hrtimer vblank_=
hrtimer;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ktime_t period_ns;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_pending_vbl=
ank_event *event; };<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int amdgpu_vkms_output_init(struct drm_device *dev,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *output, int<br>
&gt; &gt; &gt; +index);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#endif /* _AMDGPU_VKMS_H_ */<br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; &gt; index 7e0d8c092c7e..642c77533157 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; &gt; @@ -22,6 +22,7 @@<br>
&gt; &gt; &gt;&nbsp;&nbsp; */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; #include &lt;drm/drm_vblank.h&gt;<br>
&gt; &gt; &gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; #include &quot;amdgpu.h&quot;<br>
&gt; &gt; &gt;&nbsp; #include &quot;amdgpu_pm.h&quot;<br>
&gt; &gt; &gt; @@ -40,6 +41,7 @@<br>
&gt; &gt; &gt;&nbsp; #include &quot;dce_virtual.h&quot;<br>
&gt; &gt; &gt;&nbsp; #include &quot;ivsrcid/ivsrcid_vislands30.h&quot;<br>
&gt; &gt; &gt;&nbsp; #include &quot;amdgpu_display.h&quot;<br>
&gt; &gt; &gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp; #define DCE_VIRTUAL_VBLANK_PERIOD 16666666<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -374,6 +376,12 @@ static const struct drm_connector_funcs=
 dce_virtual_connector_funcs =3D {<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force =3D d=
ce_virtual_force,<br>
&gt; &gt; &gt;&nbsp; };<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +const struct drm_mode_config_funcs dce_virtual_mode_funcs =
=3D {<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fb_create =3D amdgpu_=
display_user_framebuffer_create,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check =3D drm_=
atomic_helper_check,<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_commit =3D drm=
_atomic_helper_commit, };<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;&nbsp; static int dce_virtual_sw_init(void *handle)&nbsp; {<b=
r>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br=
>
&gt; &gt; &gt; @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *h=
andle)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(=
adev)-&gt;max_vblank_count =3D 0;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.funcs =3D &amp;amdgpu_mode_funcs;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.funcs =3D<br>
&gt; &gt; &gt; + &amp;dce_virtual_mode_funcs;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_width =3D 16384;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_height =3D 16384;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_width =3D XRES_MAX;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_height =3D YRES_MAX;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(=
adev)-&gt;mode_config.preferred_depth =3D 24;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(=
adev)-&gt;mode_config.prefer_shadow =3D 1; @@ -399,15<br>
&gt; &gt; &gt; +407,11 @@ static int dce_virtual_sw_init(void *handle)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_width =3D 16384;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;=
mode_config.max_height =3D 16384;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;amdgpu_vkms_o=
utput =3D kzalloc(sizeof(struct<br>
&gt; &gt; &gt; + amdgpu_vkms_output) * adev-&gt;mode_info.num_crtc, GFP_KER=
NEL);<br>
&gt; &gt;<br>
&gt; &gt; You can use kcalloc here.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate =
crtcs, encoders, connectors */<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0=
; i &lt; adev-&gt;mode_info.num_crtc; i++) {<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; r =3D dce_virtual_crtc_init(adev, i);<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn r;<br>
&gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; r =3D dce_virtual_connector_encoder_init(adev, i)=
;<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_vkms_output_init(adev_to_drm(adev),<=
br>
&gt; &gt; &gt; + &amp;adev-&gt;amdgpu_vkms_output[i], i);<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; return r;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *han=
dle)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; hrtimer_cancel(&amp;adev-&gt;mode_info.crtcs[i]-&gt;vblank_t=
imer);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&=
gt;mode_info.bios_hardcoded_edid);<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;amdgpu_=
vkms_output);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_help=
er_poll_fini(adev_to_drm(adev));<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.32.0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; amd-gfx mailing list<br>
&gt; &gt; &gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Flist">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist</a=
><br>
&gt; &gt; &gt; s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;dat=
a=3D04%7C01%7Cgu<br>
&gt; &gt; &gt; chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd=
8961fe4884<br>
&gt; &gt; &gt; e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7=
CTWFpbGZsb<br>
&gt; &gt; &gt; 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%<br>
&gt; &gt; &gt; 7C1000&amp;amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqc=
xzPWjzmI%3D&amp;amp;<br>
&gt; &gt; &gt; reserved=3D0<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; amd-gfx mailing list<br>
&gt; &gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;=
data=3D04%7C01%7CRyan.Taylor%40amd.com%7Cbaa2d803835b411fdc0408d95056aa89%7=
C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637629155949319404%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000&amp;amp;sdata=3DgqJcTtUbjxhBYg2k5rg1KunDoCJxPi%2BrrLOKrLb10RM%3D=
&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7CRyan=
.Taylor%40amd.com%7Cbaa2d803835b411fdc0408d95056aa89%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637629155949319404%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sd=
ata=3DgqJcTtUbjxhBYg2k5rg1KunDoCJxPi%2BrrLOKrLb10RM%3D&amp;amp;reserved=3D0=
</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB3232616CA236BAB8A669F2F4EAE89MN2PR12MB3232namp_--
