Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F311DBD1BD9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DCA10E02E;
	Mon, 13 Oct 2025 07:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AyVoETwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182810E02E;
 Mon, 13 Oct 2025 07:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vpt6tqpPO3H7i5Kg+p8AUmsML4UtrMcpGp1aFClCCKG+VqNkOiPlUSAzPbWCCYzm0O/6tY8abAnCrlCBP84YKN3ka6c62RkiQviOk96qZVMwfHurg0DzxgoB+IgWWuXz0Ft5+ax/R9Kmuni8o+Y0bLBj2GLjNK+C5sdk28eTTu0WtkqtVIQ6RAQdJ+jOC5c79bBjZuYDtwKJWQSWWhMF6Ojt9Fm2O6wC43QQ3NN93U6xEEiqfQm9KfxOUhT4/ov1HpCcmBmsdLnXh2tThMr66rURAojR8b2Bi5Avl3Y1kv5b9xM9jvA44qmdrtOvPj+SQQHsQ0+nNEmx6UvSlYncdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3q3b2dkkVzOkzdSznIDb13hvyQ2ErM0aFnEEguvJys=;
 b=teYmSVA2zM6gS3LV6rfxlE5SmOM+MFC+Mr8J4DsLEnqBP0mHXURd/BH0TvaNyG75MgxfZd5rz1r4kakrNezxAmX04UW/M3A8VO6fX0T8e2LqEwjES6a0g2r9MsSpImsOiKW9g1/uMY99S9Y1LEuQR0WhqUXOMPPjOimxUPNzSpcubgWKq/FwJoKnQQqN0JJw8JH53DDMxbJZfMSZt2dcdrdzH1cW2khPpZN9A11C3SrnHX0JDFPFNU9FUqrDc5uVSBINZPACwYyWsGi3aT4Mfs45HPM6hhO0XBNnBoZ6XcyWeUlOv9VdIpstDXyO2MSejVRG5B0CvKpg1b9qSJIKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3q3b2dkkVzOkzdSznIDb13hvyQ2ErM0aFnEEguvJys=;
 b=AyVoETwh7bqmnB64kgF9ggE8LFIMhUZv9PfH6/p0fmldZ8c33Pp8hIZNj2yeOcDMQftXWq6VswjhLCDxsTQIZ+zhLKe9hzmfS6QzLR1Hr2OjgP7U1arGHbOJCVeNdcK0rMcWtW5LSA6TV8iHy7IQJXlQUaZde3ZUqCug8txD0K0=
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 07:09:27 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::e71b:4ec9:237f:24ea%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:09:27 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
Subject: RE: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Topic: [PATCH] drm/ttm: Add NULL check in ttm_resource_manager_usage
Thread-Index: AQHcO+SLFAIsRElsD0GxxdHIaHUhKLS/fagwgAAWZgCAABQrwA==
Date: Mon, 13 Oct 2025 07:09:26 +0000
Message-ID: <DS0PR12MB780447BC946BAB3EBD54B7CC97EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
References: <20251013015550.1317222-1-Jesse.Zhang@amd.com>
 <DS0PR12MB780437771222808EBEB675D797EAA@DS0PR12MB7804.namprd12.prod.outlook.com>
 <DM4PR12MB515282926AA157011BF319C5E3EAA@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB515282926AA157011BF319C5E3EAA@DM4PR12MB5152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-10-13T04:34:54.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB7804:EE_|DM6PR12MB4107:EE_
x-ms-office365-filtering-correlation-id: dfa49e23-a1e9-49ff-ac51-08de0a27723c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/WucG1XNIgvQmOSvF/kCKNl4hBnrUPtwhvxqPs6O6TceEshQUr1oeAKCzZju?=
 =?us-ascii?Q?isM0r2QP9SzP+6zb8pNp+oJ3Wf4PLLanzrQJIdcx1NQ+/A/pgVkVCd9eJwpK?=
 =?us-ascii?Q?B9ZSU7Xc862B5ohB3i8tNYcKfeW9afwTE/KhyMK2qYzU5tpFlSgUiWLzs8B0?=
 =?us-ascii?Q?kX235ShJ8hsgWr5qAMfyZB/bYpBqxsdDwzjhIcFboNWnMfeH24tCiw0lao+q?=
 =?us-ascii?Q?vXUZ2bmKDeFJoGpIhKbKmBrdFk3ZDqbnM2dwC5//N4OIC2r8NjRfgIftyezw?=
 =?us-ascii?Q?dTz8OMa73l8yrpfhnvBcA82IB7poGwdLIX3O7hBjCIKIZ4ex6BTnZDbyvFED?=
 =?us-ascii?Q?kDOa79q+eta3Vn8A/8r5uomnUmzbvrb+iMAL50k18QKJTzy17CbYehmG505v?=
 =?us-ascii?Q?0QSv0X60E6A4d6rwjhofb7XH8ApobLH3zMT4i8X4o+JTejl7474GXTqZbNer?=
 =?us-ascii?Q?x9FH3xG+Ys9pgn6vZB5uvqs2nyHhTlvo0jziSMN+4wIEAEkBMrt2CntLZs5A?=
 =?us-ascii?Q?EwZnauaitRQUV+hHuPdfq8i7Co4YiRWzX1Fsz5FlNRUCmoYFQD0CJRp4ZXiV?=
 =?us-ascii?Q?LS+nq9mXtSjEvGxHGoCIaEC4qRO5Sv/vdhxapsIDvN/GVHNu6dwQTJ6Nz/10?=
 =?us-ascii?Q?B1UE0/DNsmfm90ZP2pgQfHIiCplRDeJN3PZzCPN+6OnKNTSTor0hmWtSt14i?=
 =?us-ascii?Q?worJezNGqXE5JO62iiBRPMZPstv1Ok1kJ2EPW1ZUDy4h7Nbu7yA1yuugTOEy?=
 =?us-ascii?Q?3k7IvtaXFOfIal5pTzrLq1hOVxLKoTZVKvxNMBegIn7/I/rhNJ6HYuMB1i/N?=
 =?us-ascii?Q?DyQoZJUNvAaho0dJxhe2B2a+lnvLIxpozgWJ84AomzYDZDBcL1maUUuC9oGH?=
 =?us-ascii?Q?xsSyVpK0SdkKnCttpJ5M9kAFD06K5E1jgkUmVdITODC1frs1x/6rSqPbNhUV?=
 =?us-ascii?Q?0+3LI0hYiBnIUrIPjnXX5mSNUtr1qjJu8h7QzAhEh9hPsP/ufeWWaXDJTCrF?=
 =?us-ascii?Q?5zyRqmT6aQm2xjD92ytmyPSY+OxXYiSlvhOoxZ9aEizyLB3PYfxvR5UahFlQ?=
 =?us-ascii?Q?vbCFp2WJxKVA949pB4MhV7NBcRgD33QME3csBqCkYrW2jibE/+pSmultw+F6?=
 =?us-ascii?Q?XV6Eksl3jdO4rhl++++WZ5qFSM6CduWm2jjXIQp5ZgzVtrdU+cl0E/m8kARZ?=
 =?us-ascii?Q?GZBPdTR2AfuuJaT6T/K3BnavDQ2rZ/6jq+SFCCt//RLBvEpBpQFLFJPC7mAs?=
 =?us-ascii?Q?62gV4+uO6004oRwkTYTq0d2NeYdC1mOePTr2xVNgneEaXuyOtolDoAV+hP4C?=
 =?us-ascii?Q?i0v2M95aOOF5rCcQiKpKZraDiioq7xeTK5EHe1Vz+whcuC+EyJGabL1PhGVb?=
 =?us-ascii?Q?xq+KJFTYSEMQ4Zq3Lm9Z6BIzHnGwPycvgGQrZdA9kDn/25PkBKFDrNgdCWnh?=
 =?us-ascii?Q?FbiKyaUCM9s0kE62f/PK+WYL0i0zwcjpgWOUmuuiqqZhq8Vbgl4zSEU0750d?=
 =?us-ascii?Q?XbryPq5bH+ZPrpri1PzEwhUmZ3R3mMNdrTvn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kmhOPZIfcIge/0txBaRujHgsUdnnb63qYhfP+NDdW/Xf/WmJ/0BloFsObu9k?=
 =?us-ascii?Q?va+KI+Le/OC5jz0xGAegpNNgmTlCzc12/HBmPRD0fuM7X5by2qRJs61Gb+Ma?=
 =?us-ascii?Q?rzS6C6DhSf8N+OXrqfZG44SkFOORcTeQTuozJ/qr7txWKcqqCgENlN82pbGs?=
 =?us-ascii?Q?hX63q6JKoaE6SGNBs1VsafPG40zZkr1T1h9uFFWRSb63gec10itFE0R9K3vi?=
 =?us-ascii?Q?xq8dYETOVq4Cg4bC8VmAL8XXU2glvUHPmQEXEhCYIEFBctr8dcfx6427Mu1u?=
 =?us-ascii?Q?onynJjt3IgC3Jzuzxequqm3Hwm62DsBdYDYCZG5rRt95NAABxjymYhGRdcFX?=
 =?us-ascii?Q?yIkRyt6+piHe/6mECMmDZErsUi1V4wyhtiderCpO5ffwjxxS9IV/oBmswPNs?=
 =?us-ascii?Q?CthRqSGPROqoeNEhz4SUFu7EkUZHoi8acfb+8lquz7becUY9tUgVGPA/lGv3?=
 =?us-ascii?Q?OowU5QKHRWCmOgnAEXxNfXKwykC+++zNwc4vqaUfxuMzzg4nrxgjB7MOJ+oD?=
 =?us-ascii?Q?PHwIRfrX/23H5kamOhKPOx2j1ShypYplp547MmaRlFp2xBWuaQtQ6tRIp3Up?=
 =?us-ascii?Q?R/XKVMXN4I0jPFqoxCve7ab7uo18/5VfUkvoOuIU7WyBCt/j2PjJv1bA66UB?=
 =?us-ascii?Q?fj4HtO2ou/fTsb3uDkLVaBoqIBx61n3xDCVE5fFfAt8ozdEE6AIJ1/+T0VWw?=
 =?us-ascii?Q?ejwtU4bnJ/F5gcK9D4VdAb01H7dU/VWtRCPUiR1ZipkJJkTSIgBm7I0miFkW?=
 =?us-ascii?Q?7vf5lGkzz1+Mwx4sA6Dhg2e2CDC+fKAgOQUbPB1uyMEEJ14CHmT4dkDyAShw?=
 =?us-ascii?Q?Yev1sR0HlGU2i2dODfO0XGNCxmil7AAgc6iMSU79WaotSq1P14RN2ig04Y6w?=
 =?us-ascii?Q?GVuc24pWBTyf0+gmfSCMUSCxpwVuG+o5AHUfFExZmOz6wSMMfHM6DZDOrzJn?=
 =?us-ascii?Q?4HLC3L0licQmbcJc6FnlSpQee62cpb0AG3jcmtfUdrzZOhEDzUTG2tSJlIuj?=
 =?us-ascii?Q?JsB5fx+xK/JqhDreIBHHE8i8hKE6+PYz8U9BswKoou2kd/wniP0bLJ9x7WCo?=
 =?us-ascii?Q?uGxOEmd76WPebCkU9okFVCRtm2UGRjOl/8ja7GZ1Rj5pWG1r4osTyrvX3aB0?=
 =?us-ascii?Q?rNK/8MXBK99yB3kgOm2OpZjemhDr4Q5D+/uHe6FX7pH/OVEeQ3RFs4BDmkMS?=
 =?us-ascii?Q?ZRTRj8ySYl/Jdp9JS5KEvuqhdr1oCfCvPKHIVCfaFSBRWQ4k/MQzjadffknl?=
 =?us-ascii?Q?K2b+MOfT3EXP3xPMlTs67lkyWeGurcaDqED2m8BMhKF57wDCVkGwEwv4WdG2?=
 =?us-ascii?Q?91bPGfz1hbqXSz5kROxEdl/f6lU7npIvRv2t8dzGyMgSFSXvfBKBIHKrc5zh?=
 =?us-ascii?Q?7SSvGn5iohuqWCfZT8YHulpeB6gUrboH0qi7wXd0vhI3IfSWbYRZ8NZ5GGpK?=
 =?us-ascii?Q?necu7jH+DtwtD2lfGlPn7QENxjhUkU4yLCGwPB/RBsEAqf2E1mDZP4J/lYo4?=
 =?us-ascii?Q?HMCVZFSrZvje8qAhD47s/7M2dzz6ArhsB5GlkcYhICbQDyGmvCFsNPV+RhFy?=
 =?us-ascii?Q?3oxKGORKMR/u4QFN4rU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa49e23-a1e9-49ff-ac51-08de0a27723c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 07:09:26.9623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+pA8vEeAcJfqpzSFQsBWfPs2kShY7Z/pQgn6vi0SwzApinCgCG6/rZyAk0FS0Vo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107
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

>-----Original Message-----
>From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>Sent: Monday, October 13, 2025 11:25 AM
>To: Lazar, Lijo <Lijo.Lazar@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org
>Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
><Christian.Koenig@amd.com>; Yang, Philip <Philip.Yang@amd.com>
>Subject: RE: [PATCH] drm/ttm: Add NULL check in
>ttm_resource_manager_usage
>
>[AMD Official Use Only - AMD Internal Distribution Only]
>
>> -----Original Message-----
>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>> Sent: Monday, October 13, 2025 12:37 PM
>> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>> Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
>> <Jesse.Zhang@amd.com>
>> Subject: RE: [PATCH] drm/ttm: Add NULL check in
>> ttm_resource_manager_usage
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> The specific issue of trace with amdgpu_mem_info_vram_used_show should
>> be fixed with this one - "drm/amdgpu: hide VRAM sysfs attributes on
>> GPUs without VRAM"
>Thanks @Lazar, Lijo,  maybe we still can use this patch to fix  this crash=
 when
>calling  AMDGPU_CS and  query AMDGPU_INFO_VRAM_USAGE.
>or add check like the previous patch.
>
[lijo]

Agree, there are indeed multiple places of ttm_resource_manager_usage call.=
 You may follow the same check as in the hide VRAM patch - ttm_resource_man=
ager_used - in case ttm doesn't take this change.

Thanks,
Lijo

>Regards
>Jesse
>
>[  911.954646] BUG: kernel NULL pointer dereference, address:
>00000000000008f8 [  911.962437]
>#PF: supervisor write access in kernel mode [  912.007045] RIP:
>0010:_raw_spin_lock+0x1e/0x40  [  912.105151]
>amdttm_resource_manager_usage+0x1f/0x40
> [amdttm] [  912.111579]  amdgpu_cs_parser_bos.isra.0+0x543/0x800
>[amdgpu]
>
>>
>> Thanks,
>> Lijo
>> >-----Original Message-----
>> >From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> >Jesse.Zhang
>> >Sent: Monday, October 13, 2025 7:25 AM
>> >To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> >Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> ><Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>;
>> >Yang, Philip <Philip.Yang@amd.com>; Zhang, Jesse(Jie)
>> ><Jesse.Zhang@amd.com>
>> >Subject: [PATCH] drm/ttm: Add NULL check in
>> >ttm_resource_manager_usage
>> >
>> >Add a NULL pointer check in ttm_resource_manager_usage() to prevent
>> >kernel NULL pointer dereferences when the function is called with an
>> >uninitialized resource manager.
>> >
>> >This fixes a kernel OOPS observed on APU devices where the VRAM
>> >resource manager is not fully initialized, but various sysfs and
>> >debug interfaces still attempt to query VRAM usage statistics.
>> >
>> >The crash backtrace showed:
>> >    BUG: kernel NULL pointer dereference, address: 00000000000008f8
>> >    Call Trace:
>> >     amdttm_resource_manager_usage+0x1f/0x40 [amdttm]
>> >     amdgpu_mem_info_vram_used_show+0x1e/0x40 [amdgpu]
>> >     dev_attr_show+0x1d/0x40
>> >     kernfs_seq_show+0x27/0x30
>> >
>> >By returning 0 for NULL managers, we allow callers to safely query
>> >usage information even when the underlying resource manager is not
>> >available, which is the expected behavior for devices without
>> >dedicated VRAM like
>> APUs.
>> >
>> >Suggested-by: Philip Yang <Philip.Yang@amd.com>
>> >Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
>> >---
>> > drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> >diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>> >b/drivers/gpu/drm/ttm/ttm_resource.c
>> >index e2c82ad07eb4..e4d45f75e40a 100644
>> >--- a/drivers/gpu/drm/ttm/ttm_resource.c
>> >+++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> >@@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct
>> >ttm_resource_manager *man)  {
>> >       uint64_t usage;
>> >
>> >+      if (!man)
>> >+              return 0;
>> >+
>> >       spin_lock(&man->bdev->lru_lock);
>> >       usage =3D man->usage;
>> >       spin_unlock(&man->bdev->lru_lock);
>> >--
>> >2.49.0
>>
>

