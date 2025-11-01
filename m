Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF2C276F0
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 04:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7310EC3A;
	Sat,  1 Nov 2025 03:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kiSjMnjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153510E336;
 Sat,  1 Nov 2025 03:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpldoYjZbuY04Ix7Vn25VsMXb3Jlim5HPhciuswegA1/RL80bIxqMHKFlgmvCMZh8ujBYWyYowLWBlh8oQTkD0gw0N0g6aPsPLUwXOuz7CEdKOBxHLmCINr6ZGuquIWXQWct7WGJ2GtZ9YK6pYV2QxiG+C8qhsLQA7DMIm8vzctkUqsMERzO0IhaknxnFIsA3SYrbZ9Up8TORO+543jOdGV6ahMA4x5iooBLGDg5wSTAVNUNBwqhEkoNAwE7Jr1mOwHXqGWpZ2RAxjNapf3q21tCudfrxEGV1VvnKRVyxbcJrxqWlQf7PxzyYspn4f1m2IhJY5dubYPkVeSjw1vJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46WC8Y5PI26Hmd9Pq7XSXwGXaa85sifvJ1J/hd0DT8Y=;
 b=wS+13FHxI+sMInGeFpv00SgVXJ3eX1mwMCQpfoieIfdaxLt8Av5TYAOynUkbPMWlPK2KF3bepvnfOl4HbNkY/Sqt+vcj+o2Scg/igXES0FYPAbAI/rmXS8W7WdJmAoS04kOUeMCK4LEF78YghrreUo7iiOiHKgnjyc89g7+EJvPSK2YcuoDFkTLR77x+uvRGRl14qMi+o7Fn4/VfKtlY4utYdCA9ru/AC0vsbM7bv5UiokS6vwplhZpwUR1lpIOLN8+tKFoufJP19JsE6QJYcHOOH+AQyhoxrjqsL3T8T8kmj6IrZHYUI1SDRea20RlV3zFAAXPfETvHxbcaKpaP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46WC8Y5PI26Hmd9Pq7XSXwGXaa85sifvJ1J/hd0DT8Y=;
 b=kiSjMnjdmOZETVTlKDeB8aTRYzqrOnR6JCy4fgDlZOYnxTy2sXXj3b2MqjuzN9VqeWtpnLwHSyP2REUaI4FlBjBKW7vQ4n6/pP6wYO2sdzQJLNLmfQ904rkH/sjDNuThTAgpVjT2AfdcXVaaysmj+O/D+G40jWxgVd3Ngsmpy7ycsPhdtI8tnv0kBlansa5T7WO7QPPU/W4aIs0J6d8WDPxpLFq5GTRgFllJykP4/C7S/YGsFK9ZsxnlkWnWCr1CP7Llw/wVn5JKowyvZEywsOdyK53EKbCJ0BONujXyrhl9kFe8H4E9CDxw2Inj9+dycKZV/xwWiApjAIfpNAbvmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 03:51:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 03:51:37 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 12:51:32 +0900
Message-Id: <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
Cc: <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over
 C linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: OS0P286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f48293-3ce7-4a5b-7ac6-08de18f9f4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTNLVVVjeGF2ZW5BcllnbmdnWVJJRm80VzJFekNtY05UbzVSVEI4S2M4YW95?=
 =?utf-8?B?MXY2YmZlZjloVEcxSlZEY3lrYVdxYy9DTzBkMW5EVHJSTVBaa2Z6cDgzdTFw?=
 =?utf-8?B?eGp6QytVMkc4a2gxcHczZm9kbmtNblRPVE5IYkRNV1Z0dEY4SVJuZGlxNE5S?=
 =?utf-8?B?SElwMUlvWVNaOE9Bb1hmTDdmbVVGQUlHVFpINC9QSVhaWXQ5SEkxV3NTSWVn?=
 =?utf-8?B?YkVpL2MzcGdKMG9lN2tKOFNPTDhVdUpRYi9xQk1oaE1oWGN1QUJLeHNTVDE5?=
 =?utf-8?B?NHMrNW1JQUplb1pwOG4yM05wdVV4Tk1UbDYwSHhITDFZRzZyRzlOQTFXa21O?=
 =?utf-8?B?MWlVZTJUdU9nZ3hvaVFRTHBENDc1MUE1YWtmTC9BREJqMmdHNllkcXo3RkRo?=
 =?utf-8?B?ejgrdk9sQmQrRUZXaVhKN0RZNWFBS2tpUldOM3RJRVdwb0pEVlJEL2dVOEFI?=
 =?utf-8?B?elhUc045RzYzbGpwUEt0QTZnMWc0bVhGY0I1cEFIczlKUlZkNm54alFFakVk?=
 =?utf-8?B?RGlxNkZ0eVE2dUgyM29LSWxJWEh0L0cwYklRU0ZURTBHY2t0ZEhwaHNPcmVY?=
 =?utf-8?B?SE4rWnlxZVF3RURucFpnRk1WQXMwTGtNSWovMnl4K3QxeVRNK3ZTNWw1SHVI?=
 =?utf-8?B?NXZ3L2VCMitoYzNjanpVVWlMQTJ4bDJrdWNCQlFKNmp6eUhYZDEyZ2UrbEND?=
 =?utf-8?B?OWl4VlRpenNVYWp1bmlxNC9BUVQwdjdXTTVldGN6cll3NHEvRG5iL1NNbHlT?=
 =?utf-8?B?UHF3N2xwL1M4VjJFWTFudEVISnJoU1pKR1hLbWZQcC9qcjd5ODVDb1ZRTklW?=
 =?utf-8?B?QnRGMGRxd2E4QVRub1N3TWtBNHBaaHlXYk56WEYxSnhsRXJ2Z2VBdzd0Z0ti?=
 =?utf-8?B?SGpLajJYVWYvOENNWGtJakpkbzgwNVpEWXZxMnJad3N1RUNLVHB3a3k3TEZi?=
 =?utf-8?B?ZS9hK0licW4xdlBLUjI3TWtTNDBndzg0QkxjaEtaVmp5Rktyc3oxTURkamhB?=
 =?utf-8?B?NW5UV0x3cUFlcHJ6a0RjZzMzVk95STJjM0trZURwVTZkSnRTTE9ScUorcVdt?=
 =?utf-8?B?OXNQajVma1R4aHNIZGk0R1VSSW9NRzhyajUySkxDNm53T2Q2SDFjUnpKc2RP?=
 =?utf-8?B?bERaQVBBQkF4MXY4ZEtwNFdaWU15RUFwSXJXRjNyOXRYWFZCeG15VTIrcU1J?=
 =?utf-8?B?TWxCNkRZZ05yZkdlbUNWZUQ1S2M2QmJVRnJNMnBIdWVCbWJacjVOWVFiQnlZ?=
 =?utf-8?B?SGd3aGVPZVRHUm9EbVI1UlhaMXdaL25WbC95aE02TU1NaVFLQW9FZEZoZFZm?=
 =?utf-8?B?cWREbzFJOWU1SXVENThiRGJ5UHk1dkx5TEpWU01HVVpLbEpFOGU1MXVEM2pD?=
 =?utf-8?B?R3NVL21ZOXpiMkkxYklDSkRwMWZjUFNVcGJoSzZlNytBeW8xMWdRcW1xdzBu?=
 =?utf-8?B?d2dBZFlJYUphVllhTE44OWdYR3FRRnRPT0FPQ0NUakx5OUhxM3BqSG5sV1lh?=
 =?utf-8?B?bWZwZW1DTWpSZkQ3UXhwbEFQTXREa0EvT1NON1lkZC9rK1ZtVk1CMldQc0lQ?=
 =?utf-8?B?b0h3UFlMb09QTXBDZkRhUDNsQm5ZMDVHM09QMGtrcXBwTitzd1lXcGh5VEhC?=
 =?utf-8?B?L1VlOHFSRFY5RGZmNnEwaXZwRTFacWRSN2w1YWFObHpkSTNpNkczVTFSZExp?=
 =?utf-8?B?ZWw5WUZEbGFzQnh1VHBnSm1BRTJiSCtCbWNYOFhYUVZ1ditRd2FjUnZpVVo2?=
 =?utf-8?B?VFdxTm1BOEtIbFpSZlZaK29wL3NwbVhGK0JFd1BoeWJ6U0F6c1h4SjVPVjRN?=
 =?utf-8?B?dXBsRjNvZ1hDa2R5VXVlTXZKRTRIMzZWaUVHOG4yYURQRVNWd2xWaUNuWHgy?=
 =?utf-8?B?VUZQSXRuRlgraGlqVnEvVytuNnlTR3hMNlprLzg2QzZKVG9GNFBuYWdNWHhM?=
 =?utf-8?Q?9SHEh9b1w0RASuBYxiof2e2LFaLZznNw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGN1c01rNmU1Y0cyRGtMeDNFdjBhdktnUHBLOGZCTGd2UXRyeUxjVU9sUkZq?=
 =?utf-8?B?TlhnSXVTVFM4UkpsVFpkbVd1c0R0TlA5SDdNUm1pUkpnbDB6YW5HK3ZBbVVh?=
 =?utf-8?B?WEZaNkh6WDB4MHhxaHdmQjI2ZmRmTk1SWVlmK2M4cXZ4dFV5YXFKU0p3OTdt?=
 =?utf-8?B?OS9LaElrRnRNM1ZseXN4U0V2RS9jc3h5RHp6ejY5ZUN2WUhNcGV4b21YdHA5?=
 =?utf-8?B?VEhsSTVCNEdJVDFxQU5rL0I2NlJCWURlZWxmMytCZTU5UGM2L2kyMlNySFhR?=
 =?utf-8?B?VVNhbndRQXBGMUN4Q0RvM255NDI2b1cwdmZlanVqQVVYai9uak1SL1F5ajBX?=
 =?utf-8?B?bnV1UzE5WGlEZXNMMzRuM09hRHgwWEZVUlJaQk9TVFZ6U3JhdnBFcnV2alVU?=
 =?utf-8?B?N3E2aWNvTUVHamFuNTdsT09pOCt1ZEFXdDlmZURrSE5QdGE3SG9ReDd1WXRr?=
 =?utf-8?B?Y2VvSXZEZmdLbnR1VWlIYXROSk9FcWM2SzE0c0lQRzZkTUVYcnBSTG9lcDNH?=
 =?utf-8?B?aEFzcDRlRnJlRytZQ2IwRGNPL01DMENiVmFPeDFIdkJ3YWdFNXNnRSsyUW14?=
 =?utf-8?B?WUlhUmpLV3ZyOVM5bTQ1aWhQT0xiVWVNT2J4ejZDb3BCQkJnRnNEU1VJbC9M?=
 =?utf-8?B?bEdEY2MwSFBtckYyRkRRNGJFS01ocFZzNVVseUVXTkJBYkJ6eGkvTmwrT2Vi?=
 =?utf-8?B?d0pGaER6V2lkcWRuV3lrTTFSbW9rSmZoaDd1aHZDZnEvQ3k4bituWTRYTkhZ?=
 =?utf-8?B?d1lBR1ZHY2s5Tm1mMFkwK0YwWE03bEhPOEl6ZzcxTUR3Z2UxY0pia0xQR2ta?=
 =?utf-8?B?QXk0QWs4eVRENEc0SmQwaUtkOGtNNlFCbGtma2RDcmc5V3NWVjE1UXIwRENW?=
 =?utf-8?B?Q3o0M1NodWU1UnE0SEFmaGlvbXFESlducTR3MkJGN0lSRXpGaStHMW9RektY?=
 =?utf-8?B?T1lhZnozMWxRWFZvbDVoS085VWYxTnIyd3BLTnF3N3ovbDRmNTdXQU0zdjlm?=
 =?utf-8?B?cHIrSG5KeHpjdi8vZHVCcm1tU004NHZGczVEVTFtRS9KakpZc1UrODZEcVZa?=
 =?utf-8?B?WnMyd2RrOHJjbm1lRlUxMThablRWcmpEb2xGYVZGK1FQVEZuSUk1TzYrb25v?=
 =?utf-8?B?Unl4U1cyQ2tkeFNabTBETkpRWGJMTzQ5SEpVMVk1YmZ1TURHRzczaEJid2Jt?=
 =?utf-8?B?UGEySlVBeHBqWDkxQUp3ZmlnVHIzSmVPWFJ0VTBnMm5HWGluK0VpcngxT1FW?=
 =?utf-8?B?aTlTWnRBUUt3ekJRQlVaeEJHUEgvamxKR2hHdytKL3pRRHRlN3NXTDVVK3Vs?=
 =?utf-8?B?M1QrU2x6dHIzT29wSXV3bkRsWUF0ejRDUTg1TFR2WGNmNlprd0NyOGp6VTlq?=
 =?utf-8?B?VDFNWGhuZHkxZjAzMzFkQlZ5am5Nbm9ER3ZvMmtWYnNiWVUyT3gvMENaenNN?=
 =?utf-8?B?Nm5SM3VmZ1d5ZkJDYnlEZzhwUFNCa29KbkZBbm5Dbk5qOXRNY2F2aDI3ZGQ5?=
 =?utf-8?B?RVd2alhXTmtGa0VqbkdpZk9jZVFEc1JuWXQxVDZSSE9VRFRoTm13aUw0eHVa?=
 =?utf-8?B?R21udTdpUzduUWVTbDBWQ1U1VVBuMWMvQXgwdmxrT2NrZzdpeXE5R3hNVFpi?=
 =?utf-8?B?elBTNzVvWXZpekwrUXNnTHRPOWl5MDFnMjV3bkxFVVhHN3BYVmpBdmZrQ0VS?=
 =?utf-8?B?RlRsMXR5YUlLZWFhNFVTaEVPL3NzRjYrRExobkM2QzNTMnhTQXBiL1M3ZjdU?=
 =?utf-8?B?Z2t0RUg0VFVTOHZCVjh4ZWFvMVJKd2hlL0lCc3l0L09QVG00NU5KeDc2Zjk5?=
 =?utf-8?B?SEhVMkxoNzJNNFRPMHJFYUErQWxCMTVqSkc0RzFqbnhhVlhmMDVZS0w5cnpK?=
 =?utf-8?B?a2cvLzJnd2ljSThLYzBKUlpMZWw0Tk9JQW9vMFJkVEhpVHprNW1UenhCdWRV?=
 =?utf-8?B?ajFtZXdmRS9GOE9tbE96QlN1NFl0Nng0SFQ1TWlkRlk0bXJnaFhyMkNFUnM2?=
 =?utf-8?B?WTJoWDBSZlArb3VHWHI5SkhyNll1ZjJvMUNIN0tKVHhqSUkySjlhOCtJT09Y?=
 =?utf-8?B?ZVozOW5VZ0plN2VmMlU1MHBxLzQ5bVorTWdPZDF0NkhvY1hiRnJDV1puakpZ?=
 =?utf-8?B?ejYxUUE4dTBXRU03VnpMVVAvMXlkV3Bta01wL2pBand3VUhndi9aallLRHBU?=
 =?utf-8?Q?TUjAdPlrs6ahLLle9L58Ll+6KbXhCH6owZ0HaY2y63LT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f48293-3ce7-4a5b-7ac6-08de18f9f4ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 03:51:37.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTulna8uimmT7P7OeCr//BCVNjHWU0eD1+S9eEqfAL3QRAlk9lKCuOEEqNO/Oa7lfzsCyZ9jlEuf6A+cpA1QVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483
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

Hi Joel,

On Fri Oct 31, 2025 at 4:06 AM JST, Joel Fernandes wrote:
<snip>
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..e6a46974b1ba
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! List processing module for C list_head linked lists.
> +//!
> +//! C header: [`include/linux/list.h`](srctree/include/linux/list.h)
> +//!
> +//! Provides a safe interface for iterating over C's intrusive `list_hea=
d` structures.
> +//! At the moment, supports only read-only iteration.
> +//!
> +//! # Examples
> +//!
> +//! ```ignore

Examples pull double-duty as unit tests, and making them build and run
ensures that they never fall out-of-date as the code evolves. Please
make sure that they can be built and run. Supporting code that you don't
want to show in the doc can be put behind `#`.

> +//! use core::ptr::NonNull;
> +//! use kernel::{
> +//!     bindings,
> +//!     clist,
> +//!     container_of,
> +//!     prelude::*, //
> +//! };
> +//!
> +//! // Example C-side struct (typically from C bindings):
> +//! // struct c_item {
> +//! //     u64 offset;
> +//! //     struct list_head link;
> +//! //     /* ... other fields ... */
> +//! // };
> +//!
> +//! // Rust-side struct to hold pointer to C-side struct.
> +//! struct Item {
> +//!     ptr: NonNull<bindings::c_item>,
> +//! }

As Danilo suggested, using a e.g. `Entry` structure that just wraps
`Self` inside an `Opaque` would allow capturing the lifetime as well.
Look at how `SGEntry` and its `from_raw` method are done, it should look
very similar.

Doing so would also spare users the trouble of having to define a
dedicated type.

> +//!
> +//! impl clist::FromListHead for Item {
> +//!     unsafe fn from_list_head(link: *const bindings::list_head) -> Se=
lf {
> +//!         let item_ptr =3D container_of!(link, bindings::c_item, link)=
 as *mut _;
> +//!         Item { ptr: NonNull::new_unchecked(item_ptr) }
> +//!     }
> +//! }
> +//!
> +//! impl Item {
> +//!     fn offset(&self) -> u64 {
> +//!         unsafe { (*self.ptr.as_ptr()).offset }
> +//!     }
> +//! }
> +//!
> +//! // Get the list head from C code.
> +//! let c_list_head =3D unsafe { bindings::get_item_list() };
> +//!
> +//! // Rust wraps and iterates over the list.
> +//! let list =3D unsafe { clist::Clist::<Item>::new(c_list_head) };
> +//!
> +//! // Check if empty.
> +//! if list.is_empty() {
> +//!     pr_info!("List is empty\n");
> +//! }
> +//!
> +//! // Iterate over items.
> +//! for item in list.iter() {
> +//!     pr_info!("Item offset: {}\n", item.offset());
> +//! }
> +//! ```
> +
> +use crate::bindings;
> +use core::marker::PhantomData;
> +
> +/// Trait for types that can be constructed from a C list_head pointer.
> +///
> +/// This typically encapsulates `container_of` logic, allowing iterators=
 to
> +/// work with high-level types without knowing about C struct layout det=
ails.
> +///
> +/// # Safety
> +///
> +/// Implementors must ensure that `from_list_head` correctly converts th=
e
> +/// `list_head` pointer to the containing struct pointer using proper of=
fset
> +/// calculations (typically via container_of! macro).
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// impl FromListHead for MyItem {
> +///     unsafe fn from_list_head(link: *const bindings::list_head) -> Se=
lf {
> +///         let item_ptr =3D container_of!(link, bindings::my_c_struct, =
link_field) as *mut _;
> +///         MyItem { ptr: NonNull::new_unchecked(item_ptr) }
> +///     }
> +/// }
> +/// ```
> +pub trait FromListHead: Sized {
> +    /// Create instance from list_head pointer embedded in containing st=
ruct.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Caller must ensure `link` points to a valid list_head embedded i=
n the
> +    /// containing struct, and that the containing struct is valid for t=
he
> +    /// lifetime of the returned instance.
> +    unsafe fn from_list_head(link: *const bindings::list_head) -> Self;
> +}

If we go with the `Entry` thing, this method would thus become:

    unsafe fn from_list_head<'a>(link: *const bindings::list_head) -> &'a E=
ntry<Self>;

But that leaves an open question: how do we support items that have
several lists embedded in them? This is a pretty common pattern. Maybe
we can add a const parameter to `Entry` (with a default value) to
discriminate them.

> +
> +/// Iterator over C list items.
> +///
> +/// Uses the [`FromListHead`] trait to convert list_head pointers to
> +/// Rust types and iterate over them.
> +///
> +/// # Invariants

Missing empty line.

> +/// - `head` points to a valid, initialized list_head.
> +/// - `current` points to a valid node in the list.
> +/// - The list is not modified during iteration.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// // Iterate over blocks in a C list_head
> +/// for block in clist::iter_list_head::<Block>(&list_head) {
> +///     // Process block
> +/// }
> +/// ```
> +pub struct ClistIter<'a, T: FromListHead> {
> +    current: *const bindings::list_head,
> +    head: *const bindings::list_head,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +// SAFETY: Safe to send iterator if T is Send.
> +unsafe impl<'a, T: FromListHead + Send> Send for ClistIter<'a, T> {}
> +
> +impl<'a, T: FromListHead> Iterator for ClistIter<'a, T> {
> +    type Item =3D T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // SAFETY: Pointers are valid per the type's invariants. The lis=
t
> +        // structure is valid and we traverse according to kernel list s=
emantics.
> +        unsafe {
> +            self.current =3D (*self.current).next;
> +
> +            if self.current =3D=3D self.head {
> +                return None;
> +            }
> +
> +            // Use the trait to convert list_head to T.
> +            Some(T::from_list_head(self.current))
> +        }
> +    }
> +}
> +
> +/// Create a read-only iterator over a C list_head.
> +///
> +/// This is a convenience function for creating iterators directly
> +/// from a list_head reference.
> +///
> +/// # Safety
> +///
> +/// Caller must ensure:
> +/// - `head` is a valid, initialized list_head.
> +/// - All items in the list are valid instances that can be converted vi=
a [`FromListHead`].
> +/// - The list is not modified during iteration.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// // Iterate over items in a C list.
> +/// for item in clist::iter_list_head::<Item>(&c_list_head) {
> +///     // Process item
> +/// }
> +/// ```
> +pub fn iter_list_head<'a, T: FromListHead>(head: &'a bindings::list_head=
) -> ClistIter<'a, T> {
> +    ClistIter {
> +        current: head as *const _,
> +        head: head as *const _,
> +        _phantom: PhantomData,
> +    }
> +}

Why do we need a function for this? The correct way to iterate should be
through `CList`, so I'd just move its code to `CList::iter` and make all
the examples use that.

> +
> +/// Check if a C list is empty.
> +///
> +/// # Safety
> +///
> +/// Caller must ensure `head` points to a valid, initialized list_head.
> +#[inline]
> +pub unsafe fn list_empty(head: *const bindings::list_head) -> bool {
> +    // SAFETY: Caller ensures head is valid and initialized.
> +    unsafe { bindings::list_empty(head) }
> +}

Why not call `bindings::list_empty` directly from `is_empty`? I don't
see what having an extra public function brings here.

> +
> +/// Initialize a C list_head to an empty list.
> +///
> +/// # Safety
> +///
> +/// Caller must ensure `head` points to valid memory for a list_head.
> +#[inline]
> +pub unsafe fn init_list_head(head: *mut bindings::list_head) {
> +    // SAFETY: Caller ensures head points to valid memory for a list_hea=
d.
> +    unsafe { bindings::INIT_LIST_HEAD(head) }
> +}

Since this patch adds read-only support, what do we need this function
for? It also doesn't appear to be used anywhere in this series.

> +
> +/// An interface to C list_head structures.
> +///
> +/// This provides an iterator-based interface for traversing C's intrusi=
ve
> +/// linked lists. Items must implement the [`FromListHead`] trait.
> +///
> +/// Designed for iterating over lists created and managed by C code (e.g=
.,
> +/// drm_buddy block lists). [`Clist`] does not own the `list_head` or th=
e items.
> +/// It's a non-owning view for iteration.
> +///
> +/// # Invariants

Missing empty line.

> +/// - `head` points to a valid, initialized list_head.
> +/// - All items in the list are valid instances of `T`.
> +/// - The list is not modified while iterating.
> +///
> +/// # Thread Safety

Here as well.

> +/// [`Clist`] can have its ownership transferred between threads ([`Send=
`]) if `T: Send`.
> +/// But its never [`Sync`] - concurrent Rust threads with `&Clist` could=
 call C FFI unsafely.
> +/// For concurrent access, wrap in a `Mutex` or other synchronization pr=
imitive.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// use kernel::clist::Clist;
> +///
> +/// // C code provides the populated list_head.
> +/// let list =3D unsafe { Clist::<Item>::new(c_list_head) };
> +///
> +/// // Iterate over items.
> +/// for item in list.iter() {
> +///     // Process item.
> +/// }
> +/// ```
> +pub struct Clist<T: FromListHead> {
> +    head: *mut bindings::list_head,
> +    _phantom: PhantomData<T>,
> +}
> +
> +// SAFETY: Safe to send Clist if T is Send (pointer moves, C data stays =
in place).
> +unsafe impl<T: FromListHead + Send> Send for Clist<T> {}
> +
> +impl<T: FromListHead> Clist<T> {
> +    /// Wrap an existing C list_head pointer without taking ownership.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Caller must ensure:
> +    /// - `head` points to a valid, initialized list_head.
> +    /// - `head` remains valid for the lifetime of the returned [`Clist`=
].
> +    /// - The list is not modified by C code while [`Clist`] exists. Cal=
ler must
> +    ///   implement mutual exclusion algorithms if required, to coordina=
te with C.
> +    /// - Caller is responsible for requesting or working with C to free=
 `head` if needed.
> +    pub unsafe fn new(head: *mut bindings::list_head) -> Self {
> +        // SAFETY: Caller ensures head is valid and initialized
> +        Self {
> +            head,
> +            _phantom: PhantomData,
> +        }
> +    }

I am wondering whether `CList` serves an actual purpose beyond providing
` CListIter` to iterate on... Would it make sense to merge both types
into a single one that implements `Iterator`?

