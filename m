Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984AA5B91A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8520410E201;
	Thu, 15 Sep 2022 00:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAAF10E201
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hw7ZED2okp8mQvltefC6fsCVEpzJEwtDfN39KXAnS80=;
 b=d9UCDD/Nz+znBn2PSaOFYDbMlZUkoZOsOf1EO3jd/jJjLIisKyaXirnSd/qOerbmAZOqAw
 y7xlvFgcRGLqqUaWsXW7S7KAbY4yzy2oe6O87D1qNw9lJChwR8vIRfvNQB2Gci+nqrCIQ7
 mV1BQFCeXu6sg1+RHHdvob+kzS30kTA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-8lCM8FDZP0CVQ2W80gZFVA-1; Wed, 14 Sep 2022 20:32:40 -0400
X-MC-Unique: 8lCM8FDZP0CVQ2W80gZFVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 f10-20020a0564021e8a00b00451be6582d5so7936174edf.15
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hw7ZED2okp8mQvltefC6fsCVEpzJEwtDfN39KXAnS80=;
 b=r+BEQ6BRiHmiBe57XPot/u9cagYQLxAUYdTv9xIVrH64oferc0UHJ2IgDon/GG+Dti
 fhgszDV/eh2WqkkMArvy50zzrUllAcuhh6ypmSy1podf9Vf8JFYL7kkNZuiK1iSVMoT5
 TAVIIu15DYA+nO+krt8/Jngv6DOJSqayNRP1MlF3VjULEuPgjIt+a92jDJt/7LJ4EHge
 z6y7GDYx5fYOYGPUrBXX1ig2EuREY10XkOuh9UzlGRPHNNDWYVO6MGOmgCcD9oC67qVF
 TErwmRIMAUXfLK0x2qNPkYSQv5EBfxrN5mrhyzBtdfnHbg9ItrYM/FJ43vnS6JS1oem3
 6H2A==
X-Gm-Message-State: ACgBeo0xyD3mev254BQiuZApUHK22Vrnx/AD4kshBPQUEN3/Qv+T3oTJ
 nWkmko2WSkgWRB1/uHd0eOrbNr7F6YhCFej2v3XcU7YxYbVOhbDtOQbUktivbLGRGK4u7PQIQsK
 5KOJgz6w53Y5KEG1EhMMSByZV+MFa
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id
 ez12-20020a056402450c00b004436279774fmr33329982edb.11.1663201956682; 
 Wed, 14 Sep 2022 17:32:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7nHZI5XsD9F+qgRoUEGMlldRyh+VMTm0OqtySWAdIM5cFZPuKz7TCcA7Zl5iHzsZT5OuxwcA==
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id
 ez12-20020a056402450c00b004436279774fmr33329970edb.11.1663201956387; 
 Wed, 14 Sep 2022 17:32:36 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a17090653c600b007724b8e6576sm8304419ejo.32.2022.09.14.17.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:32:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 0/8] drm/fsl-dcu: use drm managed resources
Date: Thu, 15 Sep 2022 02:32:23 +0200
Message-Id: <20220915003231.363447-1-dakr@redhat.com>
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

Danilo Krummrich (8):
  drm/fsl-dcu: use drmm_* to allocate driver structures
  drm/fsl-dcu: replace drm->dev_private with drm_to_fsl_dcu_drm_dev()
  drm/fsl-dcu: crtc: use drmm_crtc_init_with_planes()
  drm/fsl-dcu: plane: use drm managed resources
  drm/fsl-dcu: use drm_dev_unplug()
  drm/fsl-dcu: plane: protect device resources after removal
  drm/fsl-dcu: crtc: protect device resources after removal
  drm/fsl-dcu: remove trailing return statements

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  | 64 ++++++++++++++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c   | 43 ++++++--------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h   |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c   | 19 +++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 48 ++++++++--------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c   |  8 +--
 6 files changed, 108 insertions(+), 78 deletions(-)


base-commit: 961bcdf956a4645745407a5d919be8757549b062
-- 
2.37.3

