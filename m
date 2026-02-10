Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ds4A12eimmuMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:56:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132591168A1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CDB10E4B1;
	Tue, 10 Feb 2026 02:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zns1Ba+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CB610E4B1;
 Tue, 10 Feb 2026 02:56:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDTyLQTClLn2ODedQDZ8Ig6xrXolKskvZti/8ZAruuyMw+C/7DD3bfFgUbVCHv5S/r02D2ECZhHNeHEf/nHcoospAzpK1lt2CkOm6JDh/IVN/cwP5nwPH/KGVwS0nrXA7hCR7buRVLWw6tOCcyiWOPLdgovnP6W9Ut1/c7sLXgl+OxYGqdDsU6jYbNmK5+VWFthjBhnSLZyV0J97PILolicPrmtEnDomXVAMGm9mxKTaXnh2UxCisaDQJ9MFr8b19q8Kz84IQwWkQ+koF6tae2e7m7hjQEuk6YXwjFMa2Wq7+ig7ii2FqpGQx9btdS6cV1Wf3DkIgc02lv85TbJscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7XA5lCEFKQFAA9E+5gRbJ0vpe52/Sa0Do/Ava/4R0g=;
 b=HtWDltQjN9St2R0V5dnd/SoSGcPmcr5cyXFV4X+ayhbDtKxiZwo3s9LF6OO/DhKJMuvuskF6ausA3l6gnIYFLnu98q0cQHsFyXRO5n7nEQ/eoWGZH/WaOHtoFQ7nz2cwAYEwmttbWNu+z0Jf7BcKMuIzEQLsT2ROMA71PUXBHJDO626alzi3fKovzvVNck2uajzaGHFltLiv9C75y4Doa0D9VBxxybh0UZmnZ46Jl2I4PneUFvRmVCtJ4OHWZQcsJ+NLVa20jLzXwNf07myEo9ctQBg7bCtt3whH4uemXmvIeDHz9vjmMockCpbHA+28qc4ZilAlSLSt9IlyQNUWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7XA5lCEFKQFAA9E+5gRbJ0vpe52/Sa0Do/Ava/4R0g=;
 b=Zns1Ba+KcJfUVphdy+dvYpHqbST1tN3pF79GTyd3Ir79beqGVndAlXFSZrR7Mj8N2BgIKttHGVE5zWRkP1ZtVHik+6vqDcQSIf4EesVyX+zJiZZ9r+48nOsJRNmtup0eoJyZiE1fLy7cCaIGUVtvFe79ebD3eoCl+sA2OjCValAo94cYmsQpNvHTRNx00Gba8CPIoY+6d0U5QRawXhUK4fzqsbjDJ2SkgSePnGckD6f2B/GpqPyqHybjk8X7e4PKpCZgJF+BEd13o7m5QYFA6CffL9asImxF6taDvQ7xJtI6+o/4/a0+PZnWzzeZCrlcnu88VvpTUgauDSjBUIF9gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:56:18 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:56:18 +0000
Message-ID: <350a911f-bed2-4ed5-b29a-49057dae4451@nvidia.com>
Date: Tue, 10 Feb 2026 13:56:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c76a092-0095-4d50-5a95-08de684ff666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2lmK1ZEaVpva2x5VjRZUnp6bDFDSnd0ekFSaWY3SHk1Z1hUSTAzNTlaa2xH?=
 =?utf-8?B?QkdwTENOYW1Xc0Via0loWURlQWgvUHAzNnZLNWVOOS9NVzc2emRBdzNVQ0Za?=
 =?utf-8?B?L252U3hQNjdNSDFwZmYvYXFWalRLWm1MTXN1VS9FeS94R2VENnpUeEtwNnFq?=
 =?utf-8?B?RmtLUUNtejlZeCtOejBJTGF6alZCeitNMjBEL3czblZMT3kzc0hoamhzTllM?=
 =?utf-8?B?c3NVR0M0MVZCK2FSSHM1VUVWZVBYZy9YT3dBdDg3V29Jd1NtRzJkemFiRXph?=
 =?utf-8?B?bllTU291MEdGSnhXSlRSbEZ2bVA1UFBwVDRNMnVIU1VsNVl6dGRiL0pLWDM2?=
 =?utf-8?B?czhpajkxS1prUHloMFZleFNvTlhhZ2sxdFY2emV4eDN6TWkxdVZyQi96V0V3?=
 =?utf-8?B?Tkc5b0lkVE15V3NsSldjQXZPSnlHVENldnRYaFFOdllHOWI3M0JmOFBTY3VM?=
 =?utf-8?B?YUtVSmVCVjFrU1JIektSam5lQjdoZEJrUHY5WUphSVUyTFBQTWVVRmpuWlB3?=
 =?utf-8?B?LzdzWUdxMW0rU1VnTURjdWJHSTdKRHJCZExHSTQ4bVRNeVgyN2tiYjFyV0hL?=
 =?utf-8?B?Zmg4eGIweVdlR0F6NUZ2YnpVdHBndGlFcTdvNnNqQ1FKTXlSK0RzazR3N3g3?=
 =?utf-8?B?UTZCeFAvQUVZWFVwQUs3TjBkUW1ZRFVyQzJsYTJRWUhGWjMybWlDVzVTZlR5?=
 =?utf-8?B?S096TmZsNWpFamd1QlRnOUtSV0RNWDNqSVowVEVXbWpmRjlGSHYxNm5nYm94?=
 =?utf-8?B?WldKZy8wUXh4TFV4dWV0N2lxNXUvODllL251bk1aNEJkVG5xQVhwVllXeW5u?=
 =?utf-8?B?clNXdkI3b0ZGcG00YjVDbnBValB5a3JHOG00YjdadjM5Q1NFcVo0QlY3Zlhv?=
 =?utf-8?B?Q1NkS0RDQ1JnQWRXUW80Q1dBS0RBVituZkNURzJoR3A1QnNkM1RZd1djRVZi?=
 =?utf-8?B?Z1dkbTA5ZnViR2xrZE1uSzdRWE5xZTg1NlRVQjVRTUFUTW9RYUgwWGpLOUdx?=
 =?utf-8?B?NURGMFZEQTNseWFqU1ljbXJNc2p0OFV4OStvSllpZGxydGwrVkx5NUlqNnVt?=
 =?utf-8?B?MHVhaEZPaDZwVkU1aThndFRyQ0piNFlFZWpUL004NmFsTENxckJseE5YVXZY?=
 =?utf-8?B?dkU0Y2tzQUl1bldYTWhDWFlVRjBKcE9IeHlOVmFieGs4N1V1QzR0c0RacTQ1?=
 =?utf-8?B?T21HZUROSDZrT3RITFVOcG0yaklidEVNejFlYklNK3lzeDNnWmZ5L3hPRGEr?=
 =?utf-8?B?U0lYa1pwUUlPTjJueFNXYVdIRC9XdzZMek94TFZ1eWllTDM4c2I3UDZTc2tY?=
 =?utf-8?B?V1QxVFd2alVWZ3FYNFErNU95Q1czT2R6alFuZVdhWkMvazlRSC9FTkh2VUts?=
 =?utf-8?B?VUJrcVlsdnJyOUUrK2tBSzVuV1ZOWVRrWDdFanFySTRtdlRyOUI0MHl5THFk?=
 =?utf-8?B?aXg0V3FoQVZtd0hTQzRvZWVpRTlYOHZPYUIrNnhtRXdUYmRjT3MxdTBOUVVa?=
 =?utf-8?B?RVFuZWM0cWhjbllPVHlhMzZRczhUUC9DdUY3OWFxaDVEL1pCaWt6WDFIbVg5?=
 =?utf-8?B?Q3BOTzVYUVEwc3BJUTFaT3ZDRnI2ZnlHNlVXWnZ3TXNzVDBVOVRpVDF5L2Nz?=
 =?utf-8?B?S090OE10ZVB6MVYwYVhlZUFkdmJlNmRNeFRCWmRJQnFFU2RmWjNpcTk1Vmhy?=
 =?utf-8?B?QjVUcXFYWFZoSGRmVDVjMTZjeDFVNzZlNkFpdkVaTnNiMHNwZWtFTHUweEgw?=
 =?utf-8?B?WG4vclBNM21QZTlKbWgyYmx3RHRjbWRoaTBoSzlKREhQb1pQaVpZQWIxRXZK?=
 =?utf-8?B?Zmo2THBsSllCc0E1bVdhOFlhMjBuOERIWU4rajlOWTBkeWZyWlh1UVhNY1cr?=
 =?utf-8?B?WDd3MVVML0ZtUld3cGIzMW1zejBQcVRWUmk3QWNDcWg1TDdyZWI3V2ZYY25h?=
 =?utf-8?B?SU9JMkJQS1lEODM5bExuT3VCdDFybmZrZ1g0UVBONUllZ3MwaEpxOEFJanlB?=
 =?utf-8?B?a1VMUXFMWE94VlQxTUZjV1J3OG5xZGt3MDFLOFFENDN6Zks3a1pGaWV2MWZC?=
 =?utf-8?B?VTJ3TnZtVGQ3N1NJbGsyN2VKbGExclVxd20ybmtaRXg3V0phMUtNTkNVOTdu?=
 =?utf-8?Q?jXss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtUUUZrVFhzTC9LZW5qTGY3MEsrL2hTMXhkaTRpL0FtL3NuVXFlVGsrbC9j?=
 =?utf-8?B?cjk2K2ttSE9zTjNKdW92M0MwOUpoay9FK0FVd2FPL1VOSG80TGpvL0VHckhx?=
 =?utf-8?B?cmhOcXRVNE90TjVtdmFBa3czL0dZL2xYRW9IdkZ4dkNTKzVUQWdiaEw1SVJx?=
 =?utf-8?B?OEU2NEhxSDVIb2tpVU5mZEIvYjhuc2FaWVFCK2J5RUVaWS9jcng0Qm9XTTh4?=
 =?utf-8?B?Wi9LN1RKRkErUmRLUUYvd1ZoRGpWcXBlQXNmVlkzU0x5VUVTUG9jN29FMnZH?=
 =?utf-8?B?eWxYeitiMGdJVFY0UUJIOUJRZE9zSVdUdXlQeGRFR1h1Ti81NytjN0FsMnA3?=
 =?utf-8?B?UzVIc2M3UndsU01VU3IwcGZWWXZ2c3ZOdXAxRUVtdzQzcXFiN3VqbTZJQ1JU?=
 =?utf-8?B?UndwVnpnYU5EL1V1RThPSVdyWmtsZGI1cGVTMWtCTEJvS1RPVlVJUWs0VmtD?=
 =?utf-8?B?V2FPVkwwMSswSjJZVkZvV3Y1ZEs4MWY0ZGk5d2VYOVA0VUxFMTdJUTE2QzN6?=
 =?utf-8?B?aHUyVytyN1hMb1gvVUM2WEgwdDQ4aGZRNEgwU3RyM3VuSEJRdlRvbzZaTlFw?=
 =?utf-8?B?VzhuNmJIejNlVmJWSWlLTnZ5UGw0aENxZzBsM05KVDlxZE5tdkt0RkpNSFda?=
 =?utf-8?B?NXB4d3FWZTJCRnoreWxXdFJkYTI2K2EzTHBhdEVlK0M2WGQ5Z05xUGNRRUpo?=
 =?utf-8?B?QzBsVkhkSkFFbmZBUHZkSVFTK1o4cUdwcU5CWXJoaG1GWllUdWszRTdRU0Yy?=
 =?utf-8?B?MzRLcVZodFpCU3RSenlKRmt1SjJxNVlJVHB0b1RFWU9zYzFKZzgrekNOUmN0?=
 =?utf-8?B?azRYNkM1OGUvWUdLZEZ1OXZqTjBlcFgyY1krNjcrVEpzVjFBSE5JOUgzbzU4?=
 =?utf-8?B?OFdkY2hybFQxM2czQzhRdE9leTJEcmhJTFFHQ0Fobzd1VGVndG1hMzYyeGRa?=
 =?utf-8?B?Nm5wa0JUYndWanNFUTNIc00vanNpQnJyWEZqSzBYWkFueTVDYk5abzZtcGNM?=
 =?utf-8?B?ODVQdWhMaFdxMDUxOUJBVnhDMGtkRUp4VjhCN3RIV3FEMXg3eVN4OVpPT2lM?=
 =?utf-8?B?dGFCMXFKbUx5UVBFK05uV2V2Mk1NZWNueGNXeTdaR3RwWmdacWFYRDd3TnBi?=
 =?utf-8?B?VVplanNjeXErdi9kZllNeVFkaXhyc1FqZjBKM1hkV2JqaHN3UEx4UlltdStw?=
 =?utf-8?B?RUZLMXdiTWJ5MDI4QkprUzkyTDIwZEpSWHdNMlJlblhYZjF0MHBQZ21paUlx?=
 =?utf-8?B?dnBSV3BlRmRsR2pIUnYwUE1uWXphSFRBY3VlSUZRSlBUQTd2NkJoTkpES0Zr?=
 =?utf-8?B?VitzNlFBcGczUzRqR2lYY1I2V0g5WTkrWlR0UmFqMFpyU3pmZjd2cDRPQXBP?=
 =?utf-8?B?ZEpybGZsd0VTYSthV2gwTG5NaExPYUdmN0VxWnJkdHI3RmI3cEtWTkMvWklG?=
 =?utf-8?B?OHVNNzV6a2RpTUdhMG9MTGo3SnV3emZydk5MSkQ0VDc2WFcxTTdPQ0YxNmhC?=
 =?utf-8?B?VWxZZTZ5TVJ2L0dtOU9OMGgzVFZhT1JleVQ3aHJZWGY0Vk9SZWdlOXZkZFdk?=
 =?utf-8?B?Rk5aTW1nVFR2V1BIN0JkTmMzak9RNWRTNDdJeW03Q0lzMDdmSnlreUM0N2xX?=
 =?utf-8?B?K3FUT1ByOER1aHl5bkc2K3NkL0gxNHFnN3pGS0R5N3MxVFk5YlR2cmVPc1Y2?=
 =?utf-8?B?TFFoYitINnlVUHF6dkFQTzFvSXprd2poMXhYNC9WeFl6NkZ5VjJNT2QzYjBu?=
 =?utf-8?B?eWowRjNFVDJxMG9pL1paQmpoQS9RQVRuNlhMY3lKVm1KWnJVZzk3US84R2JF?=
 =?utf-8?B?clJMTDFvdTYrNklGNVB6Rm05S3NCYWRjQ1kxNjZYbWVCNlhEVG9paGhCZzZ2?=
 =?utf-8?B?Y2pVRUZsZEMwQkNBNVQ4ZTZvZk9WOThkcDdESDIyNXRoUUJaZUNwQk5hZGpG?=
 =?utf-8?B?VmoxRzUzWE8zUzkzODFJQ2ZWM25lb2hSalVqTjUxbHdHTTBXeG9IZXlvaTda?=
 =?utf-8?B?RE9JU1loN1R0Q0lNVzRHaWU3SE9qR002ZzVDaTQvcmpQaXY5Y1pSRjlOWVVM?=
 =?utf-8?B?VWtBdXdVMEhkNFcwOGduZXNpMUNZK2o0dmZpM3YrZWpRRTd0R1p1anNhbjNO?=
 =?utf-8?B?OWlvdC80SU9veWx1YUlzdk1nbDFZQms5ZVVQQUlNUXdVNzhuaGEyTUZ0Mkcx?=
 =?utf-8?B?T3p3MGU3M0RxRkEzQk5hdjVTK1krcWlnOVhqWUVRb29DZ3ptZWtuaCs4YzBm?=
 =?utf-8?B?Q1oxMFFrbW5aY0I5SnZ1Qnc4U1lUd0pwZ3pmVE9VQUUxekM4SkRKclJIbkVM?=
 =?utf-8?B?ZUNiZnE1TzljSXlwMVBPNjZVLzJjNnl0aDRGM2RRZ0NaUFd1Qm56aEdhZWFX?=
 =?utf-8?Q?lI5RCtNAEYoVXr8kAz8Y6l+DFTmrzsU3CtW53gZlU846S?=
X-MS-Exchange-AntiSpam-MessageData-1: ts731Z3LYim/LQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c76a092-0095-4d50-5a95-08de684ff666
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:56:17.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6VYX4/tA5/dWDNT+K3EDca6OAtdRMnvaTJGc288bH58k708L8CgHZdEn/Ft496baI4BjqinTrLEdsonANxJBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 132591168A1
X-Rspamd-Action: no action

On 2/5/26 22:10, Thomas Hellström wrote:
> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
> trying to acquire the lock of a device-private folio for migration,
> to ram, the function will spin until it succeeds grabbing the lock.
> 
> However, if the process holding the lock is depending on a work
> item to be completed, which is scheduled on the same CPU as the
> spinning hmm_range_fault(), that work item might be starved and
> we end up in a livelock / starvation situation which is never
> resolved.
> 
> This can happen, for example if the process holding the
> device-private folio lock is stuck in
>    migrate_device_unmap()->lru_add_drain_all()
> The lru_add_drain_all() function requires a short work-item
> to be run on all online cpus to complete.
> 
> A prerequisite for this to happen is:
> a) Both zone device and system memory folios are considered in
>    migrate_device_unmap(), so that there is a reason to call
>    lru_add_drain_all() for a system memory folio while a
>    folio lock is held on a zone device folio.
> b) The zone device folio has an initial mapcount > 1 which causes
>    at least one migration PTE entry insertion to be deferred to
>    try_to_migrate(), which can happen after the call to
>    lru_add_drain_all().
> c) No or voluntary only preemption.
> 
> This all seems pretty unlikely to happen, but indeed is hit by
> the "xe_exec_system_allocator" igt test.
> 
> Resolve this by waiting for the folio to be unlocked if the
> folio_trylock() fails in the do_swap_page() function.
> 
> Rename the migration_entry_wait_on_locked() function to
> softleaf_entry_wait_unlock() and update its documentation to
> indicate the new use-case.
> 
> Future code improvements might consider moving
> the lru_add_drain_all() call in migrate_device_unmap() to be
> called *after* all pages have migration entries inserted.
> That would eliminate also b) above.
> 
> v2:
> - Instead of a cond_resched() in the hmm_range_fault() function,
>   eliminate the problem by waiting for the folio to be unlocked
>   in do_swap_page() (Alistair Popple, Andrew Morton)
> v3:
> - Add a stub migration_entry_wait_on_locked() for the
>   !CONFIG_MIGRATION case. (Kernel Test Robot)
> v4:
> - Rename migrate_entry_wait_on_locked() to
>   softleaf_entry_wait_on_locked() and update docs (Alistair Popple)
> 
> Suggested-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.15+
> Reviewed-by: John Hubbard <jhubbard@nvidia.com> #v3
> ---
>  include/linux/migrate.h |  8 +++++++-
>  mm/filemap.c            | 15 ++++++++++-----
>  mm/memory.c             |  3 ++-
>  mm/migrate.c            |  8 ++++----
>  mm/migrate_device.c     |  2 +-
>  5 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..3cc387f1957d 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -65,7 +65,7 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
>  
>  int migrate_huge_page_move_mapping(struct address_space *mapping,
>  		struct folio *dst, struct folio *src);
> -void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  		__releases(ptl);
>  void folio_migrate_flags(struct folio *newfolio, struct folio *folio);
>  int folio_migrate_mapping(struct address_space *mapping,
> @@ -97,6 +97,12 @@ static inline int set_movable_ops(const struct movable_operations *ops, enum pag
>  	return -ENOSYS;
>  }
>  
> +static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +	__releases(ptl)
> +{
> +	spin_unlock(ptl);
> +}
> +
>  #endif /* CONFIG_MIGRATION */
>  
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/mm/filemap.c b/mm/filemap.c
> index ebd75684cb0a..d98e4883f13d 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -1379,14 +1379,16 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
>  
>  #ifdef CONFIG_MIGRATION
>  /**
> - * migration_entry_wait_on_locked - Wait for a migration entry to be removed
> - * @entry: migration swap entry.
> + * softleaf_entry_wait_on_locked - Wait for a migration entry or
> + * device_private entry to be removed.
> + * @entry: migration or device_private swap entry.
>   * @ptl: already locked ptl. This function will drop the lock.
>   *
> - * Wait for a migration entry referencing the given page to be removed. This is
> + * Wait for a migration entry referencing the given page, or device_private
> + * entry referencing a dvice_private page to be unlocked. This is
>   * equivalent to folio_put_wait_locked(folio, TASK_UNINTERRUPTIBLE) except
>   * this can be called without taking a reference on the page. Instead this
> - * should be called while holding the ptl for the migration entry referencing
> + * should be called while holding the ptl for @entry referencing
>   * the page.
>   *
>   * Returns after unlocking the ptl.
> @@ -1394,7 +1396,7 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
>   * This follows the same logic as folio_wait_bit_common() so see the comments
>   * there.
>   */
> -void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
> +void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  	__releases(ptl)
>  {
>  	struct wait_page_queue wait_page;
> @@ -1428,6 +1430,9 @@ void migration_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
>  	 * If a migration entry exists for the page the migration path must hold
>  	 * a valid reference to the page, and it must take the ptl to remove the
>  	 * migration entry. So the page is valid until the ptl is dropped.
> +	 * Similarly any path attempting to drop the last reference to a
> +	 * device-private page needs to grab the ptl to remove the device-private
> +	 * entry.
>  	 */
>  	spin_unlock(ptl);
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..20172476a57f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  				unlock_page(vmf->page);
>  				put_page(vmf->page);
>  			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				pte_unmap(vmf->pte);
> +				softleaf_entry_wait_on_locked(entry, vmf->ptl);
>  			}
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 4688b9e38cd2..cf6449b4202e 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -499,7 +499,7 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
>  	if (!softleaf_is_migration(entry))
>  		goto out;
>  
> -	migration_entry_wait_on_locked(entry, ptl);
> +	softleaf_entry_wait_on_locked(entry, ptl);
>  	return;
>  out:
>  	spin_unlock(ptl);
> @@ -531,10 +531,10 @@ void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, p
>  		 * If migration entry existed, safe to release vma lock
>  		 * here because the pgtable page won't be freed without the
>  		 * pgtable lock released.  See comment right above pgtable
> -		 * lock release in migration_entry_wait_on_locked().
> +		 * lock release in softleaf_entry_wait_on_locked().
>  		 */
>  		hugetlb_vma_unlock_read(vma);
> -		migration_entry_wait_on_locked(entry, ptl);
> +		softleaf_entry_wait_on_locked(entry, ptl);
>  		return;
>  	}
>  
> @@ -552,7 +552,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>  	ptl = pmd_lock(mm, pmd);
>  	if (!pmd_is_migration_entry(*pmd))
>  		goto unlock;
> -	migration_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
> +	softleaf_entry_wait_on_locked(softleaf_from_pmd(*pmd), ptl);
>  	return;
>  unlock:
>  	spin_unlock(ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..deab89fd4541 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>  		}
>  
>  		if (softleaf_is_migration(entry)) {
> -			migration_entry_wait_on_locked(entry, ptl);
> +			softleaf_entry_wait_on_locked(entry, ptl);
>  			spin_unlock(ptl);
>  			return -EAGAIN;
>  		}


Seems reasonable
Acked-by: Balbir Singh <balbirs@nvidia.com>
