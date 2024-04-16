Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987658A69FA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B9F112BF4;
	Tue, 16 Apr 2024 11:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="glkhf8wC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66CA112BF7;
 Tue, 16 Apr 2024 11:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOtq5MVdGAzyVHxeGqFDGdWcSFuO/0uzgu9SppcSnIhAQve/O+GmC96fm42O+MXqS4m93ZZZ4kqH4KU6DO0+87FtqhvCl19jxQyqaYGVyAjBpOwkGJR9iUWqGi+/5BXBVGJilzs7SKKc4bIsTOgggckxijml/qSkvn/oJx4qmrqlG8ikb+V8T1xnkJX8czDKHxuUdULDF+eIZeqceCYncRLdC+r/H4rkL4XGpC0goBHHPpSqSb0st//Z7SFWf8dPltuLn5dxL/yFWlcSy6o1+dQAwjlanQvgv038E+b8QkoF5SL+XEFqpERPZB8VxCybTp4oIupg319ioejjA4vqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmmwzQ2MjMJTY6mb7el6PxR81gTH3PCFxQUfzTXMJUs=;
 b=JiCZp4dpMY7/cfHSzNJjKi9HeAt9T/o40lXv8ZJsYCXWUGgw9cZfvHUZ0jsBdQYTmkzRckmUXABnyEV0R92pZJt5fdlw7Wbf0lHzcCN8W99Zlu8H86MDb8HwVwwkqs8Kkhe5W6hL8AIyvbg267JfccprCQXsB59qnzXtv1MIpmDn/18BOH8FDFCeHEYXGYK884kaLyDfRJ/t7CSymVw6eQaiWRj7hlp1EfF9qZhtDndlCVZjJ2s1FLs4DEBBMEDg2/vymY0kRxpDEoNvNrQ0JgyYatZuRg2DAjlxT8XyxUHVBKadoTL7UGcJ2oYKChOi+JsvpEVhoHO6nCzr2J8uDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmmwzQ2MjMJTY6mb7el6PxR81gTH3PCFxQUfzTXMJUs=;
 b=glkhf8wC4GFsqVSZ/j+Dcd+9whNxrqIP2Xb4HiIj+Wtt4MFJgd91PkBU3pw8l+IYVsENhqtbTlW14DTO7LHh+p8J8aZelSF6uS5LVWbONlxB9y8/EXztEuUxNu52eyPQPZ6T5XqfHUrHUtxJoq7Xmca/8iufj0FcT7/AjfYI5to=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 11:55:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 11:55:31 +0000
Message-ID: <bb679fc6-7890-4b4a-a8cd-8ae7ce087a9f@amd.com>
Date: Tue, 16 Apr 2024 13:55:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] TTM shrinker helpers and xe buffer object shrinker
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a554b2d-7b8d-4cd7-b0c2-08dc5e0c1d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQNZEoOl6v0avqATSt/H2lKo+wY2v7LoT4t9uA7xhX20dEuOAMLYZPZTawU5iuujpV2NZgcxwOnAYvtMkYTDUOYlYtf3GUbrp0yh/fVbV2cVk/9UTlqYPD1LRjWZIJ49XOSR39bvfO5cbf0ddVugWTMGuLqMt3QLOMQkkBcvxYa0Q2b5s+oHXnI8y8TDRPI+TKgv7aMrgzoLVf+RP44UrWqiNhaXZmYLetYu/3Fl3jNbUpmg3RuGYNPZ+g7RdFrC8ENkZVi8EzPliMgzh68XxIDTfy5KFrfmo1skGVXLzN8MoRrGsqvKgqBVxUleSwHmZ0epDnpW3ziPXL7ZqWCQEMJ1hZA0ZiNGYlYATXYYnZOb0iTQaGeVbNkSvcaQZZrshHFi3g1UQ/CTQ9OeRESPmG8GakSa8X4hRdybPRe8pdB6gAeOObY3dxb0on4wEdMWAJYKOsKSczU9bh/IS3+BIs7yt5sIE6qIpl0rbMx077YtJdlCACeAplT9rn1jxI4IW8iTqVLWJpReYD9wIle1l5pQ/rKa8MxGZBjxnM1yV6V3UmIcnaCswWJLllppWIBNX/etNqwlZfsoorXiUkG+vxoO8+1nv2IBR4yyoGgijXCy5xKnyezzf3m5eVpK+Khh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ltSFFyTzBxV256TE5xWWwxaEhkOXFtNkUwa2U4NDBHbWZsWW56SUR2UmJV?=
 =?utf-8?B?TVZPS1VOcDlhMnh1cjFTRGl3SmJIMTBPM1QvWEJrcmJqWnMrcFkxZU5NSnFZ?=
 =?utf-8?B?VDlacEg4endJSWpwMFh0QitWWkNPb2FQZHJROGFId0hBQ3Bhb3JieUpDdENH?=
 =?utf-8?B?TnluNDZsT0xpMjl4ZktRYXQraXRvd3YrUlNnZUEwbEVuTUFuTnpwbjFFSHZM?=
 =?utf-8?B?N2p4Sk12NHp4ZGFkMC9sZDAweEJWUjB2MFF5ZEhKRVlEU2Q1TDNlVnFkUmpm?=
 =?utf-8?B?KzZxdEpnclZzQUVmVWJ0YnA5ZnNENm5pSDBiVVBzUTJWRTF4RDhYaGhUQ2Rw?=
 =?utf-8?B?ZWJ4KzZrcWJUTEdhclJGSVFSRVB4UnFYS211Y2FFVEp0R0VXZnFlcXZEQ004?=
 =?utf-8?B?ZGZjMGI2SE5rSURPNXU2VTJuWnpMb054NWwvQ0lLMXltZkVWNk1OOFJuRnVt?=
 =?utf-8?B?aDM5bmZJSEpnRHBvL2dKRlR2R3lIazUwL0RneFVBZ2ZROUV3d3RiWTlyYkZV?=
 =?utf-8?B?WTU3MzlaM01CdE0raWlzcGV3OHZWQ1Zoa1IyVHppQmRWRExBM1NRaXFVYlZY?=
 =?utf-8?B?MXZ4UTJDMG4wcGJjd05iN2ZnOUFWbnBXOFA1MDVzdEVkc0dSbmF1TjJ4Lzk1?=
 =?utf-8?B?Nk9Xd1FWMUNvUkVGWldOVG5BYmdhOWV2Rkd4VDBXMnk0OTJYa3hVTXZ5OFdr?=
 =?utf-8?B?NkcwUnM3Wlp2aVcrbHdycUNOcWpZazRjNEVmd0ZoRnFDMnRXQ1ZLSC9YRDVt?=
 =?utf-8?B?WXNOcmRiVE5iWjhUUktHY1NQM2d6bEk4NCtFek12aWtaczdKcFBLY1BEbC9K?=
 =?utf-8?B?SkVkT1pIM2pTY1Y2QURIUHZET3BUaGNCZk9KTjRac0NySE4xd0hSTXpSQXM0?=
 =?utf-8?B?cjQ1R0QxUHg0RStOMjJoZkxUQk92ZWIvVVU1Y2dqcVY4SStDSmhHbmlDY3F5?=
 =?utf-8?B?Z0laNmdnMlpKRGxib2FENWtZSVAwcHl3RTlzamtyVitGRUE3R1o5NXZzWTQz?=
 =?utf-8?B?YW1nRHdoTTZJd3d6eXRaUTlLQ1hpTkRhUVp6THRFSy9HaE9sdjJ6MVFsclBX?=
 =?utf-8?B?N0RnS1M2aUQxVWlLdXNuTTc2ZnI2ci9BRys2ckhXaHljZko2cnlpcXRqSzNK?=
 =?utf-8?B?c1RFTEh6RURyeFpOL3hjV1IvMDZIcmZpc1dJaU5ibkR2RHErdTR6ZjJqMmta?=
 =?utf-8?B?eThWNmI0L05FUS9XYjdQdS9CU3lKNGowc1VNVHVqdE85UGgwamRxMXltQTRE?=
 =?utf-8?B?M2ZIL1NVVSsvazM0NW9XODN4c3B0aTh0STk2bm9hRUwzV1VVVUxNSUdsa1ll?=
 =?utf-8?B?S09FQVFHYnpDR0hXYUMxRDNYUnNQdHIwVWtFMU11Z3dzS21nUEpHTExaZ2lS?=
 =?utf-8?B?UXpPVUV0YmpnTzFFb2pjakpWWW1ObWMvenJ6OHh5MzQzbGlDUFJOZXNBSm1w?=
 =?utf-8?B?V1ZMaXZabkYwczlJbUh0U2l4WjlNRUhqZ3FTTmVBVmluaHhZU1NYdkMxMmE1?=
 =?utf-8?B?K2dXYXRjcnFOekE1aFUyTkNWeDZ0dUpxa0RzdUI3dHN0WjVrRUhsSUdvUWhB?=
 =?utf-8?B?YkZCc3VSeG15bDVMelVVbzhEd0pBS1hKNm91OHVUVHVBVXdtNktSckFjU0gy?=
 =?utf-8?B?Sy9SSjRnVmZSYTlRMkZsenJ4cURvYm80TnFvTC9IVGpPKzlGVVJILzR0bEN6?=
 =?utf-8?B?WThob3F4b2dPQm12L0g2MU9xeDAwNzdrK1FweGM3cWRMVVdTa1BBczRRdGU5?=
 =?utf-8?B?YmxBZCt6ZE5yOTk5OGFRd2djU09hWk0xWmY3SjVFeHhwVnNOVWtzVEJ0aXJH?=
 =?utf-8?B?bVlwZ01YZkNHUVJXMUlZVDZnSnJJZjBQTnRhZ2FRTDFSRU02TFRWNE5ZWkxK?=
 =?utf-8?B?NXdtSmtqbHFDQUFTT0FBeVlmNlBIcHBTZFAyUTB4ZS9HT2V6RkM5eWFTMURV?=
 =?utf-8?B?elhIUVBHVXR0N3JkdzBCT2tNVjYxTWFveDMyYUdtVjU4NmtPMGZmWWV0bzMx?=
 =?utf-8?B?RnI1aGpUekhGNnVHaW10Nkh6UDl4UW9ub3JPYVBFVlpiL20zNjVjWTl4WFRK?=
 =?utf-8?B?THZPeDVnMTY1WVo5djNrckUxRkdKVzhOcHY0RjBkUjRTMm52R1l1NHdRanNT?=
 =?utf-8?Q?U8fHt4ZLjdx/wqBo+BN8DD1/f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a554b2d-7b8d-4cd7-b0c2-08dc5e0c1d91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 11:55:30.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWL6TpO4O7DDDqCZqNG7HyVwCLbSCA9eaKVSlBzf2pUtZ7KaCoGsY62/2O9djqlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493
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

While patches 1-4 look good from a high level I still think it needs 
some prerequisite and re-ordering.

First of all make all the cleanups separate patches. In other words that 
ttm_resource_manager_next() takes only the cursor as argument, adding 
ttm_resource_cursor_fini()/ttm_resource_cursor_fini_locked() as one 
patch and then ttm_lru_bulk_move_init()/ttm_lru_bulk_move_fini() as second.

With that done I think we should first switch over TTM and all drivers 
using it to drm_exec as part of it's context object.

Then I would switch over to using LRU hitches for both swapping and 
eviction.

And when that's finally done we can take a look into the partial shmem 
swapping :)

And Felix is really (and mean *really*) looking forward to the partial 
shmem swapping as well.

Regards,
Christian.

Am 16.04.24 um 12:07 schrieb Thomas Hellström:
> This series implements TTM shrinker / eviction helpers and an xe bo
> shrinker. It builds on two previous series, *and obsoletes these*. First
>
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.html
>
> for patch 1-4, which IMO still could be reviewed and pushed as a
> separate series.
>
> Second the previous TTM shrinker series
>
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/
>
> Where the comment about layering
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>
> now addressed, and this version also implements shmem objects for backup
> rather than direct swap-cache insertions, which was used in the previuos
> series. It turns out that with per-page backup / shrinking, shmem objects
> appears to work just as well as direct swap-cache insertions with the
> added benefit that was introduced in the previous TTM shrinker series to
> avoid running out of swap entries isn't really needed.
>
> In any case, patch 1-4 are better described in their separate series.
> (RFC is removed for those).
>
> Patch 5 could in theory be skipped but introduces a possibility to easily
> add or test multiple backup backends, like the direct swap-cache
> insertion or even files into fast dedicated nvme storage for for example.
>
> Patch 6 introduces helpers in the ttm_pool code for page-by-page shrinking
> and recovery. It avoids having to temporarily allocate a huge amount of
> memory to be able to shrink a buffer object. It also introduces the
> possibility to immediately write-back pages if needed, since that tends
> to be a bit delayed when left to kswapd.
>
> Patch 7 Adds a simple error injection to the above code to help increase
> test coverage.
>
> Patch 8 introduces a LRU walk helper for eviction and shrinking. It's
> currently xe-only but not xe-specific and can easily be moved to TTM when
> used by more than one driver or when eviction is implemented using it.
>
> Patch 9 introduces a helper callback for shrinking (Also ready to be
> moved to TTM) and an xe-specific shrinker implementation. It also
> adds a kunit test to test the shrinker functionality by trying to
> allocate twice the available amount of RAM as buffer objects. If there
> is no swap-space available, the buffer objects are marked
> purgeable.
>
> v2:
> - Squash obsolete revision history in the patch commit messages.
> - Fix a couple of review comments by Christian
> - Don't store the mem_type in the TTM managers but in the
>    resource cursor.
> - Rename introduced TTM *back_up* function names to *backup*
> - Add ttm pool recovery fault injection.
> - Shrinker xe kunit test
> - Various bugfixes
>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
>
> Thomas Hellström (8):
>    drm/ttm: Allow TTM LRU list nodes of different types
>    drm/ttm: Use LRU hitches
>    drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
>      moves
>    drm/ttm: Allow continued swapout after -ENOSPC falure
>    drm/ttm: Add a virtual base class for graphics memory backup
>    drm/ttm/pool: Provide a helper to shrink pages.
>    drm/xe, drm/ttm: Provide a generic LRU walker helper
>    drm/xe: Add a shrinker for xe bos
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
>   drivers/gpu/drm/ttm/Makefile           |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++
>   drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
>   drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
>   drivers/gpu/drm/ttm/ttm_pool.c         | 391 ++++++++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
>   drivers/gpu/drm/ttm/ttm_tt.c           |  34 +++
>   drivers/gpu/drm/xe/Makefile            |   2 +
>   drivers/gpu/drm/xe/xe_bo.c             | 123 ++++++--
>   drivers/gpu/drm/xe/xe_bo.h             |   3 +
>   drivers/gpu/drm/xe/xe_device.c         |   8 +
>   drivers/gpu/drm/xe/xe_device_types.h   |   2 +
>   drivers/gpu/drm/xe/xe_shrinker.c       | 237 +++++++++++++++
>   drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
>   drivers/gpu/drm/xe/xe_ttm_helpers.c    | 224 ++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_helpers.h    |  63 ++++
>   drivers/gpu/drm/xe/xe_vm.c             |   4 +
>   include/drm/ttm/ttm_backup.h           | 136 +++++++++
>   include/drm/ttm/ttm_device.h           |   2 +
>   include/drm/ttm/ttm_pool.h             |   4 +
>   include/drm/ttm/ttm_resource.h         |  96 +++++-
>   include/drm/ttm/ttm_tt.h               |  19 ++
>   23 files changed, 1683 insertions(+), 91 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
>   create mode 100644 include/drm/ttm/ttm_backup.h
>

