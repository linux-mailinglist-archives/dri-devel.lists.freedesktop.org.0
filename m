Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CAA67D00
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFA710E4C0;
	Tue, 18 Mar 2025 19:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="e/dtP8i1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646DB10E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742325805; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=di1SLICXMcjbv6bpYa9ur8m9vf/eh33VZFBtG6XUIOdEzdI0seMZd6pdCjTct6k5U6DRJvrVUec0Sjn1xnfVJ7kOo7zYctYDmVLkYE9uOfz7jjk0/j7VBxJusovKyu3FFY3bWzfcQvO0ADHco/9BCxTTjSTdSDPE5rKE4yE9IWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742325805;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aYKKVCgMd0f1tZMRhBSTqkRoCk3V9ylJbwXrGvsyQWU=; 
 b=nFV4f0HHcNGJv78PRAq+53duXkKWUGcAgEwAIbRHj7zyllTFwBRiZOR6Jmg1rkj50Dw7tmZQTwjFHBAEMDH7hdaHLZqMj6K6WncXVuvKVUGE7Db534fSioyXwSohmC/dltkZPodA3REQIrj1rTCOnMTzFuUXkD6aXwO9JjdSYa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325805; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=aYKKVCgMd0f1tZMRhBSTqkRoCk3V9ylJbwXrGvsyQWU=;
 b=e/dtP8i1TAHSu/wXcgL6Dk0auU/RZCt9a381Bw4fmDPo8z+TbKEM+X71BaUcFPTG
 qhZn5sN3ZKKM2aAJlD2yxnZnuLsSYhvxNWCadzmK2dS0G0sGKPpuPFFqK8NW9B33wwx
 mCYZwPDp68YkvbdcHWykTkmbs7VTNAB4A26bzNKA=
Received: by mx.zohomail.com with SMTPS id 1742325802898502.1528549925166;
 Tue, 18 Mar 2025 12:23:22 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:39 -0300
Subject: [PATCH 5/7] drm/gem: Add a flag to control whether objects can be
 exported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-5-64b96511a84f@collabora.com>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

From: Asahi Lina <lina@asahilina.net>

Drivers may want to support driver-private objects, which cannot be
shared. This allows them to share a single lock and enables other
optimizations.

Add an `exportable` field to drm_gem_object, which blocks PRIME export
if set to false. It is initialized to true in
drm_gem_private_object_init.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/drm_gem.c   | 1 +
 drivers/gpu/drm/drm_prime.c | 5 +++++
 include/drm/drm_gem.h       | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df4b4e9c377a66afd4967512ba2001..8f998fe6beecd285ce3e2d5badfa95eb7d7bd548 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -195,6 +195,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 
 	drm_vma_node_reset(&obj->vma_node);
 	INIT_LIST_HEAD(&obj->lru_node);
+	obj->exportable = true;
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67b82ece7b7b94625715171bb41917..20aa350280abe9a6ed6742e131ff50c65bc9dfa9 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -387,6 +387,11 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 		return dmabuf;
 	}
 
+	if (!obj->exportable) {
+		dmabuf = ERR_PTR(-EINVAL);
+		return dmabuf;
+	}
+
 	if (obj->funcs && obj->funcs->export)
 		dmabuf = obj->funcs->export(obj, flags);
 	else
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index fdae947682cd0b7b06db5e35e120f049a0f30179..f700e4996eccb92597cca6b8c3df8e35b864c1e1 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -432,6 +432,14 @@ struct drm_gem_object {
 	 * The current LRU list that the GEM object is on.
 	 */
 	struct drm_gem_lru *lru;
+
+	/**
+	 * @exportable:
+	 *
+	 * Whether this GEM object can be exported via the drm_gem_object_funcs->export
+	 * callback. Defaults to true.
+	 */
+	bool exportable;
 };
 
 /**

-- 
2.48.1

