Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1260E4DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FAF10E564;
	Wed, 26 Oct 2022 15:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C91610E560
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666798480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bk5/l1P1WJsBzjE+AIX4jodlD6n3+SoO3yq57seOT+g=;
 b=hVnA/+mjo/vIyW7HGezNoSehLLBG2zzZ/RNQJ6DmfS5k+KlxjG1zAKImMJk9Q1z1Yj4IIs
 UX+bHIaUUwvVpjJxQmYM8uEoR7hnN/DwNkZaZ5zVpkN5bPrYkP7vlMxt3W+o1D/rjBcJtc
 V1SuYORzNUcWJdb2KbKN5tzaOVGYuSU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-5Ixlec6TOsO50Tth2-tkcQ-1; Wed, 26 Oct 2022 11:34:39 -0400
X-MC-Unique: 5Ixlec6TOsO50Tth2-tkcQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 gn34-20020a1709070d2200b0079330e196c8so4773252ejc.16
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bk5/l1P1WJsBzjE+AIX4jodlD6n3+SoO3yq57seOT+g=;
 b=8JXlIUV/uxM3jG3aZTR99/gJpoZRFPzVA2o3T3P3MovfKkRTutO8Zf/FFPyUycC95d
 bpVkLJ6ZMAX/18bqINfgWQlXLUMosEBnbzonTpR2MkB6LJ+d/LpJCZ7hmetju9R2zdUT
 H5XVueL7pvdupvTMeJrN7QxaeJO2ciL/7LrRpro2ks7IYZLd3vaYadk9mBLdbEKepJT6
 t4vell2jkEcYWBExzb6svxXvOmGJyGylDGFkCn9wG+1ixoBDu4OKYh6M97vs44oJZBu+
 AxOhVIO4cmYjcFoDl7IOkast6Z/FjiSw8HIbXmAUbctLHrmR0W79bpy/5eyyjYwAlhoF
 Abvg==
X-Gm-Message-State: ACrzQf1QiQyV/XCyVlAlO754iBccHlgDuv4nrOGb5Tn6KBfzGyU0971T
 Mti5f8+FsiP7oxUNMwc5PZJ0KjN6vEsqukmetr6l/hGyX6+j/GxTLWlR8+z+qEcvRYVrP3uuBz2
 DwE1Gpc9Zvl6jbfFNrVReDIAseAJH
X-Received: by 2002:a17:906:9bc8:b0:7ad:7e6a:50ac with SMTP id
 de8-20020a1709069bc800b007ad7e6a50acmr3060191ejc.66.1666798478391; 
 Wed, 26 Oct 2022 08:34:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Tqza3Pl4lNkWJ5bPEYyIoT8BN17lubrg5b1xiKYtRizsuI5HD6j3De8gqbHdjxFOW/rFRTA==
X-Received: by 2002:a17:906:9bc8:b0:7ad:7e6a:50ac with SMTP id
 de8-20020a1709069bc800b007ad7e6a50acmr3060174ejc.66.1666798478229; 
 Wed, 26 Oct 2022 08:34:38 -0700 (PDT)
Received: from pollux.. ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709061ba100b007a9c3831409sm3125296ejg.137.2022.10.26.08.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:34:37 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v4 0/4] drm/arm/hdlcd: use drm managed resources
Date: Wed, 26 Oct 2022 17:34:27 +0200
Message-Id: <20221026153431.72033-1-dakr@redhat.com>
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
  - drop patch "drm/arm/hdlcd: crtc: use drmm_crtc_init_with_planes()"

Changes in v3:
  - Fix alternate return paths in srcu read-side critical sections causing a
    stall when unregistering the driver.
  - Fix potential null pointer dereference in hdlcd_crtc_cleanup() introduced
    dropping the patch in v2.
  - Add a patch to remove explicit calls to drm_mode_config_cleanup().

Changes in v4:
  - Remove patches to protect platform device bound resources with
    drm_dev_{enter,exit}, since this would leave the hardware enabled when
    regularly unloading the driver e.g. via rmmod.
    Instead do this in a later series, once we got drm_dev_unplug() in place
    to deal with a regular driver shutdown.

Danilo Krummrich (4):
  drm/arm/hdlcd: use drmm_* to allocate driver structures
  drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
  drm/arm/hdlcd: plane: use drm managed resources
  drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()

 drivers/gpu/drm/arm/hdlcd_crtc.c | 24 +++++++------------
 drivers/gpu/drm/arm/hdlcd_drv.c  | 41 ++++++++++++++++----------------
 drivers/gpu/drm/arm/hdlcd_drv.h  |  2 ++
 3 files changed, 32 insertions(+), 35 deletions(-)


base-commit: e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7
-- 
2.37.3

