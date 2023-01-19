Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C53672D95
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 01:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060AA10E21F;
	Thu, 19 Jan 2023 00:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0610E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 00:43:00 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B0DF6600864;
 Thu, 19 Jan 2023 00:42:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674088979;
 bh=y/gY+85NjTLhBn5wfhTsCF0KzUxBtwU+VsZUtinaWsM=;
 h=From:To:Cc:Subject:Date:From;
 b=ObxgNy00VQe6VFaTDvpux7dxn/S4GD77rvxR7sS5Kl5tbMGHTm3GhoMxKkBScly1c
 nOb27Ks5sppviP4L443OpFtU/LGRlu+dATKoB8MHGEjf9YTWtpoBUrkhBBSYs2RW/G
 jfVwThzYeCF1fnRGj2PQ2Muu3I+M14Agqv4O2Bd5/8HlZEMMaZIMAEaU1T8onGaail
 jDzVfbiMHjzhTiGxKW0wLp7/c4SscuXyM8dJq8hLH0SHQfvKUE6E0+thKYxM0NKJhL
 KkTYqe00PP9H1Io1r3ldlWcXopbCI3UVFJFbCbYawqcS3tkRcIGATyyvxA3sKPG09U
 mgFx5X8ef3VPQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Subject: [PATCH v1 0/1] Add sync object UAPI support to VirtIO-GPU driver
Date: Thu, 19 Jan 2023 03:41:42 +0300
Message-Id: <20230119004143.968942-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.0
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have multiple Vulkan context types that are awaiting for the addition
of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:

 1. Venus context
 2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)

Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
generic fencing implementation that we want to utilize.

This patch adds initial sync objects support. It creates fundament for a
further fencing improvements. Later on we will want to extend the VirtIO-GPU
fencing API with passing fence IDs to host for waiting, it will be a new
additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
drivers in works that require VirtIO-GPU to support sync objects UAPI.

The patch is heavily inspired by the sync object UAPI implementation of the
MSM driver.

Dmitry Osipenko (1):
  drm/virtio: Support sync objects

 drivers/gpu/drm/virtio/virtgpu_drv.c   |   3 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 223 ++++++++++++++++++++++++-
 include/uapi/drm/virtgpu_drm.h         |  16 +-
 3 files changed, 239 insertions(+), 3 deletions(-)

-- 
2.39.0

