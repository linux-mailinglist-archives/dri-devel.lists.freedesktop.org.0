Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62997F68D7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 23:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3597B10E35D;
	Thu, 23 Nov 2023 22:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF3F10E35C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700777600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BMSDWzklTKYX0k//1UvbJiLR3VQJPVSpH9qxFC3znV0=;
 b=GJbo33xgN7Wu/JYjVnropBxHt6M4RdBX8HYYtHAOGLb43E+rLvRgp3RzlXQpJk1Td2bo96
 OWti92Bqc1/CGt5zDId9QmKs0VWImPoW+gf+N+wglsG9qjv9df9937H/vKBfnOvRY1c4W0
 nYrEvuZx1ABN9Q8e2BJxvAQ7ZktjUds=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-hDp5wfCyOnCSIXMMn888Nw-1; Thu, 23 Nov 2023 17:13:18 -0500
X-MC-Unique: hDp5wfCyOnCSIXMMn888Nw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b3487fa9eso7584595e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700777598; x=1701382398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BMSDWzklTKYX0k//1UvbJiLR3VQJPVSpH9qxFC3znV0=;
 b=Fi4xifuvVxWmgq8ldzJ4QpzgRu3Q0Y+5kjEuRg2gRNh93LwJhgFzDo5PtNtBRGMApC
 0/7dHRDiPA8BwmywburFrc16DB1hzmjtep2nT9GBMeuxFAYoLAShp7QnkA7ok18LT/+C
 9UDCiS8+T0OLXgkyQNpTamXt3kToIehsIcY3HNwbbWQLdbjKzc/ZDQTJ+F5JJD2Pn8Ir
 b2jlUy8P7BVN+TqAzt/xnfYjSWb7nZ1WW/xhonXWD7L+0RpfEEQquv/O4prU2JHSeOMj
 wuefHIxXF478xupv3lvONaJbk41K93oZzKmzfBv7Fm+jQ9HPRaNXR9/PAZXhqrs/xV/T
 nZqg==
X-Gm-Message-State: AOJu0Yyi4kpQER/VLTEZse8wBf3nhb5BZNUHa5SgDHjJb8lcGHykISvL
 yIj69PNaxiJ3mK2EdlrYBtx4kjGm1MEWjRBnDsPi5w6RNubrgkPlZaO5WAmvOnl2GCTYcPwVBkj
 WnkomczfYoKWtDre5hiapmKiMMSgV
X-Received: by 2002:adf:f24e:0:b0:332:e5e4:35a0 with SMTP id
 b14-20020adff24e000000b00332e5e435a0mr514654wrp.51.1700777597836; 
 Thu, 23 Nov 2023 14:13:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTc5cyyb2Lj+zZeLr8whfuiAjV15w5NBZGgF7fkaZUdpQEkaRfYZjLuIjGVT+m4u1zAGDz6w==
X-Received: by 2002:adf:f24e:0:b0:332:e5e4:35a0 with SMTP id
 b14-20020adff24e000000b00332e5e435a0mr514631wrp.51.1700777597458; 
 Thu, 23 Nov 2023 14:13:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v19-20020adfd053000000b0032f79e55eb8sm2641676wrh.16.2023.11.23.14.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 14:13:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm: Allow the damage helpers to handle buffer damage
Date: Thu, 23 Nov 2023 23:12:59 +0100
Message-ID: <20231123221315.3579454-1-javierm@redhat.com>
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
 Jonathan Corbet <corbet@lwn.net>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sima Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux.dev, Erico Nunes <nunes.erico@gmail.com>
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

It is a v4 that addresses issues pointed out by Sima Vetter in v3:

https://lists.freedesktop.org/archives/dri-devel/2023-November/431409.html

Patch #1 adds a ignore_damage_clips field to struct drm_plane_state to be
set by drivers that want the damage helpers to ignore the damage clips.

Patch #2 fixes the virtio-gpu damage handling logic by asking the damage
helper to ignore the damage clips if the framebuffer attached to a plane
has changed since the last page-flip.

Patch #3 does the same but for the vmwgfx driver that also needs to handle
buffer damage and should have the same issue (although I haven't tested it
due not having a VMWare setup).

Patch #4 adds to the KMS damage tracking kernel-doc some paragraphs about
damage tracking types and references to links that explain frame damage vs
buffer damage.

Finally patch #5 adds an item to the DRM todo, about the need to implement
some buffer damage accumulation algorithm instead of just doing full plane
updates in this case.

Because commit 01f05940a9a7 landed in v6.4, the first 2 patches are marked
as Fixes and Cc stable.

I've tested this on a VM with weston, was able to reproduce the issue
reported and the patches did fix the problem.

Best regards,
Javier

Changes in v4:
- Refer in ignore_damage_clips kernel-doc to "Damage Tracking Properties"
  KMS documentation section (Sima Vetter).
- Add another paragraph to "Damage Tracking Properties" section to mention
  the fields that drivers with per-buffer upload target should check to set
  drm_plane_state.ignore_damage_clips (Sima Vetter).
- Reference the &drm_plane_state.ignore_damage_clips and the damage helpers
  in the buffer damage TODO entry (Sima Vetter).

Changes in v3:
- Fix typo in the kernel-doc (Simon Ser).
- Add a paragraph explaining what the problem in the kernel is and
  make it clear that the refeference documents are related to how
  user-space handles this case (Thomas Zimmermann).

Changes in v2:
- Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
  .atomic_check, instead of having different helpers (Thomas Zimmermann).
- Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).
- Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
  .atomic_check instead of using a different helpers (Thomas Zimmermann).

Javier Martinez Canillas (5):
  drm: Allow drivers to indicate the damage helpers to ignore damage
    clips
  drm/virtio: Disable damage clipping if FB changed since last page-flip
  drm/vmwgfx: Disable damage clipping if FB changed since last page-flip
  drm/plane: Extend damage tracking kernel-doc
  drm/todo: Add entry about implementing buffer age for damage tracking

 Documentation/gpu/drm-kms.rst          |  2 ++
 Documentation/gpu/todo.rst             | 23 ++++++++++++++++++++
 drivers/gpu/drm/drm_damage_helper.c    |  3 ++-
 drivers/gpu/drm/drm_plane.c            | 30 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 +++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    | 11 ++++++++++
 include/drm/drm_plane.h                | 10 +++++++++
 7 files changed, 88 insertions(+), 1 deletion(-)

-- 
2.41.0

