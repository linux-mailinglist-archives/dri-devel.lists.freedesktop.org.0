Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKxHIMs/dmm6OAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 17:07:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432698158C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 17:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6376A10E195;
	Sun, 25 Jan 2026 16:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L4KnWdRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B8210E195
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769357255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=UzFafadD/xFA5DaIbLPJfWcnaK2KSCnXdhRnlT6y1nw=;
 b=L4KnWdRuO84cHRYVGidZvhns9F1gi+n+VHp4/Fgb80j2F3xW6g84B0nG04QE2kLCYi3iks
 ILcYmh4E7JJCqMknI4YiSOYiZ2oCPp8BuVPE/j198OVXUv9id/MXGESvzimMs7YhGESyv2
 IlnEbr3i58lERx1M+b46qfXQeWy4aEM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-3eIJo3prPQijK62EceRZWA-1; Sun,
 25 Jan 2026 11:07:30 -0500
X-MC-Unique: 3eIJo3prPQijK62EceRZWA-1
X-Mimecast-MFC-AGG-ID: 3eIJo3prPQijK62EceRZWA_1769357247
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFB261800342; Sun, 25 Jan 2026 16:07:27 +0000 (UTC)
Received: from fedora (unknown [10.45.224.8])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 0EC9930001A7; Sun, 25 Jan 2026 16:07:21 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun, 25 Jan 2026 17:07:27 +0100 (CET)
Date: Sun, 25 Jan 2026 17:07:20 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Leon Romanovsky <leon@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 2/7] android/binder: use same_thread_group(proc->tsk,
 current) in binder_mmap()
Message-ID: <aXY_uPYyUg4rwNOg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXY_h8i78n6yD9JY@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:felix.kuehling@amd.com,m:leon@kernel.org,m:steven.price@arm.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:netdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 432698158C
X-Rspamd-Action: no action

With or without this change the checked condition can be falsely true
if proc->tsk execs, but this is fine: binder_alloc_mmap_handler() checks
vma->vm_mm == alloc->mm.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index dea701daabb0..b3b73303f84d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6015,7 +6015,7 @@ static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct binder_proc *proc = filp->private_data;
 
-	if (proc->tsk != current->group_leader)
+	if (!same_thread_group(proc->tsk, current))
 		return -EINVAL;
 
 	binder_debug(BINDER_DEBUG_OPEN_CLOSE,
-- 
2.52.0

