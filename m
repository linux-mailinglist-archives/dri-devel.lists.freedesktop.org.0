Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E1AA9B77
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 20:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF910E117;
	Mon,  5 May 2025 18:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bRNhQpvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAC810E117;
 Mon,  5 May 2025 18:22:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwNHBzbf7PK5phhZXli7nauuFSnfeQLc/jr6dUxE+ffpe6035KzqLUJv1nbcx7PFOiuQdGnmweQ7bZejObmtLTgp5SqEPiiF1QX5m8FP9MTQvTPIQjev3lu+xNg/loz5P8bglgvjpDSDtsvck+VIZb3Po9xLXzyxfgXXuDdUSvmoEau41UN8fkcMSZZzhgYnmLp8d+lEKVEcr24ZAvCpbx4rdvK8sA3GVPFXRhIJCQk19+MPSwQIBERbNutGdl/e0sISENxHD5UbihdRTtUwVAEpORDqxkXCu/pSJaWSK+fWunqRxclgXc8VO7QSh/F3dg3n8OoVVgw9zLy5bhIhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+qNbdrct+4EmfQOSJkdiJ2VVO8NMT6y/UG2g0cItyU=;
 b=sHdt+2b7XsBeenZbxQIgIMNCM3gPccOMK5KEioAwiXzIL3/2hNGERAmfpifptvyPb2T2sLApBdZjrLnXcfD5M6PkyMOWx5Hid2QNx9uPLJX8vXk8rZ1F8mdHsUkO+bPC30kfmDiR7Smw1y3CpYqZIjocTm9RjFNNawo5g3xksVjDHO7RUrAotc5ZAouw61NpS9utEIf3nWp+PCK8pS0N2p6S6f8VdDvZAZ/g/h1vWrBgqOO7eBIKbBwEH1BNYgjhMBvaNpGjsHrso9yw9rVCFW+stCquHwNU6KEe8HNnsr73MIAXr0CjYoiO2W5uZwbzfhJOdbEtbZ0uvXpyBZQpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+qNbdrct+4EmfQOSJkdiJ2VVO8NMT6y/UG2g0cItyU=;
 b=bRNhQpvx7l2B3/uyAlNPqRNZgGNAQz4IHjRxGosyLyY3c2Hj5UiRwqMcT+po0R4f9lPW2UI+GnCJ1mcYFBWmXBBxhu24heDvSEBcJ2+Xt1bdN11WL4r7EqJAQUnQ+wyIi4RiOIfZ3CbJnd09NrIMjcfdTry8AiJdebdcdaQrfMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 18:22:54 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 18:22:54 +0000
Message-ID: <198c0271-1c50-413c-a4d6-f61262796874@amd.com>
Date: Mon, 5 May 2025 12:22:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Don't check for NULL divisor in fixpt
 code
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <20250428213401.752738-1-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250428213401.752738-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::38) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa4c7a8-b4e9-42fb-0592-08dd8c01da58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzIxdFRFUkxrWktsVmlrNlI4WGgwTUEzak1VeWh1VEI4dHBuZkJTQW84VGYv?=
 =?utf-8?B?dExvdTl2SmJITkF3RkMzNVg4Zm9UTmpGMVg3VmZpSGhIVE5DbWVST0VuQ0dq?=
 =?utf-8?B?TVZLcU9ESEkwdUNHNTFKdmhUTnlvOVFwNkw4MktMUDVXRXFhUGp1TTZ2bC9t?=
 =?utf-8?B?ckdkMFRSQXhUckZmeTBMUmRmWW5PZjA3dDRtYjY5eWVYSWsybUxEUmhiOHR2?=
 =?utf-8?B?bUQ4WjBodGdSUFphc0IvQnNIWmF3aGxHRHJqYzRjZEVtNmdNdFlabkVwZHEr?=
 =?utf-8?B?Y2RoWnJab0Fhb1ZTajlhWXA5aDB0b1p1OS9aNXlkTmp2a09PVUNUM2s0bXB2?=
 =?utf-8?B?cHVTS2w2NzV5Y01kZ0lDaHdHcUZyOEhmYUxnNjhOOTdoRXA1bGJxYnR3b0N4?=
 =?utf-8?B?S0pMakx4TnpRWmI5VCtjZC8rZEFGTjhZK2tvbUVhQ1NQbUhjRzNIU2Y1cEVn?=
 =?utf-8?B?dFkxYW5lZWYrWFhxYXVSbUlxUklhNzVuM0JMVTB0SFlKOEY2NmxXamRSbk5O?=
 =?utf-8?B?YWtISHZXSFp2anBJeGRaNmhvL0RNVTkwT2NaV08xZnN6Y2RLVnVxK0FRTEdY?=
 =?utf-8?B?Q3lISmprNko5QWxjVjJ4SXluUjBQcGcrdlVLT1kzU2YxeFZmUWRFRmhZVzVm?=
 =?utf-8?B?ZVRjUjR1UGVOWXlwb1BRTFVYWHk2YXlrV2NjTVJTL2dZWWMwR2xzWEhkeDFE?=
 =?utf-8?B?QXU3RzVVQnQzYmp2aHl5cFFqZmRaeENIUWJZeGVNeE5vd1ZXZ0Q3U2NsR2gw?=
 =?utf-8?B?aEZpK0VSdktzWlN1VHF2aVp4Y1FSVkl6Q0h4bkxSbXFGK21YNmxoejBZUDhP?=
 =?utf-8?B?UjR3T0lQMUcvRjdrZmRZaEtYZ0dMeGpaZjkveEVHaVduRDJPZTV6bVBXLzlX?=
 =?utf-8?B?N1g2RlZsT0UrWjI4SXNZeW5JVm0vNHRQY3pZNTZIdldTRkhyaVNSbElOYkxp?=
 =?utf-8?B?MEhOalNjMTlBSUdXQ1plV1Ewek9ZMCtKL1NZSGNLVnkyQmEwc2dhMm9USVIr?=
 =?utf-8?B?WlJ6UFR4QkI4ZGhsTWJqWWV6ZFMrK2JRUjBmNThaV204OThQODdWOXJDa29j?=
 =?utf-8?B?SDVEdTRCQU9qYWlFanlZK2VraCtJN0VZaHZvTGVJWkMvVUZKVTBQQ0hHNG5w?=
 =?utf-8?B?L1BPL293RHJDK0RNZE1SMUtkYmpYMWNZZGRaYnBncFo5NVF0TmpHenJ1QnZE?=
 =?utf-8?B?bkc1WnpLTHJuYTZtS1N6WHBMR1BuZW1DOU5pd3g1UkFaNE10cTVtZ1gza0gv?=
 =?utf-8?B?cEFBd0QzRGdDVjYyTXkrOFdBSVdVRzVTSFBHVVJlbHZ3WXBiT1lRMDlFYjVF?=
 =?utf-8?B?SS9LcnV2Rk96N0hNUklhZWh2dlBIRlhublZMdXB6L1VRNWZ0dDZqNEcvbWZp?=
 =?utf-8?B?OW5obXlHYWdnUWN0Yk9Vb3RId0JMNHhaR05JZkhkeG1peXZ2Z0V0TGxUTG1S?=
 =?utf-8?B?QnRaZTVkNkhtcFRrcWdwZk1VUE9UNFBpSmw3Lys1TnJhQUpleE1GVFhlVjdY?=
 =?utf-8?B?WkFvQ1ZFUGdXVXo4U3ArYjQwUTVaaGg4MjFPQmNsTVFXMGtEcWNBQzNrVDVs?=
 =?utf-8?B?cW9haDAvc1VLWngxQWJ0RmhHSjRxQVZMcTQvcFBURjNxZElMdG9yRXdZZUtu?=
 =?utf-8?B?OHZzVEI1ckc3RW13d0kzOXFzTHlqY2VpY1FDSlBuOG1MRUEzSnZRYVJzN3dz?=
 =?utf-8?B?YjBualNOM1lJYW0wcU4vVmpxVFVMVmljVnJDU0xrd25YaEVvanlyUVJjNHdz?=
 =?utf-8?B?YTRUaVY5VVlCU2dPL3ZoODNDblBheHdub05SUUcwalQ4U1pJbXM0N0ZBakg4?=
 =?utf-8?B?cXlUTUs5bXBEdGcxL0NoYlhzTW5HS3d5K3o2cGc5OFI2YkVWOFRiZXlLVzJk?=
 =?utf-8?B?NE80MG53RWNlcmFYSkxnUzNqT2tmTXp1SkNzT0tuQjQrcnVMNWYyRi9xMVdR?=
 =?utf-8?Q?lzamKyTV1aY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVNWRnFJQWxJKzYrMml5dlNMa1VZOXkwZ2NwOEJudkZ6cVpqeEhvK0swejBX?=
 =?utf-8?B?RE93SEtLNVVoUmova1czR04wTnJpSmJLaUFVeEFMcmhZZGFHaGZnT21pL2hH?=
 =?utf-8?B?ZWZjcEs2Rmc4RGUrNkx3SitSNk1HVTAzZnM0UjgzUStVMytoYzBpM3ZDM1kz?=
 =?utf-8?B?QXlOUm5VK3ZEM0JrL05DM3ZaYm5ZRkZoUnhwK3VtVms3K0FQRFBzckFEeVBu?=
 =?utf-8?B?WXhqK05aNVpFQ3B2NXRiZGRiV0MxeGhLSSt3ZnlQT2pCOVY2VUF4dUYwSFJY?=
 =?utf-8?B?VjFBcm04TGlYS3NmWG95V3JITk9xVEZKQjdYRU5ldXhJRUwzZFczdGhWb1RP?=
 =?utf-8?B?SDZoN2pqSGpLUEdFa2Q1NjEzTldSTnMzcHM2U1diK1R4aHRJU0I0dHFkWmlo?=
 =?utf-8?B?cFZZTXY5R0o0QW5LMnBVdmJUWE9sM1ZZQVlGZk50QjZXaEZEU1dZTTZZb28v?=
 =?utf-8?B?bkdKV3ptWFRNbnlaSU5Xem1CdHpIcTN4VENVd0x2NjlGTEJtWUErUlMvS3Nn?=
 =?utf-8?B?ZTg3STV3eDkyL0NNZFVwYWlGOERGS3ZNNkJHOGJqV3YwbDA5R3U1NlFLeFNB?=
 =?utf-8?B?T2pKRTVIc1YrbmZMSk96VGdHU29xbFJJZGUrODdlaFBJSmRQNXdWMllHeWI0?=
 =?utf-8?B?S051RlVyampDQmZYb2pBWnphbjRMZnVJM2djYXpzZlRWSjFsVkZlcW1XZ3dC?=
 =?utf-8?B?VlROaC8wRGZGemJqQUdTSWhEM21aQWlWSUhYaStQbXlaeGpVamZZL3lVSDBw?=
 =?utf-8?B?elVSMm1mVVFhdnRTNkRPNWQwSGMrVVFVU1d5Vkh2Y3BKZUJOVFhaL0pDVUdh?=
 =?utf-8?B?amNqM3ltTkdYQnV2R2ordVM3VmwyNm1heGV5bjVqYlVOM2tWcUR2YzNaOEts?=
 =?utf-8?B?dmFHbXU0YWllNVZCK0RGbXRUM1VnTGFFV3B2aHJ4RmZXVC9tYmhCMHgyd3N4?=
 =?utf-8?B?VDZmMjZCRk9OTW5RL2l1QU5YL0N5Qmw4VkVzMXBCbXJ2ck9jVi9WRFJwNHBV?=
 =?utf-8?B?aW9zODYwYkhxMWpQeWh4M0dIMGhFREVSMlpjNWdjRXZXWWt5S09NTUNLUnZO?=
 =?utf-8?B?Tmd4L3dUTjdyRUJkU2NQUmE3bmhqTGZZeFE0d2doZFBhMnBUcmpWR1hvUkV2?=
 =?utf-8?B?SUwyTGYrcEFQdEowWDBJcUtEQ2dkT1RXUnBoMnBuWWdHdjBEbi9RVmUyUHJH?=
 =?utf-8?B?M09DL0RzdzY5RVFCTUNyZkkzUHgvYzl3eUhRMmRSNVM5Rk5ENWJRTkQvaS85?=
 =?utf-8?B?QmlNS2JFZWN3cnFLdUV4cEZvTEV0Zi9DTjJoTnFhNExGRmVpOU5DNDZiOUo5?=
 =?utf-8?B?V3JFMUhNVlJYRk9ENnFobUQxcWVYTkNpSkM4ZkdJNnoxR2gvVG9ZNjQ3SnBY?=
 =?utf-8?B?a2VJSXk3NUcralZBUWFFTlUzU0lhODlxYXNFSms1VUdiT1N1bzEwOEVOQ1hB?=
 =?utf-8?B?L1lIQWpGUVoyZXZoYlhYQ1BKUStuU2dnVUVENWVwbjZNWEZYL2ZuZS9Ybllm?=
 =?utf-8?B?UHlHZTJFdWsxRFBTUy8vQUVNZjdBaWNvN3JyY1hyTUdmZ1RZZzFuUGVVdjJ2?=
 =?utf-8?B?ZjQ5dnQ3NEFYV2tDa00xVnVLWXIxU1EybzFIZUt2S1FkbVQwVXdzZDk5K253?=
 =?utf-8?B?eFZzeEZCOWhrS1g3MkVXb0cvNVZ4Q2JGRE1JdXJTYVZVcTVTMDBrUVprdndK?=
 =?utf-8?B?WTN6SUJpOURFS21zRm9rZjBRMmFhRDdhejVGUVJlRFlQc0FBMHQ1bXg4ZmVk?=
 =?utf-8?B?SmJDajhOTjlhM0dyQlRPZjI3OVRqVjV2SnBwQTVtWVFNc0FDcVZHZ0tqRXJV?=
 =?utf-8?B?K244M1lqb3lDSkZGYStlTzdVOURGOGZDbzRwQjNYTEk5NFl4VHIzUVdRTTlI?=
 =?utf-8?B?a3FCSWVOZHZBVUludHhKZXpoL0tteERpVWVSa21ueWhRTmpVRWtyU1E2aUJI?=
 =?utf-8?B?SW0rOUREdkY0bEIzWHRqRkh4akVhZW12UmxKNEtGUHJYYVNoZXZ4YXJxNGtT?=
 =?utf-8?B?QUt1ekh3dHRlWnRoSmhFTHQwUzZQc2tsZzdCVUFsSXozdEJJRkJJZHduQS9s?=
 =?utf-8?B?QlY5YVF4RWVsMVU2UVBpWkl3dnZLTmpNV2FsUHM4MVJrRTBDUjRyL1M4eVZz?=
 =?utf-8?Q?5N4poqxBQXNto8eneiEdiGo9q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4c7a8-b4e9-42fb-0592-08dd8c01da58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 18:22:54.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu69JKkr15B3b/Yw4WZsuAFl4WdLc0TNgs2aKvGUtgRXCa9UqSjZH5RcIR+PJBHUS7X1PM1jN6pELTh7dDCrhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/28/25 15:34, Harry Wentland wrote:
> [Why]
> We check for a NULL divisor but don't act on it.
> This check does nothing other than throw a warning.
> It does confuse static checkers though:
> See https://lkml.org/lkml/2025/4/26/371
> 
> [How]
> Drop the ASSERTs in both DC and SPL variants.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c   | 5 -----
>   drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c | 4 ----
>   2 files changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..452206b5095e 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -51,8 +51,6 @@ static inline unsigned long long complete_integer_division_u64(
>   {
>   	unsigned long long result;
>   
> -	ASSERT(divisor);
> -
>   	result = div64_u64_rem(dividend, divisor, remainder);
>   
>   	return result;
> @@ -213,9 +211,6 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 arg)
>   	 * @note
>   	 * Good idea to use Newton's method
>   	 */
> -
> -	ASSERT(arg.value);
> -
>   	return dc_fixpt_from_fraction(
>   		dc_fixpt_one.value,
>   		arg.value);
> diff --git a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> index 52d97918a3bd..ebf0287417e0 100644
> --- a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
> @@ -29,8 +29,6 @@ static inline unsigned long long spl_complete_integer_division_u64(
>   {
>   	unsigned long long result;
>   
> -	SPL_ASSERT(divisor);
> -
>   	result = spl_div64_u64_rem(dividend, divisor, remainder);
>   
>   	return result;
> @@ -196,8 +194,6 @@ struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg)
>   	 * Good idea to use Newton's method
>   	 */
>   
> -	SPL_ASSERT(arg.value);
> -
>   	return spl_fixpt_from_fraction(
>   		spl_fixpt_one.value,
>   		arg.value);

