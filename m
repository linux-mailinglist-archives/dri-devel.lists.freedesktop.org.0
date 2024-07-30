Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B67940D06
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB97510E4F6;
	Tue, 30 Jul 2024 09:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="onp9yJWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216610E269;
 Tue, 30 Jul 2024 09:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9B08nEoQ+NxUqC2awjz9mfY6vmWOJ+KgMFL0Z42EhYCkbQoLS5Qn6QgguflvjbGYM4VqVrZNXQ3eSsbPPGNszXC/xdA+Iq/SlNYjK5dNPxgk1XNVT2R0aD5FswCn2Mxfbs/cQEruP+b0FYpZp7ihBm0TRi5tFXJFT8u4+sBITW/RjtjNPPndifzue6qRppDrpzZg16xvOTSiX/o6vkkHho6DRc+kT58bCeDYieWh/q0V9BxfDiRooqnWrtf82cs23VKHNOV8Ms0zu2Nik5FjPtu72BMEj++cMJcAywwzTfNQyiQt/XDQof2BaWrAFtkSpJ+F9EL9khQu/l4iCS1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llcP6j1ICewtPHZxpK6BGfgchW4KFGiQd2zfH+o4D1g=;
 b=AlppTlle1o9NbXun0OJLkOpMAIKc6HxfqzsLHhNKrj0NP0ryR4EbsvTOGOKLCjTfkVWFsQJ++x4hS/4i25uH2zH+znC0jq05OQweciHDw7fl1rYvUgDE0R9ww0e9ierRWuiEz6M+0Cf7XeoXVYPSazUqR/Io+SzYttIBRrz//aDM9BERJBgxZ/U82PuMwPKPX9iwiAPoyLiWvzBIL96zW6QU7Zf65cOKE7aPb3FFYpUY5Kz6dPp+zq4f/CSMc0ZE4vwUjxyRg2wJte9zme7QJTN5++R0M6/bTROIEUJgMS8fnlkR8Af8hYz/p7z35wxO8a0cY7Z2wRjLKjjCKIWm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llcP6j1ICewtPHZxpK6BGfgchW4KFGiQd2zfH+o4D1g=;
 b=onp9yJWqm2cCAxWt2e46EBy9RhNxdShW93fdf9fsbfFzwlJnuEv+afqEF4M8NJGoZ3ttNVMl9JveDunZFGKzO7k4yXfzmpzCE3E/miamkJCAKCJ/CaVZhtO7Rp0yLD6wfKPASfevOOeG5nUk7+Pqfzi4Y0+JjKZkkwFMIBP59lE=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 09:09:16 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 09:09:16 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "kevin@holm.dev" <kevin@holm.dev>, Linux regressions mailing list
 <regressions@lists.linux.dev>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Topic: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Index: AQHa4EIHlXNw8ZbqLEehA7MTA0aCA7IKx3CAgAQJXKSAAC5FQA==
Date: Tue, 30 Jul 2024 09:09:16 +0000
Message-ID: <CO6PR12MB5489EB3B5EC32858DA763B59FCB02@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54896312D4BEAE30963FDC5EFCB02@CO6PR12MB5489.namprd12.prod.outlook.com>
 <2024073028-rectified-antler-a65b@gregkh>
In-Reply-To: <2024073028-rectified-antler-a65b@gregkh>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=dc916e15-4593-464c-8b3f-c2a4e40f7f48;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-30T09:06:51Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB8840:EE_
x-ms-office365-filtering-correlation-id: b27b52b8-01a4-43aa-549e-08dcb07749a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UV+ziW8JaR4ubYTMclX/WYFLtx0JFiocckMJh42eh7QTDJqsiV36+256pt7e?=
 =?us-ascii?Q?aw82fiiaYmDrFzVaYqHjBN5GE6A3s98IbKmfZLnIKJ8xYcYNBSG10p9g6OU+?=
 =?us-ascii?Q?EIQ33VMApMVCWgzMA8gncmeFvL0v0dF6Q7YZaO4LvNxg0GLjK2rGco46bxZ8?=
 =?us-ascii?Q?MU+HRwTEOgJmEcpDvxyoy2xK19ETD5jaG1jjcBfa7uZDkgUXSpAQ31/1iQTx?=
 =?us-ascii?Q?rvSa6FvwgGLZ3DFqSKFZNrstRZvwZmD+vBDCAHQbh9l+dj3NcnbBewEKF7FG?=
 =?us-ascii?Q?UpgGJfC43GtKP/LObvj5EQURc47waHO/R9z8P11YI0ybNJHhddKGS+ETcGI/?=
 =?us-ascii?Q?67tv9BeMwFv/B/xE6mhElBweoblad2ZuFiB4mdtGxp6twe4cvJIRLtN17MJ5?=
 =?us-ascii?Q?6iIwVGzANGsKopXW2Z+pLJlchfvCexzLlkz2M91LkzgAoS8bIRx20muuxDGn?=
 =?us-ascii?Q?0rQi92+osHBdmZ1rYEsXKlqYFRllUe0aQnllLTkR8Xx71XRC4NNfvEmfsVcY?=
 =?us-ascii?Q?UbrcwWT6gLEgglQmcst/6gweMlPczkZt2ai9mfC9dddN1eGimO4HdzZTFXkW?=
 =?us-ascii?Q?6Z7mCnCZ6hdf3MGzL+Q+3pKzhRfVkwCFwYD4gXMSCmEW0udII/fhl9ruolba?=
 =?us-ascii?Q?LOigsO/yZI8qi3nt6fToDVlDK4MwXqT1z8/9cF89w9VLOyqF90X94zuN83Qq?=
 =?us-ascii?Q?Ot8RfeYF23aP4fCPHZ9rXGx8LHqjrJYCRUvhDp9MiE22leNWGgih+cIn9Us5?=
 =?us-ascii?Q?RH15noes+P9/hRdXZghVsKPqicmOf7exbX0598nAttwm0UVhLAZsoNzN4akD?=
 =?us-ascii?Q?K1PzhceQbmh4CwmFGfxUzJxCoNSEgzwiUY6+F7wMTNCjRTyDddteZxDnaIqp?=
 =?us-ascii?Q?yaPeJrHnEyTTOb6hmgAmImdHdUqZ8CgdB9MhH5oNsLB8THFUkGEOfCYbctzx?=
 =?us-ascii?Q?FlRJHB95Ck4fKWtI+l/4wfkvufRSyawvdQJ82fBj9zOrMS3KjhTyoeAp5hXF?=
 =?us-ascii?Q?lGCkJ63YdbNJgwmSZVi+eank33jm4c22iGTiEPqbDqWnHPtEJhtLWtBhKAGF?=
 =?us-ascii?Q?spoUsaZ/OjcF3zSt68bM2cth2dQBrxGvxwK+BBKGSdK8o7OaeumH9XlVz9Cd?=
 =?us-ascii?Q?hSpM3j5DNWykyBktUh1kFMG0A/BTBoNoChdX6DCqQlEcdJ1wHs3WOGUl8zKj?=
 =?us-ascii?Q?X+UiXDGS/ThfJ6j5IVsZotR1rzV1zUUA3VgWXM2VwNBH310UiisEUj1WfCtG?=
 =?us-ascii?Q?u/m80MvQVsZde58HhbqCfq4t47/wvk9MOOWjL3EwWVdJrMI8+VjbkX5I+SIq?=
 =?us-ascii?Q?PBRlcruHfgx0pmJMTCTRGhEHQpmvyKJ9CjoycbnNuHDBnCm05F68d2tucjpg?=
 =?us-ascii?Q?JncbpFvc3t2EZaFRzTCmwJvNWFQeBzzoN5YQzC64ZD+3VD3IDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f7q7o3kwMpGX/dKBJL67iiHrNnU1KcEtzQPrUvkJDs3GRLD8uW+r7wthM9M1?=
 =?us-ascii?Q?sH185R5MWgGTQfCTnRjCCqicAGgn7ffXzqdPtYtDha7H81pmpntqYtiXVOCC?=
 =?us-ascii?Q?BYMWYOz7GxSYrnl145gqncJdd1TfY7ufFM4tP+Ufg5l/5GwsN2cC9S2/eDxm?=
 =?us-ascii?Q?6RKgzl2ieDP6p4Vmyj23yHdJApqg96+gzXew8lMktuoSjIO+EaSZygGs2RF0?=
 =?us-ascii?Q?ZtN8vxKfYm9Qa9AQCFq1uLQdD7Y6za49C4yuM4sP150jtZY13k1GIhzSv7cC?=
 =?us-ascii?Q?bhjR+jgDKLNWfUpucnQg3PLaLauvIChU3fE82K4F/c1gwSlOiUmneoKdDKMd?=
 =?us-ascii?Q?xN0Q1rwkNENozLnE4J1FE4oAWURBuUy1RtEXot1lCR1Rr0ITwO1/0HB2eWAA?=
 =?us-ascii?Q?uqk+qZ8+9p432K9Yv6HRX+SThq4UJld8gnrCOM/WWmp9qSmhcyHaCr0QKx/1?=
 =?us-ascii?Q?WHLwZ3lFiTYomhxErudOCxsK/rgEaEuQSiUXWir40l4fcAYGqmkj9bpe91T6?=
 =?us-ascii?Q?FF44vgSfWaPg8fQ01Ir20WzQJL83bi5zwGeeYO8u1wkZp7rkjM0JU+kW9q8N?=
 =?us-ascii?Q?Cf9ru5X8ISUNfef3ZZ5wy0tcDDRhmg1JR0Or8aBTkZnIl5uZrP9ZE1aZfNZ5?=
 =?us-ascii?Q?iOBDtuEFT56iXzX1FwMssbpIp1y+vCamxDKcFE/ZXWBpfaDtw0bsyIOIP06M?=
 =?us-ascii?Q?c+g8RtEqnVEHPtnNnVH+OoPTBtTfoSZLXVkqal15DbxS5b2Ezt0uUtV4U3Qi?=
 =?us-ascii?Q?h8ey7wan7d+d8KBhAHvL+geGnFQ1jEiF+gO/0ae9Ehgp5W1cOlrY0VNywpl2?=
 =?us-ascii?Q?SMXwmPeZyBu3n6n7EvQYO3xh9hYXvTXiHty7qvOLoJ3KwYJU+KFdqDgZvUMX?=
 =?us-ascii?Q?E4k0S6ZVTFct9vzrGDmBQTs2EF/+ezgK3y615pCh6SIAEvQlGI0X9MPHNDMX?=
 =?us-ascii?Q?z/F7P3i0uQmWz/BQE664PmZSWqWclsZ2TDqGoi4ig8g+BoMOnDT3Osx48alY?=
 =?us-ascii?Q?xOQij/jk0rqWGBOBcfPlbVSdMwxfzjQHoAFybRgS8YWJhHdjh6qNtNvffyYq?=
 =?us-ascii?Q?wUt48dkkl1bpO5iT6tdHhsxQ3qioxBC7e08Nf4XZNXWVMdwE8R4mwPiwviZG?=
 =?us-ascii?Q?WLTU9TbIlOfeIJ11JlCZ9u5HwBvrr0pGuq0b/R2CPp3c7Y+QuTh7j91u8+Qu?=
 =?us-ascii?Q?Z4vr5uDFviK6JThcoaqSgEsLFIWbxyY9R17HE5sJGxCtFw88FFgftlwBntAo?=
 =?us-ascii?Q?YXXNQLTZk7LP69VTO8OIwvzmc6Tkq/mPz9Sboq0vzQPK2f5zikvyVMT+ACiH?=
 =?us-ascii?Q?CxK5xQqEPkkBqaU6UFX5RMLXcMNmSQOvmAOVikLaL5nLZSLv9q20NkV9qCoD?=
 =?us-ascii?Q?zqG9JlEZGLMTGLa9d7igEcVi2ACnu/DxA7LBzR4b/MRwnCl7mNvXwQ5qrJYh?=
 =?us-ascii?Q?n1B9S+fRnTwa2YxF3A37vlJwwUm9NiC8gADgZgcfwFO/uIcZ6LfKjHo6aHGh?=
 =?us-ascii?Q?sv4qWaB9HA88v4RJtO22nZUbsLlbY8U+0tGKdMXCLo7EdD+DIWf7zbzkMLP4?=
 =?us-ascii?Q?6Ec5wC8OORgVoWej+eU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27b52b8-01a4-43aa-549e-08dcb07749a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 09:09:16.2510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 140NUIpS+hg9N6MGusXyZzVpn1aOJtdupaR8wndQ+/y9429lJ9+c99ONrkMaLyYjt4yoSerCAQtP8nZh1J7ngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thanks, Greg.
Will do.

Regards,
Wayne Lin

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Tuesday, July 30, 2024 2:21 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: kevin@holm.dev; Linux regressions mailing list
> <regressions@lists.linux.dev>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Wu, Hersen <hersenxs.wu@amd.com>;
> stable@vger.kernel.org; LKML <linux-kernel@vger.kernel.org>; ML dri-devel
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> Subject: Re: [REGRESSION] No image on 4k display port displays connected
> through usb-c dock in kernel 6.10
>
> On Tue, Jul 30, 2024 at 05:56:42AM +0000, Lin, Wayne wrote:
> > [Public]
> >
> > Hi,
> > Thanks for the report.
> >
> > Patch fa57924c76d995 ("drm/amd/display: Refactor function
> > dm_dp_mst_is_port_support_mode()")
> > is kind of correcting problems causing by commit:
> > 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst
> > mode validation")
> >
> > Sorry if it misses fixes tag and would suggest to backport to fix it. T=
hanks!
>
> Please submit a backported version to the stable@vger.kernel.org list and=
 we
> will be glad to consider it.
>
> thanks,
>
> greg k-h
