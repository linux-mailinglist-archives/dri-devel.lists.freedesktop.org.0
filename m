Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD550D478
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537A81123CA;
	Sun, 24 Apr 2022 19:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FCB10FEB9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 38A481F44DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827105;
 bh=CCVdkmki7kdyUl6LNHWZFBWC7kDCorH5xyYEwWyTQkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PeIqGijAucrlGWSeF+jw7ZQRqaZe6pTgb1MFz2Wsg37VIHyV9RLMzLqx4NCkhhp5/
 Qlnd03Rv6PefyqQTINhkU/ZhsuZP1H+YubZLph2S3ty/exYV7g+uynUreKAtahIl/u
 gptKYg9Ry5Ijn73dbA21KlGvxXv7bObnNk6hYh9fJaPLyZdR4dFWJauPb1GLECSJ00
 DgT4okf+CdriRoVMk5OczMgAfuhn9W/IRcZydoj4XYeTCMGZ2m7FnGDxUM7Dm7LxK6
 n9jXfvly6TlFoATqoG9ne5C7IY2l/uzbX9Ho8VgRlNzEfUICpt9pXCFxVu2ZMignJs
 ekuLri1lVuGsQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 15/17] drm/shmem-helper: Make drm_gem_shmem_get_pages()
 private
Date: Sun, 24 Apr 2022 22:04:22 +0300
Message-Id: <20220424190424.540501-16-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VirtIO-GPU driver was the only user of drm_gem_shmem_get_pages()
and it now uses drm_gem_shmem_get_pages_sgt(). Make the get_pages()
private to drm_gem_shmem_helper.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +--
 include/drm/drm_gem_shmem_helper.h     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 25e9bc2803ee..7ec5f8002f68 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -490,7 +490,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
 	int ret;
 
@@ -507,7 +507,6 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_gem_shmem_get_pages);
 
 static void drm_gem_shmem_get_pages_no_fail(struct drm_gem_shmem_object *shmem)
 {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 638cb16a4576..5b351933c293 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -180,7 +180,6 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-- 
2.35.1

