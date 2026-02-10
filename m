Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCNpDLr5imlBPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:26:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D17118D9D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62FA10E51B;
	Tue, 10 Feb 2026 09:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dqkg8Gib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010069.outbound.protection.outlook.com
 [52.101.193.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1F010E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:26:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSzm+1lCGMaOLqIv9q7fZN1epgyxwCNdMCKOm0B0MG7W88NIoXsNaEK4WO4js6nif4ZYmxAwCWm8PDc7lZRmcoV/sil1fsnlq4fIn/bQJsYXwW3S5Ya00MYos6ESIardmTkECZ5Ofb1kvLSvFZkCSX03yS40HKhnwQ1KiG947xT/TWbmrijvOImolK0UQkBFTTjc2GN6Szz4PZ6JPsTpEWuwQufmB29XCjb2PLw5mx+gXtLeaQX0l/mHmraeaqURDfsn5E+5tM01lR4yk0uWtJU7tjVTeI/6R9f1tam6oQqYX9dPXVXuECuVod1Tb9FL6iEw+rT6b3bZGC5XQBIJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SEfy6liZBUx1BBitODSvg6KgozHvzMh28v3HBjvnMQ=;
 b=Vh6UPweZlIEWEwYhi/CnOmQq2xD5YKAzBVZfkB9bMYFMAv5JR22XOJ2Vbu+DGCgpPBSYfrO7eVXYHHsSBzWPdLRchD3P0MRW0sfSxW+uppT6/ugQXbskmgqhCZkuwqmcuVSf1xwSBGZptf7qSRVuFVr2jPzwIgvHYtzMTsb38VQxYCbpBMmcBNoP95Kh/jCFksyNJfu9gyA8pS7WAslfYmmVM61F+yxlHTAroKKbSpA07JN7QegNDJa4PWiYohKLxVqx+fF4/nTw1qnMBpBFNnn/jjnbC3CggZ+elZq0rvZZT4r5ADhKOi5IOvuDEZnNyqFkuIL9IaqZb0qvZ2zQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SEfy6liZBUx1BBitODSvg6KgozHvzMh28v3HBjvnMQ=;
 b=Dqkg8GiblysS9hm02N5SgxUpVh6lSzOaiE0cW8WR3+Cob/TyW5GWddu8KpXC9ZgwFw6bFOYm6nj/3l1KfyRGD65oH/J5J10jm7x4P2N/dyX5vY85Pc+l9F7DvXncWSPOXLUwbtjq4V1G3oyE1Va7g+RYPnAqmrrgsHK875soGjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7696.namprd12.prod.outlook.com (2603:10b6:8:100::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 09:26:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 09:26:10 +0000
Message-ID: <4d49ab26-3ee7-4409-aff6-c96ec1754e88@amd.com>
Date: Tue, 10 Feb 2026 10:26:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aYruaIxn8sMXVI0r@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f5005e-2e01-4e1d-5071-08de68866d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk4rRk9lTTZjSHpPV2VTQjN6OWhnSVFnMVE1T0JVWE8weTlpa28rQzhMZlp6?=
 =?utf-8?B?ZS9PUWhOODdmWVhPNTk2MWxwa2JmNDA4WGNrajFYK0NmZkl4MEg2MVFTanQy?=
 =?utf-8?B?YVZ6aFBsV3ZpOUswZTlaZUFpTDZTYnVhcWZNN1lLYVhyRkF3WDlDRnl3M3ov?=
 =?utf-8?B?OWdSNlBiL2JxSE9GRkJJblRVdkZ5V1FKVmJselpSb0xJYS9RZGl3NUsxazlF?=
 =?utf-8?B?V3NyTTdUV2llTEk3MGdOZ29KZStNTUdLbm5sR1dWOThhTC9iT0w2MmUwell2?=
 =?utf-8?B?aTRjVjU0dGhwbFE5aDdOMFBKVTEveTZkUkZ6dUpHNnUwbm1jeFA5WUpnNVJl?=
 =?utf-8?B?SmpvckVsbHl0Yy94elUxOUdOWVdLUFZMV3Eyd08wSFA4Tlcxa2lxeldkNWJs?=
 =?utf-8?B?MHppWkdqYkFQQW5tVUJoOXNHSnhoakhwYldoem41bEo0ZWdGaVZBYWhndyti?=
 =?utf-8?B?czhmbThRWHZ3SjhubWFHOEJaN1htSkhhZEVYWElUZGRDOVdNcXhlYzhreFl4?=
 =?utf-8?B?VkJvQ3lxSVp5czNOemxuUGNDeVQwTE1EQkpZMHd1VUhDOGl3bWdXQ2pyaFpj?=
 =?utf-8?B?Z1UzRGc1Zmx6dHFCa1ZYb2dCMy9EU3NsU2hBekhsU1dVejZORG5NaUo2Rm5a?=
 =?utf-8?B?UStmM1FHWThiYWJQRUlSVFFYMVp5VkFrRE9xZE8wNittbGtQcGo3aHdJMUZq?=
 =?utf-8?B?dDFqT01HcVUwOTFsSmpvTTJSaWFadTdLUXlsbWx5WFVHVHFiZHFzUjE4Skd1?=
 =?utf-8?B?SUlHdisybVZYTEhKSXhnTHRhRmxpcm5WT1BPbEtTUSswT2I4ZFowV3l3dTFm?=
 =?utf-8?B?aWFHWmExVDhTVXpEajRDOWp4NHdDUEdWcExjN3A0dXozMFJDblMrVnFTdENa?=
 =?utf-8?B?bTA1c3gwQUdwWUNJMHlKdWY5VXEzQllWNU1KQ1JZWWQxOE1XZFJ3eldKTU9P?=
 =?utf-8?B?SmhyZWFOM2lMWWJKTzJqNEFRMkUzdFVqWGphd2hValgveklMMk5UYmkwR1VK?=
 =?utf-8?B?eDVsTjE1emMwbGxGMHJPdVB2bndQSXlWZCtjZWRsZkY2WnNGMURFUTlqcm9T?=
 =?utf-8?B?ZVpMWXFYOXpJanUrblkvaDFVY2FQTlFxSDh2N0piTkd5ZElmczhyUWZnK05m?=
 =?utf-8?B?M1NJRHhXUS9FaFY4QU5ObFNPU0ZvM0I2eEVTS2dvSVBKNVlZemJtTGNFMVlR?=
 =?utf-8?B?NFl0emRPa3BwTkxqREt1TUdhOGNRUUpYbXY2alZjTjRWVlRrcFoxRE9wYUFl?=
 =?utf-8?B?L0xrVUIydHllYjJmYTZVUU9rK0s1TS9ZZUhoRm1NVGUvUjZaaGFhV3ZKT2lK?=
 =?utf-8?B?OUlsL2o0VGNvY3QvTVBMT2ZlWTRqOGw4MGUyTlNQZWlSNTlRWjR2MkRrSzZL?=
 =?utf-8?B?Y0NZUlFKSHNEVXJYMjNqVUQ2UUJwUy9ZUVVqVjZxeWVacDljbkJDTmNVUldW?=
 =?utf-8?B?MmFySVBiK21ZQjVETWlhem1sVHhKbXNDenJHYXRFaFZMU2kzMlVDNTJ6b2Vn?=
 =?utf-8?B?YXF4NWRNb0pabWVzYWhXczMvR29uQ0ZkemdVWGo1c0xta2FIZWdYc2hzZ2dO?=
 =?utf-8?B?cU5zdS8yR2lOS0ViaHhHTHp1czVkU3hrUmJKMituV1k4b2doUUJrL3Nhcm5w?=
 =?utf-8?B?ZU5XbFhJZVo3OVpuSGEyd0NGZ3puQnZ5cHYvOHNTN1p4QzZJcTNXcVB2RGg1?=
 =?utf-8?B?enBHaXR3d0R3Y3JEa0grdkh5SkEyc3JUdFBRY3F6TTNOeVhveGRBRnNNWEJi?=
 =?utf-8?B?MTFxT2tZYXh3UUN5QS8vSzI3bUI1QUJXY2JLdHYvKzdSMGJpR1dTaE5QU0lQ?=
 =?utf-8?B?WGV3c0FvclA4TDc1N2RQbUlMUjFHWGhhV3ZDL3pSQ3hiZ3E5Vi9KRVB0S0RC?=
 =?utf-8?B?UHh3MWN0MElYM21EL1FXMkxPTmk0bmt0OURPclpkalA0dTNCWGZwVEZsVVhz?=
 =?utf-8?B?OTlPUXpQWXRmZGVZd0pOYVFaeGhPRGxPdE1vQi9qZHVXSU9hMElFMCtFSXU3?=
 =?utf-8?B?MDFxcDZpbnArcUJpS2h6N2RRSThFUGgyRURMNjNHTjlsM2dEaTFSSlBKWVlQ?=
 =?utf-8?B?RnRGc0N0QURYRk5ZdFpDMFdhMDJjdHhsVVhVb05KaVJpUkVVakJXdnROek1O?=
 =?utf-8?Q?3jgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXNzdndVTHpmZENCekRTOTFSaElmMVZJN29kSGMyTmQ4VWljQm5XQXZmbDRu?=
 =?utf-8?B?OTdKMkFMdUl0UlpQMlZMNjhSLzloTFBXNFpmMnY3Zm13b3RrOUFuQzVLQ2li?=
 =?utf-8?B?YXRkeUpYRWx3Zld5Ykd3WVJ5M09CZWpqNTJzYWxDU0UxSkUxc0xSM0pOV2d0?=
 =?utf-8?B?dDlBYWFXUTM3VFlyeHpXS05JbTVNeUMyZjdoWjIxMnB4QnNEOUVVZmhkTUdl?=
 =?utf-8?B?a3YwZ3BEUkRYSklINWFCenQ1MGcySGhiS0NqYnUrVzBzcUNiTUtZU1Q5RGVD?=
 =?utf-8?B?Z1dCejJGTWlyT2orUlhJU1Q1dm05MGVuaXBUK1F6ZVdocEFvdFA1ZE85dkx5?=
 =?utf-8?B?ME9INWpwSEx0VGo4RG8wbFI1SEVxUEN1R3p5Wi8rR0xadkg3SHoyS2lTY1R6?=
 =?utf-8?B?QlZsTTlCMUY0V2VJV0tJYndBWkRzMW1SM0FxN1ZFVVYrcHFCYnphakxTNnVs?=
 =?utf-8?B?LzByR2taYWc5MCs5T2VtY1V3T0cySFVaVGpFSkx6SzVIUDhwVFhPNjFSY0k4?=
 =?utf-8?B?Vm90VSt0UURnMTNrbGJwZ20wZXI0U0Y5QWpGcHVjVWNlZFE4eSsvcUtLb1RR?=
 =?utf-8?B?clIvd3MyN0p3RnAwbkZlVlpzMkxsMDRsYzZVQytaZTFubmo4N05sK0JvUXZk?=
 =?utf-8?B?eUZodnc3MmZGWFo2RDN6VWdvVjdWNzNEdzBTTFI0cmZIU0ZvMGpOeWZKR3B1?=
 =?utf-8?B?azhPMXFGUlJkMWIyS2U0L3IxTGJqR2FCR2JXWWZCZmxERFBGNnNMZUMva1BK?=
 =?utf-8?B?S0pkeGdtVHVRSjlTMnRENEtHRGEvSWxSRWxwTUZTbWdlcTIvVlhYaEt4UFJS?=
 =?utf-8?B?dmYzSTN2VnhsTGhSZksrSVN1VCtHd25TZXNrZ2k4OEt1T1RycjlUSkVBSHJK?=
 =?utf-8?B?T2tybGNuRElydkZCL0tSSG9LWXQ2ZnZNQnh3MkxXUHdXR2ZRa05uRE9yS2R5?=
 =?utf-8?B?R2NBWGRxZTVsTEpJQmVjQ1FvVCtWQVJvdXpVRDl4U3YrTTFUeGY4RGdWY3BV?=
 =?utf-8?B?U1ltUlZYMGJEcDlQZWh0dlZSR2pFZzhsSUF1OEMxWThIcWhaaUpTb3Y0STBy?=
 =?utf-8?B?V0RSRkJyODhlS3ZJTzZNR1pTWkVKVlp1aFBiZ3lsUXZyNTU1QjJ4S1JRTzBD?=
 =?utf-8?B?Vzd4UUdSMXFJckxJMVZ0ZHQ1Tm51Skl6WE83ZU52bnE2TUt5OVgyajJwd2pv?=
 =?utf-8?B?dVBSamRscGs0SEJNMEY5SVdKR2xmVjJONXpIK0JjN0pIOWN2R3N0RW41Vmdo?=
 =?utf-8?B?SDVPMFRTV3dTMFoyUytOOEw0c2ppdDc5NDBQY3pJRVJLUE1nazV0WkNqSXB6?=
 =?utf-8?B?Q1gzME9wT0ZkZGhIb2o4NDhqRCtndmp1Z3hobGJ4YnQvTVN2ODRMd1FHVjVu?=
 =?utf-8?B?RlZZdHNQa3BTRWdtTTVKcEdYaFRQT01iT2pObEh4RThPYm9IVWtGRmI3aDBP?=
 =?utf-8?B?aktzMlY5OThUZk5MWFVDN0t5dHVFQUdnU3JUVHptN0Vuc000SlRCdDAwNTZ4?=
 =?utf-8?B?S0ppTUZJazMveERiUnpvaFloVWVVdmgwb01hS1BPMWFiV2ZwSVBTbEdqZlZF?=
 =?utf-8?B?NkVjOWphanNaNWRjaEcvQ3crNTZqb3pobVhIUTRPeER5TUs3TVpDM0Q2NDda?=
 =?utf-8?B?WUg2V3hqM1huWHg1MVo1dS9WaXFrTytxejZDOEFxa2hzamRJT1NqMDM3TXlS?=
 =?utf-8?B?blJxL1RCbFNvOTcxRDVUSnQ3QkwvSVpJYndRdFZ2eVBJRVFWNkV0dTFCUTFB?=
 =?utf-8?B?QVdnZjBYYko3OERFRzI1YzlCZXlIcXdGNlpSbzN3SkswbVlaN0NCVDlDYXVn?=
 =?utf-8?B?MWNWQm9MdTRyMXdrVzZ2TnAvNkkwWmZFU3hadE05REhDc09HMi9SWHJtUW43?=
 =?utf-8?B?OE9vL0NSYTk3VDQxcHBHNVJ0ZUpNZlRPQmorNEZLSHZMQUZQYUlhMjluT1du?=
 =?utf-8?B?QllSdHZoOUlPTmgyZ0tNNUhpK0tTU2p3d2FacGwzdmExU1VMQzNHOTRBanFh?=
 =?utf-8?B?OEY0MnB0cW5LRDJpaUxtdG9GUStZZHNkdE5KczVqTWZFT012YmlwU25qa05v?=
 =?utf-8?B?VStpRXpnS3lSY0JFM0JBckhsaTBtcVhPRloyYjl3aGc1dmZDTCtEakNjSklw?=
 =?utf-8?B?TGJFODVPZDhIM0s5bUxaNkNJbjZrNkRyV3RCTys1bjdUQ2RxVTdTanFEc2Zu?=
 =?utf-8?B?RW9oSXJVVkRoNVV6c3ZoaitNdmdnbFVhWDZ1VFNpS2xZM1k5MWMwQThjNXVu?=
 =?utf-8?B?S1RiV3A1YUYyUkJrbmkrRUk0MEwwcUo5S3lHakFvVHhSNloyRnVQQ05xU2hW?=
 =?utf-8?Q?NB7UR7fD/CDI5ArbNp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f5005e-2e01-4e1d-5071-08de68866d03
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:26:10.0059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJCcKJo0/p6S5qNJ3sFzd+CcGHexNBdZmPDOK8ktTeavOJ+Fky/7IH4LC5Cf6qs3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7696
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 86D17118D9D
X-Rspamd-Action: no action

On 2/10/26 09:38, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian König wrote:
>> On 2/9/26 15:58, Boris Brezillon wrote:
>>> On Mon, 09 Feb 2026 09:19:46 +0100
>>> Philipp Stanner <phasta@mailbox.org> wrote:
>>>
>>>> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
>>>>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:  
>>>>>> On Tue,  3 Feb 2026 09:14:01 +0100
>>>>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>>>> Unfortunately, I don't know how to translate that in rust, but we
>>>>>> need a way to check if any path code path does a DmaFence.signal(),
>>>>>> go back to the entry point (for a WorkItem, that would be
>>>>>> WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
>>>>>> Not only that, but we need to know all the deps that make it so
>>>>>> this path can be called (if I take the WorkItem example, that would
>>>>>> be the path that leads to the WorkItem being scheduled).  
>>>>>
>>>>> I think we need a guard object for this that is not Send, just like for any
>>>>> other lock.
>>>>>
>>>>> Internally, those markers rely on lockdep, i.e. they just acquire and release a
>>>>> "fake" lock.  
>>>>
>>>> The guard object would be created through fence.begin_signalling(), wouldn't it?
>>>
>>> It shouldn't be a (&self)-method, because at the start of a DMA
>>> signaling path, you don't necessarily know which fence you're going to
>>> signal (you might actually signal several of them).
>>>
>>>> And when it drops you call dma_fence_end_signalling()?
>>>
>>> Yep, dma_fence_end_signalling() should be called when the guard is
>>> dropped.
>>>
>>>>
>>>> How would that ensure that the driver actually marks the signalling region correctly?
>>>
>>> Nothing, and that's a problem we have in C: you have no way of telling
>>> which code section is going to be a DMA-signaling path. I can't think
>>> of any way to make that safer in rust, unfortunately. The best I can
>>> think of would be to
>>>
>>> - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
>>>   constraints) that's designed for DMA-fence signaling, and that takes
>>>   the DmaSignaling guard around the ::run() call.
>>> - We would then need to ensure that any code path scheduling this work
>>>   item is also in a DMA-signaling path by taking a ref to the
>>>   DmaSignalingGuard. This of course doesn't guarantee that the section
>>>   is wide enough to prevent any non-authorized operations in any path
>>>   leading to this WorkItem scheduling, but it would at least force the
>>>   caller to consider the problem.
>>
>> On the C side I have a patch set which does something very similar.
>>
>> It's basically a WARN_ON_ONCE() which triggers as soon as you try to
>> signal a DMA fence from an IOCTL, or more specific process context.
>>
>> Signaling a DMA fence from interrupt context, a work item or kernel
>> thread is still allowed, there is just the hole that you can schedule
>> a work item from process context as well.
>>
>> The major problem with that patch set is that we have tons of very
>> hacky signaling paths in drivers already because we initially didn't
>> knew how much trouble getting this wrong causes.
>>
>> I'm strongly in favor of getting this right for the rust side from the
>> beginning and enforcing strict rules for every code trying to
>> implement a DMA fence.
> 
> Hmm. Could you say a bit more about what the rules are? I just re-read
> the comments in dma-fence.c, but I have some questions.

Oh that is tricky, we have tried to explain and document that numerous times.

For a good start see that here: https://kernel.org/doc/html/v5.9/driver-api/dma-buf.html#indefinite-dma-fences

There was also a really good talk on LPC 2021 from Faith on that topic.

Unfortunately the understanding usually only comes when things start to fail at the customer and people start to realize that their design approach doesn't work and by then it's already UAPI....

> First, how does the signalling annotation work when the signalling path
> crosses thread boundaries?

It doesn't. The annotation done by Sima is using lockdep in a rather unusual way and we would need to extend lockdep a bit for that.

> For example, let's say I call an ioctl to
> perform an async VM_BIND, then the dma fence signalling critical path
> starts in the ioctl, but then it moves into a workqueue and finishes
> there, right?

Perfectly correct, yes.

And in all those code paths you can't allocate memory, nor take locks under which memory is allocated or more generally waited in any way for the fence to signal.

> Second, it looks like we have the same challenge as with irq locks where
> you must properly nest dma_fence_begin_signalling() regions, and can't
> e.g. do this:
> 
> c1 = dma_fence_begin_signalling()
> c2 = dma_fence_begin_signalling()
> dma_fence_end_signalling(c1)
> dma_fence_end_signalling(c2)

Oh, good point as well! Lockdep will indeed start to scream here while that is perfectly valid.

Regards,
Christian.

> 
> Alice

