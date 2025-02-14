Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70624A36150
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BAD10ECE8;
	Fri, 14 Feb 2025 15:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GaVtVsqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874010ECF4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739546274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjmfsPFlVVF5AWgzzAtVJttyvI0k7JVXMhFtVMQApJc=;
 b=GaVtVsqem7zTZ0qdsiZlzGXrwSGPOCAkCf15FSfI2Ex44haa8ErU6xHcSGmQvn+P89B2g0
 g+XIlqIc0BvBhiLSYblkLdc1UC6TH//RsaNFuoR5nsfyst560fJMauUNmZdLgul5Jf4tVj
 2+0rYVREoW7lPSm9FkE7dMX9Y3FREx0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-Tj8BzwX_MPymrsacXgN4bg-1; Fri,
 14 Feb 2025 10:17:50 -0500
X-MC-Unique: Tj8BzwX_MPymrsacXgN4bg-1
X-Mimecast-MFC-AGG-ID: Tj8BzwX_MPymrsacXgN4bg_1739546269
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A444318D9585; Fri, 14 Feb 2025 15:17:48 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.45.225.8])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E508919373C4; Fri, 14 Feb 2025 15:17:41 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 14 Feb 2025 16:16:59 +0100
Subject: [PATCH RFC v2 5/5] drm/virtio: add
 VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-virtio-shm-page-size-v2-5-aa1619e6908b@redhat.com>
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
In-Reply-To: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826; i=slp@redhat.com;
 h=from:subject:message-id; bh=/aoLSKIJznnbsjZ5Jh4GqZ88soBWly62WzaVs9lwiik=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnr15wk7cRkC8T/4bZJS1Sw62+SpzC/oEbqVusM
 iKcBZiAxJSJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ69ecAAKCRD0aSeNLwwC
 Nf33EAC1hAU5vFGUYPj0EZ6y7b8HSZ+J+/SSavSEjVx4NxdlUjeQA4kK8+A3wJh5g8gpPN0vgU4
 I/+B6kZVyAPIYGHvkdioxNXNE4QLCqn7QAzuCSAxC3akm9cetbveC9AZgjUab4/j1QC5Wl1rRv9
 SmdpYcN8gsVx5BeE4+UiE/5UA97nx+RonYYYIXau8nJjtTksRRIMBgmP8r4lK9YdzsJecuvVeOJ
 cul3DhmClUpcrc/LjdWHxggus6HgNGcpOnJUnEJIlOWfBFFAIZOp6JybOb6rM5J3A18xhtZLrst
 gW9LR2g2n8ASZeLisMwrfxovc4nGCbgLsy4Z8yH8PBGtcn7TZN8FFGlvYEr/8z6J1unkuHBxLDZ
 CIVVhVtPT3sXBN/wRs1pX6Y5aV8DWMjhj3hiNolLqp3wsZ+QrVdSeMkZpOWY5stAZ8nVNk83Tdp
 PlnhQdya6zCw67j9gbfmFq0QdPWxksH3NkzwPySH6OdoeUFRuuTyAiB08w53UbmkOT8RrMzlEhb
 0ApQWtNOFNbtS01aM0TdHfNJk2yUMhrSt/rxuQjoLME7b2UkpmYtesH3Rc3UbrR+vFNulZ6HaHY
 mWa6RT/VU9jMsKyT/gOvYzGljtaxdXJja6dSmOFFTGa/gWaTrB77oWvM+NqxEwDo1m6xdyIWhjl
 eQltadZ/+ZIcf7w==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Add VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE as a param that can be read with
VIRTGPU_GETPARAM by userspace applications running in the guest to
obtain the host's page size and find out the right alignment to be used
in shared memory allocations.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c057365f85a2ace536f91655c903036827312..4b49635b4fe1d4256f219823341cef8e5fa8f029 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE:
+		if (!vgdev->has_host_visible)
+			return -EINVAL;
+		value = vgdev->host_visible_region.page_size;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9bb816d13a300679336cb756f1cbcf..72db6b3339e0dcaf550acbf5ac4381a6e5c2216d 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -98,6 +98,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 #define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
+#define VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE 9 /* Host SHM page size, with format PAGE_SIZE >> 12 */
 
 struct drm_virtgpu_getparam {
 	__u64 param;

-- 
2.48.1

