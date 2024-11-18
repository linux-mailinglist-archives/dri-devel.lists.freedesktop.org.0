Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32D9D0C7B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 10:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12710E480;
	Mon, 18 Nov 2024 09:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DO6I+hAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114710E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9RamFscccuXbkfy9BMLgyzwFv3l4niMH2wuQNgjz5HV+QkMuFQ+2voSOiSdh7HUVUreL/+RTSiOMAzFIJSdtRVP/5nFnmSsRFbcOvG7JZk1VpBM9ihLe5c+o6a1ofos6u7jWjMXxcZMTtZEhVYEEAg1z5BslL2xtwFdMw6pVqF8C2r9fbFxUSvKbxVNQbHlIQDFMat2XlTJ3Go97yhYZOhiXeiXM33YWTDi3KuElDc7M9doSxR/e3Ur9n7zgL6k2nTLcQpt92o46mv6NYV20V1pMOB4EunJXaGAkPzrpBm2oUD0ljJupBXTP/8JMU0TGkSN8lIyGG7jRx75iU8eTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DwnwiIMr+Ft1z5dqwbTY5/VNn2nD2dPTQTrPEHQC+s=;
 b=Uq18C1LUJfWf6M4Q3PenB7EbxqDQbF63iiefkqnp6/Xt7/Lq5ZVeN9C/5LxflrqYDlccB03gVDZauKGxusR8G2dhZubuIS6mNbkddp2TnBTp4y15wO3j27PpsOzDpkRd2W67q/re3jIWxVHptf5tP3h+NOqBU3o9TSAv3y10OkhXeo0qFAXNRbwqfbcIXsxLvsDs6ISChYC+6IVM+MdSb6uQtFMM9bn/iFRrj79pSuvjxNzOe0sELcbpNxvUPce56VpFIN2UriRrq2Oxc7WtTXzF3uim0m+Ajp5tJU7ZtQWcLhf48JNZyIc2wfYJHGwg+jtDg9IC3PBPJdCFtGzwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DwnwiIMr+Ft1z5dqwbTY5/VNn2nD2dPTQTrPEHQC+s=;
 b=DO6I+hATLC71JAOj+tCpy4+tBMryrhyjO0rPihfrQ2KJ+SYQ+fwtJw14hDze3JGiG/PWZ0WoQRAu6gXcwPuy19iBvnPiY+om7Hr7de538lEDvXmLK2gQkgz1ZOx1QC/tO5fcG2qoP28/MTwFaZG71CqW4Ils1Mp/DzKg1wmzxFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Mon, 18 Nov
 2024 09:48:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 09:47:59 +0000
Message-ID: <f4991abc-3840-44ad-a65c-cd9120613fa8@amd.com>
Date: Mon, 18 Nov 2024 10:47:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fixes etc for fence merging
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20241115102153.1980-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241115102153.1980-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fde824-40ca-4d8a-892e-08dd07b6161e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUpiZEhOdTJEWW9iby9OZEpkaTlqRXc4NCtCemVJN21BRTd4dGc0N2wreW1v?=
 =?utf-8?B?RXhiTEp1TERnWU84ME5hM2dzSzVVNTdoTVI0ZWtVWC9KRVBPdE5SbVJieUlR?=
 =?utf-8?B?YU1vZU4zaXcwNjl2M05GQWRiY3l6NElNQmx2SXRsdUhobXEraUhGcnE2dDZz?=
 =?utf-8?B?RzJDR3U3WC9PRU83c2NFcnQzdmNCbHRaV1JUQm9TSGp4QVdWeFUrRGduMUZu?=
 =?utf-8?B?MlJ5QnY0dGdrQktRbnJsaHNKVTAyaG5FM0U3VTJaL0VjRi9vc2UwYy90SUQz?=
 =?utf-8?B?MWhUSGVmck5YdnFJRmdlZTNxQnYrRlVpU2xLd2o4VmVKUndCNWsycXZLK3c1?=
 =?utf-8?B?TlV3VU05eGUzYm5yWk1xdUJSekhPOFFrbEpOWDZ3ajIzWkFsd3hNMlFRb1dG?=
 =?utf-8?B?alovQmh3OHNsK3cyREpyYW5UZmlQTXZBSjVQQ0lhKzV3ZnJKZ3ArcVFtZStY?=
 =?utf-8?B?L0s3MDhwOCtpMnpGWHR4ejdGZ0hXSDRzVWlYSjQwaW9SbHNjQVQzTU9RYzdF?=
 =?utf-8?B?anE5N2RkRDJFYlJiTnRGZVpZVlk4dGt4MU9ET1UwWHBRVFRHNElJa0tuT3lR?=
 =?utf-8?B?cnY3Yzl1M0tiMjFCQ1N3UjVSNE1zcE93WXBWRnNHZVFSVDlCaFoyS0RUcmxR?=
 =?utf-8?B?cWZZWU40MXpISlRPeHJ1TGRFeHdtWm8zZjZaUGt6aDNJWnVRUHFEc1VMcUtG?=
 =?utf-8?B?Tll1dERGbm0yV2NneEZHVlY5SU95Ykxjc1htU1p5bzA5cFpUbEdJZFpiQ1Zu?=
 =?utf-8?B?d1BuYk5QVjhLUnJzdjIzbk83d3pNTzJ6YUZBTHFDcFFxcnB1MGU3QzVZaHox?=
 =?utf-8?B?bm5QeElHcFN1eS90d1o4NGxNcTAzcHhKUE1qZ1VCYk1qb3ZuR2w3REZGR3c3?=
 =?utf-8?B?L3NFdmtDS2dkc21tLzR0TklSZDA2S0lmaEQvRnBnc00xelM3MG9MblRxcHFP?=
 =?utf-8?B?bzBlRHNuTzM0UzkwZkJJMU5nVlR5OTVMeVNLVXhTY1JidS8zTXlTOFpZN3pY?=
 =?utf-8?B?c2EyOTVUMHcwRTZ2SlFvV0tMNE94QVdSTEVqMEtzWTRPbUQxNytLWG5TK1l5?=
 =?utf-8?B?Mm5kVW8xQVFTSk9jL0xCTjR0UDdoTGU4aDJVa0EvUUtKY1hWeG5lbTlDL2NI?=
 =?utf-8?B?OVVLV3Q5WmhGY1dGNmNPcjkvZ2RTdEZkVHFtN2Z5R2V3TEQ5YTNveXgxQkZz?=
 =?utf-8?B?VUJ0TTErZjMyVFhFOEhXZWd3ZUdWR3RYczl0Vlg0Tnl2UHJCQStTN1dLOWpD?=
 =?utf-8?B?QkdNYUhwRnRhUmUyR2NVSFJaR0pseDk5S1FXUGJmL3NWeWNLck85RThkMEIx?=
 =?utf-8?B?ZmJrU2I2U0V0LzZ1TFNXNjNwVHVqWHIrN3BWdGVFaGhVdGlBajFpaklTQUw3?=
 =?utf-8?B?cUpMUUI0U0RrS3pHMXpkaHVxUk5vNko0cDdDVzU1Y0Z4cmV0c3h2NWhRRFhL?=
 =?utf-8?B?ckVqRHZmQXQ3Wm44Ujd4RDdvWXNpdFc3a09oR2dGRm5pQ1hxMWYrRDloZ0M3?=
 =?utf-8?B?SjVRbjZxV2hKazlXaEh3SEVaYXZGT3FId3dxRWJwWGYzVVZFOHpsRWZZRG03?=
 =?utf-8?B?ODJqTStjQ2pXNEQwRjBlUHpXaS9yL2krQmRjUVpYSHJzbnZ4dGVqNTlpMkN0?=
 =?utf-8?B?TU9xWFFlc0poZ2pwOTkvOGJmZHhjVHdOZWxEK0R2U2p6QUVRL0xSenk0Qys2?=
 =?utf-8?B?bHF5UFkyQU5lQkZSRU9ZSFRRL2Zoa1MxQ0I1TitXblVyOFM4bkJFVVJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBSWkNDcEt5L0E2b3haT25YVEErckpoTmowZUJia0NReUhVYkJQMWl5eDJi?=
 =?utf-8?B?NG1WaUZsWmp4aGNhMGRyalFEQVJORnpiZlNiaWQ0cU02Q251aEp3UEdiei8v?=
 =?utf-8?B?a2ZJL0JwcjN0bk1iVHFrQW5GWURsZzRJd1FTcTRJWW9zY1ZQeWNRLzc2Qkc5?=
 =?utf-8?B?QkplNzhZKzZHalZrVVpiaCtMMnRaeVhZZUhSRGtRWmF6WEgvQkZzb3FVVG0w?=
 =?utf-8?B?TU1iY2xzMjJmNWVWY2F4Sk05T05qakR3M0xyQVhIV2NYMzNMMElha0hrN0Vt?=
 =?utf-8?B?cHVBbE9QQmhTa2h4ZzNKSFQzcEt6NkROTCtaejI2U3dtU3RISG9ua3Jpb0Nj?=
 =?utf-8?B?V3VxajQ5d2NjVlVpOWpYd0F3aHpKa0huanNXUlJjTUJJblBWQjNKM0ExZ0lC?=
 =?utf-8?B?N0cvRnFwdFUzMUh6QkFuTWZKZmJ0cGJ0azc0VGY3LzdHdzBaLzNOMEtkYXdj?=
 =?utf-8?B?Vkpxc29ZNWhkZURPRk04bW9jdnNwcE9aOWVnVFVMVVduSDh3TUVHR0VITzRl?=
 =?utf-8?B?K0oxOXpmTS9JeG9LK1cxVUlsTFVqdHBaM21qRFFNcEpqcHhLYVFmakh1V1Jj?=
 =?utf-8?B?dS9QbXY5SXBiRWZ4aTlCN2JyYVRaOUljY1pJZVlCZ3ZiYlNpUDZVdFJuYmlt?=
 =?utf-8?B?emlDckZKT2RzRzZRN05xNlBLYWhQeFhnVHluQmJSS25aUDZFVEtma2VsZ2RR?=
 =?utf-8?B?dVF0d0JaQlphQzRSdGlmcXVxOVVlSmllWU41RmdwZTY2eUNuQThHcjM2d0VX?=
 =?utf-8?B?Vy9HSCs5bE9kTGtDTzhWS05uWEszcWQrOTBvdUxDRFE1SjY5SlplbGQ1WFFh?=
 =?utf-8?B?SnZGbmQ3SGlRL0Nsa2wwc1I0ZTRaR1pzQUljRVI3VE01QXlvcXdOc2xnOVZm?=
 =?utf-8?B?ZENvSHpBcFBJaTBHdE5VSUhTSVRTeWZxRGxzZE1CUmdyYlZhcWVIdmVBUThh?=
 =?utf-8?B?R25VWWdicC9VREdHZDQxcFhqTTllSDJlQWs3RzRzUW1mcDYvY3c2MjcyS25B?=
 =?utf-8?B?WkxwS2Zodlg3TWRNbnZMWCtYU0lzWWJXWlBhU2pyOVNIeFpBZmhOZ3pQRVBN?=
 =?utf-8?B?a0JzMC9xYXFCTi91UGFtNlJLTGhnU3lDOHlYRytMMTBjcDA2VzJIdHNtMnc0?=
 =?utf-8?B?dzRKdWpEdDVrd2UybzA2eU44WXBEOGlWdFZsT2NzUDMxeWJVS3VLNytWa3Ur?=
 =?utf-8?B?UDVMQlE4eHdLRVZIYjhMSU1mc0F5Z3B4dFE2akZOTHZQVUprN2d2Qm1tSGZS?=
 =?utf-8?B?Wko0SGlaN2VrdmtNTlR3bzRmM21BMXNhWUVtdkRmbWJOaEpsNUIzaGZ0ZjRL?=
 =?utf-8?B?ZFVMbUNBUUxFdDQ4aTZ0dG1PSjVPOU9sclJ0UzRqbzRiclFIWFpzU09WUndV?=
 =?utf-8?B?SnhBbUx3VUtXM1dVaDkveXN4T0NKSm10bWUwMUNYa2t2dWZ1WkJGYm1jZGEw?=
 =?utf-8?B?aTJ0ejJqcWIzU2VITzFaNTRod3g1S1g4YS9jQ3l2RWI1ZVUvR2ZNeU1Da1ph?=
 =?utf-8?B?REVDMUhxVUlzMFF5bkxwUTVxS3AzV3FMakNLYWdNUUQ2Qkx3UDdVNjJvL2Jq?=
 =?utf-8?B?YmRMT2I5TzdYRC9jNmloWW1BcGdrT3dwNmJnVEVEaUJwdUI5YnVCUjM2WFZY?=
 =?utf-8?B?MS80cDZhbEdGekJRQmtPbXJOb01VNTROZjMxTlRLTnJLOTEwTWw5YUNMTUlk?=
 =?utf-8?B?QlErbTBpRFBYdFFxTVFvSXo5VmE4aWltQ1ZBRUx3VmlzbmFXVnljOWxjUVdn?=
 =?utf-8?B?QzZUSzBNY1R0T09rSlNHTU54OGNoWjMrOWdERUFsTVA3SWFEOGhrM1BIK2FB?=
 =?utf-8?B?QnNVS2dPZEt1VnhpR2lqeERXcnZ4SkZidVVnZTdYd1ZCdmx5ZFBVTHhxVmEr?=
 =?utf-8?B?MlNrWGVWcXh1Zk5OWDM4RU5BYXJxU200LzhSVGlnOGs3K05yVStDbm8vbDlz?=
 =?utf-8?B?RFFya2ZJMkZSYjNsTjJXREVqUHpNd1RIaG5WYkJ2dm4vQ1pFWGszMG8rSEJT?=
 =?utf-8?B?b1dOVXdGUjlmN0U0NXVNMHJreXE4Tk4vWUtGY3FIcW9GYy9ja0lvdnUyclVk?=
 =?utf-8?B?dm8zdjI0dEhudGUvek1PQXJ4UDJIYmZKTW40bTR1andldldhQi94MGdOa1hz?=
 =?utf-8?Q?upsY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fde824-40ca-4d8a-892e-08dd07b6161e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 09:47:59.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUHkkOcIS4vd2LLzSBRTO2VIXhrNsvjlXrX7LBN9OxH+TjS08UMcMgqFf91k4r76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
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

Am 15.11.24 um 11:21 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Consolidated series as an simpler alternative to
> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/.
>
> Hopefully fixes https://gitlab.freedesktop.org/drm/amd/-/issues/3617.
>
> First two patches are fixes followed by one optimisation and then Christian's
> and my selftest additions.
>
> Cover letter now because it grew to five patches.
>
> Please test and/or suggest more test cases to look at.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
series.

I've already pushed the first two patch to drm-misc-fixes on Friday, 
going to request a backmerge as soon as those land upstream so that we 
can push drm-misc-next as well.

>
> Christian König (1):
>    dma-buf: add selftest for fence order after merge
>
> Tvrtko Ursulin (4):
>    dma-fence: Fix reference leak on fence merge failure path
>    dma-fence: Use kernel's sort for merging fences
>    dma-fence: Add a single fence fast path for fence merging
>    dma-fence: Add some more fence-merge-unwrap tests
>
>   drivers/dma-buf/dma-fence-unwrap.c    | 137 ++++++-------
>   drivers/dma-buf/st-dma-fence-unwrap.c | 268 +++++++++++++++++++++++++-
>   2 files changed, 335 insertions(+), 70 deletions(-)
>

