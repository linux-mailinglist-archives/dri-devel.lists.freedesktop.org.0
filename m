Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD551A1260B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 15:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224AF10E6F4;
	Wed, 15 Jan 2025 14:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h3ma+mUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AB10E6F4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNJifmNSJdVMSKd4EuvtlFmXgw90TRYpkaFW3kUHVqLDZgmMPpqFSuwVkjPZRVf0R/FVYL5uw/viifKbM4cF2QWWwGEjRSNmD1NZW2auL8mlODIEBPcEqPvTovgRwMhfMGfXTNJ5bnouNUHsB2rviYfQfED/tfN3ycYyfrWOhz5c37LAZ4OZJxYFfDtB/868jZytXdtKv+lns2Xm3l1de3wHbFQe3N3X36czWImLsLybiu7LPr95dKYmVU8B6a83i4Vj7J4SdzDTZQmu/wdYP/2GiU2lkNxJIK69TF7oBy6Um80GFY3hw3cqBx6g7gquzr8Ge6z9q4Kn0vb5VDfrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFDZ93yw204WtMr/f/nRhR/6GEJux3aRL1LL0rkj1Bs=;
 b=Cqz3DTb/Tot8E1gz3a1i4gGTErRPS+FqruBK5B7JwM4wDXcMTAi+6Z1HtJbwvVKM5PPvcBl5mIBzGlHlDzzhXWSSfDUy7ZlfNziaSP0m5defrYxxh0ni/YQcancTc7fDYw67QUQqaGjbec6lc1nPa+9V8JtTdRocu+a6CNvMPpzo+la7PN9o4ml4LLbEAXIll9e0LN3SmONIq7j/iuk+pi4uYLx5mfzuNIr/VMcjjY2HdX7njmIHNl1u4Lm5S8WherumBx4rIlFweWlNnUA/T+kzN+7w2G6GItf5hKRhrnvwHr16DW1598SStroiWTdGeXB+bRT+taKEtn8VaLU0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFDZ93yw204WtMr/f/nRhR/6GEJux3aRL1LL0rkj1Bs=;
 b=h3ma+mUMurEu/oTKab/GJjYShRPGi/X9Y2DGcsAzmy4IgLMa4FS9Ct2iDFe6bIBWOvhqYrCaTX2GQYQHLtmUI7BwJK3+FwLkgy3zTLSS3hXlaCjloOMQ0qLFWmaqBjcPygN6AEKrBIeY1xb7tz27YGzlFfp+l8qJQO+rogIcePQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9453.namprd12.prod.outlook.com (2603:10b6:610:1c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 14:30:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:30:55 +0000
Message-ID: <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
Date: Wed, 15 Jan 2025 15:30:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <c823f70c-9b70-441c-b046-71058c315857@amd.com>
 <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
Content-Language: en-US
In-Reply-To: <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8df7ac-99d2-45a9-c300-08dd35713854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VsTXNWbG9IbU92bHhjbzY2TVNma2t3OXRRMGZsdFFRN3JCNnMzRXRjN0FD?=
 =?utf-8?B?Tml5T3NVUjlKR2tuRStEVHd4TWJhYVkxOEpNV2dQZGthT3ZxZ0t5b2ZsL0Y2?=
 =?utf-8?B?blBpRGNmNXN3WmhiQVRMZ25JcS9aRU9jbVNJWnM0NTA4Z0hRZjRNSFhpUkhJ?=
 =?utf-8?B?NDdXRldzbDRZdEpMbjZKTkNxR0NzM29iandkcUJ4bnd5aGlTUjRKUXlRU283?=
 =?utf-8?B?dlRPdm5iOExGY2FKSVU4T2FncUZHZWIwaDJ5Y2MzSThyenBiL1ExQ0MvL3pz?=
 =?utf-8?B?SDNyTitXV0xHQ1VNQ2NWMmg1NThVaGR3eHN2YnNpQXdvQm1xZTUzZEdkR0wy?=
 =?utf-8?B?NWIrcWEvSER6OTdPTC9TaXZwRjNRVFF4UzRsaTVsN0l1ZExSank4NlNhWTFW?=
 =?utf-8?B?aUpvcTJjalgwVXgxeHV3RWVOYkZidDYzWDA2MS9CdzVhY1hXU29yYnVLcXgx?=
 =?utf-8?B?eGU5c3p4OHpGZVZBd0tVTU1sYVpCOXZhWXAwcldPRzhGRHJETDZGVDArNWNm?=
 =?utf-8?B?b3lvT01ITXkxVzRZVDljaXZ3dWk4cjJvWGV6RjNlOHd0c0tha2FuN2VnbzVD?=
 =?utf-8?B?V1pjenM3dmhBVU1tckpKMGswUTJsKytMKzhJRkF4ZlVHMjhwTUZsVU9wRTM4?=
 =?utf-8?B?c0ZQclVsc1g4NzNubGc5TDJtZi9TYzM4eTNzeTVGY2hyeHVJN1pKeE1rZndP?=
 =?utf-8?B?ZGVxVS80WkNwRDdOZ21QUDIydGp3UzJ6UWI4dWdyY1huVzQ3WTBwUzlPQ3FK?=
 =?utf-8?B?SU9lZTBlaHovSERrNW9XaklCUHFmcFRVbzhwRld4VUIwR0huL3JPazBON2lD?=
 =?utf-8?B?aHUrYm9NRWNucDJqZ1VQaW5XRkFFL2cvVlMrUVVISUtJbXUxZU9oYlJxNjJW?=
 =?utf-8?B?Sm9OdjF6TDhNbWZOKzJoektzUUpCV1VvR1cydHk5SGFHVjNBZ01KVDhrY0Z4?=
 =?utf-8?B?eGkyQzJhUExQdjBrejJMUklJQVIyc1RyY2VDT3AvRWJXT3BmTlI2YWt4WE5v?=
 =?utf-8?B?VzhoanZaM2lkSTZtWGxFUElXMEpUejMwbXNBTkZuTE9mR0ZMKzFMV1l1REVk?=
 =?utf-8?B?eUZlRlVqckpDbUFjS09YSzk3a0g3azBnbnpyS0lwQ2hwaFpSV3h6bHVXQnVS?=
 =?utf-8?B?bUlCOG0rNDJNOXN5WEVJZ0syenVhZnBULzdqbGU0UEtBcDRwNEhCUko4TzQ2?=
 =?utf-8?B?Z2R3Nzl4RUtZQ1lJNnBsYk92ZDlMclhEakYvVDZOa1ZPRWxLMU4yUW5CY2lS?=
 =?utf-8?B?ekVXWUhtVFowSUdpc2lKeklla3VNTXVWeTNNNzBWOUdHU0NaSmF1U3N1amht?=
 =?utf-8?B?YWtyZ2NMRmpTT0VmbENhVEtWY0ZkSVBmbkdsMktEVDYwNnpOaUhBelJnbEU1?=
 =?utf-8?B?bGR5WHBoMERPa3RWWVZhS3hTOEVlbHNBTEVKclk5U1RVcUhjZzNvOWNjdWFT?=
 =?utf-8?B?VXJOMCs3cEdLVjluMEZKK1lRRHp2ZWFtc1RVQkxPeHdwUm42WTYyMUZybytp?=
 =?utf-8?B?aDBJd3NHc0ZtNlEvUXYxM0FXN0ZUakp2WXFMTk90SVF3T25MOGtiZEsxUTlM?=
 =?utf-8?B?QmVyWFpMQmRGT3dvbk9icW5CNllxZ0orN1U0ay9VQmlia3hrcHRFMlRuTmp6?=
 =?utf-8?B?TEtUekNtZmV0VFU0QTVJSzl6L1RCYTNINjNOVzRkRXJIRkE5RkVxaFk3ZWRU?=
 =?utf-8?B?V25hTStKZTg2ZWNvWkpuaUhsKzd2Ym1kUndOaUplaUlzLzNiWWRwR3B6aXQx?=
 =?utf-8?B?b0I5MEpCb0loZzhIMGxWNHhieVplSzBFKzFHa1YwcG9XY1NOMDZvbFFxVXJ2?=
 =?utf-8?B?bTVSTThtNlM2T3poNys3UDFhdlZualluOEdpUUlJQnQvTFV2NWdsUzk2d2hQ?=
 =?utf-8?Q?m7VOrIi3G2JhL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDgwVDlPM09UOEFXdWphU2QxS0hGMnhsNTViMTA0Wlllb1lLZmNNRTdDaVBh?=
 =?utf-8?B?WWtGb0pLUVRvcGxUOGR6UEtBVEp0N28zTjVNaEhvTFd5MDJ4UWdEVHEzNHZw?=
 =?utf-8?B?ZUdLZ3c1WnpCYTVudUpqWXhKVHRyb1JQa01KWjRJNGFHc1g4MXB5VDlQR3JT?=
 =?utf-8?B?QjJybUkzSDZKeHNTc3JTUXJCc2JCZ0k4ZDA2UDdLQnpxZVVJcERCNVJJYXZj?=
 =?utf-8?B?SERoQ2h5TVJ1RFFpbmxyVkg3TjlteDNEQ2hSSmJXTlNVZmNlT1d1YXlUY280?=
 =?utf-8?B?VVJyK1BBajBqd01HOGtjQ2NVODNUZWNWOU4xWWhqRXBFNWxHa1lTV0J6QzF6?=
 =?utf-8?B?cGsyYzFSUFFJVWd6ZUh0ZnI2S0FzQW50ampjT29UcWNtaENPY3BhWVpZWjAw?=
 =?utf-8?B?eWJHemNsZXlYRTJuc3I4WlV0K0JsNFdxbVJWeHRMMDBqaEU3K2diQTA4VVBh?=
 =?utf-8?B?b29CdFBrTDJiZFdrUlQ1QStFSDA3YWNQd1o1V240d2FoTlZyZFlEMSt2NjZh?=
 =?utf-8?B?R1JJWG9WMXYwYTJEWnlidGR3UmFHTDRIeENVaDFha0c4VlpKWDBFcTVlcDlS?=
 =?utf-8?B?cXFSRDRodkhac0prOWhiQytIRmxuRkV1UVhKWGJNMlBNNnhYUDVJVlJBUjZS?=
 =?utf-8?B?bmRPc25Zd2xLRzlIWFd1RGZ2bXp6M1lxUkpWeERmT2Q0QTd2NXVSZG90bkpr?=
 =?utf-8?B?cDYxZVBNelNzaFBpU05NQndXbTNvalVIYW43VHJYeTdtTXpxcmk5T1NXRllp?=
 =?utf-8?B?aCtaQkFIM3YvbXJHaCtaQ1VSUFBzZndIY2tWZUFUaXU5WFYxQWxQNzZ5NWcv?=
 =?utf-8?B?VE9taXhhY3pRYVFuandoQ3hRK1ViOHh2eG1PYjM5MW1LTU9ERitTZDJMdG93?=
 =?utf-8?B?N1drUHRraXVBZXFqdHkxYXYyR1NSQi9ldlJwc09ZNHRMZ1pCcDNnOG04R3dE?=
 =?utf-8?B?MjVycWZnNkplZE5PeTBhMzBRemQxOVVJQXRSckRZankvSUVJTzVEay92SmxK?=
 =?utf-8?B?ODlaYWRtWmx2dWxOTWt4UXUvdGFxMzNwa3pnN0JDWndTTnVuYkRvY0s1UDY1?=
 =?utf-8?B?bUdwTEZMWHJjRFFFZ3hQWDV3YmxPZ1lKalkwM0tNbmRZRU1LWW0rc01pK2Vw?=
 =?utf-8?B?OGhvRWpYY21VUlFhZlJrMS9Sa203WmZZTm9lN01xeHhSWlROU21rR3JGNy9U?=
 =?utf-8?B?NmtBUmsxM1hjRjdVNk1qTjJBeDB0WjlTdmt3dkhtRTVyVVZUTmdzMXgyOXBC?=
 =?utf-8?B?YkFYWCtWOVhmdHZRbWVZV3BIc08rekFUTmcvM3VnWEVnT3QxSUpaUXh2R0pJ?=
 =?utf-8?B?aEJEZkVEUjg0bjZZZW8xdk5CWGd0WitVTERCS0xqY25rSEFhT3JRWWFjanUv?=
 =?utf-8?B?THRVeHByOWFSU1hCeE5kY0ovTG1xbUFJS2ZPanBwSUtmZmE3ZXc1b0NTR1ND?=
 =?utf-8?B?UkFJaUp3SG9oZUJFVTVkVTlJVTNaNm0wYXB1L2ZWRlpMYmFDZnJkVHJmRkhi?=
 =?utf-8?B?M0wzRlZNRDI2RDlLb1l5ZG9uM3A2UGdPUkR1TGE3d3JZeUIzazFLOURlTVNF?=
 =?utf-8?B?bldGU29WTWEvMVVkM1hPQ0tVYy9UQWg3OGRsSGMyVFZueFloSStWL2NuU2xw?=
 =?utf-8?B?Um4zekg0emMyMlFMa1l6M21SZ2hVU0JiMlMvY1ZlNllReEUrZFhUeGQ1UW9w?=
 =?utf-8?B?OUZhak12anNTYVJheW5vN2JTWlhiT2FaWXBucWlYNUJtNmhDTU5zcFk4RjFy?=
 =?utf-8?B?SCtuOVQreklDWnFrUHgzTEJ2WWUwVXArVUlNRjh3WXU4akdWYkZrVGxSR0No?=
 =?utf-8?B?cFIxNnZjckxaaWNJSHNROWgvUmlyNFNsSW0zWnlVYXFrd1BtR3FMdmpPeE9v?=
 =?utf-8?B?SFFEQjVPZHlUZUdHbWVHelJVSW90UDJQc1dFdFZNZjByOFg1VVhHZngzeU9h?=
 =?utf-8?B?enVSY1lNZHFieU5LMjFmMWVuMm5QVlhlbW8zT3dXNUtZZXBHNkVGYUljbzlV?=
 =?utf-8?B?bzhBU2dzY0hUYm1iaTJyYmo2alNtNDlFaG4rOWszVTRTVS8xU1JueGdxSEVJ?=
 =?utf-8?B?aDBoYUpQeXdRSExiNkRJOFIvVkVER1RTZUJxTVdhdDdGR0VYMXh6bUlWS1Bh?=
 =?utf-8?Q?s327N1ntljNb9r73+FPbv7J0f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8df7ac-99d2-45a9-c300-08dd35713854
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:30:55.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0YunvMpA0j/Vxcgu6DLXcVg+seTyaORNu/wyLhf38239wlkrmzDW2KAi/XlERKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9453
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

Sending it as text mail to the mailing lists once more :(

Christian.

Am 15.01.25 um 15:29 schrieb Christian König:
> Am 15.01.25 um 15:14 schrieb Jason Gunthorpe:
>> On Wed, Jan 15, 2025 at 02:46:56PM +0100, Christian König wrote:
>> [SNIP]
>>>> Yeah, but it's private to the exporter. And a very fundamental rule of
>>>> DMA-buf is that the exporter is the one in control of things.
>> I've said a few times now, I don't think we can build the kind of
>> buffer sharing framework we need to solve all the problems with this
>> philosophy. It is also inefficient with the new DMA API.
>>
>> I think it is backwards looking and we need to move forwards with
>> fixing the fundamental API issues which motivated that design.
>
> And that's what I clearly see completely different.
>
> Those rules are not something we cam up with because of some 
> limitation of the DMA-API, but rather from experience working with 
> different device driver and especially their developers.
>
> Applying and enforcing those restrictions is absolutely mandatory must 
> have for extending DMA-buf.
>
>>>> So for example it is illegal for an importer to setup CPU mappings to a
>>>> buffer. That's why we have dma_buf_mmap() which redirects mmap()
>>>> requests from the importer to the exporter.
>> Like this, in a future no-scatter list world I would want to make this
>> safe. The importer will have enough information to know if CPU
>> mappings exist and are safe to use under what conditions.
>>
>> There is no reason the importer should not be able to CPU access
>> memory that is HW permitted to be CPU accessible.
>>
>> If the importer needs CPU access and the exporter cannot provide it
>> then the attachment simply fails.
>>
>> Saying CPU access is banned 100% of the time is not a helpful position
>> when we have use cases that need it.
>
> That approach is an absolutely no-go from my side.
>
> We have fully intentionally implemented the restriction that importers 
> can't CPU access DMA-buf for both kernel and userspace without going 
> through the exporter because of design requirements and a lot of 
> negative experience with exactly this approach.
>
> This is not something which is discuss-able in any way possible.
>
>>>> As far as I can see that is really not an use case which fits DMA-buf in
>>>> any way.
>> I really don't want to make a dmabuf2 - everyone would have to
>> implement it, including all the GPU drivers if they want to work with
>> RDMA. I don't think this makes any sense compared to incrementally
>> evolving dmabuf with more optional capabilities.
>
> The point is that a dmabuf2 would most likely be rejected as well or 
> otherwise run into the same issues we have seen before.
>
>>>>>> That sounds more something for the TEE driver instead of anything DMA-buf
>>>>>> should be dealing with.
>>>>> Has nothing to do with TEE.
>>>> Why?
>> The Linux TEE framework is not used as part of confidential compute.
>>
>> CC already has guest memfd for holding it's private CPU memory.
>
> Where is that coming from and how it is used?
>
>> This is about confidential MMIO memory.
>
> Who is the exporter and who is the importer of the DMA-buf in this use 
> case?
>
>> This is also not just about the KVM side, the VM side also has issues
>> with DMABUF and CC - only co-operating devices can interact with the
>> VM side "encrypted" memory and there needs to be a negotiation as part
>> of all buffer setup what the mutual capability is. :\ swiotlb hides
>> some of this some times, but confidential P2P is currently unsolved.
>
> Yes and it is documented by now how that is supposed to happen with 
> DMA-buf.
>
> As far as I can see there is not much new approach here.
>
> Regards,
> Christian.
>
>> Jason
>

