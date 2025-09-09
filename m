Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C14B4FEEA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B8110E140;
	Tue,  9 Sep 2025 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bDLlOnY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF910E00D;
 Tue,  9 Sep 2025 14:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smc5Mo0vSzYBSECVW6WwaQpSS8HzbgSODlfG8lAH5zejLU/uLxPG1ru52y+5iMqY/11X3wKvYlDfAMV4NQ4PAf4uxTGi4t4pBB/1GWgrbmO1HQ2Bm2cASA7uxy3F1c3YjlxkmIGFKwHp7QemC1gIl6N+RXZ/EwhJfYj2y+NlA0Aa9xV2hfgr8q/N9AYde2iV5s+Onpz7lQbm4yE6aCeOy6iJWuaTsCm1+WUnesS6Oftasf/0ddFAIJOAaWaVNOVG+dr+83HqgXejMELr1tgB4cipmPIvZUvsPFIf8L139XeciEZnlZ4s2Yv5FdVivwrpFrgBxnIbwnbMquu6qP7jyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1evwZFxfF0/I1ikkFFTYvoB3g5orZCacX+lHV0HrvI=;
 b=uv0Mofr3RXnJrivcLfQSjlfaw1ntkEhO9SS0KeUU5yGGrj8vazd2t8uLWGQHbtTg2ZN9goAinP9CoqbNHfFxbH3r1yFwslJ7Mlxsb800mpdf1+liUu4cCZhXSJ28Z9sQ1UGtkINn3yBR5cE34TW+f+WMyiGx20/ZFNY6iNHxRlAIidGHeWV6JDtK6XISZaUNII9Jx/MQItf0bypj/F+7Ao7UEBoE++PqTDGx9OXk9MKP84NF/N1Xv4q+8PYbC8EZPC4Qo0YZKgOw8WaCKsh0MEgEnBJEEw6ACduAg10V3rFX2izbvDkugsJpWMTKPjROUm1F0zgvYtkP8RgqQ/gFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1evwZFxfF0/I1ikkFFTYvoB3g5orZCacX+lHV0HrvI=;
 b=bDLlOnY5dPoFToSzyUBMtKs9EoPjB4vzuRu0tipwVa6iOAv0bdLZd4cLIvs22wAff4c3pI4HsPeHPWVHBQO7Hy9SkvqTW4atLJ0MiojqwAe+CCCu19NAolvXx2JBZeHD400LVIFDWmXpWTfV08sDA2piLQ+qGqrsueHre60Fc2gqCQW8xrHTIMFq4k82BYgxQrWJ0mkDSdhRsewNFCggaruUHDyYDfa8GQkj30E6XwMtDMX05OzvTtw5F3EZqCfWfTmwnx7QyBSc80A84gKI+hig0GISKElv0Kb3tNP37tSHPL467wJnw3uUsV4Tcqyu9/3Z6kol8MMawPDaon3Q1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:11:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:11:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 23:11:02 +0900
Message-Id: <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
 <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
In-Reply-To: <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: f90619e8-534d-45e3-c0f0-08ddefaab78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkZJcmk2T3BmbFBBZS9DVlhVQTQveTJ5aW5PQy9EaHNYcnora05ZYnB2S3NM?=
 =?utf-8?B?T20xdS9XUTFWa0h3a2QxdHh2eThLdkdKcE10NGg0cHFXZXl5YzZudk1TeFpy?=
 =?utf-8?B?dUxoamNDUFl5Q3JXTG80OUJsYTBzeFhha1pqTmpZOFB5QmVRekRVNlZWTFgy?=
 =?utf-8?B?M1o3UURteDl1ZTZ5TjYwU1ByQVN2V0Zxak9CaHlJSERURkNiaGM1YXNMckha?=
 =?utf-8?B?MHZXb2o5aDh0ZUd0dFlUcVlVVmxUWEFrZlMrSHpIT2lDWkpmemxoMlhVMzdF?=
 =?utf-8?B?Wml3aDlMMDRVeWVWRlRTc0tDYVYra2VoM041aVY0KzFvNzlub2ZaR2hKY3Iv?=
 =?utf-8?B?MHR3V3FycjdwcHdwcGVNZm5JdTJHcG9mbkY1L21LL3gxNEl0T1VaTlcxWllm?=
 =?utf-8?B?T1ltbW1tYzljbTY4ODhyUDJnVUFXQlNweHUvN0FxTXJOU3phUlVrdVc0UTR1?=
 =?utf-8?B?cGFscEQvbURMVVNPSU4rYVFqT0tydmV2LzFXbDU4czY5M1RvdGpLODBCNFdF?=
 =?utf-8?B?YlUrc0JRRVVvSVhSK2VHN25SS0tRc010WmFDR0tmcVVBSmtKemYxTXNrZzJi?=
 =?utf-8?B?eFU2K0ZaNlBUVVNNR2x0a01HcHpDaEFsTTJEZ3ZobGpoWG5pbk1EQ0k5NzNF?=
 =?utf-8?B?T0xGc01UbWFkRkYvVjJVaDdpeUNJZWErOU9ra0lyZzZaMkN0ZWhEUEFFMWdF?=
 =?utf-8?B?MkhqMGRPSkd1SXhYSVY3OUYrcmNXaldUdE5INWMwd2lQNUg3KzB2eVpFYW1i?=
 =?utf-8?B?cEpMK3pCdHlGRTgxSzMyK0U5NU1aeTl1SkF5em42UUFNREEybWt5UHUxS0t3?=
 =?utf-8?B?RkhqQ0tNNHc2R0J2WUp4MVA4K3hmQU1jTzVHVVh3bTBRUGJPK01hampWVDBh?=
 =?utf-8?B?Z3hUODZUNzU3LzU5cmZzTFBDOVFaQmFFaTk2NGdaZDlhdlJ4czBTQk96c2Ju?=
 =?utf-8?B?cWY1Ym01NktkWjIyV3owNWRvMzJGRDk4SCsxbEF4MS9pNjRXRlZMQ3QwZ0lY?=
 =?utf-8?B?UytQT3pNQXk5a1dtcHJtRDdaSUg5THlvUUZIV0tLaDRkbFY4dytwVkZRUHF1?=
 =?utf-8?B?d0RDUjVnaThCNlUvSlZPSERiTzdlSmdqN0FkS1JPMkc5bjFodDF3UHlDb1RJ?=
 =?utf-8?B?Mk42KzJocisxK2ZwYnZLVEQ5UVpqRFhxYXh1Z0E0UDZLWXBFL1J5VW5zZm12?=
 =?utf-8?B?UUZ6RWJMMUZlVE52QkttenpvWjA2Vmo2a0VkMloveXd0Z2NpTk1PbzJvSUhL?=
 =?utf-8?B?aHdPazdBOU1xMGY4MDBtZ0ZnMmZTUi9nV05MbFA3aGhTNXVXSG1salkvajhB?=
 =?utf-8?B?Yy9Dajd5Rk9UUk52aHdnNHJZKzdzcVcrMjVBa1VrM0pYK0JtZzU2dHN2RlZP?=
 =?utf-8?B?eGxwOGtJUlBYcTZob2JwRHBwMWUwRGVLeHdaRjRYZ1crUzZBR2ppWXB0KzZr?=
 =?utf-8?B?bUdmY1RpVnZjRDBmeDJsZ3NxWEpXYUVTM2ZtYXlDTllzUjJJczBpU2hMUlRG?=
 =?utf-8?B?K3Jzbm9kaXdRc1BybWErTmR4Ni9HUElwc0RwQmpORjNNMUgvVWVUaWMvTjAz?=
 =?utf-8?B?ZlVyM0QrTGxuMjNIdTZXQW9tZDlBVnZBSXJpQldHbXlsYWxXOVAxUzBQQXZx?=
 =?utf-8?B?cFZ3UVlUbEVFSFZuNzNwT2QwQVBxTFl1UTBCQ2Qwa0Q2VjV1K3lhaWxsUWh6?=
 =?utf-8?B?WERnR09zZlFlMzcxQm5EeHE0ckFsdllmOW5TMnF6NVdJRVNyTlh3aWVKZ21y?=
 =?utf-8?B?UGdyaFdnOWFEWXptM2lPekZ3ZlZ4d0g2WnFJUHZzMUl2bGYvL0tQSTd3bjdt?=
 =?utf-8?B?Y2MrTVdvWmtqMmRFQXVFUHlxQkpQUzhiKzE2cThFdTg0RmFMNS80UjkwYzQ4?=
 =?utf-8?B?TmxnMyt1U290T1RnMU5OeVJEQUcvSG5FSG1udG1qc0x4cjB3ZWQ4L3VIRVZj?=
 =?utf-8?Q?zhzV5YmYpBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm4rRDhzbFZzdE1ZL09idTRvaHVIZkhzNnFTcWlQQyt1WlczRFZ4d0lVemlQ?=
 =?utf-8?B?K3B3Z0dGM0lTU0RCN09yRXp0MVRuUFJ4UE1NRTlCa3FCQXkvMFNIZVcrMVFn?=
 =?utf-8?B?VG1kQnEvZHRNSGh3bGZYTzRnTFFudHM4YVhEd1N6OWhjOHU0c2cwQnJOcXor?=
 =?utf-8?B?QUl1VExaUm5oNTZMc0NqRzQ4aEVnQkxockt5ek1BS01oVTdZY0RGRVVMelNE?=
 =?utf-8?B?ZE9ST3kwNllydks3SW5zQXhpVmNNZnJic1RkejhJYzBHc3AybmdSNEZPWUZy?=
 =?utf-8?B?WVR2NEhETko1RVZUS3BjZW4yWW13cXYwN3ZaRCsveUlLTHR5anJITUxNMTNX?=
 =?utf-8?B?QzIrTFFRbkJrRnhCdzFRbW85MmY3N2YvWjVoZWtjQ25iM0srOHZZRnVDOFpm?=
 =?utf-8?B?RU9GQkQybll1VGVyL2sxdnk0TmtMSSsrVnBaV0ZwMVUxVSsvSC9tVGhXMVZz?=
 =?utf-8?B?My9MVmlpVjdBWmNVTEJDUzJzQXplb3NQOVVxVitPWkZMRDJCNWNJS0Nja1RP?=
 =?utf-8?B?UVJHUG9NalRVY2tkamtoQlFWcWtoZU4vdmQvZ2w0UUJra2ZDNVZ4SUt4cWVr?=
 =?utf-8?B?Vk9KRGJGTzBscGJEQ3BJQksrYi8rSTgweityQi8zdVZYT2lQa3dkVERRRy9C?=
 =?utf-8?B?WEUvZ1h0OGcxYkQ4cnZSeHh2WDFtajNJRjRLbEJiTGhXUHhoL0ZaMjZRbkpR?=
 =?utf-8?B?dERKQm9DSk45Y2FRUFJXMEhQOWhCTFRZdzVEVGpxRFk5dFNxcVFFNWZteXZ5?=
 =?utf-8?B?UGpyT2wraFhibkxWeW5wRjN3N0tUQys2M0lUQVZnMGpyQXYxT0xzWE9ZT05B?=
 =?utf-8?B?RjB0OUJlVHRvb2lLdlFiQ3BQUHdtQU5wZkM4czBJTTM3NDRDeDZPL28zdHZ5?=
 =?utf-8?B?TkxOYXhlSjdkU2Y2eUVMV1JteE1mRStIWUg1NzEzVjBLYzk5cGs2TGpZbjQz?=
 =?utf-8?B?WUNwdzBFMjFobzlMVDdHUVlwSzRNeXhGMWltSWEvZ3ppSFhjaUY4VkZNeTkw?=
 =?utf-8?B?TEh2UEtFaDhJTFR4NUJ6dEhyL2NNVDg3cDIxQkpyVC9IWjcxNGJITzI0di9C?=
 =?utf-8?B?TXpzRHVkNUpOV1JyUjFsdlpxVFVhLzAvRG9XZFJodUh2WGkxU3oxMDdvWVpm?=
 =?utf-8?B?d2V6VHp1OUFKWUxsMW8yTmZXekxtcEJBSEpIdVc0dHRWZndzNWRuM0FxcVo3?=
 =?utf-8?B?bnNTcnlXWEdlZGV2eVFKNG1NZVRnOE95V0lxUVJPM2VHOVEwOEY5NUFMSXVp?=
 =?utf-8?B?emQxVUtxVXk0ODF0WHE1QWM1WU85ZUl5TTVrN0graE0zTGlQRDVYbnEyQmRU?=
 =?utf-8?B?YkYxcXc2S2VoUEF4TnU2N3AvWTNBMFJDT0MzdDNhZGxGR085MmVpM0RENStX?=
 =?utf-8?B?aGlUL2RKSUJ6LzdkL2N2RzJTTE45cDlZdWgvQkwxbytHckF5Ty95Mnp1dlNi?=
 =?utf-8?B?bUNjNUQ0MGxlak85SldlQjU3LzRFMm50SjhBT3RRbnZUeVdsZU5MZkFwck9i?=
 =?utf-8?B?N0VoRTBLaE92Z2VNUG5qNG5oVmNBY1U5TG9NRThFZlVmN3NvaHg5RGp5Ylor?=
 =?utf-8?B?M29uSW5NWEhvNWxHa25SRDRSRTJZTVlVckpiY2FQQjBNRXRNSUl4eFVudXNt?=
 =?utf-8?B?TmxZYUp5bU5TUXY4TFVhZ3YyVkNkZ2oybmFYdnpKQWREeWZHWWZrejFuY2pB?=
 =?utf-8?B?VzBJODJ6VTIrdkVFLzlobUxPQU9KMjJtc3pkM2VjUjRhWk9rekZSRUswSHVO?=
 =?utf-8?B?QjBGb2VOOXRaNVRObU1lWDd6UG1mN3BYV3ZpcFA0WXJVekJ6b0pnQVU3Y3RG?=
 =?utf-8?B?elQ3blZ5MmtmZkdrZ2FuRGF2Sks5cGFXUElVaWcxVDlqeHRTcVoxZmZJNnJI?=
 =?utf-8?B?SThUeUMybCttcDZvZlJ1MnR3YTNhTVhuWEY1TlFxQ2F1Ujd4ZHA2ZUNnR3Iw?=
 =?utf-8?B?L3VhLzdJekg2K3NtbDl4dkFnN0lUNWFDSE13ZlNMT0lYbnc1Q251cElQbTZI?=
 =?utf-8?B?V0tPMENHQzZVb0hFRlZTcVBOU2pSUE85RERCOGh4NlBNVmJvTEpUSEVRZ1ZK?=
 =?utf-8?B?am5SVVhnU2h6NHU4dllUajFJdGU3WC9FZncyZ0prd1lwcGhNUDEzc3JqOTZo?=
 =?utf-8?B?bUNYajhjYytKSUVNVzB4eTdPcStzQkU3SWdVWEF4alRrajRRajhZTkJ3dWlM?=
 =?utf-8?Q?yuLszeubb8nrN79u+ssddmr7SX4miFFjcjW3nK+pkfTF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90619e8-534d-45e3-c0f0-08ddefaab78c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:11:06.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWKDSwgRTa4UcIsRdr5HQWTJ5OwUgsQD37rU6+Qd42P/U//fOBQVOIddat1HbLbweh2UOZ0pozIi0Ph+dsUs4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801
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

On Wed Sep 3, 2025 at 5:27 PM JST, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 9:10 AM CEST, Alexandre Courbot wrote:
>> On Wed Sep 3, 2025 at 8:12 AM JST, Danilo Krummrich wrote:
>>> On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>>>>       pub(crate) fn new(
>>>>           pdev: &pci::Device<device::Bound>,
>>>>           devres_bar: Arc<Devres<Bar0>>,
>>>
>>> The diff is hiding it, but with this patch we should also make sure tha=
t this=20
>>> returns impl PinInit<Self, Error> rather than Result<impl PinInit<Self>=
.
>>>
>>> I think this should be possible now.
>>
>> There is still code that can return errors (falcon creation, etc) - do
>> you mean that we should move it into the pin initializer and turn it
>> into a `try_pin_init`?
>
> Yeah, that would be better practice, if it doesn't work out for a good re=
ason
> we can also fall back to Result<impl PinInit<Self, Error>, but we should =
at
> least try to avoid it.

I tried but could not do it in a way that is satisfying. The problem is
that `Gpu::new` receives a `Arc<Devres<Bar0>>`, which we need to
`access` in order to do anything useful with it. If we first store it
into the `Gpu` structure, then every subsequent member needs to `access`
it in its own code block in order to perform their own initialization.
This is quite cumbersome.

If there is a way to obtain the `Bar0` once after the `bar` member of
`Gpu` is initialized, and then use that instance with each remaining
member, then that problem would go away but I am not aware of such a
thing.
