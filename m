Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7F1C4E98
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F606E51C;
	Tue,  5 May 2020 06:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B112C89DB0;
 Tue,  5 May 2020 04:58:32 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7DDD594BE2A050E65587;
 Tue,  5 May 2020 12:58:27 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 5 May 2020
 12:58:20 +0800
From: ChenTao <chentao107@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/radeon: fix unsigned comparison with 0
Date: Tue, 5 May 2020 12:57:37 +0800
Message-ID: <20200505045737.185143-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chentao107@huawei.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes warning because pipe is unsigned long and can never be negtative

vers/gpu/drm/radeon/radeon_kms.c:831:11: warning:
comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if (pipe < 0 || pipe >= rdev->num_crtc) {
drivers/gpu/drm/radeon/radeon_kms.c:857:11: warning:
comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if (pipe < 0 || pipe >= rdev->num_crtc) {

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: ChenTao <chentao107@huawei.com>
---
 drivers/gpu/drm/radeon/radeon_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 372962358a18..c5d1dc9618a4 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -828,7 +828,7 @@ int radeon_enable_vblank_kms(struct drm_crtc *crtc)
 	unsigned long irqflags;
 	int r;
 
-	if (pipe < 0 || pipe >= rdev->num_crtc) {
+	if (pipe >= rdev->num_crtc) {
 		DRM_ERROR("Invalid crtc %d\n", pipe);
 		return -EINVAL;
 	}
@@ -854,7 +854,7 @@ void radeon_disable_vblank_kms(struct drm_crtc *crtc)
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
 
-	if (pipe < 0 || pipe >= rdev->num_crtc) {
+	if (pipe >= rdev->num_crtc) {
 		DRM_ERROR("Invalid crtc %d\n", pipe);
 		return;
 	}
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
