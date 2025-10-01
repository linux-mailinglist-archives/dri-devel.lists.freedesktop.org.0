Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C19BAF7EF
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556A310E69C;
	Wed,  1 Oct 2025 07:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PXQzkiFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0BE10E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:51:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnowF6v8nGNGQlIq3eiwYL8q54EHNYJkNE1PPxHpU6Jn2V2GRsZejXhUuq98hVdJRTMFVUkOyDX+6zFmM89q9nCBSKEikA3LORRqStMJ07Rr2h+J/d4lLc3SRZZSdMvkwT/xB9qYWA45vCXJizcx7vzFU1QvCm7cPpmu3s/E4VXs+SJE7zZ9WhqcVZkaskfkoBKNabxewlE8AjK6Ltr7nDplzb6Kb/axe15aT7yvBg6o9V747AdXLuG66qwImsgOU0gdGCGpKZ+pAN5YhELvdRlsfa0pvQB6dnTZh0gYwqaG33E+2pf2rZ54h9aYFKLhyWARyFNJu0FLbdUAP+T2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn0M1EsqAF0IX86pAR922sUYcQvuDYv33n5Z+JMqMmA=;
 b=eqicgS8l4UCvQkfR2uTYH6NFx4dlSZKAQXXyCQTy8eDGAUv1lHz4+qRA32YtMCr3g6ocwlmG/hfzf+wOkAELstYYK/sgbDGWCq5WSTXYsXKiPAHNgfxv1TfY301xZlkxIUxy7k+01CcIcgkXOkWbrqz1USjFZ80vwXld2lcNBbVjBRYbFJ9CniFE87DvY4f6RxetyKm9N7PKFFCOi8Kp1R3tJMVOn4FQXmzZ140RVx2ckewgTKrydNEidIyJgBvZmNVfO9D8YydzGfJcwDxD4Jyw2+oXw6XF2pCd2XULh1MxA91+OFrBAovAZfFGuFVsSOYiQHPuk6eM4aCMfTRmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn0M1EsqAF0IX86pAR922sUYcQvuDYv33n5Z+JMqMmA=;
 b=PXQzkiFikDA+/bjU5VtGstgbnVTfldxEeqKO1gWLo+DrtSry7Nn3R8nnWX21Ey+roAs5Ushr5oLSt1dsCy5MfDvmld34ujcgE1CG1ZQ8aTuy1DiorfDWvWkOCMWTRltW6WNcLeuL61RJR/c1ep4qhbgT1nFqMRwfsFyDS4D5Si2HUA4FS1G/GZMHtJt83WSCwH+nQbiW9zVPbjPCyIp3E4pMTcUPPeW1Cql5sMtJfPOETY+v4okGCb2MOIREOEh7efrAL3emiL2zV5rvjRdqYE2003gyjBNTqq3teVGOI/H4SxZXsGt62/HH7g8hb86/HA6pE3JNtHGnk5N+llSYaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 07:51:50 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 07:51:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Wed, 01 Oct 2025 16:51:39 +0900
Message-ID: <2368735.QZUTf85G27@senjougahara>
In-Reply-To: <CAPVz0n3-VvtjHDPKoFiipYQFx=Xq6hph8WW=xa2UaC7iDf1MyA@mail.gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
 <CAPVz0n3-VvtjHDPKoFiipYQFx=Xq6hph8WW=xa2UaC7iDf1MyA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 219e351b-e03a-49ed-bb02-08de00bf6108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1F1S3pUTk4wRWpBM09DaUdCZTBjdWx3TFdNdm1MMVhYNVZtcGkrSStVM3hG?=
 =?utf-8?B?K3JVYkRzcHlsV2c2SFpYcUJBd0E2L1hTQXFaNWZkYVEwOFUvQ3ljclZ2N1dU?=
 =?utf-8?B?bGNkSnlkRjRlS2dJK3hwZTdibkZPMDA4RHpFTGlIendBN2dRUW93L1RpSzZw?=
 =?utf-8?B?U0ovWkdaTko5MG1uZ2R4MWh3aUZvUFN1cXhZRlhaNDd6V0lyS3BCUENVallN?=
 =?utf-8?B?L0FoTEZzYUtDbHM4NnlaQm1SeTgyaDJRdjRnMEV0ZHNTU0RGam5JVGJETDJx?=
 =?utf-8?B?U0Nub1FsWk9xQnQwZm5QSjBnOVpUWTlEeUM4RmxmczlEaG5QL1NxMDBOTG5T?=
 =?utf-8?B?cW83VmVMUXRpQ0Y3Nk1SN3J2a3hVTGlIbkErRWttb3UrZnZiTklHSHJHcXMr?=
 =?utf-8?B?N1oxSklQb1J5VlZnL2VOQmR0UDFyb1FPeC8ybkdoTDEyamQ2TjcrSHRZVDN2?=
 =?utf-8?B?Zm1GYUU3K2ovbkJsMlM0dzBHSGkzMmc0Rng5N015YTZjRTZQYWRoWGxJczJI?=
 =?utf-8?B?UFJzZ2F0MEtsS2V4REh6d2RobUpISDBzUFRLdWxTbDZ4T2MyWkdSbnFKaURO?=
 =?utf-8?B?QnE2N2IwbW9PWTBOUGZYRklRdTc1UTlwdHU1MGpzZDA0SDl1UU9EZDNvc0RY?=
 =?utf-8?B?ZGovS1VYYk1sL1RMSWlQWXhBOGlIZ0lZMUdWT1ZEKzBleDZRVFlNTmpmclk1?=
 =?utf-8?B?b3ZHWWl3OWtWaFhaaHFxVUNvZnF3eXl3TTNMSDJjMjBpM0NXaVRKcWh5aUFz?=
 =?utf-8?B?T1pkNUhTM1A0NExtdnljc08yelhKSkxoL3JNWkJjOHRtcDdWRHM1OWhUMXhy?=
 =?utf-8?B?bFYyaEJpcWFOUC9vbzlHTm9aZ3lBbTBlZ3BXT0luVTVGUmI4c1Yvem5NWWIy?=
 =?utf-8?B?TXk0MmJVck9ZMnlheUt0TXl3ZEZGZUh1Q1drUVFWb0l2MEcyaWJISXo3Qkxx?=
 =?utf-8?B?YlJ4N0kwTTBHVmp0dklNbVpxWjZUMTllYlNrcjE4SElIaUFoKzNWN0tyQzhl?=
 =?utf-8?B?RHluOG5yazlFUW9lR1MweCtZY1hkTVdwTXN1U3NPY3dvZXYzVUQvajA0WkY2?=
 =?utf-8?B?T3JzQ0dCRFNaQWcwT3JHNGZNNi9TaTJ3N01BNDJicVp3QkdyVzhmSjhBMFl6?=
 =?utf-8?B?N294LzZvOHd1RlZhNTZZTjZiU0NyM253VmVSbUVrbjZ4b1laQVZ6cThLWDlY?=
 =?utf-8?B?a05KNXI1Y2JlLzJXK2YvaVZqdkYvdUdEbHdMbE95dWREVVg5eEh3RWRxV2tv?=
 =?utf-8?B?cjJPaEtpbTEvZTFwSUFrNkVWUzYwdUFvUnFxbWt3WUt3cjNXbTdBdkVreUFq?=
 =?utf-8?B?Z3hCenN3TS9BbUgxaUZMdHdXSmhXSVIyMzl4Mld2NjdxTlpLVDgxYXg4TEEx?=
 =?utf-8?B?SXBBNkEwRkZtRkpkTU0xeFpycGltcVF3eS9MaWk2cUJWNzk1RDV6bXdjaUVi?=
 =?utf-8?B?NlNINzdEdXNhbE1iSktNb3RURXNRc0xVRmlpdW80SkxkYVpaRlJjSnl1K3Ju?=
 =?utf-8?B?MzVGNVJWaEdKczh1Wkw3MnZsdVBRV2ZTVzJMQ0FOQXp0aU1oTkVzVG1FT2ZG?=
 =?utf-8?B?TWRWQ3dVOWR2UjJZa3FvOFR1V1RTK0FSVm5pMkRFR0NIVmxPZU1HdVFueGtv?=
 =?utf-8?B?T01RRU4wUWM1VEU3V2ZmTnR2MzNaWXZSNEJvamZBN3NBNStWcm9UZHFJc3k0?=
 =?utf-8?B?Q3VGTS82SGFhcGJWVVF4Wld4Tng0dWloVkYwREoyS09TTjJEZVVXUUFJdnVF?=
 =?utf-8?B?ZWNMVGVxYTRVNUpRVFp1bFBncTB5TVhkdU5wUmZUM1daNU1DbXBER1o1aEdk?=
 =?utf-8?B?M1lIZ2djaGtmMC8yd3E5L2c5RWEzMG1Nd0lSUzhVN0pVLzA2L01RNndUMTlT?=
 =?utf-8?B?clMrbzhaeEhhYTMrVCtkeS84dmlxQ2IwS2ZEdU0xaDlORzhzRlJyK2x6cFIw?=
 =?utf-8?Q?O92BuGZBfhpNwSTqjunOLomSU+lXpHRB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTlJZGZ5R1FpazB3SVI4QXpxNkRJajZ1dmtZc3ZzSjZoZURSQ2k4bjZtUWZy?=
 =?utf-8?B?TWpYSERyTDlIYkc1MXJ2U0dMYWZyWW5mVlNkRUF6RFVJWmVHbzIreDUxZUZ0?=
 =?utf-8?B?ZGhXdzdFSTN2Z0ZuRjZCbUFQTTNHU3N1V0Jvc1VZS3dibDFsOVQ0QitjUjZH?=
 =?utf-8?B?R0xKSFJxZDV5NldwUm5RbTZSbVlCV1pVOGVONm1CcEhiNnUzOVA4U2srOTJs?=
 =?utf-8?B?QURwSTcxdUQyc1gzcTk4cWJOU0gxT3hqak4raTlDbzN0UGl0dGR4bHEwSURr?=
 =?utf-8?B?Y2x2QUp3ZUNyZTdkUmpLN3A1WldxSGRTaWRtR3ZWYmFmckViRG9Qd3o1Tjk2?=
 =?utf-8?B?T21ZM1N3bWF6V0FOTmlIMDR5NWhZdGhpd2QycSs5TXdKTElaa3ZlVDNTb1Fu?=
 =?utf-8?B?eGtRYUtXZmRWUkRTNTZIRGNoK09xV3hiVTZ2cWtKUndUenZrZERPSG5VS09Q?=
 =?utf-8?B?VDZIZ0ZFMjNpYW45eEVQaDZsMm1kYzN5L2EyNm1tRmRpbVd0QVkyQ0hIZ0Zu?=
 =?utf-8?B?d1YydmxiYWdRVE00OXBNMG5oY3lyTmdhU0RqMWVZYnpSbzBxOXlNSXhjanhG?=
 =?utf-8?B?MXlBT1NCMWd3TDlxR3I4RzNoU0RGcVpRTFlUTDc0OHZFK2pJb2x6MTYvU1pN?=
 =?utf-8?B?amtCcm9RamtjTmcrVEFZZS9meGJVTjIwVE9LRlkrUzJmN3p5Wm1KT2g5UWdG?=
 =?utf-8?B?RVNVQ0t2bDBNaWo4N0IzWFV4Y1JHeWlhQms0SzhsbW9JUG5OaFAxdmpNK1JO?=
 =?utf-8?B?WlFNQkRyS3ZweGZqTm5QSXlPeU9EYi9SRnVpbHFMNUFERXFCNHY4K0ZrNHZ1?=
 =?utf-8?B?OFdiYThFOXFBSlFlZlJaWjIraU43RTZXalpqcGZ2ZG5RTnBkOEx3ckd6QkhF?=
 =?utf-8?B?emFSWDh4aG9MeG5VWXNueUk2YzBQVkJWZVRsZ09CUkx4Sy82T0VtcnBqV0l5?=
 =?utf-8?B?alcxS2RGcVdxUWUrMzh4TDdnL1djTzlrRkt1aXpkVWlQSVdkT1drRjNVRW8z?=
 =?utf-8?B?QzFXZXhtMlJZV1dLT3BpdFRVR2ZscjdibHRQSTRiemtjUHhWdjFJWW5xcjNG?=
 =?utf-8?B?Zkt0bVh4TW85QUVNK0dMaGpyQXQyNUw1TkNZaUFuMlFiZXNaeExXY3ZMc1Mr?=
 =?utf-8?B?ZDNNcm5PUlZSWVJ3VVlpL1hSTjRGdi91QTA2VWZiWnVnSFROamZ3TVcvSTJS?=
 =?utf-8?B?Qnk4TVhOT1ZBelVEeTQrR3JIUHRhVjVvOXVHaHZnL2s5SHdJYzZ4cEFnUGha?=
 =?utf-8?B?cGZTOHNrbHMwZDZDQ05xaHhKUWp2ZmNkc2JnRkxhVU8wNk1mQWVZd3Brcnpu?=
 =?utf-8?B?dnhSY21EeEt4V01NQWFYWTlWMllFYUx6WFNTcGs1RkVlTmVZTm9QUytlakN4?=
 =?utf-8?B?OGNqSGJ3Ny9ISDErR2FYc0N1UEMyU0JGa2RDcW5aRWFtbHFGenRxTU5tU2pG?=
 =?utf-8?B?N3hPVHBpNFpNejgyRlBXekc2dllJVmp5aUZIeUNlcy9RVWltbExmRG5uZi9O?=
 =?utf-8?B?d3UvdDFQVGliUHU3WUQ2WUJmd21pc2V6WHd2cU9CR2Q0ZXFzcUZQc3ZTb2hV?=
 =?utf-8?B?bHV6RzFNN0w4OHV1MXpjL2xwdDlyeWxYRGJsK3JVYUFOeUNCRG55bFBlZkh0?=
 =?utf-8?B?d0NjcnRoQzhReVFCODVxQkd6VG1KREY3SkgzNjI1MFJpTWRBZENQNWk4clhH?=
 =?utf-8?B?dHFUTXU5VlBIckVpd2hnMkxoRmN5M2EzQmVJeWF2alJIUU81NXFtWmZaTEpy?=
 =?utf-8?B?b2Z2ajcwSkZpR05xTDNTdkVkZG5HNTFSVFVKbjgvV1l4MTVzY0dvU0lmZGFt?=
 =?utf-8?B?RjhVVVdVT3hJdnp5czVESUJOWG50eU5Ia3U3Q0kwL1FndDBkZk5wMEQ3N1hq?=
 =?utf-8?B?ZWJiTDFwVllYc202dUlDdGs2Y1FVWHg2SFppRURxOXppWVk3ZzFocFl3aWd5?=
 =?utf-8?B?Zng0Rm1DTG9YTmlpYUsxdm1oMXVHQWVsS2JQTmZlVjhwRmt6VmRkaVFadU5q?=
 =?utf-8?B?cTl2bjhNbUhsRVNpTHNscUZtclYvZ3dKWER5SWFuSDNPYXBlTnlzQTJyQVFX?=
 =?utf-8?B?SnkyU1crL3IrT21yQmNzRHJzU1BweG1UL0p0Tjh6TkxvUzFscktCSTdwN0FG?=
 =?utf-8?B?UDg4Q3ZCTkFNQjZXdlFRODVOMStIbHN2YVpaVllVdmJRRE8xbEdBc3dRTjZY?=
 =?utf-8?B?bkdLOHoxZTBFa0QwbndvYksrUG1DZU0yMkRqbGd2WWhQOEJ4VnR4RXlmY0dx?=
 =?utf-8?B?cFEzSzE5MjU4ZmJEKzRzeE82MmRnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219e351b-e03a-49ed-bb02-08de00bf6108
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:51:50.2506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ps+jCi7bQ/zazn+UGfw8Fq8tnXq0D7RacsoRHEkk4F/S3MaDljZ60im37t3KJHDCsVAAa91Imxcicvcopc/zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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

On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:=
07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
7:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote=
:
> > > > Simplify format align calculations by slightly modifying supported =
formats
> > > > structure. Adjusted U and V offset calculations for planar formats =
since
> > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes f=
or U
> > > > and V) so stride is width * 3/2, but offset must be calculated with=
 plain
> > > > width since each plain has stride width * 1. This aligns with downs=
tream
> > >
> > > plane
> > >
> > > > behavior which uses same approach for offset calculations.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++--------=
----
> > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/=
staging/media/tegra-video/tegra20.c
> > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_=
format *pix, unsigned int bpp)
> > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA2=
0_MAX_WIDTH);
> > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA2=
0_MAX_HEIGHT);
> > > >
> > > > -     switch (pix->pixelformat) {
> > > > -     case V4L2_PIX_FMT_UYVY:
> > > > -     case V4L2_PIX_FMT_VYUY:
> > > > -     case V4L2_PIX_FMT_YUYV:
> > > > -     case V4L2_PIX_FMT_YVYU:
> > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->=
height;
> > > > -             break;
> > > > -     case V4L2_PIX_FMT_YUV420:
> > > > -     case V4L2_PIX_FMT_YVU420:
> > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->heig=
ht * 3 / 2;
> > > > -             break;
> > > > -     }
> > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > >  }
> > > >
> > > >  /*
> > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct =
tegra_vi_channel *chan)
> > > >  {
> > > >       unsigned int stride =3D chan->format.bytesperline;
> > > >       unsigned int height =3D chan->format.height;
> > > > +     unsigned int width =3D chan->format.width;
> > > >
> > > >       chan->start_offset =3D 0;
> > > >
> > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct =
tegra_vi_channel *chan)
> > > >
> > > >       case V4L2_PIX_FMT_YUV420:
> > > >       case V4L2_PIX_FMT_YVU420:
> > > > -             chan->addr_offset_u =3D stride * height;
> > > > -             chan->addr_offset_v =3D chan->addr_offset_u + stride =
* height / 4;
> > > > +             chan->addr_offset_u =3D width * height;
> > > > +             chan->addr_offset_v =3D chan->addr_offset_u + width *=
 height / 4;
> > > >
> > > >               /* For YVU420, we swap the locations of the U and V p=
lanes. */
> > > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YVU4=
20)
> > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struc=
t tegra_vi_channel *chan)
> > > >               chan->start_offset_v =3D chan->addr_offset_v;
> > > >
> > > >               if (chan->vflip) {
> > > > -                     chan->start_offset   +=3D stride * (height - =
1);
> > > > -                     chan->start_offset_u +=3D (stride / 2) * ((he=
ight / 2) - 1);
> > > > -                     chan->start_offset_v +=3D (stride / 2) * ((he=
ight / 2) - 1);
> > > > +                     chan->start_offset   +=3D width * (height - 1=
);
> > > > +                     chan->start_offset_u +=3D (width / 2) * ((hei=
ght / 2) - 1);
> > > > +                     chan->start_offset_v +=3D (width / 2) * ((hei=
ght / 2) - 1);
> > > >               }
> > > >               if (chan->hflip) {
> > > > -                     chan->start_offset   +=3D stride - 1;
> > > > -                     chan->start_offset_u +=3D (stride / 2) - 1;
> > > > -                     chan->start_offset_v +=3D (stride / 2) - 1;
> > > > +                     chan->start_offset   +=3D width - 1;
> > > > +                     chan->start_offset_u +=3D (width / 2) - 1;
> > > > +                     chan->start_offset_v +=3D (width / 2) - 1;
> > > >               }
> > > >               break;
> > > >       }
> > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_o=
ps =3D {
> > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > >  };
> > > >
> > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > -{                                                    \
> > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > -     .bpp     =3D BPP,                                 \
> > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FO=
URCC)      \
> > > > +{                                                                 =
   \
> > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,              =
     \
> > > > +     .bit_width      =3D BIT_WIDTH,                               =
     \
> > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,               =
     \
> > > > +     .bpp            =3D BPP,                                     =
     \
> > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                   =
     \
> > > >  }
> > > >
> > > >  static const struct tegra_video_format tegra20_video_formats[] =3D=
 {
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > +     /* YUV422 */
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > >  };
> > >
> > > Looking at the code, BPP seems to only be used for the line stride (i=
.e. bytes per line) calculation. I think we should just make it 8 for the p=
lanar formats (possibly with an explaining comment). With the current code,=
 we end up with 'bytesperline' variables in places not being the actual byt=
es per line, which is confusing.
> > >
> > > Actually, we can then just make the 'bpp' field be bytes per pixel as=
 it was before to avoid the discrepancy with Tegra210.
> > >
> >
> > No, this code is actually cleaner and in sync with what downstream
> > does, Tegra210 bytes per pixel is confusing since it totally neglects
> > formats with fractional bytes per pixel, it is impossible to set there
> > 3/2 for example, which is used by YUV420.
> >
> > According to downstream code bytes_per_line =3D
> > soc_mbus_bytes_per_line..., downstream directly name is bytes_per_line
> > and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
> > calculation (12 bits). Meanwhile for planar formats Tegra has 3
> > different buffers so with offset calculation plain width must be used
> > (which matches downstream).
> >
>=20
> If you mean use of BPP by VI, I can propose removing bytesperline and
> sizeimage configuration from VI entirely and leave this to per-SoC
> fmt_align function which does this already anyway and guards every
> time those values are referred. This way there will be no instances
> where "places not being the actual bytes per line" comes true.

Without trying myself, I'm not sure what approach is the cleanest. In any c=
ase, the downstream code is just wrong (or incorrectly named), so we should=
n't defer to it in this matter. I don't see a reason to keep the value '12'=
 either if it doesn't serve any purpose (admittedly if we changed it to 8 o=
r 1, 'bpp' would be a confusing name for it, but explainable with a comment=
 and improve-able later) I don't mind having an if/switch statement for the=
 planar formats to use a '8' as multiplier instead of '12' if we need to ke=
ep the '12'. But the main thing I want to avoid is a bytesperline/stride va=
riable that isn't the line stride in bytes.

>=20
> > > >
> > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/stagi=
ng/media/tegra-video/vi.h
> > > > index bfadde8858d4..5cbc0606ed6c 100644
> > > > --- a/drivers/staging/media/tegra-video/vi.h
> > > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> > > >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> > > >   * @bit_width: format width in bits per component (for CSI/Tegra21=
0 only)
> > > >   * @code: media bus format code
> > > > - * @bpp: bytes per pixel (when stored in memory)
> > > > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > > > + *    bits per pixel for Tegra20/Tegra30
> > > >   * @img_fmt: image format (for CSI/Tegra210 only)
> > > >   * @fourcc: V4L2 pixel format FCC identifier
> > > >   */
> > > >




