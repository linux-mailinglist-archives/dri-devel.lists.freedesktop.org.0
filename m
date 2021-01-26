Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93881304633
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 19:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C1893A3;
	Tue, 26 Jan 2021 18:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F91893A3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611685287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iEgpuJzqa3JbPGol8wUz7D5/XSGXIIng43V/18schz8=;
 b=cUtYnJIjh053rse1VOUxjYUCb12P06WYP37uGyI0lfWWkNxqDWBQD0eVbcYT5SVqrUgiCw
 9ExhGywEXKj0Ddg0mNraqgP+qxjNCX+PpswkCvNAu6N6NVH86w71Pp0ZEJQv1waXDoLojh
 /Cn/kPI+G8cFejTPiTIb3CnKc0bNXWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-SzPm_gAKOoa_muj_u5Rr-w-1; Tue, 26 Jan 2021 13:21:23 -0500
X-MC-Unique: SzPm_gAKOoa_muj_u5Rr-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30283107ACE3;
 Tue, 26 Jan 2021 18:21:21 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7DC318A77;
 Tue, 26 Jan 2021 18:21:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mm: simplify free_highmem_page() and
 free_reserved_page()
Date: Tue, 26 Jan 2021 19:21:11 +0100
Message-Id: <20210126182113.19892-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linux-fbdev@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's simplify and unify free_highmem_page() and free_reserved_page().

Gave it a quick test in i386 QEMU with 4G of RAM - seems to work just fine.

David Hildenbrand (2):
  video: fbdev: acornfb: remove free_unused_pages()
  mm: simplify free_highmem_page() and free_reserved_page()

 drivers/video/fbdev/acornfb.c    | 34 --------------------------------
 include/linux/highmem-internal.h |  5 -----
 include/linux/mm.h               | 16 ++-------------
 mm/page_alloc.c                  | 11 -----------
 4 files changed, 2 insertions(+), 64 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
