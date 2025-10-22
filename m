Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF9BFA4F1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38DD10E6B7;
	Wed, 22 Oct 2025 06:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XscXuUfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013016.outbound.protection.outlook.com
 [40.107.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E3810E6B7;
 Wed, 22 Oct 2025 06:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlWzQVVPSZqIHM7X9js/DfVWf3J0pmnoslx/1cwCLXPrttErnE+PgyohXq9iNvtC+io0s4C58/0Lf/aRWc5felSEq/PMjRoZVug8yXbcBYytGkY077zh363eRukmY8XPm329b9FCoBCN06k3SgNTkp1NhBnZx3yQ69uC9pceRtVMpxwTKKqbsuk08VOTNojFXtCNS9RpDVYBtMjT3UgBrJzJbSgcj1VdyImPkt8yhD/b+8CHF9rlU72Opc9UfZbT1RleK57ymImIzjGu6rW/cv554cf9vmBHJF3K2PKSZ3TQXvCWMAVntJzOpAket+10SDHxEBqg3sjBQNxyyoj4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORkwCmkijdAC0itxK48UHA1kOYT1Ek+gYM9GQDNXBe8=;
 b=T9TGLDtQnMWTxqF2oDGZ9ph2NHChFQG0G1OrWqbdQ10a+rdkiw9/YdtBoQTJUtZ9YFW4UaPAVlLhNE70/GsKnr0Po0g2zvJo3PTPzu6ivdjqBGt2tE4xOkDeABjJdjtWByMcP/+5XDlB7HfuerSzagenWcm+wgEhHetOjjYOEU/KKRR+rap1WDeGmUm4lrbCH6VhD/ikZFysYp5h9zppF2Aq7Kze7ieIRy8T6KJDn0z0NyqfW9LszFi/wNCIZFG/NuMN7FzPa5RZ27lFkFT74I+g9soc8BS5q+72SWKTxCpTRpkflKaSIKkigciUlDZHW79IocLXLcn5LIf/xQCfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORkwCmkijdAC0itxK48UHA1kOYT1Ek+gYM9GQDNXBe8=;
 b=XscXuUfRhgvQnP6OHjSs0SRy9Gifcs60Yj5YWzyroIW4oTWmFyCHyej6zRSWokLJtDmG1qWT8F5QZKBYpN9Snhw5juz1L+nLlY0Wh35TtOePe9QNf8wMmhdtPMk9N75Qa4ELpbVKzE4/N/FD6ltkmLmnj0f550ESD+I3fowuDersqtdjuyOH4li9B8bFwQBS3pS+Zr4Sc7qyDfjjTfhe7qK3X53WTI9d2sygk98X18KYV9ipXSjUV26SuZ57tfo33q84zu0BPrVxRh8FD3QrViJYx3gBmx3R8V7RCa9KZT+XELNvpwNi/vyc8Dz7u08hIaqvf7lFaTjgaGHHuEd85g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9408.namprd12.prod.outlook.com (2603:10b6:408:208::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 06:48:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:48:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 15:48:41 +0900
Message-Id: <DDONF5MY5Y8F.1LPCBN4MBL5RZ@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] gpu: nova-core: Add support for managing GSP falcon
 interrupts
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-6-joelagnelf@nvidia.com>
 <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
In-Reply-To: <4553a31a-fd13-41c4-8bcb-3b830cd7b661@nvidia.com>
X-ClientProxiedBy: TY4P286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4b38f2-cd4d-42cd-d5b2-08de11370ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWRsV2F3K2xKZUZlODFtSVkrUW5iVGkxM2MrdnBoMExSSDN2VGIwK1BuQm1J?=
 =?utf-8?B?VzE1REttWnB0MGlyYzN1WlkzcnZhYzBnakpkdFpCc0Y3cEl3cW5LQkJKbkZT?=
 =?utf-8?B?R25pcVVzRDkrTy8yQllsYmtuNWJRZ3kwN3FMdWpxSVZZellJUS9hTFRFQ3FZ?=
 =?utf-8?B?YlNDZEZUM05TdnkzZytIWTlFQ04rQ1c3SkhQM0tqcHJJRFpsYTloM0pMdUpN?=
 =?utf-8?B?RjNkdm9ON0xLVC8rQU5RV3hhWlkwK1NraS93Q1lTWHhFYVZvdWdnQllXb2lx?=
 =?utf-8?B?OXJCcFZEVFpxb3FIbFZUYjUwL1FaN2dJMEJJNGtqQUtXVEhWVFJrMFpES0s5?=
 =?utf-8?B?TVYvRmJPN1FoeFVVNG1zTFBsV2xHK0dmVG1pNXVORUFIenF5R3Y4NlZnOXFl?=
 =?utf-8?B?TkFVRldxSHIyNER0THZsdWFrQVRUZTdPeWhjaTJjaTc1Vnk3c3B3S0dSNVNF?=
 =?utf-8?B?QkdYRlh2NzE0V2t3b0hBUTVpZS9DbHFYRHh1d0NmZWNDc0hXVWIxYU94U1Mx?=
 =?utf-8?B?ZzZuTnQwRzV2aHVzU0NaU2ZmVzNEdzdjS2lDeGQ0N2hCdnFtcWVsdkxOZSs5?=
 =?utf-8?B?aWpOZHl6NGcrM3pOd0hsdnU1VnNmTUR0YklITzFDbDJEck1abFJoSGxRNy9Q?=
 =?utf-8?B?OTJ6M3RrK09vay96L2FJSW9DUXoyeHdmTDByY0JIVVkwVllMeXFublpnaU5S?=
 =?utf-8?B?NXRlbnBBbk9mL0V6SUJGdlVYc0lianZMWk1tSXYwTDhOVVhXdlI4VWlZWTVR?=
 =?utf-8?B?azE3NUFLZDZNMFlWc05XQlNCY3NTS1gyclU5aHo3RzF2VE5VU0E4RVB3QmJw?=
 =?utf-8?B?a0Q5cHluekhybzhaVWdXZ3BkaTZrSFY2V1ptbk5RT3RrSmhsTGJiSnNub2s3?=
 =?utf-8?B?d2dtdzJmUEJRbUNDcW1ES2p2N0lkUGQ5ZDd5ckRQSWhWb3ZtaERqOHVhQ0tG?=
 =?utf-8?B?anhVd3dlWkZpZlYvMFY2UXg1b2NDd3djMkd4aGd0THR0MXRHaVloSEEwL3ZQ?=
 =?utf-8?B?VERpWm9icE43WnZkRko4Rko2V3Q1QUI4TFBXcXJ6VTVvQ3VaRnd0Y1YzZ0JY?=
 =?utf-8?B?dWdmZXZSb3AwdTlRTmZxUUNpQXBGSmZBLzNjU3lLZ21iSlkwUlVxMStYSTY2?=
 =?utf-8?B?cnVEQkRUR1lXaHdKWW43cVRYQXR0N1ByWkRzOXVESjhpRlVDalROYXlOVHhw?=
 =?utf-8?B?KzV5cENSaGU1SzBuUm1FOU1oL0ZFWmdRL0xpM1BRQVYyK0RoK2tmWEU1ZkV4?=
 =?utf-8?B?U2xhWEFsemw3dERGYVdDN05yKzJYNHVMS0QxaDdGZExsNEJNeGJsTWp6dDZ2?=
 =?utf-8?B?TURrdU9iTFEzWmFDOGNJcFpoWHdCVHVZTnNMUlhWMDdFNW9OVFV1YVg5WmQy?=
 =?utf-8?B?QjZFTUNZem9yT3RCSlBkVDNxNmlTaDJZbks5NGMyTWRnb1dibXhFYUJMTnEv?=
 =?utf-8?B?c1lEUDBVUkJzTHZDS3NWM0szSlAwMjVEbXJIMHRGNzlRZG9KQmhEMjdPUkVh?=
 =?utf-8?B?UWtWUjdHajMranBBNEdUZHV1RnhCeldxMENsZjdTT3RBN21lOVpmKytxc1FZ?=
 =?utf-8?B?TWtONjZEblBFc1NaMEgzZENIeEpvZlI1c3RRN0xvTW9YMnZ3VWNoZjdVV0dF?=
 =?utf-8?B?R1pCQ0FRRFhZZmpyV3YyK1liOCtvMVVjVEVDdW9CSmw3bmk0WVFaVktWWSti?=
 =?utf-8?B?UXM2VDVERTVRUVJpbFdCb1hIUTVHR3pXZURQaC9qd3QwUi95SmNvOXRlazhS?=
 =?utf-8?B?ZmU0K0owWHZtTHF1akFuMERPNVlMN0N5S1pKTHhyYVdLckY1alkvZWkrNUo1?=
 =?utf-8?B?MlNhY1k2VUNvU1k5SWtGUHhxR29xSlN1VGZJWDlIdlROYmxIdGw4VE9sdHNx?=
 =?utf-8?B?cHE1MUMwSVpWVHJoN3F0eUxXUXI2NW1JbG5DUEx6b3o5cUlHTENSZ1F4TUhV?=
 =?utf-8?Q?bi1xzq9cJp2PGX6YyNwKejSoYMA56JJN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFqNUxKajNncnJidlB2WkpZVVdham5PUE52T1NXb0RBcGR5ZHdnYW5zRWRT?=
 =?utf-8?B?aUdqeGdMSWpkQWZ2ZzMzelpMc25wZ0x3cGRnQWVVb2lDTy9WaFNzNUpzUnFi?=
 =?utf-8?B?RDZxUUdOUVFTNndlOEhMcXgySGhtVGpCZUkyL0xTNjM4a2poa1Vzc1VnMkhR?=
 =?utf-8?B?K1FaU3Q4aS9kMzJXdDlCYUlHZ0U0aThrKzdXOVFtTVVTVWlrZ1NHbXJkRkdh?=
 =?utf-8?B?a1hqQUpKbG5EdFJDNVZ3Y3NESDNJLzFDdmVYMU9BUHpWM1RjbDlLUzE5U0VM?=
 =?utf-8?B?b200dGR0YXEzUFJKbFZzMkdqZmhNbHU3cWV3VDF6SERsbjhTVm41dm5IYW9p?=
 =?utf-8?B?bjRaOXhvL0xjUnhyY2p6b21lVFN4cWFYbzdheVNqYksrYjJWN1dFRWRja2ln?=
 =?utf-8?B?bkZ4S2xsKzdkZFdYazlia3JGdlo4ZGlXQ2lvdXRxd040cGFEaWtJV2NjMHBW?=
 =?utf-8?B?b29lS1d2QW5hK1RaRXIwQ2tuV0ZBVVFDajRFRkVHK2hHREpOSHZOOStOVlRW?=
 =?utf-8?B?MmN2NHM2MEN2TzRkNGd1NHFqRDNQRWhTVXU3UHM5YnRVRjFmYldiVUJKTml0?=
 =?utf-8?B?R2JFMzlzMFZNWHljZExZVlRwR3pSdWRtb0U2V2M2a2Vjb1R2NVphUkpaT01P?=
 =?utf-8?B?QWpjMFUwZE5NMzR3b1JobjBMTGdYV3lSMEQwam9OSnY3a2xvU3NoQ29naENX?=
 =?utf-8?B?VjNkRGRmSGViR0dTd0EydDk5b0w3MEU2S1ZrVkdkaDNYaVg1MHNpUWlvbXMr?=
 =?utf-8?B?SjFTcTh0YW9UTXY4Wmo3eXAvbE96RGxwUVlzSkREQm5RZmo1bVdHV1JweWFz?=
 =?utf-8?B?bVZZL0pvbDBGMko0bHF0Smp0UnZiY2MwbldyQ0JxR3hCSkU4THc1SFlQTmF5?=
 =?utf-8?B?b21kK2VDcmxzZmRvTENwMzh4aUc1NjNaaU92dHpRam1OYnVwanN6cGJBTmNS?=
 =?utf-8?B?MnNEZ1BWdzV1OHg1WnNaZ252aTBGdlJrZklJRFVUcWJ2SFpBRTRuS1I4czlk?=
 =?utf-8?B?VDFya28rK2tHNk0vL0JNL0thMWtEcFdSbjk2dzVSZHZ1WG56aFJZNkRQMm9V?=
 =?utf-8?B?Q2VQS0gxdXA3OTZDdWc0c3lJdlVORFMrdlFsNnBXMkcrR0xLS2g0UXhCTm1J?=
 =?utf-8?B?NktIbldDb0tOdzZmRFBnZGxQYXp0MFNHc3NYd3VkNmxpc1BQbzB1WmpCQnlE?=
 =?utf-8?B?V2QydWNjb1hjSXB4UmFnUGtXYmIwOFk2L2pBWXdKWjRHY2lwVktBSmZMaUQx?=
 =?utf-8?B?ZFI5YnpFWFdRdEpKd1pjZ0xZNkwyNmlkUDc0SE1wc1RCRWlxRVBOSEhNcDFa?=
 =?utf-8?B?MXZ3d2xGRUNIWjZNVnRvaXgwOGw1SGhLbWcwOEtmZ0l3cHFreGhzUkhkV1ps?=
 =?utf-8?B?Vml0eGtqOWNYQ0w3Tmx2RUZxT3ZjRldPQmJ6N2krRmd2ZjlCRVBQeENSc3lO?=
 =?utf-8?B?cFNncEpHUm9CRU9JQU93YkFrdE5kczQyQ0hrMW9UVGwrOGtPMUVMMmE2b2Nl?=
 =?utf-8?B?UXR4a3lFcGNWZGVrNHZ0bEhLV1FrU0tnenh4YVhIQkF6RlB4RGJHVWJGdzRW?=
 =?utf-8?B?N3ovVWVNRHpzTWd2a0NMOHBzWC9QbWRQWlN0ajE1d1JEc01BWVJ1Z0FaZ3Nw?=
 =?utf-8?B?Nm1ieUhEb3dvNWpoNUZJMkNxalh3R3NtRzN1dG9acm01YmVrLzJaekNZNzFJ?=
 =?utf-8?B?UzNySnJnUEhyaDRnUnl0T1hvcTZwMFdicFdOQS9UZ2ViNVdURkoyeUNldy9t?=
 =?utf-8?B?R2F0S08reFpGVXhPWXREM3oySnJETHBLa0dVNlFNMVEybUFKZFRWKytpdXV2?=
 =?utf-8?B?WndocmhnZW9LRDZVVFNVWGFoNTdQSHRkVmZ4OXRqa2RvcHQ3aHJRRElKNnZY?=
 =?utf-8?B?WWxMUlN3OFdXWVBCUmRFQXNRbHVHR01SL3RvdnR1RGZjUmkvUjR3TFRzdFdw?=
 =?utf-8?B?V25rS2N0OGxUbDdjeVpSM3JjNEwwTmxRbWZhREJ1cDV2UVRJUlZqdm05Z0VI?=
 =?utf-8?B?YmR1aGhodkpyWG5NOTArN0NINDVrclpQeVZKek9zLzdIRFAvc2Z3OGVIekJv?=
 =?utf-8?B?dnBnSVhZRGNYdnFsejRPeVI3azBUZHFJNnF5N21sY1RZb1FoYzFramxMWkY4?=
 =?utf-8?B?ZGF0SlpWcFNrUlM4Mko0ZVkrUlJ0RXZjZ1QwZEh6MlVKazRPWENETWgrUmZD?=
 =?utf-8?Q?1COsdvR/gNmy7ptncfKIw9Gim5A0ALkeGLAVFZSDMjHw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4b38f2-cd4d-42cd-d5b2-08de11370ba8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:48:45.2387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXJaKUSCBY/enIe10JVKD+47tMXD1arUyxnxpSOnbstZ6mU0DouHYPKfjbX1YtMj88bfCdN2dFVmQMvy1HZOSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9408
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

On Tue Oct 21, 2025 at 7:35 AM JST, John Hubbard wrote:
> Alex, this ".alter" method is misnamed, IMHO. Because for registers,
> The One True Way (or so I claim, haha) is to have the following methods:
>
>     .read
>     .modify, also known as RMW (read-modify-write)
>     .write
>
> "alter" never shows up in this naming scheme. I'm going to claim that
> this is a bit jarring for old hardware/kernel programmers.
>
> But it's not too late: these are only used in a very few places, and enti=
rely
> within nova-core, too.
>
> Can I *please* send a patch to rename "alter" to "modify", perhaps?

Oh yes, although I was just thinking that this should be renamed to
`update` for consistency with regmap.

