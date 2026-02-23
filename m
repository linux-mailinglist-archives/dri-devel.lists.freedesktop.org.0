Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH0sGcGgm2l63wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:35:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB5170F80
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EBF10E065;
	Mon, 23 Feb 2026 00:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MZXDS1Oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011020.outbound.protection.outlook.com
 [40.93.194.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51710E065;
 Mon, 23 Feb 2026 00:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtM7FU9D5K2EWonaHA+/xWBP5zFeJc5f7WjrC21IjT7UH189J11qpcNxjbCRcK25rcO+tpntEYkXahT0UbwCQWM90c9OxIfEJKEwwrimLSKoh19p0DWLNrzVU4JT7a7MCghfNL19b3XolxyHjPTmDjqyv98kLb02OSH17huX8ur8l0lhLNnCelmqF63hbdTBTj3GtmKEgbqLL87MtJzkCrzKu8WA1ZcIRYT9PsiaBL3nfYfhGkYOCSYwLw+cTympcyTv80zIk2lER3y1z7dpoNn2V6vL0ghD/jUB6NjSEAQ0oXwCnsIc6wh7F7wlxNssiHNm5hQrXafRgwvk9t7ISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBFt9/H6680bvL7A1e1V1A7BsSALXbKdfZlRy4Mozcs=;
 b=Gt1BxKSsmkiDiXEcJlyJ6kCUB8wfwteY3KEy95iUeuq1foSQ1A+/cMj9ykUqo8jqX3Uc1KNgZ8gBXlNNB1uM2TRWnxTxrD+PPwjKsG13NMW6zKaRG/U37bMaFdXDX9zi544NGtFD77XGBtG1DQTu07oBbG4CRLljWxAEeEQTMX/CUO0VHzBy3TI3sJ3tDNqS0iQ6l2Cy0ffK1Zfmny26gkbjrUqgBJw9Tw3vqqJx46Ka8PHkIxSbOcXGyUaV9hmM+6StMe8xMZ9g7IMx8bTmJWnD/HHvJrUEayS5ikknoCh5K3TVY3PVab828yYY/StkdGKQJFkxyub1SE3WJxqDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBFt9/H6680bvL7A1e1V1A7BsSALXbKdfZlRy4Mozcs=;
 b=MZXDS1Oz/Q5hkVu+hE3Rv+vFB6GAUVIMqe8iBlA4v5VXFzV+DT2eaJZtze++gS00GmrisNODuG5U0oDnCKcQpOXnbEyFtumWUbmbYwhd8kLVdC98JqNTyvzeoVZ8Xw3AR9Al/6px/8xUd8gT6cLuT8u+uGQazhKUrX4bidLoVA/lTE+bKwN7/qYvTjjCudSnP78shGo+Xj4/3T9ogVyItiyeUzYGnb70HUGmVOS7JoDJGtmZJOUhF6VUT8qS1jdClc+V8E16mIu8dmXhChqb3hzeBqsrwqJTnv0AW1R91xbaci1WdiI1Z4VxfaEoAx0yZinbxqz+3M0+y+UqIgxpbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.19; Mon, 23 Feb 2026 00:35:00 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 00:34:59 +0000
Message-ID: <68d3f1af-b7fe-4087-a9a7-2da38662a985@nvidia.com>
Date: Sun, 22 Feb 2026 19:34:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
 <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
 <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
 <DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:208:23e::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CH2PR12MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf203e1-cc47-4c4f-4e16-08de7273604e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmJpUW9OU3BlM3pvcDEvMFJ5NUVKejRMSEpBSXpjOUhQdkp0ZzN3MWRUYzVH?=
 =?utf-8?B?WVhISWRPaXBONUhQb09UTU51MjZBRmM0Z1VwRTY3RHNVRE82aXBFRVdnS2R5?=
 =?utf-8?B?TFNrSGhkdTJnT3RoYkt3MzNDRnYxUHIzcU5MSEp4SGVYaG5RalJYV1F1NUc3?=
 =?utf-8?B?cERGY2p2TVJKaklwQW9iN01id0ltaW5jU1IyeWdPS3NYMEZ5blZKUjhPWmJT?=
 =?utf-8?B?NnJucDlzWDNhSjJ4NUh3T2tqbS9uRnJ3ZDlZVzFwUjk1Ly9iQ1pTSXdtanB2?=
 =?utf-8?B?eHRjdVVRYVhHY0dsWGdYUlcvYTNKUGpFVTE1NkN0S01rUUJtSGZZRmd1emtm?=
 =?utf-8?B?aVVpMUlrQmtwVDJyUXFVUEZsVjl6Q3RHNE1vZ1JBUUt2Yko2M1hoT2FUUk5p?=
 =?utf-8?B?VUlpS0NCQTRndHBWa3hqdFBFamRCNWFnL2M2WGZ5MmYwTjlFV1Nmd3E0T1VM?=
 =?utf-8?B?STJsRjUveVQ5a0sveWx6eXNzVFZCeG1nNUhJd3JsaTRiVFRadmt3ZTN0MWtz?=
 =?utf-8?B?ZEwva2dROW5sVzhFQi9OTWpUQVRPa3RvR2JsMTAwT0VzZ3lNbWhoamY0aXhH?=
 =?utf-8?B?WWRDZDhjZ08xT3Z0TFcrd3ZxSS80RDJqRmlzWGZHODNwODZnU0dQWVVGSmdX?=
 =?utf-8?B?ME5Ba3JXdGM3b2p6bVZCcG1vUGovQWI5NFlYYzVXNk0yZ2dhOUtZNUFJc0l1?=
 =?utf-8?B?WHdIck5LOC9qSmdNcU5yaEFHTnp3WHdHcjgvUXp5N1ZOUklaMG5yemQwdy9Y?=
 =?utf-8?B?Y21BY3cvTndISzB5WlFKMXIvZjlYcmFwNGlXakVLVkIyM3dSMWFWRDN4YUI2?=
 =?utf-8?B?M1lzdmtTcFBxYnNwMnRTdUpSa0REc0dXQlZzRXdNbU04TVVaVlR6VFUxanNk?=
 =?utf-8?B?eDAxYTFBRVM2L0JURTgxVEkzVlRoZkVST0VqSkQyQnU3OTJsdElHTlFlL1Vj?=
 =?utf-8?B?UDd4WlZqMW5mSEd3U0t6emlBWC9RUW9SVzdVM3pTM21UaFRKdHlzSGhRdW00?=
 =?utf-8?B?VHJzZFRpTU9LZldKS3k5Y2ZNK2xhbkNZNHZ4aUhoSDZNdzZtNE9UK2RzazZN?=
 =?utf-8?B?dVdJVE1WaitlNmlJTU43UElwU25JaHBRTGN5WTBpcnduUm5uMHo0MVJ2ZEVW?=
 =?utf-8?B?MGVsaTFGQ0V0akMwYk92VjlzK1hmSy8yWG82ZzBkSGlYcXZUcnplZ0VjTitL?=
 =?utf-8?B?dFlYaXdjeDdPM0UxL0pjblgxNFBHQkdHaU9ETDZFbXBPbWNoMGhHSnZaMlB1?=
 =?utf-8?B?dFJEZHpWKzNybWZYeFB2Z0J3YjFIVjRBKzZoL2RIWjJEUXM5ZDBoSWNMMnpo?=
 =?utf-8?B?enJwSDIzeTFIazNlczhCaDhWc3llOWNBMnFQUGRXZ24raWV6WVk2Rk55c2c2?=
 =?utf-8?B?MStickVHUy84azc2ejRmTEQ5T0ZLbmdtNFpLNW1JWmY5R3BkN1R2WkJibVFW?=
 =?utf-8?B?REl0Y0lXMEE3YTdwL1hCNkNYOHZUWnFxMkx6eUMrbkNtUWp0eDg4WksxVFZZ?=
 =?utf-8?B?L1J1NHd3OUU2SkZKTTVGdHNHbkFCUzB3cnk1VHpMZTYybnM1Y0Z4V2VxN3k5?=
 =?utf-8?B?ZjhEOFRzdGxBbnBjV0VwaWNaRnRPVk9Mb2xxWkxwVGhlZDRSL1AxUHhMbW9E?=
 =?utf-8?B?VmZxQkxGb1NidXFwdmNCMkRVM1Z2a2VNRFB1cnZVYjcyOEJzSzdicktpaUxv?=
 =?utf-8?B?eVUyQXJtZVdYQzVDR1BXcUdEclhwUnVBOXM2QWkwZGFiZFExOGRwUXo5b29D?=
 =?utf-8?B?TmxwK1RaaGliRGpNMGNTdWpua2o1K1FQUHoyQWM1RWZVY29NaG5iODk3K2Ur?=
 =?utf-8?B?Q0dBTFg3RnA0YnlCT2ZQTjlpamx2UnJMNlZJQVNzMGw0eHhCZWxLWkdUOHli?=
 =?utf-8?B?dlVvTUo1SkoxdDc4ajVTZVh2NWl5cFBqSGdXWjAzTm9Rb3QvMlRRU01NN28v?=
 =?utf-8?B?YlFZOW1MY2QyejRUSXJFWEpyc1FMaHRXNmt4VmJneFIyTFFDejM3bnV6MStx?=
 =?utf-8?B?MmtZQUVzemJYUWVkaGtkYWdKTGpxdFZDOFFzcldMSDNwVFlLQmY1ZVI0WlVN?=
 =?utf-8?B?akpmTzB4a1pIMTZWcXZRNUZIYVNkN1dvSUxZR3RISk9kZHpCRTIwUFM4bnZz?=
 =?utf-8?Q?QfzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjljcnRxVkUzRmV5aEFVODg3dTlrTWsrd2c4RWkwUlNPTTIwZGUvTStFcXF5?=
 =?utf-8?B?MFJ1L2tFdnVwWVJ4STQ4ZEdmMlVJS1Y1eXZqWENTdGFQNENHZFFibzI5Zlpi?=
 =?utf-8?B?R2dXOUJDOTRLYnBDWXpBNkhzajBZd0llb0JLcXA4WjJqLzNBYWJZVDVST0hH?=
 =?utf-8?B?MTdkTHpFYzhXdGQwVldsWk1QVm1rc0w3bUhuYkZCZVJtcTh2UWIvWEorY01O?=
 =?utf-8?B?UDF3bEdSdDkybTcwTlhKc1VneURqcmlJTC9CcVVZRG9VaGRuUlYvWVVLOWRW?=
 =?utf-8?B?aGh0S1FYaml1Y2MwaFU3QW00SzlKd3ZIeStYMGdPSk9BTkJGYnVNQ21pVkVz?=
 =?utf-8?B?OHp6QjBmbWhhYVRELzg1WFFiaTNhR3hSUkdxWDFwWjV0VHI3YVc4UXBwTDgr?=
 =?utf-8?B?YVRyQW90ZVdVS0QzRjNRMXczWUxEVWFjdSs2U0syKzNOK2tRSVZoV3Qyd1kv?=
 =?utf-8?B?cjJXTHR0UjQ5WGRuK21CNXdxWjFzRW1QaXdDNUdXaU1vOE5hMEt2QTV4MEE2?=
 =?utf-8?B?eEExY0ZaWEh3RmJwSDNIaWJMVkt4dHg2SGQwcmFGMHozSkJEa1NPeTZlZGdU?=
 =?utf-8?B?Sm9nTkE2a1kwSlcwVDBubVpjbFlLYm9LeEg5Ym05Z3pBV0VwNjZ4V2o0ekc3?=
 =?utf-8?B?QVcxY2wyYkhGTUE1L1JkTkVHOUZYVUNjZm5KL3oxVGFoNHIyTncvZkQrZ1p0?=
 =?utf-8?B?RE5RMHQwcjliNHlMcVRxY0JSZWJJaFJmVllkUWdqZDJPdS96NXlWWmZ5Q1Bm?=
 =?utf-8?B?N0wrdFVIRDkyMUYxU0I1Ymk4Wm5qdFF2MFlYQUdXK3JvODA4V2crSWxzb24v?=
 =?utf-8?B?aUovY0ZGdG5DU2t3a2NrbnVUcVNTK2pWdXR6c3hrei9JZnRMdkdFUlNHYUJp?=
 =?utf-8?B?ODIxU1NGRUJzNjBRKzdDNWJTcjVQY2RUcjBTbFdkR0VBWUdvVVloM0NJcmFY?=
 =?utf-8?B?R2lEUDdrcHpvRkVBaWJkL1hnVTBMZloydXd0WXZKeGthTjUwM1V2aFVXWUIv?=
 =?utf-8?B?Q3pqbkVDMnlKb1ZPSUViUkp6OEFDVjU2RXlCaDkvWHAwT1lGTXNESjh6dEcy?=
 =?utf-8?B?bkZLR2Z0TlVMNThyYmlUcVFVUzJJUFB3azIvclZLTW5YUVAxQW5taXlZVHJ4?=
 =?utf-8?B?b2NDc0tqZHF4eGNyZXJtd24vV2xNc09wSklTaERRRHBCWk00d0FGakJIT25t?=
 =?utf-8?B?TkVsUmFzblQ2Sy9SOXYzVEMvQVdhQTFnQ2VYVWNUTEJiS01iRTVpYTlQaHFm?=
 =?utf-8?B?ZXRkWlR4Rk9QUjlIVHd1OVJwY21oSTVQMmpOTDlQcmRibzFCaGladlJTSDdr?=
 =?utf-8?B?MTU3Vnh6NWo0VFhBK2Z2SjJ6elZqL0FtdERjMnM0cTBicXM4d0QweVNjcnlF?=
 =?utf-8?B?T3JKaE9iVko0TTk1N2VaMlYyeVhTWXFSQXNieHhwYmtzRDQ0d0Q3TGR1bWRz?=
 =?utf-8?B?Y29PVVhXcGoxR0JMYU0yWWU0UUR2d05yZXlIeUhPS3d4eEJ3YjkwMlpGSGVS?=
 =?utf-8?B?SnFhQ0FXNTR6MTZ6bnhVZ0IvQzJmZXMxWitnSllhMEg4T05mY3IvUVZNRTBq?=
 =?utf-8?B?Wk1NOG1HTDBWRm1LbUpPM2FZWHhPLysxQU1mcnBqZGF5UXA3UFFwNG5qUkNo?=
 =?utf-8?B?cUxMUU1zazU5a3V4NFNDWE93SjdSUkxZV2lESFVKZ2xWRGVMaHpXRyt5dkZv?=
 =?utf-8?B?NTBjSzhNUm1OWVFDZDJ4TjlFREJzWVh5eVN5OVNYZWFITjAyMkdZcXRyd3FB?=
 =?utf-8?B?Mm9KaHljOGI3L09rRE9MZ2Q4ZEJSdW53K2syQWlhR2lQdlNoejVKdVphZTU3?=
 =?utf-8?B?NnQ5M2JrTkx4eUJ0MDBZUjJpRy9VRG56REdpaDVlTDZldWwyOUhZYmhXdGJa?=
 =?utf-8?B?a1ZKOTJMb1BUYm5lVGV6N01jR2I1ZEpBZndCSm5GcTNEaHlwZGRBaTNxSit2?=
 =?utf-8?B?L05DTEFDek0vVUd6b2w4Ty94SGdXSmVPOFIrK1ZnbE1xV0hLRlBXYjZZUklN?=
 =?utf-8?B?QUhyaE04clMwaTNHbzZvRXZmL3M5dXhkYTVLRVp5eTZ6MkdLNzAwYXZxZUpu?=
 =?utf-8?B?QXV3am5VdjVXRTIzdUNWcjhwQjZMWVl4T2tuTHZjOGNkcldHSUh1dkk2Rm1B?=
 =?utf-8?B?aEkwM0xuYWZtL2ZJQTZnNElLemc0T0tCZlc0VmMzczB0dnNVd3JqYW50OW5T?=
 =?utf-8?B?VlJpcE13VjRXTm1pTmZ6R1VYcjh1RnZXVUhZMXAyNG1PWWg4OGhoUWNQSzJD?=
 =?utf-8?B?QllFVG02NUV5OERZd1IreW0rWFVkTlVTS2NXTGpSaWtIQUdka3dLajV2eXY0?=
 =?utf-8?B?U2l3VGowQmRLSG1velFFUFgrVXBMMytRemxjd3VDZ3FnTE1iSTdtdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf203e1-cc47-4c4f-4e16-08de7273604e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 00:34:59.7340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHNRWbpQRiAoG7kdSttAiFsrhfR9c+y1TDvmRs5wJShNUd2GKH04nGytCv5LNkCet5PpK7/bxsvQ195TBGyHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buddy.rs:url,Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8BFB5170F80
X-Rspamd-Action: no action



On 2/20/2026 6:43 PM, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 10:20 PM CET, Joel Fernandes wrote:
>>
>>
>> On 2/20/2026 10:53 AM, Danilo Krummrich wrote:
>>> On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>>>>
>>>>
>>>> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>>>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
>>>>>> +						   struct gpu_buddy_block *block)
>>>>>> +{
>>>>>> +	return gpu_buddy_block_size(mm, block);
>>>>>> +}
>>>>>> +
>>>>>
>>>>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>>>>> doesn't appear to be used in buddy.rs.
>>>>
>>>> I think it is worth keeping because it is a pretty basic API the underlying
>>>> infrastructure. Finding the size of a block can be important in the future
>>>> IMO. It is only few lines, no?
>>>
>>> The helper should be added with the code using it.
>>
>> I will add this as a test case to exercise it and include it in that patch.
> 
> A test case for a helper? Or do you mean you will add the actual abstraction?

Actual abstraction.

thanks,

--
Joel Fernandes
