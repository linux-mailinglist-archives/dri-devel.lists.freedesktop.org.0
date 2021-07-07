Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF83BE079
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 03:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C13E6E7E5;
	Wed,  7 Jul 2021 01:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272D46E7E2;
 Wed,  7 Jul 2021 01:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR4Us5UxHRTQxb4UOWMMYtAvVUG48PdAdhvNvD8UPGiHJequYVbfscKU61gA+XlHIXT1Ck3k9f5fWhJ/8WCck9KoN/mImy4lzJryD2YvHsfsbBMWxShH9uUIDYDOB11e0z0jYlO6YtstXCmJOUyckfwPPmxZW9xXoYtvsQJcoz6nRJsPoiER014T8Ubky1N6cQe6pPfse1bjF1//YQZDxaTfGnXcEoavIttrkBu6Fgujq4L045z9Nw5J0NQcRsI8Omft2mGP8f84jQ56LRRbvtrXT7VK1scRGK2C34iLS3AE+tovZ6y0Rr4mIMm0/YRlm2RzW3KdRPm+MRHX5nICAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gCkNLO+ioBM72AZ63rKQOv7BT1XpHDCaY6TnFL/oFw=;
 b=NwMKoIxEvCLojXBK4cRF0aPEybgsGoHAlEZzTu0g2uWtClNUYM+x2tsALJRzTQZU0lL4HXDE4KvkHm7gv0FMKdmdxOhmcqX/09t25E0oupBqQaloKmx1g+0nZLrfB0ZoAbe/ut2UV/a0it7H8ez5Mze9f5J1n1pHoD7rmLC00BnCMxCg+j4+OvPQ0xmTU9DIC38qp7vfnmEl2AAS/O0fJKnyykakewkMM6yXZxcclViRB7XA+sb4KzXmZgCqqCP+SfROtNI7rNSvmOFidflm/x8UdANG8Cwv2nUQZN4CTXQM8Zal4/DR2LZPSYaHVe/txVX83IFPE5Cx7sCy6LvVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gCkNLO+ioBM72AZ63rKQOv7BT1XpHDCaY6TnFL/oFw=;
 b=b5N3J3VcxKWeiXjJcM/c+ygC4GODeu8QgZLa0IAubCUaW+zvl7gJiW8D8nqyl01/ew3Z6KbqIKptNwNJDRpU1qSXyJPa9e6p6eUL0F8L0JEIT3wb4NiHxFHqdJ/v7EV+g0XbDGIuZTlYNwN0OSD3l+crBFrezGyh+5S2OS0vDBA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5178.namprd12.prod.outlook.com (2603:10b6:408:11b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 01:08:49 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 01:08:49 +0000
Subject: Re: drm/amdkfd: implement counters for vm fault and migration
To: Colin Ian King <colin.king@canonical.com>,
 Philip Yang <Philip.Yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <d7e65a44-388a-4a16-1781-a38953851ebc@amd.com>
Date: Tue, 6 Jul 2021 21:08:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 01:08:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ce43ec-071a-4233-8c59-08d940e3c719
X-MS-TrafficTypeDiagnostic: BN9PR12MB5178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5178A7AF9066C7264BC0D276921A9@BN9PR12MB5178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McEhkKu1eO7ryIRx/6MGY+BVXBOmXp/oHxuk68IJcyftWXdTiqIHQH5xJmv1sHU2oR/c6HiNA3P9UerIeEmf/jwvq1xmWtD8dDCvgBGqMhWYMjzVVcPQ0LA0CI3d+AB+J1K8sC+lii3LwJEZ3DM2SA88V8iYJoH+uU6ikuoggN2G/dXcmdho2rHcSsZX4Qw4z2395YdgahcO6giWl4VSQd2ii3FVYLUYWqSZ4tyD3WTgH5PRvJ2VnDLJ04D3C4eoTLdGhfdxTz8roZDTRw7G4jWj5rL6RtuwO8nYr/D/E3B2FrSz5JX9SClwCcS5r+7PR7poHkIJQtn6xvHVAkKliioawA5bM3y7/f+tF4jcLcZdtXINfHdsUfSxotls2xGZ2joY5bb9hgEGfwEgCgSidaFTrdAiuEbRwmVbWBiZovgtOPomk34fyfz6Sh7ExegokGlXgZQM+tBL9AKqnzyZZVNtgTTv2+94zEA17iJh4kL6PiDL4sUDwWV5RC802agto1GnGbnkZ+A9pyTrMyO1N/NpW3y3/k+lck9akuiBl53kRZ+iXugARa6GUh+YZQ8DGW0j4dG+A39BegyrXRBmy9zEAKbPG5nIhrIKKJe72vhA5N+gaurhhIVGRp80LK0hbmf3VQypeV1uNgM9jDfBRvHRiMxOZ4ysWE92USzGlr/eGfSzkHF1FjZR/BjupZC9Eal2Pkgc3lFpN0Qq5dUVGWTxwX9xOkznDbL6cdmGcRpUcJ6TaSJeFfi++pM8ANvSFgJJBCy56DhaLAO6DsakAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(16576012)(31696002)(83380400001)(86362001)(8676002)(44832011)(2906002)(8936002)(316002)(478600001)(38100700002)(2616005)(31686004)(110136005)(4326008)(66556008)(54906003)(26005)(66476007)(6486002)(66946007)(956004)(6636002)(186003)(5660300002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWEwdFU3YUx2YmtTZEVHWVI3ZWk1RWl0c2VxWk9NLy96OTY5cnMwTVBFWHc3?=
 =?utf-8?B?cDFFRVBKdWtCdUZxaUJlWFNGMmNxeHdHUlR6L1A0TXo3UzJCdmEvV3lrTVZy?=
 =?utf-8?B?R2l2UktBbHpLZE5BWWhKN0cvV0JWNWVJWWJGZEQyTGFMMlFnVnZxNCsvY1VR?=
 =?utf-8?B?Y1IyRmpDTlZ3ak5ESzc2VEd4cHc3RHJHaGhHUWwxZ0sxcDZTWktHY2xrZHZJ?=
 =?utf-8?B?KzZDNXdrcmhGaFlNazY0Mm1PRnRkOHdVL2UweEVSV3VWcCt5eDVXQStYTDNt?=
 =?utf-8?B?OW9OVFZEbnFIeSs2aG9tcWs3bTdEdGZ0Vm5FRG82SDNMaDV6VU5YQXpWWGw5?=
 =?utf-8?B?RUZiY1YrYlBzTmgwcWNuSnF3VzNwR0d4NzA3Q1hVd1p5WG9GOVRoeVJZSTN4?=
 =?utf-8?B?Yk1FVUM5ak5IdHNFUUJCalZvaS9XUWgxWkdtWkR4bVNocXJJZ2p1VjdoUW1C?=
 =?utf-8?B?NHdSZlc0WWVKbXRtWkNZYUlxbWFkK1dXcG9rSlV5UVpvNlpnYWozTFZCYndI?=
 =?utf-8?B?VjlGRVlEUGdXQ2JFU2dYOXJ0cjJmcnBvTnBiUnJKN2NhQmVUT3NHcyt3OFBy?=
 =?utf-8?B?b3BiUDd6K2ZaZld1dTh1NmVrclh1c2lhWCtyVjA3NlhKSU9Mb1VOd0RTZktD?=
 =?utf-8?B?Y2JMVndkeEJNVlcxVnYzSEc3Qi9tNUx2UVlxU21nVFVwWHBoVjJHYXIrOUhO?=
 =?utf-8?B?aUpuT3htSUhjZEh6dUZXaVRJMkl0YmxtMWVzWGgzWjNPVjlUQ3BjbWhzdXNK?=
 =?utf-8?B?Q3R0TG5XWU1IVnd4OGdUN2tyYUgvZjFUWDZadXZFMXh4T1AxdGV1VzJyZUho?=
 =?utf-8?B?bjcwbkNQNFZiazk2d1psMWdYdFoyYWk3TFc3WklvR3lNL2dlcmdyMlQwT1BS?=
 =?utf-8?B?S2E5SU1pdk5BWUZKcWwzREtWdHBKWVlycDVId0xxdVBScXBXSGxVaUtoVDZU?=
 =?utf-8?B?WHdLK1EzQnN5Z3N3cy9HNnkyelpINFVza1NmNWlxK2RXNksxRWxkNnh0bUZ0?=
 =?utf-8?B?T2IxUnd1cjd2NWNieHVDcFYzUE5zd3dISnZXZmtTbCtMaTR6MTJZNHNMSUpv?=
 =?utf-8?B?ZVRwUGlDdzdhbUQ1SUQ1dWZNU0hBc1BHQlZ1c3orcW9rRGJPQ0FHZnlEVS9F?=
 =?utf-8?B?UWtmbXJjZ3NiRmgyVm90UHNMWUVhSVFlSFpnRFFZK1F0ME9ldFhJNWlNK0wx?=
 =?utf-8?B?bzFuWXJpUU1xMUxHb3dsU2hicXBNMVEwaXRHNmg5Q3h1RmQyK2ZYUlRMdHcv?=
 =?utf-8?B?ZjZvTzYyZnJVZ1ExM2J2eFRnYUpOQkFyK1NMampjYjRnTTBGeHEwc0Qza2hv?=
 =?utf-8?B?enNKKzljWnNMdmNuc3lsMnNBVTlhSHZrUS92UFFnb01wR25PRzRGaHdSUDND?=
 =?utf-8?B?Qjd4bkRSd1Y0UlUrV1pmTHZEcjdUcGJGRDZ3QXFyUXB6bUk3QmlCQ3c0Z2ZG?=
 =?utf-8?B?Y0VsNjl0SnlmcU5ER1Q4OWQwNkVBMm1pcUFIZE00YzJFRWx2K1k0Ymk0ZmZX?=
 =?utf-8?B?cTJrRm1nckNlcTRrcFB6YnRROG50Qjd6eDErTHo2QlQzem9tQnBBbEtZbHdO?=
 =?utf-8?B?L1BRMExTVzFVaGdZSk1qZm5wZXBiV0dEcXhMOFdZaWlOUEs3ZlpjWkE2VVFo?=
 =?utf-8?B?SjBXdFEwUmJZNFdMQ0xwM3R6ZEZPV24rNlc0d3N3bHBSMnIrcXp0TjVpSjRn?=
 =?utf-8?B?TG9JMTYvR1NSRGYycGYyMCtXRkYyWnVlSisrdEs3eWNWbjNPSUJ0V1JmeGZW?=
 =?utf-8?Q?UbgHP5aLOlrnGqWzc1D50ptZvsYwjFWzWiW6H6/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ce43ec-071a-4233-8c59-08d940e3c719
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 01:08:49.3542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0R07o+J0YV7dUoIQgMxt9g2cS2YXgd4gB0bcUZltuDrPCqZvp/75eH03ExX/LlLEg/m2ViQ3yPl8iDX2vae7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5178
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


Am 2021-07-06 um 11:36 a.m. schrieb Colin Ian King:
> Hi,
>
> Static analysis with Coverity on linux-next has found a potential null
> pointer dereference in function svm_range_restore_pages in
> drivers/gpu/drm/amd/amdkfd/kfd_svm.c from the following commit:
>
> commit d4ebc2007040a0aff01bfe1b194085d3867328fd
> Author: Philip Yang <Philip.Yang@amd.com>
> Date:   Tue Jun 22 00:12:32 2021 -0400
>
>     drm/amdkfd: implement counters for vm fault and migration
>
> The analysis is as follows:

Thanks. Philip, see inline ...


>
> 2397 int
> 2398 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
> 2399                        uint64_t addr)
> 2400{
> 2401        struct mm_struct *mm = NULL;
> 2402        struct svm_range_list *svms;
> 2403        struct svm_range *prange;
> 2404        struct kfd_process *p;
> 2405        uint64_t timestamp;
> 2406        int32_t best_loc;
> 2407        int32_t gpuidx = MAX_GPU_INSTANCE;
> 2408        bool write_locked = false;
> 2409        int r = 0;
> 2410
>
>     1. Condition !(adev->kfd.dev->pgmap.type != 0), taking false branch.
>
> 2411        if (!KFD_IS_SVM_API_SUPPORTED(adev->kfd.dev)) {
> 2412                pr_debug("device does not support SVM\n");
> 2413                return -EFAULT;
> 2414        }
> 2415
> 2416        p = kfd_lookup_process_by_pasid(pasid);
>
>     2. Condition !p, taking false branch.
>
> 2417        if (!p) {
> 2418                pr_debug("kfd process not founded pasid 0x%x\n", pasid);
> 2419                return -ESRCH;
> 2420        }
>
>     3. Condition !p->xnack_enabled, taking false branch.
>
> 2421        if (!p->xnack_enabled) {
> 2422                pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
> 2423                return -EFAULT;
> 2424        }
> 2425        svms = &p->svms;
> 2426
>
>     4. Condition 0 /* __builtin_types_compatible_p() */, taking false
> branch.
>     5. Condition 1 /* __builtin_types_compatible_p() */, taking true branch.
>     6. Falling through to end of if statement.
>     7. Condition !!branch, taking false branch.
>     8. Condition ({...; !!branch;}), taking false branch.
>
> 2427        pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms,
> addr);
> 2428
> 2429        mm = get_task_mm(p->lead_thread);
>
>     9. Condition !mm, taking false branch.
>
> 2430        if (!mm) {
> 2431                pr_debug("svms 0x%p failed to get mm\n", svms);
> 2432                r = -ESRCH;
> 2433                goto out;
> 2434        }
> 2435
> 2436        mmap_read_lock(mm);
> 2437retry_write_locked:
> 2438        mutex_lock(&svms->lock);
> 2439        prange = svm_range_from_addr(svms, addr, NULL);
>
>     10. Condition !prange, taking true branch.
>     18. Condition !prange, taking true branch.
> 2440        if (!prange) {
>     11. Condition 0 /* __builtin_types_compatible_p() */, taking false
> branch.
>     12. Condition 1 /* __builtin_types_compatible_p() */, taking true
> branch.
>     13. Falling through to end of if statement.
>     14. Condition !!branch, taking false branch.
>     15. Condition ({...; !!branch;}), taking false branch.
>     19. Condition 0 /* __builtin_types_compatible_p() */, taking false
> branch.
>     20. Condition 1 /* __builtin_types_compatible_p() */, taking true
> branch.
>     21. Falling through to end of if statement.
>     22. Condition !!branch, taking false branch.
>     23. Condition ({...; !!branch;}), taking false branch.
>
> 2441                pr_debug("failed to find prange svms 0x%p address
> [0x%llx]\n",
> 2442                         svms, addr);
>
>     16. Condition !write_locked, taking true branch.
>     24. Condition !write_locked, taking false branch.
>
> 2443                if (!write_locked) {
> 2444                        /* Need the write lock to create new range
> with MMU notifier.
> 2445                         * Also flush pending deferred work to make
> sure the interval
> 2446                         * tree is up to date before we add a new range
> 2447                         */
> 2448                        mutex_unlock(&svms->lock);
> 2449                        mmap_read_unlock(mm);
> 2450                        mmap_write_lock(mm);
> 2451                        write_locked = true;
>
>     17. Jumping to label retry_write_locked.
>
> 2452                        goto retry_write_locked;
> 2453                }
> 2454                prange = svm_range_create_unregistered_range(adev,
> p, mm, addr);
>
>     25. Condition !prange, taking true branch.
>     26. var_compare_op: Comparing prange to null implies that prange
> might be null.
>
> 2455                if (!prange) {
>
>     27. Condition 0 /* __builtin_types_compatible_p() */, taking false
> branch.
>     28. Condition 1 /* __builtin_types_compatible_p() */, taking true
> branch.
>     29. Falling through to end of if statement.
>     30. Condition !!branch, taking false branch.
>     31. Condition ({...; !!branch;}), taking false branch.
>
> 2456                        pr_debug("failed to create unregistered
> range svms 0x%p address [0x%llx]\n",
> 2457                                 svms, addr);
> 2458                        mmap_write_downgrade(mm);
> 2459                        r = -EFAULT;
>
>     32. Jumping to label out_unlock_svms.
>
> 2460                        goto out_unlock_svms;
> 2461                }
> 2462        }
> 2463        if (write_locked)
> 2464                mmap_write_downgrade(mm);
> 2465
> 2466        mutex_lock(&prange->migrate_mutex);
> 2467
> 2468        if (svm_range_skip_recover(prange)) {
> 2469                amdgpu_gmc_filter_faults_remove(adev, addr, pasid);
> 2470                goto out_unlock_range;
> 2471        }
> 2472
> 2473        timestamp = ktime_to_us(ktime_get()) -
> prange->validate_timestamp;
> 2474        /* skip duplicate vm fault on different pages of same range */
> 2475        if (timestamp < AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
> 2476                pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
> 2477                         svms, prange->start, prange->last);
> 2478                goto out_unlock_range;
> 2479        }
> 2480
> 2481        best_loc = svm_range_best_restore_location(prange, adev,
> &gpuidx);
> 2482        if (best_loc == -1) {
> 2483                pr_debug("svms %p failed get best restore loc [0x%lx
> 0x%lx]\n",
> 2484                         svms, prange->start, prange->last);
> 2485                r = -EACCES;
> 2486                goto out_unlock_range;
> 2487        }
> 2488
> 2489        pr_debug("svms %p [0x%lx 0x%lx] best restore 0x%x, actual
> loc 0x%x\n",
> 2490                 svms, prange->start, prange->last, best_loc,
> 2491                 prange->actual_loc);
> 2492
> 2493        if (prange->actual_loc != best_loc) {
> 2494                if (best_loc) {
> 2495                        r = svm_migrate_to_vram(prange, best_loc, mm);
> 2496                        if (r) {
> 2497                                pr_debug("svm_migrate_to_vram failed
> (%d) at %llx, falling back to system memory\n",
> 2498                                         r, addr);
> 2499                                /* Fallback to system memory if
> migration to
> 2500                                 * VRAM failed
> 2501                                 */
> 2502                                if (prange->actual_loc)
> 2503                                        r =
> svm_migrate_vram_to_ram(prange, mm);
> 2504                                else
> 2505                                        r = 0;
> 2506                        }
> 2507                } else {
> 2508                        r = svm_migrate_vram_to_ram(prange, mm);
> 2509                }
> 2510                if (r) {
> 2511                        pr_debug("failed %d to migrate svms %p
> [0x%lx 0x%lx]\n",
> 2512                                 r, svms, prange->start, prange->last);
> 2513                        goto out_unlock_range;
> 2514                }
> 2515        }
> 2516
> 2517        r = svm_range_validate_and_map(mm, prange, gpuidx, false,
> false);
> 2518        if (r)
> 2519                pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx]
> to gpus\n",
> 2520                         r, svms, prange->start, prange->last);
> 2521
> 2522out_unlock_range:
> 2523        mutex_unlock(&prange->migrate_mutex);
> 2524out_unlock_svms:
> 2525        mutex_unlock(&svms->lock);
> 2526        mmap_read_unlock(mm);
> 2527
>
>     Dereference after null check (FORWARD_NULL)
>     33. var_deref_model: Passing null pointer prange to
> svm_range_count_fault, which dereferences it.
>
> 2528        svm_range_count_fault(adev, p, prange, gpuidx);

Looks like you need to add a NULL check for prange here.

Regards,
  Felix


>
>
> The jump in line 2460 to out_unlock_svms will occur if prange is null,
> however, calling svm_range_count_fault with a null prange will cause a
> null pointer deference when it calls svm_range_get_pdd_by_adev and
> dereferences the pointer as follows:
>
>     p = container_of(prange->svms, struct kfd_process, svms);
>
> Colin
>
