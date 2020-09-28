Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C285F27BDC4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B1A6E455;
	Tue, 29 Sep 2020 07:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3689C17;
 Mon, 28 Sep 2020 10:35:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed9f277a;
 Mon, 28 Sep 2020 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=mail; bh=4eS4KVw+eff75q2oQykBpqEjw
 NI=; b=J5yqMS89hgyMX0QziV8GupKGPwxrxPZdhMy/7aytvT9d+N8JOimRlW8KT
 wdpl1ZRiMGXCdDolMdjHdNJZlj+UdT8S5Hc+1rm//VJctpRIgNkE1fyDPRhWFpVl
 GibowlW8lNe84FWuMuKzshEZfNSI+eCtDq8fr2kmXH9rBV8ic7wR18GCh3dXXKf/
 rebuZKy2hxmkvZckpi0ZfTpItF41zFPfbyV6dONaXfTkyKlow0c26VvbN94SFiiO
 i0c/CZiQkTmkD+pBYbJ9zgGCiH+nBTfo1oQAXcatB1v4ICGWxH6LCoLCAEH1iRsk
 xqmgddiFjrMNaJxO/PytBuXSevMjg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 782f82a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 28 Sep 2020 10:03:55 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-mm@kvack.org,
	peterx@redhat.com,
	jgg@ziepe.ca
Subject: [PATCH] mm: do not rely on mm == current->mm in
 __get_user_pages_locked
Date: Mon, 28 Sep 2020 12:35:07 +0200
Message-Id: <20200928103507.2164-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9ppPhLLtS4Vd5g-Yz9dZUUc7V_yjA8qOkYs4HsnGWtpcQ@mail.gmail.com>
References: <CAHmME9ppPhLLtS4Vd5g-Yz9dZUUc7V_yjA8qOkYs4HsnGWtpcQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems likely this block was pasted from internal_get_user_pages_fast,
which is not passed an mm struct and therefore uses current's. But
__get_user_pages_locked is passed an explicit mm, and current->mm is not
always valid. This was hit when being called from i915, which uses:

  pin_user_pages_remote->
    __get_user_pages_remote->
      __gup_longterm_locked->
        __get_user_pages_locked

Before, this would lead to an OOPS:

  BUG: kernel NULL pointer dereference, address: 0000000000000064
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  PGD 0 P4D 0
  Oops: 0002 [#1] SMP
  CPU: 10 PID: 1431 Comm: kworker/u33:1 Tainted: P S   U     O      5.9.0-rc7+ #140
  Hardware name: LENOVO 20QTCTO1WW/20QTCTO1WW, BIOS N2OET47W (1.34 ) 08/06/2020
  Workqueue: i915-userptr-acquire __i915_gem_userptr_get_pages_worker [i915]
  RIP: 0010:__get_user_pages_remote+0xd7/0x310
  Code: f5 01 00 00 83 7d 00 01 0f 85 ed 01 00 00 f7 c1 00 00 04 00 0f 84 58 01 00 00 65 48 8b 04 25 00 6d 01 00 48 8b 80 40 03 00 00 <c7> 40 64 01 00 00 00 65 48 8b 04 25 00 6d 01 00 48 c7 44 24 18 00
  RSP: 0018:ffff888fdfe47de0 EFLAGS: 00010206
  RAX: 0000000000000000 RBX: 00007fe188531000 RCX: 0000000000040001
  RDX: 0000000000000001 RSI: 00007fe188531000 RDI: ffff888ff0748f00
  RBP: ffff888fdfe47e54 R08: ffff888fedc7d7c8 R09: 0000000000000000
  R10: 0000000000000018 R11: fefefefefefefeff R12: ffff888ff0748f00
  R13: ffff888fedc7d7c8 R14: ffff888f81fe3a40 R15: 0000000000042003
  FS:  0000000000000000(0000) GS:ffff888ffc480000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000000000064 CR3: 0000000002009003 CR4: 00000000003706e0
  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  Call Trace:
   __i915_gem_userptr_get_pages_worker+0xc8/0x260 [i915]
   process_one_work+0x1ca/0x390
   worker_thread+0x48/0x3c0
   ? rescuer_thread+0x3d0/0x3d0
   kthread+0x114/0x130
   ? kthread_create_worker_on_cpu+0x40/0x40
   ret_from_fork+0x1f/0x30
  CR2: 0000000000000064

This commit fixes the problem by using the mm pointer passed to the
function rather than the bogus one in current.

Fixes: 008cfe4418b3 ("mm: Introduce mm_struct.has_pinned")
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index dfe781d2ad4c..e869c634cc9a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1256,7 +1256,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 	}
 
 	if (flags & FOLL_PIN)
-		atomic_set(&current->mm->has_pinned, 1);
+		atomic_set(&mm->has_pinned, 1);
 
 	/*
 	 * FOLL_PIN and FOLL_GET are mutually exclusive. Traditional behavior
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
