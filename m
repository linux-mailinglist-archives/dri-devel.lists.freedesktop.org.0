Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ADA9C3FAE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A5E10E4AC;
	Mon, 11 Nov 2024 13:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vEyc1cF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D55F10E4AC;
 Mon, 11 Nov 2024 13:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2JqJjTeWkhLQvIThbxM3feA2J00Pvyk/xOzhCU6NWue9sBm2fJWQm/jP6DwYp1JWWt8Rnz2x+pLvRu1FF75cLCOthUXcVs02yvaCaIemzHmFTj0dIpnYqkMtyz4weQ6CEgQhohEoWZbisE5KuHzWggSMXEDoRBDGqvn/mpeWKHOjqrXmKKI3AFzx1eL4hkVnd+Y4Tpy7weKQ1iMrfc9HZ/dc4W2q/gSErLr+vtxYwB2aN43UB0kw/kf9gxJan702M/3CW/gs5+ouW9Ix6eShORrDCs6gcOywoFeea+KLi5hzVX4v3Tt5hvGhsETvd4qtYfhWeOD1PUBuAABl0vezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFN5CT6IwksGxxWTOhD//IArcDPRAqDrFpFKFAzKknw=;
 b=ZKTdBQHO8c1EwIEB5NNfeKaR7u7dmzpc9Ohfokp0a3vykz6XFD53D8nXWKqwHPApujGgGdR0X5McHSxQ4aH2IYrkb6jFRfKXagGslMdRD7oERPEQuCt7RP9VbLUyBhjgjR4hYv09AdnkakyKipBgGDu9iLBh12ismYJ+Z+BRqOtZwcEtlPgAZM9du9liYZMSJAmA1yOcAtEHtLwPTwwlMer8T9/wXS498Ef8zTsUQNWNuYXa5T71R7KyUafVFjcXIFpACCA74A6TExaXA0tXRc712Igkpra1lo1Ypl3G/CPonrjuBManJXyG/iFmolfwxZRL/uuOQ/Ra7OovKDGpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFN5CT6IwksGxxWTOhD//IArcDPRAqDrFpFKFAzKknw=;
 b=vEyc1cF8luzlsPOuS4bsiDobaqRwbUMib7hPzRUzETLFDW65CZnTxaZFHK6LPzpjK8hNQeFQ+9+xJLqmn33mIfK5A30D3yxguPIFLK6jKEqlS1ks1Tt88WVR4KSwQBFKUXIZyWhNWeIFT0KYn6zFgyRsf3RVfQ968aHhZbjR36w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 13:42:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 13:42:09 +0000
Message-ID: <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
Date: Mon, 11 Nov 2024 14:42:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
References: <20241109172942.482630-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8a2839-7d58-45e6-fa43-08dd0256a384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjVCMUdKSlk5L2NOVVo1YVFuU1Y2eFpEYW04T3R3QXM1dUxqaVRKWEhuZWtL?=
 =?utf-8?B?M3RJcFdXMVJNMk8rVWtUL1Y4SlhJOTNMcmdIVWJwTWJ5MmczU3p2SUUwU2Vh?=
 =?utf-8?B?SG5zbk8rNlo0aW1yeFBoMlNudENBM1ROekRDNXQ1K1BubG44NEp2Z2xLVVpy?=
 =?utf-8?B?OHQ0bitxRDZncW5hZlhBN1JxMCtTNzc5N2U5ak0wTDRjdlhNTlB6Nm4rUTMv?=
 =?utf-8?B?OHNMUkhZNjMvS2U0VkJFdkJEYkRzU1pQcG5zN2hUcmdhQUVpcE1VNVgxc2d1?=
 =?utf-8?B?anM1cHFrbWpDSE1yZ0R4end4elBrK21rb3B0dXNvTlRKK0FlV3hJNHRWeEdF?=
 =?utf-8?B?cDFNdGRkQ2pUVWt0WFVEc0t3VUNoM1dQVlJFaEc4N09JemsvTmRqbHFXUFpT?=
 =?utf-8?B?cWdCSXo1R0RFY2NSeDByNEFQcVVSOWNjeGx2MnZuRlRjQmFBSitKRWROK2I4?=
 =?utf-8?B?amFhTUpyRWtueFNJWkp2aGMzaDR3UzRFODZCNFA2V3FVWFMxblRmQ01NOTdv?=
 =?utf-8?B?YXFmc29yZ3QwNmxCNmtrZ1RTa2VJOFNUS0Z1Z0V0bjJWblQzcGU2OUlvelBy?=
 =?utf-8?B?d0dZbXhVNFhNVjJGR0ZGQkUycnNrSVFrN3QzYjZTTTQ5UldPVjRueUhFVTFF?=
 =?utf-8?B?NnJXL01nOE1kL0RmQm91d3lEcDRGcVZRdW5zdERWTDhTbkxGOVZxZ0d5US9Q?=
 =?utf-8?B?V2hFa2NoWTlTcmh6OUdWOGV5Q3Y0TW1naTVNSmdzNFgrMVlmTWc4aUY3SWV5?=
 =?utf-8?B?R0tLcDk1Y2p1U3BZMWd2U2xYTzU5dDd6Y093TW9tMDkrUmpldFp5aHE1UjVI?=
 =?utf-8?B?TExpZUJCak0xT29QbzZpWFlJa2hxZ29TQ0tLK1lJa1hrMTV5UkVlSTlDZG1O?=
 =?utf-8?B?TkJ1Z0ZpQ3ZNUmZJN3FMa01jY2dGUWh4Z25ZNDRGYnIveGZtdkttVmZ1ZVJB?=
 =?utf-8?B?QU9pangySG56R0JOLzJNdDZ3dURaUlVzb3BHZUtBQ0JLdmtwZ2dXc0lhZ3NI?=
 =?utf-8?B?UFUvTkdoeG91SGZaR0JnWkZkdkUyS3FidW9qUVZmOGxpdFJPK1lvWGhKTUl5?=
 =?utf-8?B?RlU0eXROYjQyZm5PQTIxbkpoSlBkaHhoelVXUUl3L1R0NndFTStWUXR5RkYy?=
 =?utf-8?B?d2R5VzM3YmFseGVvbkZFeThsak9wbWZzd0hkWHFmdmw2N293dEF2NC80NUlk?=
 =?utf-8?B?MzBjcFdwRy84SDFZbUQram5qeDZFZlhtQS9Xc1RhZU1FNjhDSlhwMWtYSFM5?=
 =?utf-8?B?ekkvK1ZRQWpGSTlvcTdxeXQxbzF4M0lheUNYR1NycVFYVFZNeWtFNUlDSnZF?=
 =?utf-8?B?Tm1MRjJ5ZlNSelpQNVVOVGY5bm5EV0ErWXZVelY1UVhmZ2JVblRTeFc0SG5E?=
 =?utf-8?B?enIwdjg2NU9pUlM0UkVURGE2UTEzbGRGTFBnbE55eWs4alp2c0x5NWk2b0pq?=
 =?utf-8?B?dWlLS1lWb0hobUxNM1FaV1QwTFltQVhoSFpBbW52Nm54VmVtMUd2dldSQU9K?=
 =?utf-8?B?YzZpZ2NuTGtSTVRNYTRSOGdBVEZhRitXUGNrTUdTbUpSalBPWk5OeFI2emRE?=
 =?utf-8?B?Z0hkRmROSkQwTzBZSXZmNjFhdmFrbGFzVUQ1RGl6U1dEOWNjWVRrY3hORDlV?=
 =?utf-8?B?MnVXb0ZuQWpQMzVyczV5ZjB2V29CTEdwRWkzOG5sK3FHMnFUZHhxczEwOEVQ?=
 =?utf-8?B?aisxaE1YRExFLzYxNlJYYjZSakNxOXpDNU5QZG1uVFFUd21BdjJjL2tRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0JTTitoaXVTSnNWWVVFTlYzMDFwam1RZUdnUE4rbzUzZHpGVU0yZ1RiTGVy?=
 =?utf-8?B?U292TkR6amltWkhVSzJZYVVROTJ1ajZXcE0yeFQxVDFWcXcyRzBsclROMFNI?=
 =?utf-8?B?YjRnYlhWZExwZXBHeldLclErbGRybW9hK082UmhjbnUyNWNidjhES3pmK2FE?=
 =?utf-8?B?K2xIRDZDQW9Ya3pPaEdqOTZPSmhOWDF6NkNSSzRWekZsTWVHSmRRbC9DYXFB?=
 =?utf-8?B?eTRGZk5jZ1o3c3dwaXNadHc4OVhHcENDSlUrNFFoNDdrL20vZjF2SU8wbERv?=
 =?utf-8?B?Zmc2bURmQVEvbW1PdnRhUlh0VklZRE1Ec1ZlQStuV2dYVGhpZ3A5M2lsdUJh?=
 =?utf-8?B?ZE80RHVma3ZhYmJnK0kyR1JvbXJwWUR6QTJVUVRGcDg3WmZwcEp6MkxhT3ly?=
 =?utf-8?B?SVJXN0NLdmdBTTFLRXNLcDJIUXFOVjNyRVMyZlA1UnBPWW15My9OVWJNbXVz?=
 =?utf-8?B?TjFIYmhadkU0dW9MVktGQ29iZ1lBNW5RZUFPVGQwTHl1SDRlZmNwbU5lMlVH?=
 =?utf-8?B?N2RIdTVQME5sVEdqVGZ5SHBaci9zR0d3SGlzOC9sWXhralhOT3RDaUJDMXlH?=
 =?utf-8?B?RWhPcmZtWGNDZzZnU2x2Y2NURVhWVW1CQVZpZ25hdnlZejNKUzluRDVwNE5t?=
 =?utf-8?B?cG9xbHFHMGlBOG1YdkRsRGdVQXZHQmxsMU5ZaElQSVV3dU83cVNuRE1wUDYy?=
 =?utf-8?B?THhRV2xKSldMMXVtSFpRdm4wMlFMUW9pUEJieHppZ2FRaU14RFdLRDcvZWdK?=
 =?utf-8?B?R0FLMEQ1VVBJb29IQ3Q1djRYenBPbFpyd3oxU1ZpVVlaTHpvVk9QMDFJQklG?=
 =?utf-8?B?d005ZUNkeEJVR2l0WTR0TGNOM2RvWm82LzRMb0x0OXZBbDh3QlNSVG1HK2xX?=
 =?utf-8?B?MFZNRmU5WjBaSU52Y0kzWEVpdWUzcE4rQThwZ3ZYdWZaM2lDMTZENnRTeXZQ?=
 =?utf-8?B?QmY3TTgzT3pobktzVlFmQTgwb1VjSzI5Tm5idmRnYmsxdTJsbGRiNjVMVm9i?=
 =?utf-8?B?TGZKeEVsVXA2ckZKellneDk4cEV6UkRqbHdGTmJvcnhxNFpEdFcyZjgyNGty?=
 =?utf-8?B?T1dsbVpDWkFBRGZXZ0FlTHlBSVhRUVVaR0hRTmVaN2N1QkRndTVNaGhOM3Nw?=
 =?utf-8?B?Z3lRY0o3Sjd6aDFySHAwMXYvRmpSMk1qeUxBU3F6dG9MekpZRFljUXZveE01?=
 =?utf-8?B?TkE2Zzc5ajh2UlpJRmMxL2JJTWlETE9ySE9mVXpYZmlheklKVmRpM01UeTdl?=
 =?utf-8?B?d2tucmZQaitmODBCMEhRZGxFQkViNEhDMzB2emEycFZWNUszaTQrRmRnaEVS?=
 =?utf-8?B?ODFvMVJieWFyMnZJT1FBSDJTQjdZdVZnSkMzVGhzQnk2R1psNG9yNElKSHFL?=
 =?utf-8?B?R3lScXN6ZTlwN1pDeU1aVURzam9xVmdxYkRMeGRLcUpBbFE5cVhpTGRqbHB0?=
 =?utf-8?B?NnVOcnVoM1lmUDdDc1poR2t1Y0hqaFFVRnJjVVBBakkyRUFQWFBucmViUklW?=
 =?utf-8?B?S0dmYjdjQm5PNnJBV0dFTVJnUXFIREtkSXgrTW9HMklqTllhUk5ZWWFhYTBj?=
 =?utf-8?B?TW00eWJpTGVuZjM1c1hoM2Yrd2VML094WHhIVnVVU3JUZW1wU251UjZMT29L?=
 =?utf-8?B?eEVaeks5K2s0UFdzNnZoZXBqQ0dWNjl3QVNIU2dvZ2RsZ1BhVWNNRzY3R3l5?=
 =?utf-8?B?UGEzcGt3MHA4RGcvYWhGd3NyY01kMnBDUm1DKzRNYllLWmJSQWlvbmV1YnRR?=
 =?utf-8?B?WG5zaUkwWkVtZ1lBYzdxeGlBWXp6OVFMRkFyUHE1M2FMcnVCNU0wNnFHalYy?=
 =?utf-8?B?WmF1cUFEY3YxcUJQbURDM2ZQenprRDM5YUI5ZTVzUDBEaG4ra3BlNm9QdWVp?=
 =?utf-8?B?cUU4akcxQk5waTA1a0JOU1Y0SnZ2cG9FcytVWjhhdjI4OWsxb2RoWjZaY3RW?=
 =?utf-8?B?NGZ4azRNYXBDRVZpdldQSVdGblBxUWF6NTZTb2dtUnNNMm16ak9pZGpIbGZW?=
 =?utf-8?B?Y3gyUk9yTlMzeGpqU0U4aGVuRGtWNFVTQVZFY3p6dEFHaWlmeDIrRkhoUFI0?=
 =?utf-8?B?Y1BoUGUycjlHNHB1M1pnRGd2WEVoOVJ1a0lsVjlZQncrQnNNaU1LSkdVN1Yz?=
 =?utf-8?Q?SaP4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8a2839-7d58-45e6-fa43-08dd0256a384
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:42:09.2759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP0qub3xVquqG4CAVFsQkGseGUowQqXD8bK+lHcRA1jVNa1RyAD/m132EllF39VF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675
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

Am 09.11.24 um 18:29 schrieb Matthew Brost:
> The motivation for this series comes from pending UMD submission work by
> AMD [1], ARM [3], and the Xe team, who are also beginning to look at
> this. Sima has suggested [4] some common driver preemptive fences and
> semantics, which we all agree on. This is the first attempt to implement
> them, based on Xe's existing long-running preemptive fences.
>
> The semantics are fairly simple: preemptive fences attached to a
> dma-resv must wait to enable signaling (and thus preempt device
> execution) until all fences in other slots have been signaled. These
> semantics are necessary to avoid deadlocks when preempting a device
> while a user submission is pending, and resuming device execution
> depends on the user submission completing. The semantics align with
> Christian's view [5], which I also arrived at independently (with a
> little help from Sima).

Ah! I was really wondering for a moment why you wanted to add a separate 
dma_resv usage for that. But I strongly think that this approach won't work.

The assumption that completion fences which depend on a preemption fence 
are always part of the same dma_resv object is most likely false in some 
cases.

At least for the AMD design what can easily happen is that we put a 
completion fence only into a drm_syncobj for explicit synchronization 
and then engines or different devices which still use kernel submissions 
depend on it. That can go boom really trivially.

What we do instead is to wait for the latest issued completion fence 
while holding a mutex to prevent creating new ones before stopping the 
threads and signaling the preemption fence.

That code could of course be made some driver independent component.

Regards,
Christian.

>
> Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
> embedded base preemptive fence class with driver operations, and updates
> to the scheduler to adhere to these semantics.
>
> The current Xe long-running preemptive fences have been converted to the
> new common code, and UMD submission is expected to follow (hopefully)
> shortly thereafter in a subsequent series.
>
> Not intended to be presented as the final solution, but rather to
> kickstart serious discussions on this topic.
>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/113675/
> [2] https://patchwork.freedesktop.org/series/114385/
> [3] https://patchwork.freedesktop.org/series/137924/
> [4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
> [5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853
>
> Matthew Brost (6):
>    dma-resv: Add DMA_RESV_USAGE_PREEMPT
>    drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
>    dma-fence: Add dma_fence_preempt base class
>    drm/sched: Teach scheduler about dma_fence_prempt type
>    drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
>    drm/xe: Use dma_fence_preempt base class
>
>   drivers/dma-buf/Makefile                    |   2 +-
>   drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
>   drivers/dma-buf/dma-resv.c                  |  43 ++++++---
>   drivers/dma-buf/st-dma-resv.c               |   2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
>   drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
>   drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
>   drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
>   drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
>   drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
>   drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
>   drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
>   drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
>   drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
>   drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
>   include/drm/gpu_scheduler.h                 |  15 +++
>   include/linux/dma-fence-preempt.h           |  54 +++++++++++
>   include/linux/dma-fence.h                   |   1 +
>   include/linux/dma-resv.h                    |  24 +++--
>   19 files changed, 326 insertions(+), 157 deletions(-)
>   create mode 100644 drivers/dma-buf/dma-fence-preempt.c
>   create mode 100644 include/linux/dma-fence-preempt.h
>

