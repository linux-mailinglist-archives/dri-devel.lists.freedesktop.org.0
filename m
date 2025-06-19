Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AEDAE07E2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890010EA67;
	Thu, 19 Jun 2025 13:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RSqSqFOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Hd89UBV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wWKpEPUM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bMvxdIDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3337E10EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:53:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CD8621237;
 Thu, 19 Jun 2025 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750341216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QU7KKbijEzMms4D6GVjWRBs1rODRU8wDUnBXbCMlc1M=;
 b=RSqSqFOSb61pa+atB+JGsI4s3YT7tpSSUWHjK+mmD2uKZpbuLBYxvvQGbpGoMVPZ5N+2QO
 H0DX9LXFUQwbZ024HOeFuhVwoyFoMuygwi2zPXF7rScG81WlideRdAHKeNm/QGZylENZG9
 jv/KReXJ3G/3AM7ia4aCjB7QuQbDGuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750341216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QU7KKbijEzMms4D6GVjWRBs1rODRU8wDUnBXbCMlc1M=;
 b=3Hd89UBVMfXSGIfBkjVao4/l/Y2SRVh/gbHiIT0yGygTQKgWg8F3FKUtodIuMj4MkAxgAC
 MfpbRwgS0ITmfZBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wWKpEPUM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bMvxdIDi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750341215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QU7KKbijEzMms4D6GVjWRBs1rODRU8wDUnBXbCMlc1M=;
 b=wWKpEPUMNJIbUkg5YNnUMXzmAQ/wlFza3xofQIZ8M4cgSbkpIFVo78B884nst/vrzWEldi
 irx4vmdRTsNv69nFP/NnCbQNSD2XlCS1i8soxM6gAeXcg6RZIHu09+YVNpMmd87ew0i0qP
 7cu8xjW9XGKVBFkzV7HK4O/mvE+Iq0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750341215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QU7KKbijEzMms4D6GVjWRBs1rODRU8wDUnBXbCMlc1M=;
 b=bMvxdIDiNxzMpKzcscns5t4kbU1NiSeUAxIIwr/FaNem4/kDno+OwtPSBko4hfJ2AeW2wo
 LARfFQQu2t9PNMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7674136CC;
 Thu, 19 Jun 2025 13:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id k5idKF4WVGjMFwAAD6G6ig
 (envelope-from <osalvador@suse.de>); Thu, 19 Jun 2025 13:53:34 +0000
Date: Thu, 19 Jun 2025 15:53:28 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Message-ID: <aFQWWFGSKMpdk5k4@localhost.localdomain>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TAGGED_RCPT(0.00)[a504cb5bae4fe117ba94];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,intel.com:email,oracle.com:email]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5CD8621237
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

On Tue, Jun 17, 2025 at 10:28:40PM -0700, Vivek Kasireddy wrote:
> There are cases when we try to pin a folio but discover that it has
> not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> but there is a chance that we might encounter a fatal crash/failure
> (VM_BUG_ON(!h->resv_huge_pages) in alloc_hugetlb_folio_reserve()) if
> there are no active reservations at that instant. This issue was
> reported by syzbot:
> 
> kernel BUG at mm/hugetlb.c:2403!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted
> 6.13.0-rc5-syzkaller-00161-g63676eefb7a0 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2403
> Code: 1f eb 05 e8 56 18 a0 ff 48 c7 c7 40 56 61 8e e8 ba 21 cc 09 4c 89
> f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 35 18 a0 ff 90 <0f> 0b 66
> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
> RSP: 0018:ffffc9000d3d77f8 EFLAGS: 00010087
> RAX: ffffffff81ff6beb RBX: 0000000000000000 RCX: 0000000000100000
> RDX: ffffc9000e51a000 RSI: 00000000000003ec RDI: 00000000000003ed
> RBP: 1ffffffff34810d9 R08: ffffffff81ff6ba3 R09: 1ffffd4000093005
> R10: dffffc0000000000 R11: fffff94000093006 R12: dffffc0000000000
> R13: dffffc0000000000 R14: ffffea0000498000 R15: ffffffff9a4086c8
> FS:  00007f77ac12e6c0(0000) GS:ffff88801fc00000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f77ab54b170 CR3: 0000000040b70000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
>  memfd_pin_folios+0xf10/0x1570 mm/gup.c:3750
>  udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
>  udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
>  udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
>  udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Therefore, prevent the above crash by replacing the VM_BUG_ON()
> with WARN_ON_ONCE() as there is no need to crash the system in
> this situation and instead we could just warn and fail the
> allocation.
> 
> Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
> Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Who is supossed to reserve these hugepages?
hugetlb_reserve_pages() is only called at mmap/file setup, and you mention that
you try to allocate the folios even before mmap, so who's in charge of
making those reservations for you?

 

-- 
Oscar Salvador
SUSE Labs
