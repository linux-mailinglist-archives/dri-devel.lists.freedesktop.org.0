Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684AACF8BB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 22:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420110E9E7;
	Thu,  5 Jun 2025 20:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oEtBBJX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6184310E9E7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 20:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBV2VFRF34B4pkNmA0guVh78ifH8PzQ5vWzKCE0Q/zP2NrV+Asi1YpzKrMn258ePVeaQHhwqs8yHZVDHw347QgJ7pl4NhZFLXNG1mIW3e2AzDUofaRVq32EDTouJPRAM6TFo4SiallYd5ElC0j4NB31jAaPBQDHg4l7goXsqiIfnEHGKonQ8GA5/R6hYB+p1l3DxLWRgy/p+IVFVqXac2F1G5/V9VVVCYZlUz28cU1ahoAJFbbwLyGVLcsS4ZcDOoVjf1TMZCPNAHa/X6yXUfl6D2J3dCWuYPaUE99mjKtXbaYzpf+ZrrEgqSBCB5hgiA/VPSRJIe3Pii55RXdyDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPJJ+PcEM0vxnv+1H0DeqO81GLAiQQMbGQw1MREkiH0=;
 b=cc1KdrvkcoEAQKG6TyeisfD4ooz41RtTcjPQI7Awx+ZxntwB87n1j22cP0loK11vl9O74BVi9zFUDw2tRLNuxkIbcA7T0nhA+bBCFyUY1Mn9h8FslEGNJN8Hk1uX4/7VolojHgRZuJniO9denvpak5yRHF01vXs/viI//qoRh9iYIlJsT/SJnTCXaUX2117FAeUzxu2OVMckZQZ3n4pqZni57EZ912DzWTv0tHz1Jcm1hBteuOFXWQLYVLf36HEtStTHfNHoi6ZRgJ4Fe2kbVn16HCzJbVPr5BOWiq2xEyA2dulb8WZP7LeDv8BIcTU2POPp/RZndPAJt0R7bE1ZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPJJ+PcEM0vxnv+1H0DeqO81GLAiQQMbGQw1MREkiH0=;
 b=oEtBBJX8h80xP/A7MrRsImc31SKYiaPntUFxntdgX4ZWAAdqJDV7LMv6VPhZIZ80ec87QMLlg8KwREkO9ywD48KgZGIJHbVlq1xChX1HWMGYLwakbLn2E327AqQ6IGYcvPppYdbOsNMfeSPDSuSORicEgc5XyyBAf65OU3ZYy+g=
Received: from DM6PR12MB5021.namprd12.prod.outlook.com (2603:10b6:5:208::17)
 by DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 5 Jun
 2025 20:24:45 +0000
Received: from DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::bb5c:1ce:83ad:3169]) by DM6PR12MB5021.namprd12.prod.outlook.com
 ([fe80::bb5c:1ce:83ad:3169%5]) with mapi id 15.20.8792.038; Thu, 5 Jun 2025
 20:24:45 +0000
From: "Yat Sin, David" <David.YatSin@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "dcostantino@meta.com"
 <dcostantino@meta.com>, "sruffell@meta.com" <sruffell@meta.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: RE: [PATCH 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Thread-Topic: [PATCH 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Thread-Index: AQHbylmplA7XgkmRjk6++4eHBPtOkLP1GrHw
Date: Thu, 5 Jun 2025 20:24:45 +0000
Message-ID: <DM6PR12MB502130FF0830DAE4FDCC78A2956FA@DM6PR12MB5021.namprd12.prod.outlook.com>
References: <20250521140649.4058526-1-David.Francis@amd.com>
 <20250521140649.4058526-4-David.Francis@amd.com>
In-Reply-To: <20250521140649.4058526-4-David.Francis@amd.com>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=83bd26ed-b896-45b0-9c9c-facc030454ae;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-05T20:23:28Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5021:EE_|DS0PR12MB6486:EE_
x-ms-office365-filtering-correlation-id: d0745eea-87e3-477c-8bb2-08dda46f02f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yHXyHRkKrJF28kUgGBpqu54fc5kAPnEc/XPE9iDpuPtRK2myY0XGnEGoDnz0?=
 =?us-ascii?Q?K9YnqDjSmJS5BXRz5TeGY3tV9uOY5as776q0kZoCLHLzS2D4XyigJyMZkP0K?=
 =?us-ascii?Q?dAL4U7w/SsKrP3FKWWoUQG7TShIb5a7h2sLtZzQobyAStql3S2q6xBp+Y0Z7?=
 =?us-ascii?Q?2nvmeyF8sOqk3LFIi2BKLVK6PYp3a9HJK5bgT/PdPHrJETFEqh5CXbr0WsQp?=
 =?us-ascii?Q?aTIHBA2PxO4KvZDmQJHK9D2Oz64o+N/E46kefXY/3bpY/FNGqVgYXrl2aeu6?=
 =?us-ascii?Q?szgrN7AWI6KvXWMEZuWxTcBg6CPfFK1rvTCxWto/oIuvw00HX40YADj1BHgm?=
 =?us-ascii?Q?iQ/oDJ+cZF/HWcSoUc9Uhs/6+CWyFBjVikqB7r2gbR/n7/GnAA/0H26HkY3b?=
 =?us-ascii?Q?/PtMOLusyPSwcQ+w+xT1I3IZybmr4k1+7Ian/4uO3/bD3ABtw2lX7Ko8ogh8?=
 =?us-ascii?Q?2c/cpl9I/xHQHhjBq6MEc+XoQwWiqVjK3pTFIFOWLMSdv+VkXlylaNnwStVl?=
 =?us-ascii?Q?Pe8ADAkhKGs+gLRWF8KKSdbG/dHDIbFr8456ywen49wF9pl0Y8ED8ex4P3aJ?=
 =?us-ascii?Q?XkDUGCLptkpix0t+zR6qQctfQM0S64XIjWJAm4y/jTPXpiZCqb05lvqBF6TC?=
 =?us-ascii?Q?pkaD58B4G4A9ybApWF0ySztnf3YcGV0H56ALmTQE628BjT5drhd7dErRhYko?=
 =?us-ascii?Q?fOdn4jKRxBjtE/VrvSdMrWy68/lcFMN/PIvF3Q0iNUFXrPGu7gZTajQRzJ+x?=
 =?us-ascii?Q?uG6dr+OpZEW92tuzkMPQzOHzuyQQJuVIGu9RNWMs4Z8JVMKAaflJMDMrpXNH?=
 =?us-ascii?Q?HjyKGQY2dVxUH5wfznKF77nmSyy0VSUZTDDzA7AkMck2PolJHNYHvwMHzWZM?=
 =?us-ascii?Q?SazeaniZTl9xop8oa6YNojLvLAdoZTCe3HNWBCdRyB4A1aFGqYv+NL0lhswX?=
 =?us-ascii?Q?JEz4A8LSZC7sDH9MGZcM5zz8TyJY6fvkwp8loq0gamFprx5aSxSRBvQ3uUK2?=
 =?us-ascii?Q?mFkzF4auYmSA4p7joZ9YM5BDCVKA7b7RfIyXJVD2nQUBMDxSuz3wtJgmnqpY?=
 =?us-ascii?Q?jGCuy5/a3Oj5CnWgmVxQKI7/aW4NBqEiGiObWvyYQrzwgmQ6bXZ2vPa7KMG8?=
 =?us-ascii?Q?FjZB3QtaqACssnGdYHPBpDIIMjqPni9xZxQADi3XJqo1wWyMAK/I6UJvL/qZ?=
 =?us-ascii?Q?2D+qNeWLrezbvPvcHlncdr819GZFUMsk2BT9m5KNwSuvUjzFq4n01oYRo7Zo?=
 =?us-ascii?Q?5/PoUUJUdrmh4Wfdep+gWYXEFbOH+eZqnEKVOMQDkBXF3XCJ3HhjgKn4ot+K?=
 =?us-ascii?Q?EbDSf6eFQRPX+eZbGY0jR7aU0DYISfw+nyfrCxflt4zpeSvaEBjnmRG8sipH?=
 =?us-ascii?Q?zxsQaH5mAms0r8hFI7XFflOSTNCyZBw211sGsZ9b5roShHJFnv7X5D0f4Hun?=
 =?us-ascii?Q?K0EBqDY38D/Jax4pLj4791m5MPvC6mg3TSWxJpwzN4juW8mICpH3D8s8C35W?=
 =?us-ascii?Q?4CUh1ddkmDZvPfk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5021.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G6tYxfpuDVJEzg7YnpcVxld1UFoaXGt8Iyv7Gkh4mIrpv3PkNR2uxVmh34gC?=
 =?us-ascii?Q?rFk7vYRNbFcT8QpcLR5CoGtHNBDSgmqCr9u/IJgI9lMXHJdiKrwJZBEi70s6?=
 =?us-ascii?Q?19BVT4Rxw7qkspPW3H5QevirjuhTddKaCXmxmdk4tW9R8ONxkSWf8tVQ2W0K?=
 =?us-ascii?Q?PPVDrWJKIT8Ogz81nQFROzjIwrd2eVZhSkRVREZh9vEi72d51HcXZaN7v/zL?=
 =?us-ascii?Q?sVdEYcMTjaM5f29kMrpzx3AKN4RpyAQdkdtRIXYbLuqWE0MAPB8SHpgWF0v2?=
 =?us-ascii?Q?Z36nSU29z7hEKgaqc+85Z/SyCOaM37lt+/mkhYtRlL62OXuAWDDzTTK7NKGC?=
 =?us-ascii?Q?fHi9BvfpHhlGfijkoH9vBDv2G9YXQje+J+YLhzXzaL6U1tQTqirBHRzRZwX/?=
 =?us-ascii?Q?12KE9dlHa24igWjS6kAjJ5g4hTJSgD6uIqgpgbDVg2tIKafHm53h52JdM9Ns?=
 =?us-ascii?Q?WzBAbb+dQAX4tZK8X0yHampJHv5qR8uG7svZ1RjO45vMjD5dOhFfdiS7AMjI?=
 =?us-ascii?Q?Fh5EvMbTSl2/Msb4uUD3XFo5iZw2SO1eAGWFEZuU6FAcskHpWyMXOzEkQYPq?=
 =?us-ascii?Q?JxeKN2xeSmFqfrbBgSDtGjno4a0JnirrNlIOjHcsyBAyaQiRBjOHdfIi37sU?=
 =?us-ascii?Q?U1yyOYxnjzDqxK5ROMsx8VNgE4XJVCgLpyrO6fTceZhlTA8SkazpBGJCBJTm?=
 =?us-ascii?Q?403WRkOeshT5JkkCJQTKkoiNm5N1ypXBjFBI+gDYfu7gC3gdmqCxSwZkl9JP?=
 =?us-ascii?Q?ncGTiYY2C3RxB1UdOtIgYDN/+jxdDcJJTVuVa0vVDUg4LsB3gzvt/gAz+a15?=
 =?us-ascii?Q?yH3w3sHTAeUeI7qxJPc1H99/P7/PgSGgiSIBMccj7Vw1J6fVoYofJvyx8Y2I?=
 =?us-ascii?Q?A9JVWIQDJPLECA4/yTLTEqoaE7UdJ/uWiear+EX7qzmqOw9HwYLGmLqcBHGA?=
 =?us-ascii?Q?OadD8o+3jwvyXdojwAhCUk+CZdrrZ9qWfhp2c6q44bo7yuNsGuYUWztCvCCS?=
 =?us-ascii?Q?+ADVsgqnUGw6bMPPPFGQYa3JiHucnE0p7pzPWjqbIDZ7hxC2OABvTGNOTbV9?=
 =?us-ascii?Q?Py+wVmuuAFtKWSFxdakoVsOcbe+69KgeNNjwHtIyL8ozOus5gHkSpBlOaGCK?=
 =?us-ascii?Q?glJ6QUmBtEPLz3/J985FgjpJixtKr828wdZWpbT+ffhW6W0k/HrTBmt+XzwL?=
 =?us-ascii?Q?iTUyxkDMHEzTUs6BJK+dBuHWnGurcuBLD5AT8NZcL1102pQmul50E/xzyWoU?=
 =?us-ascii?Q?mnSMyq7taJl7jaTK+LJp30eAXf+r1csGcMDide/d94l2siCQ1JNDTsLu0KSM?=
 =?us-ascii?Q?hF9jMmWJ5fLXIAq8GrFGVLYkUYddNRZDNATgpMRzAcs4rstBh8WiOePJZ/fx?=
 =?us-ascii?Q?NqBQJmiZb1/dbxjxuuEyiRVQkvIXnbBQwQsS2Xq3gBMWkc02MEYLNh5xt1W2?=
 =?us-ascii?Q?uekzYom5+jWhbEaHm4EwBo3EBknjH5/ED4E1Fw0BGNbMOZr8QPaprtx917UT?=
 =?us-ascii?Q?yIecoDgGJGUqR9rpiny+WkxAjcslWjkdwqH7TVbbWjx/cdEGJvMel/Ho/C3E?=
 =?us-ascii?Q?mEVAs5HlKfX1gAix8Oo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5021.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0745eea-87e3-477c-8bb2-08dda46f02f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 20:24:45.4353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8V8f8x0Gtrp/i4tYPmVlOFYZBU9fHXnsr7+5Yt05sTOCFal4tFKZfn468UB6djytfssIT4nPNBeEUBRs+FQhcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6486
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Francis, David <David.Francis@amd.com>
> Sent: Wednesday, May 21, 2025 10:07 AM
> To: dri-devel@lists.freedesktop.org
> Cc: tvrtko.ursulin@igalia.com; Kuehling, Felix <Felix.Kuehling@amd.com>; =
Yat Sin,
> David <David.YatSin@amd.com>; Freehill, Chris <Chris.Freehill@amd.com>;
> Koenig, Christian <Christian.Koenig@amd.com>; dcostantino@meta.com;
> sruffell@meta.com; simona@ffwll.ch; mripard@kernel.org; tzimmermann@suse.=
de;
> Francis, David <David.Francis@amd.com>
> Subject: [PATCH 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
>
> The kfd CRIU checkpoint ioctl would return an error if trying to checkpoi=
nt a
> process with no kfd buffer objects.
>
> This is a normal case and should not be an error.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index a8cf2d4580cc..7aa34bd15958 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2570,7 +2570,7 @@ static int criu_restore(struct file *filep,
>                args->num_devices, args->num_bos, args->num_objects, args-
> >priv_data_size);
>
>       if (!args->bos || !args->devices || !args->priv_data || !args->priv=
_data_size ||
> -         !args->num_devices || !args->num_bos)
> +         !args->num_devices)
>               return -EINVAL;
>
Nit pick: The if statement should also allow args->bos to be NULL.

Regards
David Yat Sin


>       mutex_lock(&p->mutex);
> --
> 2.34.1

