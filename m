Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F1AC077C
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF5010EB2B;
	Thu, 22 May 2025 08:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="md75BJME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3D10E911
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 08:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GC9ix5daYM6v2ZrH52INIST3DF4ntlkz2CFRGN/JhKnzWLPqW7i9Bep593D9Y4jEs5iSBbFmpeXJPsecBxoNY6ZhsaBJ63Mfuwu6a2TuGcaC05OCJGs7N/QeTh2D/WQo+BOVYGrg3wCmAQQwiQLclDzXOckLgHhPPvESXyPrh9X8mbUrsvgxtbGwVoRmKymbsDwe5qaNqgkxIHjTfsJLHYkJCdGCK8Tj0w6EJLzfaBX/x34tX4jOQxbwfoHLhD3By8atYn/XSDzDB4vpfvwFg6QY9XE9H8KuDODERbnjiF8v5h4dmBOVClABCxs1oegxJAggPrSChL8US+ykdgXz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaiZ5koh1iLkGq2QlPLEDKxgWdPSSl0ev95hpcQ5HdY=;
 b=TZOH8Q4cBmxQsI1oA2fSuFbQSFxo2dSZMJtgS7WJwgbWD3pAHVV/a3ad/Q975tiW3bhAEGQXteFpCu9ySU0hGXGvByA+K+4FkLw7mKzH7NgpgHz4/ANsMxpAVVxrQo6c0yOqTnmPKMwzdEr9JIxB9SwB9XxPGMOwAQks3iMzRzX+PrKSH73jU2zYuw/fF+ghImhSDoQL54gogFyt8mDTRmI+uT9Nz6PQJxDTUiOR/vN7hFfSDb7ZQ3FYP6LDJkWMjMGyE/yP3kDnUxMmfoDD5vgKZX7LP7ZzaAuTvoGYhUda6A7ZVN6hLqiygzbAmd9fFr5UGLFbcvvTMcqiClBAsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaiZ5koh1iLkGq2QlPLEDKxgWdPSSl0ev95hpcQ5HdY=;
 b=md75BJME3XfxnARVbMAvOYRE7FSlJhUv73o5uHUFmspGjix9rY+Mxxemx/RWrncrw3Xh/XuHZlW55qe5jAJD5d3+1n/9OgBZ0lpt29deaGu4oCGV0OJnctAbHKOzESAwRjdr/Ak8eyei6hMixG2aGqzUhREKQ/oTFslCKuKuyxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 22 May
 2025 08:44:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 08:44:42 +0000
Message-ID: <ab32a3ea-84a0-484c-a07b-85aecf99ae00@amd.com>
Date: Thu, 22 May 2025 10:44:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250521204654.1610607-1-lyude@redhat.com>
 <20250521204654.1610607-2-lyude@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250521204654.1610607-2-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: b249ba9d-8df9-4301-e42b-08dd990ce50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG4yQ2VvMTBnSFdCZSs5NWZjeUdqYVdjMkxjVnBEZTI4TDBjYW5iUGJRSG15?=
 =?utf-8?B?azMyZmNpZk9iUXpwK0Y5cEJsaGM0RnppSkJLUHd3QnhFYnBVbDFGSzVuQnF1?=
 =?utf-8?B?amJVclNscG5qbHRpSlRCcDhSa1E3Z3E5ekl2KzhWNW9Pc2VNK29FQmJTeVRa?=
 =?utf-8?B?VmZTZE9SdGgvclZhTDhlWmx5S05PcFFZSW42WldmNTNLQjhaL1ZnYmNRZzFn?=
 =?utf-8?B?Y2paK1grR2dXOEFJQi9DNGpPRUxnazZBTWMwcE85SXNNbGVsMkJUbTJNUWFm?=
 =?utf-8?B?Y1BZZGs4TEVKUGxhUXV1d1NQZkJvNk8remdMSTZ3K2o5RitlMTFXN2R5VGpI?=
 =?utf-8?B?dTI1UCthdllCaUFLRk5IWjNuZ1g3bGVFL1diYTdtdURvMlhLcmhibGp5Z1J3?=
 =?utf-8?B?RzRqTitmaURZaWM3NzRpN3YzakxNNlFEUDF6VDZ5ajVMMmRIL2RyZm15WjhY?=
 =?utf-8?B?Y1IzYnBEeGF5S2dpTkxaaVd5MEZSb0k3WHk4RHV4VmRZWHZoV1JtdGlBbnJZ?=
 =?utf-8?B?VmJxdzkvQXNEMWlJSTh1VTZ2Nzg1V0xtYkdnRDZ1V1hUcXdTSTA1aXQvd2xa?=
 =?utf-8?B?Y1RjSFhoVUhyUXRpU2FqV2RFUGU3cVpZdk4vNU5KVnpiSHNGaWlUMDZSS2tE?=
 =?utf-8?B?WGx3S2xqZ1g4bHVGcmJIZlNObnlaNHJmQVUwWEJEOWRFQjRLU2o5M04rMVlX?=
 =?utf-8?B?dGpPdzVIUnlJdGVheXhBL205Z3JIbXhSQ2xHSmxhQ1p2UXBvYkNET2U5S0Uy?=
 =?utf-8?B?QjhjOEVIQk05ZlcxRjQ1L3RYRUs3M1V4T2h0U0p3VVNSYkg0UmYxc2tpNG0y?=
 =?utf-8?B?UG9FUFJ1TXhGdEhiK0tjOExBWTk5c2RZdWlzTUpRdDNJT0lJeUROWGpZdkpo?=
 =?utf-8?B?OExlSzllL0FJNGxRMmZqVkFlTmNQREo2MlI0bjBHZTZuU2FDdmRtaTF4Q0Ew?=
 =?utf-8?B?RlM0VFNTV0ZrVEt4bVdoRE5VbjdObGJkcXhCUTdTb0tObGN2c3FuaWE2MnBK?=
 =?utf-8?B?R1ZDUFpVYTRySlBkQ3poK1ZJd1dNUTRJdlJRbHRHakxlWGpGdnpSWEpmbFdH?=
 =?utf-8?B?dXFETmtucXhQNG53ZXE5d1B6OWR0NFl5ckpreDc0UGxUKzhtUGJ4NnZvSy9N?=
 =?utf-8?B?OTBkekoyZFBNVVZpOUR3Z2ppNFlSY05KUStkWHdBVmplVm9rV0xwcE9qaDdw?=
 =?utf-8?B?NW1UK1RvREZMam5qT0Y5QmU4ZE90RzVJa2E5eEVla0VDa0VFRnBXWmtPb0pj?=
 =?utf-8?B?ckN5ZnNuWGdNNmhJT3EvcGdGak12NXMvYXFkdXVTMng4bURkeXlHSW1lb2dY?=
 =?utf-8?B?cDZiT1BUdUtQSGI5Z0sxdFZyaWs0cmJlTVJ1Umg2STlpOEpQRFNSbTh2Tjla?=
 =?utf-8?B?YnY2RzB1blFsbE1WR3k0eEhXWkRlUUNJQjZqdlZOMUhsL2xmTVBnQWNZbjZQ?=
 =?utf-8?B?TGF4Skp3bG1yNEhkcjVuZ2hleWdvTkcxdlZ5U0U3dDhaOFRWTTEvOUxiZzdV?=
 =?utf-8?B?bWMwaTl6L1NLNWErZWFQNFg0eVg2VU90aStBcjhvMW9NaVZyaEZ1eGJJSUxN?=
 =?utf-8?B?WHBVcThqYUkzSldQSkxpY0poNSsvZjlheEhoRjhzR2J6UCtPYmhrQVMzdzc0?=
 =?utf-8?B?M2FuVDRVdCtiN3JXRklxUXFhcVBRVEZCNllIem1NbHNjcndLQWhRVEVIQXc5?=
 =?utf-8?B?RXRPWmsvQVZoL2ZGaVVZVkpzSUIweHRkNXNPS1dDVURIdmwvcEVtTTIvVUZP?=
 =?utf-8?B?THZQaWRnM0ZjZ2Jpb21qYk5nNFB5Zm1wZ05BeTJCU2tXNmswaEgwWXVtc1FW?=
 =?utf-8?B?bHkxZ3U1K0dsMFpQS2NJbDNFVWlYRXVZTjdqemRxZGxXWUVZcjhhNktGeUpL?=
 =?utf-8?B?cGdjby9iTFM4ZGFQQjVIZDRGWktUN1p0TFhKVWozNEZGdmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXdwZnE4emZZYW5wT2piYzRscGM3dGNMNnphSXJUcml0STBqY3d4aDY4VWln?=
 =?utf-8?B?a3RJWmRBN092eEpNNU1ib0h1Z1Z1WW5zNkFjVk42S1JUeDFHckRlOXpVZHor?=
 =?utf-8?B?NW82cW5nVnRxejNNNFdqL2w1V01zSXo3c1Y3U2g3YUlSSDlJK2xibk5TdkFz?=
 =?utf-8?B?MXpwWnBPcmhGSitEVmhhRTNhMTlLU2duMmxsaGF2QnRMMHRBajNFQVdDazdu?=
 =?utf-8?B?Z2lGaEk3SEt1RlhyL1ZIaDBzbGNlRzZ3dmpwNmx6TE9kQVozWTN6YUppc1Fw?=
 =?utf-8?B?SVNwOWd0RTVTRmkva0xHUGxtd25FcThZR0txak1pdkV1TDVVeGpGNWVFQk5U?=
 =?utf-8?B?SWM4WW1FZ0g0NGFTRmFvMFVWTTJzY2VrdXlpUTc0NVFoVUFTc2hOcnR6alZm?=
 =?utf-8?B?ZnlhblZrWjZoM2lId2U0LzAwU1FFdldVdGpnNUNqSnlMNXd3OU00K3pFM3lj?=
 =?utf-8?B?MWVQNEttSFFIM3puYURxK0VDN29KZUxwdVVCV0xGUlJqMjYyN1dwNG9TRGI0?=
 =?utf-8?B?aVlrT2VHdVlVOVlxTTRvZFpOV2VSdVZvMktSa0NJd0gxa1dtcno2R0F3eFZE?=
 =?utf-8?B?WG1PckpiQXU2N0VZZndWalRWK1VldHVBSG1WVll4N0wvMlpLWDFXMlRuQ0J3?=
 =?utf-8?B?OHc3WWx5YUVPZ0JtVDJvdXFyVzBRZmk2dGMrSzkxU09vSHBXNUl5ZWlaOGRv?=
 =?utf-8?B?YlY3MFkrODlPNDRNYS9lcEc1eGxtVDhoelRJdDVEOE4zSjRVMmZZNVBIQUEr?=
 =?utf-8?B?UG1abGtKcVo0MnJVUjJFQXR2bXIrN2VDeTc1OEZ6Vm91Qkg1NHdCbzl0RnlH?=
 =?utf-8?B?cTFzSkxLWmFhQVFHM2hSblRweXQ0WllHeVEvc2d6SWFQQ3MxZnRLM0ZGSUww?=
 =?utf-8?B?ZHNuRjJuaFpIQkR2a3l6YjBnVjJJa1BWNFdIb0w4RklmZHVwZVFscTBUWSt2?=
 =?utf-8?B?UG1oeUgzRVdxR1VFcmZ3RGV3SVA1MndHcDJKZzJrK21MVFNOZ09hNHVxNFU2?=
 =?utf-8?B?ZWVtTVhGQnM5R1BKVTBlMDN5NmF0QWNUaGN4RXNrMFNLeS9DSUtPU1FuOTVv?=
 =?utf-8?B?Ulp4WFY3RnByL1Zoa0Q3ajk3eWxHQjhWbzdkREFhSStDVUhwdHVsTFJYdUlZ?=
 =?utf-8?B?dHplWGdyM2JXbjBKSktKQ2drNm50VVlEQzQ0Z0RhVC93RmFUT0I2am51VDJj?=
 =?utf-8?B?dFpzNE5QQkpGRDR5OHNRcnFRQUplMEMvWGtZWnV2dDJhSndhWHRQdWxhaUdV?=
 =?utf-8?B?N1NvL29OUkhpeU55N29tZDRGTmJqd1NoUnQ5UFg5S3E3ZFFzbE1GemVaVlJV?=
 =?utf-8?B?TUQxT2tXa2xiK01ZRk9rdWV4Wm1GYlpsWnhBSFQxMG1CSERzN0tZYW54L3lD?=
 =?utf-8?B?UGl6SGJWSEpxUjM5eWNmUjM5bHl2UEpqYW9HRDIveW9RdEdHNDRiWWhxN3RX?=
 =?utf-8?B?dEZPYlhaUHNSQ01waWNFWUJWM3VrQXQwY0x0L3ZaTXphMkN1RmxzSGp1ZFU0?=
 =?utf-8?B?SS9rSk41bXVuMkZVVEh0MDBNYjNHeEJ0MlVKd0o4dURtSWNrUU1KMGpLNkUw?=
 =?utf-8?B?YTJzZWwvTjVUQ2xWeFJCZjlheHkzTVZtSzQzVUhLVVp5ckFzcEZhRGVGaHdZ?=
 =?utf-8?B?V3VKdDJYVGVlRm9tZ2FtMWYxT1I3REdmWnNKdTVsaWVXamVBQjNacHl4TkNo?=
 =?utf-8?B?QkRFcnRkS0tmdExPaXpqL0dlRlkyYzFMcnlvY3Jvc0hBeVFTVFBONUlnWlVQ?=
 =?utf-8?B?bnMwaEVBM2JIeFlyMktHbFNJckVHcHZseDVUSjhBSzk1VmIrOXdaeEJrRTk2?=
 =?utf-8?B?NERwZVd3Y2dCYllRVFgydVpVS2hzUkE3RDJTWVZXY2dpTUl0UEpVQnBLTG9v?=
 =?utf-8?B?cjZJSDdyQVdSb3pDYS9vTGVaUjk2K3JhL3I2eXJ5TUtiN1ozVHpIZ2F1Um1Y?=
 =?utf-8?B?UWVHL3NLZkRieWVRR0FzdzFyMUY1NWgvcHlBeFpSVWRwSmVxeW05TVdxLytW?=
 =?utf-8?B?L3RPRVFHUjM5Uk1WRmRpbFY2Um40VzhIOVVJVUNaMlRpbUdjQjlKcnJtNzBZ?=
 =?utf-8?B?VjNXRDZ5Z2Q3R3F2SlVqcTErRHp6ZGhYaVZ6cE41MGczaDdvVjJxQ2U0WTFv?=
 =?utf-8?Q?uZUU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b249ba9d-8df9-4301-e42b-08dd990ce50a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:44:42.0229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw758SZqDeWzT8Mtet4pXu9FlVe33nN35KcxZ7YNSLDFCkorurgLYZZijV7+R31n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A
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

On 5/21/25 22:29, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.

Looks good in general, but my question is if it wouldn't be better to export the higher level drm_exec component instead?

The drm_exec component implements the necessary loop if you want to lock multiple GEM objects at the same time. As well as makes sure that those GEM objects can't be released while working with them.

Regtards,
Christian.

> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/dma-resv.c         | 13 +++++++++++++
>  rust/helpers/helpers.c          |  1 +
>  3 files changed, 15 insertions(+)
>  create mode 100644 rust/helpers/dma-resv.c
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 31369b7b23884..409e9a595e051 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -18,6 +18,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/cpumask.h>
>  #include <linux/cred.h>
> +#include <linux/dma-resv.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-direction.h>
> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> new file mode 100644
> index 0000000000000..05501cb814513
> --- /dev/null
> +++ b/rust/helpers/dma-resv.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-resv.h>
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
> +{
> +	return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> +	dma_resv_unlock(obj);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 20a4ee59acd89..3ba1652899c2b 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -15,6 +15,7 @@
>  #include "cpumask.c"
>  #include "cred.c"
>  #include "device.c"
> +#include "dma-resv.c"
>  #include "drm.c"
>  #include "err.c"
>  #include "fs.c"

