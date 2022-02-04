Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E47F4A944B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 08:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72FA10EE97;
	Fri,  4 Feb 2022 07:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A531110EE97;
 Fri,  4 Feb 2022 07:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXjZjvzQrs7zu+1LDTvr0CVrWYZxhAqHsMh6RuZPwszKTojWGpgR/Jw1Ho0vLr+XK3iXMGmadUB7QudvmZ8VIOJA5Jn3iNNawKRmtB4rXhVWRjTh0DXmRSR6SksPxg3pX1X+LZ6Lr6QhV2WCIqXrREWAGCmkh+bK+3OOfOl1RPFDXwa7V1H3h2Tq484Iqe+MsvTAjOxGJVtiKinIWYiBuuxAorPV+AQIAQdQ15ROqnv0IP/wEqtLMXsLEZ6PckZ84YboX0GneNQzqrMUgHwVdduVVa5MtoKmW6xHhV+4qiWga9sEiImA5F+YWdzLqCWj6yXlYJDPMFyh3DvMB6dCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Bx7jT6Mtr01zod6tc1ZjoPLdynZgE7sRMfJvY3svbQ=;
 b=HRAUF5I7rYPd2ngEp6YTKkPojH7ux0YinOKBGf7rxCKaQ4AuJKhy6k7MPGiEflly0OK5gBbfeuL+5lm+yDBduhtqHXqJP6uDJWQwdB8jIrFbrdFhd1lPo/S+mhfKUu6yhprExA3AHTw9NtVrgLro0e9zN8/oufruGTVstCQqHxgGi8Id0KSdNk37uKzKPshoqBRQgoRdA+QRRSHoHDo+Uu+3t6rNF19yxTwK6X2zjSzcADxQcyFu/E/8VkTUQLvYmltbz7m0nQt0NBx9mb20nndqV4MnXjntdeU06jlxwNrqIRHp5FfeCQhYI2CPaGszGck9U5a/DhUMzR5vUDkplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Bx7jT6Mtr01zod6tc1ZjoPLdynZgE7sRMfJvY3svbQ=;
 b=RCYGUgfFqAf9Y7AFowRRxuvycl9lzrFrdajXlie0+geAi591RzR9N2wDrRVIulzVkkkl04Cs2UxhjMUNWFSHgfviH2L8UhWISVu0WhxV0E/wbfEuO7MI+HIQwFXpZQO9Rzzm9T5SuIzMEIn4Pidg4Lt1uqJA75ftW5rsdabtvdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4534.namprd12.prod.outlook.com (2603:10b6:208:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 07:14:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 07:14:04 +0000
Message-ID: <c76050e6-6bbc-bccc-01df-1825ecd29387@amd.com>
Date: Fri, 4 Feb 2022 08:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix recursive locking warning
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20220204031139.24717-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220204031139.24717-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42c1e273-3999-42c5-97fd-08d9e7aded12
X-MS-TrafficTypeDiagnostic: MN2PR12MB4534:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB453406E6569A4699F31F5E1383299@MN2PR12MB4534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ry6bw0j/JyL/LABtWcZx1ekfI1K9Cgu6QSL8RbYFvWGiaWdfNGYmjkfeWmpyu1Lj4ayNNEAQsH8Yti58Be7AfujOhziPnqoO+v+iejwbxI+/ewGzrxKnXkifndbe3orh/fkZiiqMOVhxb2RtFnGpNAyySZx2jgOZ39jv+9XIfNsJTrcvTli6yCSU08ROyEUPa+Uklas8WD7CtpJBXi9xJWxbAjg+P49r3UGxrnZH9oWVjwBCsmp10tlSIRBKd96pfoz/SRpLwstlt/BLu3LdbIZuqcDC0A0VT/SNq+JtLBGD+ffJdJKyHlLD8QKtr76fn/AmTlLHF6D5K+jD6kmxljlyT3xnzwA43uIJg6BpeKjbcIgdAM1u2rD56fwjC8SBnGYNDQubTmzADBhTFWYu4c6Pf02UoW+Aq59KEHRulwBH932vgiwR6LBJmpPESvgodltkj9VPOb7wBCqooV4TdT8zRR1kargkSchC7xeQFfvCcJwWfI20zQdfsPMj517sFA7NY9tuOwTmFm2I8of2sA0r5RXmsvv4kJYcvB5XwWF6LsW9DN3DMUn58MDBAE06glLrEs0O+8wiRZRUhe+9i9i6UNrzX0zSwmctWewcg7ftjPpd1CmUv4ckn4kKZSrA1U2fr4HY1lcv5vRMDkMKD1G6dKxI9bvN2c7GHAfqN03RMqGVlRnJOg0viKQ2pWfHHq1teFqRPSGifvKl5xtd4TiGiJ7Fvj2tCTJF0Sk9hsWMOPGoMJNO6pixlxc8HzS8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(31696002)(450100002)(2906002)(6666004)(66574015)(36756003)(6486002)(31686004)(508600001)(38100700002)(26005)(186003)(86362001)(6506007)(316002)(2616005)(6512007)(54906003)(66476007)(8936002)(4326008)(8676002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RitUTmJwRFpYTnhXbEZZWVNCOHFaQi9tSkwvdm1uZ0NHSWRWbUZWemV5S3Zz?=
 =?utf-8?B?UmxOcUNrbVF2U0RaVDVPTTdQNEFpS1l4cm1lb0JST0cwY2JRQUE2RmZScDBR?=
 =?utf-8?B?RU1lMDBETzQwTHc2RVJIRFRFL1kxYWpMQWJJaEVJbktoUmNnSDU4eWd1TVNT?=
 =?utf-8?B?MEdpeWJQM0R4WXF6Y3FtRGhRakpvYXpLUkg4R2g5Sm1iL1ZTVXc5N0ZNVWtD?=
 =?utf-8?B?Q0xYN3JRRUlVVnVlV3QxNW9YN1RMYytvaXNzSmJveGw1WnN5WndhOWJqaUtD?=
 =?utf-8?B?NE45alUvYzl6UjhlNW84T2NKeElXUWdVQ3U2aGpncU9sWE5jelUrQnRUemd6?=
 =?utf-8?B?RFl0cFEwZnltdnhlQ2wwWEpDMytGYzl4Zi92Q21xSzk0UGZtMzBtSVdKZkE2?=
 =?utf-8?B?ODE2ZzB2aXRhQzNoOEpNVGhLTG5iMHgwYWdEeWQyTWNwMU9wc2MybW9FU0o2?=
 =?utf-8?B?eDZRVTZKQWJrWVdKemxLdDhlOWh3MS9uM01zUDNRRng4YnYvTkg3RTBLTDJP?=
 =?utf-8?B?VmpZamV6MTBFWGVvQWxrZnJaODZ4eDlOMU5lMnE0cWFsbnV1bkkvbDV0ZlNE?=
 =?utf-8?B?RTltanl1c25VNUhBQ1NOeEFCa0NycmVwK29lUmQ5cFltQXRaUFlyZ2JQYjVQ?=
 =?utf-8?B?ZStNeE82OURYQkJDcFRUOGloRldzQmljaXlMNHhEem1XeXFZektOR0cxNXR0?=
 =?utf-8?B?RGFPOXNwSWFwM0hPY3lTZVMvVERhZ1J3ZEtaaFArSlU2aVJFNkVRckdPMWJ3?=
 =?utf-8?B?YlVEZUFLM0dNL0RzV29OYjVuVHgvTGl1U1VxYk01TUdLUlRqb3I3cXFxWFZG?=
 =?utf-8?B?a3A0QlJjSlZBWFVwVWZYV0NUNEhLOGQ0eEg2bWZoMDV2cUkxSlF2WHZKNVRV?=
 =?utf-8?B?TlBCK2FWanYxeDRhYTBXVmJRdFhDbTVXNk80QS8rM3Y0ZmdyM1RUS25XRTRY?=
 =?utf-8?B?SGNjTEdJTWtrVE1LRkk0QVE3WlEvOVhXVkVyU2RwZFNETWlpRStFemhTdjR5?=
 =?utf-8?B?dE1NUHkzYXAzRnV5SG1BUVF6VTg1WEI5bmQ4S0pWTWhYZkRGSm4rL01FQWZG?=
 =?utf-8?B?OXBGMjJyck5maWpjZVlqTnlybmI1dklwS1dKckwrdHErcVF2Q24vZktWZGl4?=
 =?utf-8?B?bzdmTzF3UHQvU09kWWd4RzdtcnJZZHRZU2RCcitEb2QxcEhsUTM2UlJwNllZ?=
 =?utf-8?B?bDFWRTJMYzJDU3J4QnB1eG9UM2JRNDFVaE9IakdnZy9CSTJUNURhRGJxbkdQ?=
 =?utf-8?B?bThkR1Bmb21rdW1rRWNzZFVtblZKaGdRR0pWWUFqZmRIWjkyampORUZ5VS9N?=
 =?utf-8?B?WjdIOW5wUGI3dUY5MWpCeWUzcEhrdE1DUzBCekt5ajZqZncwLzMzSjVka3FV?=
 =?utf-8?B?eUp1Q3pkMUtJSS9XaTVGczFiK3NDNEZ4OCs2a2ZHL3BGdEVmK3lDUnMzVzNt?=
 =?utf-8?B?akxkMGZGQ3R0bVdERDFaNDNMZHVNaTdvUFY1NzdvLzJCaUVxZy91OWF1SFRX?=
 =?utf-8?B?UDMyY2wydUtCa3cxdGhycHA5U3ZFZ0RVdm0yN202emgyZW1YZzJoOXhZZWZw?=
 =?utf-8?B?QTJ4OERKdStGSktYbnlKVlM2bXpIeUNRVUo4dC9Kcnp1cEUxbFgvZWFBdjkr?=
 =?utf-8?B?OUtmWFJsdmlObjM0VitQWkRuZlpqa0ZTMUt5SEhBZC9IZG5CU3F0Z3lyMlRw?=
 =?utf-8?B?bUJjY3NVcHZNbDRyQTFRcWFEMTBBT0R2WUZPVE52bUN4L1VzRFhRbmhBV2RK?=
 =?utf-8?B?K1UxVFlGc3JDc1dPMGdqaS8yb1pES0h5QTlpb2JnWW1MalpNeG53UktrZzF6?=
 =?utf-8?B?ZUJtczZEYlU2eGJYSUhpcktZS1Vickpzd3I0NVpHSnhoTUJmRGJJZEgvQk4v?=
 =?utf-8?B?VXJaQ1VYc29iZFk4V0c5YzljTXo0Yi9qS1hNbzRNOVdQYnBpRXdxRVRtWkRT?=
 =?utf-8?B?anEwSHl5OFBmUTdiTHF6N2xmaGh2WnFDc1gyaUpaV3dBWmViY3RJTC9uWERa?=
 =?utf-8?B?STV0bHVSbHZMK3MxUWR3QlJSeDVmaysyWWFpU1o3bDRwN0IzR29xVERQU08x?=
 =?utf-8?B?b3c5M3VaU3BPRlR0dmZucnhMQjlDeTBrNXlBa3N0Tm80NjFmNFZ5bG5pbHBU?=
 =?utf-8?Q?osNA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c1e273-3999-42c5-97fd-08d9e7aded12
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 07:14:04.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA4XXH5nBLbrXklWLiO9PTse6bwa54Zpt8ARQ1qoVcmVlUR4YPLg7KfEHH3vDN6k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4534
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.02.22 um 04:11 schrieb Rajneesh Bhardwaj:
> Noticed the below warning while running a pytorch workload on vega10
> GPUs. Change to trylock to avoid conflicts with already held reservation
> locks.
>
> [  +0.000003] WARNING: possible recursive locking detected
> [  +0.000003] 5.13.0-kfd-rajneesh #1030 Not tainted
> [  +0.000004] --------------------------------------------
> [  +0.000002] python/4822 is trying to acquire lock:
> [  +0.000004] ffff932cd9a259f8 (reservation_ww_class_mutex){+.+.}-{3:3},
> at: amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000203]
>                but task is already holding lock:
> [  +0.000003] ffff932cbb7181f8 (reservation_ww_class_mutex){+.+.}-{3:3},
> at: ttm_eu_reserve_buffers+0x270/0x470 [ttm]
> [  +0.000017]
>                other info that might help us debug this:
> [  +0.000002]  Possible unsafe locking scenario:
>
> [  +0.000003]        CPU0
> [  +0.000002]        ----
> [  +0.000002]   lock(reservation_ww_class_mutex);
> [  +0.000004]   lock(reservation_ww_class_mutex);
> [  +0.000003]
>                 *** DEADLOCK ***
>
> [  +0.000002]  May be due to missing lock nesting notation
>
> [  +0.000003] 7 locks held by python/4822:
> [  +0.000003]  #0: ffff932c4ac028d0 (&process->mutex){+.+.}-{3:3}, at:
> kfd_ioctl_map_memory_to_gpu+0x10b/0x320 [amdgpu]
> [  +0.000232]  #1: ffff932c55e830a8 (&info->lock#2){+.+.}-{3:3}, at:
> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x64/0xf60 [amdgpu]
> [  +0.000241]  #2: ffff932cc45b5e68 (&(*mem)->lock){+.+.}-{3:3}, at:
> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0xdf/0xf60 [amdgpu]
> [  +0.000236]  #3: ffffb2b35606fd28
> (reservation_ww_class_acquire){+.+.}-{0:0}, at:
> amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x232/0xf60 [amdgpu]
> [  +0.000235]  #4: ffff932cbb7181f8
> (reservation_ww_class_mutex){+.+.}-{3:3}, at:
> ttm_eu_reserve_buffers+0x270/0x470 [ttm]
> [  +0.000015]  #5: ffffffffc045f700 (*(sspp++)){....}-{0:0}, at:
> drm_dev_enter+0x5/0xa0 [drm]
> [  +0.000038]  #6: ffff932c52da7078 (&vm->eviction_lock){+.+.}-{3:3},
> at: amdgpu_vm_bo_update_mapping+0xd5/0x4f0 [amdgpu]
> [  +0.000195]
>                stack backtrace:
> [  +0.000003] CPU: 11 PID: 4822 Comm: python Not tainted
> 5.13.0-kfd-rajneesh #1030
> [  +0.000005] Hardware name: GIGABYTE MZ01-CE0-00/MZ01-CE0-00, BIOS F02
> 08/29/2018
> [  +0.000003] Call Trace:
> [  +0.000003]  dump_stack+0x6d/0x89
> [  +0.000010]  __lock_acquire+0xb93/0x1a90
> [  +0.000009]  lock_acquire+0x25d/0x2d0
> [  +0.000005]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000184]  ? lock_is_held_type+0xa2/0x110
> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000184]  __ww_mutex_lock.constprop.17+0xca/0x1060
> [  +0.000007]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000183]  ? lock_release+0x13f/0x270
> [  +0.000005]  ? lock_is_held_type+0xa2/0x110
> [  +0.000006]  ? amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000183]  amdgpu_bo_release_notify+0xc4/0x160 [amdgpu]
> [  +0.000185]  ttm_bo_release+0x4c6/0x580 [ttm]
> [  +0.000010]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
> [  +0.000183]  amdgpu_vm_free_table+0x76/0xa0 [amdgpu]
> [  +0.000189]  amdgpu_vm_free_pts+0xb8/0xf0 [amdgpu]
> [  +0.000189]  amdgpu_vm_update_ptes+0x411/0x770 [amdgpu]
> [  +0.000191]  amdgpu_vm_bo_update_mapping+0x324/0x4f0 [amdgpu]
> [  +0.000191]  amdgpu_vm_bo_update+0x251/0x610 [amdgpu]
> [  +0.000191]  update_gpuvm_pte+0xcc/0x290 [amdgpu]
> [  +0.000229]  ? amdgpu_vm_bo_map+0xd7/0x130 [amdgpu]
> [  +0.000190]  amdgpu_amdkfd_gpuvm_map_memory_to_gpu+0x912/0xf60
> [amdgpu]
> [  +0.000234]  kfd_ioctl_map_memory_to_gpu+0x182/0x320 [amdgpu]
> [  +0.000218]  kfd_ioctl+0x2b9/0x600 [amdgpu]
> [  +0.000216]  ? kfd_ioctl_unmap_memory_from_gpu+0x270/0x270 [amdgpu]
> [  +0.000216]  ? lock_release+0x13f/0x270
> [  +0.000006]  ? __fget_files+0x107/0x1e0
> [  +0.000007]  __x64_sys_ioctl+0x8b/0xd0
> [  +0.000007]  do_syscall_64+0x36/0x70
> [  +0.000004]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  +0.000007] RIP: 0033:0x7fbff90a7317
> [  +0.000004] Code: b3 66 90 48 8b 05 71 4b 2d 00 64 c7 00 26 00 00 00
> 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 41 4b 2d 00 f7 d8 64 89 01 48
> [  +0.000005] RSP: 002b:00007fbe301fe648 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  +0.000006] RAX: ffffffffffffffda RBX: 00007fbcc402d820 RCX:
> 00007fbff90a7317
> [  +0.000003] RDX: 00007fbe301fe690 RSI: 00000000c0184b18 RDI:
> 0000000000000004
> [  +0.000003] RBP: 00007fbe301fe690 R08: 0000000000000000 R09:
> 00007fbcc402d880
> [  +0.000003] R10: 0000000002001000 R11: 0000000000000246 R12:
> 00000000c0184b18
> [  +0.000003] R13: 0000000000000004 R14: 00007fbf689593a0 R15:
> 00007fbcc402d820
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>
> Fixes: 627b92ef9d7c ("drm/amdgpu: Wipe all VRAM on free when RAS is
> enabled")
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

The fixes tag is not necessarily correct, I would remove that.

But apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 36bb41b027ec..6ccd2be685f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1306,7 +1306,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>   		return;
>   
> -	dma_resv_lock(bo->base.resv, NULL);
> +	if (WARN_ON_ONCE(!dma_resv_trylock(bo->base.resv)))
> +		return;
>   
>   	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
>   	if (!WARN_ON(r)) {

