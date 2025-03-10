Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B188A5AF86
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 00:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9F10E4EF;
	Mon, 10 Mar 2025 23:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T3ot8dcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04E410E2B1;
 Mon, 10 Mar 2025 19:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTEJVYXdkriGGR0/buQ1XySCkA0VqXaM4GoZuFM+6FgWZnp/PRdDguXbb98UDecp1rpvWSBItgk0XC2C5cfCvcXSuSq+4Ex/XRCVN8vHgse6f56/NpbI2NjVLyOZShandPrFU6+ePzqz1CFtcNTKld1h2qSn7DaXPLrTagEDvjbrNro7tI85IYRECJA+s8Mca0732I0Owh+argW7IBjcV87G6YhoHQ1yic8fcGheTIkiOGpLYG5kb4QaNyrweQljt1NYFVTNh64M1wMByh80CSV1XgvdBQfG+brsyAqacLhvIDyZ1QMaEaP34Qdrqp6LoKVHCTfoamvKHTpL5qbmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKP8uZLx7X7NkY4CGLs15ZkJKmL2XFTONbGSXnsoVWs=;
 b=Rek6NoYZj47V90S2jcGuhoPH4tHnSxkWUyqm2lzFkpwboD+5HIr1lMicissKCH1IYBpVTA74NQr8AGYBg3503IB92O5SzJB7kRjaT6Oit7NvB4m3xvn7XmvvN3w9a6MZsMC1BUX5Gp0TW2IJopTtXWYnaojaj7ExXYf9CiIjSiDYnrvHKyrCEqVZpM1BfLuFlCGpZJY7OAz2p33JQ0L9HT4haId2KGffH/XbZF8KL1n15jLhJQ96BsNKnQZDXRdtpl03CQQcgt9muzDsqRG3CNBazqfPipevmJ0Jz2IYXXhS6iKybgNsdaxuxlZzSPBjgt/9SpvTKEd23Ts0SAOtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKP8uZLx7X7NkY4CGLs15ZkJKmL2XFTONbGSXnsoVWs=;
 b=T3ot8dcm1nM7sSHai3rBbux8DFn7jZB9wN2TR41w1TA2V8gzAybEiWQkjzcKrZMpDSbTnhroBi/LM5mh0itoPmtip8yj2F8l7sSEuCab2pL2NR+rfAQ1hfKMrAqOJ430EMcABbGGK3/lO/rMsc26nPcqLYVOjCzsfqTFBfuO5HE=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 19:33:30 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523%7]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 19:33:30 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "James (Weijun) Jiang" <Weijun.Jiang@amd.com>,
 "dcostantino@meta.com" <dcostantino@meta.com>, "sruffell@meta.com"
 <sruffell@meta.com>
Subject: Re: [PATCH] Support dmabuf IPC with amdgpu CRIU
Thread-Topic: [PATCH] Support dmabuf IPC with amdgpu CRIU
Thread-Index: AQHbdBIwlnib+Fb5Xk6G+XPO2CI7R7NYE+gAgBTqbl4=
Date: Mon, 10 Mar 2025 19:33:30 +0000
Message-ID: <SA1PR12MB8144041B2283C0DD7BE90C80EFD62@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20250131185829.827297-1-David.Francis@amd.com>
 <20250131185829.827297-2-David.Francis@amd.com>
 <2df3a84c-4a2c-43d9-9922-05273fd5df2b@igalia.com>
In-Reply-To: <2df3a84c-4a2c-43d9-9922-05273fd5df2b@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-10T19:33:29.664Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|PH8PR12MB6988:EE_
x-ms-office365-filtering-correlation-id: dde7c29a-83e9-424b-1432-08dd600a7053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?53GJjv+IlgjsaOuD16xnmj2M6b6My+cm930yTaB1aXnzLqUDsbZwOuzX8Vz3?=
 =?us-ascii?Q?n4AS9htGfaew4mnvbUDgpmJrzZmINGs/G5SPfSCllHRUafQS4Wd38PpECkIU?=
 =?us-ascii?Q?R25EoHltg/7EECdOLt14bkq0ViKdSmC+E5YW0IH69l4Mj+f6yaxPUswnGPXk?=
 =?us-ascii?Q?BvGfyyks/yB1ov6HOg0BxhhmHlwd0E2vAQXny/wIbR/TaXm5GN2Shfwa7aU3?=
 =?us-ascii?Q?okJjBfpH3clDCB20p1XrMsIctEI47l15c8iKSnzO/73sQepFFR4mTpzpMW6y?=
 =?us-ascii?Q?zY4GtVeJziJ30blIaNRgjI6d2oc7kzp/tjs+AbVc3MJTys6nUbi6lu0gB7qv?=
 =?us-ascii?Q?C0wKV59QxQUPg9d1qR9j8zm7zotyU3drMO0RtO5JN7qzCvv9QephisX/+Tcb?=
 =?us-ascii?Q?fPin/vycgdX16ttPzam/Q+6roo09K9VACYd0Hij1CIurAMO2z/NR9P/VuFzW?=
 =?us-ascii?Q?RfyYYzkOZXTwY34GJkls7C7eKrG9IZrB0aX2BjrqE0wuKCQwOYe1FBQSyQYS?=
 =?us-ascii?Q?lzlBorQY65hHhBuA1G6PoCgMrA21JQtPGxn/ngiNQYQy6puQ6+CuzILUDx6L?=
 =?us-ascii?Q?dUgxTHkEwvOQFc1Zew1mp3JPXCxxlr43/RzDE4ViOvyOiB/epeeFbsMq6FpF?=
 =?us-ascii?Q?jP2b6cBm6SwkG0Sn7xTXd+mXdCyp6wfHVZwxpoXP2eeSqG6iTSLkeVSozkvF?=
 =?us-ascii?Q?rgQrrVcXRTT8Y1XZ4PG7ckNgkXjA1w5lef2Utvn/YWnzC1XNk+/SRS7WtOTl?=
 =?us-ascii?Q?9jtoh3DI7DcenH2FFMo2fPx/a7nAB6D7U0YdS054f1AX0RfHownO8ax3MUFK?=
 =?us-ascii?Q?zciDHIsWYIfbnBj03R4qWxvhqy8hzKiYOCrAsz7Ile1M1wLQjHEE8oU9+iUp?=
 =?us-ascii?Q?NBbFvHsLD1vdW6DdIfYD8zCSY+GE5/edCRiU1EWupROK9QQ02VFCtwvV0VUK?=
 =?us-ascii?Q?FwnekGcA/LejzQgD0obRFz0qe8iWEqIpMNPeBI7LD2rYoEsM8ct9tBR7Btaw?=
 =?us-ascii?Q?fbIHGxCRCFgFQSPAJTZMoyNxSFsPHpVmd1ShkYOVByulOUeyr/8gbDkURiGl?=
 =?us-ascii?Q?eQXFc4e72Zf4yImi9jZ0LaZa7sBhE8AyKPOkmI4aU2GMa/AOe1GbUTj6/yyd?=
 =?us-ascii?Q?JFiPErYs4MqgsGnopt3hqahIx0a1F0dVGER0bw2feub1Z5iNXwAkkFJJtnhj?=
 =?us-ascii?Q?JyJlH3hhLv8c3WPwjrI9I3ZXKAPPQvcqNV22+WsVzH2F7PQaVdLSKUqIKmux?=
 =?us-ascii?Q?hm9entpiLVRson6DvwqbE9PpgBOzSGzVu9/K1uZhArfUIAUCOTFRv5Iw11T8?=
 =?us-ascii?Q?CSydYyyx4NiHrAMjKfiz1vbYSprJGh2PDybWJ1ubqU55kodlPqDw/xQzKEDM?=
 =?us-ascii?Q?4t9yrcywP0pR4fog0O1Bt2bycI3Hf2hbbPV+wozDPzL6uK4Jil3EkLUriuv2?=
 =?us-ascii?Q?MYt/bWyHbYPx3IRXS1C/1DhyKaLCMK65?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C+kVMkVn51wQgB9CouZupPgkJn7/O9Ik2d0rAi/NIt72kHXpOfCahGer+Tg9?=
 =?us-ascii?Q?vQXS1MIq0XmJYdP0UIbCIZfiGmzliQcg8RzctqvZ5GIiOTJ+q0tjA5MSYGnN?=
 =?us-ascii?Q?6fw863tTo098g54v6Bij9tdMpNtAxfalFcgQ+mLc+oahE0wvHJ79dlkB4nh3?=
 =?us-ascii?Q?zLIBp5/igSudUoW9eIW37OSF3K24pDw71QrmGl3RaoTtY9IRi2ppDyLUQPB2?=
 =?us-ascii?Q?TMAV3vwY67ON0l3CRBzgiWDkdYvhHuXB7e8HwHWTLxmjiWkiHLKvOZfve0iH?=
 =?us-ascii?Q?qI+BIid9bDe+ZZrpo3QzCMirPgi279tKKwKNYfBNlW94fbXB/y+Vu39cv3C9?=
 =?us-ascii?Q?C8OWZZQhMOTGrO2yn5kKijErxKXF5hfJyd+3USVAZ3PYo9tJLTin0mcYKnYM?=
 =?us-ascii?Q?nCUkE9YiSU24UcYdWoot6XpoRpo6BJ8v7KFZtlcGifwDJIboU8gSxEaXKzep?=
 =?us-ascii?Q?WHz95EjNlps7RdTMVBZJEttlDMbXM0I7l/9TPv19vk50gHKgfGxgEbT8nyej?=
 =?us-ascii?Q?ffrjF8IN4YRFh87CAqpv5rUgvFUAIg9fGwWz+WF/GbkYOVRZ9c8j+Gkb1+od?=
 =?us-ascii?Q?RP2IStPZjM+6yy1MVRnH0b2K3AZd9bHKgUiFyivcTcWSxKjf5sGGofmg0YsX?=
 =?us-ascii?Q?NujsEybKx6Qzz5eOZMuz5RlpIg6SbgzBUyAluPTio9LRZoCV2e9fFSOuwDYY?=
 =?us-ascii?Q?v4qMWCBo0yT5GKrd7/aaldVihlxt3XQqnfjiC4Hr33fxmMCRKia61ffAKVQq?=
 =?us-ascii?Q?ZZBUa0pu98GiGlM7yW8Qb32vWDbZLBr4kPF/VWSKCd7Gq4vo8cUJkJEAlSth?=
 =?us-ascii?Q?8m6/F+QmRk/5b7dSu70McMcBgri2YM23ajo/Cg3MxJwLONSzK8eakfXes2st?=
 =?us-ascii?Q?Tw9rp9ATsxhsTYF8u4kVbodJU3M4FYT3DIzLFUxcWVS5HonKUEFIqnCTPLuI?=
 =?us-ascii?Q?iYnfqqwtHxG4lRJFotw7gdCeMR15QDa/bntYD8H0WkevHJMeZsg/9IUF4MmN?=
 =?us-ascii?Q?oVQrSjeZ9Hlt8VwLM7m13kkb9/gNFj8g2OVw7YFovveCXmutVPtFWkYWcOBN?=
 =?us-ascii?Q?cf+8eMRqXTOBULtz09oa9VGf0e9q/44UZ+tfsPmriiie2vkQS9Sfi6ExXwAA?=
 =?us-ascii?Q?PPU7glGWqvwq1yOhLDLkvjdU17vDi27iHOSEBdULiPQ5IaCZqrj8LouMhR81?=
 =?us-ascii?Q?Nwk8khPx4idJ1Etgx/rl6tKtVTKdQA5t5Qk1Rot60BUmRwfCHZ0NM8rnAStS?=
 =?us-ascii?Q?4ZMCRBPA3Z4VvzbvZbREon0FlExsUZqhIXJY3gvY2sPSQ+rEByDt3xUyQ6W9?=
 =?us-ascii?Q?NNxlI8BmCW+KWoGZkRglcEdhGgqFDWVbV9y7WLsrSH9uu8bCAIx5x53tVgZb?=
 =?us-ascii?Q?pGOG1vCyCI+J3c7kj9vkm6o8c/GuK7wz6As30mIJTK673yy4DQOJK0pVAHTe?=
 =?us-ascii?Q?lxrmenjTzxvBmwmBg60l031qrvZ/tKNKbaIerKMXqlRAoZGcfOG7rVZLOIiq?=
 =?us-ascii?Q?8rEZmUgxG0jOd+TIsdyrl8hwIyXetWDB29O8tJVW3Q++ePVh/xEGV0Vdr0ED?=
 =?us-ascii?Q?teK9rS0UuEZWZfiJ668=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB8144041B2283C0DD7BE90C80EFD62SA1PR12MB8144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde7c29a-83e9-424b-1432-08dd600a7053
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 19:33:30.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihEEecmz4c+YV61rrFOvSdhodfcJl/V8P3HDAn0sxZYXCwHoLRQDsJPrGSmXZczu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988
X-Mailman-Approved-At: Mon, 10 Mar 2025 23:50:52 +0000
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

--_000_SA1PR12MB8144041B2283C0DD7BE90C80EFD62SA1PR12MB8144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

>Hi,
>On 31/01/2025 18:58, David Francis wrote:
>> This patch (in combination with the accompanying CRIU patch)
>> allows the amdgpu CRIU plugin to support dmabuf IPC.
>>
>> It includes
>> - A new amdgpu ioctl (amdgpu_criu_op_ioctl), which has similar
>>        options to kfd_ioctl_criu, and accompanying structs.
>> - New "is_retry" field in amdkfd CRIU ioctls, to indicate when.
>>        a restore op is a retry and certain parts of the
>>        restore should not be re-done.
>> - New "skip" field in amdkfd CRIU bo buckets, to indicate when
>>        a bo cannot currently be restored and should be ignored.
>> - Two new drm functions, drm_prime_assign_handle and
>>        drm_gem_handle_create_assigned. These are similar to
>>        drm_gem_prime_fd_to_handle and drm_gem_handle_create
>>        but allow the caller to specify a gem handle.
>
>It would be best to organise the series in multiple patches. At least
>the DRM code API additions should be one per patch.

Yes, this is changed in v2.

>
>I'll make a mix of comments throughout the patch, some will be low level
>where I think code can just align with the kernel style more and so make
>it a bit easier to read. So bear with that please and probably just make
>a note for when doing a respin to perhaps consider that.
>

Most of these comments have been incorporated into v2. Where they haven't,
I will respond

>> Still TODO:
>> - Backwards compatibility between new kernel and old CRIU
>>
>> Signed-off-by: David Francis <David.Francis@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 401 +++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  24 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  37 ++-
>>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +-
>>   drivers/gpu/drm/drm_prime.c              | 146 +++++++++
>>   include/drm/drm_prime.h                  |   7 +
>>   include/uapi/drm/amdgpu_drm.h            |  46 +++
>>   include/uapi/linux/kfd_ioctl.h           |   4 +-
>>   10 files changed, 653 insertions(+), 18 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/a=
mdgpu/Makefile
>> index 6cb3a2b2725a..eac5a455e6de 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o am=
dgpu_kms.o \
>>        amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>>        amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nb=
io.o \
>>        amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>> -     amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>> +     amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>>        amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>>        amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu=
_dev_coredump.o \
>>        amdgpu_userq_fence.o amdgpu_eviction_fence.o
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_criu.c
>> new file mode 100644
>> index 000000000000..4f3e5cb61323
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>> @@ -0,0 +1,401 @@
>> +
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/hashtable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/random.h>
>> +
>> +#include <drm/amdgpu_drm.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_file.h>
>> +
>> +#include "amdgpu_criu.h"
>> +
>> +#include <drm/amdgpu_drm.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_exec.h>
>> +#include <drm/drm_gem_ttm_helper.h>
>> +#include <drm/ttm/ttm_tt.h>
>> +
>> +#include "amdgpu.h"
>> +#include "amdgpu_display.h"
>> +#include "amdgpu_dma_buf.h"
>> +#include "amdgpu_hmm.h"
>> +#include "amdgpu_xgmi.h"
>> +
>> +static bool is_import(struct amdgpu_bo *bo) {
>> +     if (bo->tbo.base.import_attach)
>> +             return &bo->tbo.base !=3D (struct drm_gem_object *)bo->tbo=
.base.import_attach->dmabuf->priv;
>> +     return false;
>> +}
>> +
>> +static int reserve_bo_and_vm(struct amdgpu_bo *bo,
>> +                           struct amdgpu_vm *vm,
>> +                           struct drm_exec *exec)
>> +{
>> +     int ret;
>> +
>> +     WARN_ON(!vm);
>> +
>> +     drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>> +     drm_exec_until_all_locked(exec) {
>> +             ret =3D amdgpu_vm_lock_pd(vm, exec, 2);
>> +             drm_exec_retry_on_contention(exec);
>> +             if (unlikely(ret))
>> +                     goto error;
>> +
>> +             ret =3D drm_exec_prepare_obj(exec, &bo->tbo.base, 1);
>> +             drm_exec_retry_on_contention(exec);
>> +             if (unlikely(ret))
>> +                     goto error;
>> +     }
>> +     return 0;
>> +
>> +error:
>> +     pr_err("Failed to reserve buffers in ttm.\n");
>> +     drm_exec_fini(exec);
>> +     return ret;
>> +}
>> +
>> +static void unreserve_bo_and_vm(struct drm_exec *exec)
>> +{
>> +     drm_exec_fini(exec);
>> +}
>> +
>> +static int amdgpu_criu_process_info(struct drm_device *dev, struct drm_=
file *data,
>> +                         struct drm_amdgpu_criu_args *args) {
>> +     struct drm_gem_object *gobj;
>> +     int id;
>> +     int num_bos =3D 0;
>> +     int num_vm_mappings =3D 0;
>> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pr=
iv)->vm;
>> +
>> +     spin_lock(&data->table_lock);
>> +     idr_for_each_entry(&data->object_idr, gobj, id) {
>> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
>> +             struct amdgpu_vm_bo_base *vm_bo_base;
>> +
>> +             num_bos +=3D 1;
>> +
>> +             vm_bo_base =3D bo->vm_bo;
>> +
>> +             while(vm_bo_base) {
>> +                     struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_=
base, struct amdgpu_bo_va, base);
>> +                     struct amdgpu_bo_va_mapping *mapping;
>> +
>> +                     if (vm_bo_base->vm =3D=3D avm) {
>> +
>> +                             list_for_each_entry(mapping, &bo_va->inval=
ids, list) {
>> +                                     num_vm_mappings +=3D 1;
>> +                             }
>> +                             list_for_each_entry(mapping, &bo_va->valid=
s, list) {
>> +                                     num_vm_mappings +=3D 1;
>> +                             }
>> +                     }
>> +
>> +                     vm_bo_base =3D vm_bo_base->next;
>> +             }
>> +     }
>> +     spin_unlock(&data->table_lock);
>> +
>> +     args->num_bos =3D num_bos;
>> +     args->priv_data_size =3D sizeof(struct drm_amdgpu_criu_bo_priv_dat=
a) * num_bos + sizeof(struct drm_amdgpu_criu_vm_mapping_priv_data) * num_vm=
_mappings;
>> +     args->num_objs =3D num_vm_mappings;
>> +     args->pid =3D avm->task_info->pid;
>> +
>> +     return 0;
>> +}
>> +
>> +static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_fi=
le *data,
>> +                         struct drm_amdgpu_criu_args *args) {
>> +     struct drm_gem_object *gobj;
>> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pr=
iv)->vm;
>> +     int id;
>> +     int num_bos =3D 0;
>> +     int ret;
>> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
>> +     struct drm_amdgpu_criu_bo_priv_data *bo_privs;
>> +     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
>> +     int vm_priv_index =3D 0;
>> +     int bo_index =3D 0;
>> +     int fd;
>
>Generally it is nicer to order the declaration by width where practical.
>
>> +
>> +     spin_lock(&data->table_lock);
>> +     idr_for_each_entry(&data->object_idr, gobj, id) {
>> +             num_bos +=3D 1;
>> +     }
>
>And to avoid curlies for single line blocks.
>
>> +     spin_unlock(&data->table_lock);
>> +
>> +     if (args->num_bos !=3D num_bos) {
>> +             ret =3D -EINVAL;
>> +             goto exit;
>> +     }
>
>Since the below loop does the unlocked walk it can potentially overwrite
>the allocated buffers. Maybe it cannot happen but I think it is best to
>write it defensively.
>
>> +
>> +     bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL)=
;
>> +     if (!bo_buckets)
>> +             return -ENOMEM;
>> +
>> +     bo_privs =3D kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
>> +     if (!bo_privs)
>> +             return -ENOMEM;
>> +
>> +     vm_privs =3D kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERN=
EL);
>> +     if (!vm_privs)
>> +             return -ENOMEM;
>
>These obviously can leak memory so just need to extend the existing
>onion unwind to handle it all.
>
>You could also use kvcalloc, or even forgo the temporary allocation and
>copy blobs as it goes. (If using kvzalloc suggests these might be large
>allocations so perhaps it makes sense to avoid them.)
>
>> +
>> +     idr_for_each_entry(&data->object_idr, gobj, id) {
>> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
>> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket;
>> +             struct drm_amdgpu_criu_bo_priv_data *bo_priv;
>> +             struct amdgpu_vm_bo_base *vm_bo_base;
>> +             struct amdgpu_bo *main_bo;
>> +
>> +             bo_bucket =3D &bo_buckets[bo_index];
>> +             bo_priv =3D &bo_privs[bo_index];
>> +
>> +             bo_bucket->size =3D amdgpu_bo_size(bo);
>> +             bo_bucket->offset =3D amdgpu_bo_mmap_offset(bo);
>> +             bo_bucket->alloc_flags =3D bo->flags;
>> +             bo_bucket->preferred_domains =3D bo->preferred_domains;
>> +
>> +             bo_priv->idr_handle =3D id;
>> +             bo_bucket->is_import =3D is_import(bo);
>> +
>> +             main_bo =3D bo;
>> +             if (is_import(main_bo)) {
>
>is_import() is called twice in sequence.
>
>> +                     main_bo =3D gem_to_amdgpu_bo(bo->tbo.base.import_a=
ttach->dmabuf->priv);
>> +             }
>> +
>> +             drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
>> +             if (fd) {
>> +                     bo_bucket->dmabuf_fd =3D fd;
>> +             }
>> +
>> +             vm_bo_base =3D bo->vm_bo;
>> +
>> +             while(vm_bo_base) {
>> +                     struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_=
base, struct amdgpu_bo_va, base);
>> +                     struct amdgpu_bo_va_mapping *mapping;
>> +
>> +                     if (vm_bo_base->vm =3D=3D avm) {
>> +                             list_for_each_entry(mapping, &bo_va->inval=
ids, list) {
>> +                                     vm_privs[vm_priv_index].start =3D =
mapping->start;
>> +                                     vm_privs[vm_priv_index].last =3D m=
apping->last;
>> +                                     vm_privs[vm_priv_index].offset =3D=
 mapping->offset;
>> +                                     vm_privs[vm_priv_index].flags =3D =
mapping->flags;
>> +                                     vm_privs[vm_priv_index].idr_handle=
 =3D id;
>> +                                     vm_priv_index +=3D 1;
>> +
>> +                                     bo_bucket->addr =3D mapping->start=
 * 0x1000;
>
>PAGE_SIZE? Or something else?

AMDGPU_GPU_PAGE_SIZE

>
>> +                             }
>> +                             list_for_each_entry(mapping, &bo_va->valid=
s, list) {
>> +                                     vm_privs[vm_priv_index].start =3D =
mapping->start;
>> +                                     vm_privs[vm_priv_index].last =3D m=
apping->last;
>> +                                     vm_privs[vm_priv_index].offset =3D=
 mapping->offset;
>> +                                     vm_privs[vm_priv_index].flags =3D =
mapping->flags;
>> +                                     vm_privs[vm_priv_index].idr_handle=
 =3D id;
>> +                                     vm_priv_index +=3D 1;
>> +
>> +                                     bo_bucket->addr =3D mapping->start=
 * 0x1000;
>> +                             }
>> +                     }
>
>Looks like some sort of a helper could consolidate the handling of two
>lists. Either pass a list_head pointer, or keep the walks here and pass
>in the mapping, something like that.
>
>> +
>> +                     vm_bo_base =3D vm_bo_base->next;
>> +             }
>> +
>> +             bo_index +=3D 1;
>> +     }
>> +
>> +     ret =3D copy_to_user((void *)args->bos, bo_buckets, num_bos * size=
of(*bo_buckets));
>
>Probably needs to be (void __user *) in the cast.
>
>> +     if (ret) {
>> +             pr_err("Failed to copy BO information to user\n");
>
>Probably make these debug level at most since userspace can trigger them
>at will and it is not a kernel level error.
>
>> +             ret =3D -EFAULT;
>> +             goto exit;
>> +     }
>> +
>> +     ret =3D copy_to_user((void *)args->priv_data, bo_privs, num_bos * =
sizeof(*bo_privs));
>> +     if (ret) {
>> +             pr_err("Failed to copy BO PRIV information to user\n");
>> +             ret =3D -EFAULT;
>> +             goto exit;
>> +     }
>> +     ret =3D copy_to_user((void *)(args->priv_data + sizeof(struct drm_=
amdgpu_criu_bo_priv_data) * num_bos), vm_privs, args->num_objs * sizeof(*vm=
_privs));
>> +     if (ret) {
>> +             pr_err("Failed to copy VM PRIV information to user\n");
>> +             ret =3D -EFAULT;
>> +             goto exit;
>> +     }
>> +
>> +     exit:
>> +     kvfree(bo_buckets);
>> +     kvfree(bo_privs);
>> +     return ret;
>> +}
>> +
>> +static int amdgpu_criu_unpause(struct drm_device *dev, struct drm_file =
*data,
>> +                         struct drm_amdgpu_criu_args *args) {
>> +     return 0;
>> +}
>> +
>> +static int amdgpu_criu_restore(struct drm_device *dev, struct drm_file =
*data,
>> +                         struct drm_amdgpu_criu_args *args) {
>> +     int i;
>> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
>> +     struct drm_amdgpu_criu_bo_priv_data *bo_privs;
>> +     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
>> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pr=
iv)->vm;
>> +     struct amdgpu_fpriv *fpriv =3D (struct amdgpu_fpriv *)data->driver=
_priv;
>> +     struct amdgpu_device *adev =3D drm_to_adev(dev);
>> +     struct amdgpu_bo *restored_bo;
>> +     int ret;
>> +
>> +     bo_buckets =3D kvzalloc(args->num_bos * sizeof(*bo_buckets), GFP_K=
ERNEL);
>> +     if (!bo_buckets)
>> +             return -ENOMEM;
>> +     ret =3D copy_from_user(bo_buckets, (void *)args->bos, args->num_bo=
s * sizeof(*bo_buckets));
>> +     if (ret)
>> +             return -EINVAL;
>> +
>> +     bo_privs =3D kvzalloc(args->num_bos * sizeof(*bo_privs), GFP_KERNE=
L);
>> +     if (!bo_privs)
>> +             return -ENOMEM;
>> +     ret =3D copy_from_user(bo_privs, (void *)args->priv_data, args->nu=
m_bos * sizeof(*bo_privs));
>> +     if (ret)
>> +             return -EINVAL;
>> +
>> +     vm_privs =3D kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERN=
EL);
>> +     if (!vm_privs)
>> +             return -ENOMEM;
>> +     ret =3D copy_from_user(vm_privs, (void *)(args->priv_data + sizeof=
(struct drm_amdgpu_criu_bo_priv_data) * args->num_bos), args->num_objs * si=
zeof(*vm_privs));
>> +     if (ret)
>> +             return -EINVAL;
>
>This could also be done without the kernel side allocation but your call
>whether it would make sense or not. (Ie. depending on expected sizes.)
>
>> +
>> +     for (i =3D 0; i < args->num_bos; i++) {
>> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket =3D &bo_bucket=
s[i];
>> +             struct drm_amdgpu_criu_bo_priv_data *bo_priv =3D &bo_privs=
[i];
>> +             struct amdgpu_bo *bo;
>> +
>> +             if (bo_bucket->skip)
>> +                     continue;
>
>Maybe drop some comments in the code so it is clear why and when the skip.
>
>> +
>> +             if (!bo_bucket->is_import) {
>> +                     struct drm_gem_object *obj;
>> +                     enum ttm_bo_type type =3D ttm_bo_type_device;
>> +                     int xcp_id =3D -1;
>> +                     int prime_fd;
>> +
>> +                     if (bo_bucket->preferred_domains =3D=3D AMDGPU_GEM=
_DOMAIN_VRAM) {
>> +                             xcp_id =3D fpriv->xcp_id =3D=3D AMDGPU_XCP=
_NO_PARTITION ?
>> +                                                     0 : fpriv->xcp_id;
>> +                     }
>
>It this right? How come amdgpu_gem_create_ioctl() simply passes
>fpriv->xcp_id + 1 to amdgpu_gem_object_create()?

Hmm. amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu() does this check.
Not sure why.

>
>> +                     amdgpu_gem_object_create(adev, bo_bucket->size, 1,=
 bo_bucket->preferred_domains,
>> +                             bo_bucket->alloc_flags, type, NULL, &obj, =
xcp_id + 1);
>> +
>> +                     bo =3D gem_to_amdgpu_bo(obj);
>> +
>> +                     ret =3D drm_gem_handle_create_assigned(data, obj, =
bo_priv->idr_handle);
>
>Error checking should probably be done.
>
>> +
>> +                     restored_bo =3D bo;
>
>Is setting bo on this branch needed or you could assign to restored_bo
>directly with gem_to_amdgpu_bo(obj)?
>
>> +
>> +                     bo_bucket->restored_offset =3D amdgpu_bo_mmap_offs=
et(restored_bo);
>> +
>> +                     ret =3D drm_gem_prime_handle_to_fd(dev,
>> +                            data, bo_priv->idr_handle,
>> +                            DRM_RDWR,
>> +                            &prime_fd);
>
>Treating all buffers as exported makes something easier, or? Perhaps add
>a comment at minimum.

This branch is for exported; the other branch is for imported

>
>> +
>> +                     bo_bucket->dmabuf_fd =3D prime_fd;
>> +             }
>> +             else {
>
>} else {
>
>> +                     struct drm_gem_object *obj;
>> +                     int ret;
>> +
>> +                     if (bo->kfd_bo) {
>
>Isn't bo unset on this branch?

Mea Culpa; this was a big mistake.

>
>> +                             ret =3D drm_prime_assign_handle(dev, data,=
 bo_bucket->dmabuf_fd, bo_priv->idr_handle, &obj);
>> +                             if (ret)
>> +                                     goto exit;
>
>Leaks memory.
>
>At this stage the exported buffer has already been created and exported,
>right? So bo_bucket->dmabuf_fd is valid and will resolve to it.
>bo_priv->idr_handle is a differend handle than when exported buffer was
>created?
>
>> +
>> +                             if (obj !=3D &bo->tbo.base)
>> +                                     restored_bo =3D gem_to_amdgpu_bo(o=
bj);
>> +                             else
>> +                                     restored_bo =3D bo;
>> +
>> +                             bo_bucket->restored_offset =3D amdgpu_bo_m=
map_offset(restored_bo);
>> +                     }
>> +             }
>> +
>> +
>> +             for (i =3D 0; i < args->num_objs; i++) {
>> +                     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_pr=
iv =3D &vm_privs[i];
>> +                     struct amdgpu_bo_va *bo_va;
>> +                     struct drm_exec exec;
>> +
>> +                     if (vm_priv->idr_handle !=3D bo_priv->idr_handle)
>> +                             continue;
>
>Hmm will keying vm_priv with idr_handle prevent restoring buffers not
>associated with userspace? Perhaps some internal key would be better to
>tie the two.

Given that the only case handled at this point is a drm buffer that
originated from dmabuf import, they must all have an idr_handle.

>
>> +
>> +                     reserve_bo_and_vm(restored_bo, avm, &exec);
>> +
>> +                     bo_va =3D amdgpu_vm_bo_find(avm, restored_bo);
>
>In which cases can bo_va be present at this point?
>
>> +                     if (!bo_va)
>> +                             bo_va =3D amdgpu_vm_bo_add(adev, avm, rest=
ored_bo);
>> +
>> +                     amdgpu_vm_bo_map(adev,
>> +                          bo_va,
>> +                          vm_priv->start * AMDGPU_GPU_PAGE_SIZE, vm_pri=
v->offset,
>> +                          (vm_priv->last - vm_priv->start + 1) * AMDGPU=
_GPU_PAGE_SIZE, vm_priv->flags);
>> +
>> +                     ret =3D amdgpu_vm_bo_update(adev, bo_va, false);
>> +
>> +                     ret =3D amdgpu_vm_update_pdes(adev, avm, false);
>> +
>> +                     unreserve_bo_and_vm(&exec);
>> +
>> +             }
>> +     }
>> +
>> +     ret =3D copy_to_user((void *)args->bos, bo_buckets, args->num_bos =
* sizeof(*bo_buckets));
>> +     if (ret) {
>> +             pr_err("Failed to copy BO information to user\n");
>> +             ret =3D -EFAULT;
>> +             goto exit;
>> +     }
>> +
>> +
>> +     exit:
>> +     return ret;
>> +}
>> +
>> +static int amdgpu_criu_resume(struct drm_device *dev, struct drm_file *=
data,
>> +                         struct drm_amdgpu_criu_args *args) {
>> +     return 0;
>> +}
>> +
>> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
>> +                         struct drm_file *filp)
>> +{
>> +     struct drm_amdgpu_criu_args *args =3D data;
>> +     int ret;
>> +
>> +     switch (args->op) {
>> +     case AMDGPU_CRIU_OP_PROCESS_INFO:
>> +             ret =3D amdgpu_criu_process_info(dev, filp, args);
>> +             break;
>> +     case AMDGPU_CRIU_OP_CHECKPOINT:
>> +             ret =3D amdgpu_criu_checkpoint(dev, filp, args);
>> +             break;
>> +     case AMDGPU_CRIU_OP_UNPAUSE:
>> +             ret =3D amdgpu_criu_unpause(dev, filp, args);
>> +             break;
>> +     case AMDGPU_CRIU_OP_RESTORE:
>> +             ret =3D amdgpu_criu_restore(dev, filp, args);
>> +             break;
>> +     case AMDGPU_CRIU_OP_RESUME:
>> +             ret =3D amdgpu_criu_resume(dev, filp, args);
>> +             break;
>> +     default:
>> +             ret =3D -EINVAL;
>> +             break;
>> +     }
>> +
>> +     return ret;
>> +}
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_criu.h
>> new file mode 100644
>> index 000000000000..35fbb1ffdd71
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>> @@ -0,0 +1,24 @@
>> +#ifndef __AMDGPU_CRIU_H__
>> +#define __AMDGPU_CRIU_H__
>> +
>> +#include <drm/amdgpu_drm.h>
>> +
>> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
>> +                         struct drm_file *filp);
>> +
>> +struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);
>> +int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *hand=
le);
>> +
>> +struct drm_amdgpu_criu_bo_priv_data {
>> +     uint32_t idr_handle; // IDR for drm gem idr
>> +};
>> +
>> +struct drm_amdgpu_criu_vm_mapping_priv_data {
>> +     uint64_t start;
>> +    uint64_t last;
>> +    uint64_t offset;
>> +    uint64_t flags;
>> +    uint32_t idr_handle;
>> +};
>> +
>> +#endif
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_drv.c
>> index acb9dc3705ac..12d844598efc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -53,6 +53,7 @@
>>   #include "amdgpu_xgmi.h"
>>   #include "amdgpu_userqueue.h"
>>   #include "amdgpu_userq_fence.h"
>> +#include "amdgpu_criu.h"
>>   #include "../amdxcp/amdgpu_xcp_drv.h"
>>
>>   /*
>> @@ -2909,6 +2910,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =
=3D {
>>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_=
RENDER_ALLOW),
>>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl,=
 DRM_AUTH|DRM_RENDER_ALLOW),
>>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM=
_AUTH|DRM_RENDER_ALLOW),
>> +     DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_ioctl, DRM_AUTH|D=
RM_RENDER_ALLOW),
>>   };
>>
>>   static const struct drm_driver amdgpu_kms_driver =3D {
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/=
amd/amdkfd/kfd_chardev.c
>> index 065d87841459..2a535a1870fa 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -45,6 +45,8 @@
>>   #include "amdgpu_dma_buf.h"
>>   #include "kfd_debug.h"
>>
>> +#include "amdgpu_criu.h"
>> +
>>   static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>>   static int kfd_open(struct inode *, struct file *);
>>   static int kfd_release(struct inode *, struct file *);
>> @@ -2469,7 +2471,8 @@ static int criu_restore_bos(struct kfd_process *p,
>>
>>        /* Create and map new BOs */
>>        for (; i < args->num_bos; i++) {
>> -             ret =3D criu_restore_bo(p, &bo_buckets[i], &bo_privs[i], &=
files[i]);
>> +             if (!bo_buckets[i].skip)
>> +                     ret =3D criu_restore_bo(p, &bo_buckets[i], &bo_pri=
vs[i], &files[i]);
>>                if (ret) {
>>                        pr_debug("Failed to restore BO[%d] ret%d\n", i, r=
et);
>>                        goto exit;
>> @@ -2558,7 +2561,7 @@ static int criu_restore(struct file *filep,
>>                 args->num_devices, args->num_bos, args->num_objects, arg=
s->priv_data_size);
>>
>>        if (!args->bos || !args->devices || !args->priv_data || !args->pr=
iv_data_size ||
>> -         !args->num_devices || !args->num_bos)
>> +         !args->num_devices)
>>                return -EINVAL;
>>
>>        mutex_lock(&p->mutex);
>> @@ -2567,26 +2570,30 @@ static int criu_restore(struct file *filep,
>>         * Set the process to evicted state to avoid running any new queu=
es before all the memory
>>         * mappings are ready.
>>         */
>> -     ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTOR=
E);
>> -     if (ret)
>> -             goto exit_unlock;
>> +     if (!args->is_retry) {
>> +             ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRI=
U_RESTORE);
>> +             if (ret)
>> +                     goto exit_unlock;
>>
>> -     /* Each function will adjust priv_offset based on how many bytes t=
hey consumed */
>> -     ret =3D criu_restore_process(p, args, &priv_offset, args->priv_dat=
a_size);
>> -     if (ret)
>> -             goto exit_unlock;
>> +             /* Each function will adjust priv_offset based on how many=
 bytes they consumed */
>> +             ret =3D criu_restore_process(p, args, &priv_offset, args->=
priv_data_size);
>> +             if (ret)
>> +                     goto exit_unlock;
>>
>> -     ret =3D criu_restore_devices(p, args, &priv_offset, args->priv_dat=
a_size);
>> -     if (ret)
>> -             goto exit_unlock;
>> +             ret =3D criu_restore_devices(p, args, &priv_offset, args->=
priv_data_size);
>> +             if (ret)
>> +                     goto exit_unlock;
>> +     }
>>
>>        ret =3D criu_restore_bos(p, args, &priv_offset, args->priv_data_s=
ize);
>>        if (ret)
>>                goto exit_unlock;
>>
>> -     ret =3D criu_restore_objects(filep, p, args, &priv_offset, args->p=
riv_data_size);
>> -     if (ret)
>> -             goto exit_unlock;
>> +     if (!args->is_retry) {
>> +             ret =3D criu_restore_objects(filep, p, args, &priv_offset,=
 args->priv_data_size);
>> +             if (ret)
>> +                     goto exit_unlock;
>> +     }
>>
>>        if (priv_offset !=3D args->priv_data_size) {
>>                pr_err("Invalid private data size\n");
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd=
/amdkfd/kfd_priv.h
>> index c32b255c0eb2..fd81275b8724 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>> @@ -1207,7 +1207,7 @@ int kfd_process_init_cwsr_apu(struct kfd_process *=
process, struct file *filep);
>>    * kfd_criu_svm_range_priv_data
>>    */
>>
>> -#define KFD_CRIU_PRIV_VERSION 1
>> +#define KFD_CRIU_PRIV_VERSION 2
>>
>>   struct kfd_criu_process_priv_data {
>>        uint32_t version;
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 0e3f8adf162f..8f6e7c064aaf 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -1084,3 +1084,149 @@ void drm_prime_gem_destroy(struct drm_gem_object=
 *obj, struct sg_table *sg)
>>        dma_buf_put(dma_buf);
>>   }
>>   EXPORT_SYMBOL(drm_prime_gem_destroy);
>> +
>> +int drm_prime_assign_handle(struct drm_device *dev,
>> +                            struct drm_file *file_priv, int prime_fd,
>> +                            uint32_t handle, struct drm_gem_object **ge=
m_obj)
>> +{
>> +     struct drm_gem_object *obj;
>> +     int ret;
>> +     int existing_handle;
>> +     struct dma_buf *dma_buf;
>> +
>> +     dma_buf =3D dma_buf_get(prime_fd);
>> +     if (IS_ERR(dma_buf))
>> +             return PTR_ERR(dma_buf);
>> +
>> +     mutex_lock(&file_priv->prime.lock);
>> +
>> +     ret =3D drm_prime_lookup_buf_handle(&file_priv->prime,
>> +                     dma_buf, &existing_handle);
>> +     if (ret =3D=3D 0)
>> +             goto out_put;
>
>If this will signal success when passed in handle wasn't assigned that
>sounds wrong for the "assign handle" implied semantics. I probably first
>need to understand how this works from the callers (restore) perspective.

This was wrong. Fixed in v2.

>
>> +
>> +     /* never seen this one, need to import */
>> +     mutex_lock(&dev->object_name_lock);
>> +     if (dev->driver->gem_prime_import)
>> +             obj =3D dev->driver->gem_prime_import(dev, dma_buf);
>> +     else
>> +             obj =3D drm_gem_prime_import(dev, dma_buf);
>> +     if (IS_ERR(obj)) {
>> +             ret =3D PTR_ERR(obj);
>> +             goto out_unlock;
>> +     }
>> +
>> +     *gem_obj =3D obj;
>> +
>> +     if (obj->dma_buf) {
>> +             WARN_ON(obj->dma_buf !=3D dma_buf);
>> +     } else {
>> +             obj->dma_buf =3D dma_buf;
>> +             get_dma_buf(dma_buf);
>> +     }
>> +
>> +     obj->handle_count++;
>> +
>> +     drm_gem_object_get(obj);
>> +
>> +     /* _handle_create_tail unconditionally unlocks dev->object_name_lo=
ck. */
>> +     idr_preload(GFP_KERNEL);
>> +     spin_lock(&file_priv->table_lock);
>> +
>> +     ret =3D idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,=
 GFP_NOWAIT);
>> +
>> +     spin_unlock(&file_priv->table_lock);
>> +     idr_preload_end();
>> +     mutex_unlock(&dev->object_name_lock);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret =3D drm_vma_node_allow(&obj->vma_node, file_priv);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (obj->funcs->open) {
>> +             ret =3D obj->funcs->open(obj, file_priv);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     drm_gem_object_put(obj);
>> +
>> +     ret =3D drm_prime_add_buf_handle(&file_priv->prime,
>> +                     dma_buf, handle);
>> +     mutex_unlock(&file_priv->prime.lock);
>> +     if (ret)
>> +             goto fail;
>> +
>> +     dma_buf_put(dma_buf);
>> +
>> +     return 0;
>> +
>> +fail:
>> +     /* hmm, if driver attached, we are relying on the free-object path
>> +      * to detach.. which seems ok..
>> +      */
>> +     drm_gem_handle_delete(file_priv, handle);
>> +     dma_buf_put(dma_buf);
>> +     return ret;
>> +
>> +out_unlock:
>> +     mutex_unlock(&dev->object_name_lock);
>> +out_put:
>> +     mutex_unlock(&file_priv->prime.lock);
>> +     dma_buf_put(dma_buf);
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL(drm_prime_assign_handle);
>> +
>> +int drm_gem_handle_create_assigned(struct drm_file *file_priv,
>> +                        struct drm_gem_object *obj,
>> +                        uint32_t handle)
>> +{
>> +     struct drm_device *dev =3D obj->dev;
>> +     int ret;
>> +
>> +     mutex_lock(&dev->object_name_lock);
>> +
>> +     WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>> +     if (obj->handle_count++ =3D=3D 0)
>> +             drm_gem_object_get(obj);
>> +
>> +     /*
>> +      * Get the user-visible handle using idr.  Preload and perform
>> +      * allocation under our spinlock.
>> +      */
>> +     idr_preload(GFP_KERNEL);
>> +     spin_lock(&file_priv->table_lock);
>> +
>> +     ret =3D idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,=
 GFP_NOWAIT);
>
>Helper looks justified to me. But AFAICT it is 99% a copy of
>drm_gem_handle_create_tail with the only difference being start and end
>parameters to idr_alloc. IMO it would be preferrable to avoid
>duplicating. Add start and end parameters to
>drm_gem_handle_create_assigned, rename it to maybe something like
>drm_gem_handle_create_tail_range, and call that from both old
>drm_gem_handle_create_tail and this new drm_gem_handle_create_assigned.

Good point. Did this refactor.

>
>> +
>> +     spin_unlock(&file_priv->table_lock);
>> +     idr_preload_end();
>> +
>> +     mutex_unlock(&dev->object_name_lock);
>> +     if (ret < 0)
>> +             goto err_unref;
>> +
>> +     ret =3D drm_vma_node_allow(&obj->vma_node, file_priv);
>> +     if (ret)
>> +             goto err_remove;
>> +
>> +     if (obj->funcs->open) {
>> +             ret =3D obj->funcs->open(obj, file_priv);
>> +             if (ret)
>> +                     goto err_revoke;
>> +     }
>> +     return 0;
>> +
>> +err_revoke:
>> +     drm_vma_node_revoke(&obj->vma_node, file_priv);
>> +err_remove:
>> +     spin_lock(&file_priv->table_lock);
>> +     idr_remove(&file_priv->object_idr, handle);
>> +     spin_unlock(&file_priv->table_lock);
>> +err_unref:
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL(drm_gem_handle_create_assigned);
>> \ No newline at end of file
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index fa085c44d4ca..591ed81acb84 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -112,5 +112,12 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt=
, struct page **pages,
>>                               int max_pages);
>>   int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *a=
ddrs,
>>                                   int max_pages);
>> +int drm_prime_assign_handle(struct drm_device *dev,
>> +                            struct drm_file *file_priv, int prime_fd,
>> +                            uint32_t handle, struct drm_gem_object **ge=
m_obj);
>> +
>> +int drm_gem_handle_create_assigned(struct drm_file *file_priv,
>> +                        struct drm_gem_object *obj,
>> +                        uint32_t handle);
>>
>>   #endif /* __DRM_PRIME_H__ */
>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm=
.h
>> index 8191d0bd0c00..c6766fe5c1bc 100644
>> --- a/include/uapi/drm/amdgpu_drm.h
>> +++ b/include/uapi/drm/amdgpu_drm.h
>> @@ -57,6 +57,7 @@ extern "C" {
>>   #define DRM_AMDGPU_USERQ            0x16
>>   #define DRM_AMDGPU_USERQ_SIGNAL             0x17
>>   #define DRM_AMDGPU_USERQ_WAIT               0x18
>> +#define DRM_AMDGPU_CRIU_OP           0x19
>>
>>   #define DRM_IOCTL_AMDGPU_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_AM=
DGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>   #define DRM_IOCTL_AMDGPU_GEM_MMAP   DRM_IOWR(DRM_COMMAND_BASE + DRM_AM=
DGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>> @@ -77,6 +78,7 @@ extern "C" {
>>   #define DRM_IOCTL_AMDGPU_USERQ              DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>>   #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL       DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>>   #define DRM_IOCTL_AMDGPU_USERQ_WAIT DRM_IOWR(DRM_COMMAND_BASE + DRM_AM=
DGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>> +#define DRM_IOCTL_AMDGPU_CRIU_OP     DRM_IOWR(DRM_COMMAND_BASE + DRM_AM=
DGPU_CRIU_OP, struct drm_amdgpu_criu_args)
>>
>>   /**
>>    * DOC: memory domains
>> @@ -1585,6 +1587,50 @@ struct drm_color_ctm_3x4 {
>>        __u64 matrix[12];
>>   };
>>
>> +/* CRIU ioctl
>> + *
>> + * When checkpointing a process, the CRIU amdgpu plugin will perform:
>> + * 1. INFO op to get information about state that needs to be saved. Th=
is
>> + *    pauses execution until the checkpoint is done.
>> + * 2. CHECKPOINT op to save state (BOs for now, TODO: CS contexts)
>> + * 3. UNPAUSE op to resume execution when the checkpoint is done.
>> + *
>> + * When restoring a process, the CRIU amdgpu plugin will perform:
>> + *
>> + * 1. RESTORE op to restore state
>> + * 2. RESUME op to restore userptr mappings (TODO)
>> + */
>> +enum drm_amdgpu_criu_op {
>> +    AMDGPU_CRIU_OP_PROCESS_INFO,
>> +    AMDGPU_CRIU_OP_CHECKPOINT,
>> +    AMDGPU_CRIU_OP_UNPAUSE,
>> +    AMDGPU_CRIU_OP_RESTORE,
>> +    AMDGPU_CRIU_OP_RESUME,
>> +};
>> +
>> +struct drm_amdgpu_criu_args {
>> +    __u64 bos; /* user pointer to bos array */
>> +    __u64 priv_data; /* user pointer to private data */
>> +    __u64 priv_data_size;
>> +    __u32 num_bos;
>> +    __u32 num_objs;
>
>"Objs" are not buffer objects but something else?

Objs is the term used by kfd CRIU to refer to the memory containing
data about non-bo driver state such as queues and events.
Agree that it's not the clearest name.

>
>> +    __u32 pid;
>> +    __u32 op;
>> +    __u8 is_retry: 1;
>
>Bitfields are best avoided in uapi since the packing order is compiler
>implementation defined.

Changed.

>
>Another best practice is to pad explicitly to u64 is you can envisage a
>need for adding new elements in the future.
>
>In this case __u64 flags seems would work.
>
>Then, as the above talks about a TODO to handle CS contexts - would that
>work be adding fields to this struct? With CS contexts you mean all the
>state needed to enable job submission to continue from the render node?

Old CRIU will never call the drm ioctls, so no backwards compatibility
is needed there.

>
>> +};
>> +
>> +struct drm_amdgpu_criu_bo_bucket {
>> +    __u64 addr;
>> +    __u64 size;
>> +    __u64 offset;
>> +    __u64 restored_offset;    /* During restore, updated offset for BO =
*/
>> +    __u64 alloc_flags;
>> +    __u32 preferred_domains;
>> +    __u32 dmabuf_fd;
>> +     __u8 is_import: 1;
>> +     __u8 skip: 1;
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioc=
tl.h
>> index fa9f9846b88e..8c3f3a51857f 100644
>> --- a/include/uapi/linux/kfd_ioctl.h
>> +++ b/include/uapi/linux/kfd_ioctl.h
>> @@ -698,6 +698,7 @@ struct kfd_ioctl_criu_args {
>>        __u32 num_objects;      /* Used during ops: PROCESS_INFO, RESTORE=
 */
>>        __u32 pid;              /* Used during ops: PROCESS_INFO, RESUME =
*/
>>        __u32 op;
>> +     __u8 is_retry: 1;
>>   };
>>
>>   struct kfd_criu_device_bucket {
>> @@ -715,7 +716,8 @@ struct kfd_criu_bo_bucket {
>>        __u32 gpu_id;             /* This is the user_gpu_id */
>>        __u32 alloc_flags;
>>        __u32 dmabuf_fd;
>> -     __u32 pad;
>> +     __u8 is_import: 1;
>> +     __u8 skip: 1;
>
>Struct extensions from above two hunks are the backward compatibility
>problem from the TODO item?
>
>Regards,
>
>Tvrtko

Thanks,
David
________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Sent: Tuesday, February 25, 2025 7:08 AM
To: Francis, David <David.Francis@amd.com>; dri-devel@lists.freedesktop.org=
 <dri-devel@lists.freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, =
Christian <Christian.Koenig@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.c=
om>; James (Weijun) Jiang <Weijun.Jiang@amd.com>; dcostantino@meta.com <dco=
stantino@meta.com>; sruffell@meta.com <sruffell@meta.com>
Subject: Re: [PATCH] Support dmabuf IPC with amdgpu CRIU


Hi,

On 31/01/2025 18:58, David Francis wrote:
> This patch (in combination with the accompanying CRIU patch)
> allows the amdgpu CRIU plugin to support dmabuf IPC.
>
> It includes
> - A new amdgpu ioctl (amdgpu_criu_op_ioctl), which has similar
>        options to kfd_ioctl_criu, and accompanying structs.
> - New "is_retry" field in amdkfd CRIU ioctls, to indicate when.
>        a restore op is a retry and certain parts of the
>        restore should not be re-done.
> - New "skip" field in amdkfd CRIU bo buckets, to indicate when
>        a bo cannot currently be restored and should be ignored.
> - Two new drm functions, drm_prime_assign_handle and
>        drm_gem_handle_create_assigned. These are similar to
>        drm_gem_prime_fd_to_handle and drm_gem_handle_create
>        but allow the caller to specify a gem handle.

It would be best to organise the series in multiple patches. At least
the DRM code API additions should be one per patch.

I'll make a mix of comments throughout the patch, some will be low level
where I think code can just align with the kernel style more and so make
it a bit easier to read. So bear with that please and probably just make
a note for when doing a respin to perhaps consider that.

> Still TODO:
> - Backwards compatibility between new kernel and old CRIU
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 401 +++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  24 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  37 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +-
>   drivers/gpu/drm/drm_prime.c              | 146 +++++++++
>   include/drm/drm_prime.h                  |   7 +
>   include/uapi/drm/amdgpu_drm.h            |  46 +++
>   include/uapi/linux/kfd_ioctl.h           |   4 +-
>   10 files changed, 653 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 6cb3a2b2725a..eac5a455e6de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o amd=
gpu_kms.o \
>        amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>        amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbi=
o.o \
>        amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -     amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +     amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>        amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>        amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_=
dev_coredump.o \
>        amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..4f3e5cb61323
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,401 @@
> +
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"
> +
> +static bool is_import(struct amdgpu_bo *bo) {
> +     if (bo->tbo.base.import_attach)
> +             return &bo->tbo.base !=3D (struct drm_gem_object *)bo->tbo.=
base.import_attach->dmabuf->priv;
> +     return false;
> +}
> +
> +static int reserve_bo_and_vm(struct amdgpu_bo *bo,
> +                           struct amdgpu_vm *vm,
> +                           struct drm_exec *exec)
> +{
> +     int ret;
> +
> +     WARN_ON(!vm);
> +
> +     drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +     drm_exec_until_all_locked(exec) {
> +             ret =3D amdgpu_vm_lock_pd(vm, exec, 2);
> +             drm_exec_retry_on_contention(exec);
> +             if (unlikely(ret))
> +                     goto error;
> +
> +             ret =3D drm_exec_prepare_obj(exec, &bo->tbo.base, 1);
> +             drm_exec_retry_on_contention(exec);
> +             if (unlikely(ret))
> +                     goto error;
> +     }
> +     return 0;
> +
> +error:
> +     pr_err("Failed to reserve buffers in ttm.\n");
> +     drm_exec_fini(exec);
> +     return ret;
> +}
> +
> +static void unreserve_bo_and_vm(struct drm_exec *exec)
> +{
> +     drm_exec_fini(exec);
> +}
> +
> +static int amdgpu_criu_process_info(struct drm_device *dev, struct drm_f=
ile *data,
> +                         struct drm_amdgpu_criu_args *args) {
> +     struct drm_gem_object *gobj;
> +     int id;
> +     int num_bos =3D 0;
> +     int num_vm_mappings =3D 0;
> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pri=
v)->vm;
> +
> +     spin_lock(&data->table_lock);
> +     idr_for_each_entry(&data->object_idr, gobj, id) {
> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> +             struct amdgpu_vm_bo_base *vm_bo_base;
> +
> +             num_bos +=3D 1;
> +
> +             vm_bo_base =3D bo->vm_bo;
> +
> +             while(vm_bo_base) {
> +                     struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_b=
ase, struct amdgpu_bo_va, base);
> +                     struct amdgpu_bo_va_mapping *mapping;
> +
> +                     if (vm_bo_base->vm =3D=3D avm) {
> +
> +                             list_for_each_entry(mapping, &bo_va->invali=
ds, list) {
> +                                     num_vm_mappings +=3D 1;
> +                             }
> +                             list_for_each_entry(mapping, &bo_va->valids=
, list) {
> +                                     num_vm_mappings +=3D 1;
> +                             }
> +                     }
> +
> +                     vm_bo_base =3D vm_bo_base->next;
> +             }
> +     }
> +     spin_unlock(&data->table_lock);
> +
> +     args->num_bos =3D num_bos;
> +     args->priv_data_size =3D sizeof(struct drm_amdgpu_criu_bo_priv_data=
) * num_bos + sizeof(struct drm_amdgpu_criu_vm_mapping_priv_data) * num_vm_=
mappings;
> +     args->num_objs =3D num_vm_mappings;
> +     args->pid =3D avm->task_info->pid;
> +
> +     return 0;
> +}
> +
> +static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_fil=
e *data,
> +                         struct drm_amdgpu_criu_args *args) {
> +     struct drm_gem_object *gobj;
> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pri=
v)->vm;
> +     int id;
> +     int num_bos =3D 0;
> +     int ret;
> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +     struct drm_amdgpu_criu_bo_priv_data *bo_privs;
> +     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
> +     int vm_priv_index =3D 0;
> +     int bo_index =3D 0;
> +     int fd;

Generally it is nicer to order the declaration by width where practical.

> +
> +     spin_lock(&data->table_lock);
> +     idr_for_each_entry(&data->object_idr, gobj, id) {
> +             num_bos +=3D 1;
> +     }

And to avoid curlies for single line blocks.

> +     spin_unlock(&data->table_lock);
> +
> +     if (args->num_bos !=3D num_bos) {
> +             ret =3D -EINVAL;
> +             goto exit;
> +     }

Since the below loop does the unlocked walk it can potentially overwrite
the allocated buffers. Maybe it cannot happen but I think it is best to
write it defensively.

> +
> +     bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +     if (!bo_buckets)
> +             return -ENOMEM;
> +
> +     bo_privs =3D kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
> +     if (!bo_privs)
> +             return -ENOMEM;
> +
> +     vm_privs =3D kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERNE=
L);
> +     if (!vm_privs)
> +             return -ENOMEM;

These obviously can leak memory so just need to extend the existing
onion unwind to handle it all.

You could also use kvcalloc, or even forgo the temporary allocation and
copy blobs as it goes. (If using kvzalloc suggests these might be large
allocations so perhaps it makes sense to avoid them.)

> +
> +     idr_for_each_entry(&data->object_idr, gobj, id) {
> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +             struct drm_amdgpu_criu_bo_priv_data *bo_priv;
> +             struct amdgpu_vm_bo_base *vm_bo_base;
> +             struct amdgpu_bo *main_bo;
> +
> +             bo_bucket =3D &bo_buckets[bo_index];
> +             bo_priv =3D &bo_privs[bo_index];
> +
> +             bo_bucket->size =3D amdgpu_bo_size(bo);
> +             bo_bucket->offset =3D amdgpu_bo_mmap_offset(bo);
> +             bo_bucket->alloc_flags =3D bo->flags;
> +             bo_bucket->preferred_domains =3D bo->preferred_domains;
> +
> +             bo_priv->idr_handle =3D id;
> +             bo_bucket->is_import =3D is_import(bo);
> +
> +             main_bo =3D bo;
> +             if (is_import(main_bo)) {

is_import() is called twice in sequence.

> +                     main_bo =3D gem_to_amdgpu_bo(bo->tbo.base.import_at=
tach->dmabuf->priv);
> +             }
> +
> +             drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
> +             if (fd) {
> +                     bo_bucket->dmabuf_fd =3D fd;
> +             }
> +
> +             vm_bo_base =3D bo->vm_bo;
> +
> +             while(vm_bo_base) {
> +                     struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_b=
ase, struct amdgpu_bo_va, base);
> +                     struct amdgpu_bo_va_mapping *mapping;
> +
> +                     if (vm_bo_base->vm =3D=3D avm) {
> +                             list_for_each_entry(mapping, &bo_va->invali=
ds, list) {
> +                                     vm_privs[vm_priv_index].start =3D m=
apping->start;
> +                                     vm_privs[vm_priv_index].last =3D ma=
pping->last;
> +                                     vm_privs[vm_priv_index].offset =3D =
mapping->offset;
> +                                     vm_privs[vm_priv_index].flags =3D m=
apping->flags;
> +                                     vm_privs[vm_priv_index].idr_handle =
=3D id;
> +                                     vm_priv_index +=3D 1;
> +
> +                                     bo_bucket->addr =3D mapping->start =
* 0x1000;

PAGE_SIZE? Or something else?

> +                             }
> +                             list_for_each_entry(mapping, &bo_va->valids=
, list) {
> +                                     vm_privs[vm_priv_index].start =3D m=
apping->start;
> +                                     vm_privs[vm_priv_index].last =3D ma=
pping->last;
> +                                     vm_privs[vm_priv_index].offset =3D =
mapping->offset;
> +                                     vm_privs[vm_priv_index].flags =3D m=
apping->flags;
> +                                     vm_privs[vm_priv_index].idr_handle =
=3D id;
> +                                     vm_priv_index +=3D 1;
> +
> +                                     bo_bucket->addr =3D mapping->start =
* 0x1000;
> +                             }
> +                     }

Looks like some sort of a helper could consolidate the handling of two
lists. Either pass a list_head pointer, or keep the walks here and pass
in the mapping, something like that.

> +
> +                     vm_bo_base =3D vm_bo_base->next;
> +             }
> +
> +             bo_index +=3D 1;
> +     }
> +
> +     ret =3D copy_to_user((void *)args->bos, bo_buckets, num_bos * sizeo=
f(*bo_buckets));

Probably needs to be (void __user *) in the cast.

> +     if (ret) {
> +             pr_err("Failed to copy BO information to user\n");

Probably make these debug level at most since userspace can trigger them
at will and it is not a kernel level error.

> +             ret =3D -EFAULT;
> +             goto exit;
> +     }
> +
> +     ret =3D copy_to_user((void *)args->priv_data, bo_privs, num_bos * s=
izeof(*bo_privs));
> +     if (ret) {
> +             pr_err("Failed to copy BO PRIV information to user\n");
> +             ret =3D -EFAULT;
> +             goto exit;
> +     }
> +     ret =3D copy_to_user((void *)(args->priv_data + sizeof(struct drm_a=
mdgpu_criu_bo_priv_data) * num_bos), vm_privs, args->num_objs * sizeof(*vm_=
privs));
> +     if (ret) {
> +             pr_err("Failed to copy VM PRIV information to user\n");
> +             ret =3D -EFAULT;
> +             goto exit;
> +     }
> +
> +     exit:
> +     kvfree(bo_buckets);
> +     kvfree(bo_privs);
> +     return ret;
> +}
> +
> +static int amdgpu_criu_unpause(struct drm_device *dev, struct drm_file *=
data,
> +                         struct drm_amdgpu_criu_args *args) {
> +     return 0;
> +}
> +
> +static int amdgpu_criu_restore(struct drm_device *dev, struct drm_file *=
data,
> +                         struct drm_amdgpu_criu_args *args) {
> +     int i;
> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +     struct drm_amdgpu_criu_bo_priv_data *bo_privs;
> +     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_privs;
> +     struct amdgpu_vm *avm =3D &((struct amdgpu_fpriv *)data->driver_pri=
v)->vm;
> +     struct amdgpu_fpriv *fpriv =3D (struct amdgpu_fpriv *)data->driver_=
priv;
> +     struct amdgpu_device *adev =3D drm_to_adev(dev);
> +     struct amdgpu_bo *restored_bo;
> +     int ret;
> +
> +     bo_buckets =3D kvzalloc(args->num_bos * sizeof(*bo_buckets), GFP_KE=
RNEL);
> +     if (!bo_buckets)
> +             return -ENOMEM;
> +     ret =3D copy_from_user(bo_buckets, (void *)args->bos, args->num_bos=
 * sizeof(*bo_buckets));
> +     if (ret)
> +             return -EINVAL;
> +
> +     bo_privs =3D kvzalloc(args->num_bos * sizeof(*bo_privs), GFP_KERNEL=
);
> +     if (!bo_privs)
> +             return -ENOMEM;
> +     ret =3D copy_from_user(bo_privs, (void *)args->priv_data, args->num=
_bos * sizeof(*bo_privs));
> +     if (ret)
> +             return -EINVAL;
> +
> +     vm_privs =3D kvzalloc(args->num_objs * sizeof(*vm_privs), GFP_KERNE=
L);
> +     if (!vm_privs)
> +             return -ENOMEM;
> +     ret =3D copy_from_user(vm_privs, (void *)(args->priv_data + sizeof(=
struct drm_amdgpu_criu_bo_priv_data) * args->num_bos), args->num_objs * siz=
eof(*vm_privs));
> +     if (ret)
> +             return -EINVAL;

This could also be done without the kernel side allocation but your call
whether it would make sense or not. (Ie. depending on expected sizes.)

> +
> +     for (i =3D 0; i < args->num_bos; i++) {
> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket =3D &bo_buckets=
[i];
> +             struct drm_amdgpu_criu_bo_priv_data *bo_priv =3D &bo_privs[=
i];
> +             struct amdgpu_bo *bo;
> +
> +             if (bo_bucket->skip)
> +                     continue;

Maybe drop some comments in the code so it is clear why and when the skip.

> +
> +             if (!bo_bucket->is_import) {
> +                     struct drm_gem_object *obj;
> +                     enum ttm_bo_type type =3D ttm_bo_type_device;
> +                     int xcp_id =3D -1;
> +                     int prime_fd;
> +
> +                     if (bo_bucket->preferred_domains =3D=3D AMDGPU_GEM_=
DOMAIN_VRAM) {
> +                             xcp_id =3D fpriv->xcp_id =3D=3D AMDGPU_XCP_=
NO_PARTITION ?
> +                                                     0 : fpriv->xcp_id;
> +                     }

It this right? How come amdgpu_gem_create_ioctl() simply passes
fpriv->xcp_id + 1 to amdgpu_gem_object_create()?

> +                     amdgpu_gem_object_create(adev, bo_bucket->size, 1, =
bo_bucket->preferred_domains,
> +                             bo_bucket->alloc_flags, type, NULL, &obj, x=
cp_id + 1);
> +
> +                     bo =3D gem_to_amdgpu_bo(obj);
> +
> +                     ret =3D drm_gem_handle_create_assigned(data, obj, b=
o_priv->idr_handle);

Error checking should probably be done.

> +
> +                     restored_bo =3D bo;

Is setting bo on this branch needed or you could assign to restored_bo
directly with gem_to_amdgpu_bo(obj)?

> +
> +                     bo_bucket->restored_offset =3D amdgpu_bo_mmap_offse=
t(restored_bo);
> +
> +                     ret =3D drm_gem_prime_handle_to_fd(dev,
> +                            data, bo_priv->idr_handle,
> +                            DRM_RDWR,
> +                            &prime_fd);

Treating all buffers as exported makes something easier, or? Perhaps add
a comment at minimum.

> +
> +                     bo_bucket->dmabuf_fd =3D prime_fd;
> +             }
> +             else {

} else {

> +                     struct drm_gem_object *obj;
> +                     int ret;
> +
> +                     if (bo->kfd_bo) {

Isn't bo unset on this branch?

> +                             ret =3D drm_prime_assign_handle(dev, data, =
bo_bucket->dmabuf_fd, bo_priv->idr_handle, &obj);
> +                             if (ret)
> +                                     goto exit;

Leaks memory.

At this stage the exported buffer has already been created and exported,
right? So bo_bucket->dmabuf_fd is valid and will resolve to it.
bo_priv->idr_handle is a differend handle than when exported buffer was
created?

> +
> +                             if (obj !=3D &bo->tbo.base)
> +                                     restored_bo =3D gem_to_amdgpu_bo(ob=
j);
> +                             else
> +                                     restored_bo =3D bo;
> +
> +                             bo_bucket->restored_offset =3D amdgpu_bo_mm=
ap_offset(restored_bo);
> +                     }
> +             }
> +
> +
> +             for (i =3D 0; i < args->num_objs; i++) {
> +                     struct drm_amdgpu_criu_vm_mapping_priv_data *vm_pri=
v =3D &vm_privs[i];
> +                     struct amdgpu_bo_va *bo_va;
> +                     struct drm_exec exec;
> +
> +                     if (vm_priv->idr_handle !=3D bo_priv->idr_handle)
> +                             continue;

Hmm will keying vm_priv with idr_handle prevent restoring buffers not
associated with userspace? Perhaps some internal key would be better to
tie the two.

> +
> +                     reserve_bo_and_vm(restored_bo, avm, &exec);
> +
> +                     bo_va =3D amdgpu_vm_bo_find(avm, restored_bo);

In which cases can bo_va be present at this point?

> +                     if (!bo_va)
> +                             bo_va =3D amdgpu_vm_bo_add(adev, avm, resto=
red_bo);
> +
> +                     amdgpu_vm_bo_map(adev,
> +                          bo_va,
> +                          vm_priv->start * AMDGPU_GPU_PAGE_SIZE, vm_priv=
->offset,
> +                          (vm_priv->last - vm_priv->start + 1) * AMDGPU_=
GPU_PAGE_SIZE, vm_priv->flags);
> +
> +                     ret =3D amdgpu_vm_bo_update(adev, bo_va, false);
> +
> +                     ret =3D amdgpu_vm_update_pdes(adev, avm, false);
> +
> +                     unreserve_bo_and_vm(&exec);
> +
> +             }
> +     }
> +
> +     ret =3D copy_to_user((void *)args->bos, bo_buckets, args->num_bos *=
 sizeof(*bo_buckets));
> +     if (ret) {
> +             pr_err("Failed to copy BO information to user\n");
> +             ret =3D -EFAULT;
> +             goto exit;
> +     }
> +
> +
> +     exit:
> +     return ret;
> +}
> +
> +static int amdgpu_criu_resume(struct drm_device *dev, struct drm_file *d=
ata,
> +                         struct drm_amdgpu_criu_args *args) {
> +     return 0;
> +}
> +
> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)
> +{
> +     struct drm_amdgpu_criu_args *args =3D data;
> +     int ret;
> +
> +     switch (args->op) {
> +     case AMDGPU_CRIU_OP_PROCESS_INFO:
> +             ret =3D amdgpu_criu_process_info(dev, filp, args);
> +             break;
> +     case AMDGPU_CRIU_OP_CHECKPOINT:
> +             ret =3D amdgpu_criu_checkpoint(dev, filp, args);
> +             break;
> +     case AMDGPU_CRIU_OP_UNPAUSE:
> +             ret =3D amdgpu_criu_unpause(dev, filp, args);
> +             break;
> +     case AMDGPU_CRIU_OP_RESTORE:
> +             ret =3D amdgpu_criu_restore(dev, filp, args);
> +             break;
> +     case AMDGPU_CRIU_OP_RESUME:
> +             ret =3D amdgpu_criu_resume(dev, filp, args);
> +             break;
> +     default:
> +             ret =3D -EINVAL;
> +             break;
> +     }
> +
> +     return ret;
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..35fbb1ffdd71
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,24 @@
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp);
> +
> +struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);
> +int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *handl=
e);
> +
> +struct drm_amdgpu_criu_bo_priv_data {
> +     uint32_t idr_handle; // IDR for drm gem idr
> +};
> +
> +struct drm_amdgpu_criu_vm_mapping_priv_data {
> +     uint64_t start;
> +    uint64_t last;
> +    uint64_t offset;
> +    uint64_t flags;
> +    uint32_t idr_handle;
> +};
> +
> +#endif
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index acb9dc3705ac..12d844598efc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>   #include "amdgpu_xgmi.h"
>   #include "amdgpu_userqueue.h"
>   #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>   #include "../amdxcp/amdgpu_xcp_drv.h"
>
>   /*
> @@ -2909,6 +2910,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D=
 {
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_R=
ENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, =
DRM_AUTH|DRM_RENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_=
AUTH|DRM_RENDER_ALLOW),
> +     DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_ioctl, DRM_AUTH|DR=
M_RENDER_ALLOW),
>   };
>
>   static const struct drm_driver amdgpu_kms_driver =3D {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index 065d87841459..2a535a1870fa 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>   #include "amdgpu_dma_buf.h"
>   #include "kfd_debug.h"
>
> +#include "amdgpu_criu.h"
> +
>   static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>   static int kfd_open(struct inode *, struct file *);
>   static int kfd_release(struct inode *, struct file *);
> @@ -2469,7 +2471,8 @@ static int criu_restore_bos(struct kfd_process *p,
>
>        /* Create and map new BOs */
>        for (; i < args->num_bos; i++) {
> -             ret =3D criu_restore_bo(p, &bo_buckets[i], &bo_privs[i], &f=
iles[i]);
> +             if (!bo_buckets[i].skip)
> +                     ret =3D criu_restore_bo(p, &bo_buckets[i], &bo_priv=
s[i], &files[i]);
>                if (ret) {
>                        pr_debug("Failed to restore BO[%d] ret%d\n", i, re=
t);
>                        goto exit;
> @@ -2558,7 +2561,7 @@ static int criu_restore(struct file *filep,
>                 args->num_devices, args->num_bos, args->num_objects, args=
->priv_data_size);
>
>        if (!args->bos || !args->devices || !args->priv_data || !args->pri=
v_data_size ||
> -         !args->num_devices || !args->num_bos)
> +         !args->num_devices)
>                return -EINVAL;
>
>        mutex_lock(&p->mutex);
> @@ -2567,26 +2570,30 @@ static int criu_restore(struct file *filep,
>         * Set the process to evicted state to avoid running any new queue=
s before all the memory
>         * mappings are ready.
>         */
> -     ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTORE=
);
> -     if (ret)
> -             goto exit_unlock;
> +     if (!args->is_retry) {
> +             ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU=
_RESTORE);
> +             if (ret)
> +                     goto exit_unlock;
>
> -     /* Each function will adjust priv_offset based on how many bytes th=
ey consumed */
> -     ret =3D criu_restore_process(p, args, &priv_offset, args->priv_data=
_size);
> -     if (ret)
> -             goto exit_unlock;
> +             /* Each function will adjust priv_offset based on how many =
bytes they consumed */
> +             ret =3D criu_restore_process(p, args, &priv_offset, args->p=
riv_data_size);
> +             if (ret)
> +                     goto exit_unlock;
>
> -     ret =3D criu_restore_devices(p, args, &priv_offset, args->priv_data=
_size);
> -     if (ret)
> -             goto exit_unlock;
> +             ret =3D criu_restore_devices(p, args, &priv_offset, args->p=
riv_data_size);
> +             if (ret)
> +                     goto exit_unlock;
> +     }
>
>        ret =3D criu_restore_bos(p, args, &priv_offset, args->priv_data_si=
ze);
>        if (ret)
>                goto exit_unlock;
>
> -     ret =3D criu_restore_objects(filep, p, args, &priv_offset, args->pr=
iv_data_size);
> -     if (ret)
> -             goto exit_unlock;
> +     if (!args->is_retry) {
> +             ret =3D criu_restore_objects(filep, p, args, &priv_offset, =
args->priv_data_size);
> +             if (ret)
> +                     goto exit_unlock;
> +     }
>
>        if (priv_offset !=3D args->priv_data_size) {
>                pr_err("Invalid private data size\n");
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index c32b255c0eb2..fd81275b8724 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1207,7 +1207,7 @@ int kfd_process_init_cwsr_apu(struct kfd_process *p=
rocess, struct file *filep);
>    * kfd_criu_svm_range_priv_data
>    */
>
> -#define KFD_CRIU_PRIV_VERSION 1
> +#define KFD_CRIU_PRIV_VERSION 2
>
>   struct kfd_criu_process_priv_data {
>        uint32_t version;
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 0e3f8adf162f..8f6e7c064aaf 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -1084,3 +1084,149 @@ void drm_prime_gem_destroy(struct drm_gem_object =
*obj, struct sg_table *sg)
>        dma_buf_put(dma_buf);
>   }
>   EXPORT_SYMBOL(drm_prime_gem_destroy);
> +
> +int drm_prime_assign_handle(struct drm_device *dev,
> +                            struct drm_file *file_priv, int prime_fd,
> +                            uint32_t handle, struct drm_gem_object **gem=
_obj)
> +{
> +     struct drm_gem_object *obj;
> +     int ret;
> +     int existing_handle;
> +     struct dma_buf *dma_buf;
> +
> +     dma_buf =3D dma_buf_get(prime_fd);
> +     if (IS_ERR(dma_buf))
> +             return PTR_ERR(dma_buf);
> +
> +     mutex_lock(&file_priv->prime.lock);
> +
> +     ret =3D drm_prime_lookup_buf_handle(&file_priv->prime,
> +                     dma_buf, &existing_handle);
> +     if (ret =3D=3D 0)
> +             goto out_put;

If this will signal success when passed in handle wasn't assigned that
sounds wrong for the "assign handle" implied semantics. I probably first
need to understand how this works from the callers (restore) perspective.

> +
> +     /* never seen this one, need to import */
> +     mutex_lock(&dev->object_name_lock);
> +     if (dev->driver->gem_prime_import)
> +             obj =3D dev->driver->gem_prime_import(dev, dma_buf);
> +     else
> +             obj =3D drm_gem_prime_import(dev, dma_buf);
> +     if (IS_ERR(obj)) {
> +             ret =3D PTR_ERR(obj);
> +             goto out_unlock;
> +     }
> +
> +     *gem_obj =3D obj;
> +
> +     if (obj->dma_buf) {
> +             WARN_ON(obj->dma_buf !=3D dma_buf);
> +     } else {
> +             obj->dma_buf =3D dma_buf;
> +             get_dma_buf(dma_buf);
> +     }
> +
> +     obj->handle_count++;
> +
> +     drm_gem_object_get(obj);
> +
> +     /* _handle_create_tail unconditionally unlocks dev->object_name_loc=
k. */
> +     idr_preload(GFP_KERNEL);
> +     spin_lock(&file_priv->table_lock);
> +
> +     ret =3D idr_alloc(&file_priv->object_idr, obj, handle, handle + 1, =
GFP_NOWAIT);
> +
> +     spin_unlock(&file_priv->table_lock);
> +     idr_preload_end();
> +     mutex_unlock(&dev->object_name_lock);
> +     if (ret < 0)
> +             return ret;
> +
> +     ret =3D drm_vma_node_allow(&obj->vma_node, file_priv);
> +     if (ret)
> +             return ret;
> +
> +     if (obj->funcs->open) {
> +             ret =3D obj->funcs->open(obj, file_priv);
> +             if (ret)
> +                     return ret;
> +     }
> +
> +     drm_gem_object_put(obj);
> +
> +     ret =3D drm_prime_add_buf_handle(&file_priv->prime,
> +                     dma_buf, handle);
> +     mutex_unlock(&file_priv->prime.lock);
> +     if (ret)
> +             goto fail;
> +
> +     dma_buf_put(dma_buf);
> +
> +     return 0;
> +
> +fail:
> +     /* hmm, if driver attached, we are relying on the free-object path
> +      * to detach.. which seems ok..
> +      */
> +     drm_gem_handle_delete(file_priv, handle);
> +     dma_buf_put(dma_buf);
> +     return ret;
> +
> +out_unlock:
> +     mutex_unlock(&dev->object_name_lock);
> +out_put:
> +     mutex_unlock(&file_priv->prime.lock);
> +     dma_buf_put(dma_buf);
> +     return ret;
> +}
> +EXPORT_SYMBOL(drm_prime_assign_handle);
> +
> +int drm_gem_handle_create_assigned(struct drm_file *file_priv,
> +                        struct drm_gem_object *obj,
> +                        uint32_t handle)
> +{
> +     struct drm_device *dev =3D obj->dev;
> +     int ret;
> +
> +     mutex_lock(&dev->object_name_lock);
> +
> +     WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> +     if (obj->handle_count++ =3D=3D 0)
> +             drm_gem_object_get(obj);
> +
> +     /*
> +      * Get the user-visible handle using idr.  Preload and perform
> +      * allocation under our spinlock.
> +      */
> +     idr_preload(GFP_KERNEL);
> +     spin_lock(&file_priv->table_lock);
> +
> +     ret =3D idr_alloc(&file_priv->object_idr, obj, handle, handle + 1, =
GFP_NOWAIT);

Helper looks justified to me. But AFAICT it is 99% a copy of
drm_gem_handle_create_tail with the only difference being start and end
parameters to idr_alloc. IMO it would be preferrable to avoid
duplicating. Add start and end parameters to
drm_gem_handle_create_assigned, rename it to maybe something like
drm_gem_handle_create_tail_range, and call that from both old
drm_gem_handle_create_tail and this new drm_gem_handle_create_assigned.

> +
> +     spin_unlock(&file_priv->table_lock);
> +     idr_preload_end();
> +
> +     mutex_unlock(&dev->object_name_lock);
> +     if (ret < 0)
> +             goto err_unref;
> +
> +     ret =3D drm_vma_node_allow(&obj->vma_node, file_priv);
> +     if (ret)
> +             goto err_remove;
> +
> +     if (obj->funcs->open) {
> +             ret =3D obj->funcs->open(obj, file_priv);
> +             if (ret)
> +                     goto err_revoke;
> +     }
> +     return 0;
> +
> +err_revoke:
> +     drm_vma_node_revoke(&obj->vma_node, file_priv);
> +err_remove:
> +     spin_lock(&file_priv->table_lock);
> +     idr_remove(&file_priv->object_idr, handle);
> +     spin_unlock(&file_priv->table_lock);
> +err_unref:
> +     return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_handle_create_assigned);
> \ No newline at end of file
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index fa085c44d4ca..591ed81acb84 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -112,5 +112,12 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt,=
 struct page **pages,
>                               int max_pages);
>   int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *ad=
drs,
>                                   int max_pages);
> +int drm_prime_assign_handle(struct drm_device *dev,
> +                            struct drm_file *file_priv, int prime_fd,
> +                            uint32_t handle, struct drm_gem_object **gem=
_obj);
> +
> +int drm_gem_handle_create_assigned(struct drm_file *file_priv,
> +                        struct drm_gem_object *obj,
> +                        uint32_t handle);
>
>   #endif /* __DRM_PRIME_H__ */
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 8191d0bd0c00..c6766fe5c1bc 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,7 @@ extern "C" {
>   #define DRM_AMDGPU_USERQ            0x16
>   #define DRM_AMDGPU_USERQ_SIGNAL             0x17
>   #define DRM_AMDGPU_USERQ_WAIT               0x18
> +#define DRM_AMDGPU_CRIU_OP           0x19
>
>   #define DRM_IOCTL_AMDGPU_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_CREATE, union drm_amdgpu_gem_create)
>   #define DRM_IOCTL_AMDGPU_GEM_MMAP   DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +78,7 @@ extern "C" {
>   #define DRM_IOCTL_AMDGPU_USERQ              DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>   #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL       DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>   #define DRM_IOCTL_AMDGPU_USERQ_WAIT DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_OP     DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_CRIU_OP, struct drm_amdgpu_criu_args)
>
>   /**
>    * DOC: memory domains
> @@ -1585,6 +1587,50 @@ struct drm_color_ctm_3x4 {
>        __u64 matrix[12];
>   };
>
> +/* CRIU ioctl
> + *
> + * When checkpointing a process, the CRIU amdgpu plugin will perform:
> + * 1. INFO op to get information about state that needs to be saved. Thi=
s
> + *    pauses execution until the checkpoint is done.
> + * 2. CHECKPOINT op to save state (BOs for now, TODO: CS contexts)
> + * 3. UNPAUSE op to resume execution when the checkpoint is done.
> + *
> + * When restoring a process, the CRIU amdgpu plugin will perform:
> + *
> + * 1. RESTORE op to restore state
> + * 2. RESUME op to restore userptr mappings (TODO)
> + */
> +enum drm_amdgpu_criu_op {
> +    AMDGPU_CRIU_OP_PROCESS_INFO,
> +    AMDGPU_CRIU_OP_CHECKPOINT,
> +    AMDGPU_CRIU_OP_UNPAUSE,
> +    AMDGPU_CRIU_OP_RESTORE,
> +    AMDGPU_CRIU_OP_RESUME,
> +};
> +
> +struct drm_amdgpu_criu_args {
> +    __u64 bos; /* user pointer to bos array */
> +    __u64 priv_data; /* user pointer to private data */
> +    __u64 priv_data_size;
> +    __u32 num_bos;
> +    __u32 num_objs;

"Objs" are not buffer objects but something else?

> +    __u32 pid;
> +    __u32 op;
> +    __u8 is_retry: 1;

Bitfields are best avoided in uapi since the packing order is compiler
implementation defined.

Another best practice is to pad explicitly to u64 is you can envisage a
need for adding new elements in the future.

In this case __u64 flags seems would work.

Then, as the above talks about a TODO to handle CS contexts - would that
work be adding fields to this struct? With CS contexts you mean all the
state needed to enable job submission to continue from the render node?

> +};
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +    __u64 addr;
> +    __u64 size;
> +    __u64 offset;
> +    __u64 restored_offset;    /* During restore, updated offset for BO *=
/
> +    __u64 alloc_flags;
> +    __u32 preferred_domains;
> +    __u32 dmabuf_fd;
> +     __u8 is_import: 1;
> +     __u8 skip: 1;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioct=
l.h
> index fa9f9846b88e..8c3f3a51857f 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -698,6 +698,7 @@ struct kfd_ioctl_criu_args {
>        __u32 num_objects;      /* Used during ops: PROCESS_INFO, RESTORE =
*/
>        __u32 pid;              /* Used during ops: PROCESS_INFO, RESUME *=
/
>        __u32 op;
> +     __u8 is_retry: 1;
>   };
>
>   struct kfd_criu_device_bucket {
> @@ -715,7 +716,8 @@ struct kfd_criu_bo_bucket {
>        __u32 gpu_id;             /* This is the user_gpu_id */
>        __u32 alloc_flags;
>        __u32 dmabuf_fd;
> -     __u32 pad;
> +     __u8 is_import: 1;
> +     __u8 skip: 1;

Struct extensions from above two hunks are the backward compatibility
problem from the TODO item?

Regards,

Tvrtko

>   };
>
>   /* CRIU IOCTLs - END */


--_000_SA1PR12MB8144041B2283C0DD7BE90C80EFD62SA1PR12MB8144namp_
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;On 31/01/2025 18:58, David Francis wrote:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; This patch (in combination with the accompanying CRIU patch)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; allows the amdgpu CRIU plugin to support dmabuf IPC.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; It includes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - A new amdgpu ioctl (amdgpu_criu_op_ioctl), which has similar</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;options to kfd_ioctl_criu, and accompan=
ying structs.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - New &quot;is_retry&quot; field in amdkfd CRIU ioctls, to indicat=
e when.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;a restore op is a retry and certain par=
ts of the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;restore should not be re-done.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - New &quot;skip&quot; field in amdkfd CRIU bo buckets, to indicat=
e when</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;a bo cannot currently be restored and s=
hould be ignored.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - Two new drm functions, drm_prime_assign_handle and</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;drm_gem_handle_create_assigned. These a=
re similar to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;drm_gem_prime_fd_to_handle and drm_gem_=
handle_create</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;but allow the caller to specify a gem h=
andle.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;It would be best to organise the series in multiple patches. At least</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;the DRM code API additions should be one per patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Yes, this is changed in v2.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;I'll make a mix of comments throughout the patch, some will be low leve=
l</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;where I think code can just align with the kernel style more and so mak=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;it a bit easier to read. So bear with that please and probably just mak=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;a note for when doing a respin to perhaps consider that.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Most of these comments have been incorporated into v2. Where they haven't,<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I will respond</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; Still TODO:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - Backwards compatibility between new kernel and old CRIU</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; ---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/Makefile &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 +-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 401 ++++++++++++=
+++++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h | &nbsp;24 ++</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c &nbsp;| &nbsp; 2 +<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | &nbsp;37 ++-</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h &nbsp; &nbsp;| &nbsp;=
 2 +-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; drivers/gpu/drm/drm_prime.c &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| 146 +++++++++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; include/drm/drm_prime.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 7 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; include/uapi/drm/amdgpu_drm.h &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp;46 +++</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; include/uapi/linux/kfd_ioctl.h &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | &nbsp; 4 +-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; 10 files changed, 653 insertions(+), 18 deletions(-)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm=
/amd/amdgpu/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 6cb3a2b2725a..eac5a455e6de 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mg=
r.o amdgpu_kms.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o=
 amdgpu_vm_cpu.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_vm_sdma.o amdgpu_discovery.o amd=
gpu_ras_eeprom.o amdgpu_nbio.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru=
_eeprom.o amdgpu_rap.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay.o \</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay.o amd=
gpu_criu.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp=
_ta.o amdgpu_lsdma.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_s=
eq64.o amdgpu_aca.o amdgpu_dev_coredump.o \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_userq_fence.o amdgpu_eviction_fe=
nce.o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_criu.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; new file mode 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 000000000000..4f3e5cb61323</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- /dev/null</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -0,0 +1,401 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;linux/dma-buf.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;linux/hashtable.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;linux/mutex.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;linux/random.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/amdgpu_drm.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/drm_device.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/drm_file.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_criu.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/amdgpu_drm.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/drm_drv.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/drm_exec.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/drm_gem_ttm_helper.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/ttm/ttm_tt.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_display.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_dma_buf.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_hmm.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_xgmi.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static bool is_import(struct amdgpu_bo *bo) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (bo-&gt;tbo.base.import_attach)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return &amp;bo-&gt;tbo=
.base !=3D (struct drm_gem_object *)bo-&gt;tbo.base.import_attach-&gt;dmabu=
f-&gt;priv;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return false;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int reserve_bo_and_vm(struct amdgpu_bo *bo,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_vm *vm,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; struct drm_exec *exec)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; WARN_ON(!vm);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0=
);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_exec_until_all_locked(exec) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_vm_lock=
_pd(vm, exec, 2);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_exec_retry_on_cont=
ention(exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (unlikely(ret))</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto error;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D drm_exec_prepa=
re_obj(exec, &amp;bo-&gt;tbo.base, 1);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_exec_retry_on_cont=
ention(exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (unlikely(ret))</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto error;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +error:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; pr_err(&quot;Failed to reserve buffers in ttm.\n&q=
uot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_exec_fini(exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static void unreserve_bo_and_vm(struct drm_exec *exec)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_exec_fini(exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int amdgpu_criu_process_info(struct drm_device *dev, struc=
t drm_file *data,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu_args *args) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_gem_object *gobj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int num_bos =3D 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int num_vm_mappings =3D 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdgpu_fpr=
iv *)data-&gt;driver_priv)-&gt;vm;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_lock(&amp;data-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_for_each_entry(&amp;data-&gt;object_idr, gobj,=
 id) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_bo *bo =
=3D gem_to_amdgpu_bo(gobj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_vm_bo_ba=
se *vm_bo_base;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; num_bos +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_bo_base =3D bo-&gt;=
vm_bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; while(vm_bo_base) {</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_base, struct amdgpu=
_bo_va, base);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct amdgpu_bo_va_mapping *mapping;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (vm_bo_base-&gt;vm =3D=3D avm) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list_for_each_entry(mapping, &amp;bo_va-&=
gt;invalids, list) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; num_vm_mappin=
gs +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list_for_each_entry(mapping, &amp;bo_va-&=
gt;valids, list) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; num_vm_mappin=
gs +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; vm_bo_base =3D vm_bo_base-&gt;next;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_unlock(&amp;data-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; args-&gt;num_bos =3D num_bos;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; args-&gt;priv_data_size =3D sizeof(struct drm_amdg=
pu_criu_bo_priv_data) * num_bos + sizeof(struct drm_amdgpu_criu_vm_mapping_=
priv_data) * num_vm_mappings;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; args-&gt;num_objs =3D num_vm_mappings;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; args-&gt;pid =3D avm-&gt;task_info-&gt;pid;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int amdgpu_criu_checkpoint(struct drm_device *dev, struct =
drm_file *data,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu_args *args) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_gem_object *gobj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdgpu_fpr=
iv *)data-&gt;driver_priv)-&gt;vm;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int num_bos =3D 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_bo_priv_data *bo_privs;</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_vm_mapping_priv_data *vm_pr=
ivs;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int vm_priv_index =3D 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int bo_index =3D 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Generally it is nicer to order the declaration by width where practical=
.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_lock(&amp;data-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_for_each_entry(&amp;data-&gt;object_idr, gobj,=
 id) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; num_bos +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;And to avoid curlies for single line blocks.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_unlock(&amp;data-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (args-&gt;num_bos !=3D num_bos) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EINVAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Since the below loop does the unlocked walk it can potentially overwrit=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;the allocated buffers. Maybe it cannot happen but I think it is best to=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;write it defensively.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_bucke=
ts), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!bo_buckets)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bo_privs =3D kvzalloc(num_bos * sizeof(*bo_privs),=
 GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!bo_privs)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; vm_privs =3D kvzalloc(args-&gt;num_objs * sizeof(*=
vm_privs), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!vm_privs)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;These obviously can leak memory so just need to extend the existing</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;onion unwind to handle it all.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;You could also use kvcalloc, or even forgo the temporary allocation and=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;copy blobs as it goes. (If using kvzalloc suggests these might be large=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;allocations so perhaps it makes sense to avoid them.)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_for_each_entry(&amp;data-&gt;object_idr, gobj,=
 id) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_bo *bo =
=3D gem_to_amdgpu_bo(gobj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu=
_bo_bucket *bo_bucket;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu=
_bo_priv_data *bo_priv;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_vm_bo_ba=
se *vm_bo_base;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_bo *main=
_bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket =3D &amp;bo_=
buckets[bo_index];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_priv =3D &amp;bo_pr=
ivs[bo_index];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;size =3D=
 amdgpu_bo_size(bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;offset =
=3D amdgpu_bo_mmap_offset(bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;alloc_fl=
ags =3D bo-&gt;flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;preferre=
d_domains =3D bo-&gt;preferred_domains;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_priv-&gt;idr_handle=
 =3D id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;is_impor=
t =3D is_import(bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; main_bo =3D bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (is_import(main_bo)=
) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;is_import() is called twice in sequence.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; main_bo =3D gem_to_amdgpu_bo(bo-&gt;tbo.base.import_attach-&gt;dmabuf=
-&gt;priv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_gem_prime_handle_t=
o_fd(dev, data, id, 0, &amp;fd);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (fd) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; bo_bucket-&gt;dmabuf_fd =3D fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_bo_base =3D bo-&gt;=
vm_bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; while(vm_bo_base) {</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct amdgpu_bo_va *bo_va =3D container_of(vm_bo_base, struct amdgpu=
_bo_va, base);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct amdgpu_bo_va_mapping *mapping;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (vm_bo_base-&gt;vm =3D=3D avm) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list_for_each_entry(mapping, &amp;bo_va-&=
gt;invalids, list) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].start =3D mapping-&gt;start;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].last =3D mapping-&gt;last;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].offset =3D mapping-&gt;offset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].flags =3D mapping-&gt;flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].idr_handle =3D id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_priv_index=
 +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt=
;addr =3D mapping-&gt;start * 0x1000;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;PAGE_SIZE? Or something else?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
AMDGPU_GPU_PAGE_SIZE</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list_for_each_entry(mapping, &amp;bo_va-&=
gt;valids, list) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].start =3D mapping-&gt;start;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].last =3D mapping-&gt;last;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].offset =3D mapping-&gt;offset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].flags =3D mapping-&gt;flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_privs[vm_p=
riv_index].idr_handle =3D id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm_priv_index=
 +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt=
;addr =3D mapping-&gt;start * 0x1000;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Looks like some sort of a helper could consolidate the handling of two<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;lists. Either pass a list_head pointer, or keep the walks here and pass=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;in the mapping, something like that.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; vm_bo_base =3D vm_bo_base-&gt;next;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_index +=3D 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_to_user((void *)args-&gt;bos, bo_buck=
ets, num_bos * sizeof(*bo_buckets));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Probably needs to be (void __user *) in the cast.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_err(&quot;Failed to=
 copy BO information to user\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Probably make these debug level at most since userspace can trigger the=
m</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;at will and it is not a kernel level error.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EFAULT;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_to_user((void *)args-&gt;priv_data, b=
o_privs, num_bos * sizeof(*bo_privs));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_err(&quot;Failed to=
 copy BO PRIV information to user\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EFAULT;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_to_user((void *)(args-&gt;priv_data +=
 sizeof(struct drm_amdgpu_criu_bo_priv_data) * num_bos), vm_privs, args-&gt=
;num_objs * sizeof(*vm_privs));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_err(&quot;Failed to=
 copy VM PRIV information to user\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EFAULT;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; exit:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; kvfree(bo_buckets);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; kvfree(bo_privs);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int amdgpu_criu_unpause(struct drm_device *dev, struct drm=
_file *data,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu_args *args) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int amdgpu_criu_restore(struct drm_device *dev, struct drm=
_file *data,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu_args *args) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int i;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_bo_priv_data *bo_privs;</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_vm_mapping_priv_data *vm_pr=
ivs;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdgpu_fpr=
iv *)data-&gt;driver_priv)-&gt;vm;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_fpriv *fpriv =3D (struct amdgpu_fpri=
v *)data-&gt;driver_priv;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_device *adev =3D drm_to_adev(dev);</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct amdgpu_bo *restored_bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bo_buckets =3D kvzalloc(args-&gt;num_bos * sizeof(=
*bo_buckets), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!bo_buckets)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_from_user(bo_buckets, (void *)args-&g=
t;bos, args-&gt;num_bos * sizeof(*bo_buckets));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; bo_privs =3D kvzalloc(args-&gt;num_bos * sizeof(*b=
o_privs), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!bo_privs)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_from_user(bo_privs, (void *)args-&gt;=
priv_data, args-&gt;num_bos * sizeof(*bo_privs));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; vm_privs =3D kvzalloc(args-&gt;num_objs * sizeof(*=
vm_privs), GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!vm_privs)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -ENOMEM;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_from_user(vm_privs, (void *)(args-&gt=
;priv_data + sizeof(struct drm_amdgpu_criu_bo_priv_data) * args-&gt;num_bos=
), args-&gt;num_objs * sizeof(*vm_privs));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return -EINVAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;This could also be done without the kernel side allocation but your cal=
l</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;whether it would make sense or not. (Ie. depending on expected sizes.)<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; for (i =3D 0; i &lt; args-&gt;num_bos; i++) {</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu=
_bo_bucket *bo_bucket =3D &amp;bo_buckets[i];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu=
_bo_priv_data *bo_priv =3D &amp;bo_privs[i];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_bo *bo;<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (bo_bucket-&gt;skip=
)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; continue;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Maybe drop some comments in the code so it is clear why and when the sk=
ip.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!bo_bucket-&gt;is_=
import) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct drm_gem_object *obj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; enum ttm_bo_type type =3D ttm_bo_type_device;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; int xcp_id =3D -1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; int prime_fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (bo_bucket-&gt;preferred_domains =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xcp_id =3D fpriv-&gt;xcp_id =3D=3D AMDGPU=
_XCP_NO_PARTITION ?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 : fpriv-&gt;xcp_id;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;It this right? How come amdgpu_gem_create_ioctl() simply passes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;fpriv-&gt;xcp_id + 1 to amdgpu_gem_object_create()?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hmm. amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu() does this check.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Not sure why.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; amdgpu_gem_object_create(adev, bo_bucket-&gt;size, 1, bo_bucket-&gt;p=
referred_domains,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;alloc_flags, type, NULL, &a=
mp;obj, xcp_id + 1);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; bo =3D gem_to_amdgpu_bo(obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D drm_gem_handle_create_assigned(data, obj, bo_priv-&gt;idr_han=
dle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Error checking should probably be done.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; restored_bo =3D bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Is setting bo on this branch needed or you could assign to restored_bo<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;directly with gem_to_amdgpu_bo(obj)?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; bo_bucket-&gt;restored_offset =3D amdgpu_bo_mmap_offset(restored_bo);=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D drm_gem_prime_handle_to_fd(dev,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data, bo_priv-&gt;idr_handle,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DRM_RDWR,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;prime_fd);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Treating all buffers as exported makes something easier, or? Perhaps ad=
d</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;a comment at minimum.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This branch is for exported; the other branch is for imported</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; bo_bucket-&gt;dmabuf_fd =3D prime_fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;} else {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct drm_gem_object *obj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (bo-&gt;kfd_bo) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Isn't bo unset on this branch?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Mea Culpa; this was a big mistake.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D drm_prime_assign_handle(dev, data=
, bo_bucket-&gt;dmabuf_fd, bo_priv-&gt;idr_handle, &amp;obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Leaks memory.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;At this stage the exported buffer has already been created and exported=
,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;right? So bo_bucket-&gt;dmabuf_fd is valid and will resolve to it.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;bo_priv-&gt;idr_handle is a differend handle than when exported buffer =
was</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;created?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (obj !=3D &amp;bo-&gt;tbo.base)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; restored_bo =
=3D gem_to_amdgpu_bo(obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; restored_bo =
=3D bo;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;restored_offset =3D amdgpu_=
bo_mmap_offset(restored_bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; a=
rgs-&gt;num_objs; i++) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct drm_amdgpu_criu_vm_mapping_priv_data *vm_priv =3D &amp;vm_priv=
s[i];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct amdgpu_bo_va *bo_va;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; struct drm_exec exec;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (vm_priv-&gt;idr_handle !=3D bo_priv-&gt;idr_handle)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Hmm will keying vm_priv with idr_handle prevent restoring buffers not</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;associated with userspace? Perhaps some internal key would be better to=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;tie the two.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Given that the only case handled at this point is a drm buffer that</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
originated from dmabuf import, they must all have an idr_handle.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; reserve_bo_and_vm(restored_bo, avm, &amp;exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; bo_va =3D amdgpu_vm_bo_find(avm, restored_bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;In which cases can bo_va be present at this point?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; if (!bo_va)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_va =3D amdgpu_vm_bo_add(adev, avm, res=
tored_bo);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; amdgpu_vm_bo_map(adev,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;bo_va,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;vm_priv-&gt;start * AMDGPU_GPU_PAGE_SIZE, vm_priv=
-&gt;offset,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;(vm_priv-&gt;last - vm_priv-&gt;start + 1) * AMDG=
PU_GPU_PAGE_SIZE, vm_priv-&gt;flags);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D amdgpu_vm_bo_update(adev, bo_va, false);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D amdgpu_vm_update_pdes(adev, avm, false);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; unreserve_bo_and_vm(&amp;exec);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D copy_to_user((void *)args-&gt;bos, bo_buck=
ets, args-&gt;num_bos * sizeof(*bo_buckets));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pr_err(&quot;Failed to=
 copy BO information to user\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EFAULT;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; exit:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +static int amdgpu_criu_resume(struct drm_device *dev, struct drm_=
file *data,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_amdgpu_criu_args *args) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_file *filp)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_amdgpu_criu_args *args =3D data;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; switch (args-&gt;op) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; case AMDGPU_CRIU_OP_PROCESS_INFO:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_criu_pr=
ocess_info(dev, filp, args);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; case AMDGPU_CRIU_OP_CHECKPOINT:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_criu_ch=
eckpoint(dev, filp, args);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; case AMDGPU_CRIU_OP_UNPAUSE:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_criu_un=
pause(dev, filp, args);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; case AMDGPU_CRIU_OP_RESTORE:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_criu_re=
store(dev, filp, args);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; case AMDGPU_CRIU_OP_RESUME:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D amdgpu_criu_re=
sume(dev, filp, args);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; default:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D -EINVAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; \ No newline at end of file</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_criu.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; new file mode 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 000000000000..35fbb1ffdd71</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- /dev/null</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -0,0 +1,24 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#ifndef __AMDGPU_CRIU_H__</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#define __AMDGPU_CRIU_H__</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &lt;drm/amdgpu_drm.h&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; struct drm_file *filp);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t=
 *handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +struct drm_amdgpu_criu_bo_priv_data {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; uint32_t idr_handle; // IDR for drm gem idr</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +struct drm_amdgpu_criu_vm_mapping_priv_data {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; uint64_t start;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;uint64_t last;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;uint64_t offset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;uint64_t flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;uint32_t idr_handle;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#endif</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; \ No newline at end of file</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_drv.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index acb9dc3705ac..12d844598efc 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -53,6 +53,7 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;amdgpu_xgmi.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;amdgpu_userqueue.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;amdgpu_userq_fence.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_criu.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;../amdxcp/amdgpu_xcp_drv.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; /*</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -2909,6 +2910,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_km=
s[] =3D {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_=
userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, =
amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, am=
dgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_criu_op_i=
octl, DRM_AUTH|DRM_RENDER_ALLOW),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; static const struct drm_driver amdgpu_kms_driver =3D {</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gp=
u/drm/amd/amdkfd/kfd_chardev.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 065d87841459..2a535a1870fa 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -45,6 +45,8 @@</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;amdgpu_dma_buf.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #include &quot;kfd_debug.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#include &quot;amdgpu_criu.h&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; static long kfd_ioctl(struct file *, unsigned int, unsigned=
 long);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; static int kfd_open(struct inode *, struct file *);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; static int kfd_release(struct inode *, struct file *);</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -2469,7 +2471,8 @@ static int criu_restore_bos(struct kfd_proce=
ss *p,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/* Create and map new BOs */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;for (; i &lt; args-&gt;num_bos; i++) {<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D criu_restore_b=
o(p, &amp;bo_buckets[i], &amp;bo_privs[i], &amp;files[i]);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!bo_buckets[i].ski=
p)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ret =3D criu_restore_bo(p, &amp;bo_buckets[i], &amp;bo_privs[i], &amp=
;files[i]);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ret) {<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;pr_debug(&quot;Failed to restore BO[%d] ret%d\n&quot;, i, =
ret);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;goto exit;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -2558,7 +2561,7 @@ static int criu_restore(struct file *filep,<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; args-&gt;n=
um_devices, args-&gt;num_bos, args-&gt;num_objects, args-&gt;priv_data_size=
);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!args-&gt;bos || !args-&gt;devices =
|| !args-&gt;priv_data || !args-&gt;priv_data_size ||</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; !args-&gt;num_devices || !args-&gt;n=
um_bos)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; !args-&gt;num_devices)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -EIN=
VAL;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;mutex_lock(&amp;p-&gt;mutex);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -2567,26 +2570,30 @@ static int criu_restore(struct file *filep=
,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * Set the process to evicted state to =
avoid running any new queues before all the memory</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * mappings are ready.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVIC=
TION_CRIU_RESTORE);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit_unlock;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!args-&gt;is_retry) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D kfd_process_ev=
ict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTORE);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto exit_unlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; /* Each function will adjust priv_offset based on =
how many bytes they consumed */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; ret =3D criu_restore_process(p, args, &amp;priv_of=
fset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit_unlock;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Each function will =
adjust priv_offset based on how many bytes they consumed */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D criu_restore_p=
rocess(p, args, &amp;priv_offset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto exit_unlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; ret =3D criu_restore_devices(p, args, &amp;priv_of=
fset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit_unlock;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D criu_restore_d=
evices(p, args, &amp;priv_offset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto exit_unlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D criu_restore_bos(p, args, &amp;=
priv_offset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto exit_u=
nlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; ret =3D criu_restore_objects(filep, p, args, &amp;=
priv_offset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit_unlock;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (!args-&gt;is_retry) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D criu_restore_o=
bjects(filep, p, args, &amp;priv_offset, args-&gt;priv_data_size);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto exit_unlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (priv_offset !=3D args-&gt;priv_data=
_size) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pr_err(&quo=
t;Invalid private data size\n&quot;);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/d=
rm/amd/amdkfd/kfd_priv.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index c32b255c0eb2..fd81275b8724 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -1207,7 +1207,7 @@ int kfd_process_init_cwsr_apu(struct kfd_pro=
cess *process, struct file *filep);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp;* kfd_criu_svm_range_priv_data</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp;*/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; -#define KFD_CRIU_PRIV_VERSION 1</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#define KFD_CRIU_PRIV_VERSION 2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; struct kfd_criu_process_priv_data {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t version;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_pri=
me.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 0e3f8adf162f..8f6e7c064aaf 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/drivers/gpu/drm/drm_prime.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/drivers/gpu/drm/drm_prime.c</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -1084,3 +1084,149 @@ void drm_prime_gem_destroy(struct drm_gem_=
object *obj, struct sg_table *sg)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;dma_buf_put(dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; EXPORT_SYMBOL(drm_prime_gem_destroy);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int drm_prime_assign_handle(struct drm_device *dev,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct drm_file *file_priv, int prime_fd,<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t handle, struct drm_gem_object **g=
em_obj)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_gem_object *obj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int existing_handle;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct dma_buf *dma_buf;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; dma_buf =3D dma_buf_get(prime_fd);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (IS_ERR(dma_buf))</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PTR_ERR(dma_buf=
);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_lock(&amp;file_priv-&gt;prime.lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D drm_prime_lookup_buf_handle(&amp;file_priv=
-&gt;prime,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; dma_buf, &amp;existing_handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret =3D=3D 0)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_put;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;If this will signal success when passed in handle wasn't assigned that<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;sounds wrong for the &quot;assign handle&quot; implied semantics. I pro=
bably first</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;need to understand how this works from the callers (restore) perspectiv=
e.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This was wrong. Fixed in v2.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; /* never seen this one, need to import */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_lock(&amp;dev-&gt;object_name_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (dev-&gt;driver-&gt;gem_prime_import)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj =3D dev-&gt;driver=
-&gt;gem_prime_import(dev, dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; else</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj =3D drm_gem_prime_=
import(dev, dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (IS_ERR(obj)) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D PTR_ERR(obj);<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_unlock;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; *gem_obj =3D obj;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;dma_buf) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WARN_ON(obj-&gt;dma_bu=
f !=3D dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; } else {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; obj-&gt;dma_buf =3D dm=
a_buf;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; get_dma_buf(dma_buf);<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; obj-&gt;handle_count++;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_gem_object_get(obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; /* _handle_create_tail unconditionally unlocks dev=
-&gt;object_name_lock. */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_preload(GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_lock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D idr_alloc(&amp;file_priv-&gt;object_idr, o=
bj, handle, handle + 1, GFP_NOWAIT);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_preload_end();</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret &lt; 0)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D drm_vma_node_allow(&amp;obj-&gt;vma_node, =
file_priv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;funcs-&gt;open) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D obj-&gt;funcs-=
&gt;open(obj, file_priv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_gem_object_put(obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D drm_prime_add_buf_handle(&amp;file_priv-&g=
t;prime,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; dma_buf, handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_unlock(&amp;file_priv-&gt;prime.lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto fail;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; dma_buf_put(dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +fail:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; /* hmm, if driver attached, we are relying on the =
free-object path</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;* to detach.. which seems ok..</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_gem_handle_delete(file_priv, handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; dma_buf_put(dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +out_unlock:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +out_put:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_unlock(&amp;file_priv-&gt;prime.lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; dma_buf_put(dma_buf);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +EXPORT_SYMBOL(drm_prime_assign_handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int drm_gem_handle_create_assigned(struct drm_file *file_priv,</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;struct drm_gem_object *obj,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;uint32_t handle)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +{</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; struct drm_device *dev =3D obj-&gt;dev;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_lock(&amp;dev-&gt;object_name_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; WARN_ON(!mutex_is_locked(&amp;dev-&gt;object_name_=
lock));</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;handle_count++ =3D=3D 0)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; drm_gem_object_get(obj=
);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; /*</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;* Get the user-visible handle using idr. &nb=
sp;Preload and perform</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;* allocation under our spinlock.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_preload(GFP_KERNEL);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_lock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D idr_alloc(&amp;file_priv-&gt;object_idr, o=
bj, handle, handle + 1, GFP_NOWAIT);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Helper looks justified to me. But AFAICT it is 99% a copy of</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;drm_gem_handle_create_tail with the only difference being start and end=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;parameters to idr_alloc. IMO it would be preferrable to avoid</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;duplicating. Add start and end parameters to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;drm_gem_handle_create_assigned, rename it to maybe something like</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;drm_gem_handle_create_tail_range, and call that from both old</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;drm_gem_handle_create_tail and this new drm_gem_handle_create_assigned.=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Good point. Did this refactor.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_preload_end();</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret &lt; 0)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err_unref;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; ret =3D drm_vma_node_allow(&amp;obj-&gt;vma_node, =
file_priv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto err_remove;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;funcs-&gt;open) {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D obj-&gt;funcs-=
&gt;open(obj, file_priv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ret)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto err_revoke;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +err_revoke:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; drm_vma_node_revoke(&amp;obj-&gt;vma_node, file_pr=
iv);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +err_remove:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_lock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; idr_remove(&amp;file_priv-&gt;object_idr, handle);=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +err_unref:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; return ret;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +}</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +EXPORT_SYMBOL(drm_gem_handle_create_assigned);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; \ No newline at end of file</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index fa085c44d4ca..591ed81acb84 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/include/drm/drm_prime.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/include/drm/drm_prime.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -112,5 +112,12 @@ int drm_prime_sg_to_page_array(struct sg_tabl=
e *sgt, struct page **pages,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int max_pages);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dm=
a_addr_t *addrs,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int max_pages);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int drm_prime_assign_handle(struct drm_device *dev,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct drm_file *file_priv, int prime_fd,<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t handle, struct drm_gem_object **g=
em_obj);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +int drm_gem_handle_create_assigned(struct drm_file *file_priv,</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;struct drm_gem_object *obj,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;uint32_t handle);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #endif /* __DRM_PRIME_H__ */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdg=
pu_drm.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index 8191d0bd0c00..c6766fe5c1bc 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/include/uapi/drm/amdgpu_drm.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/include/uapi/drm/amdgpu_drm.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -57,6 +57,7 @@ extern &quot;C&quot; {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_AMDGPU_USERQ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;0x16</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_AMDGPU_USERQ_SIGNAL &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 0x17</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_AMDGPU_USERQ_WAIT &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; 0x18</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#define DRM_AMDGPU_CRIU_OP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x1=
9</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_IOCTL_AMDGPU_GEM_CREATE DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_IOCTL_AMDGPU_GEM_MMAP &nbsp; DRM_IOWR(DRM_COMMA=
ND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -77,6 +78,7 @@ extern &quot;C&quot; {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_IOCTL_AMDGPU_USERQ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm=
_amdgpu_userq)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL &nbsp; &nbsp; &nbsp; =
DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_user=
q_signal)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #define DRM_IOCTL_AMDGPU_USERQ_WAIT DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +#define DRM_IOCTL_AMDGPU_CRIU_OP &nbsp; &nbsp; DRM_IOWR(DRM_COMMA=
ND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; /**</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp;* DOC: memory domains</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -1585,6 +1587,50 @@ struct drm_color_ctm_3x4 {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 matrix[12];</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +/* CRIU ioctl</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + *</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * When checkpointing a process, the CRIU amdgpu plugin will perf=
orm:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * 1. INFO op to get information about state that needs to be sav=
ed. This</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * &nbsp; &nbsp;pauses execution until the checkpoint is done.</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * 2. CHECKPOINT op to save state (BOs for now, TODO: CS contexts=
)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * 3. UNPAUSE op to resume execution when the checkpoint is done.=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + *</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * When restoring a process, the CRIU amdgpu plugin will perform:=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + *</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * 1. RESTORE op to restore state</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + * 2. RESUME op to restore userptr mappings (TODO)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +enum drm_amdgpu_criu_op {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;AMDGPU_CRIU_OP_PROCESS_INFO,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;AMDGPU_CRIU_OP_CHECKPOINT,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;AMDGPU_CRIU_OP_UNPAUSE,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;AMDGPU_CRIU_OP_RESTORE,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;AMDGPU_CRIU_OP_RESUME,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +struct drm_amdgpu_criu_args {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 bos; /* user pointer to bos array */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 priv_data; /* user pointer to private data */=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 priv_data_size;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 num_bos;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 num_objs;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&quot;Objs&quot; are not buffer objects but something else?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Objs is the term used by kfd CRIU to refer to the memory containing</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
data about non-bo driver state such as queues and events.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Agree that it's not the clearest name.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 pid;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 op;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u8 is_retry: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Bitfields are best avoided in uapi since the packing order is compiler<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;implementation defined.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Changed.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Another best practice is to pad explicitly to u64 is you can envisage a=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;need for adding new elements in the future.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;In this case __u64 flags seems would work.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Then, as the above talks about a TODO to handle CS contexts - would tha=
t</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;work be adding fields to this struct? With CS contexts you mean all the=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;state needed to enable job submission to continue from the render node?=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Old CRIU will never call the drm ioctls, so no backwards compatibility</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
is needed there.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +struct drm_amdgpu_criu_bo_bucket {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 addr;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 size;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 offset;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 restored_offset; &nbsp; &nbsp;/* During resto=
re, updated offset for BO */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u64 alloc_flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 preferred_domains;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp;__u32 dmabuf_fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; __u8 is_import: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; __u8 skip: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +};</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #if defined(__cplusplus)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; }</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; #endif</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/k=
fd_ioctl.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; index fa9f9846b88e..8c3f3a51857f 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; --- a/include/uapi/linux/kfd_ioctl.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; +++ b/include/uapi/linux/kfd_ioctl.h</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -698,6 +698,7 @@ struct kfd_ioctl_criu_args {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 num_objects; &nbsp; &nbsp; &nbsp;=
/* Used during ops: PROCESS_INFO, RESTORE */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 pid; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* Used during ops: PROCESS_INFO, RESUME */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 op;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; __u8 is_retry: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; };</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; struct kfd_criu_device_bucket {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; @@ -715,7 +716,8 @@ struct kfd_criu_bo_bucket {</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 gpu_id; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; /* This is the user_gpu_id */</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 alloc_flags;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 dmabuf_fd;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; - &nbsp; &nbsp; __u32 pad;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; __u8 is_import: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt; + &nbsp; &nbsp; __u8 skip: 1;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Struct extensions from above two hunks are the backward compatibility</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;problem from the TODO item?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;Tvrtko<br>
<br>
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
David</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tvrtko Ursulin &lt;tv=
rtko.ursulin@igalia.com&gt;<br>
<b>Sent:</b> Tuesday, February 25, 2025 7:08 AM<br>
<b>To:</b> Francis, David &lt;David.Francis@amd.com&gt;; dri-devel@lists.fr=
eedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Kuehling, Felix &l=
t;Felix.Kuehling@amd.com&gt;; James (Weijun) Jiang &lt;Weijun.Jiang@amd.com=
&gt;; dcostantino@meta.com &lt;dcostantino@meta.com&gt;; sruffell@meta.com
 &lt;sruffell@meta.com&gt;<br>
<b>Subject:</b> Re: [PATCH] Support dmabuf IPC with amdgpu CRIU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
Hi,<br>
<br>
On 31/01/2025 18:58, David Francis wrote:<br>
&gt; This patch (in combination with the accompanying CRIU patch)<br>
&gt; allows the amdgpu CRIU plugin to support dmabuf IPC.<br>
&gt; <br>
&gt; It includes<br>
&gt; - A new amdgpu ioctl (amdgpu_criu_op_ioctl), which has similar<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; options to kfd_ioctl_criu, a=
nd accompanying structs.<br>
&gt; - New &quot;is_retry&quot; field in amdkfd CRIU ioctls, to indicate wh=
en.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a restore op is a retry and =
certain parts of the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; restore should not be re-don=
e.<br>
&gt; - New &quot;skip&quot; field in amdkfd CRIU bo buckets, to indicate wh=
en<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a bo cannot currently be res=
tored and should be ignored.<br>
&gt; - Two new drm functions, drm_prime_assign_handle and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_handle_create_assign=
ed. These are similar to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_prime_fd_to_handle a=
nd drm_gem_handle_create<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but allow the caller to spec=
ify a gem handle.<br>
<br>
It would be best to organise the series in multiple patches. At least <br>
the DRM code API additions should be one per patch.<br>
<br>
I'll make a mix of comments throughout the patch, some will be low level <b=
r>
where I think code can just align with the kernel style more and so make <b=
r>
it a bit easier to read. So bear with that please and probably just make <b=
r>
a note for when doing a respin to perhaps consider that.<br>
<br>
&gt; Still TODO:<br>
&gt; - Backwards compatibility between new kernel and old CRIU<br>
&gt; <br>
&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 401 +++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |&nbsp; 24 ++<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp; |&nbsp;&nbsp=
; 2 +<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |&nbsp; 37 ++-<br=
>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h&nbsp;&nbsp;&nbsp; |&=
nbsp;&nbsp; 2 +-<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/drm_prime.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 146 +++++++++<br>
&gt;&nbsp;&nbsp; include/drm/drm_prime.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
&nbsp; 7 +<br>
&gt;&nbsp;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 46 +++<br>
&gt;&nbsp;&nbsp; include/uapi/linux/kfd_ioctl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
&gt;&nbsp;&nbsp; 10 files changed, 653 insertions(+), 18 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.=
c<br>
&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.=
h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile<br>
&gt; index 6cb3a2b2725a..eac5a455e6de 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o =
amdgpu_kms.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_xgmi.o amdgpu_csa.o a=
mdgpu_ras.o amdgpu_vm_cpu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_sdma.o amdgpu_disc=
overy.o amdgpu_ras_eeprom.o amdgpu_nbio.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_umc.o smu_v11_0_i2c.o=
 amdgpu_fru_eeprom.o amdgpu_rap.o \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o amdgpu_criu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_eeprom.o amdgpu_mca.o=
 amdgpu_psp_ta.o amdgpu_lsdma.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_mux.o amdgpu_xcp=
.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_userq_fence.o amdgpu_=
eviction_fence.o<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..4f3e5cb61323<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c<br>
&gt; @@ -0,0 +1,401 @@<br>
&gt; +<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/hashtable.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/random.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_device.h&gt;<br>
&gt; +#include &lt;drm/drm_file.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_exec.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_ttm_helper.h&gt;<br>
&gt; +#include &lt;drm/ttm/ttm_tt.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu.h&quot;<br>
&gt; +#include &quot;amdgpu_display.h&quot;<br>
&gt; +#include &quot;amdgpu_dma_buf.h&quot;<br>
&gt; +#include &quot;amdgpu_hmm.h&quot;<br>
&gt; +#include &quot;amdgpu_xgmi.h&quot;<br>
&gt; +<br>
&gt; +static bool is_import(struct amdgpu_bo *bo) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (bo-&gt;tbo.base.import_attach)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return &amp;bo-&gt;tbo.base !=3D (struct drm_gem_object *)bo-&gt;tbo.ba=
se.import_attach-&gt;dmabuf-&gt;priv;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int reserve_bo_and_vm(struct amdgpu_bo *bo,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct amdgpu_vm *vm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; struct drm_exec *exec)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(!vm);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_W=
AIT, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_until_all_locked(exec) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_vm_lock_pd(vm, exec, 2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_exec_retry_on_contention(exec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (unlikely(ret))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D drm_exec_prepare_obj(exec, &amp;bo-&gt;tbo.base, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_exec_retry_on_contention(exec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (unlikely(ret))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +<br>
&gt; +error:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to reserve buffers in tt=
m.\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_fini(exec);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void unreserve_bo_and_vm(struct drm_exec *exec)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_exec_fini(exec);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_criu_process_info(struct drm_device *dev, struct dr=
m_file *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_amdgpu_criu_args *args) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *gobj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_bos =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_vm_mappings =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdg=
pu_fpriv *)data-&gt;driver_priv)-&gt;vm;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;data-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;data-&gt;object_idr,=
 gobj, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_vm_bo_base *vm_bo_base;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_bos +=3D 1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vm_bo_base =3D bo-&gt;vm_bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; while(vm_bo_base) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va *bo=
_va =3D container_of(vm_bo_base, struct amdgpu_bo_va, base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va_map=
ping *mapping;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm_bo_base-&gt;vm =
=3D=3D avm) {<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(mapping, &amp;bo_va-&gt;invali=
ds, list) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nu=
m_vm_mappings +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(mapping, &amp;bo_va-&gt;valids=
, list) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nu=
m_vm_mappings +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_bo_base =3D vm_bo_ba=
se-&gt;next;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;data-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_bos =3D num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;priv_data_size =3D sizeof(struct dr=
m_amdgpu_criu_bo_priv_data) * num_bos + sizeof(struct drm_amdgpu_criu_vm_ma=
pping_priv_data) * num_vm_mappings;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_objs =3D num_vm_mappings;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;pid =3D avm-&gt;task_info-&gt;pid;<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_criu_checkpoint(struct drm_device *dev, struct drm_=
file *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_amdgpu_criu_args *args) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *gobj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdg=
pu_fpriv *)data-&gt;driver_priv)-&gt;vm;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_bos =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_priv_data *bo_priv=
s;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_vm_mapping_priv_data =
*vm_privs;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int vm_priv_index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int bo_index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
<br>
Generally it is nicer to order the declaration by width where practical.<br=
>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;data-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;data-&gt;object_idr,=
 gobj, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_bos +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
And to avoid curlies for single line blocks.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;data-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;num_bos !=3D num_bos) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EINVAL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Since the below loop does the unlocked walk it can potentially overwrite <b=
r>
the allocated buffers. Maybe it cannot happen but I think it is best to <br=
>
write it defensively.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_buckets =3D kvzalloc(num_bos * sizeof(*bo=
_buckets), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_buckets)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_privs =3D kvzalloc(num_bos * sizeof(*bo_p=
rivs), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_privs)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; vm_privs =3D kvzalloc(args-&gt;num_objs * si=
zeof(*vm_privs), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!vm_privs)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
<br>
These obviously can leak memory so just need to extend the existing <br>
onion unwind to handle it all.<br>
<br>
You could also use kvcalloc, or even forgo the temporary allocation and <br=
>
copy blobs as it goes. (If using kvzalloc suggests these might be large <br=
>
allocations so perhaps it makes sense to avoid them.)<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;data-&gt;object_idr,=
 gobj, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_bucket *bo_bucket;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_priv_data *bo_priv;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_vm_bo_base *vm_bo_base;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *main_bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket =3D &amp;bo_buckets[bo_index];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_priv =3D &amp;bo_privs[bo_index];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;size =3D amdgpu_bo_size(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;offset =3D amdgpu_bo_mmap_offset(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;alloc_flags =3D bo-&gt;flags;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;preferred_domains =3D bo-&gt;preferred_domains;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_priv-&gt;idr_handle =3D id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;is_import =3D is_import(bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; main_bo =3D bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_import(main_bo)) {<br>
<br>
is_import() is called twice in sequence.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; main_bo =3D gem_to_amdg=
pu_bo(bo-&gt;tbo.base.import_attach-&gt;dmabuf-&gt;priv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_gem_prime_handle_to_fd(dev, data, id, 0, &amp;fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fd) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;dmabuf_fd=
 =3D fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vm_bo_base =3D bo-&gt;vm_bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; while(vm_bo_base) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va *bo=
_va =3D container_of(vm_bo_base, struct amdgpu_bo_va, base);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va_map=
ping *mapping;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm_bo_base-&gt;vm =
=3D=3D avm) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(mapping, &amp;bo_va-&gt;invali=
ds, list) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].start =3D mapping-&gt;start;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].last =3D mapping-&gt;last;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].offset =3D mapping-&gt;offset;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].flags =3D mapping-&gt;flags;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].idr_handle =3D id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_priv_index +=3D 1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo=
_bucket-&gt;addr =3D mapping-&gt;start * 0x1000;<br>
<br>
PAGE_SIZE? Or something else?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(mapping, &amp;bo_va-&gt;valids=
, list) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].start =3D mapping-&gt;start;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].last =3D mapping-&gt;last;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].offset =3D mapping-&gt;offset;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].flags =3D mapping-&gt;flags;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_privs[vm_priv_index].idr_handle =3D id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
_priv_index +=3D 1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo=
_bucket-&gt;addr =3D mapping-&gt;start * 0x1000;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Looks like some sort of a helper could consolidate the handling of two <br>
lists. Either pass a list_head pointer, or keep the walks here and pass <br=
>
in the mapping, something like that.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm_bo_base =3D vm_bo_ba=
se-&gt;next;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_index +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void *)args-&gt;bos, b=
o_buckets, num_bos * sizeof(*bo_buckets));<br>
<br>
Probably needs to be (void __user *) in the cast.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;Failed to copy BO information to user\n&quot;);<br>
<br>
Probably make these debug level at most since userspace can trigger them <b=
r>
at will and it is not a kernel level error.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void *)args-&gt;priv_d=
ata, bo_privs, num_bos * sizeof(*bo_privs));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;Failed to copy BO PRIV information to user\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void *)(args-&gt;priv_=
data + sizeof(struct drm_amdgpu_criu_bo_priv_data) * num_bos), vm_privs, ar=
gs-&gt;num_objs * sizeof(*vm_privs));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;Failed to copy VM PRIV information to user\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; exit:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(bo_buckets);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(bo_privs);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_criu_unpause(struct drm_device *dev, struct drm_fil=
e *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_amdgpu_criu_args *args) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_criu_restore(struct drm_device *dev, struct drm_fil=
e *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_amdgpu_criu_args *args) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_priv_data *bo_priv=
s;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_vm_mapping_priv_data =
*vm_privs;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vm *avm =3D &amp;((struct amdg=
pu_fpriv *)data-&gt;driver_priv)-&gt;vm;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_fpriv *fpriv =3D (struct amdgp=
u_fpriv *)data-&gt;driver_priv;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D drm_to_adev(d=
ev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *restored_bo;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_buckets =3D kvzalloc(args-&gt;num_bos * s=
izeof(*bo_buckets), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_buckets)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_from_user(bo_buckets, (void *)a=
rgs-&gt;bos, args-&gt;num_bos * sizeof(*bo_buckets));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -EINVAL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_privs =3D kvzalloc(args-&gt;num_bos * siz=
eof(*bo_privs), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_privs)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_from_user(bo_privs, (void *)arg=
s-&gt;priv_data, args-&gt;num_bos * sizeof(*bo_privs));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -EINVAL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; vm_privs =3D kvzalloc(args-&gt;num_objs * si=
zeof(*vm_privs), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!vm_privs)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_from_user(vm_privs, (void *)(ar=
gs-&gt;priv_data + sizeof(struct drm_amdgpu_criu_bo_priv_data) * args-&gt;n=
um_bos), args-&gt;num_objs * sizeof(*vm_privs));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -EINVAL;<br>
<br>
This could also be done without the kernel side allocation but your call <b=
r>
whether it would make sense or not. (Ie. depending on expected sizes.)<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; args-&gt;num_bos; i++) =
{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_bucket *bo_bucket =3D &amp;bo_buckets[i];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_priv_data *bo_priv =3D &amp;bo_privs[i];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (bo_bucket-&gt;skip)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
<br>
Maybe drop some comments in the code so it is clear why and when the skip.<=
br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!bo_bucket-&gt;is_import) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *=
obj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum ttm_bo_type type =
=3D ttm_bo_type_device;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int xcp_id =3D -1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int prime_fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo_bucket-&gt;prefe=
rred_domains =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; xcp_id =3D fpriv-&gt;xcp_id =3D=3D AMDGPU_XCP_NO_P=
ARTITION ?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 0 : fpriv-&gt;xcp_id;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
It this right? How come amdgpu_gem_create_ioctl() simply passes <br>
fpriv-&gt;xcp_id + 1 to amdgpu_gem_object_create()?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_gem_object_creat=
e(adev, bo_bucket-&gt;size, 1, bo_bucket-&gt;preferred_domains,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;alloc_flags, type, NULL, &amp;obj, x=
cp_id + 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo =3D gem_to_amdgpu_bo=
(obj);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_gem_handle_=
create_assigned(data, obj, bo_priv-&gt;idr_handle);<br>
<br>
Error checking should probably be done.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; restored_bo =3D bo;<br>
<br>
Is setting bo on this branch needed or you could assign to restored_bo <br>
directly with gem_to_amdgpu_bo(obj)?<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;restored_=
offset =3D amdgpu_bo_mmap_offset(restored_bo);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_gem_prime_h=
andle_to_fd(dev,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; data, bo_priv-&gt;idr_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; DRM_RDWR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &amp;prime_fd);<br>
<br>
Treating all buffers as exported makes something easier, or? Perhaps add <b=
r>
a comment at minimum.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;dmabuf_fd=
 =3D prime_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else {<br>
<br>
} else {<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *=
obj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo-&gt;kfd_bo) {<br=
>
<br>
Isn't bo unset on this branch?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_prime_assign_handle(dev, data, bo_buck=
et-&gt;dmabuf_fd, bo_priv-&gt;idr_handle, &amp;obj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; go=
to exit;<br>
<br>
Leaks memory.<br>
<br>
At this stage the exported buffer has already been created and exported, <b=
r>
right? So bo_bucket-&gt;dmabuf_fd is valid and will resolve to it. <br>
bo_priv-&gt;idr_handle is a differend handle than when exported buffer was =
<br>
created?<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (obj !=3D &amp;bo-&gt;tbo.base)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
stored_bo =3D gem_to_amdgpu_bo(obj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
stored_bo =3D bo;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;restored_offset =3D amdgpu_bo_mmap_o=
ffset(restored_bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (i =3D 0; i &lt; args-&gt;num_objs; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_=
vm_mapping_priv_data *vm_priv =3D &amp;vm_privs[i];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va *bo=
_va;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_exec exec;<b=
r>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm_priv-&gt;idr_han=
dle !=3D bo_priv-&gt;idr_handle)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
<br>
Hmm will keying vm_priv with idr_handle prevent restoring buffers not <br>
associated with userspace? Perhaps some internal key would be better to <br=
>
tie the two.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reserve_bo_and_vm(resto=
red_bo, avm, &amp;exec);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_va =3D amdgpu_vm_bo_=
find(avm, restored_bo);<br>
<br>
In which cases can bo_va be present at this point?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_va)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; bo_va =3D amdgpu_vm_bo_add(adev, avm, restored_bo)=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_bo_map(adev,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; bo_va,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; vm_priv-&gt;start * AMDGPU_GPU_PAGE_SIZE, vm_priv-&gt;offset,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; (vm_priv-&gt;last - vm_priv-&gt;start + 1) * AMDGPU_GPU_PAGE_SIZE, v=
m_priv-&gt;flags);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_vm_bo_up=
date(adev, bo_va, false);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_vm_updat=
e_pdes(adev, avm, false);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unreserve_bo_and_vm(&am=
p;exec);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void *)args-&gt;bos, b=
o_buckets, args-&gt;num_bos * sizeof(*bo_buckets));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_err(&quot;Failed to copy BO information to user\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; exit:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int amdgpu_criu_resume(struct drm_device *dev, struct drm_file=
 *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_amdgpu_criu_args *args) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_args *args =3D data;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; switch (args-&gt;op) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_CRIU_OP_PROCESS_INFO:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_criu_process_info(dev, filp, args);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_CRIU_OP_CHECKPOINT:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_criu_checkpoint(dev, filp, args);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_CRIU_OP_UNPAUSE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_criu_unpause(dev, filp, args);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_CRIU_OP_RESTORE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_criu_restore(dev, filp, args);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_CRIU_OP_RESUME:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D amdgpu_criu_resume(dev, filp, args);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EINVAL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..35fbb1ffdd71<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +#ifndef __AMDGPU_CRIU_H__<br>
&gt; +#define __AMDGPU_CRIU_H__<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +<br>
&gt; +int amdgpu_criu_op_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp);<br>
&gt; +<br>
&gt; +struct amdgpu_bo *bo_from_criu_global_handle(uint8_t *handle);<br>
&gt; +int insert_bo_at_criu_global_handle(struct amdgpu_bo *bo, uint8_t *ha=
ndle);<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_priv_data {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t idr_handle; // IDR for drm gem idr<=
br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_vm_mapping_priv_data {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t start;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t last;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t offset;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t flags;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t idr_handle;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c<br>
&gt; index acb9dc3705ac..12d844598efc 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; @@ -53,6 +53,7 @@<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_xgmi.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_userqueue.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_userq_fence.h&quot;<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;../amdxcp/amdgpu_xcp_drv.h&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /*<br>
&gt; @@ -2909,6 +2910,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_OP, amdgpu_cri=
u_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static const struct drm_driver amdgpu_kms_driver =3D {<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index 065d87841459..2a535a1870fa 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -45,6 +45,8 @@<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_dma_buf.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;kfd_debug.h&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
&gt;&nbsp;&nbsp; static long kfd_ioctl(struct file *, unsigned int, unsigne=
d long);<br>
&gt;&nbsp;&nbsp; static int kfd_open(struct inode *, struct file *);<br>
&gt;&nbsp;&nbsp; static int kfd_release(struct inode *, struct file *);<br>
&gt; @@ -2469,7 +2471,8 @@ static int criu_restore_bos(struct kfd_process *=
p,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Create and map new BOs */=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (; i &lt; args-&gt;num_b=
os; i++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D criu_restore_bo(p, &amp;bo_buckets[i], &amp;bo_privs[i], &amp;f=
iles[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!bo_buckets[i].skip)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D criu_restore_bo=
(p, &amp;bo_buckets[i], &amp;bo_privs[i], &amp;files[i]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debu=
g(&quot;Failed to restore BO[%d] ret%d\n&quot;, i, ret);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto ex=
it;<br>
&gt; @@ -2558,7 +2561,7 @@ static int criu_restore(struct file *filep,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_devices, args-&gt;num_bos, args-&gt;=
num_objects, args-&gt;priv_data_size);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!args-&gt;bos || !args-&=
gt;devices || !args-&gt;priv_data || !args-&gt;priv_data_size ||<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !args-&gt;num_device=
s || !args-&gt;num_bos)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !args-&gt;num_device=
s)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;p-&gt;mutex)=
;<br>
&gt; @@ -2567,26 +2570,30 @@ static int criu_restore(struct file *filep,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Set the process to e=
victed state to avoid running any new queues before all the memory<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * mappings are ready.<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D kfd_process_evict_queues(p, KFD_QUEU=
E_EVICTION_CRIU_RESTORE);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!args-&gt;is_retry) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_CRIU_RESTORE);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit_unlock;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* Each function will adjust priv_offset bas=
ed on how many bytes they consumed */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D criu_restore_process(p, args, &amp;p=
riv_offset, args-&gt;priv_data_size);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Each function will adjust priv_offset based on how many bytes they c=
onsumed */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D criu_restore_process(p, args, &amp;priv_offset, args-&gt;priv_d=
ata_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit_unlock;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D criu_restore_devices(p, args, &amp;p=
riv_offset, args-&gt;priv_data_size);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D criu_restore_devices(p, args, &amp;priv_offset, args-&gt;priv_d=
ata_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D criu_restore_bos(p, =
args, &amp;priv_offset, args-&gt;priv_data_size);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto exit_unlock;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D criu_restore_objects(filep, p, args,=
 &amp;priv_offset, args-&gt;priv_data_size);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!args-&gt;is_retry) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D criu_restore_objects(filep, p, args, &amp;priv_offset, args-&gt=
;priv_data_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv_offset !=3D args-&g=
t;priv_data_size) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; pr_err(&quot;Invalid private data size\n&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/a=
md/amdkfd/kfd_priv.h<br>
&gt; index c32b255c0eb2..fd81275b8724 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h<br>
&gt; @@ -1207,7 +1207,7 @@ int kfd_process_init_cwsr_apu(struct kfd_process=
 *process, struct file *filep);<br>
&gt;&nbsp;&nbsp;&nbsp; * kfd_criu_svm_range_priv_data<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#define KFD_CRIU_PRIV_VERSION 1<br>
&gt; +#define KFD_CRIU_PRIV_VERSION 2<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; struct kfd_criu_process_priv_data {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t version;<br>
&gt; diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c=
<br>
&gt; index 0e3f8adf162f..8f6e7c064aaf 100644<br>
&gt; --- a/drivers/gpu/drm/drm_prime.c<br>
&gt; +++ b/drivers/gpu/drm/drm_prime.c<br>
&gt; @@ -1084,3 +1084,149 @@ void drm_prime_gem_destroy(struct drm_gem_obje=
ct *obj, struct sg_table *sg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_buf_put(dma_buf);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; EXPORT_SYMBOL(drm_prime_gem_destroy);<br>
&gt; +<br>
&gt; +int drm_prime_assign_handle(struct drm_device *dev,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct drm_file *file_priv, int prime_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; uint32_t handle, struct drm_gem_object **gem_obj)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *obj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int existing_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct dma_buf *dma_buf;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_buf =3D dma_buf_get(prime_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(dma_buf))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return PTR_ERR(dma_buf);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;file_priv-&gt;prime.lock);<b=
r>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_prime_lookup_buf_handle(&amp;fil=
e_priv-&gt;prime,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_buf, &amp;existing_=
handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto out_put;<br>
<br>
If this will signal success when passed in handle wasn't assigned that <br>
sounds wrong for the &quot;assign handle&quot; implied semantics. I probabl=
y first <br>
need to understand how this works from the callers (restore) perspective.<b=
r>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* never seen this one, need to import */<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;dev-&gt;object_name_lock);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;driver-&gt;gem_prime_import)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; obj =3D dev-&gt;driver-&gt;gem_prime_import(dev, dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; obj =3D drm_gem_prime_import(dev, dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(obj)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D PTR_ERR(obj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto out_unlock;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; *gem_obj =3D obj;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (obj-&gt;dma_buf) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WARN_ON(obj-&gt;dma_buf !=3D dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; obj-&gt;dma_buf =3D dma_buf;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; get_dma_buf(dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; obj-&gt;handle_count++;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_object_get(obj);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* _handle_create_tail unconditionally unloc=
ks dev-&gt;object_name_lock. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_preload(GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;file_priv-&gt;table_lock);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D idr_alloc(&amp;file_priv-&gt;object_=
idr, obj, handle, handle + 1, GFP_NOWAIT);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_preload_end();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_vma_node_allow(&amp;obj-&gt;vma_=
node, file_priv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (obj-&gt;funcs-&gt;open) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D obj-&gt;funcs-&gt;open(obj, file_priv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_object_put(obj);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_prime_add_buf_handle(&amp;file_p=
riv-&gt;prime,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_buf, handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;file_priv-&gt;prime.lock);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto fail;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_buf_put(dma_buf);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* hmm, if driver attached, we are relying o=
n the free-object path<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to detach.. which seems ok..<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_handle_delete(file_priv, handle);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_buf_put(dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +<br>
&gt; +out_unlock:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);=
<br>
&gt; +out_put:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;file_priv-&gt;prime.lock);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dma_buf_put(dma_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(drm_prime_assign_handle);<br>
&gt; +<br>
&gt; +int drm_gem_handle_create_assigned(struct drm_file *file_priv,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struc=
t drm_gem_object *obj,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint3=
2_t handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D obj-&gt;dev;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;dev-&gt;object_name_lock);<b=
r>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(!mutex_is_locked(&amp;dev-&gt;object=
_name_lock));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (obj-&gt;handle_count++ =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_gem_object_get(obj);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Get the user-visible handle using id=
r.&nbsp; Preload and perform<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * allocation under our spinlock.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_preload(GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;file_priv-&gt;table_lock);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D idr_alloc(&amp;file_priv-&gt;object_=
idr, obj, handle, handle + 1, GFP_NOWAIT);<br>
<br>
Helper looks justified to me. But AFAICT it is 99% a copy of <br>
drm_gem_handle_create_tail with the only difference being start and end <br=
>
parameters to idr_alloc. IMO it would be preferrable to avoid <br>
duplicating. Add start and end parameters to <br>
drm_gem_handle_create_assigned, rename it to maybe something like <br>
drm_gem_handle_create_tail_range, and call that from both old <br>
drm_gem_handle_create_tail and this new drm_gem_handle_create_assigned.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_preload_end();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;dev-&gt;object_name_lock);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto err_unref;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_vma_node_allow(&amp;obj-&gt;vma_=
node, file_priv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto err_remove;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (obj-&gt;funcs-&gt;open) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D obj-&gt;funcs-&gt;open(obj, file_priv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err_revoke;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +<br>
&gt; +err_revoke:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_vma_node_revoke(&amp;obj-&gt;vma_node, f=
ile_priv);<br>
&gt; +err_remove:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;file_priv-&gt;table_lock);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_remove(&amp;file_priv-&gt;object_idr, ha=
ndle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;file_priv-&gt;table_lock);<=
br>
&gt; +err_unref:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(drm_gem_handle_create_assigned);<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h<br>
&gt; index fa085c44d4ca..591ed81acb84 100644<br>
&gt; --- a/include/drm/drm_prime.h<br>
&gt; +++ b/include/drm/drm_prime.h<br>
&gt; @@ -112,5 +112,12 @@ int drm_prime_sg_to_page_array(struct sg_table *s=
gt, struct page **pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_pages);<br>
&gt;&nbsp;&nbsp; int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, d=
ma_addr_t *addrs,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_pages);<=
br>
&gt; +int drm_prime_assign_handle(struct drm_device *dev,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct drm_file *file_priv, int prime_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; uint32_t handle, struct drm_gem_object **gem_obj);<br>
&gt; +<br>
&gt; +int drm_gem_handle_create_assigned(struct drm_file *file_priv,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struc=
t drm_gem_object *obj,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint3=
2_t handle);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #endif /* __DRM_PRIME_H__ */<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_d=
rm.h<br>
&gt; index 8191d0bd0c00..c6766fe5c1bc 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -57,6 +57,7 @@ extern &quot;C&quot; {<br>
&gt;&nbsp;&nbsp; #define DRM_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x16<br>
&gt;&nbsp;&nbsp; #define DRM_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x17<br>
&gt;&nbsp;&nbsp; #define DRM_AMDGPU_USERQ_WAIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
&gt; +#define DRM_AMDGPU_CRIU_OP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 0x19<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_CREATE DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)<br>
&gt;&nbsp;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_MMAP&nbsp;&nbsp; DRM_IOWR(DRM=
_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)<br>
&gt; @@ -77,6 +78,7 @@ extern &quot;C&quot; {<br>
&gt;&nbsp;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BAS=
E + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)<br>
&gt;&nbsp;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct=
 drm_amdgpu_userq_signal)<br>
&gt;&nbsp;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_WAIT DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)<br>
&gt; +#define DRM_IOCTL_AMDGPU_CRIU_OP&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM=
_COMMAND_BASE + DRM_AMDGPU_CRIU_OP, struct drm_amdgpu_criu_args)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp; * DOC: memory domains<br>
&gt; @@ -1585,6 +1587,50 @@ struct drm_color_ctm_3x4 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 matrix[12];<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt; +/* CRIU ioctl<br>
&gt; + *<br>
&gt; + * When checkpointing a process, the CRIU amdgpu plugin will perform:=
<br>
&gt; + * 1. INFO op to get information about state that needs to be saved. =
This<br>
&gt; + *&nbsp;&nbsp;&nbsp; pauses execution until the checkpoint is done.<b=
r>
&gt; + * 2. CHECKPOINT op to save state (BOs for now, TODO: CS contexts)<br=
>
&gt; + * 3. UNPAUSE op to resume execution when the checkpoint is done.<br>
&gt; + *<br>
&gt; + * When restoring a process, the CRIU amdgpu plugin will perform:<br>
&gt; + *<br>
&gt; + * 1. RESTORE op to restore state<br>
&gt; + * 2. RESUME op to restore userptr mappings (TODO)<br>
&gt; + */<br>
&gt; +enum drm_amdgpu_criu_op {<br>
&gt; +&nbsp;&nbsp;&nbsp; AMDGPU_CRIU_OP_PROCESS_INFO,<br>
&gt; +&nbsp;&nbsp;&nbsp; AMDGPU_CRIU_OP_CHECKPOINT,<br>
&gt; +&nbsp;&nbsp;&nbsp; AMDGPU_CRIU_OP_UNPAUSE,<br>
&gt; +&nbsp;&nbsp;&nbsp; AMDGPU_CRIU_OP_RESTORE,<br>
&gt; +&nbsp;&nbsp;&nbsp; AMDGPU_CRIU_OP_RESUME,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_args {<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 bos; /* user pointer to bos array */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 priv_data; /* user pointer to private data *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 priv_data_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 num_objs;<br>
<br>
&quot;Objs&quot; are not buffer objects but something else?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 pid;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 op;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u8 is_retry: 1;<br>
<br>
Bitfields are best avoided in uapi since the packing order is compiler <br>
implementation defined.<br>
<br>
Another best practice is to pad explicitly to u64 is you can envisage a <br=
>
need for adding new elements in the future.<br>
<br>
In this case __u64 flags seems would work.<br>
<br>
Then, as the above talks about a TODO to handle CS contexts - would that <b=
r>
work be adding fields to this struct? With CS contexts you mean all the <br=
>
state needed to enable job submission to continue from the render node?<br>
<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_bucket {<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 addr;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 size;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 offset;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 restored_offset;&nbsp;&nbsp;&nbsp; /* During=
 restore, updated offset for BO */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 alloc_flags;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 preferred_domains;<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 dmabuf_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 is_import: 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 skip: 1;<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp;&nbsp; #if defined(__cplusplus)<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt; diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_i=
octl.h<br>
&gt; index fa9f9846b88e..8c3f3a51857f 100644<br>
&gt; --- a/include/uapi/linux/kfd_ioctl.h<br>
&gt; +++ b/include/uapi/linux/kfd_ioctl.h<br>
&gt; @@ -698,6 +698,7 @@ struct kfd_ioctl_criu_args {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 num_objects;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* Used during ops: PROCESS_INFO, RESTORE */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 pid;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Used during=
 ops: PROCESS_INFO, RESUME */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 op;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 is_retry: 1;<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; struct kfd_criu_device_bucket {<br>
&gt; @@ -715,7 +716,8 @@ struct kfd_criu_bo_bucket {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 gpu_id;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This is the us=
er_gpu_id */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 alloc_flags;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u32 dmabuf_fd;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; __u32 pad;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 is_import: 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u8 skip: 1;<br>
<br>
Struct extensions from above two hunks are the backward compatibility <br>
problem from the TODO item?<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
<br>
&gt;&nbsp;&nbsp; };<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /* CRIU IOCTLs - END */<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SA1PR12MB8144041B2283C0DD7BE90C80EFD62SA1PR12MB8144namp_--
