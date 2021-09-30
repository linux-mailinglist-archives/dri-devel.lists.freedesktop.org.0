Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506341D7AA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 12:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F016EB62;
	Thu, 30 Sep 2021 10:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569F66EB62
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:27:50 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 8585F4199A; 
 Thu, 30 Sep 2021 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632997668;
 bh=M6sy7w+Nseo+km9zhs6Ryq7ai4W52YENoxc1GDWogd8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=Y30t1JdbogXU0K+bW1bTvWxv86GNTLURM7AED2LkZ/ttZYw9LhYMnHQj3JHgmXkhW
 sRCjx5TjEc9egXxsVx0JmzEmckMXwjVV4c+eEG+eS/7JgPxs2Tbqt4nFbAyL3XKrWC
 KLcKhshLfR5P6Rr9vO4/xb2SCXlFdSQX5ZE0sRc2lHXcIWIeZj1XL76wiG5J8yjFYf
 ymGKmhVQ9QoEUgrPb8y0+maV7PIBRnBn1CPOTkwjmQcXWvI3W/QW+Z28BZUt4A2mLs
 QJ5o+tqnL4tzhB0ZX4Q4Zyc7vSg3pNHmIOH06odwTc4RNwoYj7oJ9Rqx5whH1lNjTv
 6u5G7YqrNz15w==
From: Colin King <colin.king@canonical.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lingfeng Yang <lfy@google.com>,
 Anthoine Bourgeois <anthoine.bourgeois@gmail.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/virtio: fix another potential integer overflow on
 shift of a int
Date: Thu, 30 Sep 2021 11:27:48 +0100
Message-Id: <20210930102748.16922-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

The left shift of unsigned int 32 bit integer constant 1 is evaluated
using 32 bit arithmetic and then assigned to a signed 64 bit integer.
In the case where value is 32 or more this can lead to an overflow
(value can be in range 0..MAX_CAPSET_ID (63). Fix this by shifting
the value 1ULL instead.

Addresses-Coverity: ("Uninitentional integer overflow")
Fixes: 4fb530e5caf7 ("drm/virtio: implement context init: support init ioctl")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b3b0557d72cf..0007e423d885 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -774,7 +774,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 				goto out_unlock;
 			}
 
-			if ((vgdev->capset_id_mask & (1 << value)) == 0) {
+			if ((vgdev->capset_id_mask & (1ULL << value)) == 0) {
 				ret = -EINVAL;
 				goto out_unlock;
 			}
-- 
2.32.0

