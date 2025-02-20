Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E986A3E7AF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 23:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236910E9EF;
	Thu, 20 Feb 2025 22:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MaoaBmr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B710E9EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740091290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d40ChabW4iDGfGTAGWVjnRUTnJz5bN6aomJ27OYIXN0=;
 b=MaoaBmr2QtcKIrHMtJkVeOzbRPFExVPdXUgbDNHuh9KfnLmqie9O+aaQVwrpNi/2WpEpND
 0mI+Lld1gEL+rWKyKQDr1HG/0utwH18QCQl22EiSLUIgipevvJBITtkcCgw/0GMdFluTYs
 jYt7MhGLlE4rnirQkSwCEw1z8a0W6e0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-4SwyfRmhO3-NfFiHHVCIgA-1; Thu,
 20 Feb 2025 17:41:26 -0500
X-MC-Unique: 4SwyfRmhO3-NfFiHHVCIgA-1
X-Mimecast-MFC-AGG-ID: 4SwyfRmhO3-NfFiHHVCIgA_1740091284
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5EB0D18D95E0; Thu, 20 Feb 2025 22:41:24 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.26])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 34B921800359; Thu, 20 Feb 2025 22:41:17 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Thu, 20 Feb 2025 23:40:33 +0100
Subject: [PATCH RFC v4 4/4] drm/virtio: add
 VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-virtio-shm-page-size-v4-4-ddaed7b6f734@redhat.com>
References: <20250220-virtio-shm-page-size-v4-0-ddaed7b6f734@redhat.com>
In-Reply-To: <20250220-virtio-shm-page-size-v4-0-ddaed7b6f734@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888; i=slp@redhat.com;
 h=from:subject:message-id; bh=LD6yazuN9XX2svNr8m94RA2wHpTCAoBUHaZHbOCg9WY=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBnt69uJFx9zzRjQfCy3hiKPnyf7VopXmJIeac6K
 xBNGdL/8UyJAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ7evbgAKCRD0aSeNLwwC
 NZvED/4msX9tDoh6GwQsWxrJJkIOu6RfMSk0HzNWL8lfIjZymSItqhYO4nYIhdXgnpsXcLqquTl
 NaPiqocFFT4jvqtvTWy993wOTnqQaEfyXt2c7c3eQ5qjUIHUvb5biYyy8lLVDwo97kz6SG6X/q1
 dublxklAXP/4x5td+HkZYow5dFgrblSz3x0H26yEzg7kfW/s5lj8Am1QtVoFZlzaYx9MAlZoyJ2
 g4RlX+oecL6cFH2k0Y1OMq+eHH2ynhVsA9iEP4ohNAfnxxGlC/GEc0XukUToGvQs5h0F4/AYOUS
 gorRs/cFGu9YfV6OMY2T2qFp2DwJ5sQYjyykTM8D8U3hJNOsTwrJL8veayLX3EddiEl6jRNvoOs
 twXaUkKfYdrl+vflmmYrjRIQQFiYiJiC3UY5sKFZkwkRXfC8Xgkc6ec+MHh5PK5nUlTcplQaXYs
 pAydui3mIlir0MRCw9h9RG4mAMcFAaamfDrGXchMPoePaqhPeRPUhrHJDGiNgC8MmUnZ1OI7E8F
 4nTsc9WNTpvBF0b0GcxZQlupvhhJhTD1GXIJUze++ILWyJj+JJbWMeOEhNderbzrdThjNTa2b5m
 k8dGWgJxp8bkPs7eNCugWg0wMfIf9TKOUjmjeDG2en0vlBGefgViB0xh+aMcpNwWx5lesnfQXt6
 MOyelZ389J0LP4A==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c057365f85a2ace536f91655c903036827312..f112b862c2de4d021fb6a54a080f42ad75034227 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE:
+		if (!vgdev->has_host_visible)
+			return -ENOENT;
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

