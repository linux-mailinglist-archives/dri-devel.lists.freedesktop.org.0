Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4BBBF8C1
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 23:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54A910E611;
	Mon,  6 Oct 2025 21:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CvsRmKDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C25710E665;
 Mon,  6 Oct 2025 21:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQJpA0CClCD6/E37LVLButUI2q5iYHESR4FR+7TewZFdTDjAVf0mgER6etjjxgdygRsh9NfYixrkUEqZFENoFbvxXL30nTh2PWCQT3FEjCiiEWm/ZJUq2i1Qq7F6RHdLMd6igE30Nmo3Grldf2fQ4t1T4HHahTpCq6w2zBU+QfkCR4oh62+BRGLObrUrJKqmYAtrnpfDi3iLud+uvR7+J6l0KmYF+i9cRfWOw9UTBe6sZsJBRK43PmBjicU9Z/CIh1w5JGPT7QNVOaxMcnTdEFxsxVAIniySao35EjRmI5oV21OccYpTPLx3sghHMem86sSi4OD4nm3HIt1cv3qXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOp1Ow98vYScyGWAvKyaowZE0pWOhH39PRE/xg+3H2I=;
 b=nRGCp1RA3qPRWuXALHnklXvJ/JYYOOEkE7hUmT9q0FO2dISF3Z4lt0C9OP1+y20NLbmCzZJgdb0/N7b2UExoue3KdONk/1Vh/nY/JRfdkJ0IQgFffkx1IwE0tNFUT5/yz3z1IzIrioakywG1tug9RTDaf657NvIrUWVU3Cba8pE4gShbfikHXjSN1SDwzYAsnQNgO+D1eYSThMgP0kOIkcnMgz8YIlqaJ2TNWUHlx+Yi6pix4RcuVCcDeMSJwza8C5ClUvWKSjfcMQRU/7+a8a1S98EdbxLcnxUjkBpJpCazbXZ44MMkiHS/Jmm2G3b5MY73MZCJ8Qb7qJ8/5wHT9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOp1Ow98vYScyGWAvKyaowZE0pWOhH39PRE/xg+3H2I=;
 b=CvsRmKDDWn9XUudY5J7HDwG+lbww7SbBkKrqrb6uLwKzoXhm0XnmaNMcbzKPB/ans5dZ1gXeeIVX713HpDelw11FlzxwmyZI+yCCL4szPihrLNzDyxj/+UqOHA/tbdkebqYfbODweqIpBFpqZ71h/4JFQF1GvtSgfhs6YKBbh7NqinzvQiqHQceEr6E7P5IWrNiK6QsCPvNT8pkB5+xLDn6wlLVtKvC85sSJEQYpugb7crUdbjGu9m0se5E+r35MlngwZgiXn0+MIP2p0iHAST9J+8jlPrvL/6zKTHK9gJE894jF6q1mqFqwOY6OsW4L42YHMPlYbqqgfvRwv8G8sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:11:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:11:42 +0000
Message-ID: <7f80b5a1-6322-4910-a553-3e9cdd02bc06@nvidia.com>
Date: Mon, 6 Oct 2025 17:11:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] nova-core: mm: Add initial structures for page table
 management
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251006210956.3232421-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251006210956.3232421-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:408:e2::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ffd871-c80f-487a-edd3-08de051cf2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFBGYmdwY2pHL0V3RzVmT01iOWg2eC9Mc01jYTNhbVI3YkF0dEVaYzZmdGpG?=
 =?utf-8?B?ZmlFVHhWdHdIcFhWYlFEbm5XczhycTVTVG1jOG9FK25NbDkvbVMwdVZCNytj?=
 =?utf-8?B?OS93ZVdaSnMwa3RVM1N1MWZFUytOZDExR0Y2RUdQNU94dm1uQnI1Y0I5eDhF?=
 =?utf-8?B?clRWd3crYkZtQVBtMmd2Q0xUeEticUJrdzZyZnZuMmxUa0VXUXdTU3dpdk1M?=
 =?utf-8?B?TXNYR2xjd3dDajViczRyQ3FEcjlVNVMvUTlWb1dnZVdOVUx1OVJwWGdJcm5U?=
 =?utf-8?B?TmZmSEJqQWI4UFM4anN0Uy9NRExVeFNFN1M0UlJQdk5sbWx2SU51QkdNVWhJ?=
 =?utf-8?B?N0FWMEdVZGFGVUx0QzZ2N0N5MGNwUmxsU2xwaldLbWo1STluZ2pJdzhsUXdQ?=
 =?utf-8?B?NThXTS9FV2VRZE1ES3R1WFJVTmZSdng3OGl0YXV5UjRualAralJtMG9oRWtz?=
 =?utf-8?B?bVZZcEltVzVkUDl1ZVJ6NlA4aVBSbkgwR2gxamFFYm0xcEorNTMxOE1LTFU2?=
 =?utf-8?B?TzcrUUMvU0phRmxTbUdDc1VyZFc0dWlYUjhtd0U5ejZ4RmRmTTh5TFBUVmYx?=
 =?utf-8?B?dTJ4L1gxcWQ5K0RyU0VPNENidlJmai93STg2N3pkRm5DeWFEYzFWZUNPNDVX?=
 =?utf-8?B?OXpFc0JtWXRoUk41S1l6dGM2MDU4YkV6d2h4SW5CZEpqS2xaM3hpUldnOWRK?=
 =?utf-8?B?UHQ3SEsyWmdvTkV4VytPQmVMWHhQazNuZGZ2M2lKQlRLK1RDUnBkNFg5aDUr?=
 =?utf-8?B?bG1LV3NKbVNaV0RlNUdDd3VjNm42Y29tK1AxNUxCS3loYmYxQlF1QVROd05i?=
 =?utf-8?B?b0NOVmJHbXN0aUNXM3VINmF5bXFuQVg4WEtpVmJsQTd4VktNRjd5T2NCUDE1?=
 =?utf-8?B?cG1qRjZZRmJyQ1AxQXJkd3F1QXFPTmduYTJlMGtaSXgzMDlDS3cwUEdpd0pp?=
 =?utf-8?B?UHNDQ2pvYmc1SG4vRENjOEI1bUYrSzEzeENYVk5xWGI0OHdFa1FGbXJiWVJk?=
 =?utf-8?B?Y0h3U0pxeHI3SGtOR2FocnF4SC8rbEhBNW9mUDJpQXJIZ1p4OHRXMHo1QzRl?=
 =?utf-8?B?RkhMakpQR0hZVWRRcWNIY0UvWU40MTFIQitXR1hTaVFDWForU0wwVGNKU0hy?=
 =?utf-8?B?TDR6U2xYaVZWSThscExNWVQ3Q2J6MmlkUWJ3Rm8zMmJaUnhSQnZyWWpDb1dk?=
 =?utf-8?B?R1dXWVpHZjlwODFwM09UcFVQa2ZHazBLdnd4ZzdmOE0wbFlIbGxmZTlZc2k3?=
 =?utf-8?B?NEdUVmFWV1dXM2NLMDlNQWVudysyQWtQTVBNbTM3VEkxdS9Bd3J4NFVOVEtM?=
 =?utf-8?B?UUR5RExMRC9Fdmp4K2M3R3BoR2c4YlZuQ1o3SFYydnVUTTlBUTZHUmlCejRs?=
 =?utf-8?B?VFV6dmkzeUFQcFpFYzBja0R3QnpJcXpWbDNFNjNiVXBHVU5TTHJvNlhwbEFB?=
 =?utf-8?B?Y0xrdGowYWJXNXRDR24vN0JvQmcwZks0S3FTMEtCdi9pYW03STZ0eDVnS0Qw?=
 =?utf-8?B?aTcvcnFFNFpHcTE3VlZGaXNpVGE1N3BUTFN2UVZ5cmxELyt5d1hVcUhxVDRB?=
 =?utf-8?B?WlZkL2hJOUt0bkRzcWlFOEFuZkFmcDQrallyMVFqYSs2VGtBYnJmdWplOEpW?=
 =?utf-8?B?ZUdHc05Cc3ZsSk5WK29tdXVKYytGaFJYTzlWQ3VtbitseUNtOXgyOFg3ZjFv?=
 =?utf-8?B?ako2SUx1djhWU1JqUUpHQ08xb0xub2ltQmU5Zm1seTd3WUF6TUlGOWZHV2lP?=
 =?utf-8?B?N0V6VVRFM3ZqamJxa2w1RVpaM0dkMFE0T3NEcnZDRXpXSGxUTVNQSDAyUit5?=
 =?utf-8?B?Z1o2NUxqbWhtenIwdzNsUVFteHc5NkdQRHZyMUUxRi9uZHRLckZNWmhWOG5y?=
 =?utf-8?B?bkFxajFpT2JwSWJtRGRNa1orL21wanNod0lpT0N5akd1dm9oZldJVTZCRjYx?=
 =?utf-8?Q?WMD/4tNn8QHW9DWF3+gqh5DNoCLC11u4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEo5aWZzZDgyRkg0OHdLYk5hNEZKcC9raWNxUDh5YUxtT1hzQXJ0TlhDMWs1?=
 =?utf-8?B?UWNtWStjekJkbFBsQmo0czNWTjlxNE5BVWVlanFkb0NBQUVVR0Z4K29JZlFt?=
 =?utf-8?B?QW5LM1pUQTdpMVBMV2J6TjBjNTZkdTQ1ek9mSlY0UnQwcEJ4Uk00bytoZFhR?=
 =?utf-8?B?SEVCN2MrSU0va3V2Skc3OWtwZmpnM0lKTDJKUnZHSUU5dkFXamhhV1hNMERy?=
 =?utf-8?B?TW1lV0xmYmJvL3JUOVQ3aXF1aE1Wa210cGIwS1JvdWpwK0VPMGJ4VnJWSGdF?=
 =?utf-8?B?QUdCRmxpdmlpOEVvOGs0TVRqaTBhTVFSUURlU0hkemlkUkxtQkF4Q0ZFV2kz?=
 =?utf-8?B?a0Y5OUN4QUd1cVQrVjJIUTdnWlZsWGIwOEo3Z3E3SG5LdENnRVlFYXpGeUpu?=
 =?utf-8?B?dlF5emJJMWpyeHZTYmIzY2NDb3pZV05LMzRabnpOVEYvNnZncTRvY1JYSXU0?=
 =?utf-8?B?enBVSzFwcEhWa2FPY1ptRmRvMXYxczV2RUR5cUdqY2dNclpxWnMxeXdSaHJF?=
 =?utf-8?B?MnJKRXZ2T2N3MVRpOWs3S0RWVnRVbkJoL2IwRTlRRkhGTWdmUXpGUmZhV2JB?=
 =?utf-8?B?WGJZMTg4ZUNpaU1zZHZmUmVCU053QnFwYW1ZSnI4eFplZ09TQUJkbXFIWFda?=
 =?utf-8?B?cFBWMHh0amtEVGJ3cHRiM3lMM0szVGE4ckMxQjFQWHR3T2lwd3JIeXZMUUVU?=
 =?utf-8?B?QUQ2cEdOOEk3Vlo4SGVsS0s3TFBqVXVodmJhL1JtRXlmTWdnWmZkWjRTQk9J?=
 =?utf-8?B?R3dRKzlBQ2xOSzNZUGlhOVV5RUtxZTFTZDRTTFM2MENCWVVtRTBSSkZqQVJN?=
 =?utf-8?B?eWdQMklWVHpYY1NqSG9ONDZheG1vV2VNVzFTN1YraC9HUGw2UEN4czl1WXBB?=
 =?utf-8?B?ekhwamJ6aTVMTUhJUmg0bXhQOXZjTHF6Y2d0T2tZVWxwSTZWUDdObHNQQnhp?=
 =?utf-8?B?MlVVZVRVQkk5Y3VKL2RRcmZ6UlBtaEgwcTYxZnpzWmdrS2toYis3VTMzUGIv?=
 =?utf-8?B?SmpBd1NxcUJ4M1h0VnJLZG02V2EzSm90bnVNUjA4eC80Skwzb1k0c1k4WE9U?=
 =?utf-8?B?LzNmM3JMZUxPNkR3U21SNEQwbElNcWlnMGl2SWJpb09IUW5jVVBnbGM5aXho?=
 =?utf-8?B?WGNwdk9lVEp0Ymh6TjlOMkFRaUQwZkFwVzlZSkhVeUtNdjA3eUllMzAzRXNr?=
 =?utf-8?B?SGROR25IaEN6c1dnRUpOWXpEQ0oyakNDMmFDSXh0NSsyMXVDM1Rkb05pdTdZ?=
 =?utf-8?B?SzF6WXovbUZYZ21Zc2xVQ3IrQlJRbGtKb1VUZnFTRjR6cTlKZG55NTlaNVp6?=
 =?utf-8?B?eXhyd0pEb3pLYWdqbXQxZU9qaEFTVXVGZmFjUGZLQXprckI2eGZ6NnFjUkF2?=
 =?utf-8?B?YzdGTFJCSHZEcStCV3BqZ1hPOVNhb1NDMWpHWlNHQ2wzYVBhbHRLRnF3RmNB?=
 =?utf-8?B?cE5qdnFHU0RJSWZJandKbEZaU091dUxIWE01emgwNzRzcnl4SHNucWJZZG16?=
 =?utf-8?B?L0sxaGN0RHRzSTdiR3FHcDVsWi94c3Q5dWZxbGFERzcxdEFzU0NLYlZWS1hy?=
 =?utf-8?B?bTlkeHVMYkliZk1Ha3pyVEZSRzBqU2d3SEt2Q1VyeWRqWTk1bDdtcDk2bHoy?=
 =?utf-8?B?Z05vOGtXeSs2V0pNKzFQNS9JeC9CUTdXSnZJUFlMamsxOUNNZGhVYWxQZXhm?=
 =?utf-8?B?ZWJWaDBxeENrS3FhcENZanVlWnRHSTk4ZVdkOTM1OEZ5L3o5QkU0KzR5MnVh?=
 =?utf-8?B?bU01TmdJSWFCWlVIbEU5WDNQNEdxcmtPdiszUGppWlNGTURjOWp2Ry9obUlR?=
 =?utf-8?B?S2cxZ09PaXp6Mmh3ZDF3VUtXam1LaThReW9ZNkROSzErRlRidERWVllnYkxr?=
 =?utf-8?B?S2dxUDBaaVJZZURMcGM1dHhYTFpRRUpsR0dJWHNjQ3U3K0dZb0dvLzBlTzl4?=
 =?utf-8?B?T0doWEZCMnFuZ3VvbVhkUHVkTkRKdkVLL0IwVGpMZXl3enNsamFtVjZiM1JQ?=
 =?utf-8?B?amlDYjUzeVozeUFMS1VXK0pJbmZSaXhRYVcvbzhRak96bGVXN3F2NVl4L0Uw?=
 =?utf-8?B?MkFDdWlvRmI0UE1CNmE3QXBkMmZVWE5NcE5SSXo2U2IvcXVjUkFZWEpmc1dm?=
 =?utf-8?Q?mtg6dTWBp1wHfwEWea90dvU6M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ffd871-c80f-487a-edd3-08de051cf2ed
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:11:42.7862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPSyO3QmTEpkOpz2KrJb9aeQ2nLhjd/D8DFXFjjPcbIa83Thqgz7Thsl0ZGlJenIIfXSN26iVruln9aaUlQ0rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
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

On 10/6/2025 5:09 PM, Joel Fernandes wrote:
> Add initial structures and helpers for page table management. Will
> expand and build on this in later patches. Uses bitstruct for clean
> code.

Sorry this commit message needs an update, bitstruct is now called bitfield
(this is just an initial RFC).

Thanks.
