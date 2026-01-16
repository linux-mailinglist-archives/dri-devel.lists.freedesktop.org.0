Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC5D38508
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 19:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157710E135;
	Fri, 16 Jan 2026 18:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="Jdrht576";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jan 2026 18:59:29 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14D010E135
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 18:59:29 +0000 (UTC)
Received: from debian.intra.ispras.ru (unknown [10.10.165.9])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7498F406E9AB;
 Fri, 16 Jan 2026 18:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 7498F406E9AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1768589413;
 bh=MUcGpwGAa2HHj5AwDRnfAQJfhTuI6RfA98FpDXOSu7o=;
 h=From:To:Cc:Subject:Date:From;
 b=Jdrht576bmc/E2N7PQrTT3WPk3QtAlXNLNEL7FuXujN4DR0tqgDS8pDrsYrgi9jh3
 IYa6D1QEDIQ/GhfK65HQxeeyJhQ9Is2ZVG74QqVxTpoXMhOwob3UtheISp+36aWlFJ
 VncOH8fRaAP4wZLsbSksiaPNAl4IxMAR8TCAdAXs=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Simon Richter <Simon.Richter@hogyros.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH 6.1] drm/ttm: fix up length check inside ttm_bo_vm_access()
Date: Fri, 16 Jan 2026 21:50:06 +0300
Message-ID: <20260116185007.1243557-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

No upstream commit exists for this patch.

Commit 491adc6a0f99 ("drm/ttm: Avoid NULL pointer deref for evicted BOs")
added the validation of bo->resource but in the context of 6.1.y and older
stable kernels the pointer is still dereferenced before that check.

It's been unseen and manifests as a stable kernel's issue only because
another upstream commit e3c92eb4a84f ("drm/ttm: rework on ttm_resource to
use size_t type") refactored the code a bit and, specifically, changed
bo->resource->num_pages to bo->base.size at some places.  That commit is
rather intrusive and not handy to be backported to stable kernels so
implement the adaptive fix directly.

Since bo->resource->num_pages is calculated as PFN_UP(bo->base.size) in
older kernels as well, extract this single conversion from that commit.
Thus the problem indicated by commit 491adc6a0f99 ("drm/ttm: Avoid NULL
pointer deref for evicted BOs") would be actually fixed as intended.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 491adc6a0f99 ("drm/ttm: Avoid NULL pointer deref for evicted BOs")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---

Fresher stables starting from 6.6.y are not affected with this as they
have e3c92eb4a84f.

The backport of 491adc6a0f99 ("drm/ttm: Avoid NULL pointer deref for
evicted BOs") is currently in 5.10-5.15 queues and it may be fixed up in
place.

 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 1f543bd04fcf..51d0f5d23b1c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -412,7 +412,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		 << PAGE_SHIFT);
 	int ret;
 
-	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
+	if (len < 1 || (offset + len) > bo->base.size)
 		return -EIO;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
-- 
2.51.0

