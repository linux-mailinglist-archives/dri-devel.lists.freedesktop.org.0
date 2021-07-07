Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09023BEC8D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802C96E153;
	Wed,  7 Jul 2021 16:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725566E14F;
 Wed,  7 Jul 2021 16:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kR88uoSKSv6P7XxE1ghncACVbF7ifZY1wCXToG/bRac6e2bW/M2fWfy+RFsXUj/i5GUYcYubGru1eUmy1HoXpPlMr8WE4V/AQmGgW0TafVL2ORmjiN7aWjdLvKIBBoMqtWhdPV4scUnRpmw2yFC4B/P1EEYJBJqCwkij9hHDeFvBpmciuqcmPn7HsF2YWsp70K9yYSEr65ab3wc8dc+PrN5SSvIX+23DFmeVXhostz5yNf9aoDdin9EygwOmxAsSo56awdcuiNakJ/oQUjcDpd6ztSbixPwqYB4u+uazWMriW/KUI2vyUKNqkgb85SGIfS4LGByGlrTRllwvy3J4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAtkFeN6W4R/nrACK5kZXRGvJ+GJSbvVOSrBG9XOeHs=;
 b=DD1j2c4mVEv5enlzRWYJ0JljsmB4yhiQcEODjY+pYPuDjrM6IGhIvenRlyaG8vOi7/mIgxevGP9nmRwhiFsmA+qggcXPQHN6o42x14W4LhC4SPCYuGfijeTV9msv6oP6/vVxM7Ia29LfNDRCUSMab7ReADTPF9dlM518sXNXzYkeclguHIGA3K1Cl7AwJl8RpI6TszT9HVO2SFUAHmdW8xZSsB3sAu1bayA/hAdeVdazBPbQ2RazPQf1ShU5Zg/UOkvU1rpyeW/gE/fyo299QJ/T/pIqiLKYv3A+89VtyeZc7bx1DbqIDzu9TEBU+xkbBw2DGyMrcuF3/GXUnInAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAtkFeN6W4R/nrACK5kZXRGvJ+GJSbvVOSrBG9XOeHs=;
 b=c5fvpEeBKgVBNNsBqsW31Rlov6cZHpNEUk9hnNCerr+MVCVkJMQhKdw3JEc0P1V1atc6P3nFa1aUl3HgW31qjgkcBQ2K68kLZEQWlluDqy4tKG9/wc58HwMSrpKqeusIiL1XgZaLiMpNIM2zA1dcD1rIz0qDesAxixx4+u7Hpqw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5138.namprd12.prod.outlook.com (2603:10b6:610:bd::17)
 by CH0PR12MB5345.namprd12.prod.outlook.com (2603:10b6:610:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 16:49:25 +0000
Received: from CH0PR12MB5138.namprd12.prod.outlook.com
 ([fe80::ad63:1d1e:b823:17da]) by CH0PR12MB5138.namprd12.prod.outlook.com
 ([fe80::ad63:1d1e:b823:17da%6]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 16:49:25 +0000
Subject: Re: drm/amdkfd: implement counters for vm fault and migration
To: Felix Kuehling <felix.kuehling@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Philip Yang
 <Philip.Yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
 <d7e65a44-388a-4a16-1781-a38953851ebc@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <e244a7f0-de36-72da-c460-3f2651bf3cbd@amd.com>
Date: Wed, 7 Jul 2021 12:49:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d7e65a44-388a-4a16-1781-a38953851ebc@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To CH0PR12MB5138.namprd12.prod.outlook.com
 (2603:10b6:610:bd::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 16:49:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8cf405-d9f4-494d-ab73-08d941672d65
X-MS-TrafficTypeDiagnostic: CH0PR12MB5345:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB53458A9581E0F08039104A5AE61A9@CH0PR12MB5345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMfFoCUHaoMe84EnSJiNaqstetpJFnmjPvqrbSePCnl0PDl5HscwajWeDAWt22/k2GGeS47CjZTyN1SM++jyBM1/9hmlbxe0NunleKRrd5unXs6VJT1U43UPm6T1YFxgXfL7QdmRqSantHaK2AUSSo04cEOAttkMzdAsW9gkIggiSRCZcWp6Dl+l4MXI7jxeISe4q5+BtUA6zDBmTvUOIf6114UP3QW/GzHs4JqTAEH2p5EOx71bwsegVOgeXtA6AWciX4W6Pb8q5gVWSgCyND9mk5fMaUwN5gEKwCRc8Y90DKz2mhJ2EHPkbYj+83PiHPv60cWApbjfHtLOVsS0gRr6kBoos6dw3DwXtN+pVpwx+2uG2CG2sNEmsnkR2apObrVL5w05pGnUq2ayP1QuSLn0BEEAgeLMbe2Gea4gxShZviSMudh+GI/7eVWymFQ6qCtDKE6Je5dN4iwiyEW2kjWgpYgEvn7hPbA3O61KkOft/pecJGJzNvVjyvz7JildAL3LGpmkMQe7m1MlnJZ2GtMeBzIoE8jtUOqGr1E8ioiGlOZIl40I5FYEzTLPPCQhOOWvD/MN3xCl4mg/UZM9TeesuyW8wvy0U1dFk/6meDMWmq7eBvja1A0B/MAn9U/teEOOT4+QdHTOnjH03x4kaK0Dp13GDzoJaeu1NYkj9+YSviwLLohDS1zFtt+ZL71nP0Dc9Dde/nBFXpGXsULUi/T3U1tU+MJccXP0blTfUOCURZGyXBpZwTpfGplWoO65ghUjirP4el6je33tyWS19A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5138.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(2616005)(110136005)(38100700002)(54906003)(5660300002)(31696002)(83380400001)(316002)(16576012)(6486002)(36756003)(956004)(66946007)(66556008)(186003)(66476007)(4326008)(26005)(8676002)(53546011)(478600001)(6636002)(2906002)(31686004)(8936002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJPNHczVmJHdHIzRG1RMVNzdnU4N2QwM2dvOGF3d3ozMW8zemFaY0NFalQ3?=
 =?utf-8?B?TjY4S1JOQUJFbXVuNkpKeHZuZm1BRnhJbURDS3Y3SVhJU2Y2VzFjUzd6bTBB?=
 =?utf-8?B?ZnQ3N0pUeFNDUzhGU2hxckpRdjdOTnlXa1ZpeFRYRjcrTFJoMkFadEdxQ28y?=
 =?utf-8?B?UWVzckdhZlBDdjkwb0k5WlFnMDJOZHR6Y1lyZmQ0R1kzbWZabHM3V2VscGxo?=
 =?utf-8?B?ZFYyZGt4R0FJSnMwall5UTYrK2hjTWJBamkrZk1jUnBSZWMzWTE2RHlKeUZt?=
 =?utf-8?B?NFZVUWo3RklaZUlsalZXYWVNU3JVL29Zd0RYc2h4ejFLeU1mdGlIOVZrNUc5?=
 =?utf-8?B?dVhzVU8xdko5ZSt4NC9jNEVacngzSHBjdS9iZ2lHTit5RmVtb1Jjb2Npc0Ry?=
 =?utf-8?B?MHZ0bkhwTHVVMXQxUHlGRnI4Rno1YXdidkUyL3FhcjRzcGp6eTEvNi9tNkU1?=
 =?utf-8?B?RUJVQmtLakRlQlRQdmIzSnd4MFRLclNCSG1oeTZtampyalEvZTZCb3hvRXVs?=
 =?utf-8?B?T0hmdzNmS3I5SUtvelVMQzRkUWRkdzJmVzlOZ1ZTODBzUXIzVmJ3dmpWQkEx?=
 =?utf-8?B?S2pLZ0dFMzU0SkpSbDRySHNmcHk2ajdZTjl4TDhublRSa2VvMlNvNVVCVWZp?=
 =?utf-8?B?bkRXU2NsS2s4RGlVTiszOFUrQ0RqQXRyNWh5Z0VCUkU3cGhKNmYzMnd6M0RD?=
 =?utf-8?B?akFwVW5lNjhvTkJ0c1czM2lCV0NhSHpSTHhWeWE0cEFBVGlRVTA1aEhnUlp0?=
 =?utf-8?B?a01tOHZEV0t1MCtsNS9qS3VHV0cydmljQytrS01uTTdsMk8ySlBsZ1Z2Z3kx?=
 =?utf-8?B?bk16ME44dlN1U3A4dHV5d2R3eFdsQmdsMVFYb1Rwczk0eHYyQ1Fvb0Jlb3N3?=
 =?utf-8?B?UW5BM2xYS3YyTWMwOWRtM3V3UkRzZThrMUpuTWdEN2VCY0lXVnR4UVZqMmtt?=
 =?utf-8?B?cmg0RWUvUEJraDZ5anZUdTJraC9uRTdvV1BvTXp4UTR3VTFleXhpSFdDYkRQ?=
 =?utf-8?B?Q1FsaHNXNzF0dk5WRjVwSFNtNjRqNnFQRG9ZbURSL0Q2RnJQVHB4TElDcU04?=
 =?utf-8?B?bHd5d3hhSlBGdk1lanN5dFBKQ2o2bjZINVpxa2NYelkvc21ZYm93MWRENGJH?=
 =?utf-8?B?V3R0OG9rN3JaUXdNRmVpMDJwekIvWTYrRnR4cVR4TDRWU21IY3pnY0NxU29l?=
 =?utf-8?B?c3dndmZtcWI3Zk5IZGM1VTNEMDZNeXQ4K1V2eEFQd2FGbjVDTWRvdjY2SGZI?=
 =?utf-8?B?SDU4eDhQN21scXN3TStBckxCeFZsQk84VDQzT04rNVovK1RaNVNmbEpoaWRQ?=
 =?utf-8?B?SUZmaCtwM2dJc1ZhZDllUkcreEZ0RDByYnIzWFk3U0l3SjBvTk1TRTNjaEcy?=
 =?utf-8?B?bXVmbnpwRW1naVpQQnRHNVpRc2w3MzNBUGw4R3RYSHlGZ0graGM2MkRwL1Nt?=
 =?utf-8?B?SXpicHhSYld3RC8wOHJRdldsM05uQm9QeHRJMzlDWkdmK0dha05kNFZJWmRE?=
 =?utf-8?B?TnJpSWhBclVMTExPUXUxdjJocXRnWGdpSDBnMlR0UElMcXk5VGtGZWM5ZjBP?=
 =?utf-8?B?clZXN3ZZUnpWU2RsZFZyRkRPcVNkTUQzWnl0TjZVMUVEVVZ2TWcrVUJEOTlx?=
 =?utf-8?B?Z1plSzhqSU8xRzhabnFvN2MwMXB1OG5kUHVaK2srUTZVdTRmTDdYaGh4L3Rz?=
 =?utf-8?B?RlB6cUxRSzFnNHNQWHZRU1pZQTg5UU9PTTBrWU80YnRvcFRqZ2JZTXFvc3pK?=
 =?utf-8?Q?/7up3xYz4nKfFtztUfjKBohj8jDa1mtv7rMr0F7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8cf405-d9f4-494d-ab73-08d941672d65
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5138.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 16:49:24.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JcUVlpVokvU0i/vCr9WPHRPi/oXnlCp6h2gGphXIEvndgHRXxRJYgTA+d9Y4cSv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5345
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
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-06 9:08 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d7e65a44-388a-4a16-1781-a38953851ebc@amd.com">
      <pre class="moz-quote-pre" wrap="">
Am 2021-07-06 um 11:36 a.m. schrieb Colin Ian King:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

Static analysis with Coverity on linux-next has found a potential null
pointer dereference in function svm_range_restore_pages in
drivers/gpu/drm/amd/amdkfd/kfd_svm.c from the following commit:

commit d4ebc2007040a0aff01bfe1b194085d3867328fd
Author: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a>
Date:   Tue Jun 22 00:12:32 2021 -0400

    drm/amdkfd: implement counters for vm fault and migration

The analysis is as follows:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks. Philip, see inline ...


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
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
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Looks like you need to add a NULL check for prange here.</pre>
    </blockquote>
    <p>yes, prange will be NULL if fault is on invalid virtual address,
      we still need report and count the fault. I will send out patch to
      fix this case.</p>
    <p>Thanks,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:d7e65a44-388a-4a16-1781-a38953851ebc@amd.com">
      <pre class="moz-quote-pre" wrap="">

Regards,
&nbsp; Felix


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

The jump in line 2460 to out_unlock_svms will occur if prange is null,
however, calling svm_range_count_fault with a null prange will cause a
null pointer deference when it calls svm_range_get_pdd_by_adev and
dereferences the pointer as follows:

    p = container_of(prange-&gt;svms, struct kfd_process, svms);

Colin

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
