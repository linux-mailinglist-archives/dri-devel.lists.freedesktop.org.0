Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165BC0AAB7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 15:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1C10E2DB;
	Sun, 26 Oct 2025 14:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tIu88vv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B798010E2DD;
 Sun, 26 Oct 2025 14:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL5CNNN9IC89EAJ+d7kkVWshsn3XXEaj/yzP9mucJn8ieTKXT0n3n9URYRQoPUVIj4R6oKwL2X5KJZyNdHhjuyPHXBxg84FdFPnwqbzaHU1hV0A9tCEjYKSWGZtorOxP+GdXxIx/zRylcTSJ4SYcHfAohmWeG4fgwsSBLXeVdZKuNWRjBXwjkceoPYAcQvtDzt8DVLhmapw+HaDftbtPecK1UY+vNfB7pPkNqGcjHCPieF26aOaImu2OJTT/YMoMLNiW+MMqtG9Bo4ntKG5XD+SDgqh1S2g3vpo+gNvKuiAKeLYvUdm8CZzBLDRmJbic9fj20Z0FPLLFGL0yL9G4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG/xXq8FWgubj/qHAWCy2PnSABaqpIoyLMJwIYE3c9E=;
 b=vts3yBZ4Rbr+XVUd/avF2Ji8Uh7epI3HHaK3zsarOZ9Rp8/BR4/tkmhv42IMX9K4j82ym+zvtZBzQ+sAqqPgjW+dfnZUGyBFWigM0oqfhyNwBf7lrfz96ZX7qAmSZAXbPoRt6Q+r867zfTyHxR2E72fen2BvCTkeoRHq/xPPDDFzXAkix4JP0axuaG1gQ/UaRi/NwegrFrNg0vKMso+EJJQTmyG9OwVtjKOo/07Qj0X0CTuHm0jY1TZLEpWlUboLL41++kXOu4CNYYkUwX/sqWy+jYm+VtULPfXpOkTc4tGXYUWU6dmclp00RtjCZQvcjSOgNAm6SLJuRfRgqSPaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XG/xXq8FWgubj/qHAWCy2PnSABaqpIoyLMJwIYE3c9E=;
 b=tIu88vv3mkCco/GswjgwZmFxrAGJe+3vz7aUaE7s4NOXbnm5hVZjOPkazduFgr2w+7XR3WtgYp2R9Pnk4USFsLp7djUfu+3ziGNfmrPEslEUUNGP/3meYvO5hfXQ8KzXNJD4xZdeZlaqBAfbDl2vjNH1YujjYo8p7/e5ZF3sPpFiz/nI9i/DGaxkIX3HYPbVbRU1JO/b2JmWnVMwl2KJa7q5GH536WbKrmM2dQv0ZOkEFVCNnRZZIP2udsZ5lcNqPqE0hOK0K4lTjKkb6RUT+SX5j0DVKBnw88S+v3hLytvLPIC0m6Komdg06BFfv2DSomdoUz5z2rMjjiw4oqu+yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Sun, 26 Oct
 2025 14:40:34 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 14:40:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 26 Oct 2025 23:39:10 +0900
Subject: [PATCH 5/7] gpu: nova-core: add extra conversion functions and traits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:3::21) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 905e7404-2073-4ccd-f2e9-08de149d9e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEt3Y08zRW9XZW5YMGdmbmVBOStERjkwUFNWN2Y0V1NiQUN5NkdlNnBXbm1u?=
 =?utf-8?B?OHJ0MXc2cVJsSDVCaDNzSEsxZGR1ZlV1QmNrTEl1ZWJ1ZjBTaWIxOXRXbkVO?=
 =?utf-8?B?ZE9OWWFsQ1AvRFV2SHprUHhGS0dyRU1hNVY5d1Y2dFlCNW44TTJhMUdlYzVq?=
 =?utf-8?B?ZWVvMkh2VDNxdTZPUlBWbTVLc3h2WC9veW5IRTRxbFpFdTdINnozODZLSitL?=
 =?utf-8?B?dlEvK2NaL1lGbTdCVzRTd1JzV043NEt4V21OTHJWWEhHWU0vYWc4eFJxc3hI?=
 =?utf-8?B?WUJFV0JRajV0T0E0ZEVPZzkwTFUvZ2Ztdi9rU3YwREVmMUxBT2lOaktFNXh4?=
 =?utf-8?B?bUl0YVQzSHFybDFMbFJYaERudVBPMUMwS3Vsa1BDWTBsWFpxRzY0VXd6RGFx?=
 =?utf-8?B?L04rUnJGUTZMdU11UC9BMEhLYVQ5ejJaK2NBUmI5V1dUb1pmWXFVTW9DWVRr?=
 =?utf-8?B?YnlFOHBhNzh6cmh2K2JlRFYyWFdiWlMzeEc5TDl1d2xRcTJGS1Fsc1BXVDdK?=
 =?utf-8?B?S0FmazRQMTV4bVZLamJ1NVhISGExeTJyS0dKT1p5KzRGL0FqNUc0cWlvNUNU?=
 =?utf-8?B?NXRnQUMvOWhrMjlCei9JUnh5SzF0VmhsditEQ2JlM3IxZjAySndrTVhDUUxW?=
 =?utf-8?B?Q0k4ZzRsdUswL3JkMEk1SkhqZGtFRG1SaUpqbStBNm10b1Y5a1FXbjBHTklK?=
 =?utf-8?B?ZnNkbWx1Q1FiaU51N05YR0tWSDRjcmtJT2krMEE4WTVWMnR5bkhnb092b2lN?=
 =?utf-8?B?dnB1UWJxeGtZam5TYWgyOTdFNHBTSFU5TDdrYmJueEJQNVczTFlsYlpvbGo3?=
 =?utf-8?B?cWxaYTNPbGlaUTQ4UWMvTDRkQVdMWkZXd0JHREplK3dXZFBMWG5XR1NiZHhY?=
 =?utf-8?B?WWdxTmdYQTZBU0preXVQRVZCTHdxQkwybXBQQ2JoL0xxN3puRFdTR1ByZU9E?=
 =?utf-8?B?NXh2dHJaQVpKbkJJeEtkM0dvdnA3TE5mU3o4bDllWUROS3hNMXpzSUZUOXVL?=
 =?utf-8?B?NFB4UWN0SzY4UDIwRkpxalUybW84SE9ySW5HNjd2OE1lQzJPcngvcnMyR0xV?=
 =?utf-8?B?WGlTODdwMzVCMlJGYWdjbFRNd2tyNUdCMHlFbHhqaEl3S2xmcWdqNUJoWXow?=
 =?utf-8?B?WWlTcCsyV2ZxaU94YXhoTlZTdW96OFhHRlFFQ1IvTlhDZUs3aWdDRnJhWC9P?=
 =?utf-8?B?STZpYWl0bHdwUk5adlg2Ulg3UGIySE1YM2hOaUNZYm44T1dUVlRPaGZmakkr?=
 =?utf-8?B?UXBjVzNtZEVheEhwcFRrbTdJM1ZsNEszRU9IOWNwenlFUHdFMFpOVzNFQXBX?=
 =?utf-8?B?aTRyQXBLZ3c5NEVIZ2RWL3NZd3RBWTRxbVJlSmUrc0Z4WTBhbE1QcVVTYWJK?=
 =?utf-8?B?TU8rTC93YjFwV0NESHZXVzB2aUd0STVuenROVVRDUnV1Z2RWM0cybXFlc3Av?=
 =?utf-8?B?T09mTHovSDZTZHRKQ2dBT2l0RmdpMU5heFoxZnlQMlhtZ2JNZ0s2QnZIaWVr?=
 =?utf-8?B?UWpHVlFaK25QUXk4NEhRY2lPMk1oS2RRZ3llNHh4OEhPbURHVFlHdXRoS3lt?=
 =?utf-8?B?VlhjQ042dnRUZmFFOXdsQktuelZyM3ZPR3U4ZTFKM2hKUzhhV2cwUFE4K0NO?=
 =?utf-8?B?eVN0bWswakQ1OTd0aDZUQlpET3pKdkI2NS9uU0NML2tKZkl6TUZGdFJ6ZzFB?=
 =?utf-8?B?a2ZwTnpPZFZzVlN3UFkxUGNOZnJjbVNPb2d4YnViRThGNDlTMTI0WnJGV3ZC?=
 =?utf-8?B?T3JyTm1WaEJwTU1rdktmOU1OT1hTU3NaTW1NYWxpNWk2eW1ZbU15ZWNhRjQv?=
 =?utf-8?B?SExoY3RuckF5SEdxV21PUEF1ZFlnaHhmdHM3bXQ4U01ZcXBjZmYrRlBoZEsr?=
 =?utf-8?B?VTdoQ0IwYmdUbEpIZEExZENRV1F1dy9DSmUwSEg0d21hM2tkcEt4R2xLSEJr?=
 =?utf-8?B?a0FQSVZsSDlYQWwrT2MreWdJeTRGOWRPLytIb21CUW0yK3c3ZStPZHV2Nzla?=
 =?utf-8?B?ZnBYanJ3bUJpbkYwUTd2UzJWbUd5d0g0TXBmRUxSdzJOSzRWaHZ2MUVGN2pN?=
 =?utf-8?Q?eFDoRv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnNXQVZmUStMM1l1R014VGJaK01JTUYyZWh2bkRISWlWOVJaaHpEbkVyWGow?=
 =?utf-8?B?U3dOaThKcU9SSnpQVEdnMmwzM0VyV1huUE1SZzRDb01YcElybFJ2VENYTjc4?=
 =?utf-8?B?MTUyd0hFU29JUmpLeWpHTUJ4YlBvYWplV2lJQkhNUG1XVU14OUt0RmdUaDh6?=
 =?utf-8?B?UTA1cytjUFJxdFNPZXpzOUlSMHRmR3FQK3N3ZXVUNTNsVDRUUzZkVVNLRTEw?=
 =?utf-8?B?RElDWHFqN0FkUmtLN3J6aENKUVRnYWh2aGJaeFVuM1ZFcmVoRTRLenpPZmFT?=
 =?utf-8?B?d2JTUTczbUJkbDhpdXhzNlY3SG0zWExPdUo5MGJ2aTBqbmxHUEIrVWVCRUpo?=
 =?utf-8?B?VmYxVlRuUEkvR2tQNVpteTd1NEdnVS9lTVF4dDJFR0dtd1dCQkx0djZQdTF0?=
 =?utf-8?B?TkJUUWJHZ2xITmVXaUJuM1JBSmRVRXVYdE9ydWNPVTRodElKMTY1RXhjWk1z?=
 =?utf-8?B?RzdDWTJpMk0vODZDVW1GWUZKcVY1MVRURzJYV3pFUmZVREJMUzlqdnFNM20y?=
 =?utf-8?B?dytBYjJkV0dzS1kxQ0N5MG15RTgrbkMvVmplYmxWSGdWTDhTWGl3c2p1TTUw?=
 =?utf-8?B?dzRnbUpydXZwekwvY1BJSzBFbmtXNVpLckQ1bDNHVzl2akthbGFmZEcwNm5O?=
 =?utf-8?B?d1Z6T3JTUDhXN09KdjcyeHZmN2lXcktJb0tZVlFrSW9EcGlJaWZsYm9La2t1?=
 =?utf-8?B?d2xnYVJ5VFRINy9ucmZCR1lMUElvcXlaVG9wRUsrcUE1YzlmUFg5ZjFiM1hO?=
 =?utf-8?B?WUZDbmFNRmR5WFlWQUZWL2lOQm1RU3ZxaG9pelU2azJPU01zY1FOeFZ0UElD?=
 =?utf-8?B?M3ZGRi9zZWQyS1ZPbkNsanpQN3Q5V0FVY0N5SnpNNFFmQi9tNkpHblIybmRL?=
 =?utf-8?B?ekN5WWJIZ0ZCQnZvME9Zcm5ybGxiRndtZVRmaERWRGF0Rk53NzBkU21qQ2Fk?=
 =?utf-8?B?a0NuNUNlclpERkNNK3BnWTM1cFNmd21LVFZPYTV5Qmk1TXc2Mm10YWNTVzNL?=
 =?utf-8?B?T3NMNUd2UHcxQkNNendDZ0orbXh3bzZTNFFUaGJFd0Q3RzFjT0dJN0pvSWdZ?=
 =?utf-8?B?YTMrTHhaSlk2eC9DWHMwNFkyWHBWc1drZmdUNjNSajJ4c1Joam00ZzJTVW5R?=
 =?utf-8?B?VmQvSU5USXRFeDRLaHZrNzBHMnB0QWR0UHRSbWpzTkpjcllnUUYxZDcxQkFh?=
 =?utf-8?B?R0c4WlRTNVlFdzdRRHB5eFlaYlFJU2lQOFUveUJ1L2dCeDlpRXIwbjE1WVlR?=
 =?utf-8?B?ek05OTI0TThWaW1ITndmODJSZ2cxa01rVnprQk1WSWpNcWw1ZzVCNm84R0lH?=
 =?utf-8?B?ZDY2bVV2YW5wV05hQlVmS0VTMitkTkhkc0U0b0Jvekt0NmN4eDgraXJGTTNL?=
 =?utf-8?B?ZHVKQW9pVGVxcVdJVXVCbTZuYThQSE0vUmpBSEgwRjRHZHY0aUh3Z0sxbkFp?=
 =?utf-8?B?NDlrV2NrbC9KR21Icm9SMFhRcUdFM3JCMUZVcjBLM2ZGWCt3cTJUMjhiZmoz?=
 =?utf-8?B?WnlZeloxYlZ0dHFYeVFUdjY5K2VuMVplczhpZ0NmRFVZN0l2VlBkb1N6eVpD?=
 =?utf-8?B?SWkzbHRkTkI1aDVvY2hXU2VGUGhyeUFiWGxaL1FNcFNTTWdLQXVJUjdJejEv?=
 =?utf-8?B?Z3YwcW44S3BuYVBUUXdVVDdrbzZzcStOWmgxcHE1d3hVaTJaQkgvTytDL25M?=
 =?utf-8?B?TXlYUGYraGJkaDU0KzN3elVBMUt0b08wWmNHallTZ29ZaUIybHhLSm96bXBo?=
 =?utf-8?B?REhPUXc4RUpkWDlDSGFHc2RtZVlJUzlXQnB1emRzTTBRUGEzRGwzU2FJNmVZ?=
 =?utf-8?B?TmJBYWY5K1RHekUwRkU5eVY0MDhjQ0VRTGZORkgrT083Q3JoOGtZeGxSMWI5?=
 =?utf-8?B?RVF1ZU1DQXh5dk80NTJ2VFdHUHBzKy8zVmVPSkpLdkJVanFtWkNhUVkrZnIw?=
 =?utf-8?B?eXpMS0VFVVNrK09LdlQwUWFXWXFvcDJGUDRDZlhsVWpHTnRnUmN2dldwUnRO?=
 =?utf-8?B?QXR5d1dNcHlBcjFDR1JaV2V6RUhnejNBRjdNNVR1WCtaU1c4dSsxY0RxRmJU?=
 =?utf-8?B?QTFoYWE4T2tKMnhaeEVBTE1mQmFNS3N3M0dkMmRPMzl6eklsY0NoUnVyd0oz?=
 =?utf-8?B?d0FsOUlMTXIvNmVUMGZNblJyRDZleENBU1Vta1pwOEJWSEFpNmFEazJOdkZQ?=
 =?utf-8?Q?f9lFWc2tTpjaoz80hrlORlxUAccfPfTw6ZyYRnxx3+XO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905e7404-2073-4ccd-f2e9-08de149d9e29
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 14:40:34.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zJPPpAA0K4OWpnd2ZtKwBPtgJWEkzpq57fhIeTt7fjG5gghsEIfSJXvKW8SM9m9bLO2az9ELazZR64PD691yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833
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

The core library's `From` implementations do not cover conversions
that are not portable or future-proof. For instance, even though it is
safe today, `From<usize>` is not implemented for `u64` because of the
possibility to support larger-than-64bit architectures in the future.

However, the kernel supports a narrower set of architectures, and in the
case of Nova we only support 64-bit. This makes it helpful and desirable
to provide more infallible conversions, lest we need to rely on the `as`
keyword and carry the risk of silently losing data.

Thus, introduce a new module `num` that provides safe const functions
performing more conversions allowed by the build target, as well as
`FromAs` and `IntoAs` traits that are just extensions of `From` and
`Into` to conversions that are known to be lossless.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/num.rs       | 159 +++++++++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index e130166c1086..9180ec9c27ef 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod num;
 mod regs;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
new file mode 100644
index 000000000000..6b9d4e89dbf5
--- /dev/null
+++ b/drivers/gpu/nova-core/num.rs
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical helpers functions and traits.
+//!
+//! This is essentially a staging module for code to mature until it can be moved to the `kernel`
+//! crate.
+
+/// Infallibly converts a `usize` to `u64`.
+///
+/// This conversion is always lossless as Linux only supports 32-bit and 64-bit platforms, thus a
+/// `usize` is always smaller than or of the same size as a `u64`.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`] and
+/// [`IntoAs`] traits.
+pub(crate) const fn usize_as_u64(value: usize) -> u64 {
+    kernel::static_assert!(size_of::<u64>() >= size_of::<usize>());
+
+    value as u64
+}
+
+#[cfg(CONFIG_32BIT)]
+/// Infallibly converts a `usize` to `u32` on 32-bit platforms.
+///
+/// This conversion is always lossless on 32-bit platforms, where a `usize` is the same size as a
+/// `u32`.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`] and
+/// [`IntoAs`] traits.
+pub(crate) const fn usize_as_u32(value: usize) -> u32 {
+    kernel::static_assert!(size_of::<u32>() >= size_of::<usize>());
+
+    value as u32
+}
+
+/// Infallibly converts a `u32` to `usize`.
+///
+/// This conversion is always lossless as Linux only supports 32-bit and 64-bit platforms, thus a
+/// `u32` is always smaller than or of the same size as a `usize`.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`] and
+/// [`IntoAs`] traits.
+pub(crate) const fn u32_as_usize(value: u32) -> usize {
+    kernel::static_assert!(size_of::<usize>() >= size_of::<u32>());
+
+    value as usize
+}
+
+#[cfg(CONFIG_64BIT)]
+/// Infallibly converts a `u64` to `usize` on 64-bit platforms.
+///
+/// This conversion is always lossless on 64-bit platforms, where a `usize` is the same size as a
+/// `u64`.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`] and
+/// [`IntoAs`] traits.
+pub(crate) const fn u64_as_usize(value: u64) -> usize {
+    kernel::static_assert!(size_of::<usize>() >= size_of::<u64>());
+
+    value as usize
+}
+
+/// Extension trait providing guaranteed lossless conversion to `Self` from `T`.
+///
+/// The standard library's `From` implementations do not cover conversions that are not portable or
+/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
+/// `u64` because of the possibility to support larger-than-64bit architectures in the future.
+///
+/// The workaround is to either deal with the error handling of `TryFrom` for an operation that
+/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
+/// destination type is smaller than the source.
+///
+/// Both options are hardly acceptable for the kernel. It is also a much more architecture
+/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
+/// explicitly depending on a specific bus witdth that could greatly benefit from infallible
+/// conversion operations.
+///
+/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
+/// conversion between types for which such conversion is lossless.
+///
+/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
+/// `t as Self` operation is completely lossless.
+///
+/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
+///
+/// If you need to perform a conversion in `const` context, use [`u64_as_usize`],
+/// [`u32_as_usize`], [`usize_as_u64`], or [`usize_as_u32`].
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::FromAs;
+///
+/// assert_eq!(usize::from_as(0xf00u32), 0xf00u32 as usize);
+/// ```
+pub(crate) trait FromAs<T> {
+    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
+    fn from_as(value: T) -> Self;
+}
+
+impl FromAs<usize> for u64 {
+    fn from_as(value: usize) -> Self {
+        usize_as_u64(value)
+    }
+}
+
+#[cfg(CONFIG_32BIT)]
+impl FromAs<usize> for u32 {
+    fn from_as(value: usize) -> Self {
+        usize_as_u32(value)
+    }
+}
+
+impl FromAs<u32> for usize {
+    fn from_as(value: u32) -> Self {
+        u32_as_usize(value)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl FromAs<u64> for usize {
+    fn from_as(value: u64) -> Self {
+        u64_as_usize(value)
+    }
+}
+
+/// Counterpart to the [`FromAs`] trait, i.e. this trait is to [`FromAs`] what [`Into`] is to
+/// [`From`].
+///
+/// See the documentation of [`FromAs`] for the motivation.
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::IntoAs;
+///
+/// assert_eq!(0xf00u32.into_as(), 0xf00u32 as usize);
+/// ```
+pub(crate) trait IntoAs<T> {
+    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
+    fn into_as(self) -> T;
+}
+
+/// Reverse operation for types implementing [`FromAs`].
+impl<S, T> IntoAs<T> for S
+where
+    T: FromAs<S>,
+{
+    fn into_as(self) -> T {
+        T::from_as(self)
+    }
+}

-- 
2.51.0

