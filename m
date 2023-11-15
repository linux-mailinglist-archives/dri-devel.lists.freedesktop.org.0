Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36F7EC364
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93410E08C;
	Wed, 15 Nov 2023 13:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3E10E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700054158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4lF7aMHaWE0StDFmSjkvXf9QppPYg6hsJ7Fo37wmlDE=;
 b=gYxo4DMIPZCI72y4rRdBCnW9ADPFc7AytNTwYzR3LOiy9s2p45HeHs1A2Az1iCsaroSeG2
 Q/n+1rI4YhKX0xXjLx0U8ShF9yivIIXxiE5l6tdmHmA4YgmoNo8/gqzlrOyJufezVAXWc8
 308vnZYTfs8X844Xz8t430qFh2zBoYE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-yr1CbyniO8yqMRAvTBX6Wg-1; Wed, 15 Nov 2023 08:15:54 -0500
X-MC-Unique: yr1CbyniO8yqMRAvTBX6Wg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32fb7de8611so3093327f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 05:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054153; x=1700658953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4lF7aMHaWE0StDFmSjkvXf9QppPYg6hsJ7Fo37wmlDE=;
 b=PuXVxeTqX96V8/dQM9DI/Vxi8X+QXt5bs7CIXe+MZAWXO74V1xveSPw6gI7M8gAjAA
 g7IFuezD2HE3GFhSglwveTUdU296rfTEZHZVOXRshzvEHbNaKxA+h8plcI9jMbADm/fD
 bp77V0+lJnUkP8Mk8LutSwjACmdAA6edRfh7S03hOMCI39LmDold+homZHLyakkAeeGq
 TFtoiKJNVU2ImUSLlQ//7a+8sA9lNqEL0cd1/bXPYTHy4eWY6hjFtEsTFAY5biiTOH98
 zNn1T0mvnYubEtMFzbElzBYj8/Sc3e4fg81s7Hn/GZYs7CjTL1mlRc6WiXZI2DhgRK06
 VQng==
X-Gm-Message-State: AOJu0YwE/uII4x55chAih71sGO46wWCPOepN3oW5Ycf2YDctQ0O2KRk5
 MBKPLw6U1oNKd863y48/+jeDgCExhz+A0l8OID0eE8Ldn4xLLMstlWdG1spcWWXgycknAjgZyVo
 a7Ir60j8AO5BO4qohObPXM8cQ67uU
X-Received: by 2002:a5d:64ef:0:b0:31c:8880:5d0f with SMTP id
 g15-20020a5d64ef000000b0031c88805d0fmr8815339wri.11.1700054153440; 
 Wed, 15 Nov 2023 05:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Akj/DP0M6gaPcJ9iKzQAqtuUVukMuYMObXNcXMXbVoCf04jCr7iPlpSq+gDQSE1T7tfrhg==
X-Received: by 2002:a5d:64ef:0:b0:31c:8880:5d0f with SMTP id
 g15-20020a5d64ef000000b0031c88805d0fmr8815312wri.11.1700054153053; 
 Wed, 15 Nov 2023 05:15:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0032db4e660d9sm10551595wrx.56.2023.11.15.05.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 05:15:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer damage
Date: Wed, 15 Nov 2023 14:15:39 +0100
Message-ID: <20231115131549.2191589-1-javierm@redhat.com>
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

It is a v2 that addresses issues pointed out by Thomas Zimmermann in v1:
https://lists.freedesktop.org/archives/dri-devel/2023-November/430138.html

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
 drivers/gpu/drm/drm_plane.c            | 20 ++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    | 11 +++++++++++
 include/drm/drm_plane.h                |  8 ++++++++
 6 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.41.0

