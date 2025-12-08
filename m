Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F31ACACCA9
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635F10E2F1;
	Mon,  8 Dec 2025 10:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ddI0v4jN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C48D10E2F1;
 Mon,  8 Dec 2025 10:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPouj7LX3wfkbveaTJlxGLOLaJQ4nIa9J7c8xML7v2odksFXfdkvilTjIu/OkdvcRQH1DlrOxuY27X5F0Qi/l+H1rWa1+DHhYl6DzPW/3wVwFa5VdKR3TSuHVUVniMsKUy33DlX5qiMt5IXIlG4eFwrCXdofyEj3djDcT0+FPmf04XVDXekYeAQhakrk26aN8pgmABzc3Ks4dRyKCP+qBR3DPq9LTtcCWLYAVqGxOztxwxDf1dWrUhuNqzKdbxjV+TfNHTCv1OVeWUiM2032vnKz40oiyJvSEzRMBNwoFnSNDy0IyTMrae+Flyr0PK5Zu4bHkq0PC//8tgeZDo3VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7P/HkFzKj5mDC9s5kKC2bTu8Z0uO8RYLKaeC/2aq2A=;
 b=EfiyfVge7zFl3MfpmDQ89+FjumlHz6mR/jI7p/hTRQ/GJbGIGIto1SIMv0NuZYGnkjQZwYbDAG9I/HtXLDk9xL65OVeOrh3lJpZGsb6Y2N3ZGXtuiqJaC2bIQohQj1WQ6vPzaGKmVZcegDdQ2ztHusMw+4wjOq1wx9txBYtXRc7FUEc3zpXNoEJcZDw1jBdaenzSeVS5A6hbaGppT/RnwRoNCEP1qQNGnAkNJpK8x3jDppPQvWon2kM/k6EUkHocXJyxQ56NQr7L1t/00oGChin2QBT6a+6ZIlAQoQshilG/cbKkI6HmMCpF4GgXzOQnZoBZ7uahMbtOktK2i6kgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7P/HkFzKj5mDC9s5kKC2bTu8Z0uO8RYLKaeC/2aq2A=;
 b=ddI0v4jNLvoieas1zVKFX4HdbD7ZzGLOtV6OCu3pMxKrInF5WXvv/FJ6rZE+pLOKb4smCnBuy15Z6JYnmsp7zn/yZRWtaOnrwGrn+MB+xh1AC97MJk9+K/rR3eC7c15nnPLPhIukHz+mN/TtByuFEzOi7/eTKzaiFTqyX2N4n8+jl97sJJBoeYYDoxZseNlUluw5SPIOS3sTdbZS2uyCQRp97JWrGhi22TyP1hP8QfBErhH+SVj1EwrUdIQp46dphdd4R3qLzbwmL2/UBySRCKm2YJE2AQFrowp1ZPG1hz0b+dtG3AX9TBmz3lmpUwO/A3QsA/dVn4Sm9kahuyog1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6395.namprd12.prod.outlook.com (2603:10b6:510:1fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 10:06:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 10:06:18 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Dec 2025 19:06:15 +0900
Message-Id: <DESR20OF30KU.1DCTWADJUFIM9@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] gpu: nova-core: Fixups for GSP message queue and
 bindings
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
In-Reply-To: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dfaa0f-408a-44b3-cda5-08de36416e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVpOTVRPa1RzSE1TVGgyeUU2SEtIZExodkJWaS85SzdoNFJONWZvTEphRWts?=
 =?utf-8?B?NDRyY0szQzVJZWw4WHRuYVNEbVlBc2Rhb0VUSWdwcFZMNHduZm1JU1VUUFoy?=
 =?utf-8?B?bm9QUTJYcjB6aUtZc1VpRTI5cXVja1U0dzY3bjdIV3BMNFkzcWIzZDI0RXJR?=
 =?utf-8?B?dTdEUWhpUlIxOUxFNi9RQXFvK0FKZ1Z0UE5LYU56SGtoeXNOVzRFVlhIRlM2?=
 =?utf-8?B?MHZMaFg2SlNuNkNJZ3Q5bnhuUVRONFMwS2FoRkhTZ3psR3lXMm9MRjVhNzNT?=
 =?utf-8?B?V0lHL3FzZGgrb0tTcldCanVnYkwzTkFJVC9MUE1YMnVPaG4xall0N2NNTmk1?=
 =?utf-8?B?OGdUMkFnZHQ4RHJ5VHBmNTVHZ0YvN3hwU1BYa2tDckloSkxZcFZyMkxnZ3JD?=
 =?utf-8?B?c0xUT0EzdlpMeGlKUysreGtqRlVHUVU5RHVmOWo4eDVmMisvbEFIS0Fxd0I3?=
 =?utf-8?B?MkRmMUtVYXRhYjlwN2lncnJNMjc1L2lDcnI1cG0zL1pzcnZLMGtMOUxNUkxh?=
 =?utf-8?B?ZFllMWxyc1pYZE8rRmx4RHZIdVFidGo0alFCaEtJdUdqOVVGQmlpWU9iVXhu?=
 =?utf-8?B?YlJxK3J0QjdLclk2VlBBSkpmNGFBNG5UNVFZOUk2ejFKNjVXUUlxbHNVSlZG?=
 =?utf-8?B?ait1bElYWlNqTVM2eENqM2Z4aXFNbmNldldpRWRXdWNMSEtuZzJFQlh6elkz?=
 =?utf-8?B?R0R1MDRHWjBuNXUwQktIK1h6R0VDQklRVFF4VTZTd1Jqcm52Q1l3Y3dSS1hh?=
 =?utf-8?B?L2JqYlBIWkxjUUJtNGZycDllNUpaRFNJTFp5TXlIeHpUQzcyRXhZQmpjWXVt?=
 =?utf-8?B?ZmFrOXJuK0ZjQk5MMDR4THFjWXhJdmllYW8zdllxWnM4RGpCNkdjTytwNzJN?=
 =?utf-8?B?cTR3NUh6d3BCOEFvYVpIUThXd3FaREpwYTJQNnE4MkpJeHdoQ3dWVHYxNVkx?=
 =?utf-8?B?bnRlVmpwQmUyYVFub2ovQldEdjVlUGYxaGdVTDJBZEc1VUJPRjJkT0ptSGhS?=
 =?utf-8?B?OHVTc0NUSmt6b2E5MTdyQzRkcjVPMEUzQmhzcVlpTjBMZWVMUFZ3SktPNEht?=
 =?utf-8?B?MkoxZXNzRFFYeWhvMjM5WEo0cVlUOUdmUmk1U2ViYk8rL1pVOTZ6Yys4TU9U?=
 =?utf-8?B?ZTBBc2FMY3QwWVcvd25PSENiUEd3OWhUNzRqRVhlNjkxMm5Da0t1Rk8yZ1g4?=
 =?utf-8?B?akt1ZHV1TGxFa1lXQUkwTU1Tbk1iVy9iMXN0VWluVkxKdk9udytqdnFzN1ho?=
 =?utf-8?B?cHByTlkvZ2E0L0g2U0xlVnFEak96WGdCTWFGWVdEb0EwNkRxNThXNEM1UDNz?=
 =?utf-8?B?Q1c4VHVpSEVWY21ZbHdlSHhSK28yL2lySmhFYkoyZFZNZ2ZXUVRyWEtlOEZ5?=
 =?utf-8?B?bUt5eUNFTU96T2N5R3FieWNTV0VzcFFHbUorTjVIQUUrc0QrODQ3TUtmMDRm?=
 =?utf-8?B?dzhuTVNyeEJ5emFPNW95Zk93VkQ3NTYrVGl4VzI2NCtBUDUzOVBmTXM2ZUhC?=
 =?utf-8?B?aXRXK0ZOWkZNak5HVHhucmh0dmZ4WGcwZWhFSmI5TVo5OGNEeDAxVVNrRXBY?=
 =?utf-8?B?Q0dqYlZEVXhPWFZTVnRjbU5rZTE2eDVkVkhla2UrSnp6bStEWmZ6ckVSckVx?=
 =?utf-8?B?ZFFUZUxQSXo5ZlIzS09ySEhSY0xJaDhJMXZwYWgzUnY3YVFBeC9FRW4yelpi?=
 =?utf-8?B?NVdZKzExZ1RuUWJhdzFieGpURDZVNzRVU2NmeHp0aWV2bEpGOGJDemszTTM1?=
 =?utf-8?B?a0RNdDZPbFlVSjNvYytnbC8xSXh1OWkxZ29QKzJTVm5NenZJNHlFc0tBOWFG?=
 =?utf-8?B?ZXhIVk94WVpnbDNLRW9OakxVazNqN3BTRis4SDVWOHZvc1NtZm1QanhjZWlt?=
 =?utf-8?B?ajJyWGNLemYzYTZpenQ5MUo4ZUdMcSs3Mi8yU1d6QS9UdGZvd2RmOXIwYzg4?=
 =?utf-8?Q?p0u2/hFo/EoqK9oZqxvwnRQ78uOrMzK7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1g0aE1OTE5GSUVwSWk3MC9TMzVUSDl2dk5NeUhNRUZjcDltMHFlN1Y0QTJh?=
 =?utf-8?B?Zy82UXBuUHpHbFNOdXBUOHNqTHNwS0FFZnVKcVcraXM3WWZwSEgxcDNQK0hx?=
 =?utf-8?B?QitqZUlnMk9JK3RDQjhtRmpvbkVBTmpKTkJPL3V2YXJBVlYrakpycGV4ZlNU?=
 =?utf-8?B?V1AxY0RSYmx6U0c1SzRrMUkrYnh1WnpmeTNZVFV0eEIxREFmYnRidHpWOHV1?=
 =?utf-8?B?NStzcm95aXAxMCtDeHM3aEpxc21xUWlLdFhpWms1Vk5lMmg4YVFyUHV0NUZt?=
 =?utf-8?B?M3Z1OGpGYnBWcWV6bDZnYmFqNFIyWGtZcm41RlEwOXNxUkhKMkExdHlDVHd0?=
 =?utf-8?B?VWVUbiszMEt3MUdsNmtVU256OVdWNXQ3REdTbEVmaFhYRXc4ZXZudmE1U1dn?=
 =?utf-8?B?MjdmZFI3YVdodWFYNGZJc0tZQVk5S1lQZ2p3UkZTMWEwYURySTBJelNHR1g3?=
 =?utf-8?B?OE5kUER4RmR3VnNaS1JuTHNUeThmR2RuNzVycW5mUUNHUDVpd0FOOHB2T2E3?=
 =?utf-8?B?UTh1V05kZWVHRHFsRDNxSUI3V040YVorVFhZcGZiTWR5ZkRNQmJWTlkxTDZn?=
 =?utf-8?B?blkzWWliQ3hBcWZoRmxxZVZ6VVZ4YXFGVGlkSmwzTjloeE1wa3kxL24vZkZ3?=
 =?utf-8?B?cHNlUVpCdzZzWHR1QTc1ZUVHUXVwWXQ5QjJSM2pwT21URFVBWkxzaGRKcTM1?=
 =?utf-8?B?OFFwT3U2QmlZZkdFN2NiNGo3YlpCY2E0NjNCNk5qd0lDUjA2UTVmcXk0ZWZP?=
 =?utf-8?B?NWhoTG9qYnlhcVVvclA3Q3BIQ1hoci9paUtwWW1Za3RXRWEvNml5TjlGcTRz?=
 =?utf-8?B?blNVdHo0L3N2N1RFSXNqcS9GK1paZmNOaGZyZkpxZUQrZ3pySXJaSzBFZS9O?=
 =?utf-8?B?S0prR3ZmL0ZGRCtuMjlwbGI1bjVEa0MyYlhxaXZWTGNjcU4xZ0dHRUo3RmNC?=
 =?utf-8?B?VE9NN3M0WFNSVzRYVmZPREJIZ0hvWVgwZG5KaW1SNFNZWWxGRm0zdUFKNGVl?=
 =?utf-8?B?TE52N0dFNkN4b0tQZGRSZm82dkV5blB2QjByNnhSK01SQUpyUTB4YmQyNDZa?=
 =?utf-8?B?RjAwQW1Pc0xUR0VUOTZmS0FuOFdPbjA3bXJBa2Z6WVgycUZlaExSOTVTampF?=
 =?utf-8?B?QlA2dW1yZlFUamdCK3ZlbDNXSDlUMEFIY2l6dDUvNWtyZDdsQ2g2ZFBUNDJa?=
 =?utf-8?B?cDhQckc0UUJVTzh4dEZ0NEN1eVRXV29rZ2R0bUc2MEZqQ0FKTUd3VldqUkVG?=
 =?utf-8?B?VVdNNlg1dTBpRFRyQlloZFZWMWtMVkxhbkhLbkhpcGd4ZGxUMjF1VDY4bDdR?=
 =?utf-8?B?R25Vd3hXOEJ5WjNMckxOUHVjQS9rNE9YbHQvRVRSWmFKeVJLeGtDVXZSVFRp?=
 =?utf-8?B?b0hVcWFOVEwrVWk4MThzUDFnMGkxNXlEcXdzZ3MrdENkUHlaZ3pZMVA2bCtX?=
 =?utf-8?B?aFdVbWV0S3ZHVTVFb285aVh0N2RKcDIzWVQ2Um1NUm5NSUNVS0FYMktpNnZM?=
 =?utf-8?B?ZU9TUVFvYnRiclM4ZTFxSnhqeWhPM3QyRUEzNHViTWxoWVZFSjFyMDkzWGZM?=
 =?utf-8?B?Qm9SOCtlY0JTN2dNMzUzTEU5WUhGL0tPWWxNYTAwWklVNjEza3d5TTNkM2pJ?=
 =?utf-8?B?cEVTTjFwNSt4YUIyOUJWdEFvb08xUE5kTnljcWYwa1Z4YVI2Q2RManV6WmhP?=
 =?utf-8?B?UitYL2YyVlUrbjVuVVlyUHR6N2NObEF6WXlIb2VSY1FlUngwa1J6QStVTHl3?=
 =?utf-8?B?SWpINU5KMHpoWE9PRVVFVzZiYlRJYWpkYjlMK0NJTHRudDdkNEw0ZWFOdzZK?=
 =?utf-8?B?UGtzREszNDlqaDRxZ1RzY0M1RCtRYjhSL29iRUJLelFNN3hYVG1nUXczenhV?=
 =?utf-8?B?RldCejh1OEh3R0p3c1JNS0VKR3JNVWRBb1E1eG1YYkxWRDQ2Z2ZmUVJ5bEpT?=
 =?utf-8?B?Nk1YVm9RREdtejBpbkt0R0J2Q21XV0dqV0Ivekc2T2Q3ak1GK3ErR3loZlFq?=
 =?utf-8?B?aWxEMzdGbkpyayt6Z2lyU1hlVCtWWlg4QllzWkltUldmZ25qUTAyTjh5QzZh?=
 =?utf-8?B?WVdQQm5IUmtqaTM0QjlTc0hXOXQyc09YTHFlK0tMUEdvQUNpQ01ucDdoYm5M?=
 =?utf-8?B?NWt5TGNYYVpWUDlKMS92L0F1MjdXdlgyNkVLQnU4ZW1LdkxOeHFMRHdSNWxP?=
 =?utf-8?Q?8KjF3EXofOZV3uSkbk6a3ziLdXCIkBibovzIQFCyuZ3+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dfaa0f-408a-44b3-cda5-08de36416e16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 10:06:18.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmSyDPEDJwQ23KeawljwqFgntvBLsG9Kk7bdkYBv35caSuVIN77PNaZYO8g/OD5zrgSNMMj1or85WQiP6tUPQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6395
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

On Sun Nov 23, 2025 at 2:12 PM JST, Alexandre Courbot wrote:
> This series contains a few fixups for the recently merged GSP
> command-queue code, by order of importance:
>
> - Some explicit padding required to safely implement `AsBytes` was
>   missing in the bindings,
> - A bug in the received message length calculation results in the
>   message handler being given more data than it should,=20
> - `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
>   bindings have not been updated for that,
> - Some items in the bindings were referred to using the version module
>   directly, instead of the alias we defined to limit the diff when we
>   upgrade firmware versions.
>
> All of them address "bugs" (with the first two fixing actual correctness
> issues), but since Nova does not do much anyway, they are also not
> absolutely critical and can wait -rc1 if we prefer to do so.

Alice, Danilo, how would you like to proceed with this series? We could
either:

* Merge this into `drm-rust-next` if you are planning on sending another
  before -rc1,
* Wait until -rc1 gets released and send it via `drm-rust-fixes` for
  -rc2,
* ... or just take it for 6.20, as it is not absolutely critical.

I am not very familiar with how to do things after the merge window has
opened, so appreciate your guidance here.
