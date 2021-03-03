Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185932B8A0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 15:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46EE6E9A3;
	Wed,  3 Mar 2021 14:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E16E99B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 14:34:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1614782049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=jZwwbpIzsL39axnKVFLi78WYtFVUDliH4BfkywVG2Ro=;
 b=gwLpeUwYYlvirMZ/jsjRBKCj0N2rrNmaPjflAguejX7lR2hr5i9Wb7M28Y8uFuXQOVpYnx
 w2nPkqKtqnBiSvB/Qg+1NAo12exRL4KuVn41MuUGiAjBhokdw32440UarfPwPva4D9jKtM
 amdn2Z6Wz8zs6RVFZIe8Vh0GaeD3MYA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 759AEAC24;
 Wed,  3 Mar 2021 14:34:09 +0000 (UTC)
Date: Wed, 3 Mar 2021 15:34:09 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drm/ttm: ttm_bo_release called without lock
Message-ID: <YD+eYcMMcdlXB8PY@alley>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

the following warning is filling my kernel log buffer
with 5.12-rc1+ kernels:

[  941.070598] WARNING: CPU: 0 PID: 11 at drivers/gpu/drm/ttm/ttm_bo.c:139 ttm_bo_move_to_lru_tail+0x1ba/0x210
[  941.070601] Modules linked in:
[  941.070603] CPU: 0 PID: 11 Comm: kworker/0:1 Kdump: loaded Tainted: G        W         5.12.0-rc1-default+ #81
[  941.070605] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[  941.070606] Workqueue: events qxl_gc_work
[  941.070609] RIP: 0010:ttm_bo_move_to_lru_tail+0x1ba/0x210
[  941.070610] Code: 93 e8 02 00 00 48 89 0a e9 00 ff ff ff 48 8b 87 38 01 00 00 be ff ff ff ff 48 8d 78 70 e8 8e 7d 46 00 85 c0 0f 85 6f fe ff ff <0f> 0b 8b 93 fc 02 00 00 85 d2 0f 84 6d fe ff ff 48 89 df 5b 5d 41
[  941.070612] RSP: 0018:ffffbddf4008fd38 EFLAGS: 00010246
[  941.070614] RAX: 0000000000000000 RBX: ffff95ae485bac00 RCX: 0000000000000002
[  941.070615] RDX: 0000000000000000 RSI: ffff95ae485badb0 RDI: ffff95ae40305108
[  941.070616] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
[  941.070617] R10: ffffbddf4008fc10 R11: ffffffffa5401580 R12: ffff95ae42a94e90
[  941.070618] R13: ffff95ae485bae70 R14: ffff95ae485bac00 R15: ffff95ae455d1800
[  941.070620] FS:  0000000000000000(0000) GS:ffff95aebf600000(0000) knlGS:0000000000000000
[  941.070621] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  941.070622] CR2: 00007f8ffb2f8000 CR3: 0000000102c5e005 CR4: 0000000000370ef0
[  941.070624] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  941.070626] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  941.070627] Call Trace:
[  941.070630]  ttm_bo_release+0x551/0x600
[  941.070635]  qxl_bo_unref+0x3a/0x50
[  941.070638]  qxl_release_free_list+0x62/0xc0
[  941.070643]  qxl_release_free+0x76/0xe0
[  941.070646]  qxl_garbage_collect+0xd9/0x190
[  941.080241]  process_one_work+0x2b0/0x630
[  941.080249]  ? process_one_work+0x630/0x630
[  941.080251]  worker_thread+0x39/0x3f0
[  941.080255]  ? process_one_work+0x630/0x630
[  941.080257]  kthread+0x13a/0x150
[  941.080260]  ? kthread_create_worker_on_cpu+0x70/0x70
[  941.080265]  ret_from_fork+0x1f/0x30
[  941.080277] irq event stamp: 757191
[  941.080278] hardirqs last  enabled at (757197): [<ffffffffa217431f>] vprintk_emit+0x27f/0x2c0
[  941.080280] hardirqs last disabled at (757202): [<ffffffffa21742dc>] vprintk_emit+0x23c/0x2c0
[  941.080281] softirqs last  enabled at (755768): [<ffffffffa300030f>] __do_softirq+0x30f/0x432
[  941.080284] softirqs last disabled at (755763): [<ffffffffa20eb0aa>] irq_exit_rcu+0xea/0xf0

My wild guess is that it might be related to the commit
3d1a88e1051f5d788d789 ("drm/ttm: cleanup LRU handling further").

Does it ring any bell, please?

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
