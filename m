Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07358A6B9CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437110E7A4;
	Fri, 21 Mar 2025 11:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H8JWH0xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90E410E7A4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742556307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q/45+X0nz6DYq9cPSKysVGVnJ9IivWVYXHf1OYLZvh4=;
 b=H8JWH0xjDET9Xsl6UC9EnBQ+6+S5AhlZbse0wZNT1HrR3Bm4Bk+oFYhpwgvWVJmHWQ+Ur0
 DNU8QeCRFjT3gA7gUAtGI2HbXixmut805unRR4JGbO6QmcTYK9xmz00c+PdgAQLXQihpgO
 0yPCZq/y2axK/t43NB9JXNbXU4FBT/k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-H-lpW1u0OrOjg9GoXfw0Sg-1; Fri,
 21 Mar 2025 07:25:03 -0400
X-MC-Unique: H-lpW1u0OrOjg9GoXfw0Sg-1
X-Mimecast-MFC-AGG-ID: H-lpW1u0OrOjg9GoXfw0Sg_1742556301
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EC655196B36E; Fri, 21 Mar 2025 11:25:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.21])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2DD171800268; Fri, 21 Mar 2025 11:24:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 John Ogness <john.ogness@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 0/2] drm/panic: Add support to scanout buffer as array of
 pages
Date: Fri, 21 Mar 2025 12:16:54 +0100
Message-ID: <20250321112436.1739876-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Some drivers like virtio-gpu, don't map the scanout buffer in the
kernel. Calling vmap() in a panic handler is not safe, and writing an
atomic_vmap() API is more complex than expected [1].
So instead, pass the array of pages of the scanout buffer to the
panic handler, and map only one page at a time to draw the pixels.
This is obviously slow, but acceptable for a panic handler.
As kmap_local_page() is not safe to call from a panic handler,
introduce a kmap_local_page_try_from_panic() that will avoid unsafe
operations.

[1] https://lore.kernel.org/dri-devel/20250305152555.318159-1-ryasuoka@redhat.com/

v2:
 * Add kmap_local_page_try_from_panic() Simona Vetter
 * Correctly handle the case if kmap_local_page_try_from_panic()
   returns NULL
 * Check that the current page is not NULL before trying to map it.
 * Add a comment in struct drm_scanout_buffer, that the array of
   pages shouldn't be allocated in the get_scanout_buffer() callback.

Jocelyn Falempe (2):
  mm/kmap: Add kmap_local_page_try_from_panic()
  drm/panic: Add support to scanout buffer as array of pages

 drivers/gpu/drm/drm_panic.c      | 142 +++++++++++++++++++++++++++++--
 include/drm/drm_panic.h          |  12 ++-
 include/linux/highmem-internal.h |  12 +++
 3 files changed, 159 insertions(+), 7 deletions(-)


base-commit: f24d1d4a7a425e67551ca8d86a89df7102766ac9
-- 
2.47.1

