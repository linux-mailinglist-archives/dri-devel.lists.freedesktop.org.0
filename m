Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F598A69F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23B710E513;
	Mon, 30 Sep 2024 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aEdlJfRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F910E3F6;
 Mon, 30 Sep 2024 14:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKHuQHwklYYZ7lp72qaOPpeiWH7sjHk9f4l1V917VSThCvxO3pJBwwPc2xZLf5YUp+NfMNpGg+Y7y94YHkZdsl6+AfDsJ7ISvnLnrY7suKgF5kz/P//yEpfVqi0rNft+dcGli5CjlWHklu/e0z19mSG2q63am2yvCaUQ6fb0+YEzOJZuQ9s1/S0u3ObWcVZfeaaFL4S4RmQ5bmOBj9WXjadyDcxNvGm7idy2wNvOWJeaMQ5vKLqsi+WOYV9KFqzosorfbjpJvLiPFaSqwDMUQWV72NnRbEFYuZekbfkq4RWTBlh9CSqo5ev0D4IlFKU0XxoY+cKtQjHBcOJunmyVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7U14cOUs5nclZX8L/PyW5UpyD6LxZPZnZNMoY/tiYM=;
 b=lDrNzmUqxOLOTdlYXqmB8f6fIoVCTqcJUjtvJIR/ejZ86uL08BVkmWMGUmqHAzrDCcNYF7lQ4LNO1cTJkInojAIt+B1TyXcQPulcTKDUQXjq3b3JZP300qW7rnX8kjlXMYVkECUw9WESn0f3fKegkN5PSxmk4SmO8SXdXu5cS5B2LiBZYtnnzx7biCA3X7EB7WJlpkec5XbPXhqxWgS1ZAY3tV8o8TwzVZee6R4SZWWaeT8Xy6os6aSLW0YULJQJ82xNuI9P1qU89jg2ZfGC738Zjy/mdByt0ufTRvzIrCUtMr8uMklth77bDiHjYdgAGt945LBhuSDPXPPZLw8gtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7U14cOUs5nclZX8L/PyW5UpyD6LxZPZnZNMoY/tiYM=;
 b=aEdlJfRbLSueHdXmG6I38P3+6fdO8pNAbXznlKViP67Ta3NtoE033e7zFv+lgZXt38mMnKrR6Ts2/55GM/IEo7eQAXV0ZxgXIoT+u4gUcaPT5a4HaVwZpwVfk8/J7gA1bboIo6qcg0gK2KAI7fkbavG2KMa7nTQX4rE+0TjH2a0=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 14:06:27 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 14:06:27 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Jonathan
 Corbet <corbet@lwn.net>
Subject: RE: [PATCH 28/28] drm: Remove DRM aperture helpers
Thread-Topic: [PATCH 28/28] drm: Remove DRM aperture helpers
Thread-Index: AQHbEzof+McZnngLq0WRy19iH4mwnLJwXSqA
Date: Mon, 30 Sep 2024 14:06:27 +0000
Message-ID: <BL1PR12MB514462B1ECDAC79E490D0890F7762@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240930130921.689876-1-tzimmermann@suse.de>
 <20240930130921.689876-29-tzimmermann@suse.de>
In-Reply-To: <20240930130921.689876-29-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7945b151-8137-48db-ad28-27e9b7950dab;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-09-30T14:05:40Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SN7PR12MB7180:EE_
x-ms-office365-filtering-correlation-id: fbfd9a49-0dc5-418a-60ea-08dce1591398
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?o+8n2aH4mmNXPrIvczpQQ9m6/vXyTyraEOkbOIyR90f4a3Wog9NyhQVb3Lc5?=
 =?us-ascii?Q?CskD/bwXXJGyQ0H3/5QTAfyUmawL4bXo3T0CzsVjsVJDo11JEkzPJv1juYZe?=
 =?us-ascii?Q?cfVgi2cGk431rUaaiExEmOn3/ZIGcoINejtQ4j+EZDNCYgnRvv3HjGybPno4?=
 =?us-ascii?Q?Hv4lnFEkSfu1IufMye1Eqb4BcocAVemsb7vhzDKDYia7KiMKo1nlta7cv7Hb?=
 =?us-ascii?Q?NFirJb0fa87yINKZ/P//SIfmAQOwdQjP1KGqKUrVeM5Lrgg/mySRWqiv/M71?=
 =?us-ascii?Q?lGcbES87EHrDzpwSOXo/pLJHWAs5+naWKau1RG5fuKpccFkmvjibfT/vF2tu?=
 =?us-ascii?Q?ZM3chlJ+TrWZBYgxXLjqcqiuNvFClIPzn1PrN1K04Gfxbq/pOU+nAPSQI9Uz?=
 =?us-ascii?Q?HNQATKY3gLcoO5fF1kSlHeyvetj+L+onxAbJkPStH+YXFTnGqsFJwYOgncWr?=
 =?us-ascii?Q?LzqBhzLSTpSqL5gstWDo2bkzcpbhZj0DfwuNjBlgH/gSndM9TmNEaglOvfDo?=
 =?us-ascii?Q?sRSG6UEtuXMgqbGlyqoGIJmBju3EhpCUBvqT7cYaF+PjZ1M3JJxo9s011k6m?=
 =?us-ascii?Q?COhvQUDlNTt2MghWRXxWtUT/65KmSrBs7QkwtFpB79EZd7z6ZgfzQGK0n2Il?=
 =?us-ascii?Q?rTxHsNgs5QXm2R1+uuXtq6TOj2tCWPSNAJgLHPpys1eAI+Ped72jZkR1aMZy?=
 =?us-ascii?Q?gRCAbL3q5Zun1ex2E/C0y4cdLK/y8826sDOlmKHAuxsZCSZZqfexmHv4Q4Pn?=
 =?us-ascii?Q?eCWCNp/2jTgNap2ncMINjaUXykgoT7bhRBJRnPZGrMY7+lVwUBGf3Sc97wLL?=
 =?us-ascii?Q?Zp/7RU8+PaLgqRZq3E1+3SAN80bns1wM0JzH7f7Ain6k5MwTcrNEgb8RQlTq?=
 =?us-ascii?Q?LOkbRhtI76OO3nllbeFS9CDsmphBZs23FaVyBkCP0CWpRway9oevvUP3pPCs?=
 =?us-ascii?Q?VmwyP/ZOGI9fAllgKoe7XyG5QNaq0HJttytQv3mqNqb9iSi1yWjBZqjmzUXA?=
 =?us-ascii?Q?9j6V5Mfze6FO1zWkcZGUeBgrFqlLAkW7tQ6p4nfwDPjtPdQvv8N08PFdgrDU?=
 =?us-ascii?Q?F9D8pgdOPZ/v/Kkb8YXPGwZrhcm7+kqMDKl7ksufGfuZkYzyzHUSN92fKnkp?=
 =?us-ascii?Q?fMsa5+TeWisv8ojN2Pd4/vGyGNBwvNFHJEwdTusRzyRdhbXBpgOLQVlnStwe?=
 =?us-ascii?Q?KkfoK63Lx8oCQMVZZhvd5cgr3WMe/LPkRsO2kfoVxYN3Cxo/4scq9BJ0k/qL?=
 =?us-ascii?Q?DpQs1sCflTiJThUBGh1Fzs3HGf9ztEW/qjFN0/EJIlYwbuS/SpT6BmQi7+tB?=
 =?us-ascii?Q?oxQm/tLC0hUVFGMwXHjGPbktopCuSP131WWTn7516VfZB3uTP/FR1PFepCMO?=
 =?us-ascii?Q?u+Wk92Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jM/NpIVv7ZqVMAiPN92YlFDAA76ERlIEyuTf8fpfWWVZnzTilMzOrQkFk+OJ?=
 =?us-ascii?Q?iAznGH8TF8HhmiH8zK2PTm8IXeGLfTv4h+7cbMCSxObwUlG3b7T8SMDX5lVV?=
 =?us-ascii?Q?QEF+ckaUZcQrIyXq3qcW+3T4ERZYPt+EqGjh9glJfhof+x5AU7qEcMLINIId?=
 =?us-ascii?Q?M83B6I6kFJsN9AqzRn7UmlB8CfXjz/o0wSMWgwm3YDADuKNrbvMPEUx/0ELc?=
 =?us-ascii?Q?Rzd+g8Fp0W5huEc5AAM99Hiy/bCpOpVa3i9ot7rRIoN5RwXxp9xT75Y5gZpr?=
 =?us-ascii?Q?6o8a6L2ZMcU6C4NPYUleKwt8urPMJdqBVyebM1bienTBAMAjhD4zf/neTEye?=
 =?us-ascii?Q?kKlF/hVztS0gA+APWd0qOq2g/UkuQCr0RuOyLMYje8n0JylGmlvpHfEbTIo0?=
 =?us-ascii?Q?Hqz7SUOIdj1KNaT4sXCKAW1JTUxHpOcQ9DWDb31sAQfJHsC7LeEOY5DipkaS?=
 =?us-ascii?Q?uamwTiTLXrNjbudZ1r+WS6+HdIC8qIWnfWbKyUEam/8I06UfDGCgcObceGlv?=
 =?us-ascii?Q?gjMmf8fsA31H6YgAAjIMEbav4xrkMC9oTrRcMKSa5gLcckZZZt0D4Q6R23FT?=
 =?us-ascii?Q?69ZoEBRSCz+cvTRuvcJYWopnJOHmRZ5VU+WOcawL8VIRNcD1aMK3Kg1MQ17B?=
 =?us-ascii?Q?3/wHtUke8q6/n6g5yO198rggYvZmw2ngZ9nEFpSRvTBQrhH2dUsicexXIul1?=
 =?us-ascii?Q?hP09IfCZQqD34YzbxVFst/8B/Bf/AXLDBBUGHHBFP/2hX7dIsSZpzuJSISwp?=
 =?us-ascii?Q?ip1kOZNMzk35P2IvnYdmEkIQCHuUQc+xTCje4q9dflyNiUwZENGIPcx+5GKc?=
 =?us-ascii?Q?simzGG+lZYquPt8766Z1VTDszJiPE6FMT1k1HOWGx/skIYxDDhzjDqGMbTDd?=
 =?us-ascii?Q?PWSNEyumjdyumadYbkqnIXItCSOBBc73QoQ2GzqmezJ9mvdG88FSAVRUXtM7?=
 =?us-ascii?Q?XDQRHcI3QMhmKeErRpcAArlaubjlcR0HX5USvwvzBnvbqmfurTrDXPYmhthl?=
 =?us-ascii?Q?RbyLSsSEbHdSB7s47DnlwHrg8LY9VTl3NCernUfd5ZrQLC3Q/pBHTgn9LZ+M?=
 =?us-ascii?Q?SZs2RIoVvghMGuM6fDJFjiQr6EIwrKsWXb56RxldvUF4H1Hb4whcwOs4/Cqr?=
 =?us-ascii?Q?74PkBE4C0U0NAN5fJ+vvsvGTOwsg8gEUNILqQ8VnXu5wR4uhzZIBM5ropGPd?=
 =?us-ascii?Q?bbH4wm9hEUGxN53Fttmi2UkMhV2CBkAScLb720JT6Jb7muMpOJhfF6Ckh1jx?=
 =?us-ascii?Q?y8LWD55Tv1KtbMTTYNUc2j69grrF33H1kNfT2HC+Fpaq7CwRcTB0xEaYng7k?=
 =?us-ascii?Q?94+6QT+Qfyz8+pD2+IUU1bKRhYHcJqniPF9kk5wuUi9WYef8Pny6pz9x7EnH?=
 =?us-ascii?Q?iYjoITNY7WsXKB8ri//bIMGhwyZYOaFdJh8IL3xjUeY/jwhZ11/EuHvS/7yI?=
 =?us-ascii?Q?F39ou7AyfJUn8wpkGokzc1cRKLynzyM51eZDSfpTicj0EMhAx+zsBvPWIXxj?=
 =?us-ascii?Q?z++h7vH7NAA0NSDrZrli+G0fhAB4y5AiS54bOzPfciMdgR7NujGUgQMpDtKW?=
 =?us-ascii?Q?euSwrncGoVYWZevIGWk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfd9a49-0dc5-418a-60ea-08dce1591398
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 14:06:27.6678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMkKm2p5uvWqgdlBnOANfDT44c+//gPAfyGaA3jZeyEUVZK+gL1KJbMjOcquErlQA13VjDbW9o7CC9M5XCEwrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180
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
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Thomas
> Zimmermann
> Sent: Monday, September 30, 2024 9:03 AM
> To: javierm@redhat.com; airlied@gmail.com; simona@ffwll.ch;
> maarten.lankhorst@linux.intel.com; mripard@kernel.org
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel=
-
> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmerm=
ann
> <tzimmermann@suse.de>; Jonathan Corbet <corbet@lwn.net>
> Subject: [PATCH 28/28] drm: Remove DRM aperture helpers
>
> The DRM aperture helpers are wrappers around video helpers from
> <linux/aperture.h>. There are no callers of these functions. Remove them =
entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jonathan Corbet <corbet@lwn.net>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>  Documentation/gpu/drm-internals.rst |  12 --
>  MAINTAINERS                         |   2 -
>  drivers/gpu/drm/Makefile            |   1 -
>  drivers/gpu/drm/drm_aperture.c      | 192 ----------------------------
>  include/drm/drm_aperture.h          |  38 ------
>  5 files changed, 245 deletions(-)
>  delete mode 100644 drivers/gpu/drm/drm_aperture.c  delete mode 100644
> include/drm/drm_aperture.h
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-
> internals.rst
> index 11d9a5730fb2..cb9ae282771c 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -75,18 +75,6 @@ Module Initialization  .. kernel-doc::
> include/drm/drm_module.h
>     :doc: overview
>
> -Managing Ownership of the Framebuffer Aperture
> -----------------------------------------------
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
> -   :doc: overview
> -
> -.. kernel-doc:: include/drm/drm_aperture.h
> -   :internal:
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
> -   :export:
> -
>  Device Instance and Driver Handling
>  -----------------------------------
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a0b7bfb6315..e71e12085a9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7097,12 +7097,10 @@ M:    Javier Martinez Canillas <javierm@redhat.co=
m>
>  L:   dri-devel@lists.freedesktop.org
>  S:   Maintained
>  T:   git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:   drivers/gpu/drm/drm_aperture.c
>  F:   drivers/gpu/drm/tiny/ofdrm.c
>  F:   drivers/gpu/drm/tiny/simpledrm.c
>  F:   drivers/video/aperture.c
>  F:   drivers/video/nomodeset.c
> -F:   include/drm/drm_aperture.h
>  F:   include/linux/aperture.h
>  F:   include/video/nomodeset.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile index
> 3894f43f6d47..31d8bf60a2fd 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -34,7 +34,6 @@ endif
>  subdir-ccflags-$(CONFIG_DRM_WERROR) +=3D -Werror
>
>  drm-y :=3D \
> -     drm_aperture.o \
>       drm_atomic.o \
>       drm_atomic_uapi.o \
>       drm_auth.o \
> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_apertur=
e.c deleted
> file mode 100644 index 5729f3bb4398..000000000000
> --- a/drivers/gpu/drm/drm_aperture.c
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -
> -#include <linux/aperture.h>
> -#include <linux/platform_device.h>
> -
> -#include <drm/drm_aperture.h>
> -#include <drm/drm_drv.h>
> -#include <drm/drm_print.h>
> -
> -/**
> - * DOC: overview
> - *
> - * A graphics device might be supported by different drivers, but only o=
ne
> - * driver can be active at any given time. Many systems load a generic
> - * graphics drivers, such as EFI-GOP or VESA, early during the boot proc=
ess.
> - * During later boot stages, they replace the generic driver with a dedi=
cated,
> - * hardware-specific driver. To take over the device the dedicated drive=
r
> - * first has to remove the generic driver. DRM aperture functions manage
> - * ownership of DRM framebuffer memory and hand-over between drivers.
> - *
> - * DRM drivers should call drm_aperture_remove_conflicting_framebuffers(=
)
> - * at the top of their probe function. The function removes any generic
> - * driver that is currently associated with the given framebuffer memory=
.
> - * If the framebuffer is located at PCI BAR 0, the rsp code looks as in =
the
> - * example given below.
> - *
> - * .. code-block:: c
> - *
> - *   static const struct drm_driver example_driver =3D {
> - *           ...
> - *   };
> - *
> - *   static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> - *   {
> - *           resource_size_t base, size;
> - *           int ret;
> - *
> - *           base =3D pci_resource_start(pdev, 0);
> - *           size =3D pci_resource_len(pdev, 0);
> - *
> - *           return drm_aperture_remove_conflicting_framebuffers(base, s=
ize,
> - *                                                               &exampl=
e_driver);
> - *   }
> - *
> - *   static int probe(struct pci_dev *pdev)
> - *   {
> - *           int ret;
> - *
> - *           // Remove any generic drivers...
> - *           ret =3D remove_conflicting_framebuffers(pdev);
> - *           if (ret)
> - *                   return ret;
> - *
> - *           // ... and initialize the hardware.
> - *           ...
> - *
> - *           drm_dev_register();
> - *
> - *           return 0;
> - *   }
> - *
> - * PCI device drivers should call
> - * drm_aperture_remove_conflicting_pci_framebuffers() and let it detect =
the
> - * framebuffer apertures automatically. Device drivers without knowledge=
 of
> - * the framebuffer's location shall call drm_aperture_remove_framebuffer=
s(),
> - * which removes all drivers for known framebuffer.
> - *
> - * Drivers that are susceptible to being removed by other drivers, such =
as
> - * generic EFI or VESA drivers, have to register themselves as owners of=
 their
> - * given framebuffer memory. Ownership of the framebuffer memory is achi=
eved
> - * by calling devm_aperture_acquire_from_firmware(). On success, the dri=
ver
> - * is the owner of the framebuffer range. The function fails if the
> - * framebuffer is already owned by another driver. See below for an exam=
ple.
> - *
> - * .. code-block:: c
> - *
> - *   static int acquire_framebuffers(struct drm_device *dev, struct plat=
form_device
> *pdev)
> - *   {
> - *           resource_size_t base, size;
> - *
> - *           mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> - *           if (!mem)
> - *                   return -EINVAL;
> - *           base =3D mem->start;
> - *           size =3D resource_size(mem);
> - *
> - *           return devm_acquire_aperture_from_firmware(dev, base, size)=
;
> - *   }
> - *
> - *   static int probe(struct platform_device *pdev)
> - *   {
> - *           struct drm_device *dev;
> - *           int ret;
> - *
> - *           // ... Initialize the device...
> - *           dev =3D devm_drm_dev_alloc();
> - *           ...
> - *
> - *           // ... and acquire ownership of the framebuffer.
> - *           ret =3D acquire_framebuffers(dev, pdev);
> - *           if (ret)
> - *                   return ret;
> - *
> - *           drm_dev_register(dev, 0);
> - *
> - *           return 0;
> - *   }
> - *
> - * The generic driver is now subject to forced removal by other drivers.=
 This
> - * only works for platform drivers that support hot unplug.
> - * When a driver calls drm_aperture_remove_conflicting_framebuffers() et=
 al.
> - * for the registered framebuffer range, the aperture helpers call
> - * platform_device_unregister() and the generic driver unloads itself. I=
t
> - * may not access the device's registers, framebuffer memory, ROM, etc
> - * afterwards.
> - */
> -
> -/**
> - * devm_aperture_acquire_from_firmware - Acquires ownership of a firmwar=
e
> framebuffer
> - *                                       on behalf of a DRM driver.
> - * @dev:     the DRM device to own the framebuffer memory
> - * @base:    the framebuffer's byte offset in physical memory
> - * @size:    the framebuffer size in bytes
> - *
> - * Installs the given device as the new owner of the framebuffer. The fu=
nction
> - * expects the framebuffer to be provided by a platform device that has =
been
> - * set up by firmware. Firmware can be any generic interface, such as EF=
I,
> - * VESA, VGA, etc. If the native hardware driver takes over ownership of=
 the
> - * framebuffer range, the firmware state gets lost. Aperture helpers wil=
l then
> - * unregister the platform device automatically. Acquired apertures are
> - * released automatically if the underlying device goes away.
> - *
> - * The function fails if the framebuffer range, or parts of it, is curre=
ntly
> - * owned by another driver. To evict current owners, callers should use
> - * drm_aperture_remove_conflicting_framebuffers() et al. before calling =
this
> - * function. The function also fails if the given device is not a platfo=
rm
> - * device.
> - *
> - * Returns:
> - * 0 on success, or a negative errno value otherwise.
> - */
> -int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource=
_size_t
> base,
> -                                     resource_size_t size)
> -{
> -     struct platform_device *pdev;
> -
> -     if (drm_WARN_ON(dev, !dev_is_platform(dev->dev)))
> -             return -EINVAL;
> -
> -     pdev =3D to_platform_device(dev->dev);
> -
> -     return devm_aperture_acquire_for_platform_device(pdev, base, size);
> -}
> -EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
> -
> -/**
> - * drm_aperture_remove_conflicting_framebuffers - remove existing frameb=
uffers in
> the given range
> - * @base: the aperture's base address in physical memory
> - * @size: aperture size in bytes
> - * @req_driver: requesting DRM driver
> - *
> - * This function removes graphics device drivers which use the memory ra=
nge
> described by
> - * @base and @size.
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise
> - */
> -int drm_aperture_remove_conflicting_framebuffers(resource_size_t base,
> resource_size_t size,
> -                                              const struct drm_driver *r=
eq_driver)
> -{
> -     return aperture_remove_conflicting_devices(base, size, req_driver->=
name);
> -}
> -EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
> -
> -/**
> - * drm_aperture_remove_conflicting_pci_framebuffers - remove existing
> framebuffers for PCI devices
> - * @pdev: PCI device
> - * @req_driver: requesting DRM driver
> - *
> - * This function removes graphics device drivers using the memory range
> configured
> - * for any of @pdev's memory bars. The function assumes that a PCI devic=
e with
> - * shadowed ROM drives a primary display and so kicks out vga16fb.
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise
> - */
> -int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pde=
v,
> -                                                  const struct drm_drive=
r *req_driver)
> -{
> -     return aperture_remove_conflicting_pci_devices(pdev, req_driver->na=
me);
> -}
> -EXPORT_SYMBOL(drm_aperture_remove_conflicting_pci_framebuffers);
> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h dele=
ted file
> mode 100644 index cbe33b49fd5d..000000000000
> --- a/include/drm/drm_aperture.h
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -
> -#ifndef _DRM_APERTURE_H_
> -#define _DRM_APERTURE_H_
> -
> -#include <linux/types.h>
> -
> -struct drm_device;
> -struct drm_driver;
> -struct pci_dev;
> -
> -int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource=
_size_t
> base,
> -                                     resource_size_t size);
> -
> -int drm_aperture_remove_conflicting_framebuffers(resource_size_t base,
> resource_size_t size,
> -                                              const struct drm_driver *r=
eq_driver);
> -
> -int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pde=
v,
> -                                                  const struct drm_drive=
r *req_driver);
> -
> -/**
> - * drm_aperture_remove_framebuffers - remove all existing framebuffers
> - * @req_driver: requesting DRM driver
> - *
> - * This function removes all graphics device drivers. Use this function =
on systems
> - * that can have their framebuffer located anywhere in memory.
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise
> - */
> -static inline int
> -drm_aperture_remove_framebuffers(const struct drm_driver *req_driver) -{
> -     return drm_aperture_remove_conflicting_framebuffers(0, (resource_si=
ze_t)-1,
> -                                                         req_driver);
> -}
> -
> -#endif
> --
> 2.46.0

