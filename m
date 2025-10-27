Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED6C0D68C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053DA10E454;
	Mon, 27 Oct 2025 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cvnz+lbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2B010E454
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7ymwHihQj5LHyYcPmA4oOgAVWqMw6bz3XdLAt9uDhbhY6bk+rB1EOZsKryCpKE09x97Bi/TrT8iOOJDWDXk73Et01gJiukRL2lYjj2yqd+Ek1QruBgc7eEz5C4kFq/hMTxM7B4ffllMEGF9yqO4KTlS7tmEsrcYimeABSgyf+9fTfww6iLPaU570E6UyXkWwCS0gUnKoJBOrxcRZYiUSYQau3sVxL1WpFA7S8+EqMqFiA3HbCr8+fiM5zAPetZfAOjFEc8SpN2uzZ54nQtgSVJwZjg8jTtwYF1i5YxqYXB9vqeNwDNYWGc6p/H3slJH1feu79Tnl0NFYkeVdrPckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBs/l5l606+H1bSQpmh8tseVZlkb7Cav1y6/HQF2BKM=;
 b=uezvAB1AfN46RMh4wMFJBC2QdyvN/D8H0aCIhH6zYXsjYuzzwFLBEZFjcYSEOMFH3CIieN0CMyPGeH1MoJSlkNhbe0mHq0YvPAA81wSi7hkSKiqp4cxzGj97HAxHR3u96RKKGcGCQXSVJH+dgK0wo5AEIwTXw1L7CDIxbTcEe1qDdlUA4rHU9v33JSgucd1qadJb1IqYWX2GgosLlpRK+ryOagrAASYx2AhvDGe+/81uySjy++uot26jspZtEmj4kCIV6ctcawa44xStLVFFyZEdOI/GtJv2tj//J6jKq3zEWn2Gh8W3hSJZWS1DlaHzDHXnnk6K4Vk+TK13Fx5sPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBs/l5l606+H1bSQpmh8tseVZlkb7Cav1y6/HQF2BKM=;
 b=cvnz+lbsVOHCym2szh81rvEO2IVGoKvvZyTitl/Q8hso9/d2ewZkLuLE/kS4qI4Q69Uwk9hm6jurLGFgViF0ZE0Qd0jYqUalHUWi7PB2r9typt4G96xBgIVtgu7gb4cUQmQShEqs7tWef55znkwXyqDCQ9kmszMeVB5NLupl/zebY3YEoaTxpaLQgbrUOtqdXVvpYaGYAzlvN0sOq55M3aVLCiRnubfgF1OslRt7afgW84y4PkbkkMT9/plJ0zbIS95+vA/y8Dkx7anXp9ekVjjXk39W67CP+EoWQTNNOMnI8gCrYFsoXyxsWhOPkTqxmLScfnQRMClWWyXEYPvk/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:09:06 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:09:06 +0000
Date: Mon, 27 Oct 2025 09:09:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251027120904.GA896317@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251022125012.GB244727@nvidia.com>
 <3db524e7-b6ce-4652-8420-fdb4639ac73a@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3db524e7-b6ce-4652-8420-fdb4639ac73a@linux.alibaba.com>
X-ClientProxiedBy: MN2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:208:234::19) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1887583c-8be2-4b71-b55b-08de1551a02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnFyU21zdDFCMmcrOFlaejlnM1RuaElhWVpDOXcveW1ER0VCU1drMVBEc0hO?=
 =?utf-8?B?ZmNZeWM1N0VpWjF4ZmR1NzM3dHFDWnNYNUl4emRzTDFtcUhtYjlaWEJILzRo?=
 =?utf-8?B?Rk1nOWk2S1JYT09XRWphL2pVL2lGRi9pL1dYeU1uODhnTVJ1Qi8yT1BaZEhr?=
 =?utf-8?B?ZzNLWHg4ekdmRnFiY2c4UkFtcnRuV20yQnl6SkVnekJmamlxU0xQZjl6T2Jv?=
 =?utf-8?B?akF2UklYbHdoN01BcnIyNk9VUFk0R1pJSTFwbVNqdFZFcUpJR2FPZ0ZnM0lV?=
 =?utf-8?B?UEZBaXdNbXN5VmhkMk9QTXRaaERUeVhBQWx2UjdOVSthZnBITksyaU03ZFY2?=
 =?utf-8?B?bWw4Q1NwRFV1WXY0ZzlMbnA3ODBPamk3NVNZZUN5TlNJVnR0WWlIZlJtM1hW?=
 =?utf-8?B?OFp6dHZQOVNkbDJibFdjWk43Z3Y3L0hyMitUWW1FUkNHdElLZ2JoQjd1QTVo?=
 =?utf-8?B?cFlNb2w3MkxqdERaaUFiRXU4TWowWlljR0lLblMraEFuelpmZlFHa04yd2Vk?=
 =?utf-8?B?VUxHK2puUml4bTg1eWtXMi8xbG92anp4LytkdVQ0Tk0zS3VpbU9vZEdheGlp?=
 =?utf-8?B?TzRmYmRlYko3TXJFMGUxbDF6Q1h2c2pPNzNjcm5SK3Jpb1RaK2NsckpIS2Rx?=
 =?utf-8?B?K0hDWGI5WHpka0lDQmtnaEpvZGpUL3FiU1RGeHhsYjlISFc0eFcxNkR0bUN3?=
 =?utf-8?B?SVFnUjFhQWZQV2p4MUV4K29JdUhSR2x4MEFIY0R3VFo0RTdSMEJPeUhSNDZt?=
 =?utf-8?B?U1p5SWVJaG03NExvZEU3YWZHeGlFK21YLyswdkRZVU9ZTmhMVk15cURUZk56?=
 =?utf-8?B?WjF4R0ZJZjBWWllNTXhWd0NRSEN2SUIxeWxlUjcwWmFIU2o1bzIwbmZRb1FK?=
 =?utf-8?B?Q3d1Um1lYllBTHE3U3hhWUViL3c1c0hMVTNyNXp2UWJtbUpCdFpXNjVZYVFN?=
 =?utf-8?B?aEdTQ3BuRHIrd3FzVWNaenhTdHlOSnhEWmVhdU5MMGVhUEI1ZlhSM2l4Z3FO?=
 =?utf-8?B?eklqZnZnaVM2cWxIQllnZFZ5MEpXTmlDZEMxK1VRYUcwaU56VGhtbURBTjhE?=
 =?utf-8?B?TTIrVGhNaUhCRVB1TVlqRTQvZE1tekllWjNnRXkrbG54Vm1ZN29iL3JYY293?=
 =?utf-8?B?K0pZbWN2UzhuYkhXUUF2SVVLTTN2cG1tcUo0ZkVUSm5Qc1A1Yk5Kak5Ed3hV?=
 =?utf-8?B?c0RvdTFZOG1DRldGcVEycXlianU2ci9GTnZUQ2NlalQya2p5bXNTQjNMUndk?=
 =?utf-8?B?S3JSVHFJenlRdDhmVGRCd3VVVFJDMzU3aDdvOEQ1bU9KY2sxaE5rQk9MZFRS?=
 =?utf-8?B?Rlhab1FiTjdwWXpMcXhqYzhpb0lzUGtRS096R2tyazZwVDVGVGxrZUVRazNv?=
 =?utf-8?B?Q3Y5VVNWQVBLcGFVOGovZE5mR2Q5MkpDSDZlUmptc2p0MXN4THIwT3JkNlNP?=
 =?utf-8?B?amhNeEUyak1jR0ZrSURXNDhEaWU5TXVFM2pKaHpwOCtWK1B6MkhvRW01OEU2?=
 =?utf-8?B?eDlyWnJFMXBFZWh1MjhiSCs1dHFoZTZQeFVmeWd3N29ZVE9IY0FlTk45d3p3?=
 =?utf-8?B?Vm4wUmZiMnVhelBxY1RXdTR3VTluWmIwWkl3d0hJQVFUZld2eGpPaWVuNjhN?=
 =?utf-8?B?a2VyUHJyYXR1Tnp1ZW10cGY3RmFIQUZPU1JKSHpCaUZlVUwyR2RjRzdoZGNx?=
 =?utf-8?B?anE2bnQvV2UvcjE2dU1veEVmOE1CdnlENFR0Smg1MHMwb0pMa1E3QmJ3RmFl?=
 =?utf-8?B?QVBnbnVua2VVeWoyQkNxd25GcWRGbFFxbVNtTHd5Vnd5ZmVZWjFxUEJ0akk0?=
 =?utf-8?B?OWFJcEdGc0w3cWhsTDRIckVLUy9EaUQ1ODZwbC9jZ3hTVVhPc0R0QjVZMW0z?=
 =?utf-8?B?M1ZzL2RyRGFIVlpwT1V5cjAzaFdGcTFaYUVmdlZQYXp6Szd3YU05K1plUmh3?=
 =?utf-8?Q?rmpXPkGIkb86/8DQQyJxuSSbGJOoSkXH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXRNM3VjVGpMRTVGUFl6QU9ENzlORFllVWlmK2ZHVWhFM3pGUEJtM25OVTNU?=
 =?utf-8?B?RkMvdFZ2WExkQ2RkY2k1STVyYktsL1haMzZJYjJiWDc2Rzd6YzBIQlR5UXdB?=
 =?utf-8?B?ZmFZVzMwbklOd0ltY1RrN3VQRUJNREtiS01ZazlyNjAzaDhNNDZmK0w5bm83?=
 =?utf-8?B?MmowckJ6VTJ5VEl4a3l6OWQ1Y1hzVUFJUUgxRGI2amZoSDVobzAwQmUxcGc4?=
 =?utf-8?B?SEwrUXRsTUZmRlhSOFcya0hZdFZNdkNFVkw1VlFwcE00VXhPOE42ZTI1YnBj?=
 =?utf-8?B?L0xweXhiQXNJQXNTeFc1QlJvZnB6OHo4RmRlNnl1ZzJWNFdVWU1WTDRER0xj?=
 =?utf-8?B?aHg5b1gxL0VOQlRKNnpidnVwbWtrS1Q5bEZsUjRQK01rYkpJN1RiZjAvNFVq?=
 =?utf-8?B?R3hrVFhJUjlxR2V1cGZPWk5iN2NrY0FEcFdrZE9QOWpxcXVaU0E4cTJueUx1?=
 =?utf-8?B?K1BSRmlYa3RtcjBoMDFzSnpnTUZhbDFtdEszVzdQMUhSM0pvQVM0bStjYmFr?=
 =?utf-8?B?cFYyNVk4eXBpWFlpZFRyT0pMMzBqOW0zSjVVMzUyMS9iZUdGd3hCT0c0bEZs?=
 =?utf-8?B?L3ZFeWNTV1V6UEZ1emJta0hWM2pBRDJNUlh3T1VnaGcvTTZIcFkvK0V3MzRz?=
 =?utf-8?B?eFN4ZXdZejZJZVIvZUJKeko5V2t6WlhsT3FDTkcwOXJ3aU1uakc1NkVTNTdy?=
 =?utf-8?B?eitaTGIvYVlHVnFKc2pWdjlQNGIveTVieGMvZ2l2TnYrbkVhcGdZRVBWU0o0?=
 =?utf-8?B?Z2RVQmhFd0JaY1VSbnc1dmNhaTVZTEFNcU5VdWpFRG54dmFkTllIc21oRldO?=
 =?utf-8?B?akx3ekEzcW1EZ1hwcmpUNHBzMGNMVVNhd2FqVHVzVWdiZUdDS0QvTDk1QjdQ?=
 =?utf-8?B?WmtHWk9kcm0wN2VtUTA0VTNaL2Y0a1ZHeUZHL0FVUmNLRWhTYlpUZGZZOWk2?=
 =?utf-8?B?MDlrd1ZuNTQyS0VGYThhUEYvOGtkR1hYQkk5Q0liUHYxbDZYckw4LzQvVk1W?=
 =?utf-8?B?RXZrK3FQR3J2SEZ0WHF6Zkx1eWtwekZaQzRkTUtmZGdadlBTdWJzRlpEQ29j?=
 =?utf-8?B?bDQ2dnQ5eENBNGl4am15cExGeERqSi91ZVUzWnFLbUh3cXlWYVBNVDczN21B?=
 =?utf-8?B?ZkxCSTFZODh2eDJ3VUE5Q2FhdWdUdzVDNVpqVERFQTYxZVA4RWs1MkErYzJQ?=
 =?utf-8?B?Mm90VERhN1JiekNqMmFQRy9sdHYxcE1lTHpuR0U0dkVMY29LSkVzdEljdkc2?=
 =?utf-8?B?VjFrK2tWcE9saFVMbDdJUS80VTAxN2VBUWt2K0lRaW52WGFKejBELzdRazFR?=
 =?utf-8?B?bm5TUHN4Q0R0WFQzTnBXaDFVaCtnSFdWY1RidFpMQ1ZwQTFGcmlhWE1QUU15?=
 =?utf-8?B?R01zT3VWeU94K2lVcGhSYmtPdW1nd0lOYjNsQzlTVENLbmJVN1IyVXQ4MElP?=
 =?utf-8?B?ckxNWTdUTE9FYlNxZ1VyQW0yZkpXMVZmMTNjcGU0MUNCS0t3NStkOCtzL3Qw?=
 =?utf-8?B?cVlDMkRhN2JBeVlmNFVzZU9NRWEraEhSak5GYTloS1VaY0wyZTJjM3pNWFJo?=
 =?utf-8?B?UmkvOVU0TUZzU0RVWTNKNDIxZk9YaGk1Q2s4UXUzQ1ZkRzJ3Tlpid2N4aC81?=
 =?utf-8?B?bk9oSFFHaVZ3dnFoUU5QcE5aTEtTbVp0Ni9iTGVDMFF3eEJITEV4TlhDRDB2?=
 =?utf-8?B?ZUdITS9JVU5wZ0NabmZsR1F1RGd2OE1Yem5xYVFzSExEblNiNTRMeVRGV0pN?=
 =?utf-8?B?RUZUNGM0SHZiRUE0aXdzNm5wbENzNGpmMVA0MThxWW96K25kUitNOUROa0JY?=
 =?utf-8?B?YkRDbEVqZjcvREZUWUlnZjZwRG82UGZaTlpMV2V5MUZmeVpsZVJzNVdqTlBM?=
 =?utf-8?B?S0NHaXFrL0dVblZPRldtMm5OODQxL3lkNVRkaDZhaklaS3NydVcvY1J3b01n?=
 =?utf-8?B?MHp3WURUZ2tPNFlBSENhUGQzTE4rMi9oNkQ2TU16WC9pTy8xVlFFYVZwVVk3?=
 =?utf-8?B?Z0laaGRpbGFuVm5kbFpxWjdDa1BNOE1Sb3dDOEdTeENzUlRvcXF1Zk9KYlJR?=
 =?utf-8?B?clg4THJkWEFrUU5ZV0xrQVVYaTkzd0NvaFJ6SW5aTDJzV016S2t0KzlJeTdO?=
 =?utf-8?Q?jmNs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1887583c-8be2-4b71-b55b-08de1551a02c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:09:06.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jioCEvMD+vbYQxtsp3YSORIFv1o0aoA0FuNIuLXqKFHc2H0MoqEd0ROqePK9guQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
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

On Sun, Oct 26, 2025 at 03:55:04PM +0800, Shuai Xue wrote:
> 
> 
> 在 2025/10/22 20:50, Jason Gunthorpe 写道:
> > On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Add support for exporting PCI device MMIO regions through dma-buf,
> > > enabling safe sharing of non-struct page memory with controlled
> > > lifetime management. This allows RDMA and other subsystems to import
> > > dma-buf FDs and build them into memory regions for PCI P2P operations.
> > > 
> > > The implementation provides a revocable attachment mechanism using
> > > dma-buf move operations. MMIO regions are normally pinned as BARs
> > > don't change physical addresses, but access is revoked when the VFIO
> > > device is closed or a PCI reset is issued. This ensures kernel
> > > self-defense against potentially hostile userspace.
> > 
> > Let's enhance this:
> > 
> > Currently VFIO can take MMIO regions from the device's BAR and map
> > them into a PFNMAP VMA with special PTEs. This mapping type ensures
> > the memory cannot be used with things like pin_user_pages(), hmm, and
> > so on. In practice only the user process CPU and KVM can safely make
> > use of these VMA. When VFIO shuts down these VMAs are cleaned by
> > unmap_mapping_range() to prevent any UAF of the MMIO beyond driver
> > unbind.
> > 
> > However, VFIO type 1 has an insecure behavior where it uses
> > follow_pfnmap_*() to fish a MMIO PFN out of a VMA and program it back
> > into the IOMMU. This has a long history of enabling P2P DMA inside
> > VMs, but has serious lifetime problems by allowing a UAF of the MMIO
> > after the VFIO driver has been unbound.
> 
> Hi, Jason,
> 
> Can you elaborate on this more?
> 
> From my understanding of the VFIO type 1 implementation:
> 
> - When a device is opened through VFIO type 1, it increments the
>   device->refcount
> - During unbind, the driver waits for this refcount to drop to zero via
>   wait_for_completion(&device->comp)
> - This should prevent the unbind() from completing while the device is
>   still in use
> 
> Given this refcount mechanism, I do not figure out how the UAF can
> occur.

A second vfio device can be opened and then use follow_pfnmap_*() to
read the first vfio device's PTEs. There is no relationship betweent
the first and second VFIO devices, so once the first is unbound it
sails through the device->comp while the second device retains the PFN
in its type1 iommu_domain.

Jason
