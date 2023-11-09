Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298927E7030
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 18:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEED710E0E2;
	Thu,  9 Nov 2023 17:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7629610E220
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699550709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KM+kZjFHA8E0A+l+o485oGQAZV87bwGJzM3u9NBaaMA=;
 b=DhmbRGjPS7AHooXQKRDuvNKs3L7FgW1fr4pwxGbuKT27JXclq+W2EG62weXkEMxnT9i7DB
 /5J4sN7ZI8gjULD62mlBgUPmR3SfxRrxzFikmWCR7/v2SKQp8X4z/I0NpPkjasJg4ssUDr
 zZ2Qyfj5oCAnIiCtF3v1YyMd1gJxlFw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-jsheCBNBMNu22iafsGmZCQ-1; Thu, 09 Nov 2023 12:25:07 -0500
X-MC-Unique: jsheCBNBMNu22iafsGmZCQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-408508aa81cso7220495e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 09:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550706; x=1700155506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KM+kZjFHA8E0A+l+o485oGQAZV87bwGJzM3u9NBaaMA=;
 b=X04kS60MQqgRSBqiWM08pZ4bZ3ot2Q7Ae2aHGX5wKbiJoGwE0oRHnYGauOIoJ0xol8
 72nkmkvA8NY5gmMBIWB63Zt6Aiwu+N04LCO7mRbz0v1FLsfMSKfnHBfZVfy7/RTLLTvD
 IFrj3/geLWq/9faIuiQtkL59bxfR+VDp4PKr+bXIFVyfxpZcVRJr/lTBKoViSPI4skXP
 ZEtNDy3ZEhfpXLRXZ6UUuhPwj1CmDEIN1/S23BIDWuB2R2fHVfOxPIkjcW0fen59nSzl
 +mx/znrGVl5n0FQ9mLvbzmX/RCBlZZpgp2YsngcJga6Gs5MYj9068J18NAdIC5gc6ZQ9
 V9VA==
X-Gm-Message-State: AOJu0Yzhx3RBiyDN9FAGK4ktfFZIGc0PplsJz1z7niGkVh5Mo5s+KSNX
 MdGgU3XnGjNcWyPjMcctzmuVcgcGJOCJjLrm0rsIcX7WCymmeMvxrkqh0Sp1y27z4dud0yFgmpR
 1439pDbVeSEew8poq5RoajqWNDs2Z
X-Received: by 2002:a05:600c:3d9a:b0:408:5bc6:a7d with SMTP id
 bi26-20020a05600c3d9a00b004085bc60a7dmr4807912wmb.19.1699550706432; 
 Thu, 09 Nov 2023 09:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBYNpBFpSwc4pVpHVCRnVRLdnQyz2wbfqHlyA9KAIkGVscHGBHFPnaFmMk7VrRW7vmMUDnCw==
X-Received: by 2002:a05:600c:3d9a:b0:408:5bc6:a7d with SMTP id
 bi26-20020a05600c3d9a00b004085bc60a7dmr4807894wmb.19.1699550706031; 
 Thu, 09 Nov 2023 09:25:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b0040839fcb217sm646229wms.8.2023.11.09.09.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 09:25:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
Date: Thu,  9 Nov 2023 18:24:34 +0100
Message-ID: <20231109172449.1599262-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sima Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series is to fix an issue that surfaced after damage clipping was
enabled for the virtio-gpu by commit 01f05940a9a7 ("drm/virtio: Enable
fb damage clips property for the primary plane").

After that change, flickering artifacts was reported to be present with
both weston and wlroots wayland compositors when running in a virtual
machine. The cause was identified by Sima Vetter, who pointed out that
virtio-gpu does per-buffer uploads and for this reason it needs to do
a buffer damage handling, instead of frame damage handling.

Their suggestion was to extend the damage helpers to cover that case
and given that there's isn't a buffer damage accumulation algorithm
(e.g: buffer age), just do a full plane update if the framebuffer that
is attached to a plane changed since the last plane update (page-flip).

Patch #1 is just a refactoring to allow the logic of the frame damage
helpers to be shared by the buffer damage helpers.

Patch #2 adds the helpers that are needed for buffer damage handling.

Patch #3 fixes the virtio-gpu damage handling logic by using the
helper that is required by drivers that need to handle buffer damage.

Patch #4 fixes the vmwgfx similarly, since that driver also needs to
handle buffer damage and should have the same issue (although I have
not tested it due not having a VMWare setup).

Patch #5 adds to the KMS damage tracking kernel-doc some paragraphs
about damage tracking types and references to links that explain
frame damage vs buffer damage.

Finally patch #6 adds an item to the DRM/KMS todo, about the need to
implement some buffer damage accumulation algorithm instead of just
doing a full plane update in this case.

Because commit 01f05940a9a7 landed in v6.4, the first three patches
are marked as Fixes and Cc stable.

I've tested this on a VM with weston, was able to reproduce the issue
reported and the patches did fix the problem.

Please let me know what you think. Specially on the wording since could
made mistakes due just learning about these concepts yesterday thanks to
Sima, Simon and Pekka.

Best regards,
Javier


Javier Martinez Canillas (6):
  drm: Move drm_atomic_helper_damage_{iter_init,merged}() to helpers
  drm: Add drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
  drm/virtio: Use drm_atomic_helper_buffer_damage_merged() for buffer
    damage
  drm/vmwgfx: Use drm_atomic_helper_buffer_damage_iter_init() for buffer
    damage
  drm/plane: Extend damage tracking kernel-doc
  drm/todo: Add entry about implementing buffer age for damage tracking

 Documentation/gpu/todo.rst             |  20 +++
 drivers/gpu/drm/drm_damage_helper.c    | 166 +++++++++++++++++++------
 drivers/gpu/drm/drm_plane.c            |  22 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    |   2 +-
 include/drm/drm_damage_helper.h        |   7 ++
 6 files changed, 173 insertions(+), 46 deletions(-)

-- 
2.41.0

