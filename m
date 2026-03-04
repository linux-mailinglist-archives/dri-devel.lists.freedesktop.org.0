Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN3WI+p7p2kshwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 01:25:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681F1F8E4C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 01:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8306E10E8FA;
	Wed,  4 Mar 2026 00:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oaeP7KnT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A86110E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 00:25:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 03B9E403E4;
 Wed,  4 Mar 2026 00:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056CDC116C6;
 Wed,  4 Mar 2026 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772583909;
 bh=HeaohDIlgya71qEyi4Ax5lfXmfxcDbpMvfs/QKVJz1A=;
 h=From:Date:Subject:To:Cc:From;
 b=oaeP7KnTXcb8bhjfsex4+qPuAx+uX8yt3/u3rqEsDjTZNM8jWPKmjPxV6ihXBnBlz
 gvKSYnpbKJowxWM/2Y6l8YptsLXCsrxiiOScVJeOIhMpIVumwOl4xjX6Ikrlu2QnGO
 fbkwuroENvTFHY4lMGvd3HQONo+v0/mmkzaGrT95vb7Bg/CaCkYZRVblazc1zFjXxQ
 YbeRSF8D28zsPmtS+9KdCtCjcsgcLCY6fwOihXqMIVr66EBhI6d+bhoqw/3EwH7Q2D
 +AY4qpGsXQ5NrsHGe/bZbFZxIZ+6F/WF2/XtdP6JP4kAt9heEIvBNtSMVeqQ/0NpPu
 yX87OwUL10kPQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Mar 2026 01:25:05 +0100
Subject: [PATCH] dma-buf: heaps: Clear CMA pages with clear_pages()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cma-heap-clear-pages-v1-1-6ff59da716d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqAIBBA0V+JWTdg2YP6lWgx2JgDPUQhAvHfk
 5ZncW+CyEE4wlwlCPxIlPsqaOoKjKNrZ5StGFrVDkorjeYkdEwezcEU0NPOEftOWU1msqPuoKQ
 +sJX33y5rzh8T92GNZgAAAA==
X-Change-ID: 20260303-cma-heap-clear-pages-540f3ac9f734
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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
X-Rspamd-Queue-Id: 1681F1F8E4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linusw@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

As of commit 62a9f5a85b98
"mm: introduce clear_pages() and clear_user_pages()" we can
clear a range of pages with a potentially assembly-optimized
call.

Instead of using a memset, use this helper to clear the whole
range of pages from the CMA allocation.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index bd3370b9a3f6..f0bacf25ed9d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -343,7 +343,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			nr_clear_pages--;
 		}
 	} else {
-		memset(page_address(cma_pages), 0, size);
+		clear_pages(page_address(cma_pages), pagecount);
 	}
 
 	buffer->pages = kmalloc_objs(*buffer->pages, pagecount);

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260303-cma-heap-clear-pages-540f3ac9f734

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

