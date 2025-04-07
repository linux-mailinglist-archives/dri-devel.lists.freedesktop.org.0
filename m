Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CDA7E049
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE1410E47D;
	Mon,  7 Apr 2025 14:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PBYpzZPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2D210E47D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744034524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Q+gQlDrMOfjGrlEjwGCJBXtgRU8uY1eeO/aQN+gl+g=;
 b=PBYpzZPn7UKqJGkUgB3RTzSaymliIfpfLTF86unVdfNDZsyD/DMD3hCoF9F6f3ayII8MdN
 hptPDZu/RdKJqVJqdpLpdMCG9iZ/fR31O/29458Dr5FncaYmdVf2WXNBNn2BZhWV/+s7+Q
 9n6W5FYUjxbWBu4eTmNnBj+SsaVxXKI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-QPHcBfKnOV-i9Y4rA6L0rg-1; Mon,
 07 Apr 2025 10:02:02 -0400
X-MC-Unique: QPHcBfKnOV-i9Y4rA6L0rg-1
X-Mimecast-MFC-AGG-ID: QPHcBfKnOV-i9Y4rA6L0rg_1744034520
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C17351955E79; Mon,  7 Apr 2025 14:01:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.175])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 44192190DB07; Mon,  7 Apr 2025 14:01:52 +0000 (UTC)
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
Subject: [PATCH v3 0/2] drm/panic: Add support to scanout buffer as array of
 pages
Date: Mon,  7 Apr 2025 15:42:24 +0200
Message-ID: <20250407140138.162383-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
 * Add kmap_local_page_try_from_panic() (Simona Vetter)
 * Correctly handle the case if kmap_local_page_try_from_panic()
   returns NULL
 * Check that the current page is not NULL before trying to map it.
 * Add a comment in struct drm_scanout_buffer, that the array of
   pages shouldn't be allocated in the get_scanout_buffer() callback.

v3:
 * Replace DRM_WARN_ONCE with pr_debug_once (Simona Vetter)
 * Add a comment in kmap_local_page_try_from_panic() (Thomas Gleixner)

Jocelyn Falempe (2):
  mm/kmap: Add kmap_local_page_try_from_panic()
  drm/panic: Add support to scanout buffer as array of pages

 drivers/gpu/drm/drm_panic.c      | 142 +++++++++++++++++++++++++++++--
 include/drm/drm_panic.h          |  12 ++-
 include/linux/highmem-internal.h |  13 +++
 3 files changed, 160 insertions(+), 7 deletions(-)


base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a
-- 
2.49.0

