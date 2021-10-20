Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588C43463F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 09:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CAE89D7C;
	Wed, 20 Oct 2021 07:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F87E89CB9;
 Wed, 20 Oct 2021 07:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/RmtdRguAJihKLDWu/gzmEYvsJ7Vjix1Fh0kPD1F62CojIYxVvoHgckNmv6klcj13sd+FO1r56K3bJ6bK2KWzhFmvWpKisGkBdG/J53EhF9r4hXz4flP67l4u7n9JhugmVasrCDcFPLn1XUSsJ0vCWcpDk6m2CaxvkkMBTSjye3ww/Q564PL64cL6jNPulvOMiNCyWBUrun9rTpL+k6FTq7bJRne3pYat16/SuqGYnTRfHoj6ucUECDs0GvwTsLhQm3d3o9pQB/FIQWVLHjEA27l44LCtZpzWHR4Ya2lH6N80n+UfGlbTPrqGYKYPNhWq39FYakhr+dj8Slv52Bjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0h9pEFbPa5hnZvsZDE7nPiuxfcEo/jxxJF9svtPoaw=;
 b=hfAELbBBZFuMj1uKpyj5eD2+LEZdqVjQsed9QK4o7bce9zIrJYK8N8dmiWwCxpM0IpkdNX8hjD15NziAWmn5WsFurUpkj3/r+x8zrxKcwKp0MtNRSYdnKCnNT7JS7LpBJa/Dtkprwg2onT0dGsCKrMz9ZWseSZsP6cRsT5NMWxiFkGxBm/uA8uCmy/lIMxxiCVbUxIliax2w1/H7Uu32ci1pz40KYwoxa+VNOGAByQ64OejKLxiAC50TL8KZGJYnqGnoGEuqihqw295bpuQ0tK9ie9pnbQ/rCD6w/TJOMNhMVWh2wc6GnzwY0mSJds+g1Fb2Avzoq5nBL3CmlK7brg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0h9pEFbPa5hnZvsZDE7nPiuxfcEo/jxxJF9svtPoaw=;
 b=QroUGGJF87Zd815V6jyL1lJqFNv1EO6WvF2LTn8o5OFyouKySlEDMc3Z1VHty+XgUtS2qtTsNMKxm3SGefj7WYtn/tzF23y5UDQHOSYmb4Edo/wkq9zBf6wCu+W+4FWMWdPDiVJqQ2face78QFFGVbTePyMbmWGuKCOMh7C6gW8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0111.namprd12.prod.outlook.com
 (2603:10b6:301:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 07:52:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Wed, 20 Oct
 2021 07:52:04 +0000
Subject: Re: [PATCH 00/13] drm: Enable buddy allocator support
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch, matthew.auld@intel.com, alexander.deucher@amd.com
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <976374b4-6852-15f7-fcbb-eb260fbd6409@amd.com>
Date: Wed, 20 Oct 2021 09:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::9) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:6048:8836:7968:5df6]
 (2a02:908:1252:fb60:6048:8836:7968:5df6) by
 AS8PR04CA0094.eurprd04.prod.outlook.com (2603:10a6:20b:31e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 07:52:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11324c7a-ef67-4c67-207d-08d9939e81f7
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01112FCABCC8A76EB9FD635B83BE9@MWHPR1201MB0111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZQq3l3p9+qhpx91dO9hVQUrjYw/YtVIhd3pIYXZeuyYVT67GxXkJOB7Zp3rfOCKJu43cfpIQ5DrjgZ1QFpsXWSaWIXbiY6kroAHIC1ItyUv9tTHaF3BN1aKXKFtd2uB8Yy2F1AsM+Ha/IJgZ/p78oChCfOrph30CWVXHirdRrvq26z3tCDFzbcXWUP8onu7O/lk9DP0pn8XLp0Qz2r5H7pazfZnZNrmbuIT/2oLXLd2gcnr2L1QV30rz0cCzNIhAh5V1UbwgBzCCKaYLLfrQ8w5vnW468jIEa7mb35BVufcKZKp+gO0yiYgOqWGMPaekeQsF51UP0hMgJc41Rs76UMgmKO85x4TeQsA9xX9asx9CR1ZQolhcLAehNuk27v/1TLjdKSC3aGWdnVASFa81VAYLLDdBTzg+9qaDX8Uv3EMgyTmAcgSGizTF6tMq4hcv9LOWFuYeMjZp5+6RGycyIFXLEC364Ld4OI/Ybddl7xTUInMe1KnXRlR3CeozfGk1JuQVYPUo+kOJ+FouhzTkEKtaddMlbwynlucMfgSVdEzhBP6vwassh5WugErFUAeJ9j6RjQIVTa4BdO6/Es+HKBhce1T32DTrB6OW1f7TYTsm4HT7Ttaaz4jdwaVrfcwwCM1QKII6pQDsIFRyOTCn3Xz1ehDNgVCEbNABA1X4mjr/L3oSHUnDXbLbpYg9iefHb7rOmPo2nn11LN33p5i5xF+XUfXAWhSQ0LkuvtQteJVA//K8QyqueI5rkGFGnJO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(66476007)(86362001)(66946007)(6666004)(66556008)(8936002)(2616005)(36756003)(5660300002)(186003)(31696002)(2906002)(38100700002)(4326008)(508600001)(8676002)(6486002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZoTThscVdoZ3N4ajhXOUpjQWpoMGJXcDFpK2hGWlUxeGk4OHU1M0VwVG55?=
 =?utf-8?B?eG4wNURwZUNmemNQMmEvTWl4Vk1IeTFZREc3aklzWURhK2VmOXpITlVQM0No?=
 =?utf-8?B?VnprWUFXTW5hbklLTitUbmxBeUhMbUNkT0VySUxNVXVsTEIwZGZOVWJOalNX?=
 =?utf-8?B?NTB6Z1JHVGNGbm45Z1VsNElEQnR1NGtoVUI0U0g4YktQYklmeDJOc2o2Y2o3?=
 =?utf-8?B?d1JmenFORFRGbGcwTWhzcmNtZmhLRUpuTWZFdUcvc1U5bDE3Y25ObEJGSjB0?=
 =?utf-8?B?L2o4b1RqcTRpcFNhZWdHcGYwdGFaVHlwRzZUcTBGM0tMUVJGZE5Gazh0SU43?=
 =?utf-8?B?UDdReHg0RHpVWUNDZHRhejRudmZpOTlVcE5BL2s1c2g0VmVYZE81WjNReklr?=
 =?utf-8?B?bUErcUlKRTZhdVdIV0dvY0VXSGlHdHpBc2pGNVczRExCV2crVDVHbFprMEZY?=
 =?utf-8?B?TEsvUXhWRGFIb0FGNUw0NC9wRzhjS3A3YTM2QVBhMWxDNk1RSGVackF5L0oz?=
 =?utf-8?B?eXV5My9XaVRZKytxWDR4Q0RncDZPYlJRTEFTMUJYYlZyZm51dmcyMGl5SFhK?=
 =?utf-8?B?eXdsRFdUUVZrVjhONWNWME1wZGI2RWsyMnhrM2c4U0tTK2Jkb2V0blQxVk1G?=
 =?utf-8?B?NFlQWnA1UVQ1OVRheUExdEY5UnlTbllFTFZNdWlmK0JNMWVJZktrdWdDc3J3?=
 =?utf-8?B?anFDbzlsWVpXQ1lPTXE2OWtkYk1hb3JaekFJZ1ZZelgxUlgxTklTK2ordWVH?=
 =?utf-8?B?SzUwbXBJQnBKamlUbkYyUnpiWVpXNm9YOUVtQUxLRFpBS056eGJud3FZa3B3?=
 =?utf-8?B?ZFAyVVM1aGY2RkVrRHA4bkU4TFRVSU53KzJXUmorSGpCSDN5RzhnbmNIYk9W?=
 =?utf-8?B?WUkzR0kvZUx2dVN4R1BYd0NnTWZnaThGUFl3cXlqVG1wQ2dBNmkrQ3JqY0E5?=
 =?utf-8?B?LzhTSHVaSzNmYXV3UU9ZdGh5QXV3SlVVNFJ3N0V2YmcrSy91UXdZckJyZm5v?=
 =?utf-8?B?TXBPSnBPQm52NlltZXNxY3VBSTc0VHE2clFDczFTMktsQi85T2tDYkZ6Wi96?=
 =?utf-8?B?Zy84YVpLVXNrYTFvWHlpRkYvalJQU1B1N1NzOWNSKzByUUsva2JPMlcwWUF4?=
 =?utf-8?B?U0ZkSEZEclNPUXRzR3RSVXYvMEFvUStWZTZrSDA4ejN2TGpHU1Q5R3VhWFFV?=
 =?utf-8?B?aTB4RGx2UzgvYXl1OGFzSS9MYWpQQzVvaW5nUysycFlLMnBLaWtpcVQ2Ulh4?=
 =?utf-8?B?Ukpab2tjKzVsdFh4NkY0OFVCYlV1RTA5RDN3dE5vbVczTzR1TkNPVkFwdmZn?=
 =?utf-8?B?aTJtSnByUkJYdkpLV1pyQURGTDBrMmdBemNpNFhLMzZ4RlNqWWNvd09oUk9m?=
 =?utf-8?B?aGE4THA5b1FpTzJzby9xeGdYTjNLckVMZVNrcnlPNlNOTksrQkFDRURSN1FB?=
 =?utf-8?B?YlplUGowUHY3cFlEMHNoRnNFcjZGMHU3SE1tRzdySTV2ZC9xVTdoUzhvc3Ns?=
 =?utf-8?B?NVRIZ0VPU1gvMHN5T0dpTlpoclZwNSs2eUZoVGFGUHVMazU4L1dvdmFsSzR1?=
 =?utf-8?B?N2V2di9OSWZuc2tzdGxlRGdDZk8yMVl1SmVvTHRDWHNVWnRyRE11dlNUQjhq?=
 =?utf-8?B?L2ZURDYwTEdYcWUvR1VYVDRmek1wMUVlOVRuQ2VjV0lvaktObEx4c3B3MktN?=
 =?utf-8?B?RnMyYjNWMmJaVGhlSUJVcS9TYW9STFl3K0xNZUVDRUpsV3ZCTHVRVjlRUHgx?=
 =?utf-8?B?eWZvTEJjNlBwYk5lbnc0Y3NrR3RFcTFhakM3cTVOY05ISUpzTFd4aU1MRDl3?=
 =?utf-8?B?ZE5wSkZNbGtqNkhmSG9JUnJRUGsrVEJQejhSQ0VSRHZ4cHpTT0xaQXliUXU5?=
 =?utf-8?Q?lI3CJMraSGACg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11324c7a-ef67-4c67-207d-08d9939e81f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:52:04.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJXPwPfl+T3NAZyhdIalHeSXpIIfDdymD/8ffW159oI1zTsGBQDO8r7E7X9CPyja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0111
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

Well please keep in mind that each patch on its own should not break 
anything.

Especially patches #1, #2, #3 and #10 look like they need to be squashed 
together to cleanly move the i915 code into a common place.

Christian.

Am 20.10.21 um 00:53 schrieb Arunpravin:
> This series of patches implemented to move i915 buddy allocator
> to drm root, and introduce new features include
>
> - make drm_buddy_alloc a prime vehicle for allocation
> - TOPDOWN range of address allocation support
> - a function to free unused pages on contiguous allocation
> - a function to allocate required size comply with range limitations
> - cleanup i915 and amdgpu old mm manager references
> - and finally add drm buddy support to i915 and amdgpu driver modules
>
> selftest patches will be sent in a separate series.
>
> Arunpravin (13):
>    drm: Move and rename i915 buddy header
>    drm: Move and rename i915 buddy source
>    drm: add Makefile support for drm buddy
>    drm: make drm_buddy_alloc a commonplace
>    drm: remove drm_buddy_alloc_range
>    drm: implement top-down allocation method
>    drm: Implement method to free unused pages
>    drm: export functions and write description
>    drm: remove i915 selftest config check
>    drm/i915: cleanup i915 buddy and apply DRM buddy
>    drm/amdgpu: move vram defines into a header
>    drm/amdgpu: add cursor support for drm buddy
>    drm/amdgpu: cleanup drm_mm and apply DRM buddy
>
>   drivers/gpu/drm/Makefile                      |   2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 251 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  72 ++
>   drivers/gpu/drm/drm_buddy.c                   | 704 ++++++++++++++++++
>   drivers/gpu/drm/drm_drv.c                     |   3 +
>   drivers/gpu/drm/i915/Makefile                 |   1 -
>   drivers/gpu/drm/i915/i915_buddy.c             | 466 ------------
>   drivers/gpu/drm/i915/i915_buddy.h             | 143 ----
>   drivers/gpu/drm/i915/i915_module.c            |   3 -
>   drivers/gpu/drm/i915/i915_scatterlist.c       |  11 +-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  91 ++-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   5 +-
>   include/drm/drm_buddy.h                       | 164 ++++
>   15 files changed, 1214 insertions(+), 803 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>   create mode 100644 drivers/gpu/drm/drm_buddy.c
>   delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
>   delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
>   create mode 100644 include/drm/drm_buddy.h
>

