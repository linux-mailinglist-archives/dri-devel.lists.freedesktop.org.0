Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17AA65D8F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 20:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA4710E008;
	Mon, 17 Mar 2025 19:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QNP2hrK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183A10E008;
 Mon, 17 Mar 2025 19:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT0xbbJERTYi2xNXn9DPcfTNclni5MKXP5dmUD2FbHRHTW0FNvo4P/cs0OAqoo4njK8kLrVvQnVGnnDDflR3L9t/Vnyia5MVh12xps5/58xYPEeqTrq8SdCozjZHM0xrvdSFQRtG7dHRfHN0O0KBB55ano7PvJ88Cl6EHbCydUfmR8dD5PBd+OAOm5HAt1KUaX6/CiuwaVWHLqfhR3hV2P8/6e4Hfb8V2AoUeP7MTrC95OmjdiuM67uv0dnJ8nKxjT4i++tWwVeHBA6KHBTJdxbcPazMjil7tRDP4wSvpyK2CYb0zpQ4pKQepNHcY9Xp2Cao96H0SwKwpXas9gWQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rXzUhg/snUqYAFCBXvweazg5JDpoq0WCYPuqz/497w=;
 b=KiE8HtHUwCf75MvIQelbsAUw5XYxnXj/9m0gM5KsGYGm1kHdozy54CEGa1aYvJz/xkT6uznXUKFGWowOAHxNpHNyQ69ROaBKrg16bhbhwM4t5UUFVoHnh6V/G7dc50K35e5K5umvAQYZwa0etR53ovGN40/K/jeJVmhyE4bRU3/+WT08YnjJVTGWVvWL0mKEZPN5IIw627fIQlA2FElS4UD0cSXkvCH+1uVhcKUhHPbKBI3kD3FXnbYrRQcq265QNeb3CD/lwntmoW0ntx6LKms+oTzWVjkZ1X5THBEFyikpVyHAjtXeNV567kNVefpBgNQkXW/OfootmSdySNj/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rXzUhg/snUqYAFCBXvweazg5JDpoq0WCYPuqz/497w=;
 b=QNP2hrK6rN8kvI0ASQSA+bQ6eyPETzSYJRicgXVF0xzynpYLn5jJVIbopz2uBh1oBUHXfW0Xnr+pwTLbr0YPz6PiaFwYdwbFqtK07SwEMHGm+Ik9GywUVq8xpR7DV99PySAuRoN6TLsEu3pmR8awSpLyn9KgBheX25Vf2Nsp8CM=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:07:57 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 19:07:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics caps
Thread-Topic: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics
 caps
Thread-Index: AQHblH8K3YfbL9tp4UWuRjXxEA635rN3tdJg
Date: Mon, 17 Mar 2025 19:07:57 +0000
Message-ID: <BL1PR12MB51445BCE0365432BF55DD3EDF7DF2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
In-Reply-To: <20250314011809.3243791-1-matsuda-daisuke@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=8c6b5f1f-e09e-40a8-84b7-4d15a4ad721f;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-17T19:04:49Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MN6PR12MB8542:EE_
x-ms-office365-filtering-correlation-id: 69a01668-a0c4-4029-a5ef-08dd65870730
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fFpbEBuuHL3Mua+VCh03YQVUa1waWc5JhsHX3eS7LFGsXXM+QilhwmvhEycd?=
 =?us-ascii?Q?8mXqfDLEUxUJxgLyuhTJ2L+Kbwz/Cj3kHm9S6O7hkcce0sO5swTc8au9dL2i?=
 =?us-ascii?Q?Lo68JBAkBe5RJGOJRvNqnnq38fMbM7g4Ug4ZEGtzaA3lDWv/JKyWG9x+B9wK?=
 =?us-ascii?Q?fr8GxcAZpWBUjRM089tGhIt7pLjapDCu/2Trr8WJC2CASlDV13eCHZ+8WcRV?=
 =?us-ascii?Q?xGmTdn//6BMVJXM1NBDIVC0nTQdcFUIDHtysei0RtsWzu3glbI8oAsWlZd+8?=
 =?us-ascii?Q?wtY8q+dYIow3L8vwJCaWZikHbP2jb4o0cEORms9D9LGkM/qKpBTXf+kum65b?=
 =?us-ascii?Q?7p9OMibb07fULTQzbv0D7Aks/+mA+bZ7uuRf5b5xuv1uosGeKhtRKRTeAqbM?=
 =?us-ascii?Q?ULPXAqxF8QYALjFF3cWSYZ4KSPHfBEsAoXTw4tgSqC3wc5/zxfn7WLgxNbd7?=
 =?us-ascii?Q?/xrhx8OWvJCQWGZymcmCCV2sr+lu05rZmdlKxOJcI1Y58Oi6k5M2UNDrd4HQ?=
 =?us-ascii?Q?XS85RDCkntq+tvmsDEhbG5WZ4fxLL7EujV6TWyu7SQBlRfsDLHggwcOWNDtq?=
 =?us-ascii?Q?HGWDusTey/pDfO+INCHUQ4gnYnaXpqOAYzeRUWK3APAtQ8L0CPx7kvg8XnGX?=
 =?us-ascii?Q?DUz2PRGS4KP8aU/+WQdqZJ1I7xwSMj08853zhWE1pWHNml5pjmvy2qGWZPIe?=
 =?us-ascii?Q?RFGnRy/zZ18DBkwAqfLOP2fyv3q4PqZkol4lT9QhoarsZ/0bHehSjVpHqYtc?=
 =?us-ascii?Q?U3UDasCKgRqCEc7vkouOlSjaSZQ62QsC/bw1jG4KOuxQK+ASvX2GGikNdsW3?=
 =?us-ascii?Q?Gm7/rLXQauF+LuGrSiVe38pckzHMnLCzn5bSMzFLCsJFbGxziOxMNC2d9WeE?=
 =?us-ascii?Q?iT7wTEFsy3K1QaCNYgGUCJ0py1UQQBj6gDK//jqEmXwtpze1xi2tKhEsvin2?=
 =?us-ascii?Q?ffqe3CZ91hpK/roVLM/vpTL7dq7Kz/PBYJsYgW477L6k9SG2G+4qqBApgQum?=
 =?us-ascii?Q?YevBrr4wfpVL6A98lYJ23QgiKnEUjv1DTqYwwHz8D/AQ+acvGrDTX68RRGLQ?=
 =?us-ascii?Q?P0zK3DjEnhQRiLEEzPPQMc+pic1YJE4FTYw3JL7i8kKxZViESOhYigvhUXyg?=
 =?us-ascii?Q?urH56yKxY4DdTGg5G8vM+GYxJ8F21l4b2XrN7SWhVjn0dwU7K4gA7dRr1GI8?=
 =?us-ascii?Q?GlWM8/GbM7WdebzStcLrEcGuOd4dVKAPxrR/ccCzHQBom7HTCMlh6nNSOYDv?=
 =?us-ascii?Q?LZfCI3EYoLRZKQLY4m6eE0lAzUKoDEK8tUP/GOyGidqGzdaGo/wgT+LYKwIW?=
 =?us-ascii?Q?w3f4/d0vVmO3THBkqml3QO/u9hlqdGb5D7SynspOxenpEsttw4DSng8tc2J9?=
 =?us-ascii?Q?XFoKlx5A/LnyHkhVvCCBW2MURH5iLFu/noubcEkR9CGoegJNbMb6XtJ7GpbV?=
 =?us-ascii?Q?K5wY4PzVN8wd5RvBJZv55AJ7z7rkBuJR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dWLzXb3kkJpiscawLavhtphJ7clyAVfb8gC02KZrG5gydlHITEKuX1mO9lku?=
 =?us-ascii?Q?s0xJYL4oYdmz2YSgypcJHZPBj+obcDBDxS1ZNpK0oTz5RZ4riFYL5AVtu/Y4?=
 =?us-ascii?Q?DvTq6BOr4t0J0ULFYLmrXeGRKhAB3L2Vw5zEuZ5QrGnGxTuiWbJuCJVSuBwF?=
 =?us-ascii?Q?sR3M5jcr5C1Vh58N87o7CONqoBS3CdMP/idS9E4cZ2j5hLlAOTbAih+VJdak?=
 =?us-ascii?Q?fcj162onpjttvS2cvZ7Bhrrvaht6/sZvLAQF+r9subfObsE+ZqaACrucdcd2?=
 =?us-ascii?Q?aLD0wFGs2U2McCLSKJnHr43YPIhVK4EhA8q8Mw7rAkX6VVx65FxyiwbPsm9n?=
 =?us-ascii?Q?aYIYI7QJBB86onBfbnzh2uyPVY+K5UyR+2fl2YpruBelFmcFIvub+yKrTFFD?=
 =?us-ascii?Q?Wm/UvGUFm40CYiXhq99/pM132jZbwH+R1T0h9NoZwaTi55XK/2RXikMNiSuB?=
 =?us-ascii?Q?rFDGH6pQlEmKN8rTPhgy1Upuze1fouyRdOGVVT79IGiPWotq1xuye1jGz608?=
 =?us-ascii?Q?NOoIapE8a207tRmp74EPTxp/NhhZRVUFoGyHtXpBu7+FuZg8AqSM46PN4D5K?=
 =?us-ascii?Q?Xc9tv99TutqtMJz1cSOCNuk+m8j9AiX9X+7jo627BKUr67vpaitGDpXavoZb?=
 =?us-ascii?Q?/pxlhjQsq+S+3M1ktCtAyvs8RgUNcOmvktEY8mdG7y1LAKo2S9KuViahytts?=
 =?us-ascii?Q?GIVWf2aE1jtyOgtX5Ey4JpVOmIQRDwD7OAV/oyT9x4vYAXYz5yO4mF20bYGQ?=
 =?us-ascii?Q?YeFI0Qz9RLAc9bHZcbTLN232ySTtPLfJ95orhb8pseYGDBMzPYriGbYypsNN?=
 =?us-ascii?Q?A0wI4zIvLPWJGCzK1mZ/3lqDgQr8rLD0adVGWFDWHqUeb9KbZm3eXREYLMjd?=
 =?us-ascii?Q?FLgjUTL9mTXNFMX/MVyYCnZy3NGRMEo/69f0dVGjbW1eCklwiCqU9ohZCaNq?=
 =?us-ascii?Q?XlmB6u8xzSpocPbBhYWl8Ded4ksuTb2wNoXmsElvw3d9fiu4W0grDZMZgZX+?=
 =?us-ascii?Q?7IYDveo+gjcjqDQrSLtvSrtf6KENUwe4rw/4cXVHQ3nsWUPky6Qgkg21+6H8?=
 =?us-ascii?Q?efvOk1joyRvlPS738D6UG9JcFvkxsoNTNf8ohZNp/4c57Z6myjCF17aZ3U3e?=
 =?us-ascii?Q?ELhLdZeQ1li+5H2HGnbBPGOqeMvBQRUH/HUtD6Ra1LqN3F/qyx7STKk0XR/+?=
 =?us-ascii?Q?uHRlQ/3euVWUAytCxKTbVAQuXUrK2TPoiI9hP3+cvYOGSxntaDEuAcnTVcqC?=
 =?us-ascii?Q?IXhTLHGIx04U4Unpc4udRjDBWjCzbOm2eFrwUB60dBMaqgwlfBDwo+IgtMNs?=
 =?us-ascii?Q?Bnd+xEux7aT0LJHRXCMXsK/+6uMLGl5y3kMuJErWvToxXt/yOA4eGq8F2qTc?=
 =?us-ascii?Q?qh/07Jc2CiJOW2flKKpjHh+HTUxx21GKM9yj+SZFVvfG2i+Wr/nZst7ILG3c?=
 =?us-ascii?Q?oaeQkE+BWhEUowhRmERkWLjQLNHkFtEQsFYOd4+9hH+6b6QN9Tc9WEp7aKDf?=
 =?us-ascii?Q?x+Uk8y879ulAFTZQfXonRp+mfmLDr86XkYCA6yEJig/ExCmHV9zg5XiTWspP?=
 =?us-ascii?Q?3L9a/M2T3y+Ue6dRNwY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a01668-a0c4-4029-a5ef-08dd65870730
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 19:07:57.1579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDapmPdjPS+GRWl4iaMRV7Of2ZnC/HRfc5INMmKnEgdawjLucMarvOe9fs+qytxW2rV+wu3LrJ5Q8mLfsoLPsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
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

> -----Original Message-----
> From: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
> Sent: Thursday, March 13, 2025 9:18 PM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Deuch=
er,
> Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Cc: airlied@gmail.com; simona@ffwll.ch; Daisuke Matsuda <matsuda-
> daisuke@fujitsu.com>
> Subject: [PATCH] drm/amdgpu: Higher log level for missing PCIe atomics ca=
ps
>
> Currently, ROCm requires CPUs that support PCIe atomics. The message is m=
ore
> urgent for GPGPU users, meaning basic functionalities of ROCm are not ava=
ilable
> on the node.
>

+ Felix

My understanding is that PCIe atomics are not strictly required, but there =
are some features that are not available without them.  Warning seems a bit=
 overkill and potentially confusing to users that have an existing system t=
hat otherwise works fine.

Alex


> Signed-off-by: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ++--
> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 018dfccd771b..faeef136e272 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4374,7 +4374,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>                       return r;
>       }
>
> -     /* enable PCIE atomic ops */
> +     /* enable PCIe atomic ops */
>       if (amdgpu_sriov_vf(adev)) {
>               if (adev->virt.fw_reserve.p_pf2vf)
>                       adev->have_atomics_support =3D ((struct
> amd_sriov_msg_pf2vf_info *) @@ -4395,7 +4395,7 @@ int
> amdgpu_device_init(struct amdgpu_device *adev,
>       }
>
>       if (!adev->have_atomics_support)
> -             dev_info(adev->dev, "PCIE atomic ops is not supported\n");
> +             dev_warn(adev->dev, "PCIe atomic ops are not supported\n");
>
>       /* doorbell bar mapping and doorbell index init*/
>       amdgpu_doorbell_init(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> index b4f9c2f4e92c..c52605a07597 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
> @@ -240,7 +240,7 @@ struct amd_sriov_msg_pf2vf_info {
>       } mm_bw_management[AMD_SRIOV_MSG_RESERVE_VCN_INST];
>       /* UUID info */
>       struct amd_sriov_msg_uuid_info uuid_info;
> -     /* PCIE atomic ops support flag */
> +     /* PCIe atomic ops support flag */
>       uint32_t pcie_atomic_ops_support_flags;
>       /* Portion of GPU memory occupied by VF.  MAX value is 65535, but s=
et to
> uint32_t to maintain alignment with reserved size */
>       uint32_t gpu_capacity;
> --
> 2.39.1

