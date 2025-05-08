Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B462AAF744
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54110E393;
	Thu,  8 May 2025 09:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mh1Pd/gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126810E393
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 09:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+WT+x8M3psS6wSkRRF9WpA0h/svoqKBedwHqIxp78rlUUhzqZumcTBur1eeK5nftXR2EQsh6+UvbcF3eBZa2/U/HiTenud+/ghhE2ayjceJ8E5hjBA3OUeC+enru7oDeoTk8SmrehUg3KNc0pPFkgLiDDHQYAGeXc5+SQ+dltw2p1+HJPkEIwkIPbELOxXto17WP5yP6r4S6QDzmDbXqTIWCEHk1az2gTVNC2JayO0KkgJ1UlLrNt0978IaqWSFy1UsTDwLEhpuToz+SN6CaPH7759oEmi3EuiA45ALiYUv1dVO9DkXQOYexVWZvM+9xbgLByBZ694uxYYrCJxJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K4e20q8Zr3hldvDDTb+5eDkcMLJZk3hPvBHVsxbrJY=;
 b=M/wOAr3AUa5Y8tiEIh3X3A/mKaoZy6f/Nft6apvOwY4/yvY9flH4Vip/9au+QSus448qi0r81c2jNbvXsPbdUvXJtrAme5v/A9UUXuKxbyzyIaDUtOGkw6sMK7Id8QRaX6N/0w/YlEkwQRipXruqlwFaiMYSU0o7gfU/UKeASZIvqn/QGKljwuKLuKumSL8QGwbdy6aXgtzkDNjDcg48Q2h73cQOL7w3sGr+tAhLlm5ZYOcFRURh1pDaGBNOr1lsDPUt9fjpM2dswe/ANdxvDzar+wmH4rQq1EUmKq5Swksh74zJZ5c0K8RqSggFoJqFGE0zbZnpZfGCB6L5SSye9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K4e20q8Zr3hldvDDTb+5eDkcMLJZk3hPvBHVsxbrJY=;
 b=mh1Pd/gjOs0GgOVsLQ46JuE2enckW78ViTbYVcJj0kRTalQrR6EFcy+k2k46FX6ij9xCrewc1TvT/EE3pyks7hZD4TjCVyfbDOdKnju9AIsP9JC7Kfkiij89KIyTnuNGCXXAPLX2DfqjIg/PZ2PLF5X7TisMH8DwJDKTBBN8sXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 09:57:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 09:57:53 +0000
Message-ID: <7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>
Date: Thu, 8 May 2025 11:57:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v3 2/3] udmabuf: use sgtable-based
 scatterlist wrappers
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
 <CGME20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0@eucas1p1.samsung.com>
 <20250507160913.2084079-3-m.szyprowski@samsung.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250507160913.2084079-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3df503-a9a4-40b9-d32f-08dd8e16ccd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUNtcllrTWJkcFdTd1ZOS3g1UEdqem1WaVRuQUl5dGJoMmlqb0VzeGhlalkv?=
 =?utf-8?B?WVdxYXhWOTdodnBnUEVKOTJDWklNV3RHbkx5MkM1RVcwWmFWSGo5dXlkWCti?=
 =?utf-8?B?bnVSUkJ0OHZ0d2FiNU5ueVlIeEJINHVEZTNyeXJDY3dKRDNkYUhhNDNIaFJX?=
 =?utf-8?B?enBzbC8zWTVWTEM5dURSaWpVb2tnbHBsdXpabTZLWTM4WU15MDJ4UGttR2FM?=
 =?utf-8?B?MnVrZDVuK0ltUGFFTzBXUHRxaW54Q3QwNlBmc0R4VlJURnZMM2UrQjU3bEhC?=
 =?utf-8?B?UjNNOHozY1BLRFV1L2pOSm45RElGOVhLdWlsckprOFZRSXBLazdZaTFOVm5V?=
 =?utf-8?B?TnRvV0pkazBkTGUwRWRud25Kb3MwNWlybVR6dTdscExKeE9TYXBiOE5rUCs1?=
 =?utf-8?B?Z0d5VHhjNGV0UTIreVFJUzdyWENxcEdJUHJVQ05GcmtKQlMyRDFEaFZTWWZH?=
 =?utf-8?B?dFFTOUxJbzJsT0J4eGJpa1RZK084YUZDeDMyMmJ5MnNsZ29EdXlLVTlXbEVj?=
 =?utf-8?B?RE52eDRnbzR2S2plSVFZWWhqZGJmM0V6U2hSZngrYTJ2alpLNkNrOWtmbks2?=
 =?utf-8?B?TGZnVjFmeUhGYldVQjJ3TzZJZmZzRFNuZHR5L2ZVRFpnc2QvendNZHk4RHI4?=
 =?utf-8?B?Q1NZVzR0djJTcm51RkI4Y3lTQ1NTZXZjbHRIeVJYeWtNQTJDdVpwOWNHdk1C?=
 =?utf-8?B?SiswbzlrSEN6aGtaeGNwQkJYYjA3Q2ZEdU5XMTB6Sk1wSFYyOTVqUTAwa0dl?=
 =?utf-8?B?VldIZTVXS1ZkYmJwV1Btc2d0UWU2T3oyWHoyRlJTN3JDYW0zN04xUHh2ZmdM?=
 =?utf-8?B?T0xqU2lSNlAyLzBNQ2x4KytiUjkvOGtyK09rQWhZUzFRZzduTFBPNytXMjZl?=
 =?utf-8?B?ZVh6WUJiTUhna3Z6TG0xOTRXQjB2K1JYa25kQ1gxQjlvdG01bWo2MlI5bjdP?=
 =?utf-8?B?b21SN05vRG5Mc05ZQ1ZxVnFaOWlITVRjd0ZleW5PMGpvc1BpYXQ5L29wUHRM?=
 =?utf-8?B?enFGa1pnMXYwWjlOK3VJSitiVlB3Z2svM3dPcEFpbTRINHMwYzJuZnF5TGEz?=
 =?utf-8?B?cThKY2Y3Y0pYb3pCTS9DT2RUSjFFMXFKT1NFMEdYRnEzTnJSS1VZNStGOVB3?=
 =?utf-8?B?dW9OS2JGVEl2bFNNenkwSkNYV3FhL0RVREtUVXY5ZkEyaDBtNmtrSFBJRmZZ?=
 =?utf-8?B?c3Q1ekpjTmRFYUtmNW9hN0oxV0IwczV5M0czK0doU0hTNEdiS3VUUXBwOW4z?=
 =?utf-8?B?ZDJEdGlVUlM0TjBqNUZieWp2MEFxNUFPR3BpUXlSWXpJS1JBYUtDY0tEeXhm?=
 =?utf-8?B?Q1JUVkcvUER3Z0dpQkNKN0NvQzRjRXNRak9ZM215U0tCeklqUlJLamVGZDIz?=
 =?utf-8?B?TjFyeWFnd2k3dU14UzArakliL1NlYk5CU3NqMWF2U3crSEJ6T2NwMDE4em5U?=
 =?utf-8?B?VTNNTVNPVnpOTC8vM3dtMEJvSGpubG9MZFRvYWdTNEJLa29ZOWpDeTBIT1pY?=
 =?utf-8?B?QXprS0FlRlZVNlc5Z0x1RmU2OHVMUTE5TU15dlV5MFVYNU80WEJMUVU0bnlq?=
 =?utf-8?B?b0pZYWdOS3E1YXV6NnBoTm1HN3FTSkh2ZHFvbW82Y1BRdnZHVE1hVkV6THVZ?=
 =?utf-8?B?Y0FlT2F3VDhtVDBFSlF1Q3FFejNsYTE4bDFkeEZzZEdkcUJXUFZQYXhMT0JB?=
 =?utf-8?B?UzRYM29jMGJCaSt4cGJHd056ZTI5UmQ3WURvS3IwbTRVcll6dVlkcks3Mmt1?=
 =?utf-8?B?V2duOGdIenhoZDl0MVlFaC92N29Rb2ZNbDJzcjl2SHFNMlNERVlObUpBNWhE?=
 =?utf-8?B?aHlBd3ZKcHpkTHU0T2hrZ0QrekZHaGpBR2tSaUhjMVk1L3AwazU5OUpMbTQx?=
 =?utf-8?B?ajJtMmYvVjVOTTNlb3h3c2hkRzMycjR1eEV1bWVZYVVYUjBCTTk4VjMxaDhW?=
 =?utf-8?Q?E6N+TRN74lA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFnU09ZdWNsdy9odnFpRzk1Z0pYR0NNZHNjSUZFNk80ZS9pYms4TW04b0Nu?=
 =?utf-8?B?SitkUmcrSktzMGVDcnRQWjNYRkdFNUlqTENMK1hBVjI3cisvc3ovNm1hcmJo?=
 =?utf-8?B?c21zTHRHWkNBRUZ3ZHNZNGMzdHNGc3dWVzVqT2w0cGRhclRkQUx2akdHLzZV?=
 =?utf-8?B?U2cvVjgyZkJQTlBaNnFVaTVJeDBXNjRGZ2FaQjRRT0xxS3dhNnN1Q0k3bEVY?=
 =?utf-8?B?V204OVhlZnZoeFF4S0VueUNlS3M4L3ZVVFVxaEFmVSt6bVZCTmFSbzdZQXgy?=
 =?utf-8?B?MU8yd0hjT2VnNlpWVk55NkRZOXZGK3NIMnVmVVhpM2h6NWdsRnk5Wm04OFlY?=
 =?utf-8?B?U3o4eFA2NlhoWFdhWU4wcG91T0l1ZU41YTQ0TzFSaU11QTVsNHpFenpaZU9C?=
 =?utf-8?B?NU9qVWFudDQwYkZtaStKWC9DdXlEYzkzRGlDY3pZZjNjaW5FdzJ1VnhoQU03?=
 =?utf-8?B?Z1FIaVZCaVVSN2FEZVV4cG9VK2FFYmxLRWxqQXowVm4rWTA0c09XcU0wc1dD?=
 =?utf-8?B?dEU0RDRXYVpldHovWVVCNHdOanZJZVBwTzNJWkI5eWJSZm0zS3hvL1FKTVNQ?=
 =?utf-8?B?T2RvY1ZmREo5akVpQ3Ryb2NubXFsOW9RbTRkd2RwaSs0N2J3dzZMaG1BT2Fa?=
 =?utf-8?B?Z3BQQ1YzMGJLK200Zk84TENsZng4WVRIblNqV2NUSEIwa0kreENYd21wb0ho?=
 =?utf-8?B?VVNVN2JPRm1ad255TVBmMXZMNWRaeElrTm02aUtpcW1LdUZVNFM4bUFEd25B?=
 =?utf-8?B?dWZkVkl5T1lnUzJEMlJXNnF2RHlHNDZLUGtzc2hKbGhtcktxZGZLc1RNQTFJ?=
 =?utf-8?B?OGl1Y3dTQ1lqTUJxMzkzbTN3amtWam1Vbm9EWENROWlRcjdmTFp0djhhVXU0?=
 =?utf-8?B?dFRGY2VScmFSYS9iTm5lRi81S1hTZ0xncHhSZjVnaGFpS2c0SVE3RjlJZlpK?=
 =?utf-8?B?cUJzS1RlVjJEUWNkQURLV1VIVExaUkZKUkpVY2tzUlo1S216QXByZWlxUndE?=
 =?utf-8?B?UUFJeHA2bWxSbENlb3piNXl6dmcrR0RPQzVxMVFuakkrdldtS0Q4VzIwV0FE?=
 =?utf-8?B?dXFEa0JaYW9uR1U4Y082UW1pd3Y1bVYvY0VjTXlVeHFnY3lBd2hrOHAvMzcv?=
 =?utf-8?B?VW4rRTBPS0FQN1d6OGFTMStCcjFJc1BnbzRXN0RNRmNDVmM3NUgxWmNYRk9x?=
 =?utf-8?B?WHRScHZRRWJnTFIyZWpRU1NnZWgwMVpva3dNT3NqSXI3NFV2N3FvOTYvdXho?=
 =?utf-8?B?aEZPZlozOUsvZHRRMHFqeXBXLzJMOHlmMmlGaVNwb1dXVk90RUFmQ3V6UFZT?=
 =?utf-8?B?elhKMVpYbS9kQlBpMXp4QzcvUHIwelhSeDBUQ2tvWWdCZTlOQzhEYmpmV21J?=
 =?utf-8?B?aDVqQVlUZzNmNk1aRENYa3BZTXJ2U1JoaW9RelhjN2c2MjM2WUNodkQ2VVNW?=
 =?utf-8?B?UkJGdFFxSnFZWldZakUwbVNob2NhRWVZZ25aNkFTcjV5MjNoTFkwSXMxNXZZ?=
 =?utf-8?B?UzUrdzA2dW5aTFBhWkRpTE8wY0ZvVmtnQmRzRlYvWnYvbUd4bWFiWklLaStQ?=
 =?utf-8?B?dXN6L2FsYS9NS0RvajB0SUdXNGcxRXczK290T1o5TE5UbC85TTliNldRQWlU?=
 =?utf-8?B?ZTI0L0hUdGg0TzdzTDlNMXFsWThLdkh2SExTL2ZXay9mT0w5R3dFS2JWTE1n?=
 =?utf-8?B?RXE5TVRyWnlzS05RVXM5VXFBc3JIVEpvbXpBbmRqU1gyY1d4ZEx5NnJpWVYr?=
 =?utf-8?B?UzhFWXVVcmlkRTdKS282UlRBVllrZ0VzU0JaRUpGNm9uTEJIYWt2dlBPUkJh?=
 =?utf-8?B?dnUxLytmZEhPNFdTOTVWNUZOODhLdkRGd21mZ3M3eUlvS1UyaThTMlA1N0h4?=
 =?utf-8?B?MUQ2OWN4M2dPQkYyM2NaSXU3ZVQwMm4wUEkvODNvK2MyL01sdmZhWW5KOFZy?=
 =?utf-8?B?YjJZalB0b2psMGowaFZiNDJBTzdkcXovMGRrVE1BdDdQRTBtL1p6MUx3cTFE?=
 =?utf-8?B?MU02Z1MrQ1pCOUdQLzdEWjA3ZFVOWXAwcGZYTW45TEZKL1N4TW5HV2p6cTVl?=
 =?utf-8?B?OEM0bWpiUWJkZC9KamRJeDY0S2xHblNWY2NYU2F3WHNsdEVXUW90eStWejNB?=
 =?utf-8?Q?YlIuASdzuDLUCY9fP4boBBqbg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3df503-a9a4-40b9-d32f-08dd8e16ccd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 09:57:53.6001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfM3T3Zux1c5LMTj/DIbHzFV41uscobxUJsduG6goYA6F5lGSBWagqaO99Alf0cB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174
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

On 5/7/25 18:09, Marek Szyprowski wrote:
> Use common wrappers operating directly on the struct sg_table objects to
> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
> functions have to be called with the number of elements originally passed
> to dma_map_sg_*() function, not the one returned in sgtable's nents.
> 
> Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
> CC: stable@vger.kernel.org
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push this one to drm-misc-fixes for upstreaming?

Regards,
Christian.

> ---
>  drivers/dma-buf/udmabuf.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 7eee3eb47a8e..c9d0c68d2fcb 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -264,8 +264,7 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
>  			ubuf->sg = NULL;
>  		}
>  	} else {
> -		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
> -				    direction);
> +		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
>  	}
>  
>  	return ret;
> @@ -280,7 +279,7 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>  	if (!ubuf->sg)
>  		return -EINVAL;
>  
> -	dma_sync_sg_for_device(dev, ubuf->sg->sgl, ubuf->sg->nents, direction);
> +	dma_sync_sgtable_for_device(dev, ubuf->sg, direction);
>  	return 0;
>  }
>  

