Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7EABC087
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 16:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3710E38F;
	Mon, 19 May 2025 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fq8D70w1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E8910E38F;
 Mon, 19 May 2025 14:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm/wMJvwBaF4WRDsTBYcgqjBxQsftR5lOCA3+f5V8m0dRmWEcm0VhdJLSGRuLj42CSsR/gLvrOrvk9S/WcCx/N6aixhH/cIVsBuryHqVd8ztG2RN3gKuNqXtR8aP+sg2/EhgtBhASgeBKW7JwFSBlD2DUQUKhQRxpNTc6SxB5dserhZZM0AzBJRkPz9O6YkrnR2y3ShBWcwWu/6pfgrtBA46aioONmHgVqO8vj7pZWJO4vQsNafEaG9VicuAREFlC9ytmLy797m5pRGIh+5l+WUw6c0ryewHgS3axnjm4MtKbS+68o0ybFgBvla0oTa0FD3kU0J9iFmk+BbD25kpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECQUdvns9u4reGBhF5sEo6Os9GTJwB/VyzCWsSzdGqk=;
 b=NnQ5r36k90bFaS3orEmY1cCrFumRkee/o7yV93ChkBESHxlgkZO+hKAJ8BFyL3YIIrH0++OmcMbZSW9IinkpvABKdd2oXelJZWZ9JFwJ9KBvpQnpAUx+3ufl29RAuwEoiVNVXqStuMqpmLa9UDXulfKok2wtxaG+6Uojhv1R1uF7u1dW3doXdj4giCpUtIUfqDC1cJ2viwGnrpHkiamBnngxIeImdHai+9TUjkAn4yeC2XfugxhMj904BmKrbt25TPMmKndAlNZBdGAFFQIx/Dg8DwM2M7XnuqAq+fvjOl559aUzcJnpMyFohrgt0GsvaY6s1eIVHOx/xLZRpKgNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECQUdvns9u4reGBhF5sEo6Os9GTJwB/VyzCWsSzdGqk=;
 b=Fq8D70w1qMgzRkwmYkS33gD8juqGNBD/me3e6sJI+Yo+qhYJwe5/a+bnR+OcOI6wxHSX5OGuLDsCKYMXy/Oe8R4AOE2h6rvxkg6LDH9+rFDFReQAmXQHqpsNDZWIjg6fBYjfT9596JU/MhdLT0gVzyWs+R8TsyQyiE0PLfsdP0V8Uyx/hiUfclNaKbIFH2LgGueOeF+0Sy+g4IkIXHqYa6z09c1a4neZebhECQqtGLv08d4goXwRvzz7Qa+BKo8OWHZmbytL/eFNFp8HbHk4XZD/13wkpGo5VLrN/LuAjJQBz86IUhgFMl9GJzkEcE6BNyBBTstNivMxAc1qpCzi1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9084.namprd12.prod.outlook.com (2603:10b6:408:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 14:24:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:24:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 23:24:08 +0900
Message-Id: <DA07EVNAJXQW.MF79KW7CZAOV@nvidia.com>
Subject: Re: [PATCH v3 18/19] gpu: nova-core: extract FWSEC from BIOS and
 patch it to run FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-18-fcb02749754d@nvidia.com>
 <aCTHBO0Wqx3rc81W@pollux>
In-Reply-To: <aCTHBO0Wqx3rc81W@pollux>
X-ClientProxiedBy: TYAPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:15::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9084:EE_
X-MS-Office365-Filtering-Correlation-Id: 52997816-60b0-4e61-2e59-08dd96e0d2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDR3cmRhTEsxTEFURkNxZlROaHJUaHVsS0dUSlVzbHlxR1JWejlLUzNteVMx?=
 =?utf-8?B?OHZwWmtGU3haa0gzZU5wTEF1Y3hKREhmYmttTnVKcDVWbk5rK0QwZWlhVEZu?=
 =?utf-8?B?WWg4R3grbUc1bmdTOFRRWmlvbWQ4ZFo4eVIwRElxcnkxbVQvRHU0czdnRy9X?=
 =?utf-8?B?S3VJQStCenRzOUJCWlJQeXM2bkQvNVdpQjRVNjBnVUlnbGdPK2crOUFwd3dO?=
 =?utf-8?B?T0FBK0I3dDQxZWlIaFhSWWJzTzloL0VwSXdvS2hrZk1scStycVhNdDFOWnVL?=
 =?utf-8?B?elhxa0prbHo5TWU0dTBXLyt2YkRpOUN5cVVRSUZMV2RlYklkSUFvemlzWDN4?=
 =?utf-8?B?ckFZR0tOaUtXSXVsU3E1K0k2Q0JoeEgrN1p2K2dNV0FtUWpzTVJNSUw5NWIv?=
 =?utf-8?B?VHp3K0Y3UU9iNFJ0WGw4RUhvV3VNZVk4a3NqejMzb3Rjc3hCcUxzVDdzM2FC?=
 =?utf-8?B?VUVkY2lSMkhySUtueExLQXlvdjNENzYwaWFpYWRISUhQS0pPWkpyZ1V4N2k1?=
 =?utf-8?B?SnkzMHNvRmpZV3VuNkdnS2ZPYUtaN0FDUkhzeFlrTTJmK1B6bVBqa29DU1JX?=
 =?utf-8?B?dVM0WnlZRW1lQURnWnlKNHIwUnNYTDNoalNIV3FyelJWOXlnNWJHYTVYM2l1?=
 =?utf-8?B?R2htc1gycUhWN0ZRVUtTZXc4cU9NbktKeE1aa25wb25kVko4aG9EQThKSlhh?=
 =?utf-8?B?cW02a0ZMSnFtL1FBL2MxNXl6OHNWQ1NMbEJWVXhsb2kwb3BBWUQ2eGMxeUkx?=
 =?utf-8?B?bTBhL3RuTnduR0xIZ2FITU1wQWo0NE5NT0tvMEk2WmVwaStZR00raWZCVHJ2?=
 =?utf-8?B?dlozMmFqOVZ4bWFjMVZIWjRZWDRMampjR0RwdU1USEhVWElPOFU4YnlmSzVi?=
 =?utf-8?B?RmpscVBKaWZVbTE2b2Rnc3IwUXJwSFhUckRxMkd5VFA1MGMwOWtKVTJCcEI2?=
 =?utf-8?B?RGtOcmFtM0ZBTW10UG1lMnZIdGZCMVdYZ1I1SjhRODAwRk4xUitzQnRWRExW?=
 =?utf-8?B?WDZERnI4ZTJydy91M2QrZ3RGdmxjOXZnVFM1UkZvaHd4NEZadnRSRk9IK2py?=
 =?utf-8?B?THl6NHdzV2d0UDBYR29vbXJISnZXZng4dzVZWWdhdFpYQU5TeHFLUTVrcllv?=
 =?utf-8?B?MElYczBCbEg1SXRIR2cwZ3dia2dwNmFoQm5qWU9rcDV4SkxLcnpOUmJkQXQ3?=
 =?utf-8?B?N0NNeHRWODBTc0tqbDRtQ2p3RGYxTXh1dDE5ang2dVZsSHc3RDJKUHJBaDhG?=
 =?utf-8?B?Yk0rZDFWbUpXZE5GaXlxWmE4OGkwYXFjS01BWm9oRUFLNlpMUXRGeTJpTlY3?=
 =?utf-8?B?cktkQVhqQzVXTDRwN0tjN3RHMnU3TElQeDNlV0djNUVhUnNUdE96eTFqRjZR?=
 =?utf-8?B?T3JDRE4yaHZDSXpuM01nakR0QXEyQzRJSk1NTGNta1RIazQ1R0hWT1QxQ0hQ?=
 =?utf-8?B?OTRyKzBBKy85dVUwQzcyZDdZVUZjblJodytmZW9MOUJ1M1k1TXoweHFFVzZX?=
 =?utf-8?B?NkNRaGl4Vk5LTGk1aFRsdno1UHYxTS9GVHhNd0ZsdlhaOHZ6aE5qMUtJbW5E?=
 =?utf-8?B?Y2dWeXVtZjNZSG0vSksyZGNrd1BzVVdNamJ1UDF5NngzRWkyaTc1RHdRcGt0?=
 =?utf-8?B?elAyQmpVZUxCT1FFVlVQOTBTUkRtbmxWN2dYTmJ1SmJSSkdha3Q2WXh6Umxs?=
 =?utf-8?B?SElJL2NDcm53aU8xcTNNTnAwdUxXTjBaRDROQUp1c01UdVl2R2tlenh3eWdr?=
 =?utf-8?B?NFV4MWVkY3ViekZSbFdOS1VJVUxPdFVCS2Y1UmhkL0FCQmR4SGVrTDdwb1h3?=
 =?utf-8?B?bzc2MkJEVXZyaE0yVzJSbmFEbUV1VGs1TklrOGdBVGtZM3lwY3pPcVk3SWRW?=
 =?utf-8?B?SDNsSTErR2FPbnBrSU5pczN4T1BCaGd6SkdpUHFFL3JtZmEvUzZpR0IyMEY3?=
 =?utf-8?Q?6K+gNRB5Sls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25raE9jZTBvMkVSbjdwSzhxUUY5NVF3NU9zMTQ4Zm5FMVB1cXZQTkhFM0JQ?=
 =?utf-8?B?R2FkSDJtUTZObWpmNm1OZi9ON2trM210Ym4xVWNwcTFCVFQ2ZzI0ekhhUzZ2?=
 =?utf-8?B?R2xlNHl5bVdINW5RclREVElRckNBWmQxbDd0eHl3dUdrZnVVbHFiUUVPaEdx?=
 =?utf-8?B?ZFNraFZaa1l2Z3FCM2RBYjkrcUpRbVE2ZDFEYTEyTVp4WkxIUi80SFo1QTl0?=
 =?utf-8?B?cGhXWW5SNlJQbU85M1FiY2JVandKWXRBS0dmemtTRDlaTUFEWThZYm1ycVd1?=
 =?utf-8?B?d3AxU3UyaUtsOTZITjVXRnZvQ05rMWlJNkJ2RkVTTDg4THBiQTNHTldkRnVH?=
 =?utf-8?B?OVJTQlZvUkhIQWVQZUFGd01FejJSUjJjTmN6Z1ptTEwxeHhxWDdHR3k2b2ZG?=
 =?utf-8?B?eW93Skw2dkNydmtHUHVqQ1I4WGU1SWE3ejh0MDVtVTRJa0pkeVdvayswakxn?=
 =?utf-8?B?RU0vUW9odjlJZ1c2cnN3UkRFZVZ5STVhbGJiQng4UmNVakVLVDFkUGFBMVdZ?=
 =?utf-8?B?SFc5bkQraEppY0NlaHIxUFI5RkFQQVdCWll1dUFnZWVONjhtOUZlTDBIKzdt?=
 =?utf-8?B?Vk9lWHRUSlRXamd4MHNFRDAxbGxKb1NIT3BJWWloaCsrOW1BT05JeTJkTVpl?=
 =?utf-8?B?U1ZHaGw2MTBGV2JwTDQ4bXJLSktEemQzbXFxTzlrQUtZeHZqNUZ0WTQxRGJw?=
 =?utf-8?B?eEdiR2pETEJUQ1lETWJOVDEwQVNHWkV4dlBpYnI5emtFaE4zV1ZRYi92MEVz?=
 =?utf-8?B?SWt0d0NnUXVEVllRTUtEQmN6Wllaei8vRmlXZWg3M1U2aXk5eEdGTzZCOXFO?=
 =?utf-8?B?OHhaMTRLM1ppK0h6TG4vOUg5ZGp5V3NvRFVGaUtKbFcwUUpzL1IrejZPZ2Nh?=
 =?utf-8?B?dTZHdEFEbERlOWNYWFVINGM0UjFScExDWitkUUM2czdSVFFsYzFaRU03bklo?=
 =?utf-8?B?Y1FzenlIVHNpdlAzaHJHVFpDOUtPK3BpTk9UMHo3NzZpZitVaGdsbUwvSUFT?=
 =?utf-8?B?cVcyS2ZZQzJuVUFhZEJpdmE2aTNFNUxBM2xaVGVNWkVVZXZ4cXlPSnNlZjZS?=
 =?utf-8?B?U3pxTi9kKzlCT3FFcHdSY1hSQ2NyUU5CYm1JNnB0dE9JQVNFNVpzVVRGSGIy?=
 =?utf-8?B?R0x6UGtBaW00NGIrOE16TDczR3NXOTB3TXhhRElhTWwxNjN1QndFY3hma1Nt?=
 =?utf-8?B?V29qT2c2SERCT3RXREp6d2Q4Qmg3OHBHa1N5TGZZOHRPZFVTUnV0cXMycHhl?=
 =?utf-8?B?bFhJdUJudFppL1F4bXUxUkNrb1hRMFI5U21BeWtHaWkxby9wazlFUnBHbzh4?=
 =?utf-8?B?UmtOKys3K1d6NDBiVGhKVm81akFVR2hSZXJzV0pDUVhURzlmOUowek1ZcnJU?=
 =?utf-8?B?SnhxbVdYbjBkSXJyTGs3VEZxaVdaSWVmNDZIZXpRRms5Qkc0aDJIY3BxOWww?=
 =?utf-8?B?d1c0Z1RBRk5UbGlZMmlQK1V0MStVWkRQSS9NVnhsNUF0NU5sUWpVeTFXcWVM?=
 =?utf-8?B?eTZBV1FUY1JUM2Jua3d2Uzkzdk5xcGVKczVNOTVsMitCVzRVRTVJeGVxdDR6?=
 =?utf-8?B?bDlOeEp1VFFHV2R0aDd4cnFqMlp1OXlqT2MrTjgxdHlaWllrblVMdStFajNr?=
 =?utf-8?B?ZDJpREhzenE0TWYwbUVHTTJkdm5FeUxSZ0RETWhlOGlUcDZJQXI0UGMwQ1ZZ?=
 =?utf-8?B?eFl1R0JJMWlkYVB2UzRkalQ1czA2U2N4NWtMMVlvZmV5VSsvdGpFdGlwZndF?=
 =?utf-8?B?b24zV3doZGhJQTRJZGFZZkZKRktVNkZkdnl5SDBHeDZmOTIrYkFhMVpVY2J5?=
 =?utf-8?B?eWJIVFVLTzRRVUlXYmhxYWlVNjkxWWhZelhaQTVvSEhwUXRHQnp2QmllMlJp?=
 =?utf-8?B?VmhuMkYydEhWYjJlSjlWN3plTk1KVDd2YVZNNFJoeG9tMnhtWlE2bmxNc1pZ?=
 =?utf-8?B?Y1VjeER0VGFwaE9nQW9MUjQwZUdkQWxOS3p3OCtya3BRajFETC9sbnoyRDgx?=
 =?utf-8?B?Sk1jYVJ0QXZRWWk5ZVN1Yk5kOWZRQnV4WWVOUFM4ck42NGhCY0UzRTN6cjJU?=
 =?utf-8?B?RmM1dmtCSHJTMk5yQ1cvWG5CbnN4WU41VGdGaGsvZUZwNVpsSERwU2pwT1dq?=
 =?utf-8?B?VWhMcjZ6VGVFS09SUitwa2ZHQXRvdGJWblZ4OUxUdEU0QWk4dWhEQnlNRUYy?=
 =?utf-8?Q?FBhdfZvsizrbnjBqZHgMPxztsx2CihqdjP31nZg+R/oI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52997816-60b0-4e61-2e59-08dd96e0d2c7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:24:11.1910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E0flucK/rAFpXWknehjPnvL9Nc8dUBBnHFYNcVM5Khe5AxT8yKrwOrF/y1YKRSce8hRtgXNOPCPesQSMrgYTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9084
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

On Thu May 15, 2025 at 1:38 AM JST, Danilo Krummrich wrote:
> On Wed, May 07, 2025 at 10:52:45PM +0900, Alexandre Courbot wrote:
>> The FWSEC firmware needs to be extracted from the VBIOS and patched with
>> the desired command, as well as the right signature. Do this so we are
>> ready to load and run this firmware into the GSP falcon and create the
>> FRTS region.
>>=20
>> [joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/dma.rs            |   3 -
>>  drivers/gpu/nova-core/firmware.rs       |  18 ++
>>  drivers/gpu/nova-core/firmware/fwsec.rs | 359 +++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/gpu.rs            |  20 +-
>>  drivers/gpu/nova-core/vbios.rs          |   3 -
>>  5 files changed, 395 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 9d90ae01d0044eaab4ddbc3eba216741d7a623ef..a12d0dff574aa38fb5eb8f4d=
759611af2f8ba3ec 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -2,9 +2,6 @@
>> =20
>>  //! Simple DMA object wrapper.
>> =20
>> -// To be removed when all code is used.
>> -#![expect(dead_code)]
>> -
>>  use core::ops::{Deref, DerefMut};
>> =20
>>  use kernel::device;
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index 960982174d834c7c66a47ecfb3a15bf47116b2c5..3945fd18499555ddd6fb2e0e=
a69535b40fcc4b08 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -8,9 +8,12 @@
>>  use kernel::prelude::*;
>>  use kernel::str::CString;
>> =20
>> +use crate::dma::DmaObject;
>>  use crate::gpu;
>>  use crate::gpu::Chipset;
>> =20
>> +pub(crate) mod fwsec;
>> +
>>  pub(crate) const FIRMWARE_VERSION: &str =3D "535.113.01";
>> =20
>>  /// Structure encapsulating the firmware blobs required for the GPU to =
operate.
>> @@ -86,6 +89,21 @@ pub(crate) fn size(&self) -> usize {
>>      }
>>  }
>> =20
>> +/// Patch the `ucode_dma` firmware at offset `sig_base_img` with `signa=
ture`.
>> +fn patch_signature(ucode_dma: &mut DmaObject, signature: &[u8], sig_bas=
e_img: usize) -> Result<()> {
>> +    if sig_base_img + signature.len() > ucode_dma.size() {
>> +        return Err(EINVAL);
>> +    }
>> +
>> +    // SAFETY: we are the only user of this object, so there cannot be =
any race.
>> +    let dst =3D unsafe { ucode_dma.start_ptr_mut().add(sig_base_img) };
>> +
>> +    // SAFETY: `signature` and `dst` are valid, properly aligned, and d=
o not overlap.
>> +    unsafe { core::ptr::copy_nonoverlapping(signature.as_ptr(), dst, si=
gnature.len()) };
>> +
>> +    Ok(())
>> +}
>
> Why is this not in firmware/fwsec.rs, like patch_command()?

Ah, there is no way to know it now, but this function will also be used
to patch the booter firmware that runs on sec2, so having it here makes
it available to both sub-modules. I'm fine with moving it into the fwsec
module temporarily if you prefer though.

>
> Also, please wrap the ucode DmaObject in its own type, i.e.
> `struct UcodeDma(DmaObject)` and make the patch_*() functions methods of =
this
> type. They're only applicable for the ucode DmaObject.

Indeed, good idea. We will event want to specialize that type against
the kind of firmware as not all patching methods may be applicable
depending on the firmware.

<snip>
>> +impl FwsecFirmware {
>> +    /// Extract the Fwsec firmware from `bios` and patch it to run with=
 the `cmd` command.
>> +    pub(crate) fn new(
>> +        falcon: &Falcon<Gsp>,
>> +        dev: &Device<device::Bound>,
>> +        bar: &Bar0,
>> +        bios: &Vbios,
>> +        cmd: FwsecCommand,
>> +    ) -> Result<Self> {
>> +        let v3_desc =3D bios.fwsec_header(dev)?;
>> +        let ucode =3D bios.fwsec_ucode(dev)?;
>> +
>> +        let mut ucode_dma =3D DmaObject::from_data(dev, ucode)?;
>> +        patch_command(&mut ucode_dma, v3_desc, cmd)?;
>> +
>> +        const SIG_SIZE: usize =3D 96 * 4;
>
> 96 * 4? :-)

Mmmm let me look that up. ^_^; But I think it means that a signature is
made of 96 32-bit integers.

>
>> +        let signatures =3D bios.fwsec_sigs(dev)?;
>> +        let sig_base_img =3D (v3_desc.imem_load_size + v3_desc.pkc_data=
_offset) as usize;
>> +
>> +        if v3_desc.signature_count !=3D 0 {
>> +            // Patch signature.
>> +            let desc_sig_versions =3D v3_desc.signature_versions as u32=
;
>> +            let reg_fuse_version =3D falcon.get_signature_reg_fuse_vers=
ion(
>> +                bar,
>> +                v3_desc.engine_id_mask,
>> +                v3_desc.ucode_id,
>> +            )?;
>> +            dev_dbg!(
>> +                dev,
>> +                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
>> +                desc_sig_versions,
>> +                reg_fuse_version
>> +            );
>> +            let signature_idx =3D {
>> +                let reg_fuse_version_bit =3D 1 << reg_fuse_version;
>> +
>> +                // Check if the fuse version is supported by the firmwa=
re.
>> +                if desc_sig_versions & reg_fuse_version_bit =3D=3D 0 {
>> +                    dev_warn!(
>> +                        dev,
>> +                        "no matching signature: {:#x} {:#x}\n",
>> +                        reg_fuse_version_bit,
>> +                        v3_desc.signature_versions
>> +                    );
>
> Looks like this should be dev_err!().

Indeed, fixed.

