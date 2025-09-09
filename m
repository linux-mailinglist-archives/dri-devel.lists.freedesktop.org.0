Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0720B4AA4B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 12:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C0610E6A4;
	Tue,  9 Sep 2025 10:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s5aPRzvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056F10E2C0;
 Tue,  9 Sep 2025 10:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVboebB02hQ360edBIjrNxRlReHlEWLt1qX6txnl3Ttq+LaD+AO+zF0CFqG7VbiACOmfgT+VxfgCrTkcn49Y1irvlEdnmkMdZ53RwNBaMssl4Z76et9dRR9cpj9uoLYCOG1arGLdxpUVQyrIJDTw70GVJTQ+hcAFNc+aF2uKbDbzHvyXPb0KA6YabKfumObg6iHxKOPt4Dj+E/BCoTcJU/CS2sJO1D6GQxO082bX3cec+1svIqJYOWg6mMUOpHPXZdEf4he8s/XCbXAL0nHgqPqypLwc/FBfbh2+M33NuFkNnJbypMmMZhUPgqGIOaicf6IiOPwrZsov+Wo6LZcdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ8wGXI71fzPwBkD1neXI0IcgOnhzzHrHsVTIXwDyhc=;
 b=uOm4+Rc0zSN7H5RAaMuKJ6COEOe9Mkh7uezl/xX6vU2szeSqNM+uOVQLata2sMsX0v+6Eml98dl5uDhc/JP66UZzHTEw/eSYGeVXd1+VQtn1hRlaYSBzDcR4LpihDioAPBB2P8qe8WFOk8AXxzzZqI4mP2NGUVwRcJPtNIZUi2CIaTl5g/G+uGTB0rbNh1TDhLuejLtqheKe7LZbDZ34x1NMVyJjvBi42cdR57xLZoaP2OxlNmrAUF2t9E2/wRo4oZvQjZxo+vF9QidJ6yytYtNKgOOmnqqg74UMRtHz7pal51ljrPbIiPG0pShTU/CKYer/xu1Anedn52YfIyXSYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZ8wGXI71fzPwBkD1neXI0IcgOnhzzHrHsVTIXwDyhc=;
 b=s5aPRzvQASADaBnpT5ELez9yX8FHLnDBwA8VOAPfpFayh85R+aBZqwnyjDwrrJpjGDx+OsCTwZqaBRIXQvSs2EpMbBu1jOUYwiznx/+0uqDFhlh5DSBW3wm6q+N78a+JdP/jrcP+7Ru/VoPjEr/zfa9mxILxQlrepXW5iE0mbhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:20:47 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:20:47 +0000
Message-ID: <acad6db9-952e-4ddf-9ecf-c108e9e680c4@amd.com>
Date: Tue, 9 Sep 2025 15:50:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: christian.koenig@amd.com, matthew.auld@intel.com,
 jani.nikula@linux.intel.com, peterz@infradead.org,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f9d975-4d79-432e-f039-08ddef8a8ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3RiLzIxSWJ5REJBWEpRM3YvNGJGV2VXUjB5N3FVT0hOMzNlWi9xaEJSVEV0?=
 =?utf-8?B?TFUxQ01PR0Jnb2ZzaFZJS0lhUmRVRFdScXpLb1I3ZCtINHlnTU1pVGFZV01j?=
 =?utf-8?B?Q05VbnkzR3hTeW13MEpnVjhsWi92WFFJaUE1cERsS2JBRHNFM1B4cVg0TjZ4?=
 =?utf-8?B?MUVrZXBoRE5qbHJjL3Bxa3BzeFk3MjMvbUZaeVRCTjdyOFB6VURMZklKZjE4?=
 =?utf-8?B?K2Fla3pNMHFyWkNXQ3ZwZmdubjNUeHBlZUVWS2pyc01Va1dPNUNKL21uc2s5?=
 =?utf-8?B?N1NRVGZKZy9ObWoyK3hyc0grZS9lWTIxRW53WFNxeFV0Z0ZRRS81d1AvN1c5?=
 =?utf-8?B?YUxsbkJVNEcwbjhHSk1EekFFT3BGaUQvM2FiaGlzcHlwaG5XYjZuaTZYK2dx?=
 =?utf-8?B?aGkvZnBtMlNmVFZlWTIyYURtZGhVYUdwcm13YkE5MnFIVXNwbnFkQjdBL2JY?=
 =?utf-8?B?dnJHYWxETUNIQjYwcWlvU3dHZzJ0VmRnVFpmY2VWRERpTXlrY3hhTVEvUlV1?=
 =?utf-8?B?cER5a3EyS21qS2FLZWV5ZGZPVnd5WkZxWGVSb29xT3pubndJMkJ3Wko4Nkxl?=
 =?utf-8?B?L2JTZGlJLzFIM1hTdGUwd0hZYWJEN1krZ29aVzN2cGtyN1NaaTZ4c2t0M1Fy?=
 =?utf-8?B?VS9LTmY5U2YyOGRFcTVOek5xN2R6bG9obnF0NmQyZHp2WDJsU2R6ZWtHa0FM?=
 =?utf-8?B?T0pJM0ViSFhIck1kN0lzc3NwT1ZFOU5yTGcyMldQOThzamZHaXo0VTdyWFRS?=
 =?utf-8?B?Q2ltSExpQngwZHNIMjF5ejFxbnk5UnM4WHJGbXZWOFpTRXFjeC9BUjRDT1Va?=
 =?utf-8?B?OFZ2V1B1ZjdZamNEUFRFRHc3TVhXUmplWHF5amhPUnpDKzlNTFNXelZ5YXNi?=
 =?utf-8?B?ZGw2NlN3K1RRNG9iOUhYTGFiQkZiWTkyYXdRdEttcVhBc1VhVnNZNy8wQW8w?=
 =?utf-8?B?ZXN0UUlVa29TdWV0YXlCTUZ2emJGUlpsUEtoUDlRNGFscVoxSjRIQ1owZlZD?=
 =?utf-8?B?TTZ5OEhzd3F4alk2dlFBZWZRMWtmc0hBeTJabFJMMXFoTGRWMjZFNWV1aTZk?=
 =?utf-8?B?Z2VkTjZDZ1BLZVp6SGh5QW1qVnMwY1RJMVNWaFZITUNkSHJYUS9VaktSNXpV?=
 =?utf-8?B?ZzFWVWxGVEhJWllaT0ppSzJlaHk1N0ptOXRDQWpsSnNDUlBQOHpBZktMMUk5?=
 =?utf-8?B?cXR0R24vQlROdzJ2RWZRclEza2t2QmF6MHMxMDcxY1N6aDN3Qi96Qkt5QzR2?=
 =?utf-8?B?bDg4aEtFMkZCanVDa3Y2a1ptdkc1UjF4QzRCWUJwOXNJbTY4c2J2VDJMRFNh?=
 =?utf-8?B?Skp0YVVuMjBpelZldXZKeDlYVUZiajJJTS9zcG91NFM2Z0YrWkl6Qmo5enFh?=
 =?utf-8?B?cHBpUG02cndlUHcwOEhCeXpYWVhvZnVzRGZvVm9HNk9xSTRGVVRTNThzVGhr?=
 =?utf-8?B?cmYySTlzMlk2YVN4bkFVWDcxTXl6aDJ3MXcySHFKZWd1SDNEWnY4R2RFSjY4?=
 =?utf-8?B?ZVVWRks1M1oyaXUxWitONFBhbTdBOE41Y0RSQU8rb2U4a09XcGZxZ3JzNGdr?=
 =?utf-8?B?REE0dVpOMHpEa2JIVlphcGhkUGx6RGNlTndQUXNOckJOODg3RVltSWJjL3I2?=
 =?utf-8?B?UmR3cS9ZMFlpRGRjaXB2QnY4THlmVkpwN0FsYW9wbWNaOS9EOGthdHFwbHJL?=
 =?utf-8?B?Z1AxQ2lUVWR4QWlSWmFTTXNoZ1JYNXBUVlhGT1AvdW54a0Y1bUd6eUMzb2tD?=
 =?utf-8?B?Q3RyT3ZMVHArMXhUS3dMZUcxQ042bDVvZ1FVR2x1STdSMGhFZld3VGdOZU4y?=
 =?utf-8?B?WWxVNVRSc3pKUzFkcDd1S3hoWFNqajJjb081UHVaSkhNS3RKbW5RMjIvYktX?=
 =?utf-8?B?OUFQLzdraFFLQTFzaVBicnRkRVRhMlFOZmpIWTBvSHFYMXVqemM4QmE0cFlr?=
 =?utf-8?Q?M3ogRHumMAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlzOGhuK2V5OW5Fbm9kWGZHL2QrRi9YR1prRlZqVGlmNWhRZUVPODU1U1pz?=
 =?utf-8?B?V1BQQnJiWGN5V1V6dmJEV3NzL0UxdWVEU0pzcjVoMDZBM0toUStQSENIRFBY?=
 =?utf-8?B?RmJXWTVrOFpvWXFGQUQ3UHl6QUNKc2VKbGkveFJXaDhRTnBSK2IvUllwWTlk?=
 =?utf-8?B?NFZUbnluWktzbmY0UjVDbmxPaTdUYUxsdVZZbDdRU0hJNGdIM2g3ZlJ2ZDk4?=
 =?utf-8?B?VmVPNGlxbjBkem1mc3U2WXVYU2owK054VytEQ2lNNHZveFAzYjRzZEV4RWRy?=
 =?utf-8?B?b1Rma01kWTNncTBhWjJHSGhuTjI1L056N2ZIc05VVnBuQUFlT0s3L0k4bnZP?=
 =?utf-8?B?Ym15anFEV3ZvT044c3pzWVBxbTAvSWRYRlRkV0RGTm9kMVNRaTIvT0hjdTZM?=
 =?utf-8?B?RmpFaUFZcmtvZTB5Y2ZsRFF3M1ErTEMzcjVUSUt2OHhvMnd6REtkM1pRdlNS?=
 =?utf-8?B?LzVtclk5MWRCajRwZlFyN205SnU4SU5kQWV2NGlENUtyZnJyTk9nS3NPaDhl?=
 =?utf-8?B?eUo1aDE3eExKOU5sclVoeDNpUWdWVGJBV3kxYjg0VlE5RGpJSVpRMjdsNnpD?=
 =?utf-8?B?bFhKV3YwQWI3akgwVmVvYStRRmlvdEtmRkl1cG9zYklZUTdHREFFQmRxTWFI?=
 =?utf-8?B?NlFIWnRPUUx3V3Z5eEVkWktqcDY0S2phUCtpK2k4NGxSTCtMSmF5aDROWTVs?=
 =?utf-8?B?eUwwVDF2T2c5enpjanR5UTl2cnVnSTNXN1JtSnA1OC8xTXg0WXhmVjVkeWkv?=
 =?utf-8?B?eExWaTQzWVcvWmNUNEtITFdsVlgrSmJCNSs1VE9lVkNIV1N4RXNvUHJ1QTQx?=
 =?utf-8?B?WW5SbDVZUGE4SEJyMWpaQjhZbFBYRDdhUUp0Tm5jOUVZak9aL3g0YzA2RVBR?=
 =?utf-8?B?YWxPZmIzVUN5SnlzaEVyUkxtVUFTNXREYnBCaTdmVUlBZUNMcUJCei9hR0tW?=
 =?utf-8?B?bUxJRGo3VFh1VGhvY2FlZkZFOFlPYmpqQytqOGhkQUtnL3Y1Nm1kR1c4azQ3?=
 =?utf-8?B?c001RC9heUdTbVRoNE85QmlIU2w0MGRKd0o3WTdSRzdQOEpuRnkvTHRXM1Jo?=
 =?utf-8?B?UzdCTncrWVJweGQ1TXErK0I1djNTUjBGUzF0WG1PV0J1dGJkTmdoWG5tQ0Zr?=
 =?utf-8?B?cEFaMzdqVnJqdFd5dkxuSm5OZXgwNHoyWURvYUxJWHBFZTVHT2lRUm5idDJv?=
 =?utf-8?B?Ym4rZ0pkajYrMVpWemxSSSt6dDVTcThmc1ZGNVBZR2FtdGNCNW9CaVFVNmNz?=
 =?utf-8?B?bWJXRTdQNkJRU1krQXpURW1xdjFhdjRuK25wL1hFWTVLREhYdnRYczlicEI5?=
 =?utf-8?B?cDEzY0FFSVJrNXlrQnRNQnBEYjBucUd1dk8ya2RlL2V4eGFiSFYxUWRzYko1?=
 =?utf-8?B?TkE0NzVSTGpOZG1RUEw3dEszaU1kYXhEZ1k1S21zditlVHNKK0Fkbi9KaXc1?=
 =?utf-8?B?MkRxOE5vbW5tWGRNRnNDSFkvR1NRNWR3TXdVOExPVXJaQ3huMWYvbXJsQWhi?=
 =?utf-8?B?UzNSN2pXRW9OSk8xTG90eVBhWnZSZlcxQ3pwVE1HRUlDTFZKWStHU2RBQWpO?=
 =?utf-8?B?Lyt0QlpsL0JVcmRiUUpLcmRDYkhHV3gyRDRSOWIwZHp4Wm9IUWJ0QXhCMklG?=
 =?utf-8?B?VGk4b1g3MnJ6V1NPSUo5NTRqVFlsWGxUeTJEemVVQjZkaFJXUUZjOEtIdzNR?=
 =?utf-8?B?cHVhbjNJUGt0MWFROWp5OC9hRkREdDZidXNmM21TQVNZK05kUW5VZHNiaXpE?=
 =?utf-8?B?bTNRSjJqeEFYQzRnWFdBS2syQkRxNmozYmlHNXBlNm1Td2NuTTVjaERKU0dK?=
 =?utf-8?B?QVY4blkza3ZhQ3MyWGVwTUdYZlJCbHN1SnZvZGFnSkttTzE4T2x6RzdNY3hY?=
 =?utf-8?B?alVMZUVUU0o0VTRWOXRJa1NTbjY2a0NKSWRFelcvaHBtQ2xvYlROTERtOENv?=
 =?utf-8?B?L2dJdlVjb0NEL0dNYUJTOVJYNEZlZkxoSFhFYyszdVowVzZUSm9TbXQ0S1Fh?=
 =?utf-8?B?MmMyWCs3NEUyWTF6UVB2SldOSHpFMnJFV21RbUhDVGhZQTQvdDlDR2x2M3Vh?=
 =?utf-8?B?RXFPdDRJbUJHUHVGekh3NHl2Y2RabXQ0VnBaVlRpcmhXOHlPaHBqTkh2S0lq?=
 =?utf-8?Q?TobGDde7Y9K6DA09E8p/8Lbhg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f9d975-4d79-432e-f039-08ddef8a8ab8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 10:20:47.0000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNcpKVTS4sdxsEVddQ1hO1/D27UlFTXz98IzXaBLQ9GdV9n9xjLSuG9UKbagr6O7+2V+SUq6LvnPLPkqjQLf7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469
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

Hi Matthew,

I have added a new performance test case in this version, Could you 
please take a look and provide RB.
It is important to get these patches upstream soon.

Thanks,
Arun.

On 9/9/2025 3:26 PM, Arunpravin Paneer Selvam wrote:
> Replace the freelist (O(n)) used for free block management with a
> red-black tree, providing more efficient O(log n) search, insert,
> and delete operations. This improves scalability and performance
> when managing large numbers of free blocks per order (e.g., hundreds
> or thousands).
>
> In the VK-CTS memory stress subtest, the buddy manager merges
> fragmented memory and inserts freed blocks into the freelist. Since
> freelist insertion is O(n), this becomes a bottleneck as fragmentation
> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
> with the freelist, compared to just 0.03% with the RB tree
> (rbtree_insert.isra.0), despite performing the same sorted insert.
>
> This also improves performance in heavily fragmented workloads,
> such as games or graphics tests that stress memory.
>
> As the buddy allocator evolves with new features such as clear-page
> tracking, the resulting fragmentation and complexity have grown.
> These RB-tree based design changes are introduced to address that
> growth and ensure the allocator continues to perform efficiently
> under fragmented conditions.
>
> The RB tree implementation with separate clear/dirty trees provides:
> - O(n log n) aggregate complexity for all operations instead of O(n^2)
> - Elimination of soft lockups and system instability
> - Improved code maintainability and clarity
> - Better scalability for large memory systems
> - Predictable performance under fragmentation
>
> v3(Matthew):
>    - Remove RB_EMPTY_NODE check in force_merge function.
>    - Rename rb for loop macros to have less generic names and move to
>      .c file.
>    - Make the rb node rb and link field as union.
>
> v4(Jani Nikula):
>    - The kernel-doc comment should be "/**"
>    - Move all the rbtree macros to rbtree.h and add parens to ensure
>      correct precedence.
>
> v5:
>    - Remove the inline in a .c file (Jani Nikula).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 142 ++++++++++++++++++++++--------------
>   include/drm/drm_buddy.h     |   9 ++-
>   include/linux/rbtree.h      |  56 ++++++++++++++
>   3 files changed, 152 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a94061f373de..8b340f47f73d 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -31,6 +31,8 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   	block->header |= order;
>   	block->parent = parent;
>   
> +	RB_CLEAR_NODE(&block->rb);
> +
>   	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>   	return block;
>   }
> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> -static void list_insert_sorted(struct drm_buddy *mm,
> -			       struct drm_buddy_block *block)
> +static void rbtree_insert(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
>   {
> +	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
> +	struct rb_node **link = &root->rb_node;
> +	struct rb_node *parent = NULL;
>   	struct drm_buddy_block *node;
> -	struct list_head *head;
> +	u64 offset;
> +
> +	offset = drm_buddy_block_offset(block);
>   
> -	head = &mm->free_list[drm_buddy_block_order(block)];
> -	if (list_empty(head)) {
> -		list_add(&block->link, head);
> -		return;
> +	while (*link) {
> +		parent = *link;
> +		node = rb_entry(parent, struct drm_buddy_block, rb);
> +
> +		if (offset < drm_buddy_block_offset(node))
> +			link = &parent->rb_left;
> +		else
> +			link = &parent->rb_right;
>   	}
>   
> -	list_for_each_entry(node, head, link)
> -		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> -			break;
> +	rb_link_node(&block->rb, parent, link);
> +	rb_insert_color(&block->rb, root);
> +}
> +
> +static void rbtree_remove(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
> +{
> +	struct rb_root *root;
> +
> +	root = &mm->free_tree[drm_buddy_block_order(block)];
> +	rb_erase(&block->rb, root);
> +
> +	RB_CLEAR_NODE(&block->rb);
> +}
> +
> +static struct drm_buddy_block *
> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> +{
> +	struct rb_node *node = rb_last(&mm->free_tree[order]);
>   
> -	__list_add(&block->link, node->link.prev, &node->link);
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}
> +
> +static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
> +{
> +	return RB_EMPTY_ROOT(&mm->free_tree[order]);
>   }
>   
>   static void clear_reset(struct drm_buddy_block *block)
> @@ -70,12 +102,13 @@ static void mark_cleared(struct drm_buddy_block *block)
>   	block->header |= DRM_BUDDY_HEADER_CLEAR;
>   }
>   
> -static void mark_allocated(struct drm_buddy_block *block)
> +static void mark_allocated(struct drm_buddy *mm,
> +			   struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_ALLOCATED;
>   
> -	list_del(&block->link);
> +	rbtree_remove(mm, block);
>   }
>   
>   static void mark_free(struct drm_buddy *mm,
> @@ -84,15 +117,16 @@ static void mark_free(struct drm_buddy *mm,
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	list_insert_sorted(mm, block);
> +	rbtree_insert(mm, block);
>   }
>   
> -static void mark_split(struct drm_buddy_block *block)
> +static void mark_split(struct drm_buddy *mm,
> +		       struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_SPLIT;
>   
> -	list_del(&block->link);
> +	rbtree_remove(mm, block);
>   }
>   
>   static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> @@ -148,7 +182,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>   				mark_cleared(parent);
>   		}
>   
> -		list_del(&buddy->link);
> +		rbtree_remove(mm, buddy);
>   		if (force_merge && drm_buddy_block_is_clear(buddy))
>   			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>   
> @@ -179,9 +213,11 @@ static int __force_merge(struct drm_buddy *mm,
>   		return -EINVAL;
>   
>   	for (i = min_order - 1; i >= 0; i--) {
> -		struct drm_buddy_block *block, *prev;
> +		struct drm_buddy_block *block, *prev_block, *first_block;
> +
> +		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
>   
> -		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
> +		rbtree_reverse_for_each_entry_safe(block, prev_block, &mm->free_tree[i], rb) {
>   			struct drm_buddy_block *buddy;
>   			u64 block_start, block_end;
>   
> @@ -206,10 +242,14 @@ static int __force_merge(struct drm_buddy *mm,
>   			 * block in the next iteration as we would free the
>   			 * buddy block as part of the free function.
>   			 */
> -			if (prev == buddy)
> -				prev = list_prev_entry(prev, link);
> +			if (prev_block && prev_block == buddy) {
> +				if (prev_block != first_block)
> +					prev_block = rb_entry(rb_prev(&prev_block->rb),
> +							      struct drm_buddy_block,
> +							      rb);
> +			}
>   
> -			list_del(&block->link);
> +			rbtree_remove(mm, block);
>   			if (drm_buddy_block_is_clear(block))
>   				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   
> @@ -258,14 +298,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   
>   	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>   
> -	mm->free_list = kmalloc_array(mm->max_order + 1,
> -				      sizeof(struct list_head),
> +	mm->free_tree = kmalloc_array(mm->max_order + 1,
> +				      sizeof(struct rb_root),
>   				      GFP_KERNEL);
> -	if (!mm->free_list)
> +	if (!mm->free_tree)
>   		return -ENOMEM;
>   
>   	for (i = 0; i <= mm->max_order; ++i)
> -		INIT_LIST_HEAD(&mm->free_list[i]);
> +		mm->free_tree[i] = RB_ROOT;
>   
>   	mm->n_roots = hweight64(size);
>   
> @@ -273,7 +313,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   				  sizeof(struct drm_buddy_block *),
>   				  GFP_KERNEL);
>   	if (!mm->roots)
> -		goto out_free_list;
> +		goto out_free_tree;
>   
>   	offset = 0;
>   	i = 0;
> @@ -312,8 +352,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   	while (i--)
>   		drm_block_free(mm, mm->roots[i]);
>   	kfree(mm->roots);
> -out_free_list:
> -	kfree(mm->free_list);
> +out_free_tree:
> +	kfree(mm->free_tree);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_buddy_init);
> @@ -323,7 +363,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>    *
>    * @mm: DRM buddy manager to free
>    *
> - * Cleanup memory manager resources and the freelist
> + * Cleanup memory manager resources and the freetree
>    */
>   void drm_buddy_fini(struct drm_buddy *mm)
>   {
> @@ -350,7 +390,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   	WARN_ON(mm->avail != mm->size);
>   
>   	kfree(mm->roots);
> -	kfree(mm->free_list);
> +	kfree(mm->free_tree);
>   }
>   EXPORT_SYMBOL(drm_buddy_fini);
>   
> @@ -383,7 +423,7 @@ static int split_block(struct drm_buddy *mm,
>   		clear_reset(block);
>   	}
>   
> -	mark_split(block);
> +	mark_split(mm, block);
>   
>   	return 0;
>   }
> @@ -412,7 +452,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>    * @is_clear: blocks clear state
>    *
>    * Reset the clear state based on @is_clear value for each block
> - * in the freelist.
> + * in the freetree.
>    */
>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   {
> @@ -433,7 +473,7 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   	for (i = 0; i <= mm->max_order; ++i) {
>   		struct drm_buddy_block *block;
>   
> -		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> +		rbtree_reverse_for_each_entry(block, &mm->free_tree[i], rb) {
>   			if (is_clear != drm_buddy_block_is_clear(block)) {
>   				if (is_clear) {
>   					mark_cleared(block);
> @@ -641,7 +681,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
>   	for (i = order; i <= mm->max_order; ++i) {
>   		struct drm_buddy_block *tmp_block;
>   
> -		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> +		rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[i], rb) {
>   			if (block_incompatible(tmp_block, flags))
>   				continue;
>   
> @@ -667,7 +707,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
>   }
>   
>   static struct drm_buddy_block *
> -alloc_from_freelist(struct drm_buddy *mm,
> +alloc_from_freetree(struct drm_buddy *mm,
>   		    unsigned int order,
>   		    unsigned long flags)
>   {
> @@ -684,7 +724,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>   			struct drm_buddy_block *tmp_block;
>   
> -			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> +			rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[tmp], rb) {
>   				if (block_incompatible(tmp_block, flags))
>   					continue;
>   
> @@ -700,10 +740,8 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	if (!block) {
>   		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			if (!list_empty(&mm->free_list[tmp])) {
> -				block = list_last_entry(&mm->free_list[tmp],
> -							struct drm_buddy_block,
> -							link);
> +			if (!rbtree_is_empty(mm, tmp)) {
> +				block = rbtree_last_entry(mm, tmp);
>   				if (block)
>   					break;
>   			}
> @@ -771,7 +809,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end)) {
>   			if (drm_buddy_block_is_free(block)) {
> -				mark_allocated(block);
> +				mark_allocated(mm, block);
>   				total_allocated += drm_buddy_block_size(mm, block);
>   				mm->avail -= drm_buddy_block_size(mm, block);
>   				if (drm_buddy_block_is_clear(block))
> @@ -849,7 +887,6 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   {
>   	u64 rhs_offset, lhs_offset, lhs_size, filled;
>   	struct drm_buddy_block *block;
> -	struct list_head *list;
>   	LIST_HEAD(blocks_lhs);
>   	unsigned long pages;
>   	unsigned int order;
> @@ -862,11 +899,10 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   	if (order == 0)
>   		return -ENOSPC;
>   
> -	list = &mm->free_list[order];
> -	if (list_empty(list))
> +	if (rbtree_is_empty(mm, order))
>   		return -ENOSPC;
>   
> -	list_for_each_entry_reverse(block, list, link) {
> +	rbtree_reverse_for_each_entry(block, &mm->free_tree[order], rb) {
>   		/* Allocate blocks traversing RHS */
>   		rhs_offset = drm_buddy_block_offset(block);
>   		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> @@ -976,7 +1012,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_add(&block->tmp_link, &dfs);
>   	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>   	if (err) {
> -		mark_allocated(block);
> +		mark_allocated(mm, block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
>   		if (drm_buddy_block_is_clear(block))
>   			mm->clear_avail -= drm_buddy_block_size(mm, block);
> @@ -999,8 +1035,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		return  __drm_buddy_alloc_range_bias(mm, start, end,
>   						     order, flags);
>   	else
> -		/* Allocate from freelist */
> -		return alloc_from_freelist(mm, order, flags);
> +		/* Allocate from freetree */
> +		return alloc_from_freetree(mm, order, flags);
>   }
>   
>   /**
> @@ -1017,8 +1053,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>    * alloc_range_bias() called on range limitations, which traverses
>    * the tree and returns the desired block.
>    *
> - * alloc_from_freelist() called when *no* range restrictions
> - * are enforced, which picks the block from the freelist.
> + * alloc_from_freetree() called when *no* range restrictions
> + * are enforced, which picks the block from the freetree.
>    *
>    * Returns:
>    * 0 on success, error code on failure.
> @@ -1120,7 +1156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			}
>   		} while (1);
>   
> -		mark_allocated(block);
> +		mark_allocated(mm, block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
>   		if (drm_buddy_block_is_clear(block))
>   			mm->clear_avail -= drm_buddy_block_size(mm, block);
> @@ -1204,7 +1240,7 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   		struct drm_buddy_block *block;
>   		u64 count = 0, free;
>   
> -		list_for_each_entry(block, &mm->free_list[order], link) {
> +		rbtree_for_each_entry(block, &mm->free_tree[order], rb) {
>   			BUG_ON(!drm_buddy_block_is_free(block));
>   			count++;
>   		}
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 513837632b7d..091823592034 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -10,6 +10,7 @@
>   #include <linux/list.h>
>   #include <linux/slab.h>
>   #include <linux/sched.h>
> +#include <linux/rbtree.h>
>   
>   #include <drm/drm_print.h>
>   
> @@ -53,7 +54,11 @@ struct drm_buddy_block {
>   	 * a list, if so desired. As soon as the block is freed with
>   	 * drm_buddy_free* ownership is given back to the mm.
>   	 */
> -	struct list_head link;
> +	union {
> +		struct rb_node rb;
> +		struct list_head link;
> +	};
> +
>   	struct list_head tmp_link;
>   };
>   
> @@ -68,7 +73,7 @@ struct drm_buddy_block {
>    */
>   struct drm_buddy {
>   	/* Maintain a free list for each order. */
> -	struct list_head *free_list;
> +	struct rb_root *free_tree;
>   
>   	/*
>   	 * Maintain explicit binary tree(s) to track the allocation of the
> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
> index 8d2ba3749866..17190bb4837c 100644
> --- a/include/linux/rbtree.h
> +++ b/include/linux/rbtree.h
> @@ -79,6 +79,62 @@ static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent
>   	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
>   	})
>   
> +/**
> + * rbtree_for_each_entry - iterate in-order over rb_root of given type
> + *
> + * @pos:	the 'type *' to use as a loop cursor.
> + * @root:	'rb_root *' of the rbtree.
> + * @member:	the name of the rb_node field within 'type'.
> + */
> +#define rbtree_for_each_entry(pos, root, member) \
> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
> +	     (pos); \
> +	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))
> +
> +/**
> + * rbtree_reverse_for_each_entry - iterate in reverse in-order over rb_root
> + * of given type
> + *
> + * @pos:	the 'type *' to use as a loop cursor.
> + * @root:	'rb_root *' of the rbtree.
> + * @member:	the name of the rb_node field within 'type'.
> + */
> +#define rbtree_reverse_for_each_entry(pos, root, member) \
> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
> +	     (pos); \
> +	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))
> +
> +/**
> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
> + *
> + * @pos:	the 'type *' to use as a loop cursor
> + * @n:		another 'type *' to use as temporary storage
> + * @root:	'rb_root *' of the rbtree
> + * @member:	the name of the rb_node field within 'type'
> + */
> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
> +
> +/**
> + * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order over rb_root
> + * safe against removal
> + *
> + * @pos:	the struct type * to use as a loop cursor.
> + * @n:		another struct type * to use as temporary storage.
> + * @root:	pointer to struct rb_root to iterate.
> + * @member:	name of the rb_node field within the struct.
> + */
> +#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)
> +
>   /**
>    * rbtree_postorder_for_each_entry_safe - iterate in post-order over rb_root of
>    * given type allowing the backing memory of @pos to be invalidated
>
> base-commit: 7156602d56e5ad689ae11e03680ab6326238b5e3

