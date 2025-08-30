Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E460FB3C6DE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 02:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3601310E0DB;
	Sat, 30 Aug 2025 00:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bEnIRgKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786910E0DB;
 Sat, 30 Aug 2025 00:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJiHWhbbEgrAVNg2QpffeUXMlNmM5Ul1udbQmUB60lUk1bepkQBEtZ0eXcXUh9NxaIzV9YXoO60z8KiIxWbD03wTYO/1JZgmD58n8sbLLHhFE/Qhw3ORY9+NBbwu4bVBXVFrgahzPuWzDqvGNjJNOEiu/MGw0iHfpWU/HTcgD9DsIKa2gJG0f/D1qMcAjThFmElC873EZ6Dz/i+LxP9Jt1xsELBz872PhqYGKZd6ObXwUh1Zb7qJzCPLq1zVkHFuMA3zp+SofmBpsTa16r92rxL2NHa9VQ+cDDAC0CPFPMVOSCo3hxc+Neh9C++l2xH8j/nyhTk6HQAUoNQ/DGMwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8FrJhv/dWPJg2SnGmhDYqMC1HmYaOngV9olbJhn+sg=;
 b=nN2pK/JBMAPm7y8QKVWcm7YEY4isi7542WulvsTLd4bXoBZ6byyjB8Fs+VrYN9wJv5HiAEf8EY/l+6rX0sYgqCGsfLmp6p1Rn0d/dil/G4Nr3q1xra+uckbql5V7eN8d+eMRaA9wp4BiqJmHTkuwDHeG7rtobd2OuPJlIIJnN/e2rysmXqOUgrtcaOkMEXak2C+nRmsTZ7dNZUMLUmFkB/+yIpAMi0DlLRIc/3ALsXecov3a9djeFTH1H9M7olGoGP54SsRYsi+bHKIURU6rSw2h1cqZygAhEVVj4qlXDaeqQtres/SpAN+w6fzTuQciPHWFfB81/1fnROFDyhmjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8FrJhv/dWPJg2SnGmhDYqMC1HmYaOngV9olbJhn+sg=;
 b=bEnIRgKuKsuGqWxBtXxYu0sjRrZytMkIcrvOP55aTbfESSABDFRbGjUhbf520C4dwPjOnqJEh2i4TOZmYtXP/iGvDT9xi1p4XJ+GYhfJu1rkXNrryGj/nv8PNWr1tMiumML6t2wswIVolf0FDw6PJUP4otxy365t1w/PTd87Gwt5Ia3E+j8DwlKTiocvJfYJPoZt294vlBSTC7pUWG6Kq+3uhQAh5gRzP5xjj13s5mJRts+kUqTr68TL9RbevjYIJesISqcz9HrEt55PAi0kILpi4KeZAA0KPfFikqt542E6hG584kooCKOa0WI+rcFdK6GZz58Ayjz5CCmemoQDcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 30 Aug
 2025 00:59:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Sat, 30 Aug 2025
 00:59:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Aug 2025 09:59:13 +0900
Message-Id: <DCFCSPF1PTLT.2A4LKV4TAF0JU@nvidia.com>
Subject: Re: [PATCH v2 8/8] gpu: nova-core: compute layout of more
 framebuffer regions required for GSP
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-8-93566252fe3a@nvidia.com>
 <e091c6c1-98f8-4876-b2f1-c928da7aa7eb@nvidia.com>
In-Reply-To: <e091c6c1-98f8-4876-b2f1-c928da7aa7eb@nvidia.com>
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc15d2c-68eb-4db6-a9b2-08dde7607249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0phVW44T0JQQzQ3eitjVktXMExQblgwaTEyTGRhVFE0Z2xDWU1abG5pM0ZY?=
 =?utf-8?B?VzF6dTBCYmd2aGpDcUNlRFZvRnpuMGtDR0tOVEdaYUtHYUVCMFpGRmRBMmJB?=
 =?utf-8?B?eGlTYkpWSTlNanJBbklrN3pzM0Z6aERRblY3b0VHRnpsK0gyMkRTN2d0L0J1?=
 =?utf-8?B?a3hrY0ZRNmlXRlQ4YUxDZWV1SDZPRmYxWGpVc0ZJdFVuamVVTHl0UzNxRUcv?=
 =?utf-8?B?VitmeUk3cU9qY01hYUI0Ui9wQ2dZY0dHZGVna29FNEt2ZnBvNzRtZWpLaXNQ?=
 =?utf-8?B?OGFwTEk1QlFQdk16R042SWlzTGhxRTFKeWZNbmJaeUZIeXZ5c2Z3bzJINE96?=
 =?utf-8?B?Vnd2SHNhNTRNeEMwZUkwWmZsS0FhVGtWblcxMkJRbDEzeVNhRFlydnB1QWhn?=
 =?utf-8?B?T2U1VWpYWmIxaGhUcDZlTC9rdEc0c2JiMWloQlg1Z1A2R1ZsemJhZVQ2OGJR?=
 =?utf-8?B?dlN3YmdDYy9RTjVwYk0xa0NFb0FKekpQWlNTZERRdTNtMEVpOXhrQ2RHSFRr?=
 =?utf-8?B?VTQ5MnVKYWR2T2xxa0dka1FPUElSUHlDWXBtMVozL0ROSDRJZ0dhUER5cFd5?=
 =?utf-8?B?MzZuZlBmK0ZoZzlmWHdTcXJuTVNpVjhDeUhOc3pBc243QWtDcWxVRDczUzI2?=
 =?utf-8?B?Y24zK0Y4Z1ZVU0diMlgrSnpOSUVVZHJET1FydkFHMFdXcDBqY0Z1dCtZdFlP?=
 =?utf-8?B?V1lhYjJtUE90S3BsTHBOVEU0eUpyR1FBSXJjWndaZmRobTcyUWZZTnUrdkZC?=
 =?utf-8?B?M01kUXhaRGJwMWJKbmlmNmpCdWJZaFRRa2hBRkVReURSYzhiMUhqVE9yZzg5?=
 =?utf-8?B?OHdwSGF6VlBLMWU1cFA1YUVMbE1DN1B4K3RjWTdHaWk1NHlFQVBZUFFlVHNE?=
 =?utf-8?B?d3hieWVrbTF4a2pyZmVkVlA2d3BTNW5FN3d2ZVVZa0FMSFpidWxwSWlvWllo?=
 =?utf-8?B?c05yc1ZUbVVMcEdZNmllSU1kNSt0cllEeG8rT0xBSG5rSTRWbzgvczVkNmhs?=
 =?utf-8?B?T1RaWDQ2K01HeHhzYzh1N2h2ZUJFNWJVQVFqb2VuTUZXQ1pmNnRUaFV5V1l0?=
 =?utf-8?B?YlZUNXpIT09xQnRBWXBHdjdsWUNRR0ZYNnR2ZnplTlppckQvUjdpLzV1dU8z?=
 =?utf-8?B?U21tdUMwMWI0TG1NMG8xSUMvK1ovL2tPMUZSSi9oOVJOOXhFbTB2Q0NXU2ZI?=
 =?utf-8?B?UDF6KzMwajBLUEI2dkZSRXEvc2hua2piZWdWMW5takZEbVpyUkNGeFZvTkhY?=
 =?utf-8?B?YkFkQmI2WUNJNVYzZnJpazBZYW5FSGFnTkJwZ3pwM1c0MGJTNEM4MmtTN3h4?=
 =?utf-8?B?eHhHUklXalM0Q0FOcGx5V01OY1hjQTlCWWVEdlFZODl2ZTgxYyszK1ZCaWhO?=
 =?utf-8?B?S2N2bXFIUjRKaTU4aDJPbnNGODQ1VU40Tm1yV25zMjZZRVQvTHJpNU9LbVRW?=
 =?utf-8?B?ZENCMStnaEQ3WXhucUtzVGdaMEc1WHN1RFEvSHR6SEN0YS9zSXJBUElmaEFX?=
 =?utf-8?B?bXFoUE9DcGJ2QWlXTFFoSGY5YWFybXlLRGZ0Q0xMQUJnU3JPMzRyYWMvZXhL?=
 =?utf-8?B?RkYxZEtpV3plR1BaQjNRcUNPK2srVlMvVDAwQndLV1plWlpTaWhUZ2pJWVJs?=
 =?utf-8?B?aGVlSjc1QlQwYW9YMmpGd0xZWm5Jc3YwZGhYRkpDZDRXenpmNDhuNmRaMFFG?=
 =?utf-8?B?NUFyeEFCL29GYUwrMXBqVTViMWxsaW41cUREMThQYlpRLzVHcTErRndTdVJi?=
 =?utf-8?B?MGJSeHNlV2lnMzBJekdLRkFtUnRiRGJobmtCd1BsM2JtUlJ4dU9YcWRsai83?=
 =?utf-8?B?ZlBrYkJBbllLVFI3OElJVG0yNitnNTBCb3luMGFaU0VXbzRQczNWTjVvQnB1?=
 =?utf-8?B?NFljRmcvelN3UFhKNGNuTlhpTUFJZW9pd1ZRUXZJUzNoQ2h6K21rdXJxTnVG?=
 =?utf-8?B?aVJoMU1BZEk3MWR0Uk9BbmZoUHdPc1phVWo5akl2WXdlWVpkMzY5VFZ4N1NE?=
 =?utf-8?B?OGJKNkVNWWlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhoWjBwcVZQdGc0ZmJqamZuV294RjJhdTZmczcwbWlZdVVTTko0OTNuYVlQ?=
 =?utf-8?B?UGR3UTNBYkp3TFV6UzY0c3d4SDdFL3hObHJqNmxIZi9GYVFmSnZCcEdyZnVj?=
 =?utf-8?B?eWdFemNpaVlaU2lGWm90VEZoTFI5UUJQQ29TckVkNDE5R0FwT0ZKN0tiYzQy?=
 =?utf-8?B?dWpKanZ2Wnp0cFMrSjBtTUNqTjRBZ1U0RnA5QXA5MDg4VHhDWXRIZk9NZGhx?=
 =?utf-8?B?K0ZWOWdrWVp3Ti8wS3JhTW0xZC9rd3lEczFWZStNN05vK1RLb3d2TnF3ZEcw?=
 =?utf-8?B?MlZXQ1VEa3JTN1RrMXp1SHYvQ1JRT1ZjYUZUay9iemcyOURaVElHVkM1U0cx?=
 =?utf-8?B?Y1pLeTVycU13Ry9hSEpuSVRka0hDdFBXWTZvYkVZZlMvc3pjb0EvZk1UQ3dQ?=
 =?utf-8?B?bTdsbkFOUU9EMVNmV2RGRk1JSk15aUtTYWkxcy93YnhJQmFHSHlray9wL0tH?=
 =?utf-8?B?SUVPaHVtTjNJY2MxZ0JiRk0vRlRJbEFpamE4bTFnWWc3bWRhMDJRN3Z6RlFt?=
 =?utf-8?B?djhDdm9RdUg1S3U4eUZ6RHhZNzBHd3NhL05RTWVYYTJlVUZtMGZQVnNNbUdS?=
 =?utf-8?B?ei90RGJpak5XWGxhc3hlcUNaMG1IMGlCcGFKdTdSNXgxSWJFTzQ0OHlXNCtV?=
 =?utf-8?B?N0NxdnFORmc1WmpvNUFhUVBtRkN1TTd5TzRSUENiTHp0SmhySytseCtPb3lU?=
 =?utf-8?B?SlRCWGxra1pEdCs4NERxa1V2VjJHVUJDRDA5SkxJQlduYW5ETDBTRGF1eFl4?=
 =?utf-8?B?NGoyY3Vvc2tRRk5KSjJGZlRWS3llenEycU5TV0RyMFdKaEpZa2FNVE45b0cy?=
 =?utf-8?B?Q050RWM3eHc3OTZKT05GalZSMGE5WVVpV0gvQXQzN2M1emcvcWRXM01UR0M1?=
 =?utf-8?B?Vkw0TUwveUZ0OG9sZFR2eXY5SEJPNHY3NDljeEtveUNnenl2K1lrUFU5eEJw?=
 =?utf-8?B?YlZpU005Z2RKRWhRQTYrK2duaVFxZm8yOTJYRGVWNjZHTzlrSDA2dlhVTVVT?=
 =?utf-8?B?d2FqSmkxc0dMd2NPM1JsWldGNklaTjNDWXhMZ0t5TEtSTTl4c0pLLzdmdW9m?=
 =?utf-8?B?K1lQU0VCa2R6NzNkZDVaUVlCWk1JRGdBUm1zelV3NUFaVzlVcmRYMjltY1Bu?=
 =?utf-8?B?V2kwTFY1cytuQlc1c3BzWkhXdEZKYmt4VjQ0L2srSTRzRzJNVjlQZnZWT2Ny?=
 =?utf-8?B?RXlTVFIwN0NTR1g1QmZhY081d3dMem45eHlaU1FHclRldWIxREM5Q2ZTM2Fo?=
 =?utf-8?B?cnBIY0ZxVER2aTUyc3JVelp6c3UwbnhjOTdKREhsd2hXM2hxTXB3TlkvdHFk?=
 =?utf-8?B?a0QzanhTWkhRNElodWFVMW5iQ1JkSnVxZTlZNlc0cm5kZnkwUjZSeFJaakdm?=
 =?utf-8?B?UlVTOVA0eURTYWNYL3ZpVVBwRjF2LzVTNFBZMjYwTnZjcTg0bmtRVDhtSFE4?=
 =?utf-8?B?QkI1VFMzT25KU1Z3bG9VTGZJMEFEY3ZaNStGdnMwbURUenFSVlZhc0xIallx?=
 =?utf-8?B?MmVHckdPenF0R2VuMVpoNFB6STdNMWpnczd5eGEyY2pPdjdRNmRnVk5zOEtD?=
 =?utf-8?B?REVHcVdoUVB4eEVzYTNDTWRSRm9paWJKY2lJQm5STHdDVXh6L252cW50SmY4?=
 =?utf-8?B?TFgwYk1DYWtuYlBqK3JWNmpDVUhmUzV2N0RybDZhWFlMVlZxd2NvendDQS91?=
 =?utf-8?B?VmlvZXo4V01QK2lHaENTdWtMaXI4aXhLUE9IOHdxWXNxd1ZhaCtMcGxKUlJR?=
 =?utf-8?B?N2xJbkxpTUZNY2lwRVNFV0NDdExKZTZTaEdWS05FSE5IbUV0U0ZJUTBNVHpv?=
 =?utf-8?B?L3Q5Y2FTVE5yS2VDc0FVVTRnbEpEQXVqZUtiRWNxeHRRU2cxajN5c0FVYk1F?=
 =?utf-8?B?a1V0WHF3dFBMZ1JSMUVHS3NFcnFTWnhtdGNBZFdKUnpQMFo4V2ZlWEpxUkVK?=
 =?utf-8?B?Ly9rWkpoRFhDNGZ6MHIyVjFoRm9EbGJVNEZtZEdQcXYzRHlKM3R6LzU5cy94?=
 =?utf-8?B?aHVibkJ2cURqWTZFR0s4RWFRMHYwK2NTY0taNXJoTFM5dU5UWWdFWGh2Q0pa?=
 =?utf-8?B?V3hTM0N3OTZzSTlqeUlzUi9kamhNVXlUeEgrZlZla0FXdEozanJtR042eEdk?=
 =?utf-8?B?WXNabERidHlJTEo1bEJhZmF2RWlwRXJJQXE0YTF0N1Z4MTZZZWZTUDBGby9a?=
 =?utf-8?Q?rWe8xN9xooHvP0NjWs9iGrOOPA/LrF7m/P0KY16PrOf/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc15d2c-68eb-4db6-a9b2-08dde7607249
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 00:59:18.7807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFQfA1i6LPhmkGM4UiXE+gU+o0JGdqDXVInaVL4WOyg9796mV481LOBnMfOJS9em9+AGqnFA96Pn8trYgehtaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368
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

On Sat Aug 30, 2025 at 8:30 AM JST, John Hubbard wrote:
> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index b0e860498b883815b3861b8717f8ee1832d25440..a3eb063f86b3a06a7ad01e68=
4919115abf5e28da 100644
> ...
>>          let fb =3D {
>> @@ -138,10 +202,54 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) ->=
 Result<Self> {
>>              frts_base..frts_base + FRTS_SIZE
>>          };
>> =20
>> +        let boot =3D {
>
> A few lines earlier, not shown in these diffs because it's not part of th=
is patch,
> there is a closely related TODO item:
>
>             // TODO[NUMM]: replace with `align_down` once it lands.
>             let frts_base =3D (vga_workspace.start & !(FRTS_DOWN_ALIGN - =
1)) - FRTS_SIZE;
>
> ...which I think could be optionally fixed now, and added to this patch.
>
> Or it could be done later, in a different patch, but it seems convenient
> to merge it in as long as we're here, and using .align_down() in this pat=
ch.

This is taken care of by the series adding the `Alignment` type:

https://lore.kernel.org/rust-for-linux/20250821-num-v4-2-1f3a425d7244@nvidi=
a.com/

>
> ...
>> diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.=
rs
>> index 7c5baccc34a2387c30e51f93d3ae039b14b6b83a..11a63c3710b1aa1eec78359c=
15c101bdf2ad99c8 100644
>> --- a/drivers/gpu/nova-core/nvfw.rs
>> +++ b/drivers/gpu/nova-core/nvfw.rs
>> @@ -1,3 +1,42 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> =20
>>  mod r570_144;
>> +
>> +use core::ops::Range;
>> +
>> +use kernel::sizes::SZ_1M;
>> +
>> +/// Heap memory requirements and constraints for a given version of the=
 GSP LIBOS.
>> +pub(crate) struct LibosParams {
>> +    /// The base amount of heap required by the GSP operating system, i=
n bytes.
>> +    pub(crate) carveout_size: u64,
>> +    /// The minimum and maximum sizes allowed for the GSP FW heap, in b=
ytes.
>> +    pub(crate) allowed_heap_size: Range<u64>,
>> +}
>> +
>> +/// Version 2 of the GSP LIBOS (Turing and GA100)
>> +pub(crate) const LIBOS2_PARAMS: LibosParams =3D LibosParams {
>> +    carveout_size: r570_144::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
>> +    allowed_heap_size: r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_M=
B as u64 * SZ_1M as u64
>> +        ..r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ=
_1M as u64,
>
> We only support one version of the firmware. And in the coming months,
> that one version will have a different version number.
>
> Given those constraints, we should simply remove most (all?) of the "r570=
_144::"
> namespace qualifiers in the code, starting here.
>
> That way, we get:
>
> a) A small diff, instead of a huge one, when we update to a new firmware
>    version.
>
> b) Shorter, cleaner symbols everywhere: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_=
MAX_MB
>    instead of r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB, for exam=
ple.

`nvfw` is the module that is supposed to abstract the currently
supported firmware version - but in order to provide this abstraction,
it needs to refer the items in question. :) I don't see how we could
avoid these qualifiers short of having a `use r750_144::*` which could
result into name collisions.

But maybe we can do a module alias to reduce the diff once the version
changes:

    use r570_144 as fwbindings;
    ...

    pub(crate) const LIBOS2_PARAMS: LibosParams =3D LibosParams {
        carveout_size: fwbindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,

Is that what you had in mind?
