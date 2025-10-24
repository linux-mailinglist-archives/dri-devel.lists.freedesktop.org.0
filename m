Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80BC0606D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409710EA5D;
	Fri, 24 Oct 2025 11:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IOipthyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013028.outbound.protection.outlook.com
 [40.93.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5F110EA5D;
 Fri, 24 Oct 2025 11:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFV3vRxDjHm6REue0/yYkV9Os2uJzXECs5nPB1z+zHr/dNkLNWOYnX9GoxZ2GKSol9/iXcDRWNNhEcTPMtZpM2oQ7z92QthMpjVuUZ/IV7rCbu4NzSSpgX+gITs1ISJjWTsmeI3XZKUW75Xdtfoakf0y2Psd7MwXsGYpRLP3J/+UlAKo6YC0ol0QfTtz6C5K8Jg1awfoiCKEapErDxm5g48mZGGTs050Oetb/H+y0RLcHMHIkawea2PQalo+msm3JPhXg4ECTWaTakPkfMs6WOQmUQDaq4KOq3B6wnwRRTXEeMU/vc2Y1iUcif9ng2Nn2Vu1IiaVYrwOuc0GJCzpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWFRVIC+I77GHvHgUsNAMahcm6pLhhLlcow0MxTW/rs=;
 b=k8hyLAg36JhuFDUnp8d2wnBpNNdoxyuuK7FWkeQHkmHCDG59jguDu2nYKbfanSD2PYyrOKmn5l+1pVXvLl73AsmzgS2YiAkNr25WIlYwsROKgkl1LTwGmidBuN7o/96TEpGHkCHnLLi6VV50GGWpOqrnC4ZapAQeD1t5jqhGL7AxCcGOKgvUfg0G4+XksTrYLdPIj6fR78et6Ib5osWpMl/9A+QZH/9nWD3GOI6l0hNxj9D/8JQAsIJDQ4Vfn2YZLCysE3YrgxwjVTDBYZciwtVAfuntQ3tkv/6FMhv/2MgvJPnY0Bgjx6o/j4euH2PFoNl61wdP0DUVxEBSTvJdAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWFRVIC+I77GHvHgUsNAMahcm6pLhhLlcow0MxTW/rs=;
 b=IOipthyWeDxNn2Ogh/O9BRNDLaWlWBqNGAF8Q3qilELfFhzWqaiUYIpP1bY2FZ/9F10elf7iGEZWN0JKsaABcYu+YJV1yAOT0ibyBKUyM/ItRdsZRe53T6Q/AwPzI0F7R7olhk+geQBTvKGF7EWeqWtWl/asK2/e0ws/52R/jlBimr8DBIopcm1qkk65+KDRd/+PnyLbvwGcRFVHRS3x/nXw8Mtot/iZ6sJBIkCGR83TW8eHzjNbp/Kn4vLScVZ0KtfHFVNZ38GS43hWY/S+LeV5IxrJeIGb//8vfuXCn3djX/cSbhdcHtaWsufhOJUyl58jEcB5n8myMCEnxnEuEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:39:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:39:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 20:39:36 +0900
Message-Id: <DDQIUZBMK5D1.7YYKEIN6HPNU@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to
 write to VRAM
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-7-joelagnelf@nvidia.com>
 <DDOSD746PCSR.CNAYZSTFR9XR@nvidia.com>
 <4b953fef-da09-4147-8a88-e16f326c7bdf@nvidia.com>
In-Reply-To: <4b953fef-da09-4147-8a88-e16f326c7bdf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: c519a10a-bf4c-4e04-9bed-08de12f20440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1lRbER6WTFNbWVNbi9hOUFVMzJqaFJtTUlTb2RRU1hHZWpFWlFZQXpVbHA2?=
 =?utf-8?B?Tzlxay82VzVUTEtaWXpKYjlGdFZ3amcvUlFKMXRabGlNOE0xcWl0VUNZaUFj?=
 =?utf-8?B?QkFhWVZIWHhJbWp6bEhoek01RGcrQVFtdit0RkFlaWpKd1F1QXA3dXN2eFpD?=
 =?utf-8?B?b1NLL2VjS3RFSTNrK0VjMTNlL1dXTHAxMXlVb3JQWVdJTnB3Vm1hU3ZBYjM0?=
 =?utf-8?B?LzV3cVAxMFE1Uy9KK01CZHJJSWRLTUFEQ3RPeE5EVkdsaXhiakNlRXk0WFRW?=
 =?utf-8?B?SUVOT0Z2SkxUZGNJeEtZcnJrbUJXZW50LzFoNzNrc1VPS0ozREdScGQxRzhH?=
 =?utf-8?B?THR3Rm9ZS281VC8xMmF0cFZuWmc4LzVXYTM5UG1GVnpRQVBSR2c0KytaSWtL?=
 =?utf-8?B?MlpJclgza3NKVFNURWRGY08rb1o3Yjg3MzJRUVdxeDdLUjAwbnVjNWg1OHJq?=
 =?utf-8?B?K2pZNUVCN3pVNDE3QjBnVHZRbnB3bVhKUCtVNWxTRkhvN3Zyd2x4cHY2Q0xJ?=
 =?utf-8?B?Wk1JdENJL2FIbnZzb2ZRTlBTbjFpKzdHZTNQTWZhYml4dVJFSnEwSXovTnMy?=
 =?utf-8?B?R1hMVFhNdHJWRE44R2JtZTBxSVNIcVA0MGI2Zm05d05OUk01WXV6Qit2RGU1?=
 =?utf-8?B?YWR5eXc0SHIwd1hiL2hldEVJK21BbEtIRTYrNGhRMWk3djlFT1ZuSEM3c3F4?=
 =?utf-8?B?VXZ1RGZrOC9NTGRYSlp6K0g3YUJ1V0ZnempacnZiYkVQWmVBbHBIYU9KTStE?=
 =?utf-8?B?MzE0aFZNTTNDSjBQaDBTVWtYbHlXbndEbERqUkdQWDZwUWdaLzRhdVJhdUtm?=
 =?utf-8?B?THdYZGJwSWJUM0ZHQlJlOGxyWHB1UjZXbkMwT2I2MFZGd1J5UXRHZ2pZcEhh?=
 =?utf-8?B?MnBieTVyZVorY0tQelVIOEtSb0ZUS3FpMVJ4c0JjVG1nZjgrZkpPLzMwN1da?=
 =?utf-8?B?blE2dWIwSWNuQzNON0FCclpiNG1TdVJxMU14Y1FoVTZCSTllc21GN3Nha0NJ?=
 =?utf-8?B?VlFlancrTWp0VWRTWjBVYnpyckRWY280dmRLRVYvbllrcVhKcEFXWk1PYzlm?=
 =?utf-8?B?bmVhOXBQSWF6TkVnN09JaFM4YksyaXlnUHpPRCtGWkdHTktPaUpQaWhGMkJI?=
 =?utf-8?B?WFpHbFB6S3hHKzZwRE5WWHNER3F3ZEpabFpDTmdOWlV4VGx5cFlmVXhoR1Rq?=
 =?utf-8?B?LzMzZTI2UU0xZTBYbEtSeGZuZzhTZnJGYTRwYmV1RTR1aWI4dFhicXpFeGcv?=
 =?utf-8?B?Vm1sUXo1bEpDaUZjUVdYTi9YZFFMS1VlbmVXc21Td3Q2alFCUVJXSHN1bmhz?=
 =?utf-8?B?S2Y3VEZtdWlhaXVEY29aRktUb2JPYlA0U0RxRzRHbVBMNS9scVFTZ3V0R3Ni?=
 =?utf-8?B?L2o2eWhYRVQ1d0dLa084MHRVVEFJYUtGc1l0TXltWkpyVXZ4OXQrYXlFWGpj?=
 =?utf-8?B?RFgzSkxkS1ZqbzdiTWFrV2VkVUlpRlhDY3VBVjRJTVB2SnFtRElIT3lsc2wz?=
 =?utf-8?B?aTc5c1c5VDBLUHl0a0dXSTdNZHBWNDBEb3FJd3REUmNXamx4NFZvYnY4S0xP?=
 =?utf-8?B?TllkeDZBNmRjdGpoTUxQVFpmcktFdE9lWkswOWhlYkd2emhocHZONmdJcHEr?=
 =?utf-8?B?bjdLL3h4Y3lsMzVFV1Ryc050VUkvQmtZdjhRUkZQL0xBdVlXVUlMQmFmOStr?=
 =?utf-8?B?LzB0eUlETHFsdjNPclpZU0o1bWtXblozdThXYUM5NnRST2lWVzAxNlUwT0JX?=
 =?utf-8?B?WDI0TXo4OGdRZ2VjbS9uZEkyQkRuWlpmbS91aGpwbW03ZXN2NTRxNEJ2N0ZL?=
 =?utf-8?B?NHhjSWwwclJ5clk4YlIxRm1EVVc5NGgyTVYvMTFtcjMxU2ZleWRqQzF5THhE?=
 =?utf-8?B?UWU0eEg4R0taUmFQV3U5UVJWY0VJVVJUcExlaEg2TEdtQW1MNmM3K004cDNS?=
 =?utf-8?Q?qKm/euSN0Ytzv5DFkMeIIk8VXMlcEPaR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andZWlF0ejNIeEY0RDA5MFBqREZaNEdVYWdCMkFCQUhhbUIzU1FUeDVIcTlz?=
 =?utf-8?B?TGE5Z1N6bUpKVEZhN1BhaSt6LzJSK3V5clh2K09UTnF5T0ozWEh1a2lENFgz?=
 =?utf-8?B?Vi9xd29IVkFqaDlpU1pha21SblhnZmNpRXpQdFRzM3ptTzI4eHN1YzdjZmc4?=
 =?utf-8?B?K213bWpTRGcrelowbmpoQzd3RFdFS25QYVE5TVFkYkltclA5aVBkMFJ6czAw?=
 =?utf-8?B?dEFybVI2SnMvcFJZcndES1p3ZG1mVHVIK2ZJY3FyUE5sZGd0RlVzQWtGdWMy?=
 =?utf-8?B?RWtvVFNVckkwOVpoaFFpSjZ3N2trQ1NVUkRMai9nazhhQVNtL25PcStkMEYv?=
 =?utf-8?B?eWozSEF1ekpETnFDd2MrQ0FkNitjRzlaRitYR1hKbUhOTWRtUk1wOXBFR0s4?=
 =?utf-8?B?SWFFSnltM2NTQWdJUVIxYmIxdGtndCtTL2w0T1JHMEdueWdwSmFBSUxmQjRZ?=
 =?utf-8?B?NmxSMnFPNFllV2VDRmkrOGxuWlpWK28wc08yd3NOQ2NPeUpMZzRtVy9lTm1z?=
 =?utf-8?B?ZlR5SmZmVFdzUW5adEJaU1BBM0NvdENXblVUalZtNk5EYTNpMjZ3S0NyMVBy?=
 =?utf-8?B?NWRNVDdFVEVPYzk1STVuSlVWZXZvV3FFMWZ3ZDl1N29QYnZFWkp0MXRIbjVF?=
 =?utf-8?B?S0JCcTRFSERlUm9ZSFJzTTNLVUZ1MUM3bFpHaHVzUEk3V3dQOTdOb3hDbDZm?=
 =?utf-8?B?MU1GOFdvVkxoT2FQTk1lUlV6VXNQOUFhaklLUDFyNFpkOWVzWG9NeTFnRXZj?=
 =?utf-8?B?bHdUSmZDL2xYTWVmTWlXZWpGNGpoQ1paTGRHMWIwTG4zSWNNa0pwem5sc1l2?=
 =?utf-8?B?ZnozT3RIOUovWlVvTXoxNTNMN3BKMzluN2xERGRyODl0emxTVU5tRFY3WnRn?=
 =?utf-8?B?T2dXU0dxbDU5L0J5SW4wMkFXWWkzRDI2bmVLNW50RU9QcjVnZE1WUkZVQ2lV?=
 =?utf-8?B?R1M0Wnp3Z3pmUzZoSWtVSjFvRVNqdXdpZlJKWnRnSTFyeG5EOVBWUUhnRS8y?=
 =?utf-8?B?dStkRXZhcE9JTzZYK21QaTRKQ0tlcHNVQ1E1d1hQYTFLTm9FT1ZvQkxhZnE4?=
 =?utf-8?B?eFp5N1NrWXhGT3RQVFB4Q1MxeEVTVzdwRVE3dmp2RzVTc1lncGhlZVFqMlhE?=
 =?utf-8?B?MzBLbDY0SGx5S2xCL3RvcElSZ2NCZkZFMnFWMWZ0MmRYSm4rRDVua2xaZmVO?=
 =?utf-8?B?MGJrMWNzaUhsOE5COWRuZHFUVU4wYjN4azBsbkpGSzhtZTB0QWpVT1RLb1M1?=
 =?utf-8?B?VEE0SXo2MFRaeWorODBZZEJVUUZMTVNuL2JCNC9LejVmbGh3YVdOYnc1UTNu?=
 =?utf-8?B?d0ZTTlJ1Zm1Cb29lMjNpUnpMb0k2eXZnWDh1THJaR1ZjeWczblI4cStoK09K?=
 =?utf-8?B?YlVwQnBsSWU1cmpMZC9XWFNBYXZsOGd6OTJDNXk1OEQzbE1iYURZMmU2MGdT?=
 =?utf-8?B?aGUyQ3IvV2MxS0lzVExLNUJJNXUyOUJ2UEpEenU5T3RZNktYc1oxRFFIR2JG?=
 =?utf-8?B?c01tVCtqcFhNVE9GQWVpUVphYVBWYkhTdU9ML1lHQVVnd3JXWUswRDhWWm5r?=
 =?utf-8?B?VC9SK3FuRWVTTkN4VEdxNDJFV0NDR3V3K3N6RGhMM1Yxbk5la3ZZMFhTN1oy?=
 =?utf-8?B?L1ZRbloyT2dvSFZoNUZnaVRpQ3AvZ0dvdHNrUW1uSkFFTEFhc2RwNFRTYXMv?=
 =?utf-8?B?STVXdjZQb2RFYTBVOFhTd0FMOFJoV2llTEZteEwrZW4waTVPTUhnYk83bm5t?=
 =?utf-8?B?Tjg2T0txaXc4WFBMd0JDa0dkODFpN05WT2s3UEJtWVpvWnIySTE3Mk1EREtR?=
 =?utf-8?B?MFJRVWk1dUhBZzBIck9jR0NtUk5RTUE1VG90M2NRM2tOUmZTeldTa1o5TllP?=
 =?utf-8?B?cEpaUGFKRnRYNExtcDJPZEdpTTgyZ2lwN1FOZE84VVI0TlR5Z3JVV28rQUZk?=
 =?utf-8?B?NTVSUlJMdzR3TWJuMG1zNjRMZmpmTkZaazNnRzVLUVkzTGRMZ0l2YkhyUGYw?=
 =?utf-8?B?enUvWnd6MEc3QXorSS80NzE4SFhRTTM3VVpDc1dmeCtDbm5LZVRMd3M3OWNV?=
 =?utf-8?B?NHpPbVZvbFZoZ1F1dWxoSVpYK0MxbEFab3YyVHFwVzhSY2ZTckh5cWsvNE8r?=
 =?utf-8?B?b3UyTnFrUTZ5TXRQbEJLQ1g5eHhWZGRPa0ZmQjUvY1d2VzY5K0tHZno4ZzZK?=
 =?utf-8?Q?wOVHKBThE9S+LBdgxz3vldqjgiW6OKDap5Etmu3ubxfN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c519a10a-bf4c-4e04-9bed-08de12f20440
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:39:39.8933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Rpvb2ax1aP2S7I9pCKgy7z8RnOmx/zX3G64decqeh7mbuXLGw9PxqDqQ1d9CZ91zIaVxqeEp/SBD+UIrgdXeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113
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

On Thu Oct 23, 2025 at 7:04 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> On 10/22/2025 6:41 AM, Alexandre Courbot wrote:
>> On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
>>> Required for writing page tables directly to VRAM physical memory,
>>> before page tables and MMU are setup.
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/mm/mod.rs    |   3 +
>>>  drivers/gpu/nova-core/mm/pramin.rs | 241 +++++++++++++++++++++++++++++
>>>  drivers/gpu/nova-core/nova_core.rs |   1 +
>>>  drivers/gpu/nova-core/regs.rs      |  29 +++-
>>>  4 files changed, 273 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>>>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
>>>
>>> diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm=
/mod.rs
>>> new file mode 100644
>>> index 000000000000..54c7cd9416a9
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/mm/mod.rs
>>> @@ -0,0 +1,3 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +pub(crate) mod pramin;
>>> diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core=
/mm/pramin.rs
>>> new file mode 100644
>>> index 000000000000..4f4e1b8c0b9b
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/mm/pramin.rs
>>> @@ -0,0 +1,241 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Direct VRAM access through PRAMIN window before page tables are se=
t up.
>>> +//! PRAMIN can also write to system memory, however for simplicty we o=
nly
>>=20
>> s/simplicty/simplicity
>
> Ok.
>
>>> +//! support VRAM access.
>>> +//!
>>> +//! # Examples
>>> +//!
>>> +//! ## Writing u32 data to VRAM
>>> +//!
>>> +//! ```no_run
>>> +//! use crate::driver::Bar0;
>>> +//! use crate::mm::pramin::PraminVram;
>>> +//!
>>> +//! fn write_data_to_vram(bar: &Bar0) -> Result {
>>> +//!     let pramin =3D PraminVram::new(bar);
>>> +//!     // Write 4 32-bit words to VRAM at offset 0x10000
>>> +//!     let data: [u32; 4] =3D [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x=
87654321];
>>> +//!     pramin.write::<u32>(0x10000, &data)?;
>>> +//!     Ok(())
>>> +//! }
>>> +//! ```
>>> +//!
>>> +//! ## Reading bytes from VRAM
>>> +//!
>>> +//! ```no_run
>>> +//! use crate::driver::Bar0;
>>> +//! use crate::mm::pramin::PraminVram;
>>> +//!
>>> +//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Resul=
t {
>>> +//!     let pramin =3D PraminVram::new(bar);
>>> +//!     // Read a u8 from VRAM starting at offset 0x20000
>>> +//!     pramin.read::<u8>(0x20000, buffer)?;
>>> +//!     Ok(())
>>> +//! }
>>> +//! ```
>>> +
>>> +#![expect(dead_code)]
>>> +
>>> +use crate::driver::Bar0;
>>> +use crate::regs;
>>> +use core::mem;
>>> +use kernel::prelude::*;
>>> +
>>> +/// PRAMIN is a window into the VRAM (not a hardware block) that is us=
ed to access
>>> +/// the VRAM directly. These addresses are consistent across all GPUs.
>>> +const PRAMIN_BASE: usize =3D 0x700000; // PRAMIN is always at BAR0 + 0=
x700000
>>=20
>> This definition looks like it could be an array of registers - that way
>> we could use its `BASE` associated constant and keep the hardware
>> offsets into the `regs` module.
>>=20
>> Even if we don't use the array of registers for convenience, it is good
>> to have it defined in `regs` for consistency.
>
> Ok, I wanted to do that, but I thought since these are registers, it is w=
eird to
> move it there.

It's just that it looks like to keep all the layout in the same place.

>
> Also we need byte-level access, register macro is u32. I don't think we s=
hould
> overload regs.rs just to store magic numbers, these are not registers rig=
ht? We
> have PRAM window configuration registers but that's different.

The register macro just gained support for `u8` thanks to your work, I
thought that would have been a good use-case. :)

Also we don't need to use the register accessors for this - the idea was
just to have the definition in `regs.rs`, and use the constant
containing its address instead of the regular register accessors if they
are not fit for this.

I don't feel too strongly about this though.

>
>>=20
>>> +const PRAMIN_SIZE: usize =3D 0x100000; // 1MB aperture - max access pe=
r window position
>>=20
>> You can use `kernel::sizes::SZ_1M` here.
>
> Sure, will do.
>
>>> +
>>> +/// Trait for types that can be read/written through PRAMIN.
>>> +pub(crate) trait PraminNum: Copy + Default + Sized {
>>> +    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
>>> +
>>> +    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
>>> +
>>> +    fn size_bytes() -> usize {
>>> +        mem::size_of::<Self>()
>>> +    }
>>> +
>>> +    fn alignment() -> usize {
>>> +        Self::size_bytes()
>>> +    }
>>> +}
>>=20
>> Since this trait requires `Sized`, you can use `size_of` and `align_of`
>> directly, making the `size_bytes` and `alignment` methods redundant.
>> Only `write_to_bar` should remain.
>
> Sure, slightly poorer caller-side readability though but its fine with me=
, I'll
> do that.
>
>> I also wonder whether we couldn't get rid of this trait entirely by
>> leveragin `FromBytes` and `AsBytes`. Since the size of the type is
>> known, we could have read/write methods in Pramin that write its content
>> by using Io accessors of decreasing size (first 64-bit, then 32, etc)
>> until all the data is written.
>
> Ah great idea, I like this. Though per the other discussion with John on =
keeping
> it simple (not doing bulk I/O operations), maybe we wouldn't need a trait=
 at
> all. Let me see.

Even better. :)

>
>>=20
>>> +
>>> +/// Macro to implement PraminNum trait for unsigned integer types.
>>> +macro_rules! impl_pramin_unsigned_num {
>>> +    ($bits:literal) =3D> {
>>> +        ::kernel::macros::paste! {
>>> +            impl PraminNum for [<u $bits>] {
>>> +                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<=
Self> {
>>> +                    bar.[<try_read $bits>](offset)
>>> +                }
>>> +
>>> +                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Re=
sult {
>>> +                    bar.[<try_write $bits>](self, offset)
>>> +                }
>>> +            }
>>> +        }
>>> +    };
>>> +}
>>> +
>>> +impl_pramin_unsigned_num!(8);
>>> +impl_pramin_unsigned_num!(16);
>>> +impl_pramin_unsigned_num!(32);
>>> +impl_pramin_unsigned_num!(64);
>>> +
>>> +/// Direct VRAM access through PRAMIN window before page tables are se=
t up.
>>> +pub(crate) struct PraminVram<'a> {
>>=20
>> Let's use the shorter name `Pramin` - the limitation to VRAM is a
>> reasonable one (since the CPU can access its own system memory), it is
>> not necessary to encode it into the name.
> Sure, sounds good.
>
>>=20
>>> +    bar: &'a Bar0,
>>> +    saved_window_addr: usize,
>>> +}
>>> +
>>> +impl<'a> PraminVram<'a> {
>>> +    /// Create a new PRAMIN VRAM accessor, saving current window state=
,
>>> +    /// the state is restored when the accessor is dropped.
>>> +    ///
>>> +    /// The BAR0 window base must be 64KB aligned but provides 1MB of =
VRAM access.
>>> +    /// Window is repositioned automatically when accessing data beyon=
d 1MB boundaries.
>>> +    pub(crate) fn new(bar: &'a Bar0) -> Self {
>>> +        let saved_window_addr =3D Self::get_window_addr(bar);
>>> +        Self {
>>> +            bar,
>>> +            saved_window_addr,
>>> +        }
>>> +    }
>>> +
>>> +    /// Set BAR0 window to point to specific FB region.
>>> +    ///
>>> +    /// # Arguments
>>> +    ///
>>> +    /// * `fb_offset` - VRAM byte offset where the window should be po=
sitioned.
>>> +    ///                 Must be 64KB aligned (lower 16 bits zero).
>>=20
>> Let's follow the rust doccomment guidelines for the arguments.
>
> Ok, Sure.
>>=20
>>> +    fn set_window_addr(&self, fb_offset: usize) -> Result {
>>> +        // FB offset must be 64KB aligned (hardware requirement for wi=
ndow_base field)
>>> +        // Once positioned, the window provides access to 1MB of VRAM =
through PRAMIN aperture
>>> +        if fb_offset & 0xFFFF !=3D 0 {
>>> +            return Err(EINVAL);
>>> +        }
>>=20
>> Since this method is private and called from controlled contexts for
>> which `fb_offset` should always be valid, we can request callers to
>> give us a "window index" (e.g. the `window_base` of the
>> `NV_PBUS_BAR0_WINDOW` register) directly and remove this check. That
>> will also let us remove the impl block on `NV_PBUS_BAR0_WINDOW`.
>>=20
>
> The tradeoff being it may complicated callers of the function that deal p=
urely
> with addresses instead of window indices.

Would it though? IIUC the two callers of this method are aligning the
address already, so the internal check is superfluous. And this would
also simplify `NV_PBUS_BAR0_WINDOW`.

>
>>> +    ///
>>> +    /// The function automatically handles PRAMIN window repositioning=
 when accessing
>>> +    /// data that spans multiple 1MB windows.
>>=20
>> Inversely, this large method is under-documented. Understanding what
>> `operation` is supposed to do would be helpful.
>
> I will skip these comments for now as we discussed dropping complexity in=
 other
> thread, but thanks for the review on this. This function should be likely
> dropped in the next iteration.
>
>>> +
>>> +    /// Sets the window address from a framebuffer offset.
>>> +    /// The fb_offset must be 64KB aligned (lower bits discared).
>>> +    pub(crate) fn set_window_addr(self, fb_offset: usize) -> Self {
>>> +        // Calculate window base (bits 39:16 of FB address)
>>> +        // The total FB address is 40 bits, mask anything above. Since=
 we are
>>> +        // right shifting the offset by 16 bits, the mask is only 24 b=
its.
>>> +        let mask =3D genmask_u32(0..=3D23) as usize;
>>> +        let window_base =3D ((fb_offset >> 16) & mask) as u32;
>>> +        self.set_window_base(window_base)
>>> +    }
>>> +}
>>=20
>> If you work directly with `window_base` as suggested above, this impl
>> block can be dropped altogether.
> But it will complicate callers. That's the tradeoff. I prefer to keep cal=
ler
> side simple and abstract away complexity. But to your point, this is an i=
nternal
> API so I can probably code it both ways and see what it looks like.

I am not convinced that the callers would require extra complexity. If
it turns out they do, let's weight the cost/benefit of both approaches.
