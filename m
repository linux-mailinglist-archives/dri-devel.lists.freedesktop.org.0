Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D60C15556
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EAF10E5E1;
	Tue, 28 Oct 2025 15:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d/dz0kdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010032.outbound.protection.outlook.com
 [52.101.193.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4810E5D9;
 Tue, 28 Oct 2025 15:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeLPdSGHMqsq5kKsMwMps+cV7gLz8rUOZa0pCeEilp8GynMKV8c2s8b6RYjitUkuuCUJzvOkMGlf/Rkd5EPyjQLqKxOQnA9MvS0lBFQhI4oKUjZvg1yUQIQ/vKK1MHrR9wJOKLfgBoAQGcB3XTwz8H2q8QK4GpPppOwUlpOyJSqn9ghO1hXDEwekfkN1iGns4sHl17wZ09/OpSQ2axp++pZS63XflQC4c6OXJQqBWhPLhlj/fOcCtz1CJuJ3G+bTzgzWPUUYT+tf2E+69fkEjE99cZDglNbdM4ZW06MhXkHCQ4+xMHDQM+bI8J+cX61csv1AVZoxlPvFr3XosR1CvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv1KFLQwhzp4wTHGyAHqQsicSlrPU20HDJwYEohQtD4=;
 b=AUtrfVOfntfSv7a0b2tSNIJE9bJ5OIdqvq42j3Our7hn8AM+9wGiwY9pDJjAoerqMtoNl6kiybfNQl7YtYrn+/MP0CBYWsGsbh/jiNOTK16KLCs2C0iUZsnxYh3pnQNTCgewH0YVtN4/vvSOp53sXpSzQhbscY/G/BV1X074FHeOw3e14X2WsDw8anpjPUxII/YIKBxwHCgWsy9PZcv9iuntwpTgdGy6xHaiHf6pWSu3gIJD3OVe9LjrDUjJMDKk0mYc7Ign8IrpEsC8y0zQBliXxtZHflHlTKzw4GWJaBdvrLkawXIMJt17lt6hhE2HSgy+4/v7s+kpw1LGoh1q1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv1KFLQwhzp4wTHGyAHqQsicSlrPU20HDJwYEohQtD4=;
 b=d/dz0kdI1CfqyCQxgfSgYUoIhLXPEebcm+p7A0CGjEoY3lyiPtCj9+nvJjSlRo8Gbx19q6TwsueCQ2noVyYSXtCECIKHvXThAseBsmn1kxRriNyx6Q/HMW961KDXuajRdmvaN6ZewBqfIIYSTvUyy7CplUC5BTtCYawVFYdeMiSADGhHLAjh1KiiFXKFpo12OhC27JlSmtBIhQBw4/0wwXwXsFsv0o4tSKDhTPCIYzdofqBNWCJ/Z2nyJp+zCOHFnhnkCtkZMHBRpX4qez/WyUgxhkXsdu+YoaNmwd7dAs/IpbTApBG0e/uMyx/OPTFn2QAmvIRoW4Pzuwm848E17A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 15:07:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:07:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 00:07:37 +0900
Subject: [PATCH 2/5] gpu: nova-core: vbios: use FromBytes for
 PmuLookupTable header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-vbios-frombytes-v1-2-ac441ebc1de3@nvidia.com>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: f75a6da0-fe38-4b52-55b6-08de1633c1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1ZSeEdMcTNPdjNOdEMzVHFCQlVBQll1NDVnWWw1VlJHS1hIclFzbU92K3Zs?=
 =?utf-8?B?bTZvSktoSUVYUlUrQ0JmenphVnR2L2M4VitwRWpSUXdlczBJbjJGWktNMTBi?=
 =?utf-8?B?U1BFLzYySHpDOUlNQXBvUnFtVisxKzVTV1hoTmhzeTAyRnpZc2Q1RGxwMEFu?=
 =?utf-8?B?YXFpc09SNGRYSlBPbTBHcTZvVzRHSndSV3Zqd0NzYllXOEVNWkFlR0xYQkVt?=
 =?utf-8?B?UFBPQzBMbXFTNmFlcE5seFVWbjhRdnJRSTQvU094VFF4VWRRVVRPcDJKdXRS?=
 =?utf-8?B?dWZOM1VVSXlvVXE2bTNuTUdXTVJXaTBzQktoakhEelFVVnpvRFY4M0IxZVhj?=
 =?utf-8?B?Y3RPTi9vbmd4bUt1UzYrdEtPL1dUd2c1aUtMN09MQWh5ckZvK1RmUHZablZV?=
 =?utf-8?B?NjY4ZVVHaTlGMjdNcXFuQjNtcDI4cEtBUnlYUzVlMDNTVmZUYXdUaWxpZHI2?=
 =?utf-8?B?cFNHcHJzS3RXZ29qSGxNbWY0WXpMc041UHdDaFJGRG11TkpINFlRcFp0VHc1?=
 =?utf-8?B?Smlrd0JQK2c5NFlXSk8vdzNtbSt1dG02VVNDZ0RUNkJSb0JhVzQwTmU3Z3h6?=
 =?utf-8?B?SHVuY25KU0JGK1FENW95NTFzWjBCUEhkYlVOakVJeWQxaFFUU1pCd0ZYZGpD?=
 =?utf-8?B?aTZINCtMRnMwT1JyMDlQVjloRUZKT3ZWTjdXY0dINy9RVElyUzlaSkZDeVNu?=
 =?utf-8?B?YTEyL1BHNGlsOG1xZGN5UVBGK0pXVzhCSllzTXBrTjNRWC9wWHNGVDYrcmli?=
 =?utf-8?B?WXNQZThJak1ESjhXMmVISUVKeFVyZEp3KzBEWTZCWnI5Z05TYW15dGxoRDIy?=
 =?utf-8?B?M2Q3VXBqdnhEeTFOSlJqOWZ5Uk9zV2tGS2VPWEhPSnhiN0VRb1pEOEJoV0Fi?=
 =?utf-8?B?a3ZmWXN4cTFmRW5NQ0dsWDFEZXkxMk85cU1TQ0ZTM2xoWFZod2M2QndmMFVr?=
 =?utf-8?B?UkFCZjJWc05sSU83VU1rS0tTK3RTQ2pCQUVNRjVzRG9BV2NQdUpQck03WFVz?=
 =?utf-8?B?WlBJSWQyblVrZmk0cHFyN01OelZLNFBSSENSYXoreFVZMXY1ZWpDbWN4d0tP?=
 =?utf-8?B?WERITTFMaXd6Y2RGakVXblBEdHBacFZBZmhDamkzdHBicVE0c0k0T1QyM0ln?=
 =?utf-8?B?OWdZbjJwYVFaVWlqcWxTcHgzVzVvM3M4akFNQVdYaCtpY0ZFVmtHNG5OOVV0?=
 =?utf-8?B?Q2tvMmU3M0FZQWpNVW83cW9SbW5vYlA0OTQ5cUYxdlVWczdIZDV0QjJXVHZU?=
 =?utf-8?B?Ri9YbE5kbUJHY3Q0YWkyenh2RzZWQlNtQmY1RDhwV3NBV0pMa3JyMldNbmFn?=
 =?utf-8?B?a2wvNG9UWGRabHAwby83T3lEVU5ZY2dhM2c5Nzl4OUlWMUVXMjNMMFU5MTVw?=
 =?utf-8?B?VEpZSHdZZjFOdXIwREtTS21rMTFYVmtJSFk0Y3NuZlhYaVZPc2t6TWtZalJR?=
 =?utf-8?B?eFlJVmhVVkREMFY1OTFDQjBwSEYvMnlNZXFaT1RYS04yYnE2aEJJd0crNXdi?=
 =?utf-8?B?bGM3MDZNR0dwTHgzYWxQaHRZQU5BZCtMVm9JeGlnZ3RUbU1WcjllYjUxbjY2?=
 =?utf-8?B?M21iS0Z3V2pFR2xqclp2ZUdIWFFWenVMS2xVcGZna0ZVeDdPblVpeDA5MUZu?=
 =?utf-8?B?K2NuYWc5dnlaVDBtZUE2ay9nNGlKaUtRb3Uvc2F3TTF4SW9DWGNDWml6dGxw?=
 =?utf-8?B?K3E0bXJuSkNSLzdIa055akp6QkJhTGZKNkIwRCs2RWxwVzhvdTZleU5MRmFq?=
 =?utf-8?B?VEFmb1lyelBzRTR3dDNLU3NDUkNidXRLQXViU2dzQk9NQXZNaGd5R1RqWXVR?=
 =?utf-8?B?RW9oWW8wZTJyVXNnS2l0blB4UmNTMm13RmFKaUFUeU9LZHB5YkZmK0kxTlZy?=
 =?utf-8?B?VmlqUGlGc0F5S1FGdTBmZnFxV2o2WVBBSnd3SDVnYldNdnJ2M25QNkljVjQx?=
 =?utf-8?B?N1g5KzhQV1lVZHVzWWRsVXBYMlBob0pyOGJnbVFsaG52QU1aNzd1elVnc2ky?=
 =?utf-8?Q?mPveVY2ffZMAeXpNrtQUnJwngVdiOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2x6ODlscVZ6eUcra2g4NUNTR3prbDNMTGNrTEZOY0FkSkd4dC9QbCtHVEhW?=
 =?utf-8?B?elBtbmZLbUtCNXRMQTAyNHMwdWtkWTczTW1zRnhxbUcxaFFNeDNLREwxYVpH?=
 =?utf-8?B?NHBDb2hnQThiZTRUVktoR2xlamVKa0U1L1ZrcEsrUFVqN1hOaGpRTFA1WDlP?=
 =?utf-8?B?TDNyaHNjbzNWR21XNUljYzRaemF2ckxEeWV1aWtkeXZkc0NCRnJFWWN0NTRp?=
 =?utf-8?B?aGV4UkdqS3ltOU5sK3NnMG5xMWZhbTlxbW0vWURwWkVDd2o3QzRYS3RNVDBt?=
 =?utf-8?B?RjFIa1dFL3lWN2NyODVGNEdRRXRqR0lJemZ3RnVRWG9rdEFYZTJGeDAvY29w?=
 =?utf-8?B?ZEpXSThNVDNjZkxNVVFVL1FQdDJ6OGorVCtLeFJkTklDdENNcktvK2RpS2V3?=
 =?utf-8?B?S1E1bVcyQWh6ZGtXSXAwY0puemdPSkpVVFF5MVhsMzBrQ2xvYzFHNW1SbFJa?=
 =?utf-8?B?bU1NakRHWmZWaHZqaW90SzczUU9MNHlsckhzTmRpQmVHNHk3UFBGaWtRN3dP?=
 =?utf-8?B?N1FMUWJrQWlIRlhYTURQMHhDWHU4TTR5ekw3dTZHdXl6clp5ZVplQ2x3MTEz?=
 =?utf-8?B?NVh6S2pOYXdKWkJlVzh6dnhEZUQydWc5RUcvcU11bDlUYkNnMlFKUW9pMnlB?=
 =?utf-8?B?NnB4aThmWTE5TTVRZHg5VmpTTFBIUytZMUdOdGxGUzc5NTVuMUpFN2N2SGww?=
 =?utf-8?B?enU1eHd2eDdTa3FLTEU5SGVZNngyTzQ0cm1FeGRPbStPa1J4ZmYzWDVZVUw5?=
 =?utf-8?B?WTJPeVFtU0lwTG5CNEQwcmV6MmZPaThxUXVXYXhkMW9SdU5Ed0h4QnUvWTRL?=
 =?utf-8?B?RVBPQlhjWkZlbjZjeGFGdStzUFhpSlNLUkgzRGZSYXpCeEhheWRqaTlQUWtz?=
 =?utf-8?B?a0U2OUt6a3hvWVpxNVRja3lLMjZlbVFYQU9RLytWZzVaQlFLUDFPZ1h3UDU3?=
 =?utf-8?B?aFJSSUtmdnhtVWdUWGJVWjBZb0g5RjBDUDFpV3FzaGZaOHpXc0tRMU9jdXo1?=
 =?utf-8?B?REVYaUdjNm9Vc3JUNDhWb05GQjNhbUxOSXJHTmtFYVZLTWl5aExWUVM0ekI0?=
 =?utf-8?B?SmhWVGZyN09tbGJNUXhvRTZqZERsSlhaU2JyYzdxZUNFK2VabVBmalF5elNR?=
 =?utf-8?B?VzJlWVF2NGdkM1lqdkZmcXRBRkNIRDNqK0Z1WW8wQytKMmE5VXRaRzN1U1NV?=
 =?utf-8?B?bHUxcWw2NFdyUzRBSmZRRWUySWxiUGR6YTlGYktiN3BVWTdvRXdUSWNabTZN?=
 =?utf-8?B?eGtkYXJUZEZqV1FOeVB1OW8xZTh3Z1ROcWh4QzNuT2w3UXVzTkxGTGxsSFFX?=
 =?utf-8?B?eVQ5RnFVTTIvTjBZTkZSUXROSW53U1pmaWhUSFRCZ0lTTDMrNzZhdUZRNjJt?=
 =?utf-8?B?RElseitRbWlaQTUwVmdiZFBzVzN4dFMwOW5yMHIzN2ZuRFN1TGZZYTVBa2Iv?=
 =?utf-8?B?Q2NaVHROTGFRdXRwTkJhSitleWFqM3FnVjh1N2F4dXgzc1poNVBVYjUwbjZk?=
 =?utf-8?B?aGtFeE5pNHYvWEhnRk5DQWJXZXN2NGs3eHR0WWNnalVySnFwRFA4eEZrcndx?=
 =?utf-8?B?TmNLcFNUdkRkd05kWEhLUXBvZXpmUDN2WjNUY0RLdGpRd0VNaVRWUDhNeTRH?=
 =?utf-8?B?eUt6ZzlucGQvU21vNURTMmNxd1BtK3kwd3NvM1F3d3lqeXBOZjUxRS9CNnJF?=
 =?utf-8?B?K3hVc3pmTytFS2F4YlZKcFFtKzcwTVRYNStBcDNJVTlFWWhwSXRTeTJOUk1J?=
 =?utf-8?B?U2JtZVAxY0ZvckpxeEVuV0lTQlBlQW5kR1BuTFNSSFB4cmUwK3gzYlExTkhK?=
 =?utf-8?B?UmFTS3d3OW9CYW9KaktwNS84NjFiRmdYUUNwM1BmK1ZLVXJYM291b0JYaWth?=
 =?utf-8?B?R1FkK1dNZmJyRXk0YURvK3lkQW1hRXA0bXZjS2lBeFphVUhha0hhY0pKdmEx?=
 =?utf-8?B?dFR0QTBCaUVja2crYk1iVGhOckl5aWRZdU5pRmUyem83b0dTenhrQUloUm1J?=
 =?utf-8?B?aWw5YXVLU1A5SjBPQ0tMSHhOTWpVRjhWS3dIaittb0gxcXl1dFdnOEI0RlFu?=
 =?utf-8?B?VCt5NFpEMDhRT0NkVWJoQml2S01sMThsaGppV2ZYS2kyKzlqMDFKZitTSmFV?=
 =?utf-8?B?cG1WMHAwRTRxM1NyQlhiK2QzOGEzZk1hcUIySGVEZkZ4cG0xOEFhYjh5TWtO?=
 =?utf-8?Q?NstqKuCGqAWcafNHXOwD7x2ivTNdYG6v10wJA9S8OAJs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f75a6da0-fe38-4b52-55b6-08de1633c1c5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:07:48.5658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlfTaEJsF1viOyy47TbfBiBYkaAnUyshxZePppfroG/Son3vBMHHRy85c8oPRya8UA+UMalBfwnkwKgp7Y4i9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
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

Use `from_bytes_copy_prefix` to create the `PmuLookupTable` header
instead of building it ourselves from the bytes stream. This lets us
remove a few `as` conversions and array accesses.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 44 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 46da51b9f6b0..b6c20627a5e3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -10,6 +10,7 @@
 use kernel::error::Result;
 use kernel::prelude::*;
 use kernel::ptr::{Alignable, Alignment};
+use kernel::transmute::FromBytes;
 use kernel::types::ARef;
 
 /// The offset of the VBIOS ROM in the BAR0 space.
@@ -866,29 +867,36 @@ fn new(data: &[u8]) -> Result<Self> {
     }
 }
 
+#[repr(C)]
+struct PmuLookupTableHeader {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+}
+
+// SAFETY: all bit patterns are valid for `PmuLookupTableHeader`.
+unsafe impl FromBytes for PmuLookupTableHeader {}
+
 /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
 /// application ID.
 ///
 /// The table of entries is pointed to by the falcon data pointer in the BIT table, and is used to
 /// locate the Falcon Ucode.
-#[expect(dead_code)]
 struct PmuLookupTable {
-    version: u8,
-    header_len: u8,
-    entry_len: u8,
-    entry_count: u8,
+    header: PmuLookupTableHeader,
     table_data: KVec<u8>,
 }
 
 impl PmuLookupTable {
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 4 {
-            return Err(EINVAL);
-        }
+        let header = PmuLookupTableHeader::from_bytes_copy_prefix(data)
+            .ok_or(EINVAL)?
+            .0;
 
-        let header_len = usize::from(data[1]);
-        let entry_len = usize::from(data[2]);
-        let entry_count = usize::from(data[3]);
+        let header_len = usize::from(header.header_len);
+        let entry_len = usize::from(header.entry_len);
+        let entry_count = usize::from(header.entry_count);
 
         let required_bytes = header_len + (entry_count * entry_len);
 
@@ -909,27 +917,21 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
             dev_dbg!(dev, "PMU entry: {:02x?}\n", &data[i..][..entry_len]);
         }
 
-        Ok(PmuLookupTable {
-            version: data[0],
-            header_len: header_len as u8,
-            entry_len: entry_len as u8,
-            entry_count: entry_count as u8,
-            table_data,
-        })
+        Ok(PmuLookupTable { header, table_data })
     }
 
     fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
-        if idx >= self.entry_count {
+        if idx >= self.header.entry_count {
             return Err(EINVAL);
         }
 
-        let index = (usize::from(idx)) * usize::from(self.entry_len);
+        let index = (usize::from(idx)) * usize::from(self.header.entry_len);
         PmuLookupTableEntry::new(&self.table_data[index..])
     }
 
     // find entry by type value
     fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
-        for i in 0..self.entry_count {
+        for i in 0..self.header.entry_count {
             let entry = self.lookup_index(i)?;
             if entry.application_id == entry_type {
                 return Ok(entry);

-- 
2.51.0

