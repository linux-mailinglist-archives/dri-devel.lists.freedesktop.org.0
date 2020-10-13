Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B228DA2F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5EB6EA0E;
	Wed, 14 Oct 2020 07:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495DE6E8E2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 13:27:21 +0000 (UTC)
IronPort-SDR: o2WvGFT7ybCG9pB5feKcyMtptNvZQU0/tIwPNTpUsBV9Qg/qKOV8XXV10uCeR6wzcckvP+fIn8
 9Qtaa6EPYYWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250601684"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; d="scan'208";a="250601684"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 06:27:19 -0700
IronPort-SDR: TYK4IrnTR+X0Cbr/2jiotEL4uJt/+l9BMomWSZsNWrOI9e0q0acjCl5Wt1Itupj+iXpp7uy5uJ
 sK5LZrwzsBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; d="scan'208";a="351107056"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2020 06:27:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 82D6C3BB; Tue, 13 Oct 2020 16:27:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2] drm/virtio: Use UUID API for importing the UUID
Date: Tue, 13 Oct 2020 16:27:14 +0300
Message-Id: <20201013132714.70973-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is import_uuid() function which imports u8 array to the uuid_t.
Use it instead of open coding variant.

This allows to hide the uuid_t internals.

Reviewed-by: David Stevens <stevensd@chromium.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of drm-misc-next (Gerd), added Rb tag (David)
 drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 6434b9fb38a6..c1824f536936 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1141,7 +1141,7 @@ static void virtio_gpu_cmd_resource_uuid_cb(struct virtio_gpu_device *vgdev,
 
 	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
 	    obj->uuid_state == STATE_INITIALIZING) {
-		memcpy(&obj->uuid.b, resp->uuid, sizeof(obj->uuid.b));
+		import_uuid(&obj->uuid, resp->uuid);
 		obj->uuid_state = STATE_OK;
 	} else {
 		obj->uuid_state = STATE_ERR;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
