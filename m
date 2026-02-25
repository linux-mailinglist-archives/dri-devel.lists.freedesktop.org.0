Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCqxHWMmn2nOZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:42:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5DC19AD50
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F18F10E7FD;
	Wed, 25 Feb 2026 16:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="csGKWkXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E154A10E7FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:42:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B8FE60126;
 Wed, 25 Feb 2026 16:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83989C116D0;
 Wed, 25 Feb 2026 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772037723;
 bh=rfgqTaniyFcFynC/obpaUFFlyjqqthgGha52ltIUlUY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=csGKWkXeguSQ37zJjf0IB2wvQOQl3/WLcW4dmFDzDbdcBjbHPT1zkBKm6J29MSeg6
 xhGvtq3bNTlGh6/EGDE2aTQtaxs4VsiOO8ohZ2uB4qEil0ou0qeDg8Zr7kAe8TBQWh
 /ZNRi1fKctGSLW4gpZYseuHiM9psy8MQJNSqh/2n2F066mlBVd0PXwhBTZTDlLzCCd
 6cO4rjPG9kIAF8nlnZMXKsmji5AT5/nOSZdCE576FJIIzyETNCdF3hir5mY3Hafts+
 qB6j6M+QC+Pyc8JmQdhe60ULJfAb5mmiK2sCdYE4YEMtxEM9uE86j2SXH3mADgDoZA
 frH/OyTpRyjqQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Feb 2026 17:41:50 +0100
Subject: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rfgqTaniyFcFynC/obpaUFFlyjqqthgGha52ltIUlUY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnz1fxfHNsUEn3B2H5a+v+PEQp7p6W9/xnC8syK+dSd1
 jP7uFa1dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ+OQyNrwRDNz268/LgH9P
 9faUbHvhyCZb/z7vtFLTNmaVGbExClx7qz9r8xUdaLklcuJigejvLYwNfdXrtpw+nXW/t5v7yV3
 1jSov2r2+t+V/2ejWE/CpN/ax103GSc5iU9vnm62Im7lg1bpvAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,m:mripard@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0B5DC19AD50
X-Rspamd-Action: no action

The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate and
free, respectively, its CMA buffers.

However, these functions are not exported. Since we want to turn the CMA
heap into a module, let's export them both.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 mm/cma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..be142b473f3bd41b9c7d8ba4397f018f6993d962 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -949,10 +949,11 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 	if (page)
 		set_pages_refcounted(page, count);
 
 	return page;
 }
+EXPORT_SYMBOL_GPL(cma_alloc);
 
 static struct cma_memrange *find_cma_memrange(struct cma *cma,
 		const struct page *pages, unsigned long count)
 {
 	struct cma_memrange *cmr = NULL;
@@ -1025,10 +1026,11 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	__cma_release_frozen(cma, cmr, pages, count);
 
 	return true;
 }
+EXPORT_SYMBOL_GPL(cma_release);
 
 bool cma_release_frozen(struct cma *cma, const struct page *pages,
 		unsigned long count)
 {
 	struct cma_memrange *cmr;

-- 
2.53.0

