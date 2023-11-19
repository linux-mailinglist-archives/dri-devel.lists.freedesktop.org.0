Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E588F7F057D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154B310E1CB;
	Sun, 19 Nov 2023 10:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3468710E1C0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700391437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GpzYJKfv/0ZtdesZuwEDnk0DKAmF9L/deY6r6V9scok=;
 b=EzMSLCGSWtsulfxttRoQ4Lo1ly3TCpqnTwm12RfPh3c6dDHx7OApJ13GbpJK9AoWyjTj/I
 V8KLkiooTjCAqHJXIY2bV9EmhJnE9SJA3A2XR2lDay3JAYdv2GDnCtOXeMPxngOmUQkMEs
 qv5/TGbo1bwVwCIQhLGrG/X2QPMVvNI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Kq7Te4TfPI2tK7T0Jstz2A-1; Sun, 19 Nov 2023 05:57:15 -0500
X-MC-Unique: Kq7Te4TfPI2tK7T0Jstz2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-408f9e9e9b0so7877415e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700391434; x=1700996234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GpzYJKfv/0ZtdesZuwEDnk0DKAmF9L/deY6r6V9scok=;
 b=SGtiwFOM3tbvrGsV1ubDFd+NNZHaZXENMZio8XewkHXgPEhAajReZYYms9RGF/Labl
 dfTvOK0ZhUlrYlcErNmdRa3DZ7xwTtfazQF50osQNoIFbSjLmQKWZj8XL92PFbv9SYHi
 RSxYWpQUOLBr0Oqy35ndeSm8HLxWf8+7yJZJnJLsb8V4IHptin4oyOnuAJtj65L76Xpc
 mevPFkBhX9BX+hLj+rBMTz3JL2u6ChStlQW+iT8qMwg3OHzwq73hGX50vbexSSwYh8uW
 8tj0cyZeQ2Mhti4K7rsKZSz/pQk0F8JpZoQW1Yt4YLXAna9XCy4+DrWlQ1uANELwUboc
 qkXA==
X-Gm-Message-State: AOJu0YwZ0Xpl+Fl2Cm9cuWRZzN/G4mrd4z/sc5wpcVTSIEPaf6kzKgP0
 nVw482h4prF4tR/VxHnqugPxiKdCdnz5P8Py5lMylkXebgrXnHw0iwmWSvvZVC8fQAMcm3dGK0O
 eCzCFJkeimj74M6f6jZ1xZVWc3jMo
X-Received: by 2002:a05:600c:35c7:b0:409:57ec:9d7e with SMTP id
 r7-20020a05600c35c700b0040957ec9d7emr3646452wmq.21.1700391434292; 
 Sun, 19 Nov 2023 02:57:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9bQCU2PwD56RVajuSjL/MgwYtR78B+r3siDyRHcYH8/tVvIrad76Lc1ocORueFtFPDVgqEA==
X-Received: by 2002:a05:600c:35c7:b0:409:57ec:9d7e with SMTP id
 r7-20020a05600c35c700b0040957ec9d7emr3646424wmq.21.1700391433813; 
 Sun, 19 Nov 2023 02:57:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d34-20020a05600c4c2200b0040a48430837sm13634419wmp.13.2023.11.19.02.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:57:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm: Allow the damage helpers to handle buffer damage
Date: Sun, 19 Nov 2023 11:56:56 +0100
Message-ID: <20231119105709.3143489-1-javierm@redhat.com>
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
 Jonathan Corbet <corbet@lwn.net>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Bilal Elmoussaoui <belmouss@redhat.com>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
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

It is a v3 that addresses issues pointed out by Thomas Zimmermann  and
Simon Ser in v2:

https://lists.freedesktop.org/archives/dri-devel/2023-November/430896.html

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

 Documentation/gpu/todo.rst             | 20 ++++++++++++++++++++
 drivers/gpu/drm/drm_damage_helper.c    |  3 ++-
 drivers/gpu/drm/drm_plane.c            | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    | 11 +++++++++++
 include/drm/drm_plane.h                |  8 ++++++++
 6 files changed, 77 insertions(+), 1 deletion(-)

-- 
2.41.0

