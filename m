Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A3C1717E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D53D10E674;
	Tue, 28 Oct 2025 21:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GLnxrmaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DE610E671;
 Tue, 28 Oct 2025 21:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjeJS2FARCu8YHlnlwueSAaSTfCLUY/O7AGkNgDRDUen7AGsbXKTAOAmnWE/4w6+N50FrWvvFM0833CJQkMT9APUflhpx89EqON4gBN09aTSdEG8Rtl8fXWZxLChxc7ZbUG8YY1ND/C1dCYsVYxmBbI5E9psahvG0sq8JOvAQ38ToFjVymgHtV0ecyEOqfpt4P8b+mWqkmNVt8TK1qdDgN3LPsTfqbdnOVaPYwCY1ZAV49ApD1MO+NDeUTlwWqcMhJN26OC2RdujbM+8T5RW7kmOoDb9w0FJtm1jyO95j5L2OwZm9CHkzHRD2u39HPm0fplPYYEFBrLLv9+jmvuyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsjlGenmor9tk1BUnjw6asIS4Q78e5cWresoo64xzE8=;
 b=jAoQnWJjKUxHgPsv7hirUWT8d9bymjOhv3YMIISTNRjiJgFHOLQeSBxNHgq4zdg3neTJKZ9nl9JZv6LBzDWJwLW6hAV4F53Ev6BNCRMCMxSqFD4Jw8zbtLFz6Hp8meXlhrVPt6De53kmN1Fk9ucd4JRtlxj7ZKq1klsjsoCGHgOV8GqorE+zDNm1NAXaBcy+iCjuGieegjl2X23whDDdTZZwMbRfl14+3nJ9DBoR3Q8gOgy69+N66sSd21orxiMJ7xmuryF/AHmNka64Zdh7FwZDpmG0lbNjjZNOPAm5yeo3q9A24f+/WFpvOVUyNM8CtTlSrMUEV+R+QBpavt0JHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsjlGenmor9tk1BUnjw6asIS4Q78e5cWresoo64xzE8=;
 b=GLnxrmaUAU6X16wkVGU68HYrME1SaON6V7cqBU2BZtItk3sv0kM9qx52CRevIPNDOyZb0GY5zrVAFw16n6ogXX8ZshSP8I3GRsZCPy4+C8tsHSf8fAavMPtlANDA7X8w2ORQK1qDsi0LTmsSOUYsTprTcb1WjeM0FBtpU3lMa4yFJlgqxuCF0RzuclQujmkeUXNBk3psljMSDWfsvCuN9fA+4bKRvLm/F5jcc8Bq5JlndT7KByTRkHAovwoDXY9Ca9ZVG2eGXwYY8XKD2bPd4s5qoF9vZhFtTorXKlAwSQqZc5Yyw84zu0P+Mzj/IM6hPmca2TPJ5EKvt3sVtmUuQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 21:49:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 21:49:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 06:49:20 +0900
Message-Id: <DDUAC0IWH700.27TKNFBEOQ7KT@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
 <b1657e5c-5679-4e5a-a1b4-c8559bc7d891@nvidia.com>
In-Reply-To: <b1657e5c-5679-4e5a-a1b4-c8559bc7d891@nvidia.com>
X-ClientProxiedBy: SG2PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:4:7c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6d26bc-6e91-4366-5f99-08de166bdb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0NoNGVyR1FFZkdPbVlUTWhrWHJhTEdhQ2MzVUZJdGt6TmtyWnRPZ01oS1Mx?=
 =?utf-8?B?ZnhWOXFOdERZWVQ5cTZUTFNSR0orSE1kTUkzbEpyclorK1RzaXpUdmdjaGZp?=
 =?utf-8?B?cWE1MUQvaUJjZDR2VzloNEpzQWNnK0NjUmNldUtBM3REMHJ3TmpWT2tGM1I2?=
 =?utf-8?B?ZWVXYktiLzZXYzJqSW82SXBBNzA4N0ZBUnA5ZTA3amNlRzNtSUFuKzF5Und3?=
 =?utf-8?B?VGFDSkpIb3NycW1mWXJZNzkzaUk2aWRzZkYwQjFqMDZ4bzJob0J3SUlUWXVp?=
 =?utf-8?B?Z2Z4Zm8yMmdPZEJUR2ZPYXMweVU0TTNZRWovREprR3huK2QrMFB6TFpJdUVX?=
 =?utf-8?B?VDBqZjVrbGNQWUt3VDIxSlZ6ejJTcUZodHdpY0ZTTkNKSEpzZEdLK3d0UEVw?=
 =?utf-8?B?YmtWS3hFeUZwc0F6a3hLaXdza0dzdTFDWUdtOEtpV3kxQWV5SW9lMlg2MkEv?=
 =?utf-8?B?NS9ydWxvdkN2Zm56Ym9kN3RhUHJlcFZIYVBZb0VJWGZhRVhpOG1MTHQ0WDVl?=
 =?utf-8?B?aXRHSUtKcmk5SVV5WlNBcFZnbkVWWS9rbDlwajZuR2EwcDlEdmhJNFpMNHZN?=
 =?utf-8?B?Z29oYkdwMlpTQkIrQWxhRW1mOGdVdEpTZTFzYU9xY1J6amVLamtvSTdXSkxm?=
 =?utf-8?B?ZzJuQUMyM2c4cDVGVythcU03QlNJUUM0cGE5d2d6RDMySFJSeUlkVnZmSi9Y?=
 =?utf-8?B?K3hNdXFpUnhhNEhmQ2RZVC9TcGRseFhhNkNDT09TREFvM0FkZzVQa2RQVHUw?=
 =?utf-8?B?WHNUYzMvRjk2eWlpMzJJa2R5OG5QR1hYekRFMklReFJxZjg1Wk1uSmRkd05G?=
 =?utf-8?B?RmpUU1lJczJXd3k1MzE4MTkvb0kra0JLOUl2d3Q0aTF6N0xFY0dwT0JPUDJX?=
 =?utf-8?B?TURnWFBWNEl3SDNkbnBxNVlEaHlVRXhuME9EZmtXSGh5aU1RUzFIV0lwTHJr?=
 =?utf-8?B?NUVBS3l3Z3k1eEdHODBiOEQrZ0lnNUVIdjFrNVEzWW5FSVNjOHFBVTczcDI5?=
 =?utf-8?B?b3dPRjZqMnh5OXJja3RJa3RhNjhYb05WTEdIZlMzRS85S0k3RTY2SWJjSU9B?=
 =?utf-8?B?Q2JDV0RIUElFeWJrRktkV3pnSGJiTUovN3VBejFBU3c0eWNXZFB3OURRcDY2?=
 =?utf-8?B?VUx3V04yN3owNE9LUlV2YTlpTVdvZGZ2dWUxVlhJME9YNTBvSnpCaFc5K0E5?=
 =?utf-8?B?Y1BJVGE5b3Q3Qy8xVmJjeldJeEpEVk9HNmUvL25pNjdTRTZtVHp5TU16ck1N?=
 =?utf-8?B?VjNGaERQdDB5dStmV2xKTXlCUTIzZTFDdG1CeG5RK2U0OVlUdk9oeDk5V2Q1?=
 =?utf-8?B?TDB1a1dscGNUeHlGNHdQWEtmdytzNThQWTl4aVYxelJ6a3NBS2hucTd2RnI1?=
 =?utf-8?B?WlIzS2d0MXpIMitoVE9Jd1BsL1NhbkFOc0pLWENhM3ZvVVRjc1E3dXBoNjFi?=
 =?utf-8?B?WmhuUTBmcm9CUVB2OFRPdlh3VURJcEs3aHU5MHJIeThCUzlwOW9CZGtPYzA2?=
 =?utf-8?B?SEhRdEVXNkNxdTFOV0VXM1pvUFYzVTlldklxem82QkhWb3BES3lSZEE3MXFV?=
 =?utf-8?B?L3pqaHFlYUFBRGUwRmlQL1p0S3FmM3o4Q2ovU0N6dXAzL2c4N2dvNWhYMTVl?=
 =?utf-8?B?UXZhMTlOVHhKc25uZk1EZldmZHF0ajZRSGpmQlQvd1c4ZWtHN0hSSVk4aWRO?=
 =?utf-8?B?dE5MeC95cllOSVh0elAwV2drcVkxaDlzS2RuTisyb2RqeTRtc2NoR3lyVVIx?=
 =?utf-8?B?cW1JY2NXMDNOSWNseTFqcjg5dGVFT3RVeFJNYW1BejlmcXdLUURBWDRMTEFE?=
 =?utf-8?B?RHJQblRHemZLQWs4NUt3OW1KajBpaFRSdUhQc0ppSzJmb2g0VUd2ZWErMjc4?=
 =?utf-8?B?S2VFMzhNTFFVemx5ZTBMK0JNTE1rRnF6VUFneC9EdDVnVkhETnRiVS9zZkN4?=
 =?utf-8?B?aHFZV2VUMjlrcUlTRHU2ZkpWd2NMaEtBRVdNRllta2FoNm5rRVBaZUpQWHMw?=
 =?utf-8?B?OUNzYVo0cklERXRPVDgwTjBPNG55SWxEYWt6S245SFJkV3B4YjJqdmVPUllv?=
 =?utf-8?Q?XXI21Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBzTURaZUI5cTd1RlBKNlNUWlhSbW5TTFZNZElsSHhzUlFjbEk2Q0VFbHpQ?=
 =?utf-8?B?ZTBNZmxma1EvcXlEeVc4UCtKWnpCbGM5U3U3TVBDbEM1KzBwbDVROGJZc0dX?=
 =?utf-8?B?Vks5L2QyOUdtUjFGQ1ZnUXFMWldDa2NnYzVMcHNaQVluNzAvN1FvVWcvbXdP?=
 =?utf-8?B?aGZ5dVp2M1luVVJhcExhSmxyaWppa0pzMXRXNnpMbVFRaXgvRTNDWjV6dmU2?=
 =?utf-8?B?czlUQi9pZ09OS2QrelJPRi8xUkZiTiswTUMrTmVteGUvZmtDeHZTZXJZZG1C?=
 =?utf-8?B?a1VvbUFUeElsWTI1MXpSQW1GQjNaRDV4MzUxK3NSOGdlamxMOHp3UlIxek1J?=
 =?utf-8?B?blJnSGJiYTY3cmNTdTRLSUpDSmloZ1VtUUo2OTBwM3RDODFZZVBob3BpNUtZ?=
 =?utf-8?B?djFLKzJWZWFJTHJwVXZreFltamo3b0xWQnAxYUUrZ25RYkV6Ukljc1JRMDZH?=
 =?utf-8?B?WGtkODZ6SnZISkZDYm14aGJRbmZiRVNONE02c1pzM2ZEcHRmVmJDRUpHOHI2?=
 =?utf-8?B?WlhmdUU0R3o3SlRVUWpaekwzMkRPcWJ6b1c2KzNaT0paQWovbUZ4MmtVcFlj?=
 =?utf-8?B?NHR2eUdSay9NS0RqOWFnOTdsaXcrVEE0SHErYkVuQTUyZDlYaFkrMFhyNXpj?=
 =?utf-8?B?aDV1VkJCWm1zeGMzVHRnU295NlVNTHcwYUJySHhkMnBNanAwaVY2L1N4N2NZ?=
 =?utf-8?B?emU4UXJwNmhHUE1pbW5YdzcxaTdNaEw2RE1mRi9lTlFHS3JZSlRsNmhCcldL?=
 =?utf-8?B?VDZqVnpoTXp5RWo3dzVIQU1TMVRpV2xqc0dYMkRUTWE1b0Q1SHR2S3JKbHp5?=
 =?utf-8?B?MzBpeTNnSGRNYVNMcFhpTzNQbTNZcFRFNjlQWTNyTHFVZTdtMkZyTmFYV3V5?=
 =?utf-8?B?Z042Z09FM3VFdEIzUzVURTM5cGxwT2VGcHVpVVFKbnBNNU5GRkJiMHlkSGR3?=
 =?utf-8?B?Z0ZOa2lVNW9QRDhGWWFrVXpUcTFqS3M2YThoR21oeDNlT0dKcjVzTXFuN3Fo?=
 =?utf-8?B?OGRDUXVGTjZwWG5saTNTeUlhQXJ3Vjdia200TjRNWEZ6RlJUT2lURGVOQy9G?=
 =?utf-8?B?ZUhkbTN2NjNkVThBUWpHYUFzWlc5aktQaUdLVlk5V0pFZ3RDbVFSVndjeENs?=
 =?utf-8?B?YU1STWhOai9pRk1ydExZdTZWaXoyd05XMitmdHFFSFplbTNVT3U2R2dPQUcv?=
 =?utf-8?B?b0VlMnVURi9iT1RtaXl6TVg0UTUxQXR3KzhRQUNDUi8wWVNseEpLaHpReFBi?=
 =?utf-8?B?YTZwck5DaFlESHgrR0J3U0ozaWpHUzRZVFZXZXRxeHQrY0Vwd0NzWkErNy9Y?=
 =?utf-8?B?VHBmZU5kTUJpdEgveHFBczJBQ3dhUHhPRHRONjBkRGtkRldNZkJhMDlhV3JO?=
 =?utf-8?B?MzNUWVdDNXF4blJIeTdhQUo1eEc2aUk0YVRncWpwcDh5L1VzOThOYnBENnp0?=
 =?utf-8?B?UVdPYnArQ216eDY1K2lBck10TWVuTnFtL2FlRXEwUTFVODFyMUVNK0ZnTVFB?=
 =?utf-8?B?MkFIYmZxbytFb1IvUXhMdjZyU2FvbDN2d05vL2ZMT0VpdUtPNE5QOGhma1BO?=
 =?utf-8?B?aVhjekp1ZGVtczdxRXdCVGlTRG1DNEJqM28zQlF2V0VxMnpjaHo0UFdFeUh6?=
 =?utf-8?B?blc3dXVSL1ZXVnpBSGtjc2pla0s1K1FadE1zZWpnek4wTjR2Q3VYeHVsbEpj?=
 =?utf-8?B?WUJ2b1B3czVZNUR5RG92dWZ5M3F3U3VEdzYwTHBlRjJubHBiZkh0MWRabnlW?=
 =?utf-8?B?K0wwaElMbmdRQTVmUzhlQlMwOC9aVGQyQXc3VjFPaFpRT0FrOFF4OThTVVNl?=
 =?utf-8?B?c0Q0VEgyS2pCbGt0MHowaFpETkhWZmc1NUYvQkNSWnQvMVptNjk0L3dvRzJp?=
 =?utf-8?B?OCtCYUFNTVAwc1BlR3NGS3JuZnp0K09ZTzlzK0FPSm8vWk1DNkU5WVpLaUxn?=
 =?utf-8?B?dG8zYWVHcExpenFjbW9Yc3FxOFAyWS84Wjc2R25hSzd3WkRGOUR5N1pCUEtw?=
 =?utf-8?B?S0diK1p2TFNtanV3OWtBMXpWSlkyNDBSaTdteFJ1dHp5QWRpUVZmaE9ZWEtk?=
 =?utf-8?B?RWJRd3dPRVdGcmtXK2tTekxiQ2pRcjhEK2RxT1R6d01sV05zT09kWi9nSEJy?=
 =?utf-8?Q?2Xcc7E4mgAfbx62NQornNqOz9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6d26bc-6e91-4366-5f99-08de166bdb6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:49:23.4638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9O9gDwl1qFLtNlKLQPGLH75xV62HNQU4M0zfNDOAP0xZ48aLg5B4EDagkOqaKOmAmSCcwvbKFEs6OnEC0bxJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
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

On Wed Oct 29, 2025 at 5:24 AM JST, John Hubbard wrote:
> On 10/28/25 8:07 AM, Alexandre Courbot wrote:
> ...=20
>> The base for this work is `drm-rust-next`, with [2] applied.
>
> Taking a look now, but unable to apply, using those steps. Do you have
> anything else perhaps in your tree?

I tried checking out `drm-rust-next`, applying [2] (single patch, not
the whole series), then this series, and it applied for me - with the
caveat that the posted version of said patch does not build. :/

Yet more evidence that we should maintain the good habit of publishing
trees for our patch series, which I unexcusably omitted here, so here it
is:

https://github.com/Gnurou/linux/tree/nova-vbios-frombytes

>
>
> thanks,
> John Hubbard
>
>>=20
>> [1] https://lore.kernel.org/rust-for-linux/DDTRW1P2I4PB.10ZTZDY95JBC5@nv=
idia.com/
>> [2] https://lore.kernel.org/rust-for-linux/20251026-nova-as-v1-1-60c7872=
6462d@nvidia.com/
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> Alexandre Courbot (5):
>>       rust: transmute: add `from_bytes_prefix` family of methods
>>       gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
>>       gpu: nova-core: vbios: use FromBytes for PcirStruct
>>       gpu: nova-core: vbios: use FromBytes for BitHeader
>>       gpu: nova-core: vbios: use FromBytes for NpdeStruct
>>=20
>>  drivers/gpu/nova-core/vbios.rs | 137 ++++++++++++++++------------------=
-------
>>  rust/kernel/transmute.rs       |  60 ++++++++++++++++++
>>  2 files changed, 113 insertions(+), 84 deletions(-)
>> ---
>> base-commit: 639291d7c30cec5cf0d9a79371021c2e4404cfc9
>> change-id: 20251028-nova-vbios-frombytes-eb0cbb6a2f11
>>=20
>> Best regards,

