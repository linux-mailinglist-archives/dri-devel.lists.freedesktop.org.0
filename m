Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F342ACD5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 21:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C5B6E9B8;
	Tue, 12 Oct 2021 19:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281C66E9B9;
 Tue, 12 Oct 2021 19:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4YeRIA3cUnCx6KuFwFUm2UWfd0dzOWsghNm5UgXOQgxHw85L9nZGmVM+x1MPg6XkAa+QTh4fDG+u5TEcA0VvGQ7cy28Q6hlbUECbJZxMygYqiIwzsGXCi+BSwHxzeJfVCJuG6L4D5OfkF2bXRLmqciXGWp5kszfWRmwOQw4RbotXgsHkGIvcWDvn8CkDrq9H+++tZ0ssKYwMc0E4i943VCdtRkH5i6IADgJPQalTIGoZ9Q8KFl2hfpi9MNOwop0JLNlXmqW/zNlFeFG52+y3EM09mK6xTjR9zNShhAZ135g8Or2Mi9sf2YOgjdlDg24ImpXfq9dhsofRUcCjX4K+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OONgxPa0UMdfR5HMQMO9wRhMv9URCDm7iVNRC4yXvUM=;
 b=kWvw2XbsRcKDRXXDbYZR5lwywcO4stk58LUKGgsUiahcHE44w1uo3l0wgbfyuAm+3huJ2pVNsOTmpzFJ4TUqAg5mVFl3ui24Dp0q1aLNyhVaRLxam+ju0QJDHeMDi954+hY0aBCInGUheW7v2KIWaa+/4KClizHkcgdrwyNsGmYdu7WUI49XsaWSywZ32AiKRwPxHvdArwkW49oD7jnmLe4C9ngOTy1rcx4ND8aQpRacZHOfExrBoG2H3kZV72lQQe0SjP1voI8AePMNiLO80ImNwi3nfUfo6j/9pgdE6J6kV2cqynZsEtfOSaTnXVguINrlu5J1dB1e6gXbn1ISYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OONgxPa0UMdfR5HMQMO9wRhMv9URCDm7iVNRC4yXvUM=;
 b=doFsKrcL6uCQ2KNz3cQWP1eKyLrzcnAY9QPlUuB+adu0Dd4n5gOaxbCkllPVsGNtGMqgVvUNUQb1M1jy6Rzct+3zBH+RzMVaTHw3oJu+eIYDCEsskEGK4ANhTvvGfYStXBYlRCBUDxgL8obY4wrUEEH2nT+c2Ft+FrUNIltjRwA=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM5PR12MB2439.namprd12.prod.outlook.com (2603:10b6:4:b4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 19:00:36 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 19:00:36 +0000
Subject: Re: [PATCH v1 00/12] MEMORY_DEVICE_COHERENT for CPU-accessible
 coherent device memory
To: Andrew Morton <akpm@linux-foundation.org>,
 Alex Sierra <alex.sierra@amd.com>
Cc: linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jgg@nvidia.com,
 jglisse@redhat.com, apopple@nvidia.com
References: <20211012171247.2861-1-alex.sierra@amd.com>
 <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <387fafcc-8ebf-db16-5a88-cf24525ac102@amd.com>
Date: Tue, 12 Oct 2021 15:00:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::27) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 19:00:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f7ee81d-5eb0-4422-6ee0-08d98db29340
X-MS-TrafficTypeDiagnostic: DM5PR12MB2439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB24390F7A32F6C7912076464C92B69@DM5PR12MB2439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9jL8ObxrKGj5DZaVGgdPtLjluTKXwEfzarNKset5PUF8B4Ahz8u8vsI1Wc3qQju48nXffyb2SrU+L0FMNq+Ve8mHbRsZhOl6n8ExCJ6+NzgbA7pjhTeRCofr14dZvQYziOIqwuXvMOhS3c1c5EhdwKotNzsaQQP+vfHxyuZu63YLNUfAetdZh+h1lqaxoAqcJ0dIichX9PxqhE0qlJ4p4df/UzP3KevVebfomNrDd5ML/bI0m5LR1FZ+aw1k0w0ybvEix9ivVonMgmORUxKp6Fam0ZXf40kJ0Pr9g99/KGz3wXO6qrVFYpWC9KaDIuLJOrdbJYUZrl1sjHrIS2gBarM/YirNYQDZFASi591bEZeSbuD1VPGnt/JvcIhkKrKFktVv1VCLacLzB+VN16PRqIlbLkubj6RrtdZ6qNDTXcHQwRin6KFyDznM91pfnnCYPpgpvunPg2dUX5BoA/ef8/3UQCojY5awWgppqXYNZZvRYVQwDFAX/9CaL65y7X50P0ou2PR3Kiz1yNgNfAteO09Wy722P2ZOhMxfmH0cNj4Ms8ZBcitVxq6UOJ/5BKo0xc+BRz+s+Gdgr7bzZmJU62b3L/moroYzd7GM21UMDIQvkYMKJ8lG2SJR/QnjV14Dkedh9BpWLiHoJu67wXC5MeMLiSCvxUeOdmCC5dUOQEV0q7C7+pO15SPl9eKOLBDQPVAO03pPuE/rOowtTAHaFBNZC/ExGGjxrEPPCBRFEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(6486002)(38100700002)(4326008)(16576012)(508600001)(6636002)(186003)(316002)(2906002)(26005)(4001150100001)(8936002)(110136005)(5660300002)(8676002)(66946007)(956004)(966005)(86362001)(83380400001)(66556008)(66476007)(31686004)(7416002)(2616005)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JQRi9vYVFFczBtQ2NMYUY2bytwSTJXWjVYUW9LL0hGalRmM1VWRmJPRExl?=
 =?utf-8?B?Vi9tbzFDYStMK1JrTEJVSTlvMFJIQ29Zc1ZGMjlyOE5VSndZVDdlVmIxWk5L?=
 =?utf-8?B?L1pObWxRMDlHbWY3UTcxNHNZQ0RGdnVSRHJNK0xxUGorMDhnOFRhZHZ5L2FU?=
 =?utf-8?B?REtOcDdzVVplb0tYQTlkTnl3VVBFdkJyenZFUXJzbGlua3ZiK3E4WXRINFVk?=
 =?utf-8?B?dWJ4Y1FqRjg1bFJ4dm02b1NHa2ljWE1TNCs2Vk53S2J0WnRPZjRWeitZOEFI?=
 =?utf-8?B?VnR6K3RzbjRVU1RCQlhXNEhLazE2WldMK3V0V1NzdmZGTzd3QWZqcDRQNUlX?=
 =?utf-8?B?cXgvbGNlbnFBN0FKbEZHK2pxc3BZMHh2TC9QOWdnNDJvVGRZN3NLd0lNWWNo?=
 =?utf-8?B?YnFFMWlNQ1lqbmRUcXd5RCtyS3ViS2tvMlBQOTBYRWMzOWJ5Ym5MZFh4YkpH?=
 =?utf-8?B?emxENm9pVkxraW12NTBEVEVBYzl2U2hLNnZ4b2tpNVB2ZG0vSFBEellVSmRl?=
 =?utf-8?B?M2g2dVJabCs1OS8wMmdXWTlkNG43QWUxNDNtM05CQU1nbVhkMkh0d3lmN1Zz?=
 =?utf-8?B?K0loNGw3Q09kdjU2RDZoMzN3VHQvMEN2RkpydWJSd0hkTTRQbDNHd1h1WHBV?=
 =?utf-8?B?c2J5MFFEY2hSSXhDRVNiakloa1ZldWFFbnZlcXQ1SnJzd0UxZ2V4ekZaUGpG?=
 =?utf-8?B?MjlMV3QrUHM2VytIMmlzQjZNSGg0QnRsb0MwNkJ5WFJBWXdHakZoMVVZQlhP?=
 =?utf-8?B?NHJFUVpUaFBhSnB6eUVJTW9LeDA2d1M4NzVDREpZMGF1RFo2Y05HZ3h3UFNk?=
 =?utf-8?B?aTE1WXloRE5wU0xPa3FaVzd1MmVib29MZE41aFZRSDJLOVozWTVWYkpzckRF?=
 =?utf-8?B?UEV4SzU0bnNUS3lNWWNzNzVrcUN5Z1BCOU9EY2xJT1hzdGI0OXFZM2h5Z0pU?=
 =?utf-8?B?aVU1VWR5OGw2Q2hqOUZtZDVmd3R6NGs3Q2pMR0krT045T0ZrcUxhMHhpZ3c1?=
 =?utf-8?B?amYzcWswSXBJb0lOV1VPcXpLSWpSZTd4bk1vbWRKSjJiRjhvZy9QOEltczl3?=
 =?utf-8?B?bk1rK21DM05uOEdPNGM0c2o0SVRoQ0VQdXFISEtUcGJPblhIUzRJYjdzZ0t3?=
 =?utf-8?B?cjB3QWpFRGxtcUNhMmpaNXgxSXBZaTdrZ3NQN1Z5WjhrbWtLVTZMYXg1ajBa?=
 =?utf-8?B?MlU3UHBwUkVJaUoxeXlQOGxyNnN3eXdVb2pHVUMwK0xvWnhZOGNzM1RpY0tM?=
 =?utf-8?B?MGVaZDZ6b0NJd0Z1K1k0ZFh1T3ZYK0NZL0NSWW9lWkc4ak9GYjF0SDdjQ3F5?=
 =?utf-8?B?WldpU3ZOYWdjREg0SnNIS0UwZ01udkhVcCtteHNXL1NEQWR0cEhvRU8vV3Z1?=
 =?utf-8?B?U0tFQlY0T05Hdk1vbEJnZDdOWVFjakFQRS9lUk82MERYVDZOVkhrWkg3cTg1?=
 =?utf-8?B?VDRObjFhdUo1eEQwNDlKOGdjU1YyVksvZk1pU1JWSnpMOUlodHkySGdYMWha?=
 =?utf-8?B?eHk5TXZrd3FPQUdXZzNUaVhWdHN3TUVTUENmMm5qNmR0Sko5N0hJcnl0TUNl?=
 =?utf-8?B?TFhhS29SWFFwTllXTytCREIzTW03cDhRVE5vSUo2S25Pd3FZdWpqQ2JFV2JU?=
 =?utf-8?B?UEU2U1ZCNWYzWFEyOWhKQld0aWk4NTMwdjArYVZnUVZnUnBXWTVVK3VscFJC?=
 =?utf-8?B?K2ZkWWpLVUlGUkNZTnVveW9ENXdaMy9UVXZ6YkZEeTBlbjFUWG9LZDh4S25J?=
 =?utf-8?B?eWJCN3VvSFVMZldQd3ZGMnE4Y21TYVVVRG1CYVoxbkdKTTBjK2YxVThQeG5q?=
 =?utf-8?B?djF5dHdEYUVSQjdRd3dDQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7ee81d-5eb0-4422-6ee0-08d98db29340
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 19:00:36.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZdybcTYl8w5eU/Ohhn/NBFOgj5IZNmX5DjAwSAOxcA6SZBAb/0ddCJWFw6UvCdRqPubDk38HCEiR7CyZaUYCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2439
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

Am 2021-10-12 um 2:39 p.m. schrieb Andrew Morton:
> On Tue, 12 Oct 2021 12:12:35 -0500 Alex Sierra <alex.sierra@amd.com> wrote:
>
>> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
>> owned by a device that can be mapped into CPU page tables like
>> MEMORY_DEVICE_GENERIC and can also be migrated like MEMORY_DEVICE_PRIVATE.
>> With MEMORY_DEVICE_COHERENT, we isolate the new memory type from other
>> subsystems as far as possible, though there are some small changes to
>> other subsystems such as filesystem DAX, to handle the new memory type
>> appropriately.
>>
>> We use ZONE_DEVICE for this instead of NUMA so that the amdgpu
>> allocator can manage it without conflicting with core mm for non-unified
>> memory use cases.
>>
>> How it works: The system BIOS advertises the GPU device memory (aka VRAM)
>> as SPM (special purpose memory) in the UEFI system address map.
>> The amdgpu driver registers the memory with devmap as
>> MEMORY_DEVICE_COHERENT using devm_memremap_pages.
>>
>> The initial user for this hardware page migration capability will be
>> the Frontier supercomputer project.
> To what other uses will this infrastructure be put?
>
> Because I must ask: if this feature is for one single computer which
> presumably has a custom kernel, why add it to mainline Linux?

I'm not sure this will be the only system with this architecture. This
is only the first one I know of. I hope it's not a one-off, after all
the work we did on it. ;)

The Linux kernel on this system is based on SLES. We are working with
SUSE on backporting patches needed for this system. However, those
patches need to be upstream first.

DEVICE_PUBLIC was removed because it had no users. We're trying to add
it (or something like it) back because we now have a use case for it.

Regards,
  Felix


>
>> Our nodes in the lab have .5 TB of
>> system memory plus 256 GB of device memory split across 4 GPUs, all in
>> the same coherent address space. Page migration is expected to improve
>> application efficiency significantly. We will report empirical results
>> as they become available.
>>
>> This includes patches originally by Ralph Campbell to change ZONE_DEVICE
>> reference counting as requested in previous reviews of this patch series
>> (see https://patchwork.freedesktop.org/series/90706/ We extended
>> hmm_test to cover migration of MEMORY_DEVICE_COHERENT. This patch set
>> builds on HMM and our SVM memory manager already merged in 5.14.
>> We would like to complete review and merge this migration patchset for
>> 5.16.
