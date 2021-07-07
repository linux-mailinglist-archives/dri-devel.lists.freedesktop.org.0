Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93363BEC7E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8372A6E150;
	Wed,  7 Jul 2021 16:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB66E0D8;
 Wed,  7 Jul 2021 16:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZMoM7aJHj6dIfXwb+Pf8HAROnnli4lvWFuoagl6RYlMj9+0ZoEDB10OMJGKEuQBHEVZIN2abm4+sNca+2hQ1DexzjjzjfVSj6TQohTfBGs+9/qwFAPSg4iAciogt3gaa1JHMPYcn9Vp9AQLhO7f1x32bEpgFiVsRQotO++Z9+wNL+rULxENIQtGAEkdah6la7ecQvWu97SfOZjf0y7auF5CncGxXz+qv1BMHRc9OaGUzZF4aniS4dGSIs2ghsX9RYzWSvYVy1NkDcsWD6mOi3z5b684ycYGjFcANnDzYlpaXBMtaxoQhh6nhOWG6JUQt6iX6mpV2t4/Hzyoro691A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDulAjEI152l7bfpR3qMCfsEgvfRVjEPU1gtEeHJLVU=;
 b=gzaknAKO7I0oW6T8HZpq97/DWBDv9xS0R1QzdoJLCOh6ZHhGSRFIV9zip3wL437iTQ0qigJdveLjrBqy5i5Qs1pAPQEO39Xnuh5MAe6nK9cgixtvy82g+CRqM2pN8vJfGu8/VcF1K/+qXfDIDsybMwIL3asc8ZncSVglDrB5wopJ97qYxf0Q/0Dj4qxLpR84nd2U2dODkJdQsdSk0zObZIfQ1PZt0GPIznh1BterLzjocgM4GFTEP3GoKtCEUveioLOXoQKUYtyNCAPUWvEuCVLNRo9WDasIzZJjC+yiF047decrcfvDHYTjYC9RsusLazozc+rpwINStgIMoFcNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDulAjEI152l7bfpR3qMCfsEgvfRVjEPU1gtEeHJLVU=;
 b=Ld/NXqA8ELb9mzdr/HdS/6a8K1zNATEyKKYMFZy+8TW+PgapNu/km/kjExeGGSI1NNc1dSgEhflM/xHt8Tw14AAvj0ZJ1Krga0BWX9rXl4jr7s8l7QiBWx23nQtrTOeCmarUKwn3AdXBMz8/nb+LEMcvPb+AXrjREVBtEzO8zLU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5138.namprd12.prod.outlook.com (2603:10b6:610:bd::17)
 by CH0PR12MB5188.namprd12.prod.outlook.com (2603:10b6:610:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 16:44:52 +0000
Received: from CH0PR12MB5138.namprd12.prod.outlook.com
 ([fe80::ad63:1d1e:b823:17da]) by CH0PR12MB5138.namprd12.prod.outlook.com
 ([fe80::ad63:1d1e:b823:17da%6]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 16:44:52 +0000
Subject: Re: drm/amdkfd: implement counters for vm fault and migration
To: Colin Ian King <colin.king@canonical.com>,
 Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
From: philip yang <yangp@amd.com>
Message-ID: <bf503695-6aae-dc6a-2dea-d3ad51800b4d@amd.com>
Date: Wed, 7 Jul 2021 12:44:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To CH0PR12MB5138.namprd12.prod.outlook.com
 (2603:10b6:610:bd::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 16:44:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b80bbc-1a23-4f3b-a3cf-08d941668afe
X-MS-TrafficTypeDiagnostic: CH0PR12MB5188:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB5188EB60354F616BF5487FE1E61A9@CH0PR12MB5188.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seJ0Ee+drZykXu1xeTUyK7owrS9yuE/2Z9teAeiaULPSkD1BNrTthzcpZRvaHW+BadUpiD2b0wzea0HLhCDB3aBe/tL53350lFFvjgnT9bEnK1U/lA9K5np2GpYMyGs3gbF9zthfLe0moqATYbAcQadnMfMMvy74oT9k5XaTiCb4NRdVVH2ete+KOFgsRaFbXpPSGBxP57KzHc1wsMlQ6VSBEouJqJxHYizvkKcARtt+L1Qzn4Mg8bKzpIyaIdR8bSt2nvs9BRtGlvmEpaeQu9djxdTBOwYbiF+e7a+WyNot3jr5I2qz+oxKGssWCwVLhHK33fiQ0IbVHfagAP7DoXWNAAP37a94vemv0Uhw1001+QzuZQrNW65YypA/bWpQQysSC0T8EvQG2cCUIZCDdmqa34Z9j2YK0CJePEj7/a7GMsvBNe3TAIpFhIaHhtZHq2vko6pQAxqsauZ+rkC6psQt2gVTYAW4tU7uRTJkROIQMhwPkmPwvh8M/PymeQuOcQZBOdDufQmQLehoTC9vxYIee0YgAR+SKdQF/R+5CMPf+oNgOlei4BCwNSRuKU0GupnEY0JIzCpH5+QHSJc5EiWAJt5naDg7MWesD8BwDoQfmsRzjU7xDlsntAtBkF5M7Ol6t61Tp0zfc3pWf6qzoJX+tmN5sWFonTn+4wd0DyCf0JMRW+l5XNrGNndlhZ1liqGlUTlw1cLFRr89iL4CTccyahjShZmf07ovc00Ogida4qG7sxcbAUY/V2t7XwEQG550815iSUZXW4ChmogW1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5138.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(54906003)(5660300002)(53546011)(8936002)(6486002)(110136005)(956004)(31696002)(83380400001)(316002)(16576012)(8676002)(6636002)(2616005)(478600001)(31686004)(26005)(38100700002)(66946007)(2906002)(4326008)(66556008)(36756003)(186003)(66476007)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGdsOFY1WURrRWZIMmhFMm9DbWJNMFNmcHE4Z0ZzLzRuTTRUKzJkNGJjVlJL?=
 =?utf-8?B?R1Bib3FkcVdSUHZTZlV1ay9NUnhXOG1ZYVRHWm1IazdjRHAzQitNMDdKUWFx?=
 =?utf-8?B?MWhYU1VqdW4yTTRGOXdHSVVZeEMvMzVyTVgyQU5tUkhjWjdvY0xqQk5ad2ZR?=
 =?utf-8?B?VTFRR2lDd0xBYmdYUktsTWgzWHlpdEdnMTZmUmVpZ0krR0hnWUIwQlpYZEdS?=
 =?utf-8?B?RjYrOWRaZzFBRHpGZTA3QTROTExqdVJDRjJka1g4VzRvT3RveEdLL3NraTJ6?=
 =?utf-8?B?b0c2WVorK3F4cHk0WGU4K1FiZ29uREwzT1RsS29oTTY1ZE5JblhLQ2JKa3Va?=
 =?utf-8?B?UUJZYmZtbTRWWitDSG9DTkVENGhuck12TEtDWkp2aElLNjhNMXhKS1YxbUxV?=
 =?utf-8?B?KzVzQVQxeXF5bkhQZkpITFNLR05vUUpWTDRUeHdYbS92dGx5OTdUM2tzb01U?=
 =?utf-8?B?eVI1b0hMUHhFQkR2NUhJZUlzeTEvYVlUTnVLaUxMRW5WUVdKUm5IRDhlSGll?=
 =?utf-8?B?QXVPcCswa0xhWmpkdDRuY1YxNFhYUFJmdkR2SkRwV01nODlkU0pNbkZnalFT?=
 =?utf-8?B?UXFFTE5iM20rUDJ1RitCMDJaaGRuTzY3UkF2cHhZSmdBZGwrQU80Tmwrb0Vr?=
 =?utf-8?B?bUFKVDIwZmhtMUdKa1ZyVWRFb2pKbjlIRFA0Sm52V3pZRGJlUkhCUTRtQlV0?=
 =?utf-8?B?aWZtdkc3OXp3UWMzYjhXVkdGZ1V0YTJET3p0akV1N0U1RGZlUFRmTnZ3MEtt?=
 =?utf-8?B?ekQ4VW5Pd2kxT1RhaVZCMmJSUlRjdFd2Y2YyVFg2ZDIyVldqODNmNTdXL0ht?=
 =?utf-8?B?bTdIZVhwaEZkTVEyRzFCdnl2RENUd3QwTWNqc0VTeFJuZnBBajFqakxvL21D?=
 =?utf-8?B?WVZra1R5NjRoMHNqQlk4cXVDaENhNmRXZ2N1WUFkWHRlckJtNXoyUTlDanA4?=
 =?utf-8?B?WXU2R3RDSTE1Z3I2Z0xnWUVyYnNsb2RWL1JGbGt3WnduUE8xRXhLbXpDdmpn?=
 =?utf-8?B?WnF0Rk9IbHhUNXdtUUg0TnkvcUxzMi9DdG02K1ZyZVlJUGxEdWhQeU1TMnhp?=
 =?utf-8?B?eTRuRXNJNkdIbXRVSDYyQmFaUWxRbEQ3MW9YVFlyV0RHbS8zZUx0MlJKc0hH?=
 =?utf-8?B?NmlycGxGTC9Yd05mOHFoK1E1d1BMcnlpMGFhaWsrRFBUWm5xYnF5K0lqQlVT?=
 =?utf-8?B?N0lXTzZwSkMwR3VVTU8zMFpJc0VMb2RJeGNxUit0VFkwNGJUWDVlei9KZTI0?=
 =?utf-8?B?QmZpY0dSNWNHTnRhL0dmbUsxYVZ0TG5JanlQWGYvM0RyN25LemZ3cXZrOXhC?=
 =?utf-8?B?WlhiMHZheU5CaGxzV2ErUW1aaGNieVFvWEpManZWczNZSFUwRy91OVhMMnNh?=
 =?utf-8?B?bk1vUEpvZVdQcXR6dFpURDRsVGU2U3NYd2MvVEZySnFjT05jMU55dUNoZlUw?=
 =?utf-8?B?cXF1aCtPUmlQcUdMdThDUFZ5Qk5iZmtUTVQyZDI0VEk4OWc2UUtiMW8rZnBH?=
 =?utf-8?B?OU1yYmVaUVJweGpXYnp2WUo1bTZvbUNNZkMwcHZrQXUxZ1A5cThqYjVCS1dK?=
 =?utf-8?B?U3dDQ2pTMVFtMVJLTVVtZmF4aUUyMUdsSEJZcVd4N2dQcFc1ZW1UMlZWclVK?=
 =?utf-8?B?bmFPOUhiZ2pNeWpGb2UxaHptU1RtcFNnWkhVUmowSDBvVnVNTEg4STQrMG1I?=
 =?utf-8?B?b2xoS29VTGFLTlUxUkJ0Rkg2eTlkd05PaEZYbTh5U3RKNUE3aFhKcllwcHhz?=
 =?utf-8?Q?aklNZFWyVxWeSYH5+bORN+aYxLpa7RH9J8ywF2O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b80bbc-1a23-4f3b-a3cf-08d941668afe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5138.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 16:44:52.6070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9fPp58Tkup4LOKXeJqVpO72nUsytEYoBnsjYC7hFmj1ACo5PJI5VCLReJwnyEXE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5188
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-06 11:36 a.m., Colin Ian
      King wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com">
      <pre class="moz-quote-pre" wrap="">Hi,

Static analysis with Coverity on linux-next has found a potential null
pointer dereference in function svm_range_restore_pages in
drivers/gpu/drm/amd/amdkfd/kfd_svm.c from the following commit:

commit d4ebc2007040a0aff01bfe1b194085d3867328fd
Author: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a>
Date:   Tue Jun 22 00:12:32 2021 -0400

    drm/amdkfd: implement counters for vm fault and migration

The analysis is as follows:

2397 int
2398 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
2399                        uint64_t addr)
2400{
2401        struct mm_struct *mm = NULL;
2402        struct svm_range_list *svms;
2403        struct svm_range *prange;
2404        struct kfd_process *p;
2405        uint64_t timestamp;
2406        int32_t best_loc;
2407        int32_t gpuidx = MAX_GPU_INSTANCE;
2408        bool write_locked = false;
2409        int r = 0;
2410

    1. Condition !(adev-&gt;kfd.dev-&gt;pgmap.type != 0), taking false branch.

2411        if (!KFD_IS_SVM_API_SUPPORTED(adev-&gt;kfd.dev)) {
2412                pr_debug(&quot;device does not support SVM\n&quot;);
2413                return -EFAULT;
2414        }
2415
2416        p = kfd_lookup_process_by_pasid(pasid);

    2. Condition !p, taking false branch.

2417        if (!p) {
2418                pr_debug(&quot;kfd process not founded pasid 0x%x\n&quot;, pasid);
2419                return -ESRCH;
2420        }

    3. Condition !p-&gt;xnack_enabled, taking false branch.

2421        if (!p-&gt;xnack_enabled) {
2422                pr_debug(&quot;XNACK not enabled for pasid 0x%x\n&quot;, pasid);
2423                return -EFAULT;
2424        }
2425        svms = &amp;p-&gt;svms;
2426

    4. Condition 0 /* __builtin_types_compatible_p() */, taking false
branch.
    5. Condition 1 /* __builtin_types_compatible_p() */, taking true branch.
    6. Falling through to end of if statement.
    7. Condition !!branch, taking false branch.
    8. Condition ({...; !!branch;}), taking false branch.

2427        pr_debug(&quot;restoring svms 0x%p fault address 0x%llx\n&quot;, svms,
addr);
2428
2429        mm = get_task_mm(p-&gt;lead_thread);

    9. Condition !mm, taking false branch.

2430        if (!mm) {
2431                pr_debug(&quot;svms 0x%p failed to get mm\n&quot;, svms);
2432                r = -ESRCH;
2433                goto out;
2434        }
2435
2436        mmap_read_lock(mm);
2437retry_write_locked:
2438        mutex_lock(&amp;svms-&gt;lock);
2439        prange = svm_range_from_addr(svms, addr, NULL);

    10. Condition !prange, taking true branch.
    18. Condition !prange, taking true branch.
2440        if (!prange) {
    11. Condition 0 /* __builtin_types_compatible_p() */, taking false
branch.
    12. Condition 1 /* __builtin_types_compatible_p() */, taking true
branch.
    13. Falling through to end of if statement.
    14. Condition !!branch, taking false branch.
    15. Condition ({...; !!branch;}), taking false branch.
    19. Condition 0 /* __builtin_types_compatible_p() */, taking false
branch.
    20. Condition 1 /* __builtin_types_compatible_p() */, taking true
branch.
    21. Falling through to end of if statement.
    22. Condition !!branch, taking false branch.
    23. Condition ({...; !!branch;}), taking false branch.

2441                pr_debug(&quot;failed to find prange svms 0x%p address
[0x%llx]\n&quot;,
2442                         svms, addr);

    16. Condition !write_locked, taking true branch.
    24. Condition !write_locked, taking false branch.

2443                if (!write_locked) {
2444                        /* Need the write lock to create new range
with MMU notifier.
2445                         * Also flush pending deferred work to make
sure the interval
2446                         * tree is up to date before we add a new range
2447                         */
2448                        mutex_unlock(&amp;svms-&gt;lock);
2449                        mmap_read_unlock(mm);
2450                        mmap_write_lock(mm);
2451                        write_locked = true;

    17. Jumping to label retry_write_locked.

2452                        goto retry_write_locked;
2453                }
2454                prange = svm_range_create_unregistered_range(adev,
p, mm, addr);

    25. Condition !prange, taking true branch.
    26. var_compare_op: Comparing prange to null implies that prange
might be null.

2455                if (!prange) {

    27. Condition 0 /* __builtin_types_compatible_p() */, taking false
branch.
    28. Condition 1 /* __builtin_types_compatible_p() */, taking true
branch.
    29. Falling through to end of if statement.
    30. Condition !!branch, taking false branch.
    31. Condition ({...; !!branch;}), taking false branch.

2456                        pr_debug(&quot;failed to create unregistered
range svms 0x%p address [0x%llx]\n&quot;,
2457                                 svms, addr);
2458                        mmap_write_downgrade(mm);
2459                        r = -EFAULT;

    32. Jumping to label out_unlock_svms.

2460                        goto out_unlock_svms;
2461                }
2462        }
2463        if (write_locked)
2464                mmap_write_downgrade(mm);
2465
2466        mutex_lock(&amp;prange-&gt;migrate_mutex);
2467
2468        if (svm_range_skip_recover(prange)) {
2469                amdgpu_gmc_filter_faults_remove(adev, addr, pasid);
2470                goto out_unlock_range;
2471        }
2472
2473        timestamp = ktime_to_us(ktime_get()) -
prange-&gt;validate_timestamp;
2474        /* skip duplicate vm fault on different pages of same range */
2475        if (timestamp &lt; AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
2476                pr_debug(&quot;svms 0x%p [0x%lx %lx] already restored\n&quot;,
2477                         svms, prange-&gt;start, prange-&gt;last);
2478                goto out_unlock_range;
2479        }
2480
2481        best_loc = svm_range_best_restore_location(prange, adev,
&amp;gpuidx);
2482        if (best_loc == -1) {
2483                pr_debug(&quot;svms %p failed get best restore loc [0x%lx
0x%lx]\n&quot;,
2484                         svms, prange-&gt;start, prange-&gt;last);
2485                r = -EACCES;
2486                goto out_unlock_range;
2487        }
2488
2489        pr_debug(&quot;svms %p [0x%lx 0x%lx] best restore 0x%x, actual
loc 0x%x\n&quot;,
2490                 svms, prange-&gt;start, prange-&gt;last, best_loc,
2491                 prange-&gt;actual_loc);
2492
2493        if (prange-&gt;actual_loc != best_loc) {
2494                if (best_loc) {
2495                        r = svm_migrate_to_vram(prange, best_loc, mm);
2496                        if (r) {
2497                                pr_debug(&quot;svm_migrate_to_vram failed
(%d) at %llx, falling back to system memory\n&quot;,
2498                                         r, addr);
2499                                /* Fallback to system memory if
migration to
2500                                 * VRAM failed
2501                                 */
2502                                if (prange-&gt;actual_loc)
2503                                        r =
svm_migrate_vram_to_ram(prange, mm);
2504                                else
2505                                        r = 0;
2506                        }
2507                } else {
2508                        r = svm_migrate_vram_to_ram(prange, mm);
2509                }
2510                if (r) {
2511                        pr_debug(&quot;failed %d to migrate svms %p
[0x%lx 0x%lx]\n&quot;,
2512                                 r, svms, prange-&gt;start, prange-&gt;last);
2513                        goto out_unlock_range;
2514                }
2515        }
2516
2517        r = svm_range_validate_and_map(mm, prange, gpuidx, false,
false);
2518        if (r)
2519                pr_debug(&quot;failed %d to map svms 0x%p [0x%lx 0x%lx]
to gpus\n&quot;,
2520                         r, svms, prange-&gt;start, prange-&gt;last);
2521
2522out_unlock_range:
2523        mutex_unlock(&amp;prange-&gt;migrate_mutex);
2524out_unlock_svms:
2525        mutex_unlock(&amp;svms-&gt;lock);
2526        mmap_read_unlock(mm);
2527

    Dereference after null check (FORWARD_NULL)
    33. var_deref_model: Passing null pointer prange to
svm_range_count_fault, which dereferences it.

2528        svm_range_count_fault(adev, p, prange, gpuidx);


The jump in line 2460 to out_unlock_svms will occur if prange is null,
however, calling svm_range_count_fault with a null prange will cause a
null pointer deference when it calls svm_range_get_pdd_by_adev and
dereferences the pointer as follows:

    p = container_of(prange-&gt;svms, struct kfd_process, svms);</pre>
    </blockquote>
    <p>Thanks for the report, I will send out patch to fix this shortly.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com">
      <pre class="moz-quote-pre" wrap="">

Colin

</pre>
    </blockquote>
  </body>
</html>
