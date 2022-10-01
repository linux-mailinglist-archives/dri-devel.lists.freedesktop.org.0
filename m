Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBB5F1DB6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8872010E660;
	Sat,  1 Oct 2022 16:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0710E65F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kevHGqHRgDKM3mYrZtA/oomTniNa4wxI28bq+wUQvvo=;
 b=ap6uIZnU7B1E4qk6AYCK5jo8JEEyaX45dm0zKAxUEHKnUeFepdnql8NCnWoh/ovwRC5fxo
 8V1XVekCP3VpHVL61HVvD0PZTTzk7nrMmfnwW3SBXO7S6yG+hBN67RVhHFKPwgaOSRWVpo
 tcpMk7woaJUTQfMR1YlQQSGPfXmjwaM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-1eSEujg5NhSVqIFGi9gHRg-1; Sat, 01 Oct 2022 12:39:50 -0400
X-MC-Unique: 1eSEujg5NhSVqIFGi9gHRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso5843411edc.21
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=kevHGqHRgDKM3mYrZtA/oomTniNa4wxI28bq+wUQvvo=;
 b=ZGjb401lb2Wfg6/AnbBNpfoZO99r/VfWI/sAivSOuqwG8hJYlCNIGj7RuHFjNY8HFQ
 0IvyIn64d6W9zP9wbP7JP+3WsmCj2VPrk9oMNhMf2v6FBUhtg7dC5wB8wq0kgJkGVVBS
 HxyFcOCeR1CdOZMK9AurIsgSnozWvRIkXOrGOpK1IJ7eC+YRiYJJ133+L0adS27OP5rM
 qzVl8rEl6LO5aWAeZPD/7l+Hl9xGxHU6L6mSMbrgPeegNkp0Cd/sLFUnw2vUp/r3rJYJ
 gD/X5xWwwREAJp96Ckpc8EPRE+EsBjkOeG7gIhYadiQo4weZVJuzf6eNi6BJmTFS/fM/
 pIPg==
X-Gm-Message-State: ACrzQf2GlEhSbLQzYAYKptsDNu9G04W9MrousCHTk3LuOtkZ3uAqhblk
 oZT3M/uBlbBUG5f4WurZvZ6rNh4UNqsMyv+TaHbZ2qjL0AGmeRdkFSqSwGWABGrPZnEPhYjMr85
 FdHIg62ABJq697kdshA1CxiqtD38/
X-Received: by 2002:a17:906:1350:b0:77f:76a7:a0f with SMTP id
 x16-20020a170906135000b0077f76a70a0fmr10017958ejb.503.1664642389699; 
 Sat, 01 Oct 2022 09:39:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54VV9uAb9qLqq3EX6B97VOEHTAE/Z26jvUB/CY4X2lB3nCbs30lRthPV6kqXyOMt5c7RlLzA==
X-Received: by 2002:a17:906:1350:b0:77f:76a7:a0f with SMTP id
 x16-20020a170906135000b0077f76a70a0fmr10017951ejb.503.1664642389485; 
 Sat, 01 Oct 2022 09:39:49 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056402514f00b00458b41d9460sm1554870edd.92.2022.10.01.09.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:39:49 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 0/9] drm/arm/malidp: use drm managed resources
Date: Sat,  1 Oct 2022 18:39:37 +0200
Message-Id: <20221001163946.534067-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series converts the driver to use drm managed resources to prevent
potential use-after-free issues on driver unbind/rebind and to get rid of the
usage of deprecated APIs.

Changes in v2:
  - While protecting critical sections with drm_dev_{enter,exit} I forgot to
    handle alternate return paths within the read-side critical sections, hence
    fix them.
  - Add a patch to remove explicit calls to drm_mode_config_cleanup() and switch
    to drmm_mode_config_init() explicitly.

Danilo Krummrich (9):
  drm/arm/malidp: use drmm_* to allocate driver structures
  drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
  drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
  drm/arm/malidp: plane: use drm managed resources
  drm/arm/malidp: use drm_dev_unplug()
  drm/arm/malidp: plane: protect device resources after removal
  drm/arm/malidp: crtc: protect device resources after removal
  drm/arm/malidp: drv: protect device resources after removal
  drm/arm/malidp: remove calls to drm_mode_config_cleanup()

 drivers/gpu/drm/arm/malidp_crtc.c   | 68 +++++++++++++++++++------
 drivers/gpu/drm/arm/malidp_drv.c    | 78 ++++++++++++-----------------
 drivers/gpu/drm/arm/malidp_drv.h    |  2 +
 drivers/gpu/drm/arm/malidp_hw.c     | 10 ++--
 drivers/gpu/drm/arm/malidp_mw.c     |  6 +--
 drivers/gpu/drm/arm/malidp_planes.c | 45 ++++++++---------
 6 files changed, 117 insertions(+), 92 deletions(-)


base-commit: 08fb97de03aa2205c6791301bd83a095abc1949c
-- 
2.37.3

