Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2393BDA50
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7469D6E507;
	Tue,  6 Jul 2021 15:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D816E0C5;
 Tue,  6 Jul 2021 15:36:51 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1m0n7x-0007LE-Rt; Tue, 06 Jul 2021 15:36:49 +0000
To: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: drm/amdkfd: implement counters for vm fault and migration
Message-ID: <d4710cb9-d463-5245-127d-4cfa1bc704d2@canonical.com>
Date: Tue, 6 Jul 2021 16:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

Static analysis with Coverity on linux-next has found a potential null
pointer dereference in function svm_range_restore_pages in
drivers/gpu/drm/amd/amdkfd/kfd_svm.c from the following commit:

commit d4ebc2007040a0aff01bfe1b194085d3867328fd
Author: Philip Yang <Philip.Yang@amd.com>
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

    1. Condition !(adev->kfd.dev->pgmap.type != 0), taking false branch.

2411        if (!KFD_IS_SVM_API_SUPPORTED(adev->kfd.dev)) {
2412                pr_debug("device does not support SVM\n");
2413                return -EFAULT;
2414        }
2415
2416        p = kfd_lookup_process_by_pasid(pasid);

    2. Condition !p, taking false branch.

2417        if (!p) {
2418                pr_debug("kfd process not founded pasid 0x%x\n", pasid);
2419                return -ESRCH;
2420        }

    3. Condition !p->xnack_enabled, taking false branch.

2421        if (!p->xnack_enabled) {
2422                pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
2423                return -EFAULT;
2424        }
2425        svms = &p->svms;
2426

    4. Condition 0 /* __builtin_types_compatible_p() */, taking false
branch.
    5. Condition 1 /* __builtin_types_compatible_p() */, taking true branch.
    6. Falling through to end of if statement.
    7. Condition !!branch, taking false branch.
    8. Condition ({...; !!branch;}), taking false branch.

2427        pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms,
addr);
2428
2429        mm = get_task_mm(p->lead_thread);

    9. Condition !mm, taking false branch.

2430        if (!mm) {
2431                pr_debug("svms 0x%p failed to get mm\n", svms);
2432                r = -ESRCH;
2433                goto out;
2434        }
2435
2436        mmap_read_lock(mm);
2437retry_write_locked:
2438        mutex_lock(&svms->lock);
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

2441                pr_debug("failed to find prange svms 0x%p address
[0x%llx]\n",
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
2448                        mutex_unlock(&svms->lock);
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

2456                        pr_debug("failed to create unregistered
range svms 0x%p address [0x%llx]\n",
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
2466        mutex_lock(&prange->migrate_mutex);
2467
2468        if (svm_range_skip_recover(prange)) {
2469                amdgpu_gmc_filter_faults_remove(adev, addr, pasid);
2470                goto out_unlock_range;
2471        }
2472
2473        timestamp = ktime_to_us(ktime_get()) -
prange->validate_timestamp;
2474        /* skip duplicate vm fault on different pages of same range */
2475        if (timestamp < AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING) {
2476                pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
2477                         svms, prange->start, prange->last);
2478                goto out_unlock_range;
2479        }
2480
2481        best_loc = svm_range_best_restore_location(prange, adev,
&gpuidx);
2482        if (best_loc == -1) {
2483                pr_debug("svms %p failed get best restore loc [0x%lx
0x%lx]\n",
2484                         svms, prange->start, prange->last);
2485                r = -EACCES;
2486                goto out_unlock_range;
2487        }
2488
2489        pr_debug("svms %p [0x%lx 0x%lx] best restore 0x%x, actual
loc 0x%x\n",
2490                 svms, prange->start, prange->last, best_loc,
2491                 prange->actual_loc);
2492
2493        if (prange->actual_loc != best_loc) {
2494                if (best_loc) {
2495                        r = svm_migrate_to_vram(prange, best_loc, mm);
2496                        if (r) {
2497                                pr_debug("svm_migrate_to_vram failed
(%d) at %llx, falling back to system memory\n",
2498                                         r, addr);
2499                                /* Fallback to system memory if
migration to
2500                                 * VRAM failed
2501                                 */
2502                                if (prange->actual_loc)
2503                                        r =
svm_migrate_vram_to_ram(prange, mm);
2504                                else
2505                                        r = 0;
2506                        }
2507                } else {
2508                        r = svm_migrate_vram_to_ram(prange, mm);
2509                }
2510                if (r) {
2511                        pr_debug("failed %d to migrate svms %p
[0x%lx 0x%lx]\n",
2512                                 r, svms, prange->start, prange->last);
2513                        goto out_unlock_range;
2514                }
2515        }
2516
2517        r = svm_range_validate_and_map(mm, prange, gpuidx, false,
false);
2518        if (r)
2519                pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx]
to gpus\n",
2520                         r, svms, prange->start, prange->last);
2521
2522out_unlock_range:
2523        mutex_unlock(&prange->migrate_mutex);
2524out_unlock_svms:
2525        mutex_unlock(&svms->lock);
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

    p = container_of(prange->svms, struct kfd_process, svms);

Colin

