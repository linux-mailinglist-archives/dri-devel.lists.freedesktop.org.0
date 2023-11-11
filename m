Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A427E8D29
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 23:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9D110E2DB;
	Sat, 11 Nov 2023 22:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EB210E2DB
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 22:43:39 +0000 (UTC)
Received: from workpc.. (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 62B1966073B7;
 Sat, 11 Nov 2023 22:43:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699742618;
 bh=U10+EkHqkOD4kaEoYu2gK2478uYYFAVFdFMCVmakhG8=;
 h=From:To:Cc:Subject:Date:From;
 b=kC3L8gWiZ0wdnhznrSREusgQLxJc+IkSf97mNgdSNHO+XbRywCHmeXoAh4KxLVcwJ
 hYuALejDVbvWoSmsNsdrt/jpDv+/yse1MSvAQ/NnlUu1nbzHeuBCjUdcKsSHzGFlJ8
 4nK6XeRj8OzJ7u8oFrJAVQLGMrUIchXWXjPHDbI8oj7yMmVGi5yee/73HUQAN3X42T
 7bPdGGUlStlcReb/KljFTjrYVDLjn5ysuhloyoVpGOnNRKGEXrbHXcAWZtG91i9FDb
 fNnPoQRD06ZrOAy14Sk5RIRfhK0SPG8stElNplvjx3yh2u24IEzSV/cdgxf4u0IUPf
 WOj7vKN+ERmUw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v1] drm/virtio: Fix return value for
 VIRTGPU_CONTEXT_PARAM_DEBUG_NAME
Date: Sun, 12 Nov 2023 01:42:36 +0300
Message-ID: <20231111224236.890431-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The strncpy_from_user() returns number of copied bytes and not zero on
success. The non-zero return value of ioctl is treated as error. Return
zero on success instead of the number of copied bytes.

Fixes: 7add80126bce ("drm/uapi: add explicit virtgpu context debug name")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 1e2042419f95..e4f76f315550 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -665,6 +665,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 				goto out_unlock;
 
 			vfpriv->explicit_debug_name = true;
+			ret = 0;
 			break;
 		default:
 			ret = -EINVAL;
-- 
2.41.0

