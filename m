Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142E6A596D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5B410E6A3;
	Tue, 28 Feb 2023 12:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D6310E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677588672; x=1709124672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+i9THelGq08FrgMS4Knc+Fj0Izj2Fsz9Q2gRpUo2S0c=;
 b=l0Q3EAuKC+hF1V/cYqIIJVHBcKfQb9ADN3VN/8/cojJYlyNowDS8qyfu
 RenTu3hS5U6pYn33VWmgq1NKC1Xba+OauubJcClpyOjOfSEtvbeUSOt7L
 1hPWmhaIDrvijoqAim+fwTVowDsg9zrJk8y/o/r/hp3DrniWVxkcvFjCz
 tLqOdnXIrylmyoo78ifJMOnM4KHKzw9tbGAv46lwwNxrWezstPvIX0etR
 JojQq9DTVNWDNuZYmE3nByESQKGoy5FBnSVoNwfWQETRcdwxum8RrDZjc
 XAUnRuPjlTlMM3vMVR5oQTdqfJ1lGAeF1Z1kdpjbqvWJ2CcsQJPgZJ92i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398905253"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398905253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:51:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="624018991"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="624018991"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.82])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 04:51:08 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem-helper: Fix compile error
Date: Tue, 28 Feb 2023 13:50:54 +0100
Message-Id: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Asahi Lina <lina@asahilina.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
lock") removes the drm_gem_shmem_get_pages_locked() and
drm_gem_shmem_put_pages_locked().

But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
drm_gem_shmem_get_pages_sgt()") reintroduces it.

Somehow these two commits got mixed up and produce the following
compile error:

drivers/gpu/drm/drm_gem_shmem_helper.c: In function ‘drm_gem_shmem_get_pages_sgt_locked’:
drivers/gpu/drm/drm_gem_shmem_helper.c:651:15: error: implicit declaration of function ‘drm_gem_shmem_get_pages_locked’; did you mean ‘drm_gem_shmem_get_pages_sgt_locked’? [-Werror=implicit-function-declaration]
  651 |         ret = drm_gem_shmem_get_pages_locked(shmem);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |               drm_gem_shmem_get_pages_sgt_locked
drivers/gpu/drm/drm_gem_shmem_helper.c:673:9: error: implicit declaration of function ‘drm_gem_shmem_put_pages_locked’; did you mean ‘drm_gem_shmem_get_pages_sgt_locked’? [-Werror=implicit-function-declaration]
  673 |         drm_gem_shmem_put_pages_locked(shmem);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         drm_gem_shmem_get_pages_sgt_locked

Remove the use of the *_locked() functions as it was intended in
the original patch.

Fixes: ddddedaa0db9 ("drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Asahi Lina <lina@asahilina.net>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
Hi,

I don't know if this issue has already been addressed, if so it
hasn't reached yet drm-tip.

Andi

 drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 990fff32afd69..4b725aa5ce1cd 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -643,12 +643,14 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	int ret;
 	struct sg_table *sgt;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	if (shmem->sgt)
 		return shmem->sgt;
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages_locked(shmem);
+	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -670,7 +672,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_shmem_put_pages(shmem);
 	return ERR_PTR(ret);
 }
 
-- 
2.39.1

