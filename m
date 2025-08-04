Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B4B19ACD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADEB10E29B;
	Mon,  4 Aug 2025 04:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3+r8ee1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7D10E29B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 04:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG4D7Nd8TChdkJtP7pNBeo2R0wbgVeZ1t0E6EkNjLSWXTuJCFEzw7sfuJsC2XwmH6E8RdQ4NhzHSql7lPG6W895vcU6QCUitpPpvjwIMrvSRr56mhVtCRnSyWSZGVZ7xvFLsRX+Nn5CiICrKszfqgFwYk0s4IZgEvPxt36jD05vYIhZDe9+GyyoPU7Q9mCYSy6pBlfTkBvO+eCI8qVsd6CVkAnh6GTFeqDwwC6S6e4iMP9GOJp2zY5gcp2VBB2MO9/E0CuJpw1U2qvRaDErqNXsAwRECfViUxVaRGSbfAB1PD8vDKWOxVsVtJjckfMrR2WM4RlnTDhjS3F0LVyg6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKTW7+mtEV23nZqDXR/oPCYndwDALSfPYNOkUJHzfXI=;
 b=j0icYVu6tAIiIsxmSM1guqt78T8sbozMeMXmGS1JYnwAe5kGYVLCIaJ+alwxAYcrlNoFqBbmFFd9zrXPFbrJ9EWdP9H6isZihjgIvCJpkM1VIj9LM6yFhx5TFHGexIlKYBgXbnZ61DqqYTElrCDWxeWSYJVlw59Fh4ajzCyXknWHmIc4dshf7lWk7vPh2I1IglSIUuPkxUY7o6qBP5FkGJuVVZ9ZUN64FDg1KfHeAUFNll+J19a3ODVqUJgXtKt4KKs2DpiJ0JIIIdShefslaQ5pSDkXpFsqwBwDLgynNl9kI6WYYYOzcw2XHLB217XJsU906bIJiDVCQriONjdPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKTW7+mtEV23nZqDXR/oPCYndwDALSfPYNOkUJHzfXI=;
 b=3+r8ee1fEeMp8x8HdwtOTMbpObHspRC7jCBIDHJ3Sx0xjYoVC2Cm+kBOlM7D0trmEvD8LrVNbj9bWAwnUGNOR0H7bOg3pcKv3WNnNG9KHIpmKh05tfyI/IbCgxwutAm5lRmb7FyKmlqtmrMNOlWDpl9xgSFsdVLJGje/yQgxGEY=
Received: from BL1PR13CA0204.namprd13.prod.outlook.com (2603:10b6:208:2be::29)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 04:43:04 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::a6) by BL1PR13CA0204.outlook.office365.com
 (2603:10b6:208:2be::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.12 via Frontend Transport; Mon,
 4 Aug 2025 04:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 04:43:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Aug
 2025 23:43:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Aug
 2025 23:43:00 -0500
Received: from [10.85.42.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 3 Aug 2025 23:42:56 -0500
Message-ID: <6e82f186-e059-4535-a0f5-848a055058f3@amd.com>
Date: Mon, 4 Aug 2025 10:12:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: <syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <simona@ffwll.ch>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <kernel-team@android.com>
References: <20250801192157.912805-1-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250801192157.912805-1-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: eef1064b-3700-4328-6724-08ddd3116618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHhTL2ViZ3p2RllPOTVKNWwyVUpucjE5RUtsRUpEeUJ6S2JsOFE1bVZjbTkw?=
 =?utf-8?B?NGJkd0RNbUlpVzlnRHE4bmQ5MDg2bC9wK1ZaMUJkZkpUODNFTGZuQU42akJK?=
 =?utf-8?B?U2FSZzh1VlZjYjZncVp5TTV3SGtsQlRYVEJINWJMajRoSUhxc2hvencvMUd2?=
 =?utf-8?B?eENWRmFtUzV2TElBRDFIa0RuTTVVTjVMZHpnbDF4Ykl6VTNoWlpYUmxRV0RV?=
 =?utf-8?B?QjRwd0FsSmZOVXNpU3M1Zm82YVRFSUlzb0Y1VWRMVUYvL3FtNUNPNjhPczRI?=
 =?utf-8?B?QWkveDZ1T2NtU3I1VllIcU5rMVBqY2pQKzdqbWZvQWtMeXd2Vk5iYjJVR2lF?=
 =?utf-8?B?eWN2L1VvcG9tV01ZNW1mTTRMWlk5ZmRkWjJ2aDhyMnNnTFNLM3kremZ6S1lp?=
 =?utf-8?B?ajBENTVzN0tWQ1I0SjhoS0lnakpON1BKMUJKQmFEL0lzbEpRSnNwcTNVcGF6?=
 =?utf-8?B?MTQ0R24xWDg3aWhaMnZ6UGkva3dtbm96cjB3WmhObGZzcmRsOFZyYzQ4WWhT?=
 =?utf-8?B?OGxTNmgwM3lwWHJoZm5sQlU1S2xDOExmcWlJbS9rS2ROc0QrcDViQldGdmNP?=
 =?utf-8?B?d3JjdUVuYjlYTWptQ3o1RHNDVlBGbHhqbDlPRWN3dWx5MFhJT3JWam9remJ3?=
 =?utf-8?B?NWowbU41Z3BLL3VPWVI2Q3kxajNybnVMRWVFL1FKMi8yZkxXRmRsWW5sQ3hI?=
 =?utf-8?B?VnhDb0xBK251dlJzb0d4aDcrV0x2QXRuNERoamRhMnFYRGJtU3IyV2VJVDdr?=
 =?utf-8?B?RzJYbUpZZ0pnVCt1UktCVnd1bCttdVJqZllSVXo2bDlXSkhzUDVFUzVzQm5J?=
 =?utf-8?B?OFBQNytZTVM3NXI1NWl6WlMrM1AzUy9EazRoV1pRRWlQSGdNUktvTnpZckNI?=
 =?utf-8?B?R3E0cjYzbVdsU2RteXVOcW44dDQ5dSs5SnY1UHlNYThpZU9GTURTbUlxbG5Y?=
 =?utf-8?B?MVY5NDRUTFI4UU1ISUloMStFd3ZoRVROQ090UEh4b0N4RHVMOEpHekZxRUp0?=
 =?utf-8?B?Ym81L1dSME4zUXpqRFVYUUd6Z291akZKeWEvUzd3dERhWHVWNXI4ZjFCRE9l?=
 =?utf-8?B?SEFiR3ZkQ3R6SkVjMjBiTmx3RU9uNzRkam9tamtodnBwYUN5ZTFvSW9tT1V0?=
 =?utf-8?B?Z3pOYkR2SEErMzI2ZHFLMGVUQnFvNXI5WkRVQXpZbm9RcEZTY0M3Z1FBYTUv?=
 =?utf-8?B?ZnZ0SWpnSjdrbCtrNmoxK0lidldOeldhT1Zka1NpRC85aEpaZElxTW81Y3B4?=
 =?utf-8?B?M3VIYVJneGtJYnFVZytCdTBiOXk2YjFxWjBiUERYWXdveEVTamJKVVBHSkEz?=
 =?utf-8?B?YlR2REtQZVNrdi9IMmhISGhHWTNueW42NVVGNHNTSzZndjdGZFdXNk8rUVYz?=
 =?utf-8?B?ZC92NngvVFVxQWJGMTRGL2ZybWFBSGpVbVhadFdMU01KOFM0d2VqNnpwV2RU?=
 =?utf-8?B?SjZRekxkUEV6N0VRYUlXby9RanZwd0NtdlNwNDhNK0tmS3FPVml3aHhtSnpM?=
 =?utf-8?B?RUNLUy8wM0RWeFBKRTlPMUNRZEphZm5NWVJZdFE5R3pwazBuMjFUVGRlYytC?=
 =?utf-8?B?bS9CTy91RmE1bm5GTEJmanhQODd2UUh4R2hIalAxb2E2MDR5U3NtQnQyaktQ?=
 =?utf-8?B?cmQrVG9wV2tCcmZHK0tSeEZCSHd6U21uV1RXVnpnSkU3VVBKQUUyaG4xaGp1?=
 =?utf-8?B?eXJLWTIwWGtOY016L2Z1SXdpOXowWGFBZFE3Y28yK29hTEJUL2dhQTAycEZF?=
 =?utf-8?B?R09XcVU0WExETWdVWWY1cmY0YzVobGVhRnZoSUVQdXFiSVBaRVlWdGYxU3ls?=
 =?utf-8?B?RnJDVlVNYzQ5Q1BhT1lPQjBxekxsNkUyVC9CTzFTcExZLzl5T0Jjbk9FbEFt?=
 =?utf-8?B?L2tVQmVDYkhwZmNXS2t0V3R5QWgrL3FzaXp6dE53R1BHZEtmTDM3elR4OFlG?=
 =?utf-8?B?UVQ0bjkycWRUay9LZ3h0eTZ6UmVSV0VCYUtSTlJ2dHpQK2JOVGJrYWY0S3c2?=
 =?utf-8?B?NzJ6U1UzeTFRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 04:43:03.6842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef1064b-3700-4328-6724-08ddd3116618
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037
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

Hello John,

On 8/2/2025 12:51 AM, John Stultz wrote:
> The __clear_task_blocked_on() helper added a number of sanity
> checks ensuring we hold the mutex wait lock and that the task
> we are clearing blocked_on pointer (if set) matches the mutex.
> 
> However, there is an edge case in the _ww_mutex_wound() logic
> where we need to clear the blocked_on pointer for the task that
> owns the mutex, not the task that is waiting on the mutex.
> 
> For this case the sanity checks aren't valid, so handle this
> by allowing a NULL lock to skip the additional checks.
> 
> This was easier to miss, I realized, as the test-ww_mutex
> driver only exercises the wait-die class of ww_mutexes.
> 
> I've got a follow up patch to extend the test so that it
> will exercise both.
> 
> Fixes: a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
> Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
> Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://lore.kernel.org/lkml/68894443.a00a0220.26d0e1.0015.GAE@google.com/
> Signed-off-by: John Stultz <jstultz@google.com>

I've been running this for a while and haven't seen any splats with
syzbot's C reproducer.

> ---
> v2:
> * Rewording of "lock" to "mutex" in commit and comment for
>   clarity
> * Rework __clear_task_blocked_on() to use READ_ONCE and WRITE_ONCE
>   so we don't trip over the WARNING if two instances race, as suggested
>   by K Prateek Nayak and Maarten Lankhorst
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Suleiman Souhlal <suleiman@google.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: airlied@gmail.com
> Cc: mripard@kernel.org
> Cc: simona@ffwll.ch
> Cc: tzimmermann@suse.de
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel-team@android.com
> ---
>  include/linux/sched.h     | 23 +++++++++++++----------
>  kernel/locking/ww_mutex.h |  6 +++++-
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 40d2fa90df425..700b50d29f7fe 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2166,16 +2166,19 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)

Should we consider using WRITE_ONCE() in __set_task_blocked_on() and
use a local copy of "blocked_on" there too?

I think a set_task_blocked_on() on a separate ww_mutex can still race
with a wound on the ww_ctx which indiscriminately writes NULL to
"owner->blocked_on" and can possibly lead to a splat for:

    WARN_ON_ONCE(p->blocked_on && p->blocked_on != m);

                 ^^^^^^^^^^^^^    ^^^^^^^^^^^^^
    Sees p is blocked on "m"      Turns NULL as a result
            already.              of a concurrent wound.

A READ_ONCE() and WRITE_ONCE() in __set_task_blocked_on() should help
solve the splat in this very unlikely case too unless I'm mistaken.

Apart from that, this fix looks good. Feel free to include:

Reviewed-and-tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

>  
>  static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
>  {
> -	WARN_ON_ONCE(!m);
> -	/* Currently we serialize blocked_on under the mutex::wait_lock */
> -	lockdep_assert_held_once(&m->wait_lock);
> -	/*
> -	 * There may be cases where we re-clear already cleared
> -	 * blocked_on relationships, but make sure we are not
> -	 * clearing the relationship with a different lock.
> -	 */
> -	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
> -	p->blocked_on = NULL;
> +	if (m) {
> +		struct mutex *blocked_on = READ_ONCE(p->blocked_on);
> +
> +		/* Currently we serialize blocked_on under the mutex::wait_lock */
> +		lockdep_assert_held_once(&m->wait_lock);
> +		/*
> +		 * There may be cases where we re-clear already cleared
> +		 * blocked_on relationships, but make sure we are not
> +		 * clearing the relationship with a different lock.
> +		 */
> +		WARN_ON_ONCE(blocked_on && blocked_on != m);
> +	}
> +	WRITE_ONCE(p->blocked_on, NULL);
>  }


