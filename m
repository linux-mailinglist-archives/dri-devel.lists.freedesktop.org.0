Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E2364189
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EAF6E2DF;
	Mon, 19 Apr 2021 12:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352D6E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:21:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z5so3925880edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QgzYB7uzPMo34dcMzysoA0LrI1ass47pm3czPSoq1U=;
 b=VAT8FpCtHRM92sbgVEI8Trx7stn7sJWjJfQnsj+PFm7vd0oZRuN93WUZWluK+YH4Te
 SgxUH1vmjPd92RGWRPDkH4OFJWFXmGs31/jnG/bNP3jCjsgg/0ruK2g2TOCoMJ3K8EdT
 1tUWSg8qbQVMI2fy7NGbowniSqkecU+TXq1+tgzDJuiDs2DNwkbMtRSadocQ88c5cndh
 qxBSY/T85XXfp0yzlnu5EWyQe2tCuqiOEpbcoO3PIl9ELJjhN/iy3wp7OqnWzm16TgnW
 fkRjgMttqt45smvJYyZOIW6TTtqjz246v+7CNCH9dRAMx98c9Eo5FYqx1Ub21sTwlW+v
 Co1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QgzYB7uzPMo34dcMzysoA0LrI1ass47pm3czPSoq1U=;
 b=OJmfjUOFqQ5Cf5Zt2meSzFRMKPI7nl/n2123aGNG2rnA46evy3dqWok0TY//o7I7+C
 lqoooYk9ojzXP5DoLrG3FPoZpLklR2GqtQjqCjsLO6FSfuuOe4dlAOS3hRR9yXDi5YQu
 iiK5ppIFKXzwA2Vnou0K+xWPg+g4maRTax8/Mt6qH6JhH+YrhSH688N3bbhoIXLg7vmE
 vFEFtee1Bp9DPgwssjXcFsfPx4rLAEwQ7TSBSeTVrQn0/2Ll2qAwQlnwT1YrtZBv1q31
 /8uWRXeCPnNH6N+LBojE3/Qbb5NAFOUiM6R0rYx/4PT/RoRr+Mq2GReZQib8OVpme8Df
 2cOA==
X-Gm-Message-State: AOAM532NkX2pJyveJjmBnfBFyycLN4wlWbjg5ueNBlLTPR+lzwS1W0dd
 AEclkwmsLr0iumbD2WffMaE=
X-Google-Smtp-Source: ABdhPJyKJDBsTmXWsKB3CCItwRuSOIOjZ0IAF70AmiL6Of7oi45jcvqENRbS+om65jCKYkFhvK8skg==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr25731646edr.80.1618834864377; 
 Mon, 19 Apr 2021 05:21:04 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id c19sm12576152edu.20.2021.04.19.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 05:21:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH 0/2] drm/amd/amdgpu: Replace drm_modeset_*_all with
 DRM_MODESET_LOCK_ALL_*
Date: Mon, 19 Apr 2021 14:20:57 +0200
Message-Id: <20210419122059.738-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the TODO list of the DRM subsystem, replace the deprecated
drm_modeset_*_all() with DRM_MODESET_LOCK_ALL_*().

Fabio M. De Francesco (2):
  drm/amd/amdgpu/amdgpu_device.c: Replace drm_modeset_*_all with
    DRM_MODESET_LOCK_ALL_*
  drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_*_all with
    DRM_MODESET_LOCK_ALL_*

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++++--
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
