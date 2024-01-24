Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF0883AE80
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FB310EE27;
	Wed, 24 Jan 2024 16:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8310EE27
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npH8wW8JGTUoJpkwb7TDAvCeI9A4hy9ZTmikIo0QKH2pIf/+zjBvoZNXRfLVubu1CczUibROe2rFAmj14ZF1sKYZIL8pL9fUHbdRjfeSYrB7npDbpni8Wt+t6xY4UNllPRLALOWaLAuLDrokGh4q789ZwvdaMO4ZohvPF02D5YCiUcBlUhmyii7sVlUU/WyrW4pxyWg79YGdW6z1UqLHDCilrJePCUylzcTs7/HI5DbqQHJ3GLEP6qGn977nxP/Mero4B8BUzaZdrkylcgggh9TRYkxS8AfIHHFO5J4G6stPcDxcjCkfapxQYCGSQeSww9ZJ6Y2QVhecvPygGFYu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NovUSmBSuwtpNZiHKPI4V0WPrj4cO1+7+UlwUxozCOs=;
 b=E/+mk3xQQZNustWmDs0hjwJgzSvDNQ+FZXlnegmO/Wtf8sL37mmUtP83BDzvZFGU+nr43c9JuWo9phuJKKKEOMo+h7b62VLPRM52X6e0qFaaT1U6TMmU8ZyOoaiNiRRNnxIEq3+TE12fmDyq4C7AzZ/CHrLE6/tQz0E6oXuV2Fu1tUQQaHTqcojcjueW1M7unKYhdn9Of5ZHsPUsbqWLyYNgA1Jzvt0hwPB6/7cDcXyb7gaaZwjSoem3inWwlG+gCdFWJWaKV/4o0bcN6m/gYXXh3b+ecjXvM7GBEOUmiP1r1kbFfeD9HCsGNLnwwJ4xwcJDrKVvV2ycxilTJgewPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NovUSmBSuwtpNZiHKPI4V0WPrj4cO1+7+UlwUxozCOs=;
 b=I0xq2RnKGKzg4dMYh1XGLThwBLzQfVn/hLm2nnKs4pECMfVO1eFIhjF/bK8uFpTdyR3PTAgDVglbYutQG8KXy3xOzm0kQkBVRwpvbRmk1Km8T2zpcrXJQjgBD8ZcBakdAqopAdrbU8eX1kTuY9TYcK2NfSRE/moaGA7vNy0MSYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4859.namprd12.prod.outlook.com (2603:10b6:610:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Wed, 24 Jan
 2024 16:39:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.039; Wed, 24 Jan 2024
 16:39:45 +0000
Message-ID: <5598e8aa-14b2-4199-9620-3e4fe3dde459@amd.com>
Date: Wed, 24 Jan 2024 10:39:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Revert "drm/sched: Split free_job into own work item"
Content-Language: en-US
To: Vlastimil Babka <vbabka@suse.cz>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240123021155.2775-1-mario.limonciello@amd.com>
 <c2995f42-7b35-4d3f-8882-433354b2513a@suse.cz>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <c2995f42-7b35-4d3f-8882-433354b2513a@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0124.namprd07.prod.outlook.com
 (2603:10b6:5:330::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9604b5-c208-4a8a-36e1-08dc1cfb128c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZ534lRZ7Y0o67e60g9Ck9Oom7uhlkrh6fM5CdFeFhJt1HhyEfwrF9T7Z/sqm3MHcyA+4RUNHQMxZp8LF3U8nPjoF6DgUXg4g/S0r62IxPfMsaVe9skW2uut1xU9TqGq4m6McZv0dxgaZlDQbIvrgOlPBpJ3s1HrpKFjvKsp/0VH/sofPGl+RtEVf3LqrJ9CZgQfTlcQpMLhACULKPMV0VM9CBoFEMhCOtHJZAzOHogREJMc1SoPto4pbofYbFpBKndYzYHFdPof3S2JwsGTYLOQ+sfjdjVZodKGH5PcOqC2YuPhdjMStErsxLkxe9RP4s/INhjBFucHr90spGj/hElcHjutG2pj/dtqi9l/gxKLpL/UzZomwhlyL22BNyJu/cuN0unCSr0S/GMZST7XLWGof6lkERdv6f6JAzXpWnIzxxGXQA5fv8TKV+APYs+symZZ+iyUHWShRiiU56DOQRplI9IOZtJClsFzROBzuH3Ru7S/YVKzPcasi5gILCOjkp4tOxJYV0VVy03gIBX5QU7E8K2XkFm0mYmq9dfe3Q/P47wZiXyf2vyYTsxDGFuKlFbbXtOs6aIfJRFkHyT65hY3scNZ/2YLYeIP2JwtJiQz2Gphxu/antmNwqNyHg+hDYoWgpt1HnIf40TD+/k2evrVUr4Z/yVIXSVQT7/H9/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(86362001)(478600001)(966005)(31696002)(36756003)(53546011)(8676002)(6486002)(2906002)(83380400001)(66946007)(41300700001)(4326008)(2616005)(6506007)(316002)(38100700002)(26005)(66556008)(44832011)(6512007)(66476007)(5660300002)(110136005)(8936002)(54906003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhWek80WlE2Z2d5YmZlWFozdndvdUY1dFRCWkU2WkhEa0ZNVDFnM0lyN3dq?=
 =?utf-8?B?TE5SNUtWdUNjaERpYXRrd01yUWpGaEYrNVk0RWJTbDVibWhpaHkraytFNTZa?=
 =?utf-8?B?NVQ4RlhLUFVsNHhhNmc0M0JNcDBJOTJYUFBTQ3RLamNjd1hTSUVnS1ZvZGdq?=
 =?utf-8?B?Tk9pbkU4N1lwYmJEMW5Tc1U0Z0hRVEYrallCUHY3bm1yRCtzdXR3eHR3di8w?=
 =?utf-8?B?L1J2ZlZ2MUliWmtlUHZRdHcrakV5d2NTZHcyUHBHQm5kaTRvRC9FaFNnUUNj?=
 =?utf-8?B?YzlCWmJQcE13cmxDR1Q3NzRYdFl1K2F1eWs4a1RtVS9BVlVkNlNIV3NRSzY5?=
 =?utf-8?B?SXU5eXVmRkJFNk8yTVZ3OTRoT2FsVmc3bEh6bnBHUzZYQlRZaklOVEY2YWJ5?=
 =?utf-8?B?bUMvTytDYWluQ3RSM090ZkJkNTg4RUxYNWx2Um84b01hQ0hkeFdJdjM0VUFE?=
 =?utf-8?B?NEZsRjRuMTBDRkZkNUlPVmZRbERBbHZoV0pnL2RVWmU4MWpMSWpMV21EeFFN?=
 =?utf-8?B?RGVnRHo1UzFrbGVXaVZHT1ozSm1EeFdsZXNaRFFpaU1Db2wwWjY1ZFZ1bjJ0?=
 =?utf-8?B?OWc5RzdSaFhwT1R4U1pVdVZNaDhVTWlITng5T2FXK0R0VU96RWs4OTYxVTJU?=
 =?utf-8?B?NWZDSHZnTDBoeEUwVGdXSGRNWkQ2V05rTmtRZ0twdmE0WG9MOXZLNmR4ZlVS?=
 =?utf-8?B?aUFCQVRKYjgwRlJneEVtTGFIbEJiNmJRT2ZTc1REMkhORGdwcWpGNjNtZm9i?=
 =?utf-8?B?RmZSVFczeVNtdHBOWFZHSzEvNDFyN2I4VWJFa0xsWW8zWGRTeDliQk1yVTcx?=
 =?utf-8?B?VU9lU2dFU3p1b0RCNnoxTGw1TzVqdnFDNVZVd1I5SkJrQkNzZU9HbHVsdXcx?=
 =?utf-8?B?NlBqR2U5QTBNRjI2Uk4xclo5SG1HSThtMmk4cXorSHVlb2RSbEZsamU5ZE94?=
 =?utf-8?B?V2U5QTVHTmRIVGkraDhEa0c0Z3BURWU5UjE2S2gxbm9maVBQbHFJRjJmMEpG?=
 =?utf-8?B?V201bzJmeUJveEpWMU00aGt6bFl5cU5CcXpSUUQzcnVSV2drVFBiQzBLNnNr?=
 =?utf-8?B?U0xzanc4V3hoS0pqNjBidzR6UUkyQ3dCaUdoTTM1ekpDd2dKUXRwdjA1blR5?=
 =?utf-8?B?Nk4rUU5SUHFwdGVBMmpxS0gyY1NOcUhZVU1CNC9oQ2dzVExrWTM2amdKcTdv?=
 =?utf-8?B?Y0kycUNoYUJ0V2svelRlZlVKM2NDV0NLU2Izbno2am5TcmlwY3dYakxyeTdk?=
 =?utf-8?B?eWt3bFRRZjFzM05KRks4bzYxcWJNWnlXRzltd1BCM3hkV0ZEbnBUUlRHZnhm?=
 =?utf-8?B?MDJNWHdYQXBGcmdsT2VmZ0ZaWUhwRzNldk84RitvcWRMNzNManQyZFcxWU90?=
 =?utf-8?B?QStIZGpNTDM5MkhNSTZDeTh4SFhBZ1lJcHIyVGU5U1ZPR0VZVjJpeG41WHI2?=
 =?utf-8?B?RmFKODFEbzlaRUp0NEdIVzltdndXeThaWFUzSHJ4SDJ2aG5PNnhzWEROeGZi?=
 =?utf-8?B?TW1FekZRVFdyV2xDdXFrMHhSZ2FTRGlzM0YrNGFEeHF6dUIvY0IxMUMxeGxF?=
 =?utf-8?B?YXBnOURWeUx0N3lhUHlwb3llMjJCbWtFaTlsd0JObTVvZnVNbFB5U2lvaEQz?=
 =?utf-8?B?UkF0Y040Mnk4QXcreGN2K3dGMjlnSFdoVWpTZ0xoa2xNc0hUcjhlOGlkUTM0?=
 =?utf-8?B?T21pUjBpSEhyN3hCd1NwaEZLZlV0UzZiVkpXNGJObkRCbXMzTTdMMm0vdXpQ?=
 =?utf-8?B?VEhhck9vc0VMU3BXMDYyRG9PV0NSK0RkQmo1TlBBdHdHOWFERlJkT3JxdGho?=
 =?utf-8?B?Q1hjL0VhZEdiTzBsNERoTUxMS3M4Q081ZWg4MFFMalE5cVFaWUplQng3WWlP?=
 =?utf-8?B?WFlkaE05emNuRzVwRmtLV3FpR2d2TlEvWVBhU0Q1MWZlUFJEb1Y2OWpiYUxV?=
 =?utf-8?B?TG5wekcyeFA5OEx3bjJZQ3c5SWxLL01HaTlmNXNaMnFwcC95eWVEV0ZISUwx?=
 =?utf-8?B?c1VPZHhHNTVXL1B1K0txTEdzbzB0MlFrY1JOSGVnb0M2SzBlaC9VNkk5Tll2?=
 =?utf-8?B?VjVNTmw5cEkxb2lJbXZhVm0zYktzTFR4TnB6Q0lpVno2czNrVFpTTmR4L0tN?=
 =?utf-8?Q?0W/jJ3DMV5r/cQzVtXdVDMzBR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9604b5-c208-4a8a-36e1-08dc1cfb128c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 16:39:45.4959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6JOFxY8nBKwy3LSuVEdxV65Qk1X8k2PuiQEKHIb3Ge4ALmBRdmVVlTGKsrAoWbRm0A0u+oLqend8aK1uXxCnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4859
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:DRM GPU SCHEDULER" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2024 10:26, Vlastimil Babka wrote:
> On 1/23/24 03:11, Mario Limonciello wrote:
>> commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
>> causes graphics hangs at GDM or right after logging in on a
>> Framework 13 AMD laptop (containing a Phoenix APU).
>>
>> This reverts commit f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7.
>>
>> Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> This is a regression introduced in 6.8-rc1, bisected from 6.7.
>> This revert done on top of 6.8-rc1 fixes the issue.
> 
> Applying this revert on 6.8-rc1 fixed my issues reported here:
> https://lore.kernel.org/all/2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz/
> 
> Let me know if there's another fix instead of revert so I can test.
> 

There's not another fix at the moment, but Matthew has posted a patch to 
allow ftrace to capture more data with the gpu_scheduler trace events to 
this bug report:

https://gitlab.freedesktop.org/drm/amd/-/issues/3124

I already captured from a local machine and attached to that bug report.

> Thanks,
> Vlastimil
> 
>>
>> I'm happy to gather any data to use to properly debug if that is
>> preferable to a revert.
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 133 +++++++++----------------
>>   include/drm/gpu_scheduler.h            |   4 +-
>>   2 files changed, 48 insertions(+), 89 deletions(-)
>>
> 
