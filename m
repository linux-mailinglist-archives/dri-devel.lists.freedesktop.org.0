Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CDDB42C27
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280FB10E944;
	Wed,  3 Sep 2025 21:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ErbGFKdu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1C110E944;
 Wed,  3 Sep 2025 21:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0PlHTrQtWZbVyg4kmLoEhi9L/qa/2I7azO4z5Q89fSXAX1KmslXc61CdTTs7PENsfWu2+C0e7FmpIBwweUdzd07k+MCGuXoK4fmFLFmkJphijjgWA8DKFwu8XQMWpw/LKKpezqNSqK1EdrOFd+U++fR5wudjKq7CtIZD1fl+XSyZ3fdgxou+2jlTBAKKiQJ8VU1u4OC7cXtIQnDAwYi8tj6bOJsDkC5gyTd5/lx+UJub+0NWJsUiQy0INbLLPKywhb2jCTtCgEd1IDMUpTywEwsBqGnWrQ9Bvx0c8f/R6i3G51G3yFJrGqclLMwdpy36twIjSIJK/Jl2aSll20O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onZJixveleKtt6WWfj9k75+i3B6cWxGZKRJ0yt4G2+U=;
 b=xXP2+TPXUAOf09zzrPr+ykCutxqmaDX/WpIyZlNEhSwyP8bXLcHoj0WpErM/Rs5PpB5AonQjJMUUDj//K31UQrxEMd5FnV78W2ILeKUESK7zw47F3zKoYTStbJ9UFFJPmnons0cWNwj/PVAzO2IjfTowt1pPb05FHibnYojwGhoiIR/Zpt9RLv5bVh9jMPekPYLMmOy+S7K1065Ncm4o6OEdQhScShYXGwnIxfW7h3j6YiLFPsMZA77MYOujxZLVQyphv8GMgZ33kbMy7kDIquaoG79oJDABojEL3AXL0T526Vws9b4kJdYd1boseocVNAQd4W4KugUgKC33QfK0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onZJixveleKtt6WWfj9k75+i3B6cWxGZKRJ0yt4G2+U=;
 b=ErbGFKduh5NISrbnrLp1BDFQOHzh8e6ua3EBAVdvi32zl33EXdECtPk1lsKcTkU4CcBwVnyYMGQR1hclqaIeatPlKHqmrR4+tu+szhjbK86iBTl68n1KuZJAL5A5RRkaALPBWhj3oqVTxhssAKs+/89mvY+eflW/u+XhQXG1uNRdhU4T4d7wA+nM/urCv+dpR818bSUVU6Lm76arnbDB4g0WHBYKv5FPQiMBNsVWBSqXkLtMFN3sC9+QAodLmGzEtBCT8Rb2b4ZLlLfJ1kNvVW0tHBcx3+NFW58BXcT1/5MrRDC6TYkG1TstFDb3DQNc80A35ZiyKTk+kpPmlS+uVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:52:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:52:42 +0000
Message-ID: <077935ef-705f-4b8b-a5aa-5673f22af75d@nvidia.com>
Date: Wed, 3 Sep 2025 17:52:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Elle Rhumsaa <elle@weathered-steel.dev>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <aKzvpFf9PkTHYNet@archiso>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aKzvpFf9PkTHYNet@archiso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffff448-c436-4d94-7f48-08ddeb34350d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2RPZmNCdmhBQlk0b2tmbWllZzZMMGJPNmVFNm5WTHhyRGF2QUFKZHpSaTF1?=
 =?utf-8?B?bzc2aVRjUHZhbmVjY0ZqeGQzVFlNc05MTFA3eldDRGtpNnJvK0hrYlNuQXd2?=
 =?utf-8?B?SzdaYVYyM1V5SzJ3QVM1bG1OMVdzNCtlTm1zaFQxZ2NsZ1YzeE1hS3AxNy9Q?=
 =?utf-8?B?T1o5MVZyRTk2T0w3LzAxWG1JNzd2QkpRb21JTitOSHVTb2Q0L0VuemFEeEtQ?=
 =?utf-8?B?YVYxcGZhbFZSUnE3L2VXSUQ1ZzdBMGRYS0FEU1RkZ3lzY0I5UktzN3ZucHY4?=
 =?utf-8?B?a3VXemhJczgxWU5UaXMvb244Y3N3OHFQdnNiaEQzNERIcmVTSlFYZTVMaHhm?=
 =?utf-8?B?KzYvZUxwR0dsczF3U3FHbkgyVmFYL1BqdzlDeVErcFRhYTV4UTBxZHYzdkFi?=
 =?utf-8?B?NGE4N081TEp0UERkVFE2MFo0R3h3dnBwYVFlemVVSld2RFpIdWlFM2xEdGRX?=
 =?utf-8?B?WVpkTjU5dEtRWHlxdjVPcjJCRlhwWDBoQVdJaTljVmZhUTRBemNXbUhnajBs?=
 =?utf-8?B?YjFvZVN5R3ZrRUZheEdOdmZlWmR5Tk5VbW1yeEdGYy9OdUFyb21DUExYaGJa?=
 =?utf-8?B?Y1V6bm1JQjJXNEJ0aWpYbTlsdXBmNzhaYmttUFl2RW54aDRMZS9OdUtnaHkr?=
 =?utf-8?B?cWwrN0pZUjlWYktzZ3RJK1JrYlI1VXE1QlNTTzhtTEtHTC9CQXpZb3M1OXdL?=
 =?utf-8?B?eVlUUXpFRzFaL0p3T3dvVzl6UkZJWHJkSk9DaEswS1NYQmRKd2doU1RxWjZs?=
 =?utf-8?B?L3YxWlRlVkVLMHVMbC8vOEp1K0JpNDlSWFV1Rkw2MUdEM3RSem10bmR4YytY?=
 =?utf-8?B?bFlJRnZ4MTNMYVdSZ3YwblV1VVRNV3plRTNTMlNXNHY1emVTd3BxZXdKR3Zw?=
 =?utf-8?B?NnhuaGJlK2pWK29MWjlwQVQxZFdFbTdaWXd3U2N5SERyQWRrb1JzbG1aVStT?=
 =?utf-8?B?K1BYd2diZEhTZTgvNkpScjlJYVI1WkkzMVJyTS94YjNtVFN6TnFzNGR3aWhu?=
 =?utf-8?B?eDE2a0h0OVBuY0JPdTg0OVY1WUZnYlUxTEpqaU1NTnpZNUtvMGoyNVZaMFlZ?=
 =?utf-8?B?NGtsRE4wS0l3ajFOeEFCWXQ2L0UrYm5ycDNhYm1RRUhXUEVmUXU4dmdTZE9Z?=
 =?utf-8?B?STd3OGNPUVZuVmtQMlZWRXlweWxuaUxTY2M1bWl3MWx4S0FCOFFzK3ZvdXZ2?=
 =?utf-8?B?V1puYXBJN1M1Z2JLTEdZdml5ZXczZEI2RDAxUlQvYitseW9zbGpmN0FLTGt4?=
 =?utf-8?B?Vk8xOGNaTDFmcDMwMFZ0L3Q5QnhiTFBLRW91NjlnckxGZlhOYVFvMHJsUHl5?=
 =?utf-8?B?MGFOaTcxVDZ4Sm05ZU5sR25ZSlRYc0YrUVBYWnlLTlF1eDdsZ0tJNmFUTmZV?=
 =?utf-8?B?Z21SQ3FhSTR3V1dxZ2dkVGZYd1BPdmF2Tmw0UERUNkM3OXJSZ3h3Mm9QcjhN?=
 =?utf-8?B?VzBHenpGVUIxMnY4ZzVwdW5CbjFXYndXc0IxbVRQVVU2R2tQYU9RL1kvd3Vx?=
 =?utf-8?B?RVdNWnZObFJ1ekJya0IxNDhFcUtiNXJKTTBEMzlNZU1NVmhxbFJLMFRsWkJZ?=
 =?utf-8?B?TWt3VnczL3hST3lDeHhkNWhnRmRSWUw4M2ZBNWZBeHNyazd1TGRTc3Y3WnJI?=
 =?utf-8?B?YVpMb0txQ3RnVzhNOVQ0ZEQrOC9HMjJXZllER1NVSWFNaXpZU0VmcXB5WFVt?=
 =?utf-8?B?bkpFR2VhZjVSeDBuR3VCUEk0ZDVhOUU5V1FRTTZ2QjA5bzRoajg0NXZQOHdm?=
 =?utf-8?B?a2VGSGtqQ0NlK0puK1Nyd0xxS0w2U25WUkJ0RnNicUhsdklHeFBmWWRDcjBw?=
 =?utf-8?B?a3dob3h4dzZBWEZ4Vkttd1BWNGZKQklqRUM1cHdhTnI0TERVNExycVpjMURO?=
 =?utf-8?B?Y1laRnFjOHh3c0s0SVExTGtaY09ranRGZ2V6bzFFSGxOaUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9kOTVTR1NHdlNRaWtIVks1elpENFFKcVFldWhrTTdOZG41Y2tQdXEwbzZp?=
 =?utf-8?B?RUhZZ3YvL0swZmlVZTVRNFNGci91TlJWVFlLV2xqM0NpYTlwZVZvSVdhU1BU?=
 =?utf-8?B?Q2VwTnQrVmZzdHBaTi9vN05tVkluYTJEUlNoMDFPcTJFY21VMHZocWsyQXVQ?=
 =?utf-8?B?T3AzZ0NpbGVTTWZrUEJnVVI5Y1FJNU8zbUNBcXp5b1RXRFlRVGlqbDFRWE5S?=
 =?utf-8?B?Y3dNdjdoODgwMThmWVpFOUhrZkNyY2gvdzdjSFdIM25ibUIvTWkrL2lRV0NF?=
 =?utf-8?B?alpMcDV0VDZCQW81ZldpUDIwdThaRzI5dURmV2RDMWZISVNxUzdaSlNCbzZl?=
 =?utf-8?B?Q1NIa3FJNS9GVFJUcG5VNzh3K29iSHFjWWR3c09GTHM5WHRYZ0ZXRG53SHVM?=
 =?utf-8?B?bVB5eFhRUk5iTEFyVEIxTmVJTlhRRHl1YUsvM2ZXYm9zbnU3MlRUeW9mUGdU?=
 =?utf-8?B?eWp1Q0VFbGNQd3VvM21jTGhlcmd0TmN2SG1FSTdHbml0RlN5eW9QTWRmeTZB?=
 =?utf-8?B?VHdHYUc4V3VQdDZCQ3YwYWhUMGs4aGpkcEpTN0JieWR0U3FYWnBEek9RVGEv?=
 =?utf-8?B?dVF2cmtrZVNia1hyejNubG9BVkw4TmRLSWc1S2FkQy9QbkVldzQ3eHc5UjFH?=
 =?utf-8?B?VkdSem5MMkl1SkRqSld0eFhZbnI5cjhTOExJWlFneTVYWUxyQjhucU5pQnlN?=
 =?utf-8?B?VHpBeWtwYkxmM0p6bWhvajNITEtKeWRPRTY0d3huR2hqQU9hRGVybXZwYXFq?=
 =?utf-8?B?bFVzMTQ2czZVc2N3UnRoQ0U5ZTBsSzVrTTN6d3EwclZhV2daenZ0SWJFRExP?=
 =?utf-8?B?WDlvMVIycjFVa3IvSlVxalp4NStNS3RPQjFWNGpVdUF4NWIzbnlLUU9WdGFK?=
 =?utf-8?B?ODYzM25PM0hBQ0Q2MWsrb2JYa0kyR0YwUkZ3cEZaTjhQOHU2bkxTdFp1bmF0?=
 =?utf-8?B?eDB2K1A5OU1oTWRHNTFEL3pTdU5paVc3dWI2cWV1VHZZbGNoT1BEaW1kM01C?=
 =?utf-8?B?QXFkS0F4aGtoLzl4SjN3WWpMRHZsVDF0QTlQV09YU1hJaWorZFBUN2lITmkw?=
 =?utf-8?B?VnMzZWpReE93UHZ0L2RPd05teEJzMnJFbUxMVno5OGhkYng0SWxHaEhxS2lI?=
 =?utf-8?B?WVVwR0FtUExjNWVrRDBrUUFIaFU1NWxpMWYvdzJGb2RCR2RONGVQbHUrTUVV?=
 =?utf-8?B?WnJ6Y3VCeCt1dVlMajREb3ptUjhkeFEyVmN4ekQ0bFR5cUxNOTZuWkplWDFT?=
 =?utf-8?B?L2R1ditNbWFkQk81UVFydHkyd2c0V1BENW85alc5RHJ6SXBDT29zbjRubUVV?=
 =?utf-8?B?bGJkTUQzUFNRZE9sblBWR0NkZnhoZDJrdEFxTTZZL25hTUZtemhDb2dUV0ZE?=
 =?utf-8?B?ZlkxL1BMOTlyL0dJb0JNamwwRzBISjJDZDkyL0VmY1ZmeW1wNWhqa3M5Z01T?=
 =?utf-8?B?MGtLU0tzSlJOWkwrVHErbEZ1NW5JR3VOQUoyMGZHaVl5MXZ4bmE4WEN5Wmh3?=
 =?utf-8?B?aHZ4REpaT2N3NW92M1lvNjh0SjM3VVdTSEJxVWs3RWw3cC9JVE1WV0Rrc3dW?=
 =?utf-8?B?Z2lFNW8zSGxEam92OTZKQkd4RVEwT3Vsam5DN0dZR1cyYmt2VThRTkRZNS9m?=
 =?utf-8?B?d3lwM1M3ZWVKRGVzTEJ4Y29NSlBVMEw0bXBtcFRhQk4ybXk5OEExVlRxd29m?=
 =?utf-8?B?WHdEYWIzdlZQaDI1d2pVVVRXZ2F0dzI3VXNuYW5SZmF3SXpzcklkT2plMVgr?=
 =?utf-8?B?eEhVZXlKU2liN3IvelFEOWtTbjRqRVEzZkc2d0hmUGRDc20rNVRhUXd5dFcw?=
 =?utf-8?B?MWxrTWxDQjhxRjhXajNhaTVKa0cxWEd3dXhCV0g3UTIrQWtkK3VmV0YyQ0U5?=
 =?utf-8?B?Wlo4VVJFdGJEM2RSQU5WTWpCVldjYVdxWFFUV0hIc1YvVGdtRE5pbVhHNDh0?=
 =?utf-8?B?NVlHdXlrVWMxekVxY0lMbGs3RnJyWlJvRWk1MXJNbXBnT2RQTlZJK01acFl1?=
 =?utf-8?B?VDQ0ckpKa0hWWmJFcEZoN01FNE43Ymg4NTgwdU4rQXV4YjljY2pZSzVUSHNk?=
 =?utf-8?B?ZzdJQ2RDN1lvNUphZWUydzM2SUhGcHBYaER2NHVuYnlXTXpnNTRBQi9zUmF2?=
 =?utf-8?Q?xDnUR8ax3eakcGIArsw1leSCI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffff448-c436-4d94-7f48-08ddeb34350d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:52:41.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VvlYmIJEX8qrgr6/XwPK8YSUaAEJOa0AzQpd2vG1ZSgN+TurJpw/FPDVSSIJ/TvwGP/I8+D8ajdjl6WtaDl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
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



On 8/25/2025 7:20 PM, Elle Rhumsaa wrote:
> On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
>> Add a minimal bitfield library for defining in Rust structures (called
>> bitstruct), similar in concept to bit fields in C structs. This will be used
>> for defining page table entries and other structures in nova-core.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs |   1 +
>>  2 files changed, 150 insertions(+)
>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
>> new file mode 100644
>> index 000000000000..661a75da0a9c
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// bitstruct.rs — C-style library for bitfield-packed Rust structures
>> +//
>> +// A library that provides support for defining bit fields in Rust
>> +// structures to circumvent lack of native language support for this.
>> +//
>> +// Similar usage syntax to the register! macro.
>> +
>> +use kernel::prelude::*;
>> +
>> +/// Macro for defining bitfield-packed structures in Rust.
>> +/// The size of the underlying storage type is specified with #[repr(TYPE)].
>> +///
>> +/// # Example (just for illustration)
>> +/// ```rust
>> +/// bitstruct! {
>> +///     #[repr(u64)]
>> +///     pub struct PageTableEntry {
>> +///         0:0       present     as bool,
>> +///         1:1       writable    as bool,
>> +///         11:9      available   as u8,
>> +///         51:12     pfn         as u64,
>> +///         62:52     available2  as u16,
>> +///         63:63     nx          as bool,
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// This generates a struct with methods:
>> +/// - Constructor: `default()` sets all bits to zero.
>> +/// - Field accessors: `present()`, `pfn()`, etc.
>> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
>> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
>> +/// - Raw conversion: `from_raw()`, `into_raw()`
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct {
>> +    (
>> +        #[repr($storage:ty)]
>> +        $vis:vis struct $name:ident {
>> +            $(
>> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
>> +            ),* $(,)?
>> +        }
>> +    ) => {
>> +        #[repr(transparent)]
>> +        #[derive(Copy, Clone, Default)]
>> +        $vis struct $name($storage);
>> +
>> +        impl $name {
>> +            /// Create from raw value
>> +            #[inline(always)]
>> +            $vis const fn from_raw(val: $storage) -> Self {
>> +                Self(val)
>> +            }
>> +
>> +            /// Get raw value
>> +            #[inline(always)]
>> +            $vis const fn into_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        impl core::fmt::Debug for $name {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
>> +                write!(f, "{}({:#x})", stringify!($name), self.0)
>> +            }
>> +        }
>> +
>> +        // Generate all field methods
>> +        $(
>> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
>> +        )*
>> +    };
>> +}
>> +
>> +/// Helper to calculate mask for bit fields
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_mask {
>> +    ($hi:literal, $lo:literal, $storage:ty) => {{
>> +        let width = ($hi - $lo + 1) as usize;
>> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
>> +        if width >= storage_bits {
>> +            <$storage>::MAX
>> +        } else {
>> +            ((1 as $storage) << width) - 1
>> +        }
>> +    }};
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_field_impl {
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
>> +        impl $struct_name {
>> +            #[inline(always)]
>> +            $vis const fn $field(&self) -> $field_type {
>> +                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
>> +                bitstruct_cast_value!(field_val, $field_type)
>> +            }
>> +        }
>> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
>> +    };
>> +}
>> +
>> +/// Helper macro to convert extracted value to target type
>> +///
>> +/// Special handling for bool types is required because the `as` keyword
>> +/// cannot be used to convert to bool in Rust. For bool fields, we check
>> +/// if the extracted value is non-zero. For all other types, we use the
>> +/// standard `as` conversion.
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_cast_value {
>> +    ($field_val:expr, bool) => {
>> +        $field_val != 0
>> +    };
>> +    ($field_val:expr, $field_type:tt) => {
>> +        $field_val as $field_type
>> +    };
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_write_bits {
>> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
>> +        let mask = bitstruct_mask!($hi, $lo, $storage);
>> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
>> +    }};
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_make_setters {
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
>> +        ::kernel::macros::paste! {
>> +            impl $struct_name {
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                }
>> +
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                    self
>> +                }
>> +            }
>> +        }
>> +    };
>> +}
> 
> This is awesome. Is there a place for this to live outside of
> `nova-core`? I would think this would be extremely useful as a general
> helper for bitfield struct definitions.

About to send v2 which moves it. :)

> 
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
>> index cb2bbb30cba1..54505cad4a73 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -2,6 +2,7 @@
>>  
>>  //! Nova Core GPU Driver
>>  
>> +mod bitstruct;
>>  mod dma;
>>  mod driver;
>>  mod falcon;
>> -- 
>> 2.34.1
> 
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Thanks! Since the patches are a bit new, kindly review again.
 - Joel


