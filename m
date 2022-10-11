Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F95FB88D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB9610E828;
	Tue, 11 Oct 2022 16:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DF610E828
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665507109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=28aJ5XW2Re+JDVuFK2sayuEhZGIwLwkMzVSZJ8TTZjc=;
 b=S0ad33Ht7gULM8vT5V+58tvCUakuW/iBhpGICvPrnux/HltNMrezQs0lejF3PFDNdY6id1
 r3RumozuEcbKY73uMB2aV0tSNO9f4izra/wcYROw6kl1X86dMIxyR/KqnIZ9FOyhHU2mU5
 GySGcquEImqod275JP1cF8z2AINTe3s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-ktr69va7O3WdwkhfOViEcg-1; Tue, 11 Oct 2022 12:51:48 -0400
X-MC-Unique: ktr69va7O3WdwkhfOViEcg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so1884373wrg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 09:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28aJ5XW2Re+JDVuFK2sayuEhZGIwLwkMzVSZJ8TTZjc=;
 b=yTHM7Kg/gVjocR/N+KEnXne1+UZNWZapeRQau8olTkfnryhhw6a1xGT1ztxQhqHWGB
 MaNou02KDGvIi1hBuikiLMEy/GrUahN0ZpkIhVR2fQb2DcwF1fkzPuK4AbMjqm08A320
 qeNBpZ4QgduCCGA8wSTOcSFOF3zsENq4is9EbsJHvrYOokQ6YIamaDpvtg46w6YfM3OT
 IWgOcxwGAxf2LAKZ8XODaagePNnxvk48gaD8drFwym4Qc6zHF4Y2x+czHaGc9/+tlFqI
 Zj6iX1GYolh4M0iiZYCDn0nPXXWCEe0Ud4kqoVpY0ro4/kBoO8SQ9IBfZF3HqGWi0svy
 zagw==
X-Gm-Message-State: ACrzQf1QP6BOc5rqrdrA2n/P+QLqU2i/KvUaS0c1GUg/bU214m7VP2Kv
 1cB9rljOjZpUtP65J3xUgFVfjsgs86Go3s5/TI00VxzFwxmU2Ibl4e8isua2Rv8Ba2MFANQu1x5
 PzElYaKBb3DwyAuwMJbJ/g+AWJ4M6
X-Received: by 2002:a05:600c:2d45:b0:3c6:cc57:be72 with SMTP id
 a5-20020a05600c2d4500b003c6cc57be72mr13586wmg.23.1665507107559; 
 Tue, 11 Oct 2022 09:51:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4soStj05RwBkvP59zpMQ8XQ7hR8mRKFb7xVCVqVnBDoqcV30KHZ3UzBCRMhxLqCL6OIXZOOg==
X-Received: by 2002:a05:600c:2d45:b0:3c6:cc57:be72 with SMTP id
 a5-20020a05600c2d4500b003c6cc57be72mr13570wmg.23.1665507107176; 
 Tue, 11 Oct 2022 09:51:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c6c76b43a1sm2025629wmq.13.2022.10.11.09.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 09:51:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add a drm_crtc_helper_atomic_check() helper
Date: Tue, 11 Oct 2022 18:51:32 +0200
Message-Id: <20221011165136.469750-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper function and make drivers that have the same logic in their
struct drm_crtc_helper_funcs .atomic_check handler to use this instead.

Patch #1, #2 and #3 are just cleanups for the mgag200, simpledrm and
ssd130x drivers respectively. Finally patch #4 converts the last two
drivers to use a helper instead of open coding it the same logic.

The changes are inspired by a patch from Thomas Zimmermann for the ast
DRM driver:

https://patchwork.kernel.org/project/dri-devel/patch/20221010103625.19958-4-tzimmermann@suse.de/

This is a v2 that addresses issues pointed out also by Thomas in v1:

https://lists.freedesktop.org/archives/dri-devel/2022-October/375363.html

Best regards,
Javier

Changes in v2:
- Reference drm_plane_helper_atomic_check() from drm_crtc_atomic_check()
  kernel doc comments and viceversa (Thomas Zimmermann).

Javier Martinez Canillas (4):
  drm/mgag200: Do not call drm_atomic_add_affected_planes()
  drm/simpledrm: Do not call drm_atomic_add_affected_planes()
  drm/ssd130x: Do not call drm_atomic_add_affected_planes()
  drm/crtc-helper: Add a drm_crtc_helper_atomic_check() helper

 drivers/gpu/drm/drm_crtc_helper.c      | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane_helper.c     |  4 +++-
 drivers/gpu/drm/mgag200/mgag200_mode.c |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c      | 20 ++------------------
 drivers/gpu/drm/tiny/simpledrm.c       | 20 ++------------------
 include/drm/drm_crtc_helper.h          |  2 ++
 6 files changed, 36 insertions(+), 38 deletions(-)

-- 
2.37.3

