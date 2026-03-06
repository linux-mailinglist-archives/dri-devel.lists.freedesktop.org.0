Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P4xHmHBqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:58:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905421FFA3
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723EB10ED0B;
	Fri,  6 Mar 2026 11:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BB6710ED0B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:58:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA8D1516;
 Fri,  6 Mar 2026 03:58:14 -0800 (PST)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F5D33F836;
 Fri,  6 Mar 2026 03:58:16 -0800 (PST)
Message-ID: <61d9080c-48ea-41fa-a727-e1f63b3b8f61@arm.com>
Date: Fri, 6 Mar 2026 11:58:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] drm/panthor: Add a GEM shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
References: <20260305124320.156606-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260305124320.156606-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 2905421FFA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Boris,

On 05/03/2026 12:43, Boris Brezillon wrote:
> Hello,
> 
> This is an attempt at adding a GEM shrinker to panthor so the system
> can finally reclaim GPU memory.
> 
> This implementation is losely based on the MSM shrinker (which is why
> I added the MSM maintainers in Cc), and it's relying on the drm_gpuvm
> eviction/validation infrastructure.
> 
> I've only done very basic IGT-based [1] and chromium-based (opening
> a lot of tabs on Aquarium until the system starts reclaiming+swaping
> out GPU buffers) testing, but I'm posting this early so I can get
> preliminary feedback on the implementation. If someone knows about
> better tools/ways to test the shrinker, please let me know.

I did a very basic test with glmark and I can reproduce the below splat:

[  290.502999] ------------[ cut here ]------------
[  290.504338] refcount_t: underflow; use-after-free.
[  290.504843] WARNING: lib/refcount.c:28 at refcount_warn_saturate+0xf4/0x144, CPU#5: kworker/u32:3/75
[  290.505715] Modules linked in: panthor drm_gpuvm drm_exec gpu_sched
[  290.506402] CPU: 5 UID: 0 PID: 75 Comm: kworker/u32:3 Not tainted 7.0.0-rc1-00176-g608e8196cd63 #202 PREEMPT 
[  290.507323] Hardware name: Radxa ROCK 5B (DT)
[  290.507733] Workqueue: events_unbound commit_work
[  290.508185] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  290.508835] pc : refcount_warn_saturate+0xf4/0x144
[  290.509287] lr : refcount_warn_saturate+0xf4/0x144
[  290.509741] sp : ffff800083cb3b80
[  290.510056] x29: ffff800083cb3b80 x28: ffff8000821d1e88 x27: ffff00010fa058a0
[  290.510724] x26: 0000000000000000 x25: 0000000000000000 x24: 00000000ffffffff
[  290.511398] x23: ffff00010b149000 x22: ffff00010dd3a7c8 x21: ffff80008226c828
[  290.512065] x20: ffff00010dd3a780 x19: ffff00010dd3a780 x18: 00000000ffffffff
[  290.512735] x17: 00000000ffffffff x16: ffff800083cb3668 x15: 0000000000001e00
[  290.513403] x14: ffff000102a8f69f x13: ffff8000821fb558 x12: 000000000000083d
[  290.514074] x11: 00000000000002bf x10: ffff800082253558 x9 : ffff8000821fb558
[  290.514746] x8 : 00000000ffffefff x7 : ffff800082253558 x6 : 80000000fffff000
[  290.515414] x5 : ffff0001fef31588 x4 : 0000000000000000 x3 : ffff80017d1e5000
[  290.516083] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000102b61980
[  290.516752] Call trace:
[  290.516987]  refcount_warn_saturate+0xf4/0x144 (P)
[  290.517440]  drm_sched_fence_release_scheduled+0xe0/0xe4 [gpu_sched]
[  290.518046]  dma_fence_release+0xb4/0x3cc
[  290.518429]  drm_sched_fence_release_finished+0x94/0xa8 [gpu_sched]
[  290.519021]  dma_fence_release+0xb4/0x3cc
[  290.519401]  dma_fence_array_release+0x94/0x104
[  290.519829]  dma_fence_release+0xb4/0x3cc
[  290.520208]  drm_atomic_helper_wait_for_fences+0x1a4/0x228
[  290.520724]  commit_tail+0x38/0x18c
[  290.521056]  commit_work+0x14/0x20
[  290.521381]  process_one_work+0x208/0x76c
[  290.521763]  worker_thread+0x1c4/0x36c
[  290.522121]  kthread+0x13c/0x148
[  290.522430]  ret_from_fork+0x10/0x20
[  290.522774] irq event stamp: 2167444
[  290.523114] hardirqs last  enabled at (2167443): [<ffff80008016772c>] __up_console_sem+0x6c/0x80
[  290.523941] hardirqs last disabled at (2167444): [<ffff80008132977c>] el1_brk64+0x20/0x60
[  290.524703] softirqs last  enabled at (2167428): [<ffff8000800c94c4>] handle_softirqs+0x604/0x61c
[  290.525528] softirqs last disabled at (2167421): [<ffff8000800102d0>] __do_softirq+0x14/0x20
[  290.526320] ---[ end trace 0000000000000000 ]---

I haven't yet dug into what's happening.

Thanks,
Steve

