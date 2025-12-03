Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA1C9DBDF
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 05:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843210E0CA;
	Wed,  3 Dec 2025 04:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ox+KTb1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013043.outbound.protection.outlook.com
 [40.107.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1744710E0CA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 04:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIqMMP3XQDpndKjhCZDxpWHANNPGd6FQVNCTffCZ6kcKdlwEfeNpdmGO4dWVkZXy1kgHB+xt3fTP6N4M7rkgzJIwQcOKOeHkQW1/qEuqTHQVH6WNlS/kNkkrzoxXnQHpSFvp0VDOoChUyD6M9UTkGKMOI0sribaafkPW1r4ClxfARsv1yxEueR7J7nizZffWJ5hTKbLcIlmybX9q1v0ojMFPkl8MspIJNB2ECoouYURPEka2aOMama+mVWKCGPQfAOxIZKqK6l9exCzL+x37SVBiE47K/mtkfUZHUV1DMkWxe3at3stPUELDfS/3lnhbo2g3eLkS5iJURq9TV+jMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qqUppQ6SNmm0CM5lP0RBl28Ow2mQlaj9wTIMDuUcUY=;
 b=puXcbtf85pHtpQox6sGogWzx5NDydhBKjVSsE5fewahFjQia4fod8bK0PQAdFqBrbCTM0I0iHlYLjwsz6Bl7oRmoyXin3aXi8u1T+bmBvFzNy7vROduA70zbeIAakKnb9VCs7I8akCPWi3mzOUfoFVzIHpILrplT+hZewKBGyvwlLFY56xtIee4+4La26u1K2PgSXXU6xzyhVx5RCJy/0D3FfQwdwLAnZeAAElbha0gWujKb4EwagaPlSq5XJXX4KDMYuxjcdfDl+1zZ/v1FE/I8P57mjxuykUa+A2v9j6Ni9qF3oIA5sbLRDd7qGAWztEcsYZgwg6nY9kZOICfYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qqUppQ6SNmm0CM5lP0RBl28Ow2mQlaj9wTIMDuUcUY=;
 b=ox+KTb1qk/AZNo/rgCUidrjyzzNHHo6xd7GODI0vXW1pvWRZ+lrkThqPFjcwIeQ1v+Jb9EPBUc254hIUpkc3Q37CUBZPRUvapXB7Fhi93TC7dgOjuUgdiy95alF+RrmaU6giTOH5Pt1S/d84QvIzNvdVo4/82jfuEpP2I9zwFJi+wjfYtXpGeeVmU1KJoigao73amhuNuz774g0zZHTN4tyRIeN+9AKmA+Ugj6qiRLh5wnPiVSwEVFjgrACeqDD0UzC6wdB1jHlu+R3Qw8b6eYK6kLR1fmueNRsodiqVykKZ39XTQFxpkNmMfjSp8HTGtw/A+kO9FiqdAmf3uCC0BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB8842.namprd12.prod.outlook.com (2603:10b6:806:378::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:25:08 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:25:08 +0000
Message-ID: <8d02347d-6ca2-4dfc-ab98-940381fa8b86@nvidia.com>
Date: Wed, 3 Dec 2025 15:25:02 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] mm/hmm: Add flag to track device private PFNs
To: Jordan Niethe <jniethe@nvidia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-2-jniethe@nvidia.com>
 <aSnrnyfr9fvst6eO@lstrano-desk.jf.intel.com>
 <75de1c7d-58d2-4a0f-b86c-b3dae65fb52f@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <75de1c7d-58d2-4a0f-b86c-b3dae65fb52f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d683adf-acb3-4957-80bc-08de3223f0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnRPcVJsL2lCbE8rK281TWZaOGlvTHdlNFJVZm13Mnk3ZkpSR3Y2cHNUeTNr?=
 =?utf-8?B?RUh2TFd0Ni9QZlkxTUIxWUcwS0pqcXlyK3hZY1ppVWl3dWJHejZOY3pYZXVy?=
 =?utf-8?B?QzArYjNiTWVNYStPcThiMllTWGgzeVk1TjJMaGU4VTY3YWROQ29kQUZlV0gz?=
 =?utf-8?B?R3MvVTMxeW1KKytvbmRrcUo4Zi9sR1cvRFZHVW5BeE5ZaTBXWnZFazMxTnVm?=
 =?utf-8?B?YUQ5SW55OG5WUHg2WU4yTG9jSllUb0IrMUNPUjl0NEpXMXZ5UVUwa3V0WG8w?=
 =?utf-8?B?SGZrV1VvZXNhNUtSQkZ6bFhvL09MYm1VcHhGaGNYVm5MK1RCYTJWVVYvTVVl?=
 =?utf-8?B?aEhXRTlGRTErSGVrOFpNbmFRRStDM2xZUnYrTGhZdDBYTUZqOTdJZGZvSTky?=
 =?utf-8?B?RFVaUUt3aGQ0RERtNlRSNWY4cU1vU3B5OHB5UTZFaEMrdTFaZnVPN25BNXpv?=
 =?utf-8?B?VjdDNzR1MUNyY2dLcS9tVHJRYURsL09OZHZZdjhZTmN0T2o1elJGaENURnM4?=
 =?utf-8?B?TmFJcmtSTmovTjB1NlhCZjUyc2tCQVdaUVFnL1g1bnhrMk5Ga1pxRjd4eHV0?=
 =?utf-8?B?V1FCQ0JrM1d0RSt6R2t4NTlScUg5ZjV6N0c5WkpwWFpJM2tWRks3aExIbHgz?=
 =?utf-8?B?SWgyWDhNUlU5OE9UR21GNFJZcklxQm9PTmpkcVRKendWMldGbkV3a3ZiOTJo?=
 =?utf-8?B?Z2hGKzhWOHBiWHoxdGE2a0VKLzYySGZxajViQjY4Z0ZLQUlhWkpNMzFsL3h1?=
 =?utf-8?B?b084dmM5eUoxV2V2ajQ0ZkdTT1VydVJ4Z3NkRmVHNDRxTnNHaUpTM0JGeGxv?=
 =?utf-8?B?NnhVQVVReWxHc1NHT2JXY0FBVFd5SEEwTFhKbkVPTVZhVnJISEM1S0ROck5u?=
 =?utf-8?B?ZzE3ejZxbzVETk5DdXJvYWt5T0RMeFl0Q09xYlZJUEcyK0FGUzZEeE1keEhu?=
 =?utf-8?B?Rkpxb09BM3V6NU1Sb1kxSk01QnB0cHN0aExvYU92RTVnSi9wdDVjeVNQMkVp?=
 =?utf-8?B?UFo3bEpzN29zN1gzQkNMTnB5MkV4VkFlM0JrN0piTEtKdzBKVVkyTTlBOFVx?=
 =?utf-8?B?WEZOVFpyWSt4cVRWZHBBNXZEenVZVm1MbnBpOXdkMkM2Nmp3bEpvTGhHYWhU?=
 =?utf-8?B?b3hZaENXQ2dTNHRReVU5bGFvS1dESWVlRkdGWmdIUkI2R3JNaFB5Z29wYjNY?=
 =?utf-8?B?aXdPMDFsazRuaDh5MFRDeElSVEtsMU9MdU0rV05WZ3JXR0V0TlVQWlA5TldQ?=
 =?utf-8?B?czFSRGpNaDIydEZjdStlZlU1ZkNGTUd6dFRSY1ZWaVN0a2xLLzJUVTd1cnlv?=
 =?utf-8?B?K1R4d3Rkd0JrWmF2a0tyeUdRMlU3RDEzLy9nbmk1c214c3NDSnJjQ25MMTEy?=
 =?utf-8?B?OCtUVDRvdENpYWk2MjNtOVlhNUJBTmkrMmVzYlFvWjFCL3N3L05oNndVQWwx?=
 =?utf-8?B?MGdMZkdHODhEUkhxTkFRb0E1c3JwZEdDZ1J1RzBsdjQ3blB2SGlsU3pheTh2?=
 =?utf-8?B?Yi9RK1had1BHZUFUdEN4SFhXcWdUZUdjNTBMa3BHOHRBSVBwTWszcFdOOGJl?=
 =?utf-8?B?L1hvUURENEJTQjlUTmZDVEowSnZldHFmSUhQa2lyMTNQU2pNWkhJL3czZ1l6?=
 =?utf-8?B?dHRuRzUrMktRUFVnL3ozS1ROeFBsTzkvWEhQMUxzNEZBd0FUeThZc0E1Z0o0?=
 =?utf-8?B?REh0SHBKL09keHlTUjNxUDIxWUliR3NSclZFUEZYVytIV3FTNEdWa2tOekVR?=
 =?utf-8?B?SmJZYzQ5V2QxTUcrN2pWRklpVkxlNUZlaGFuSUNybHM0em1tamMrNFp2ZHhY?=
 =?utf-8?B?RGE0QVhVM2ZTdjlOUGFwM05VWFFibWFCNGorZnFBUzUvS3pjRFVQd2k2bHFx?=
 =?utf-8?B?UTRtcjErajRYdWtSTklvOFJvTjI3cUxIWkQwZDRpdjI3ZjlHZmsxWnBDSW1S?=
 =?utf-8?Q?KnIIAREssXlJabDl8vmjFBrlB4sZP0g6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei9wVmRTckNrUWgvL0JvK1Y0RFJqMTVBQkJ2ME1PT2xvQXFBOGpURExwNlBs?=
 =?utf-8?B?dG1NNVNDS1pIekxpQ3VvSDYzcWczTnRCUktCdk1LeWptMzl1c1FtL2dQcUZv?=
 =?utf-8?B?OGdTZXJWQmtjNDVVUExNL0VPUUg4RHVrSWhtN3NqRUdJVFpxRmhPdEVrZEU4?=
 =?utf-8?B?bURjQ0ozZ2hnRVRScFh2OUtnNURyYmd6WnNMbGJvM2pZckRySTFTcm1GRm1r?=
 =?utf-8?B?ZGFxOWpoS1JzcThZYmNUcTdONTRHcFhCSzhxVTBuL0lraVlvRWVpYjZmV0xt?=
 =?utf-8?B?dUZaa3FzUEVhOFZjUGxNVUt6T1dEZElpVmlaSHNUcVY4MFZYU0UzSG9KM0l2?=
 =?utf-8?B?dnZHZE04ZE9qY25udFZOOTZ4L1U0NFJiWHZ4N0R2SHpENWJiQjNYcElZaHVW?=
 =?utf-8?B?L0lBWmR3anN4VzhGdjEzSk9KOC9kYnZOQjE0empRNkNpK0xOSEJaNUI0aG5r?=
 =?utf-8?B?WDBkdlVJbVJhclJDbzdBc3FoUzdVUzFwVHc0Y0ZrZTFYbEVsRExobzluZitQ?=
 =?utf-8?B?VHN1bjBUblJqSzU3bVZnOXdmYkZyY1RvZi8wMTRsNW9maU9XOWV5UjFQSTdL?=
 =?utf-8?B?Y2hjS0w4SzBQU2poV2xlK3pmQTJ6QVpTbjFZL09CTDNyWnVKT1IrL0tPREs1?=
 =?utf-8?B?SWhrVnowVEJRT1JQYmpZaUN4Uk15Qm9BYkYrMWFQUkN2NU5XbjNGVkl4R1RI?=
 =?utf-8?B?ajZ5QUU4RnhXLzZLc1Q3NWhoSUVmcTVEc3EwZEFtK3RCSm43blVlYzRtR3BW?=
 =?utf-8?B?cStyQWVuWDVhUnlBeTg0YkEzaGViMGlFU0JDS1pVbE1VN3pkekZlVWtwNjVj?=
 =?utf-8?B?Q2dlaHppc2pqSk56UXJJakxnSWltT1NBdnpoaXRzY0xRRzdMMzV2am8vdjNj?=
 =?utf-8?B?VktDV01HR2dKbVNJckFQVjE2eEphMUJPMStIR2ZVaWRBa0lBMFZLbSsvZUtp?=
 =?utf-8?B?ZkF6MFI2TVh1ejBTWnNOSVUzaU9PTnV0bVU1bStvNmx2aFZrazlva3FvMkxs?=
 =?utf-8?B?MmJONnJxRThlQlBpV0gzUkgvQnZxb3VaUGNsZmZyY2ZNN2ZNOXZNSlBUS1Uw?=
 =?utf-8?B?SFU3dkNjUzQvWVMwRWJUZkZCSzZnbXI0S2lVVGVmQ0FVQVFDOUVtb3o3Q1By?=
 =?utf-8?B?YWhHaUdZcTBuczRLOCsxdHZQTjRPUDllOGZCbGpjTklaN1JZb1M2citMU0Iw?=
 =?utf-8?B?VS8vcW85VVF1WkVmakExdmhLdUYwV2hJcStrZ0F2c1pjR2ZkcE1xbmFsMVY1?=
 =?utf-8?B?aDMyb1E1N1NMVUovOHFlS0E4QU5HUWlZVlR3TTMrMURZencvcVAxNjdIcHlK?=
 =?utf-8?B?RitwU0tCWFdxZWNlOTNNbHEyNHV3WUhSV1A4RmtCdXdtZE5yanB6bDhGdFlw?=
 =?utf-8?B?eEV0WTA0UVV5d0JwWkoyTWtTT1JEMENlSEw1VjE3OWZBQWdKZTBlTUdnbmZI?=
 =?utf-8?B?dDBoeXNRNmdzZmIxamVwdHJuZ2ZDL2hUWUVkSGpPQndrVE1GQlFnZVlOTFUx?=
 =?utf-8?B?SmlyWFR1Vm5EeEYxVFh4UnM4aTl4U2pEeHhxQ0E2aE93QkplNEpQV2FLSXdL?=
 =?utf-8?B?QWFYcjhORVljbTloSERzN2w0SmlxYXBmaURIRHRxYmU1UWdnczBRVll2Z1VK?=
 =?utf-8?B?ckoyTE5LQVU3MnluTHcybW9sc3Z2ODdFcmZ1WEMyYVljMXJPRDV6MHpUeDVv?=
 =?utf-8?B?S2pZTmRFMjE5UDRvbm1tQ1F2OFRIbVpIQ01XbHFaS3JmdnJ3cGtBMHJhSG1Q?=
 =?utf-8?B?ZWFJOXRSOXBJekFRVFdNRmdnUVM0R2dqTnB5WUc0RmpZU2Q1SlZoWTBtcExB?=
 =?utf-8?B?UFczdndkc3AwNFA4QkhXZERCMW00Tm15S1luUGtXakhsWnZmWHVqZlpxYW5h?=
 =?utf-8?B?Qnp2NWk3V0hNSERFUlFRMTBLTVRLOGh5Rm9HMVpDT21vQzV1MzNORGVvUWR6?=
 =?utf-8?B?NE5NUU9HeFdYY2Q3L2NjaldNMEFqalVScWhjWC9LWlovQ0V6bEhLcFZNV2pO?=
 =?utf-8?B?UTNCd3JYbXd1OHVMS0cwZjlZM1Q2Q0lXRFRJQWpDdFlpa1pRamxmSnhpOGFv?=
 =?utf-8?B?WjhHUTBzNnBIVXZUUzdqNnRmbG1jREZPZ3daRzBOL2l5a0NseFVldWhmb2lr?=
 =?utf-8?B?aHB1R0hSRlV0WDQ2c1FCSURYandGWndNUm5aRTVqaG9oc2VMdFJZUjZVVlFy?=
 =?utf-8?Q?wIkn/TmGMHoJniV8X8sRz2xZZrXNHH76NyZrN3GqUMeB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d683adf-acb3-4957-80bc-08de3223f0df
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:25:08.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTzJdCtaiSf+mBSTwe1QFN2mzI5PTy4CISjDAmrfdr/mZLj3vvQPLYNpGHj3iExtNI6G/9nAhR5s+dq7H/oBtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8842
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

On 12/2/25 12:20, Jordan Niethe wrote:
> Hi,
> 
> On 29/11/25 05:36, Matthew Brost wrote:
>> On Fri, Nov 28, 2025 at 03:41:41PM +1100, Jordan Niethe wrote:
>>> A future change will remove device private pages from the physical
>>> address space. This will mean that device private pages no longer have
>>> normal PFN and must be handled separately.
>>>
>>> Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
>>> that a hmm_pfn contains a PFN for a device private page.
>>>
>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> ---
>>>   include/linux/hmm.h | 2 ++
>>>   mm/hmm.c            | 2 +-
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
>>> index db75ffc949a7..df571fa75a44 100644
>>> --- a/include/linux/hmm.h
>>> +++ b/include/linux/hmm.h
>>> @@ -23,6 +23,7 @@ struct mmu_interval_notifier;
>>>    * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
>>>    * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
>>>    *                 fail. ie poisoned memory, special pages, no vma, etc
>>> + * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
>>>    * HMM_PFN_P2PDMA - P2P page
>>>    * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
>>>    * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
>>> @@ -40,6 +41,7 @@ enum hmm_pfn_flags {
>>>       HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>>>       HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>>>       HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
>>> +    HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),

Doesn't this break HMM_PFN_ORDER_SHIFT? The assumption is that we have 5 bits for
order

>>>       /*
>>>        * Sticky flags, carried from input to output,
>>>        * don't forget to update HMM_PFN_INOUT_FLAGS
>>> diff --git a/mm/hmm.c b/mm/hmm.c
>>> index 87562914670a..1cff68ade1d4 100644
>>> --- a/mm/hmm.c
>>> +++ b/mm/hmm.c
>>> @@ -262,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>>>           if (is_device_private_entry(entry) &&
>>>               page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
>>>               range->dev_private_owner) {
>>> -            cpu_flags = HMM_PFN_VALID;
>>> +            cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
>>
>> I think you’ll need to set this flag in hmm_vma_handle_absent_pmd as
>> well. That function handles 2M device pages. Support for 2M device
>> pages, I believe, will be included in the 6.19 PR, but
>> hmm_vma_handle_absent_pmd is already upstream.
> 
> Thanks Matt, I agree. There will be a few more updates to this
> series for 2MB device pages - I'll send the next revision on top of that
> support.
> 

I think it makes sense to build on top of v6.19 with THP support

Balbir
