Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7867A7947E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149D110E8B5;
	Wed,  2 Apr 2025 17:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fYn1CH2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E85E10E8BC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743616008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ue9UDRpcZFfRT6ZZ3d1v/ptuQfesmwypehS6C96747U=;
 b=fYn1CH2VUrHkVBf/FfrVXLlKv3zf+euiLObIt6b84pSjQoWfuxBOAfFcqAkYFpe9XWuE+N
 uvBbC3UW76vuej7bAs21+SG7YKIqFyGpKs4Nrg9tMBEwl5WMqTtcEw38i2mmWXC6+7M65c
 yeiLq7sTjGGCwvZPYWaJUan0ZFNcRtY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-kw_GrFiVMlSP8i_dIaLUnA-1; Wed,
 02 Apr 2025 13:46:45 -0400
X-MC-Unique: kw_GrFiVMlSP8i_dIaLUnA-1
X-Mimecast-MFC-AGG-ID: kw_GrFiVMlSP8i_dIaLUnA_1743616003
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2ECDF19560B3; Wed,  2 Apr 2025 17:46:43 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.79])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5EA6C180174E; Wed,  2 Apr 2025 17:46:36 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Wed, 02 Apr 2025 19:46:01 +0200
Subject: [PATCH v2 2/2] drm/virtio: add VIRTGPU_PARAM_HOST_PAGE_SIZE to params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-virtio-gpu-host-page-size-v2-2-0afdc8c16cb9@redhat.com>
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
In-Reply-To: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=slp@redhat.com;
 h=from:subject:message-id; bh=DaC4xIu8S920LD9rwCqJXW5v8vFKT9MSwvYIoasRtA8=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBn7Xftkj6yT9EYp57Tc7Bmv1zyoPKTdeDBQ7qkl
 d5Bd7CqT4+JAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ+137QAKCRD0aSeNLwwC
 NRArD/0f+7eo5bUxWQvbJN9KrMRdB2fyPQ13i4nJAfYT2e5NlYqIOhBo+y/gR947CahgRByLNV8
 jx8rTk7ec5IxbSV91+/+vY0HdH7yYPCfZv9cqTikzbYNU/vKRPJnoz3yLjJy/DxOFKIl5VmUzZu
 lCGqhAcV5pUkDcOZIGasG8w3Ep4yKTb5nHFMbtVr9Wf1lijRwgFwVZ5IqcLQ3LlSwzQID1WaNn0
 N0bXN0mpScF2yetVddZSZWm/1mdUyaYpa6xT2NTy9kSEZlSNL9lyTp26q0yngn/O5OZ44t1KVdj
 KpuRWNbdQZePkyV2yO8fgRRxFYr4yWzIyhnul27ocIi8cUIIV8TjLGhro930WzpXpW+MpH9Edv1
 sFkdhGn1Az2kHAqVrvucxuZGc3MUIx81KQKXOQLGIUrDkKjdN+iQxdlu1vUKP3FoSQnVLwxxZae
 HwcbB1dO4Wh2FjClL6uGFKWjtT/X1PUAq64opjQxpMzeovGquNOPdjzr0yeWnOpICLrXGaCZrsf
 hkqcoKur8y7PKCIHiynf/TEONEmBpkv+MG6MAdohfF0l38IM6ALTOykqyizM3Fk/iLqMQK+9IZd
 bKWy/z1Raq7iOS3z42kPCMv5aDJvCibrOSat/d25u4ZIKy6upBMx2qjqxOqhHlJBOeJHa13i/tA
 5FpFGFmlEcviBYQ==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Add VIRTGPU_PARAM_HOST_PAGE_SIZE as a param that can be read with
VIRTGPU_GETPARAM by userspace applications running in the guest to
obtain the host's page size and find out the right alignment to be used
in shared memory allocations.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c057365f85a2ace536f91655c903036827312..405203b3c3847a8b318a7118aa34356c839d249e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_HOST_PAGE_SIZE:
+		if (!vgdev->has_host_page_size)
+			return -EINVAL;
+		value = vgdev->host_page_size;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9bb816d13a300679336cb756f1cbcf..505f87263a15f55302d7134335bebd91ff4cdae3 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -98,6 +98,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 #define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
+#define VIRTGPU_PARAM_HOST_PAGE_SIZE 9 /* Host's page size */
 
 struct drm_virtgpu_getparam {
 	__u64 param;

-- 
2.48.1

