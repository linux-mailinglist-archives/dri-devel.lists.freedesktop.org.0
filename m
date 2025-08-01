Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4EB17C48
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 07:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785F10E3A6;
	Fri,  1 Aug 2025 05:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vXHXpKiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7710E3A6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 05:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBxccflnhmS4wGasUHuvpi5ATYz6/g46wk6dVT4J3M2j1CpQ8ZxQObQR7zcOks5ETgO2AO0Ou1mCXQDJep8tG7So3lLJu3YMDSh2jupQKNot7Ibf/QhEEsFXYqWftGDgQgWnd9sr3I10zuPxBw0lnZCrja3Q2UBuBYUI66/wkU7fHNX44w8GzYDMbW5LoWBlooQMkqhRzsbgm0Q+9dKe61eatwx2PawaRcqDgw1W5NS8VMw6CA+oXBTkETJGrjz0hb2ewUnumcQAjgUjg5AvzbIgBBFmKm9f3AqZ+jUx8sF+7Lel70a9FivLQim0sECLzTSj32BcshJz43Zjq2Olnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfOG9CO6tg9eagrNjexTXl9P9mtjz1VL9zCsNGFYpus=;
 b=BTo00/3SK0t8ATdgckI0JcVZhfxg6rHB3kdIzAO+8aS0mfOKekGMtkldQDVBdCAbFw5sCX1G7Z+ToAIw4J/JFXCJV9R81E5zqHIb7BkZPdjQomrIcb5K33bcsNat/nlU2ItPMNxnoNwjLBMnAQ5UU9PyOL5F65oM6FIyJH5uQsSwL92Tg3BbNhCxgfzJWXrQaMi7crgjk2xD8Xriiefy+W3484s53dvcZ2+Nj4OTOXCY19pNzkD+kdCdAhdRgB47nu+FwdX7BAs+boDCFUrevobeh6cxIvcfC8pVuwniRKPaePk3xCgco4w19xGvXRtZTQqKXVHmZfr2P4qMfACICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfOG9CO6tg9eagrNjexTXl9P9mtjz1VL9zCsNGFYpus=;
 b=vXHXpKiHn81WaVLnv1tFM8+drFtNQZkPI9bkoX6yIu2+nBrL0iXcevJPWZkrpSvEf+WXvwAW+hYMeM6s/x0W0+ZuX9oAByXnBxXjWPOiRrgGcKVi1fTk3LoRZ5CU5B6fo6QDfcSPruOuT+EeM5CC/VVKvYQ3Mg7K0Nxu57q+/4M=
Received: from BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19) by
 IA1PR12MB7758.namprd12.prod.outlook.com (2603:10b6:208:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 05:09:14 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:71:cafe::3b) by BL0PR01CA0006.outlook.office365.com
 (2603:10b6:208:71::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Fri,
 1 Aug 2025 05:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.0 via Frontend Transport; Fri, 1 Aug 2025 05:09:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 00:09:13 -0500
Received: from [10.85.43.78] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 00:09:09 -0500
Message-ID: <2812bdc6-8d7e-48a3-8f5b-a26cd5d18c32@amd.com>
Date: Fri, 1 Aug 2025 10:39:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: <syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <simona@ffwll.ch>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <kernel-team@android.com>
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
 <20250731201337.274382-1-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250731201337.274382-1-jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: kprateek.nayak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA1PR12MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc5381a-4006-4d4c-c494-08ddd0b98ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEhCRS9MVEVjZTR4S1hVTm1rZkJ5Vk9xS2c4RUZGbEg3dDVsdkdLMnI5ZDg1?=
 =?utf-8?B?VlJSVFJ2TlN1bXE1T2syK2xTMjdTZjQvdVhJZklkSTdiWmM4NWl4K3o5Nmk0?=
 =?utf-8?B?Nnl0NTNHeEN2ekJjTjVISGF6cVphNDZmZFJseXlUK2hMVGJNbElRbFZCUTFy?=
 =?utf-8?B?MVhmaTFMRDBBczI1emJsVG02UzcxUFpBa0F1UmpYWmEvTDFzUjYyMGVabDUy?=
 =?utf-8?B?ZE05U25KRVB3VGlsVlEwMGx1Rk9SY1lDa2FQQkxBQ3lkS1NLRGxySDJzTE40?=
 =?utf-8?B?a2JrRHY4eWE5M3g2TktsQkloNE9TVnJXS1lDWWl1YUhQdTdpNmtKZlMrZHc3?=
 =?utf-8?B?SVBOUmxMUmxFMFl5eHZveXoxcXlaRUtiT2NBRXBWenNrL2V2TUJISU5MZFdZ?=
 =?utf-8?B?Sm9RazV2WHE0RWVWYzhna1ZwRGZvWWJteXZzQWh2R2VDRXVVdXpVem1TNzEv?=
 =?utf-8?B?Vkw4QnR3SmtCQXF6N1JHdFE5azJrdkNRd0xhNjFSQ1pTWEE5WW03OHdPNXZS?=
 =?utf-8?B?VzBJVUpTRTFXSGxoNjVKdFRJbzdPVitLQjFvbXI4YVBIYkRBQjhTNjdmbllo?=
 =?utf-8?B?SGlUN3cvaEp3TWtiNURPL3ZVM0Vqbm9UY2hrdko2N2Q0VyttNWFqU1FXQ0Ew?=
 =?utf-8?B?QkdKUGp5N2hNVlo4dmZzYVdoc1BSVnc1RmlCclVvelgrdDhiN3BZOStEa3Jp?=
 =?utf-8?B?SWtPWTN2ejY0SHk5eGxmeFBWalc5ellpWFBVL014ZUJaeGVuTXU5b2tsRTdD?=
 =?utf-8?B?eHFzSTdLTkpKN0VSbGRGbzMvcXlvaHhuc1NTVXFxVXlrb2RSVExjU05UUE40?=
 =?utf-8?B?alJSb3M5RHpjOE5aNHYwdks3UjI3WVFIS25qMnIzcjNCZkRGbTU2KzJzdE9a?=
 =?utf-8?B?VzNSdElTVUtNNis5Q041WWJBYXVOOHNtdndHNWhYUnpDT2JPck5vUnEyZEFB?=
 =?utf-8?B?eWRldFFlM3JTTGEvT1h5Sm9mUzB6WS9SdGU0TFNDZDN2SzVKNkJzYWt0K3RW?=
 =?utf-8?B?NEYvWFhuZVpMckhHN0xqZ3NPSEhWTEh5UGg1UnRJS1NZazlEaWJHTWloS0I1?=
 =?utf-8?B?RnJrczVXZWZVRU1XNmJLR1M0eXd1Z2EvMDh6WEdZaVpQajhnUE9HeEIwSm42?=
 =?utf-8?B?azRuNGkya2lSaWNFdGEva1FBNVB5QWIyWkh3dnhrSlJwZ2h3elBtVmZLblFC?=
 =?utf-8?B?ci96QllkQ2VjR25CWmdab0QyUDI3ZVN1d0VueXJrem9GSmZsQU52MlBVbk9k?=
 =?utf-8?B?RXJTc1pQMHdKWVM1VVhYNWhOU0tYaUhyME53SVJyUXh5KzN0MStnWk4wMnlw?=
 =?utf-8?B?ejZKdVpRYlR2RjUveHF5M0VKZHN1TkVmRUVkMXlhUTI4aFRvTHExWjN5OW1E?=
 =?utf-8?B?WE5jck96aXBQOWE4VmFZNTdRUGdBMC9UdnhQVWZZTlQ3UkszcmZuUUF2ZG16?=
 =?utf-8?B?UFptU291dEYwdTJMdzVCd1NOOEpNSjlTTzBGcUVDVTUwMFpmQThVR0NSUmRK?=
 =?utf-8?B?S2hQd0RCNmh2ZFNiekp2N3JSZktEZzFZY1FVV3hpck5zak53ejNQeVR4Rm9z?=
 =?utf-8?B?L0tCQ2lKN0Fpb2I4dktTeUJZc3FWTExsRlhaSWFuNjY0bHBsK0crU2VzQTdI?=
 =?utf-8?B?SXRvNCtnT3Z1YzRFZldMTWFhc2F6ZTlVbW5XYWRPTllvWEJxSi9qem1DWVI0?=
 =?utf-8?B?TnpzaHBJdnF6Tzl4c3RINGJERzFDanMvQ1FmUkhTWXQyZGRLQzc1dVJ1YTFW?=
 =?utf-8?B?dDV1ZTNNeXZ6WVdDcVBnS1lmUHJweWF5WWZxVHNWcWpRNDFQWEVCQ0tuaDNu?=
 =?utf-8?B?MGV0L1VWSGdlWlZCK0M3TzJjTzJkaXd1ZHRaeGlPakZmS2xhQjZkK2sxbTg3?=
 =?utf-8?B?QXhHUVo4UFgvdFYyL0RMSFMyZGs3Nm1BZlZKZHZTdEJxUFVaRlVPSkNrOC92?=
 =?utf-8?B?MUdYbWp4RGg4NHkydnpiWWRlRnc5eVZWYkZlQXNERXRtUDQ2NStkNlc3KzZG?=
 =?utf-8?B?ZW9ZV3k5eEZ0Zy9naDBESjJ6UTFlM3B2ci8rTm5jQW5DL1RwQ2IzSFUxQjlt?=
 =?utf-8?Q?vlo55M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 05:09:14.1131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc5381a-4006-4d4c-c494-08ddd0b98ee7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7758
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

On 8/1/2025 1:43 AM, John Stultz wrote:

[..snip..]

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 40d2fa90df425..a9a78f51f7f57 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2166,15 +2166,16 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
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
> +	if (m) {
> +		/* Currently we serialize blocked_on under the mutex::wait_lock */
> +		lockdep_assert_held_once(&m->wait_lock);
> +		/*
> +		 * There may be cases where we re-clear already cleared
> +		 * blocked_on relationships, but make sure we are not
> +		 * clearing the relationship with a different lock.
> +		 */
> +		WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);

Small concern since we don't hold the "owner->blocked_on->wait_lock" here
when arriving from __ww_mutex_wound() as Hillf pointed out, can we run
into a situation like:

              CPU0                                                               CPU1
        (Owner of Mutex A,                                              (Trying to acquire Mutex A)
    trying to acquire Mutex B)
    ==========================                                          ===========================

    __mutex_lock_common(B)
      ... /* B->wait_lock held */
      set_task_blocked_on(ownerA, B)
      if (__mutex_trylock(B)) /* Returns true */                        __mutex_lock_common(A)
        goto acquired; /* Goes to below point */                          ... /* A->wait_lock held */
      __clear_task_blocked_on(ownerA, B);                                 __ww_mutex_wound(ownerA)
        WARN_ON_ONCE(m /* Mutex B*/                                         ...
                     && ownerA->blocked_on /* Mutex B */                    __clear_task_blocked_on(ownerA, NULL)
                     ...                                                      ownerA->blocked_on = NULL;
                     && ownerA->blocked_on /* NULL */ != m /* Mutex B */);
          !!! SPLAT !!!


At the very least I think we should make a local copy of "p->blocked_on"
to see a consistent view throughout __clear_task_blocked_on() - task either
sees it is blocked on the mutex and clear "p->blocked_on", or it sees it is
blocked on nothing and still clears "p->blocked_on".

(Tested lightly with syzbot's C reproducer)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 02c340450469..f35d93cca64f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2165,6 +2165,8 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
 static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
 {
 	if (m) {
+		struct mutex *blocked_on = p->blocked_on;
+
 		/* Currently we serialize blocked_on under the mutex::wait_lock */
 		lockdep_assert_held_once(&m->wait_lock);
 		/*
@@ -2172,7 +2174,7 @@ static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *
 		 * blocked_on relationships, but make sure we are not
 		 * clearing the relationship with a different lock.
 		 */
-		WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
+		WARN_ON_ONCE(m && blocked_on && blocked_on != m);
 	}
 	p->blocked_on = NULL;
 }
---

End result is the same, only that we avoid an unnecessary splat in this
very unlikely case and save ourselves some head scratching later :)

Thoughts?

> +	}
>  	p->blocked_on = NULL;
>  }
>  
> diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
> index 086fd5487ca77..ef8ef3c28592c 100644
> --- a/kernel/locking/ww_mutex.h
> +++ b/kernel/locking/ww_mutex.h
> @@ -342,8 +342,12 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
>  			 * When waking up the task to wound, be sure to clear the
>  			 * blocked_on pointer. Otherwise we can see circular
>  			 * blocked_on relationships that can't resolve.
> +			 *
> +			 * NOTE: We pass NULL here instead of lock, because we
> +			 * are waking the lock owner, who may be currently blocked
> +			 * on a different lock.
>  			 */
> -			__clear_task_blocked_on(owner, lock);
> +			__clear_task_blocked_on(owner, NULL);
>  			wake_q_add(wake_q, owner);
>  		}
>  		return true;

-- 
Thanks and Regards,
Prateek

