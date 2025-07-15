Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B364B05B77
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98AE10E5C1;
	Tue, 15 Jul 2025 13:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ta3BF25c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B591A10E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXkRqeCe+7clPzoUz4vwBW83kZ7+pk6/yn7psg4so5kb65Oz6atTjakHcNhSZi5Mgs7wM6p0mzdv+JJwsH9//6T2U0lKQSpDXKVV/xiJ55ItQDi0xholm2jeF72m0fQnDJhKp6fnZqbXxs7wZ62568llIb73iaJTqhxVnZEnevHgY/7DIl1NQL65HhAzQIxAuo9qp6xRPUnmDVRG/UJ4XDtMPzWVw7MX2vQTWBLm+4r2yU+8Zl/mPFzQX/bNhtUwXMNMscSTtkX3zONz1Is14jX6vM4u+LcrudkQPSDJHFmYGUP0hc4vsSuktG9gHH+vBIl2yIb/YpebS/baTa5FNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NWvAKn1EGmgkMZA/9lVZRHgIxg9b4jGd0x3JP+dza8=;
 b=PVE78jA/9Y/GJg7Ib93A6XMliU4QIN73McArXvjsaiocqllWj+8jzdStnLkIMWB9cZ68fH+IxDoH/RJLIabrCnTqAoHoq4R/qXj6zDouzOULbe6sthk2960K9BleDf6dxQFA2T7SXBDf5shnGml7UG1LQpVgQn9cJ/2j2S7z5Z+NMbzhViEGUwzsl6+p+EDyTafEpe8A6s0xt/LwRJdviSbQCnRQ8kFsfpSM7JIfHjpJsLYsFbZ4hJWrsLHeylCHQMGo4WpMpHN3A/KGlLkvSX45c6rRDUqDsNVb51WLmJZT4dfKvqAl8DO7kZL31VyC+r5SIUtYCR9TQ/9K1bH/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NWvAKn1EGmgkMZA/9lVZRHgIxg9b4jGd0x3JP+dza8=;
 b=Ta3BF25cltlYmMpGVF3n+Kt7e3nVM4DCE5p6QwuP/4FDP0blhToerq22Hoe/4q8weMQ1437aB9CghHLIasCCKWqmIPhzt8Q/onG/uZ8FbIhKaSRSCrabwfsS5iu2a8QXpjBtS3zJzfFN6G627s9+QzZ7xxaLyUVkSNPgVWyW1f4=
Received: from PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 13:20:50 +0000
Received: from PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55]) by PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 13:20:50 +0000
From: "cao, lin" <lin.cao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "phasta@kernel.org"
 <phasta@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Topic: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Index: AQHb9Ifle3aMOyNGSECQ7l7yFOLmX7QxkXAAgAAGNYCAAAVZgIAAA2OAgADpj8+AAF4dAIAACh43gAAK0ACAAAcnAIAAGKOAgAADRgCAAAnVgIAAA3OO
Date: Tue, 15 Jul 2025 13:20:50 +0000
Message-ID: <PH0PR12MB5497CB304AAF06731C6D7F93F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250714062349.588235-1-lincao12@amd.com>
 <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
 <a8e473bd-6ea8-41e0-b5b2-10c420e5a935@amd.com>
 <70d9c6a43846c3a3c266d4a7a431c1c4b3fcd05f.camel@mailbox.org>
 <164c69fe-9ab1-4e04-8103-b25e4804e74d@amd.com>
 <PH0PR12MB549781447809324DF9A7E0D6F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <8dc0a31c06d33f45bbcb32d8805579015db91b21.camel@mailbox.org>
 <PH0PR12MB54974724ECC2262A6F00AE18F557A@PH0PR12MB5497.namprd12.prod.outlook.com>
 <44bdc3fd5628a7db07c64331007509aa39a13df4.camel@mailbox.org>
 <ba4770ce-f70b-4825-aba4-34e13c9b910f@amd.com>
 <564b80a454c5d537071c4e63622982f2d6be5639.camel@mailbox.org>
 <db50d1eb-02ed-465a-b98d-a24caa7829c7@amd.com>
 <6562a1df16c4d810542a7c42f10c5471723931ad.camel@mailbox.org>
In-Reply-To: <6562a1df16c4d810542a7c42f10c5471723931ad.camel@mailbox.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-15T13:20:49.8080000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5497:EE_|MW4PR12MB5644:EE_
x-ms-office365-filtering-correlation-id: 0266525e-bb70-4079-423f-08ddc3a26af9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?xpN3BlEsAUhjizBCjYOMuxs8mL/2QFnahPzYS7i/d+3aXshQ2jU0QGvQ?=
 =?Windows-1252?Q?sB/P61ExNAZsI7HMvPJpZ3QJm6Y3DiKmeN60/iXhecjgfi09VdyV/vSh?=
 =?Windows-1252?Q?PGpycjadLUaSOxHCZvbXlcyQU2HRG4X3HGFhVKKMLW762AbXloerehoS?=
 =?Windows-1252?Q?DwlxDP+1Oa4KDLyGyOuoLqhPtWJwqiSwepvBrf7ClIfYM8hQ8qIlKGGM?=
 =?Windows-1252?Q?frXRfgDb1MZL/lwDoU2PZr4CY8HKImVhiWKdk/lG4ogM3hG1zbDvU/qY?=
 =?Windows-1252?Q?1/gMqQdTYZVo2UDYNE3XjNWsvEqAx2PTDvBD6vRbylSG9gLKEPKV/218?=
 =?Windows-1252?Q?RryUIgpvLdlyBd8YO0Akh96z1qbYwqe5kQ6cIF5o4DgeG0wIYFEWrspb?=
 =?Windows-1252?Q?HvFpKs8wECWFGdgTm82T1wKLPTH3vUprmxYsa+ggwc+N9NOVD8FzQ09l?=
 =?Windows-1252?Q?AMeoHjSGAu2i8iNwAgsZqf4Gv/3Vvsc4v2IhrjPxk25dK5lYPIUpGMjf?=
 =?Windows-1252?Q?pEUeHZxq3Rj+Uii8EDzORj630dQ0vQ12lnLfOfL4P9aefZlFxtLL5fLD?=
 =?Windows-1252?Q?ao1M8RdidQKbuwiSOcMd9iTRhELMpTCXMjgtWdBxPvG9xlaD7U2V6zzT?=
 =?Windows-1252?Q?Tkmz+3oFGyFwHh9lNgaDDv9KH7nXpMJjQaHj6CwxM6UEDTMZOM8/sFM7?=
 =?Windows-1252?Q?BiVPXKJKIpJLHPql6W72dazU800Iz2TMClcBTjKj62ucbbe+8z6m8kLw?=
 =?Windows-1252?Q?kiUXSHaxpf4PxjHig1XbsDSdnxK+vSmFIMaphfbWumLDq3MxaGuQx4dz?=
 =?Windows-1252?Q?qKy9N5viPFP/MMobqOlP0PSnVhlwsxzTj97MV4bodyyWVU3JXIMfl1aG?=
 =?Windows-1252?Q?0gyePCd5jqBx/PVc/DTHScJbFHWBCTZrrxDeFQLWMThvZfj+ZA/BJ6GT?=
 =?Windows-1252?Q?IQwFDLcBxucmqwtsPOIAr3cUyFMyV0J8jbrY91QXBwkQxPXG/2ph2uN/?=
 =?Windows-1252?Q?+F2ImZX2HC3AtxmUCqm67l/FeUxOdWsYcdyeCR+ZyUnjRxHhR9Ad68f3?=
 =?Windows-1252?Q?EeO7hKq2mUJaAOvRO8ok4yfMOebCgcv+ESsaire4EL9eGj8QQuccYZx4?=
 =?Windows-1252?Q?chTXeAeXqjVLDT4qFQA0ZXhUIVKZsw4/0LEsQlRQfIwgBtZmc0tKIwiB?=
 =?Windows-1252?Q?55rekpn9jDxk+itAI1UHfTXHOlJ1WJ/EyaAyW+yc7e3A3ZEO8yLOrSOu?=
 =?Windows-1252?Q?BGx1TDA+LNyYD0qxn9xxPb6wt9YasWW4yElUMRua6f7pH021ismCofCu?=
 =?Windows-1252?Q?iW3cM2NZAF6Z3cyKLdQAwO+6HWi/B31DoYD2FnBo5DsCa/awPKe0+qqN?=
 =?Windows-1252?Q?2akD8Mjf3Wm+/C/WWCBFr0jKNWiz26B8uFZW10Aqyenh/q9Cw/5zFv9g?=
 =?Windows-1252?Q?k0Rk5V7iASsRaqCMC1lwyGNSlWLfPvpakLTJHA5X4J9jr9lW0wIg8wOP?=
 =?Windows-1252?Q?CZalAFKeiDnsK9yBVzrlYZtQvCpxfvv8ok0czEt2K43cHVx7E32u98oU?=
 =?Windows-1252?Q?EeBbaVXehBsOPK0X6akpi0Hxufj15l3pCBtrhw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5497.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?mjIBqIX1SGaddH3dAPYYsIMEbTqKM0/aam48vdOIp+QBC/2N/IwgRgp1?=
 =?Windows-1252?Q?7OabcJ9A8Mtb6ZqGzwZTiTMc1qaCh6ia+DYmo2tdCKICPvSdz4GCIAMA?=
 =?Windows-1252?Q?DzetM/Rt9HOgOuKfRCT3N9ZuPUhwCqGYa679KpdgEO1vlaEYfapxaR3c?=
 =?Windows-1252?Q?oqQJTW0FaxkupukT01j+/sj+hbxO071Q54VZbrdjSj8flsOjZ2/f4Pj7?=
 =?Windows-1252?Q?efO/UtOQP0Zvjz+K+tNQBI8Rlp2AT3aqkQvZrzbWRhylXu38cUNOnkMA?=
 =?Windows-1252?Q?U1V2ePBRV/hFIn+N0tTONuyl6Tj0WTS++3OLpDIlPx1emI2BN5mYo0Nb?=
 =?Windows-1252?Q?MkpV91gOJjrBcac0+3eM1TyZDz2YA/2Qvqr1CJ6rvxnEENFJHue8+1q+?=
 =?Windows-1252?Q?tg5xiSclCa0spmfaOL+3oVm2nB7cZFwlVK2Y+PVztO52Jv8o4gJEEISC?=
 =?Windows-1252?Q?2xfzEOa8vb9duC8U8UBR8l+W9RKLadOLamOx0v+wuPOcSezwaQs8F94G?=
 =?Windows-1252?Q?bg4TIssiP821n2KQPxJVs6EHq93xIdN9jjuLei8KmlHBl4rJxjzBX7g4?=
 =?Windows-1252?Q?kK4Upt7hID8800Vxbi2SFvtuTeruskinetebTCiKNS2QqRvLm939tBOK?=
 =?Windows-1252?Q?pjKNPe1zsSR0pjTjpjTy1JfIwBTJ9zcJ3io31ae0BwTjtPGJqIn4AULI?=
 =?Windows-1252?Q?oHpewGUgQasqLA+OArlnlQXb2TG71oYjQPs9/1wgVJ1IdPNhBAt/7eJk?=
 =?Windows-1252?Q?YZAfy7ybjQf4AFRGpdgW+V2LxAXFLDrhd3bfAE4bcPiRgMN5Kmci7pxa?=
 =?Windows-1252?Q?X3OUeHeKJ0lHUzOjmStt50v9n17LxDq2uzklGvfLuT6ODix/pvjP1+6v?=
 =?Windows-1252?Q?B0OELuwjG4TYSAoB4HoLsue3ltWj1xIueJBIeBanieduUBWYkGMS4V+4?=
 =?Windows-1252?Q?PyYY7jyDa7KesczPPruq512iuaUEsNNLXQWsgAFzHQZAZST0jXcqTn38?=
 =?Windows-1252?Q?dlfkDOeyuaMkGn8u17oiX3m2AsaKxIN/lHy79EcOp3Sahca16lTyQjqv?=
 =?Windows-1252?Q?uSM4Wzgvo2CdvEfQ+Xh7XgaZtLRVvbzBI46SljP2IISA1N/VXdMb8RN3?=
 =?Windows-1252?Q?YIbZeJN6NirAQ92FfhLneSQm/7j5TlE2K1jBapXTcQilprPGtFZJIkx1?=
 =?Windows-1252?Q?KSvlGlID79EQgICBA1TQbZFX3GCXKRdgHbBQX8ypJsvwRZNvEoFbLFKN?=
 =?Windows-1252?Q?qMFrFJ2EH7wQpKxQeyXKt5MJAsR0m7iG2bJ78IiUIszGn1yfHdKaMQAp?=
 =?Windows-1252?Q?jbHTMusQ3nszmP/yptafq7uyNJOBUXKFDtIPynij9/SWGibYjr5OZjth?=
 =?Windows-1252?Q?tyiM6UAPlTizD4Nj42YMTZMEoTnKCP40rfOyE7MOxtd2ktAm2vA0Zwdv?=
 =?Windows-1252?Q?qU8zO5p4owJGA8KJkBMB8kMV++oAJ3x8bCEcMunQl7WwJ+e5xBjBcGID?=
 =?Windows-1252?Q?QIYYF+Z6jExiJvItaAKRI08T9yzlr4PjQxPNsigl7frj7ei2GusqjUkf?=
 =?Windows-1252?Q?qXW5H464aVTAmP+27ZWmKYcM/2EM35MRb33ucCfOZfhEWgrSyBkSCxeV?=
 =?Windows-1252?Q?DNGU1XN7xa5BNaEMBlcyA2hfyIUelyJXVteYljiBVs6ZN3MmCRb42wJH?=
 =?Windows-1252?Q?Oa+UyzrMavs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB5497CB304AAF06731C6D7F93F557APH0PR12MB5497namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5497.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0266525e-bb70-4079-423f-08ddc3a26af9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 13:20:50.2908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tgJbTY1jP1sFLfW3zGlyFLV71UqjaUsGDNUrzb9/qhy4jhVVfw7W7/3F0MD1L4UqhiJNbNbR6RmEUXlJRH18VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

--_000_PH0PR12MB5497CB304AAF06731C6D7F93F557APH0PR12MB5497namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Philipp, Christian,

Thanks for the kind words! :)

I've reconsidered the approach and decided to go with the "removing code" s=
olution instead. I'll drop the v3 patch and submit a new v4 that removes th=
e problematic optimization in drm_sched_entity_add_dependency_cb().

Thanks,
Lin
________________________________
From: Philipp Stanner <phasta@mailbox.org>
Sent: Tuesday, July 15, 2025 21:07
To: Koenig, Christian <Christian.Koenig@amd.com>; phasta@kernel.org <phasta=
@kernel.org>; cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <=
dri-devel@lists.freedesktop.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; dakr@kernel.org <dakr@kernel.org>; matthew.brost@intel.com <matthew.=
brost@intel.com>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with=
 dependent jobs

On Tue, 2025-07-15 at 14:32 +0200, Christian K=F6nig wrote:
> On 15.07.25 14:20, Philipp Stanner wrote:
> > On Tue, 2025-07-15 at 12:52 +0200, Christian K=F6nig wrote:
> > > On 15.07.25 12:27, Philipp Stanner wrote:
> > > > On Tue, 2025-07-15 at 09:51 +0000, cao, lin wrote:
> > > > >
> > > > > [AMD Official Use Only - AMD Internal Distribution Only]
> > > > >
> > > > >
> > > > >
> > > > > Hi Philipp,
> > > > >
> > > > >
> > > > > Thanks for your review, let me try to clarify why I added
> > > > > drm_sched_wakeup() to drm_sched_entity_kill_jobs_work():
> > > > >
> > > > >
> > > > > When application A submits jobs (a1, a2, a3) and application
> > > > > B
> > > > > submits job b1 with a dependency on a1's scheduled fence, the
> > > > > normal execution flow is (function drm_sched_run_job_work()):
> > > > > 1. a1 gets popped from the entity by the scheduler
> > > > > 2. run_job(a1) executes
> > > > > 3. a1's scheduled fence gets signaled
> > > > > 4. drm_sched_run_job_work() calls drm_sched_run_job_queue()
> > > > > at
> > > > > the end
> > > > > 5. The scheduler wakes up and re-selects entities to pop jobs
> > > > > 6. Since b1's dependency is cleared, the scheduler can select
> > > > > b1
> > > > > and continue the same flow
> > > > >
> > > > >
> > > > > However, if application A is killed before a1 gets popped by
> > > > > the
> > > > > scheduler, then a1, a2, a3 are killed sequentially by
> > > > > drm_sched_entity_kill_jobs_cb(). During the kill process,
> > > > > their
> > > > > scheduled fences are still signaled, but the kill process
> > > > > itself
> > > > > lacks work_run_job. This means b1's dependency gets cleared,
> > > > > but
> > > > > there's no work_run_job to drive the scheduler to continue
> > > > > running, or we can saystep 4 in the normal flow is missing,
> > > > > and
> > > > > the scheduler enters sleep state, which causes application B
> > > > > to
> > > > > hang.
> > > > > So if we add drm_sched_wakeup() in
> > > > > drm_sched_entity_kill_jobs_work() after
> > > > > drm_sched_fence_scheduled(), the scheduler can be woken up,
> > > > > and
> > > > > application B can continue running after a1's scheduled fence
> > > > > is
> > > > > force signaled.
> > > >
> > > > Thanks for the detailed explanation. Makes sense.
> > > > Maybe you can detail in v3 that this "optimization" consists of
> > > > the
> > > > work item not being scheduled.
> > >
> > > Yeah, removing this "optimization" would also be a valid solution
> > > to
> > > the problem.
> >
> > If you at AMD are willing to work on that that'd be definitely
> > fine.
> > Removing code is usually better than adding code.
>
> I fear I won't have time for that before my retirement :)

You've got fresh, powerful folks like Lin! :)

But either solution is fine. If you just want it fixed, we can merge
the existing approach.

>
> > Do you think being afraid of a performance regression is realistic
> > here, though?
>
> No, absolutely not. It was just a micro optimization done long ago.
>
> On the other hand with the scheduler code base I'm not sure of
> anything any more.

"In my subsystem you have to run as fast as you can just to remain at
the same place", said the Red Queen to Alice.

:)

P.

>
> Regards,
> Christian.
>
> >
> >
> > P.
> >
> > >
> > > Christian.
> > >
> > > > I think that was the piece of the puzzle
> > > > I was missing.
> > > >
> > > > I / DRM tools will also include a link to this thread, so I
> > > > think
> > > > that
> > > > will then be sufficient.
> > > >
> > > > Thx
> > > > P.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Lin
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > From: Philipp Stanner <phasta@mailbox.org>
> > > > > Sent: Tuesday, July 15, 2025 17:12
> > > > > To: cao, lin <lin.cao@amd.com>; Koenig, Christian
> > > > > <Christian.Koenig@amd.com>;
> > > > > phasta@kernel.org <phasta@kernel.org>;
> > > > > dri-devel@lists.freedesktop.org <
> > > > > dri-devel@lists.freedesktop.org>
> > > > > Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> > > > > <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>;
> > > > > matthew.brost@intel.com <matthew.brost@intel.com>
> > > > > Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when
> > > > > killing app with dependent jobs
> > > > >
> > > > >
> > > > > On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:
> > > > > >
> > > > > > [AMD Official Use Only - AMD Internal Distribution Only]
> > > > > >
> > > > > >
> > > > > >
> > > > > > Hi Christian, Philipp,
> > > > > >
> > > > > >
> > > > > > I modified the commit msg, and I hope it makes more sense:
> > > > > >
> > > > > >
> > > > > > drm/sched: wake up scheduler when killing jobs to prevent
> > > > > > hang
> > > > >
> > > > > nit:
> > > > > s/wake/Wake
> > > > >
> > > > > >
> > > > > >
> > > > > > When application A submits jobs (a1, a2, a3) and
> > > > > > application B
> > > > > > submits
> > > > > > job b1 with a dependency on a2's scheduler fence, killing
> > > > > > application A
> > > > > > before run_job(a1) causes drm_sched_entity_kill_jobs_work()
> > > > > > to
> > > > > > force
> > > > > > signal all jobs sequentially. However, the optimization in
> > > > > > drm_sched_entity_add_dependency_cb() waits for the fence to
> > > > > > be
> > > > > > scheduled
> > > > > > by adding a callback (drm_sched_entity_clear_dep) instead
> > > > > > of
> > > > > > immediately
> > > > > > waking up the scheduler. When A is killed before its jobs
> > > > > > can
> > > > > > run, the
> > > > > > callback gets triggered but drm_sched_entity_clear_dep()
> > > > > > only
> > > > > > clears the
> > > > > > dependency without waking up the scheduler, causing the
> > > > > > scheduler to enter
> > > > > > sleep state and application B to hang.
> > > > >
> > > > > That now reads as if drm_sched_entity_clear_dep() is supposed
> > > > > to
> > > > > wake
> > > > > up the scheduler. But you add the wakeup to a different
> > > > > function
> > > > > (the
> > > > > work item).
> > > > >
> > > > > Also the code actually looks like that:
> > > > >
> > > > >
> > > > >                 xa_erase(&job->dependencies, index);
> > > > >                 if (f && !dma_fence_add_callback(f, &job-
> > > > > > finish_cb,
> > > > >
> > > > > drm_sched_entity_kill_jobs_cb))
> > > > >                         return;
> > > > >
> > > > >                 dma_fence_put(f);
> > > > >         }
> > > > >
> > > > >         INIT_WORK(&job->work,
> > > > > drm_sched_entity_kill_jobs_work);
> > > > >         schedule_work(&job->work);
> > > > > }
> > > > >
> > > > > So if adding that callback succeeds we.. return immediately
> > > > > but
> > > > > we.. do
> > > > > that for the first dependency, not for all of them?
> > > > >
> > > > > Oh boy. That code base. We(tm) should look into pimping that
> > > > > up.
> > > > > Also
> > > > > lacks documentation everywhere.
> > > > >
> > > > >
> > > > > Anyways. If this solves a bug for you the patch looks fine
> > > > > (i.e.,
> > > > > not
> > > > > potentially harmful) by me and if the tests succeed we can
> > > > > merge
> > > > > it.
> > > > > However, I'd feel better if you could clarify more why that
> > > > > function is
> > > > > the right place to solve the bug.
> > > > >
> > > > >
> > > > > Thanks,
> > > > > P.
> > > > >
> > > > >
> > > > > >
> > > > > >
> > > > > > Add drm_sched_wakeup() in entity_kill_job_work() to prevent
> > > > > > scheduler
> > > > > > sleep and subsequent application hangs.
> > > > > >
> > > > > >
> > > > > > v2:
> > > > > > - Move drm_sched_wakeup() to after
> > > > > > drm_sched_fence_scheduled()
> > > > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Lin
> > > > > >
> > > > > >
> > > > > > From: Koenig, Christian <Christian.Koenig@amd.com>
> > > > > > Sent: Monday, July 14, 2025 21:39
> > > > > > To: phasta@kernel.org <phasta@kernel.org>; cao, lin
> > > > > > <lin.cao@amd.com>;
> > > > > > dri-devel@lists.freedesktop.org <
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > >
> > > > > > Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> > > > > > <Emily.Deng@amd.com>; dakr@kernel.org <dakr@kernel.org>;
> > > > > > matthew.brost@intel.com <matthew.brost@intel.com>
> > > > > > Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when
> > > > > > killing app with dependent jobs
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 14.07.25 15:27, Philipp Stanner wrote:
> > > > > > > On Mon, 2025-07-14 at 15:08 +0200, Christian K=F6nig wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > On 14.07.25 14:46, Philipp Stanner wrote:
> > > > > > > > > regarding the patch subject: the prefix we use for
> > > > > > > > > the
> > > > > > > > > scheduler
> > > > > > > > > is:
> > > > > > > > > drm/sched:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:
> > > > > > > > >
> > > > > > > > > > When Application A submits jobs (a1, a2, a3) and
> > > > > > > > > > application B
> > > > > > > > > > submits
> > > > > > > > >
> > > > > > > > > s/Application/application
> > > > > > > > >
> > > > > > > > > > job b1 with a dependency on a2's scheduler fence,
> > > > > > > > > > killing
> > > > > > > > > > application A
> > > > > > > > > > before run_job(a1) causes
> > > > > > > > > > drm_sched_entity_kill_jobs_work() to
> > > > > > > > > > force
> > > > > > > > > > signal all jobs sequentially. However, due to
> > > > > > > > > > missing
> > > > > > > > > > work_run_job or
> > > > > > > > > > work_free_job
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > You probably mean "due to the work items work_run_job
> > > > > > > > > and
> > > > > > > > > work_free_job
> > > > > > > > > not being started [=85]".
> > > > > > > > >
> > > > > > > > > However, the call you add, drm_sched_wakeup(),
> > > > > > > > > immediately only
> > > > > > > > > triggers work_run_job. It's not clear to me why you
> > > > > > > > > mention
> > > > > > > > > work_free_job, because
> > > > > > > > > drm_sched_entity_kill_jobs_work()
> > > > > > > > > directly
> > > > > > > > > invokes the free_job() callback.
> > > > > > > >
> > > > > > > > Yeah the description is rather confusing, took me more
> > > > > > > > than
> > > > > > > > one try
> > > > > > > > to understand what's going on here as well. Let me try
> > > > > > > > to
> > > > > > > > explain it
> > > > > > > > in my words:
> > > > > > > >
> > > > > > > > When an application A is killed the pending submissions
> > > > > > > > from it are
> > > > > > > > not executed, but rather torn down by
> > > > > > > > drm_sched_entity_kill_jobs_work().
> > > > > > > >
> > > > > > > > If now a submission from application B depends on
> > > > > > > > something
> > > > > > > > application A wanted to do on the same scheduler
> > > > > > > > instance
> > > > > > > > the
> > > > > > > > function drm_sched_entity_add_dependency_cb() would
> > > > > > > > have
> > > > > > > > optimized
> > > > > > > > this dependency and assumed that the scheduler work
> > > > > > > > would
> > > > > > > > already run
> > > > > > > > and try to pick a job.
> > > > > > > >
> > > > > > > > But that isn't the case when the submissions from
> > > > > > > > application A are
> > > > > > > > all killed. So make sure to start the scheduler work
> > > > > > > > from
> > > > > > > > drm_sched_entity_kill_jobs_work() to handle that case.
> > > > > > >
> > > > > > > Alright, so the bug then depends on B setting a
> > > > > > > dependency on
> > > > > > > A _after_
> > > > > > > A was killed, doesn't it? Because the optimization in
> > > > > > > _add_dependency_cb() can only have an effect after A's
> > > > > > > jobs
> > > > > > > have been
> > > > > > > torn down.
> > > > > >
> > > > > > No, application A and application B submit right behind
> > > > > > each
> > > > > > other. Application A is then killed later on.
> > > > > >
> > > > > > The optimization in _add_dependency_cb() just waits for As
> > > > > > submission to be handled by the scheduler, but that never
> > > > > > happens because it was killed.
> > > > > >
> > > > > > > If there is such a timing order problem, the commit
> > > > > > > message
> > > > > > > should
> > > > > > > mention it.
> > > > > > >
> > > > > > > The commit message definitely also needs to mention this
> > > > > > > optimization
> > > > > > > in drm_sched_entity_add_dependency_cb() since it's
> > > > > > > essential
> > > > > > > for
> > > > > > > understanding the bug.
> > > > > >
> > > > > > +1
> > > > > >
> > > > > > Christian.
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Danke
> > > > > > > P.
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >  in entity_kill_job_work(), the scheduler enters
> > > > > > > > > > sleep
> > > > > > > > > > state, causing application B hang.
> > > > > > > > >
> > > > > > > > > So the issue is that if a1 never ran, the scheduler
> > > > > > > > > will
> > > > > > > > > not
> > > > > > > > > continue
> > > > > > > > > with the jobs of application B, correct?
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Add drm_sched_wakeup() when entity_kill_job_work()
> > > > > > > > > > to
> > > > > > > > > > preventing
> > > > > > > > >
> > > > > > > > > s/to preventing/to prevent
> > > > > > > > >
> > > > > > > > > > scheduler sleep and subsequent application hangs.
> > > > > > > > > >
> > > > > > > > > > v2:
> > > > > > > > > > - Move drm_sched_wakeup() to after
> > > > > > > > > > drm_sched_fence_scheduled()
> > > > > > > > >
> > > > > > > > > Changelogs are cool and useful, but move them below
> > > > > > > > > the
> > > > > > > > > Signed-off
> > > > > > > > > area
> > > > > > > > > with another --- please, like so:
> > > > > > > > >
> > > > > > > > > Signed-off by: =85
> > > > > > > > > ---
> > > > > > > > > v2:
> > > > > > > > > =85
> > > > > > > > > ---
> > > > > > > > > drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Lin.Cao <lincao12@amd.com>
> > > > > > > > >
> > > > > > > > > This fixes a bug. Even a racy bug, it seems. So we
> > > > > > > > > need a
> > > > > > > > > Fixes tag
> > > > > > > > > and
> > > > > > > > > put the stable kernel in CC.
> > > > > > > > >
> > > > > > > > > Please figure out with git blame, git log and git tag
> > > > > > > > > --
> > > > > > > > > contains
> > > > > > > > > which
> > > > > > > > > commit your patch fixes and which is the oldest
> > > > > > > > > kernel
> > > > > > > > > that
> > > > > > > > > contains
> > > > > > > > > the bug. Then add a Fixes: tag and Cc: the stable
> > > > > > > > > kernel.
> > > > > > > > > You'll
> > > > > > > > > find
> > > > > > > > > lots of examples for that in git log.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Thx
> > > > > > > > > P.
> > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > index e671aa241720..66f2a43c58fd 100644
> > > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > > > > > > @@ -177,6 +177,7 @@ static void
> > > > > > > > > > drm_sched_entity_kill_jobs_work(struct work_struct
> > > > > > > > > > *wrk)
> > > > > > > > > >    struct drm_sched_job *job =3D container_of(wrk,
> > > > > > > > > > typeof(*job), work);
> > > > > > > > > >
> > > > > > > > > >    drm_sched_fence_scheduled(job->s_fence, NULL);
> > > > > > > > > > +  drm_sched_wakeup(job->sched);
> > > > > > > > > >    drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > > > > > > > >    WARN_ON(job->s_fence->parent);
> > > > > > > > > >    job->sched->ops->free_job(job);
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


--_000_PH0PR12MB5497CB304AAF06731C6D7F93F557APH0PR12MB5497namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Philipp, Christian,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the kind words! :)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I've reconsidered the approach and decided to go with the &quot;removing co=
de&quot; solution instead. I'll drop the v3 patch and submit a new v4 that =
removes the problematic optimization in drm_sched_entity_add_dependency_cb(=
).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Lin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philipp Stanner &lt;p=
hasta@mailbox.org&gt;<br>
<b>Sent:</b> Tuesday, July 15, 2025 21:07<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; phasta@kerne=
l.org &lt;phasta@kernel.org&gt;; cao, lin &lt;lin.cao@amd.com&gt;; dri-deve=
l@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emily &l=
t;Emily.Deng@amd.com&gt;; dakr@kernel.org &lt;dakr@kernel.org&gt;; matthew.=
brost@intel.com &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2] drm/scheduler: Fix sched hang when killing a=
pp with dependent jobs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 2025-07-15 at 14:32 +0200, Christian K=F6n=
ig wrote:<br>
&gt; On 15.07.25 14:20, Philipp Stanner wrote:<br>
&gt; &gt; On Tue, 2025-07-15 at 12:52 +0200, Christian K=F6nig wrote:<br>
&gt; &gt; &gt; On 15.07.25 12:27, Philipp Stanner wrote:<br>
&gt; &gt; &gt; &gt; On Tue, 2025-07-15 at 09:51 +0000, cao, lin wrote:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; [AMD Official Use Only - AMD Internal Distribution=
 Only]<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Hi Philipp,<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thanks for your review, let me try to clarify why =
I added<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_wakeup() to drm_sched_entity_kill_jobs_w=
ork():<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; When application A submits jobs (a1, a2, a3) and a=
pplication<br>
&gt; &gt; &gt; &gt; &gt; B<br>
&gt; &gt; &gt; &gt; &gt; submits job b1 with a dependency on a1's scheduled=
 fence, the<br>
&gt; &gt; &gt; &gt; &gt; normal execution flow is (function drm_sched_run_j=
ob_work()):<br>
&gt; &gt; &gt; &gt; &gt; 1. a1 gets popped from the entity by the scheduler=
<br>
&gt; &gt; &gt; &gt; &gt; 2. run_job(a1) executes<br>
&gt; &gt; &gt; &gt; &gt; 3. a1's scheduled fence gets signaled&nbsp;<br>
&gt; &gt; &gt; &gt; &gt; 4. drm_sched_run_job_work() calls drm_sched_run_jo=
b_queue()<br>
&gt; &gt; &gt; &gt; &gt; at<br>
&gt; &gt; &gt; &gt; &gt; the end<br>
&gt; &gt; &gt; &gt; &gt; 5. The scheduler wakes up and re-selects entities =
to pop jobs<br>
&gt; &gt; &gt; &gt; &gt; 6. Since b1's dependency is cleared, the scheduler=
 can select<br>
&gt; &gt; &gt; &gt; &gt; b1<br>
&gt; &gt; &gt; &gt; &gt; and continue the same flow<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; However, if application A is killed before a1 gets=
 popped by<br>
&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; scheduler, then a1, a2, a3 are killed sequentially=
 by<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_cb(). During the kill p=
rocess,<br>
&gt; &gt; &gt; &gt; &gt; their<br>
&gt; &gt; &gt; &gt; &gt; scheduled fences are still signaled, but the kill =
process<br>
&gt; &gt; &gt; &gt; &gt; itself<br>
&gt; &gt; &gt; &gt; &gt; lacks work_run_job. This means b1's dependency get=
s cleared,<br>
&gt; &gt; &gt; &gt; &gt; but<br>
&gt; &gt; &gt; &gt; &gt; there's no work_run_job to drive the scheduler to =
continue<br>
&gt; &gt; &gt; &gt; &gt; running, or we can saystep 4 in the normal flow is=
 missing,<br>
&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; the scheduler enters sleep state, which causes app=
lication B<br>
&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; hang.<br>
&gt; &gt; &gt; &gt; &gt; So if we add drm_sched_wakeup() in<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_work() after<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_fence_scheduled(), the scheduler can be =
woken up,<br>
&gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; application B can continue running after a1's sche=
duled fence<br>
&gt; &gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; &gt; force signaled.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Thanks for the detailed explanation. Makes sense.<br>
&gt; &gt; &gt; &gt; Maybe you can detail in v3 that this &quot;optimization=
&quot; consists of<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; work item not being scheduled.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yeah, removing this &quot;optimization&quot; would also be a=
 valid solution<br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; the problem.<br>
&gt; &gt; <br>
&gt; &gt; If you at AMD are willing to work on that that'd be definitely<br=
>
&gt; &gt; fine.<br>
&gt; &gt; Removing code is usually better than adding code.<br>
&gt; <br>
&gt; I fear I won't have time for that before my retirement :) <br>
<br>
You've got fresh, powerful folks like Lin! :)<br>
<br>
But either solution is fine. If you just want it fixed, we can merge<br>
the existing approach.<br>
<br>
&gt; <br>
&gt; &gt; Do you think being afraid of a performance regression is realisti=
c<br>
&gt; &gt; here, though?<br>
&gt; <br>
&gt; No, absolutely not. It was just a micro optimization done long ago.<br=
>
&gt; <br>
&gt; On the other hand with the scheduler code base I'm not sure of<br>
&gt; anything any more.<br>
<br>
&quot;In my subsystem you have to run as fast as you can just to remain at<=
br>
the same place&quot;, said the Red Queen to Alice.<br>
<br>
:)<br>
<br>
P.<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; P.<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I think that was the piece of the puzzle<br>
&gt; &gt; &gt; &gt; I was missing.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I / DRM tools will also include a link to this thread, =
so I<br>
&gt; &gt; &gt; &gt; think<br>
&gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; will then be sufficient.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Thx<br>
&gt; &gt; &gt; &gt; P.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; Lin<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; From:&nbsp;Philipp Stanner &lt;phasta@mailbox.org&=
gt;<br>
&gt; &gt; &gt; &gt; &gt; Sent:&nbsp;Tuesday, July 15, 2025 17:12<br>
&gt; &gt; &gt; &gt; &gt; To:&nbsp;cao, lin &lt;lin.cao@amd.com&gt;; Koenig,=
 Christian<br>
&gt; &gt; &gt; &gt; &gt; &lt;Christian.Koenig@amd.com&gt;;<br>
&gt; &gt; &gt; &gt; &gt; phasta@kernel.org&nbsp;&lt;phasta@kernel.org&gt;;<=
br>
&gt; &gt; &gt; &gt; &gt; dri-devel@lists.freedesktop.org&nbsp;&lt;<br>
&gt; &gt; &gt; &gt; &gt; dri-devel@lists.freedesktop.org&gt;<br>
&gt; &gt; &gt; &gt; &gt; Cc:&nbsp;Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.=
com&gt;; Deng, Emily<br>
&gt; &gt; &gt; &gt; &gt; &lt;Emily.Deng@amd.com&gt;; dakr@kernel.org&nbsp;&=
lt;dakr@kernel.org&gt;;<br>
&gt; &gt; &gt; &gt; &gt; matthew.brost@intel.com&nbsp;&lt;matthew.brost@int=
el.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; Subject:&nbsp;Re: [PATCH v2] drm/scheduler: Fix sc=
hed hang when<br>
&gt; &gt; &gt; &gt; &gt; killing app with dependent jobs<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On Tue, 2025-07-15 at 03:38 +0000, cao, lin wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; [AMD Official Use Only - AMD Internal Distrib=
ution Only]<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Hi Christian, Philipp,<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; I modified&nbsp;the commit msg, and I hope it=
 makes more&nbsp;sense:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; drm/sched: wake up scheduler when killing job=
s to prevent<br>
&gt; &gt; &gt; &gt; &gt; &gt; hang<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; nit:<br>
&gt; &gt; &gt; &gt; &gt; s/wake/Wake<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; When application A submits jobs (a1, a2, a3) =
and<br>
&gt; &gt; &gt; &gt; &gt; &gt; application B<br>
&gt; &gt; &gt; &gt; &gt; &gt; submits<br>
&gt; &gt; &gt; &gt; &gt; &gt; job b1 with a dependency on a2's scheduler fe=
nce, killing<br>
&gt; &gt; &gt; &gt; &gt; &gt; application A<br>
&gt; &gt; &gt; &gt; &gt; &gt; before run_job(a1) causes drm_sched_entity_ki=
ll_jobs_work()<br>
&gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; force<br>
&gt; &gt; &gt; &gt; &gt; &gt; signal all jobs sequentially. However, the op=
timization in<br>
&gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_add_dependency_cb() waits fo=
r the fence to<br>
&gt; &gt; &gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; &gt; scheduled<br>
&gt; &gt; &gt; &gt; &gt; &gt; by adding a callback (drm_sched_entity_clear_=
dep) instead<br>
&gt; &gt; &gt; &gt; &gt; &gt; of<br>
&gt; &gt; &gt; &gt; &gt; &gt; immediately<br>
&gt; &gt; &gt; &gt; &gt; &gt; waking up the scheduler. When A is killed bef=
ore its jobs<br>
&gt; &gt; &gt; &gt; &gt; &gt; can<br>
&gt; &gt; &gt; &gt; &gt; &gt; run, the<br>
&gt; &gt; &gt; &gt; &gt; &gt; callback gets triggered but drm_sched_entity_=
clear_dep()<br>
&gt; &gt; &gt; &gt; &gt; &gt; only<br>
&gt; &gt; &gt; &gt; &gt; &gt; clears the<br>
&gt; &gt; &gt; &gt; &gt; &gt; dependency without waking up the scheduler, c=
ausing the<br>
&gt; &gt; &gt; &gt; &gt; &gt; scheduler to enter<br>
&gt; &gt; &gt; &gt; &gt; &gt; sleep state and application B to hang.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; That now reads as if drm_sched_entity_clear_dep() =
is supposed<br>
&gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; wake<br>
&gt; &gt; &gt; &gt; &gt; up the scheduler. But you add the wakeup to a diff=
erent<br>
&gt; &gt; &gt; &gt; &gt; function<br>
&gt; &gt; &gt; &gt; &gt; (the<br>
&gt; &gt; &gt; &gt; &gt; work item).<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Also the code actually looks like that:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xa_erase(&amp;job-&gt;dependencies=
, index);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f &amp;&amp; !dma_fence_add_ca=
llback(f, &amp;job-<br>
&gt; &gt; &gt; &gt; &gt; &gt; finish_cb,<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_cb))<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_fence_put(f);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WO=
RK(&amp;job-&gt;work,<br>
&gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_work);<br>
&gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedul=
e_work(&amp;job-&gt;work);<br>
&gt; &gt; &gt; &gt; &gt; }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; So if adding that callback succeeds we.. return im=
mediately<br>
&gt; &gt; &gt; &gt; &gt; but<br>
&gt; &gt; &gt; &gt; &gt; we.. do<br>
&gt; &gt; &gt; &gt; &gt; that for the first dependency, not for all of them=
?<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Oh boy. That code base. We(tm) should look into pi=
mping that<br>
&gt; &gt; &gt; &gt; &gt; up.<br>
&gt; &gt; &gt; &gt; &gt; Also<br>
&gt; &gt; &gt; &gt; &gt; lacks documentation everywhere.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Anyways. If this solves a bug for you the patch lo=
oks fine<br>
&gt; &gt; &gt; &gt; &gt; (i.e.,<br>
&gt; &gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; &gt; potentially harmful) by me and if the tests succee=
d we can<br>
&gt; &gt; &gt; &gt; &gt; merge<br>
&gt; &gt; &gt; &gt; &gt; it.<br>
&gt; &gt; &gt; &gt; &gt; However, I'd feel better if you could clarify more=
 why that<br>
&gt; &gt; &gt; &gt; &gt; function is<br>
&gt; &gt; &gt; &gt; &gt; the right place to solve the bug.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; P.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Add drm_sched_wakeup() in entity_kill_job_wor=
k() to prevent<br>
&gt; &gt; &gt; &gt; &gt; &gt; scheduler<br>
&gt; &gt; &gt; &gt; &gt; &gt; sleep and subsequent application hangs.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; &gt; &gt; &gt; - Move drm_sched_wakeup() to after<br>
&gt; &gt; &gt; &gt; &gt; &gt; drm_sched_fence_scheduled()<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt; &gt; Lin<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; From: Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Sent: Monday, July 14, 2025 21:39<br>
&gt; &gt; &gt; &gt; &gt; &gt; To: phasta@kernel.org&nbsp;&lt;phasta@kernel.=
org&gt;; cao, lin<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;lin.cao@amd.com&gt;;<br>
&gt; &gt; &gt; &gt; &gt; &gt; dri-devel@lists.freedesktop.org&nbsp;&lt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; dri-devel@lists.freedesktop.org<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Cc: Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.=
com&gt;; Deng, Emily<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;Emily.Deng@amd.com&gt;; dakr@kernel.org&n=
bsp;&lt;dakr@kernel.org&gt;;<br>
&gt; &gt; &gt; &gt; &gt; &gt; matthew.brost@intel.com&nbsp;&lt;matthew.bros=
t@intel.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Subject: Re: [PATCH v2] drm/scheduler: Fix sc=
hed hang when<br>
&gt; &gt; &gt; &gt; &gt; &gt; killing app with dependent jobs<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &nbsp;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; On 14.07.25 15:27, Philipp Stanner wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, 2025-07-14 at 15:08 +0200, Chris=
tian K=F6nig wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On 14.07.25 14:46, Philipp Stanner =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; regarding the patch subject: t=
he prefix we use for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; scheduler<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; is:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm/sched:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, 2025-07-14 at 14:23 +0=
800, Lin.Cao wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; When Application A submit=
s jobs (a1, a2, a3) and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; application B<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; submits<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; s/Application/application<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; job b1 with a dependency =
on a2's scheduler fence,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; killing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; application A<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; before run_job(a1) causes=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_job=
s_work() to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; force<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; signal all jobs sequentia=
lly. However, due to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; missing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; work_run_job or<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; work_free_job<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; You probably mean &quot;due to=
 the work items work_run_job<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; work_free_job<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; not being started [=85]&quot;.=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; However, the call you add, drm=
_sched_wakeup(),<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; immediately only<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; triggers work_run_job. It's no=
t clear to me why you<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; mention<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; work_free_job, because<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_wor=
k()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; directly<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; invokes the free_job() callbac=
k.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Yeah the description is rather conf=
using, took me more<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; than<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; one try<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to understand what's going on here =
as well. Let me try<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; explain it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; in my words:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; When an application A is killed the=
 pending submissions<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; from it are<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; not executed, but rather torn down =
by<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_work().<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; If now a submission from applicatio=
n B depends on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; something<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; application A wanted to do on the s=
ame scheduler<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; instance<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; function drm_sched_entity_add_depen=
dency_cb() would<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; have<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; optimized<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; this dependency and assumed that th=
e scheduler work<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; would<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; already run<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and try to pick a job.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; But that isn't the case when the su=
bmissions from<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; application A are<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; all killed. So make sure to start t=
he scheduler work<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; from<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_jobs_work() t=
o handle that case.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Alright, so the bug then depends on B se=
tting a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; dependency on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; A _after_<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; A was killed, doesn't it? Because the op=
timization in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; _add_dependency_cb() can only have an ef=
fect after A's<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; jobs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; have been<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; torn down.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; No, application A and application B submit ri=
ght behind<br>
&gt; &gt; &gt; &gt; &gt; &gt; each<br>
&gt; &gt; &gt; &gt; &gt; &gt; other. Application A is then killed later on.=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; The optimization in _add_dependency_cb() just=
 waits for As<br>
&gt; &gt; &gt; &gt; &gt; &gt; submission to be handled by the scheduler, bu=
t that never<br>
&gt; &gt; &gt; &gt; &gt; &gt; happens because it was killed.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; If there is such a timing order problem,=
 the commit<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; message<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; should<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; mention it.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; The commit message definitely also needs=
 to mention this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; optimization<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; in drm_sched_entity_add_dependency_cb() =
since it's<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; essential<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; understanding the bug.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; +1<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Danke<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; P.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Christian.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;in entity_kill_job_=
work(), the scheduler enters<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; sleep<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; state, causing applicatio=
n B hang.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; So the issue is that if a1 nev=
er ran, the scheduler<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; will<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; continue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; with the jobs of application B=
, correct?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Add drm_sched_wakeup() wh=
en entity_kill_job_work()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; preventing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; s/to preventing/to prevent<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; scheduler sleep and subse=
quent application hangs.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; - Move drm_sched_wakeup()=
 to after<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_fence_scheduled=
()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Changelogs are cool and useful=
, but move them below<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; area<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; with another --- please, like =
so:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off by: =85<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; v2:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; =85<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drivers/gpu/drm/scheduler/sche=
d_entity.c | 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Lin.Cao &l=
t;lincao12@amd.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; This fixes a bug. Even a racy =
bug, it seems. So we<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; need a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Fixes tag<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; put the stable kernel in CC.<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Please figure out with git bla=
me, git log and git tag<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; contains<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; which<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; commit your patch fixes and wh=
ich is the oldest<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; contains<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the bug. Then add a Fixes: tag=
 and Cc: the stable<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; kernel.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; You'll<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; find<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; lots of examples for that in g=
it log.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Thx<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; P.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;drivers/gpu/drm/sch=
eduler/sched_entity.c | 1 +<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;1 file changed, 1 i=
nsertion(+)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; diff --git<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; a/drivers/gpu/drm/schedul=
er/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/schedul=
er/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; index e671aa241720..66f2a=
43c58fd 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/sch=
eduler/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/sch=
eduler/sched_entity.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; @@ -177,6 +177,7 @@ stati=
c void<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; drm_sched_entity_kill_job=
s_work(struct work_struct<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; *wrk)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; struct drm_s=
ched_job *job =3D container_of(wrk,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; typeof(*job), work);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; drm_sched_fe=
nce_scheduled(job-&gt;s_fence, NULL);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; drm_sched_wakeup(=
job-&gt;sched);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; drm_sched_fe=
nce_finished(job-&gt;s_fence, -ESRCH);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; WARN_ON(job-=
&gt;s_fence-&gt;parent);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &nbsp;&nbsp; job-&gt;sche=
d-&gt;ops-&gt;free_job(job);<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH0PR12MB5497CB304AAF06731C6D7F93F557APH0PR12MB5497namp_--
