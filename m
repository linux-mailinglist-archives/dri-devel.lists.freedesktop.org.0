Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CEBD1C55
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4178910E3DA;
	Mon, 13 Oct 2025 07:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PxUXaKuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D9D10E3D7;
 Mon, 13 Oct 2025 07:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XthXewa5Mb4BNHlPP2u8zoJp7B4dPTCBHWm7sfSLwcsh4//zEooYh1B2OUTo0CWTMnAHhTn41OeRwvryB8AcKywr63hDlCf0E0ov/JlTaA1lCCjXSRU13bFFU/yhQT0B0spnO1IkXGIP7UX4exaYCX6o0RRRZigXJ3X5bEJHYiXf5/jN9A6Sv0BA2WzAVu27tj7YkufjNcC82TWddH4yFTccPa/lUDwSs9D8fy/shAdA+X4ObgOFBtT+mYui0SSpSxcWTwd2QFu4euHucofS2MneL0jc1ZMRd37YhS6v9xwAyJQgE6TgQadPK0+2OYla5Uujb4jwrpaFWIVt3+If2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqdvYXc6MpCVlwQ9wHgT0/dRf5ieVGsoDy1m8NtqMgg=;
 b=vRsE/lcIhbEQT+mN34mgpQIzwc3KC2DatzhBPd4+lVYoK5fH+avmh7w+iw7NakhihaXHthaG/X9mbhlL/qeskrJoymWiDmaJkm83w2PROGS8jUhkqr5z3ELyjVLSz/6HWsl+26mmggX0djaMStwNzw17eIcynEKQYIuvGUzBWzSCew2GYXTXQ+26lDRBgP58i9NRV3SU/PTzHb1WU8WuXRwEydoeJsE6o9Y/iMtH0Yl1bqwBupMUnRnByNNLku66oKbjFBt1m6/VZEUXyYkQu52ZoT5IjnSOuZvQ8q4e3HMdiLRZIdjWSUegzdh7YqwQ0H7jOs/+7V1zs1UbBIuwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqdvYXc6MpCVlwQ9wHgT0/dRf5ieVGsoDy1m8NtqMgg=;
 b=PxUXaKuGpvPulKlSNBbRBaIh34CeXAtgyQfH0Bt2N8nuzVYeTnasuNDoZRZztdYW06jCsXBbnfaPopAQ3yjLfxJtzHOJ3nuHMygGVyW2bzumSfif+gKXkmev5zltm/t7U6yKwZ3AGbAW5H6SmyX+s/svvItnV3+Pe4iTOXe7CVA=
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 07:23:53 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:23:53 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
Subject: RE: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Topic: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Index: AQHcO+SLFAIsRElsD0GxxdHIaHUhKLS/fagwgAAWZgCAABQrwIAABE3w
Date: Mon, 13 Oct 2025 07:23:53 +0000
Message-ID: <DS0PR12MB7804DA51F5FBEF49C82E4E3897EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
References: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
 <DS0PR12MB780437771222808EBEB675D797EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
 <DM4PR12MB515282926AA157011BF319C5E3EAA@DM4PR12MB5152.namprd12.prod.outlook.com>
 <DS0PR12MB780447BC946BAB3EBD54B7CC97EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
In-Reply-To: <DS0PR12MB780447BC946BAB3EBD54B7CC97EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-13T07:22:47.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7804:EE_|SA0PR12MB7002:EE_
x-ms-office365-filtering-correlation-id: 9316d976-6702-4cc2-2804-08de0a297687
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?u1VHSthjphIJTTCmIPyRHAoALmAtkNeFtCbErDBQIghx2JSxuYYqnO6k+w8c?=
 =?us-ascii?Q?r/tWvxH7fekIfnh+feyJA/Vo6NZTf4m+HTGBCD2UZ2vwMpdUqEccIlzi+/WC?=
 =?us-ascii?Q?OoaZNDuy9KM2NIdnpP8B752UVv7iaEHtPAF1jCRaVOpaw0/sYo/W3j0VX5e0?=
 =?us-ascii?Q?cEn/b9n2yex6Sbo25sHYKUZL6W72Z0jET761rfewMEgDda7Kj9Ypz91kQCBc?=
 =?us-ascii?Q?uMAYs+EWg0aO6OUXm/TgCP1J47qhLm3+hUOmqC4m9XHtHIasJjMnB49UysDs?=
 =?us-ascii?Q?gDNdNyc6/Oj81nZYI1A7A8lhHS//P8ufwBTTMmJmYc5aDsysWiqjUXDH+m/y?=
 =?us-ascii?Q?lYLiocsSiKphambcS0nci6uZ9qYnVHLsbtenDP4ln4/IoOo2/M/CDtRgaPV3?=
 =?us-ascii?Q?X1pokRghjmdJps7zJthY6UkWJZrEgHcZLYzSy8WXN7UNb48/6Kpgp+EFZWNq?=
 =?us-ascii?Q?gNkyfIimjnZb6K5DtPW99cWHTO92kmEin//5eouu4DA1rGqD8QHVYXPNw5Ue?=
 =?us-ascii?Q?TvH15RmUmcbPuLBTwxOLl37lzq4q9H9quWrkkAhk3zqS/1pD30i7io8yzmYd?=
 =?us-ascii?Q?3BJUi0SmSg75hvo+UQAYRpJ6FrzvoH+EbY/GPrWylHOEr2wvhTE1WczIh+zV?=
 =?us-ascii?Q?GQHOdTl3pLzc09xdMHfVQj6ajWOB08M3gw4Lc5QVW98y7rNuSddFQPWMRdpX?=
 =?us-ascii?Q?CftqxbvqJ6OxRaI7CX5RBXxH23z0Zj1baOPBU6szs197hdycshLSKXRYdZtL?=
 =?us-ascii?Q?ARL0QV8gMSM5g/f4n3thLXYNF+pEue5Jj7Repf6XMb5pwGTSDQr0PQ8yNzVB?=
 =?us-ascii?Q?7cV11dR23Id5sBr2pMU1aqdEdk4QuqHvHAmgw+5EN/QmbccH3kYLwYru2F/e?=
 =?us-ascii?Q?CY688wFYdbJtPBIDI8xVSQWoIraV+lPFvGyC1EEDDY9v8qptUiSfLPEVToMo?=
 =?us-ascii?Q?LAYru7UfKcisSZtNIr2UtoM3ABufAYsbj7C1stVBvxyGhaubDMzRXgAFUEs5?=
 =?us-ascii?Q?AOeK2RVcHynMaRPCZukucP0CvRiHxYdtqCxwMYV5qJLUcr++6t5GwhyHvdXU?=
 =?us-ascii?Q?WfTpKXVcs+HGaGWB4foLncDHRoFgy5eZ73pmWLRIaaPgzdKs+jou8+9zS9Uk?=
 =?us-ascii?Q?2GTV2saxpVyeiiiteX4PccPnte4S8ZnrQeqQivBrIfOTPy7w/fZeTSJV4zCq?=
 =?us-ascii?Q?/uPbjFOJJ71ILl6sln6nyU7EnCUH9BIiKbvh+s9FrU1Yc6bZTIkmnbsWtOcM?=
 =?us-ascii?Q?qQ+xCDz/13IPZQOZqMCDvOmir1erJ+z+sz5c3n9kUnAGr+YyR6cZSYfd1HD4?=
 =?us-ascii?Q?evTOdN2Sq0RKxOwuif8QUwne0ET+Y67ZZCK86VzgNQoGd7mR8/UmURwa8sbP?=
 =?us-ascii?Q?w+sYVJpij0I0kFMjv/MNn2C7hznJR1NKjFHk9aqqCaB9McwVfshTvgnqq9Ku?=
 =?us-ascii?Q?z5xE93WWTuj897OBdExWDguCw7EaayDoLjlEKZ89tNlplEY29G7CP25izbu2?=
 =?us-ascii?Q?sq3gHL3Wt7+jIW+1Y1MCnGN7yp22WPY4rUyc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UOOihxFe0BphbDyPhINsBK/na44NjlZkHXZp7DCEqETfRaxaXyW7YfUID8Ty?=
 =?us-ascii?Q?dThq5S5yxsdFuvfBmA94eTW/o1fiGWE0EyPcOYMqjalxc1QpxFGC0XW4i3M8?=
 =?us-ascii?Q?Ph01sNYGIz2CaH6BozyXTnJCRJjvX2ddz11mgfTZXopb4hKW0thsrBQs/64Y?=
 =?us-ascii?Q?hK/wQWjaLaOtg2egbSNSQ4kb22uZ4JDZeFFXchfxJpngx5Aftaa2DTPu39pw?=
 =?us-ascii?Q?maN7ZAPcSPis7Gklynu2MsYYbFsAnuMWH8w+HkejNrG+oQAc/G8+LD57XHDj?=
 =?us-ascii?Q?zzDZGwNqdFTxgOl/eqH96bUzX53q7dBZ0tmxH2rI1Mz88VIZE1aNL5qdZjli?=
 =?us-ascii?Q?UH7RFjaYH3vVQT76wBumpRHhavojZLSohvO0sLb3VXxTBsgFrYdj48R5aNx3?=
 =?us-ascii?Q?pQ/M+xhwEqxQNRInmrJCiUDlJ7+ZrN6GuvunPi40RLorUUvB7mHj/p0BeXuP?=
 =?us-ascii?Q?u0m2QVtz1O3HMbowjoTYLgJ19T2UXR70WanuqwbODCBoajwIVgBjssRQc8IH?=
 =?us-ascii?Q?aEoA4OALHzy6ZYZHCb9TtPgfbMfVMW6V8sdeP6Rrq26KGccu204JKMnQ4x6I?=
 =?us-ascii?Q?Hn2ZTed08Rcc1RrCZyUuDzfnGlgtCZJgACJRXTY23vyUE07izYza286kpcb1?=
 =?us-ascii?Q?Ay0q+gVfHaEvSHazXWPmQBWwCiqeisxjbe+i22hIU53GnFDPXBEbTKccWvgz?=
 =?us-ascii?Q?IIyrSWOFLo+orpqYNE0WLKlIRvGbmp3k1bjFVOlcLUf3IwQbaG25pSr0K/tK?=
 =?us-ascii?Q?n7jc3rEGoAgSaE+XdZ8+iwXntf+7B16lHNwphdF3cuoWcr3ayhSoPlOt96BL?=
 =?us-ascii?Q?lUzvUPJmG2O+w8CFFUdnGqtexUsEkD2YDgx69pO+NUCyLFEqZYD6ePhTB+B0?=
 =?us-ascii?Q?umzR6Gz/76/ZbhW5RaeZcFEfQLx/zPUY7gfZAbfIlHEJpBggumZUDOTPCoxq?=
 =?us-ascii?Q?0sgAkMQBAwPwMUpMJloiGYB8zhEr61SFiihFAefp43LJYU68nJdkM5jAPkh5?=
 =?us-ascii?Q?kMR4EJmB0TsvJ4f1ozGoIJ+rzz6TBS/liXenVicWbdcl3PSOF8f4Pg34oIdO?=
 =?us-ascii?Q?q1Y1TZzl39QvMh51Mt1uN3rCIb/pR5M9RUHwV60hpTT59blrObHCRYyTC5/d?=
 =?us-ascii?Q?pnX+lhTJp26kQkdaqB1Kx7dxxqV3C9+fW0dFrOjBU233juzl005ddOb9ze5J?=
 =?us-ascii?Q?45jJxqk6zWbuZadzVe55Jby/e5VL7lFkCv6b1rw15w0LbcKTqw6/8zoQvEMX?=
 =?us-ascii?Q?E8PJEmeyQmQNyjr5wRx8Qe4Fp4sBh+tJT0SUcayy3BJ8Bdd2fP47reQHnf30?=
 =?us-ascii?Q?prJe3gmxHw17MVs29kbr84cuO7oO/PGN+JBlxYodDEKgo4sA19ufKsDYuCv7?=
 =?us-ascii?Q?/IPDJgMkFTuqg0khXZhT8Nj+WH+E4vXIxFI9+mguzRiDm9kLW3aGCkDBB/wb?=
 =?us-ascii?Q?3Ei93YqaRvblUYbFWVZluCB67HiTKwDT2JMapqbf9PWNGl2rDlvr7ptNXFXF?=
 =?us-ascii?Q?9mLdTY3FWJITMa4/C9cu50pX8L3dROD3bZ96iAmaafCkiCMXWaz8xnyzo92M?=
 =?us-ascii?Q?2vMJh9grOl/G7rcN0l8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9316d976-6702-4cc2-2804-08de0a297687
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 07:23:53.1328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ClXikAv57Exd/3ir7dwxZeiCv9k7KD573rhdWGFlYJxkS8VEmD7p3Ecn61EJRgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
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

>-----Original Message-----
>From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Lazar,
>Lijo
>Sent: Monday, October 13, 2025 12:39 PM
>To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; amd-
>gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
><Christian.Koenig@amd.com>; Yang, Philip <Philip.Yang@amd.com>
>Subject: RE: [PATCH] drm/ttm: Add NULL check in
>ttm_resource_manager_usage
>
>[AMD Official Use Only - AMD Internal Distribution Only]
>
>>-----Original Message-----
>>From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>>Sent: Monday, October 13, 2025 11:25 AM
>>To: Lazar, Lijo <Lijo.Lazar@amd.com>; amd-gfx@lists.freedesktop.org;
>>dri- devel@lists.freedesktop.org
>>Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>><Christian.Koenig@amd.com>; Yang, Philip <Philip.Yang@amd.com>
>>Subject: RE: [PATCH] drm/ttm: Add NULL check in
>>ttm_resource_manager_usage
>>
>>[AMD Official Use Only - AMD Internal Distribution Only]
>>
>>> -----Original Message-----
>>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>>> Sent: Monday, October 13, 2025 12:37 PM
>>> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>>> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>>> Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
>>> <Jesse.Zhang@amd.com>
>>> Subject: RE: [PATCH] drm/ttm: Add NULL check in
>>> ttm_resource_manager_usage
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> The specific issue of trace with amdgpu_mem_info_vram_used_show
>>> should be fixed with this one - "drm/amdgpu: hide VRAM sysfs
>>> attributes on GPUs without VRAM"
>>Thanks @Lazar, Lijo,  maybe we still can use this patch to fix  this
>>crash when calling  AMDGPU_CS and  query AMDGPU_INFO_VRAM_USAGE.
>>or add check like the previous patch.
>>
>[lijo]
>
>Agree, there are indeed multiple places of ttm_resource_manager_usage call=
.
>You may follow the same check as in the hide VRAM patch -
>ttm_resource_manager_used - in case ttm doesn't take this change.
>

On a second look,

struct amdgpu_vram_mgr {
        struct ttm_resource_manager manager;

Hence this won't work for something like this -

        case AMDGPU_INFO_VRAM_USAGE:
                ui64 =3D ttm_resource_manager_usage(&adev->mman.vram_mgr.ma=
nager);

Thanks,
Lijo

>Thanks,
>Lijo
>
>>Regards
>>Jesse
>>
>>[  911.954646] BUG: kernel NULL pointer dereference, address:
>>00000000000008f8 [  911.962437]
>>#PF: supervisor write access in kernel mode [  912.007045] RIP:
>>0010:_raw_spin_lock+0x1e/0x40  [  912.105151]
>>amdttm_resource_manager_usage+0x1f/0x40
>> [amdttm] [  912.111579]  amdgpu_cs_parser_bos.isra.0+0x543/0x800
>>[amdgpu]
>>
>>>
>>> Thanks,
>>> Lijo
>>> >-----Original Message-----
>>> >From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> >Jesse.Zhang
>>> >Sent: Monday, October 13, 2025 7:25 AM
>>> >To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> >Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
>>> >Christian <Christian.Koenig@amd.com>; Zhang, Jesse(Jie)
>>> ><Jesse.Zhang@amd.com>; Yang, Philip <Philip.Yang@amd.com>; Zhang,
>>> >Jesse(Jie) <Jesse.Zhang@amd.com>
>>> >Subject: [PATCH] drm/ttm: Add NULL check in
>>> >ttm_resource_manager_usage
>>> >
>>> >Add a NULL pointer check in ttm_resource_manager_usage() to prevent
>>> >kernel NULL pointer dereferences when the function is called with an
>>> >uninitialized resource manager.
>>> >
>>> >This fixes a kernel OOPS observed on APU devices where the VRAM
>>> >resource manager is not fully initialized, but various sysfs and
>>> >debug interfaces still attempt to query VRAM usage statistics.
>>> >
>>> >The crash backtrace showed:
>>> >    BUG: kernel NULL pointer dereference, address: 00000000000008f8
>>> >    Call Trace:
>>> >     amdttm_resource_manager_usage+0x1f/0x40 [amdttm]
>>> >     amdgpu_mem_info_vram_used_show+0x1e/0x40 [amdgpu]
>>> >     dev_attr_show+0x1d/0x40
>>> >     kernfs_seq_show+0x27/0x30
>>> >
>>> >By returning 0 for NULL managers, we allow callers to safely query
>>> >usage information even when the underlying resource manager is not
>>> >available, which is the expected behavior for devices without
>>> >dedicated VRAM like
>>> APUs.
>>> >
>>> >Suggested-by: Philip Yang <Philip.Yang@amd.com>
>>> >Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>>> >---
>>> > drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
>>> > 1 file changed, 3 insertions(+)
>>> >
>>> >diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>> >b/drivers/gpu/drm/ttm/ttm_resource.c
>>> >index e2c82ad07eb4..e4d45f75e40a 100644
>>> >--- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> >+++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> >@@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct
>>> >ttm_resource_manager *man)  {
>>> >       uint64_t usage;
>>> >
>>> >+      if (!man)
>>> >+              return 0;
>>> >+
>>> >       spin_lock(&man->bdev->lru_lock);
>>> >       usage =3D man->usage;
>>> >       spin_unlock(&man->bdev->lru_lock);
>>> >--
>>> >2.49.0
>>>
>>

