Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F0B42A1E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F5D10E91B;
	Wed,  3 Sep 2025 19:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LOi2w/Lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA2410E1E9;
 Wed,  3 Sep 2025 19:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLfZzg7DQgaeOa4tIGMuAvb2mXHVN3f6lfNL5vYs9S1ZLpyvHisiLreaIDgWfiL7jhjS+xhXzR8+FLr0vHpPORBYF35DSz1irfI46/L2+I/WHftVbvrV8XyMT5wxgg5IwU/WF2yDH9E9lwFcjV5UV4FDXKRtYjpfjRnuloLDXiV+dAuUejK6EXTszhA36W9P0BoAe9n6YBlyxDlovFFlaubvIrwGq4baJbx2DRHJMGWBHhKrmkKnUSB2d3UgX5IEDeCJkhkRFkiY05Kt0G8YzSZDOfdcF43Q+8T5UnKCnB/rbKus83gXa64m/A8f2Pn8jSu5pXAPGRPmbp4DGa8K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bICFoNPtYYGwcBHw0KxWL4au1AZQ6dshZKZYCzGd9bQ=;
 b=gZSckOgBArihzFT0sQWDA7shMvPGHpFDyNouGQ28SIgYKpvb9Bm3ZN8QYHuKyJSr46O+lXQjOVJZhJOJMzcjzFQZEifAgbwaLqnT1H6EruuQcAddUYNXlgXGnjE0synvQaSGFxbWBWDk3KYxdCpv0itJzyi53vZ7YLAVmT+gMaeDUZX1cWIAgRZ7d/hIFrKmge/89GlvtfYDy/OE8bKkJcOyk+4amWpwv/IOgLeXnszzFeFWitCczISJhWgJFJhpkGBQrVwnqt3HtFUayuCILECfhmd6OmFfv617ioWIKkHe9nBLTswClbnkZCJ28jDGYy4TnBwf24hGVq4BVPxYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bICFoNPtYYGwcBHw0KxWL4au1AZQ6dshZKZYCzGd9bQ=;
 b=LOi2w/LhJohd/z+VFBS4q4gr03eXBFBvUsoBzX527cw8OxXAQBWa4urExnogh1N0SX76CbPKHxl11gUTuBraj6Yck/yPi0ik9x17CF6IKztiC+/Av+RLXOV/i17a4w/ZIt2ujeY43KLw+Yb+A7JvQn5SFXnV1tup3qoaXBh1qwBgVGeGQ/FMvXK1HQbkQWhzYoxRQ3GMHf7eIVzVB2OB4vzJzuR4zKibrMwUs4oQpyoskAed9pY93p/sNSSKr1PQlqZ6o4t4TfAe/iSkD8/EosIFlnzCQSHsGrqw2a+JWpwJDo6pfiaGEbw+VTnaFmKyo3jYMsNrujiXwVTFQF2Otg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 19:45:11 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 19:45:07 +0000
Message-ID: <322e1b57-394a-4445-9a34-a46183d3aa45@nvidia.com>
Date: Wed, 3 Sep 2025 12:45:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] gpu: nova-core: Set correct DMA mask
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-2-apopple@nvidia.com>
 <b5f42338-e5b3-4823-8aa9-9374c22f1209@nvidia.com>
 <jbkvgmj2lc7petnt5wen4hvkpyu46t6rn7e7r2sekpqdvojgj3@qste4uzb2w2l>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <jbkvgmj2lc7petnt5wen4hvkpyu46t6rn7e7r2sekpqdvojgj3@qste4uzb2w2l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c26c27d-33e2-49a2-a22a-08ddeb2262cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekErN052NzBBMkcwYzBVa1ZjVm5PaHFrZ0E0NUhzRkQzYmRuU2FFZFZYdUZ6?=
 =?utf-8?B?allnYUVTd0RsL2lHQ3NDTFh2Y3NlYVgrRW83QXVaUUpZRnRWWndoN1BVbHFl?=
 =?utf-8?B?alRqOEtvODdBdW5XelMrd2dlTm1ndUgrSW4zcDVGeW1PZnEyT0ZqRTdCZ3Vp?=
 =?utf-8?B?OC9Jc2V5YVFwNEdLSjVEajBVV2Q3WlZPbFpObG9iMTlvSUM4bm1iWE5TaWl3?=
 =?utf-8?B?ck9JOS9ITWp4TzBRa0x2SzNkQTJndmhIVGxqd05MM0xXVkhpUExUdmhjdTdB?=
 =?utf-8?B?VG81bXVuT3lyK241c0pyS1RJYURkM29nNng5ZWFWcmJnMm15WFB0MSs4YlRq?=
 =?utf-8?B?ZWlnOEpWVnBhMVB4cFBFVE04TVBTOTNFd0RucUNCaFRXUS8yTVdJb3BPSnF1?=
 =?utf-8?B?aWliOU41UlB3dWs0L0dxY3RldkJ3VDNoZjA1MzRxajAyaFJEVFduKzBNdEhr?=
 =?utf-8?B?OXVxN3BqSHViWlRtQnp0c21LU1gwVzg5WXBacU5hbDhWZ1ZxOTR1UEdiK2V1?=
 =?utf-8?B?WVZZdzRjWGU2Sk95VUR3TzJRVXFSSXZYK1MvVS9Sd081LzQ1aGYwMkd6NlRS?=
 =?utf-8?B?aE4wVHU2Z282ZHFEWHp6anNwOXRWS2NoaFZ3SkhHMlliNkNKdzFXemY4QjVh?=
 =?utf-8?B?K2pZRitTVmQ2bkFIVmVvV0R3SEVqZDh4MWFwUDdMdEpDYzJMVHI5KzloeVE4?=
 =?utf-8?B?WkFxRVhNT3V2VCt4b0pZREhLd0RoMFBFOGdRMENNZXNuVWhRSHkvTmVLNU9p?=
 =?utf-8?B?WFNzbitGU3ZzaGdXbHZHQmpPQXp3amk0WHFGNng5cDNwYzZvemhKbVdmb1lT?=
 =?utf-8?B?SWxKM2Ziblc4bE5LNXZOc1FUeVBxL3NwL2lCcnZlaUJZZzVIN0ZLekFtOTRj?=
 =?utf-8?B?ejZvYW02WEEySzd2SXIrT1IxRHBoOGkyb040QU1qL2dGRkNSRnJiMlVUWEpN?=
 =?utf-8?B?Q0lXQkp3QjhhU2o1ODVLYU5ZMjY4VnBXeUVYcGtqRk1sT1NXbkNYMnNKZkV3?=
 =?utf-8?B?cnh5LzcxVnlOZHNKRmJ1M0VOSmQwZGpSVWE4eHdmeCtTRTQ3OTVxakdYMHpN?=
 =?utf-8?B?SW1HekxFTkFkSDh6VU9YMHBwdk1jZkdQNk1sZWFoZDZIMHMvNXVYQWVzc3Yy?=
 =?utf-8?B?c0hkd2MxSjkxRWRtaEk3cDUzVEhhUXBJN3dZVng0eEF5QVJ6VS9vTEorNmNn?=
 =?utf-8?B?dVh4Q0xqVEZkK3FhaHFZemg3VGpNWFpKWEtwbkx4ZUFBaEVNc1dROUk5MlFM?=
 =?utf-8?B?RUt2SU1lZXVtME5WdWNnVjVKY0dDZ0haR2kzSzRjcUxFVkxub0FxUHloNjJX?=
 =?utf-8?B?TjNBSlVMS0FnZU9HanordWNHL0xXREhKOUU0VnVncUpoSkk5STRncVJyYzdU?=
 =?utf-8?B?MjczYi9EL2VFRDlQUVBrYXJuU2VEa2tMZGlpZnJCbGoyK0thMHpyaXdvb1VY?=
 =?utf-8?B?K3phOU5FWEd1eDNTeU5aQk1HVmpQYnhTeCs3OFhuaVM3QjgxZE4rODNtZ1do?=
 =?utf-8?B?c3dVYmdBaEtHNFJLbURoOFNuSWJ3TFBPQU96STV4UGIvam9qeTVVZ2I1K1Uy?=
 =?utf-8?B?eXJCMVdMdzRvZE9kUDFoeStHd094TllmV0ZvWjNDRmZ5TG9kMGJpSTJ3d2Yv?=
 =?utf-8?B?Ui9hclZ1c0IvN1F1NlVjaVlUakNIWEUySU00Yit6NkNRb05uNjRSbkk1Nk0v?=
 =?utf-8?B?eHNaaFo2Y3pPYk0yZUttdmE2K0l0S1p2UXJTb0N1V3lwSzltNTMzaE42WXZW?=
 =?utf-8?B?VlZkbnBlOE01N3FVaE9MZTlFRWE3cmFwcWJPV1lWRU5nalRlQ0FCYW93eEVV?=
 =?utf-8?B?allLQmEybThaSFN4WFBFakZxVmpMUEZBZ1JIUU15cS80ZXJBYk5KeGpZZ0Y0?=
 =?utf-8?B?QkNtQXlIR0dUQUloWVpkREFyY2lTVUkwQ2w3dWpMT0RGV3JQWDduSlNhWDdG?=
 =?utf-8?Q?8pKQvaGw0hw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldSd1czTlBMcDNKdXZjQlFkS3ZjN3V1SWRiaG5xcW5SUEtqTm82Nkdka0dx?=
 =?utf-8?B?VWRwNVFaclRrS3NIR2RhL0tqbHFFWWZTOFhhMzdXaGdzUVFFVkowQzRDZzFh?=
 =?utf-8?B?bU44WmtMN2dYYVB6SXN1blhqNHZnWHlNWnRvQnlPUU95MDdYMzJ3RWc2VHZu?=
 =?utf-8?B?cUxCeTVHZzAzazJQcVJwSzkrVjlMb2greWNIQkpPS01mVG5ZQVhNYlVGL1BM?=
 =?utf-8?B?QWVLZ3pUeEkwMnNmRTNDemtxT1ZnVVFtZ2tIc0U3M09INE0xZEpGYjk0TVNh?=
 =?utf-8?B?UVdUbUFmUm14bmFLMTZKaFJCaGk0dVl5TUJNajd4eUFtUytSVFlFT1NhM25l?=
 =?utf-8?B?V2FERGtiSEs1c1NpSmk3QklUNjMrcmlZWmVFamlSOTNoajVmQktYT0pybloy?=
 =?utf-8?B?NVdraUluaGRjMzJYSXdwaHA4eGE1dFc2ZmE4NWorZzVSZWhZbEs4cWhTNEEw?=
 =?utf-8?B?SjNuclg1VFpWd0ZtTWlRbEpLeVNmZURSaUk5NUlvdGFJRHZJUlN4NElVY0Jx?=
 =?utf-8?B?eUtuUTNYZXhVYkpOV29TNFYrb0w3eE9kNFYvRzVteHhxM00vdnErbm1OMHFT?=
 =?utf-8?B?QThLcHhrQVJmU2J4UG91c1lGZitneGxsTFkwbU5IRXEySUNkYUwxZVMzeWhQ?=
 =?utf-8?B?T3k5Mm9RWXVSNWdCS1lobm9OWGFQZTBWRGwxcjd6WkR1VERCcWZxTnFkc2lL?=
 =?utf-8?B?OU9CZDlhS015bU5Ka3BiR1J4WVNGR3djeU1KTGxMMUJQaUxSRFhlbmRFWWZD?=
 =?utf-8?B?aHVmN2pJQ2pRenZpdmtCMC8xREtmZllMdXZTSjgzN0c2RStFNlorK1BIcDlw?=
 =?utf-8?B?RW55enhya3daZ0ZHREQ0U0tLL1JDREo3Z3RuOUFhYjdXSkV4V2pDTFdHcE84?=
 =?utf-8?B?bFFKbEV2YjRiM0RmYm10VWUrdXhrb3E0a2lKQnNLZXpTYk9IRWxBMlg1bXgy?=
 =?utf-8?B?elNKRnpnK0ltRFFNeHNrRmJDTnpsaW5MNmxYbFBlYlhtdWg5Y3NCaytmUUxJ?=
 =?utf-8?B?TW45SUlaSjZ0NFkxRWlHWXhlNnF1UzRhdG5vVzBqZUdvU1o1WVFsYjZIUGFR?=
 =?utf-8?B?SFI2YkkyWTVieHdlK1kzRks3VjFTZ2o2Y05oZG0wZVozV2t0Vno2eG5PQm8w?=
 =?utf-8?B?NmFXd0NhRUhnZTAyS1ZZaTJrRHhtRWZIbFEvTS82QUhkQWo5dFFlb3l0SkJ4?=
 =?utf-8?B?RlNVVDBpY3dlV0ZqQ2x0NkZ0SmY1N0J1OExSNHJyRlhOY2lNck1PalgvazZV?=
 =?utf-8?B?MEdDRXBTSzhxSVlyREN3a1JZYy9YU3d1RW5JU0RidkZYeXpaWFJpVGRFTzVy?=
 =?utf-8?B?VDk4aG0wZTZCYUVFSklqd3lBbmpIY1RHUkpjSXEyRmhxK3dzYk5XT1JjeUpG?=
 =?utf-8?B?dzFhSFBGbGFzSDg2WlRUbDR4cytJU1U1TWlPd1B3WFQvUVkreFpOc1V4bFRJ?=
 =?utf-8?B?SGtxeDZGYjdVQTZLcjVkSEpJWjI5WGgvc0pjSEMyYzZDc21WZW9xK3UydkJq?=
 =?utf-8?B?UEE1RnNUNzNWc2Q1LzNKQVVuQ1V0NFRodFZmaU5KVUR3SGxESWpIRU9raWFS?=
 =?utf-8?B?ZWxWallxdDFDNUJOd1R2K0NDVTJXUlA2Z1UzbmFOMnpzUkZlSVd5Y0N0RjZu?=
 =?utf-8?B?ZHo1RmRJUGhvV1BMd0lmWXBoTzdOTkxla1RjYVJkVkFTTGE3MnZOZGNuSzFQ?=
 =?utf-8?B?VWlDSTRnZVowY0dWbHVNRGNWVTB5S1JVV1doeCtrZGhpMmpDWEVudmtoUmsw?=
 =?utf-8?B?WnpINml6TGU5Y1pzc2NqaVdHaFQ5cURib2lvU2Vtb1FLQ2pLaysybWM5ZjVC?=
 =?utf-8?B?RlJlNG5mU3hNb0hrU3JtZnU5S2UyZFRiK0V6cTZQMUpSR2NYVzlIcVNyNk56?=
 =?utf-8?B?K0E4b09HZVFWdTM5ZkY5NHZRa2hRRGVRZDRqd0ZSc2I3dFZBR0JnSUtHRWxO?=
 =?utf-8?B?cjN0RXFDS25QZDNkbmNxcW1NRHdOQlAva2dUb0tFMVhQUnNHN2hkNkxUbkhy?=
 =?utf-8?B?ZUtwbEdOVFROYVlYR3RVTEh2M3NmNTdwK0VDQWNRR2VtZW5VVEl1em5mMWho?=
 =?utf-8?B?MkYvUTJ1SjhEdjNFS0luQjh0U2xYS1lSR2FIczl6VjhpREo5WldQS1R3Nmwv?=
 =?utf-8?B?SHhIaHFGSnJNbzFkWk4xWTNtajBLWlJNZVcwME9PN0pNMnBYS1Q5blVkT0Fy?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c26c27d-33e2-49a2-a22a-08ddeb2262cd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 19:45:07.7451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfPYN0/uAnMC3pkKsALvpnMvZ3mDamGoUhdr+1ON+6QUuRXndSqmMvzGNhjHs6arpkdfzJbxmXSWr/1Odl+fxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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

On 9/1/25 4:55 PM, Alistair Popple wrote:
> On 2025-08-30 at 09:55 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
>> On 8/27/25 1:19 AM, Alistair Popple wrote:
...
>>>   
>>> +        // SAFETY: No DMA allocations have been made yet
>>> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<48>())? };
>>
>> Eventually, should be 52 bits wide, rather than 48. Or so I believe from
>> looking at various drivers, including Nouveau (which uses 52-bit for
>> Blackwell) and mlx* (which use a 64-bit mask).
>>
>> However, it works for the current series, because this series only supports
>> Ampere GPUs, and 48 bits suffices for those.
> 
> Actually based on both Nouveau and our internal docs this should be 47-bits. I

Yes. Which is why I wrote "48 bits suffices".

> suspect I just chose 48 during initial bring-up because that's what most CPUs
> support but neglected to add the TODO to actually go and check this. So will fix
> for v2.
> 
>> So, you could leave this patch as-is, and I'll change 48 --> 52 in the
>> upcoming Hopper/Blackwell series. Or you can change it now.
> 
> We can't of course just change this to 52 bits because this needs to reflect
> what the GPU HW supports. So ideally this needs to come from the HAL. I left

I should have been more precise. I meant, "use 52 bits, via HAL, just
like Nouveau does".

> this hard-coded because in the short-term leaving it as 47 bits even for
> Blackwell won't cause any issues. It may force usage of an IOMMU to address
> physical addresses greater than 47-bits when it otherwise wouldn't for
> Hopper/Blackwell (it would always have to for Ampere/Turing), but short-term I
> doubt many systems actually have physical memory above 47-bits anyway.
> 
> In other words you could leave this as 47 bits in the upcoming Hopper/Blackwell
> series or use the HAL we have come up with (if that is available) to obtain the
> optimal value.

Yes. I'm planning to match Nouveau's HAL approach for this, in the
upcoming Hopper/Blackwell series.



thanks,
-- 
John Hubbard

