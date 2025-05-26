Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A4AC438A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 19:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755B10E34F;
	Mon, 26 May 2025 17:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tErOWmpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6149710E071;
 Mon, 26 May 2025 17:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhVsHMTr+hBBsU+cQUc615uKY8Eh1Be/tQSikIZAnwjWWYMe0HBxsTbRI755uEJYmXW3zhNfD1YTx93N0d5cXP4HvUHFRKxpL0VXWNB4F3Umt8Wgacl9Ocd7QyRTIymbdqtsqjVTfbMDWwdeA4UrLMjaDdwJOlCMtyHkMaERCip4ppiAsvGWtFveoVn7jFVuNyxgAMmvnfsdN08Y202bO+7nURZFQNZxSuYHc4sVshYPw0Aez+msr5E2k2Ok9mh6zOK/taW7MXKsN4VJ0pHbeROVE93NFU5ekikb37R3ucm0zlXYH4jNQltQXmyOZ0p4ShjaNpvdcZld5VtJazmfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXPb9T99LRU6e9TiDNaXgEBUPq9JJzO9M/u/HiRage0=;
 b=oH4bVvRK9bRaJDpodfCeLjbNZxzkxw2YpOMKxEZFRJUsDNOHqYsxIR0/GLAV0l/gAsMLe+McaO0LyPO1rGOwNVhFucW26ghXvDhnTSfvEPgHrExRpGhGlmSsXpoG8ik4ZPw6Mk0tplsVjm2/rZa/wA8MynLPPx1nH8nD1S36sKKUhwjkp6IZPNq70Pof4qnj8WQ7sUVA2O1zp7Fw+A0d6MfPfWYk4c+YTpGTc5tCCpOVxRBYTEaHtDuyWAHH2zjPMTD0bzLkm7Yw1ed5gpuCMEJyrDFmbkLhoJBw0IwZAjul0r4pudgN6n4Enoi3opLSt5ZWFoD5x+pDAZbjFUpTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXPb9T99LRU6e9TiDNaXgEBUPq9JJzO9M/u/HiRage0=;
 b=tErOWmpUKfM6yYgn4vw6VpO2plb41m+bcB0pd7f7nFNkFXWqvuZNsmuoV6lqCj+w9VuX6+Q6nEQEP1KIeZ6AyZvcy/HFUawtBgv/JYqjXymykge2sQll8k2M/MugURsJ9lttICSzkk0RpeHQxdp8wM7R+V/YLyuBHoVDC3UM9eU=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.22; Mon, 26 May 2025 17:50:55 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 17:50:55 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
CC: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu, Ray"
 <Ray.Wu@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux regressions
 mailing list <regressions@lists.linux.dev>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Topic: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Index: AQHbyWsAkgfutsQ0E0KUJ0vtS3bUP7PbnpGWgAAVZ4CAAZdLAIAACLstgANiR4CABILlUQ==
Date: Mon, 26 May 2025 17:50:54 +0000
Message-ID: <CH0PR12MB52846C4987E9D16B19ABEF138B65A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
 <CABXGCsMgEnrtHjJvPPmrXDFkmMkU5TN57bU_396PuF_D02oQSQ@mail.gmail.com>
 <CH0PR12MB52841D545358B55A0546A06C8B9EA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNkBCjh_jSJ+tT=xPiSSby-XM6qsnGfCFq4pPPZ8jspGA@mail.gmail.com>
In-Reply-To: <CABXGCsNkBCjh_jSJ+tT=xPiSSby-XM6qsnGfCFq4pPPZ8jspGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-26T17:50:54.586Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|DS7PR12MB5741:EE_
x-ms-office365-filtering-correlation-id: 8f158354-c15e-4ad8-b38b-08dd9c7ddd0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Wlo1ZDN6SUhvbGNXMFQ0eXJtTEFNZm5ycWwvRXNhMGhGMEFocDk0STNkbXl6?=
 =?utf-8?B?bzBOeU9sbTFzMkVFNTNwdkMzZ2pkNkRtTDA2cWNQeklicmo3cFNTc09QdnR0?=
 =?utf-8?B?eUVXZG5SdURUVCsveFZ1ekkxM2F2QXlMWVFaYzJSUlZhbVNXRldxNzRCKzl4?=
 =?utf-8?B?U0Q4dE9tejB3RW5zRGhwdGdEdUNqdlBJaUZsTExXWmUrQUY1N3E4bjRId3R1?=
 =?utf-8?B?UHVQUW9KNnl1QXhXNXhoMVF6SXNJL0RoU1NNMGVoTHVlUk5wN3RwbXgxTXZ1?=
 =?utf-8?B?VnlqUkpiSEtzY3hkSU96L0tHSW5wa0p4NC9NdmM2SUM5YXFJMTRJQ2Z0azFD?=
 =?utf-8?B?K3BvK1FsV1dxMjRSZkdXN3FYTkpzRkR1MEl6Q2ZKRlhLVmFVMjFVWnJ5RmdZ?=
 =?utf-8?B?dExaV3orTllDVnQ5MG9WaGZSRGN2TlVPa1FCK0w0VU4yQ3U3UEdkZ1BCWnVj?=
 =?utf-8?B?TWMySmZVNTV0NHV4WmNMdEVybnhqNVdBaFZ6YVM3NDVpQWxGT25yc2F1aXpI?=
 =?utf-8?B?MFUxcnJROUd0NVIxU2RBbEdEUHMydGhUajNHOHNjeVlXVS8xNTUwNHU5ZjBl?=
 =?utf-8?B?Z3d4TkZ0ckFyR0tRRDZLL2lSa1hFcVRnU2RhRFQrSXZmVHkyWTlSblFURUNv?=
 =?utf-8?B?VXMrM3kzWFFpVmdac1hYSTdUMkJGUHlRN0tFdTJLaml3aXJmSDZMbTZRaTI0?=
 =?utf-8?B?UWdaOTlXM3llY1J6ZmJmbUUwVlZUZE5HU2ZCbzl1Y3VUS3JNL3ZrSDBrbnNK?=
 =?utf-8?B?bXFuYllDNzIzVUpSZzVDeVNJWHVoNFNSeGFNWE8rYzN4QllIeDhmNHY2Mk5Q?=
 =?utf-8?B?aGdiWU52NkU0cHZkMzA2WThHd3Y3WURaU2ZkeHYrZWd4Y2t3ck80Rll5SnVi?=
 =?utf-8?B?V0tJdWZGZUpBcXNSbHBsV0pFeFN4QmJLV1l6cWVrVHRyZ0lRZnc4WXNsZHM1?=
 =?utf-8?B?L3V5SE1VUHpDWWl6ZUxvbnZUZXFSaEpSSUVwUTkydlpGcXdHWDJmQ1lOMFRi?=
 =?utf-8?B?YW85M1NNeFhXNGwwU3dzK0dhVlFKMkNJR3pobE0rTUJxR24reG5pR3hUamxq?=
 =?utf-8?B?QSs4OE9tb2xwNHc5ZXhzckxMdzlZR2NLS05Vc251YTdxeWhsd1JwY3lhcXhk?=
 =?utf-8?B?c0V3WHZVZUlMTzVESk5PV3FrSWhXUFByWlpVdHc4c0JtbXJZV3pqOGVzSldh?=
 =?utf-8?B?eXdqSGRIeDd5QzNUczF5Ym9VMGNvTzhoTjMwc21uaHBDQVJybzFuL0RCMVZL?=
 =?utf-8?B?VWlQNVE2OXZ2UHUrVFRmdytScmRtZWExV1hyaEFNNnZjc3gwVmIxV1NMZVN1?=
 =?utf-8?B?NllEUUdHdFoyd3had0V5VmtqUkV5NG9VQjkycUI1YUpBeDIrTVpZcUFrOFlt?=
 =?utf-8?B?Q0dtOFBWMHZDcDdWN0s2M2pvRW9ibkI2WmxVRjZkbEg0OE1YWEJseFM5bjVB?=
 =?utf-8?B?blk3bGtpajdZWVJIZUhpamM2dnUyeEd4RFBqMEZkdUFMRVZjQ1ZMRGVWdVFx?=
 =?utf-8?B?RU10eURVTW5jUGpaeDVLT2lXZ1huTDlWY1dpNHNnT2lnUnIxSExMczlnNllX?=
 =?utf-8?B?Tm9HTW1LcnVLaGRBbFE5b1NRMHpwLyt4NzV5a1V4b05GYldMS1k2OXhKZ3lk?=
 =?utf-8?B?VDhYN2NQQVN6Y0xXUXppdDVQamlZMEVZdzhXdTRjWHdTbktacmw5aENmVnhO?=
 =?utf-8?B?WjNDSllFYUtoM2JaaFRKdUwwUzNGckExajZ0Vjc1aTVZVXRNRlo5L1Uwek9D?=
 =?utf-8?B?Yzl3UE1VMW1zRTFIYTBvczgzM1F6MEtvYnAzWk1FOGl4N096OXhOWS93UVNn?=
 =?utf-8?B?MzIyd0xnLzVTSFBNSlQxY05ob2FEQkdFUzUzUmNnb3V2aEN6NWVQTjFWWGV5?=
 =?utf-8?B?b1J1djF3bXZFZlM3SUdmeXVuem93RE1zV2YrMmRNc1FoMzgrUTJmeVZ0SW0x?=
 =?utf-8?B?ZWJBMWpVSWRsYVEzNk14RHRSdWJKcGRzcllheFRtSDlrSm9uM2ExTHlmRHUr?=
 =?utf-8?Q?JV7rd567H7A2ulO9tvzjdx2G8G3Nec=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUxaMjk1MXZUTURYTUFMN1BWS1NwV1FGRkh4N1k2Y0hPQjBNR2JuSmp0TDhz?=
 =?utf-8?B?T24wZXVZaXorQ3diRElTVFZ2d2RqWmdZMWFxYlROUDBCSEZwV3lXRG1hTHMr?=
 =?utf-8?B?amhZZldsQ3o1bHhhY01pWUhiMERITWVuKytwMTlHTy9jRTFHeTI0dHF1eklW?=
 =?utf-8?B?ZWtUbU96Mnp0OWpGdjFRNnU4aDZpa1Q4TTE4UGtFMUxZRkE2aWpUWnA4aTV4?=
 =?utf-8?B?QlIrOFEzRTR5M1hmL1YrVlFXM1RsdjNiYTRlNyttOU84MzdJdS9EWThTR2dm?=
 =?utf-8?B?T241cCtaTGhCS3JFTkxaR2lUUGdyMWJMdWdIcHJHdENRaWJHblRXZUtFWUl4?=
 =?utf-8?B?b1NKQ1RXTEJiZUJJVkVxaC9uVC9OcnhkeGlNczhoZXltVW9NOUljMjNic2R4?=
 =?utf-8?B?NjI0VkZjSi9RNjExN0xsVDFPQVp1Zlk0citkT0lFWVF2bXVJcjdHMDJOZ3JY?=
 =?utf-8?B?ZnZTakJSdXd1MzdMR1RUWGRuekFUMVhHc3VlVEJxWGNheVZOcUd0cVVselU3?=
 =?utf-8?B?Ri9CYm5CRnB4U05wSE0zakhpNTA0NTZHYzAydkd0SWZScndmS2hmSTUxSkRw?=
 =?utf-8?B?RjRpeFZGbWJQTHVaMlU2YzJ4cEdFOUVROW1FZ0xKY01GYnZ6cit5VXFXbFhZ?=
 =?utf-8?B?QUt1ZU1HR0EzNm5GL2dlTTlJNUpWbnpLaERsVXM1WmhLVFIzbXM5M0ZXcXdm?=
 =?utf-8?B?UkhnY05QM0JWeFFLQ1dGUmJiWlQ3TU9HRVlUdEFUZVp0cUpjUnZpZ0U0UWhj?=
 =?utf-8?B?eTA1Z0krUm5TaWpDWXJHSnFiNXpqMlNtMG1pNUNZc3BpMkdXMERWL2tSN3dk?=
 =?utf-8?B?YVBWTUVNeSt3VE5hTzFjK2RKb2FIZGZDaWdxdUJpdUR5dzZYaGwwOGNLZWRt?=
 =?utf-8?B?SWVueEtnOXcrMW9OTE0raVhtemYrdHJNZVdSdnVnWG91SzRFZnNmc2hNem1w?=
 =?utf-8?B?MXNyd0trM2xKTHVsdFd5aWlEd3RTNjRFa0l1dXg2SHVSYmVBY1RGdFVWNDZF?=
 =?utf-8?B?TXpvd3VCdjJlekV4UFhKdnVrRFVSYUNGdTFiMW0zQ3FWemdTamNNc1BvbWly?=
 =?utf-8?B?V1hteWNIdjVYRnE0OERuQXdXb3hoMmlBU2M2WjNVRk4zWlM5ZGRBWjY4S2lT?=
 =?utf-8?B?dFZiOHNNQzBERmlmb1JSNWl6RVFicmFMRWJHbXdaVnhFb0VGcEhoei9MVFhm?=
 =?utf-8?B?dWR4b2IzTDEwek16TVZld2FYMW9UNzU2dzMwVmsyQjhMZzhNS2c0algwQTMy?=
 =?utf-8?B?TStBT2g4ZFozNUs5bUJoZlNWWkFlSkVEeTFiS0lFYlZVYUpQbGFLaElHTFph?=
 =?utf-8?B?UjlySld3RWU0OGFrYk81MmduMG1sRGkrU1RRVDNxNHdsaUZRSkNLRDhYMXd5?=
 =?utf-8?B?VVlSK0ZkdHBTYjNweVBwYytxeFVHd2VFVDlGOEhTRUZCSTdha2Vwd0l1dDJ5?=
 =?utf-8?B?VitwNUhUd0xOY0k1a090TEdIUng4T3ZpblZEVEN6eGlFMm9jbHR3Z3A5blln?=
 =?utf-8?B?TUxDdUhsbi93QVV1UnZlVWFCVklBUTZVejkwWFY3akFTV29kMWtEWnhrWm5M?=
 =?utf-8?B?YlZ5ZFlTb2F4Y1NwMlpVKytWOGJDNmZwdlVTd09ZT2FLSmJjOXpwWkRMYWl2?=
 =?utf-8?B?b2xIZ0hadm84bTNSVEd1Y3VTNjJoRHYrVGtaeVlrcXMvODJJSmd5ZVY2NjVh?=
 =?utf-8?B?MVR3dE44YmF6cnJkSllUSFN4TmFCYk5CdzRVVUUyTDFjeWlCRUNZMUVGZWJi?=
 =?utf-8?B?QmtLQUh3MzVnRmxyUkNxVmtIa0lPSEI4RFYvMG9pRjdlaVBxUEk1V0tqeXlt?=
 =?utf-8?B?dXA0Yk9ucm1XZHRXWDMrYWwwSzl5cnRXY3JoaGNXYWo3RndMN1RMMUE2eUFk?=
 =?utf-8?B?VEpYUlBGZWFnemNVRjdOWlVna0tkUDdBOXV1bUpjZ05JamdramRCZGJKSWJZ?=
 =?utf-8?B?ZmY2amludDFjVUpzQ1NvaldrUG8xYXdPWG1zQThLeVE0bWxrWmN1RnVBVi9q?=
 =?utf-8?B?UEtSOUJIdGVBN2VVTVhOUTIrZVRHMm1tZGFuQi9SaDlRUHBucmdEelUxRDZ6?=
 =?utf-8?B?dEE3QTVNNEFtZTJ1bGY4c0hnTUdrOFJTaytTOVVNUTlSNE5Qb1VWanJvTjVH?=
 =?utf-8?Q?tl1c=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52846C4987E9D16B19ABEF138B65ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f158354-c15e-4ad8-b38b-08dd9c7ddd0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 17:50:54.9929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9la4xAq6ULlhFpYFXbaK8PWS2F9443KJ0yYcGq5a71VJKDMAzZVfdS8B/8tievO6Wwqt63Vxqj9CbqYmKV6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
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

--_000_CH0PR12MB52846C4987E9D16B19ABEF138B65ACH0PR12MB5284namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgTWlrZSwNCg0KSXQgaXMgaW5kZWVkIGEgYml0IGhhcmRlciwgYnV0IHdlIHdlcmUgYWJs
ZSB0byByZXBybyB0aGUgaXNzdWUgb24gdGhlIDYwMDAgc2VyaWVzLiBJJ2xsIG5lZWQgdG8gZ2V0
IHRoZSBETUNVQiB0cmFjZSBsb2cgdG8gY29uZmlybSwgYnV0IGl0IGxvb2tzIGxpa2UgYW4gU01V
IGhhbmcgZnJvbSB3aXRoaW4gRE1DVUIuIFNvIHdlJ2QgbmVlZCBtb3JlIGRlYnVnZ2luZyB0byBm
aW5kIG91dCB3aGF0cyBnb2luZyB3cm9uZyBmcm9tIFNNVSBzaWRlLiBNZWFud2hpbGUsIEkndmUg
cmV2ZXJ0ZWQgMjE5ODk4ZDI5YzQzOGQ4ZWMzNGE1NTYwZmFjNGVhOGY2YjhkNGYyMCB0aGF0IHRy
aWdnZXJlZCB0aGUgaXNzdWUgZm9yIGEgbG90IG9mIHRoZW0uDQoNCg0KLS0NCg0KUmVnYXJkcywN
CkpheQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IE1pa2hhaWwgR2F2
cmlsb3YgPG1pa2hhaWwudi5nYXZyaWxvdkBnbWFpbC5jb20+DQpTZW50OiBGcmlkYXksIE1heSAy
MywgMjAyNSA0OjUyIFBNDQpUbzogUGlsbGFpLCBBdXJhYmluZG8gPEF1cmFiaW5kby5QaWxsYWlA
YW1kLmNvbT4NCkNjOiBDaHVuZywgQ2hpYUhzdWFuIChUb20pIDxDaGlhSHN1YW4uQ2h1bmdAYW1k
LmNvbT47IFd1LCBSYXkgPFJheS5XdUBhbWQuY29tPjsgV2hlZWxlciwgRGFuaWVsIDxEYW5pZWwu
V2hlZWxlckBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgYW1kLWdmeCBsaXN0IDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGRy
aS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IExpbnV4IExpc3QgS2Vy
bmVsIE1haWxpbmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCByZWdyZXNz
aW9ucyBtYWlsaW5nIGxpc3QgPHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj4NClN1YmplY3Q6
IFJlOiA2LjE1LXJjNi9yZWdyZXNzaW9uL2Jpc2VjdGVkIC0gYWZ0ZXIgY29tbWl0IGYxYzZiZTM5
OTlkMiBlcnJvciBhcHBlYXJlZDogKkVSUk9SKiBkY19kbXViX3Nydl9sb2dfZGlhZ25vc3RpY19k
YXRhOiBETUNVQiBlcnJvcg0KDQpPbiBXZWQsIE1heSAyMSwgMjAyNSBhdCAxMDoxM+KAr1BNIFBp
bGxhaSwgQXVyYWJpbmRvDQo8QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPiB3cm90ZToNCj4NCj4g
W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cj4NCj4NCj4gSGkgTWlrZSwNCj4NCj4gVGhhbmtzIGZvciB0aGUgZGV0YWlscy4gV2UgdHJpZWQg
dG8gcmVwcm8gdGhlIGlzc3VlIGF0IG91ciBlbmQgb24gOTAwMCBhbmQgNzAwMCBzZXJpZXMgZGdw
dSwgYnV0IHdlJ3JlIG5vdCBzZWVpbmcgdGhlIGRtdWIgZXJyb3JzLiBXZSB3ZXJlIG9uIFVidW50
aSwgc28gd2UnbGwgdHJ5IEZlZG9yYS4NCj4NCg0KSGkgQXVyYWJpbmRvLA0KDQpXZXJlIHlvdSBh
YmxlIHRvIHJlcHJvZHVjZSB0aGUgcHJvYmxlbT8NCg0KSSBhbHNvIGhhdmUgYSA3OTAwWFRYLCBh
bmQgYmFzZWQgb24gbXkgdGVzdGluZywgdGhlIGlzc3VlIGlzDQpzaWduaWZpY2FudGx5IGhhcmRl
ciB0byByZXByb2R1Y2Ugb24gdGhpcyBHUFUgY29tcGFyZWQgdG8gdGhlIDY5MDBYVC4NCkhvd2V2
ZXIsIEkgZGlkIGV2ZW50dWFsbHkgc2VlIHRoaXMgaW4gdGhlIGxvZ3M6DQoNCmFtZGdwdSAwMDAw
OjAzOjAwLjA6IFtkcm1dICpFUlJPUiogZGNfZG11Yl9zcnZfbG9nX2RpYWdub3N0aWNfZGF0YToN
CkRNQ1VCIGVycm9yIC0gY29sbGVjdGluZyBkaWFnbm9zdGljIGRhdGENCg0KSXQgYXBwZWFyZWQg
b25seSBhZnRlciBhIGxvbmcgdXB0aW1lIHVuZGVyIGxvYWQsIGFuZCB1bmxpa2Ugd2l0aA0KNjkw
MFhULCB0aGUgc3lzdGVtIGRpZCBub3QgZnJlZXplLg0KU3RpbGwsIHRoaXMgc3VnZ2VzdHMgdGhl
IHByb2JsZW0gbWlnaHQgYmUgbGF0ZW50IG9yIG1hbmlmZXN0DQpkaWZmZXJlbnRseSBvbiBSRE5B
IDMuDQoNCkxvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIHlvdXIgZmluZGluZ3Mgb24gRmVkb3Jh
Lg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KTWlrZSBHYXZyaWxvdi4NCg==

--_000_CH0PR12MB52846C4987E9D16B19ABEF138B65ACH0PR12MB5284namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpDYWxp
YnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5v
cm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVm
dCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBP
bmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+
SGkgTWlrZSw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj48YnI+DQo8L2Rpdj4N
CjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj5JdCBpcyBpbmRlZWQgYSBiaXQgaGFyZGVyLCBi
dXQgd2Ugd2VyZSBhYmxlIHRvIHJlcHJvIHRoZSBpc3N1ZSBvbiB0aGUgNjAwMCBzZXJpZXMuIEkn
bGwgbmVlZCB0byBnZXQgdGhlIERNQ1VCIHRyYWNlIGxvZyB0byBjb25maXJtLCBidXQgaXQgbG9v
a3MgbGlrZSBhbiBTTVUgaGFuZyBmcm9tIHdpdGhpbiBETUNVQi4gU28gd2UnZCBuZWVkIG1vcmUg
ZGVidWdnaW5nIHRvIGZpbmQgb3V0IHdoYXRzIGdvaW5nDQogd3JvbmcgZnJvbSBTTVUgc2lkZS4g
TWVhbndoaWxlLCBJJ3ZlIHJldmVydGVkIDxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3Ms
IEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4N
CjIxOTg5OGQyOWM0MzhkOGVjMzRhNTU2MGZhYzRlYThmNmI4ZDRmMjAgdGhhdCB0cmlnZ2VyZWQg
dGhlIGlzc3VlIGZvciBhIGxvdCBvZiB0aGVtLjwvc3Bhbj48L2Rpdj4NCjxkaXYgY2xhc3M9ImVs
ZW1lbnRUb1Byb29mIj48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRv
cywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGlkPSJTaWduYXR1cmUiIHN0eWxlPSJjb2xvcjogaW5oZXJp
dDsiPg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2Es
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KLS08
L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxi
cj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KUmVnYXJkcyw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlh
bCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCkpheTxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQi
PjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmlu
ZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0i
Q2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAw
MCI+PGI+RnJvbTo8L2I+IE1pa2hhaWwgR2F2cmlsb3YgJmx0O21pa2hhaWwudi5nYXZyaWxvdkBn
bWFpbC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IEZyaWRheSwgTWF5IDIzLCAyMDI1IDQ6NTIg
UE08YnI+DQo8Yj5Ubzo8L2I+IFBpbGxhaSwgQXVyYWJpbmRvICZsdDtBdXJhYmluZG8uUGlsbGFp
QGFtZC5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBDaHVuZywgQ2hpYUhzdWFuIChUb20pICZsdDtD
aGlhSHN1YW4uQ2h1bmdAYW1kLmNvbSZndDs7IFd1LCBSYXkgJmx0O1JheS5XdUBhbWQuY29tJmd0
OzsgV2hlZWxlciwgRGFuaWVsICZsdDtEYW5pZWwuV2hlZWxlckBhbWQuY29tJmd0OzsgRGV1Y2hl
ciwgQWxleGFuZGVyICZsdDtBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tJmd0OzsgYW1kLWdmeCBs
aXN0ICZsdDthbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs7IGRyaS1kZXZlbCAmbHQ7
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs7DQogTGludXggTGlzdCBLZXJuZWwg
TWFpbGluZyAmbHQ7bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyZndDs7IExpbnV4IHJlZ3Jl
c3Npb25zIG1haWxpbmcgbGlzdCAmbHQ7cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2Jmd0Ozxi
cj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogNi4xNS1yYzYvcmVncmVzc2lvbi9iaXNlY3RlZCAtIGFm
dGVyIGNvbW1pdCBmMWM2YmUzOTk5ZDIgZXJyb3IgYXBwZWFyZWQ6ICpFUlJPUiogZGNfZG11Yl9z
cnZfbG9nX2RpYWdub3N0aWNfZGF0YTogRE1DVUIgZXJyb3I8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwv
ZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5PbiBX
ZWQsIE1heSAyMSwgMjAyNSBhdCAxMDoxM+KAr1BNIFBpbGxhaSwgQXVyYWJpbmRvPGJyPg0KJmx0
O0F1cmFiaW5kby5QaWxsYWlAYW1kLmNvbSZndDsgd3JvdGU6PGJyPg0KJmd0Ozxicj4NCiZndDsg
W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV08
YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgSGkgTWlrZSw8YnI+DQomZ3Q7PGJyPg0KJmd0
OyBUaGFua3MgZm9yIHRoZSBkZXRhaWxzLiBXZSB0cmllZCB0byByZXBybyB0aGUgaXNzdWUgYXQg
b3VyIGVuZCBvbiA5MDAwIGFuZCA3MDAwIHNlcmllcyBkZ3B1LCBidXQgd2UncmUgbm90IHNlZWlu
ZyB0aGUgZG11YiBlcnJvcnMuIFdlIHdlcmUgb24gVWJ1bnRpLCBzbyB3ZSdsbCB0cnkgRmVkb3Jh
Ljxicj4NCiZndDs8YnI+DQo8YnI+DQpIaSBBdXJhYmluZG8sPGJyPg0KPGJyPg0KV2VyZSB5b3Ug
YWJsZSB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0/PGJyPg0KPGJyPg0KSSBhbHNvIGhhdmUgYSA3
OTAwWFRYLCBhbmQgYmFzZWQgb24gbXkgdGVzdGluZywgdGhlIGlzc3VlIGlzPGJyPg0Kc2lnbmlm
aWNhbnRseSBoYXJkZXIgdG8gcmVwcm9kdWNlIG9uIHRoaXMgR1BVIGNvbXBhcmVkIHRvIHRoZSA2
OTAwWFQuPGJyPg0KSG93ZXZlciwgSSBkaWQgZXZlbnR1YWxseSBzZWUgdGhpcyBpbiB0aGUgbG9n
czo8YnI+DQo8YnI+DQphbWRncHUgMDAwMDowMzowMC4wOiBbZHJtXSAqRVJST1IqIGRjX2RtdWJf
c3J2X2xvZ19kaWFnbm9zdGljX2RhdGE6PGJyPg0KRE1DVUIgZXJyb3IgLSBjb2xsZWN0aW5nIGRp
YWdub3N0aWMgZGF0YTxicj4NCjxicj4NCkl0IGFwcGVhcmVkIG9ubHkgYWZ0ZXIgYSBsb25nIHVw
dGltZSB1bmRlciBsb2FkLCBhbmQgdW5saWtlIHdpdGg8YnI+DQo2OTAwWFQsIHRoZSBzeXN0ZW0g
ZGlkIG5vdCBmcmVlemUuPGJyPg0KU3RpbGwsIHRoaXMgc3VnZ2VzdHMgdGhlIHByb2JsZW0gbWln
aHQgYmUgbGF0ZW50IG9yIG1hbmlmZXN0PGJyPg0KZGlmZmVyZW50bHkgb24gUkROQSAzLjxicj4N
Cjxicj4NCkxvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIHlvdXIgZmluZGluZ3Mgb24gRmVkb3Jh
Ljxicj4NCjxicj4NCi0tIDxicj4NCkJlc3QgUmVnYXJkcyw8YnI+DQpNaWtlIEdhdnJpbG92Ljxi
cj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_CH0PR12MB52846C4987E9D16B19ABEF138B65ACH0PR12MB5284namp_--
