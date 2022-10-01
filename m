Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B575A5F1D03
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C73210E407;
	Sat,  1 Oct 2022 14:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5E910E405
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1fIiBbsxPsWgr2hCdbsOLxx9Ccx02LRCRvLVngQsXXs=;
 b=WIcnidG9C3DTrBVZLV09BSXfL18gIWWlAVCR32CXCyigNr761r1s9+DYfVMI2QGMRjCa+E
 YJvl19aM3K8SrJSsMR3jIPFio/GdRYrkjHW9Nly54vNhDEpQ5ApwsvDxffwVniNZ/26ASy
 yDrzbNOFIWBzJ9MkqHewT14uCOQ0Fww=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-69HfdhmNNpCsZxDy98y5Sg-1; Sat, 01 Oct 2022 10:58:08 -0400
X-MC-Unique: 69HfdhmNNpCsZxDy98y5Sg-1
Received: by mail-ej1-f72.google.com with SMTP id
 du10-20020a17090772ca00b00782e5bc9641so2563675ejc.23
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1fIiBbsxPsWgr2hCdbsOLxx9Ccx02LRCRvLVngQsXXs=;
 b=W/QenxSu/a564GwicUZx42E3WCKlDgueiZ1emP7pet32hiwPmHaKiMS27oVv5D5tjk
 CyEu2iEpUSbb4ZGB2a9hFr2GUmjpRTRhtg2tcofeLbv1Ts7Hx4TGF3u/rEfg4nbanxjA
 THHWEboUCTb/7eO/g6BjsCMcrHyTl4ibakHhOowSKxKr2BLvXJjuAMsdPL5MjqyA0/aP
 To//wmOsPVKcEdUmfGYCm6evQ0Q2mgduSYjQnzgmqVPQ6lH5JST1iU1qKA6HHOklS7c5
 Vad2yW0xnnR6HQIm8Khc8qyxRxrep+UM8MLj+N/9iDjIu9eugRVzGrZ97wWhu4d9iVxI
 vHTQ==
X-Gm-Message-State: ACrzQf1FThqn0VEBT2k0e8WKB+GknN8i7yfvbn1Du7LO0nSU9FY7Yppj
 MTRXcqWsM7VMA8OomMVPNYFjCWcsSrpahHLzCWJmZ+4BStBxrMCJv6Yv7izoHMOWtTpH+gGUdO8
 czwTxf7Np1RwFYkjtMzt5XYLDmZTI
X-Received: by 2002:a17:907:3f8c:b0:787:a14d:65a7 with SMTP id
 hr12-20020a1709073f8c00b00787a14d65a7mr10071935ejc.108.1664636287688; 
 Sat, 01 Oct 2022 07:58:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+8h0mVBCtRrOQLSmCUm7nhEj9yy+U9P5gKV6lpVmbRMHEq6q58DmFjmVSDYqzAjJYqtJRWg==
X-Received: by 2002:a17:907:3f8c:b0:787:a14d:65a7 with SMTP id
 hr12-20020a1709073f8c00b00787a14d65a7mr10071921ejc.108.1664636287474; 
 Sat, 01 Oct 2022 07:58:07 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a170906041000b0078197a9421csm2797869eja.85.2022.10.01.07.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 0/9] drm/fsl-dcu: use drm managed resources
Date: Sat,  1 Oct 2022 16:57:53 +0200
Message-Id: <20221001145802.515916-1-dakr@redhat.com>
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
  drm/fsl-dcu: use drmm_* to allocate driver structures
  drm/fsl-dcu: replace drm->dev_private with drm_to_fsl_dcu_drm_dev()
  drm/fsl-dcu: crtc: use drmm_crtc_init_with_planes()
  drm/fsl-dcu: plane: use drm managed resources
  drm/fsl-dcu: use drm_dev_unplug()
  drm/fsl-dcu: plane: protect device resources after removal
  drm/fsl-dcu: crtc: protect device resources after removal
  drm/fsl-dcu: remove trailing return statements
  drm/fsl-dcu: remove calls to drm_mode_config_cleanup()

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  | 64 ++++++++++++++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c   | 47 ++++++---------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h   |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c   | 20 ++++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 58 ++++++++++---------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c   |  8 +--
 6 files changed, 116 insertions(+), 85 deletions(-)


base-commit: 08fb97de03aa2205c6791301bd83a095abc1949c
-- 
2.37.3

