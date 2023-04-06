Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE636D9781
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD810E29C;
	Thu,  6 Apr 2023 13:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D005410E29C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FD4cP/RBr8ih8gcKVXx2NGBKLHH4L3MHvwvuORuWAuA=; b=Lg43GQtZBcYhrq2kmRgU3NIF6X
 E+S8/WvsnmWFxzSy36ObQkr7F0z4NbnKO1uGBUI+0Hof3XxvicUmkYaDXPZWsYlTvr2Sujl/3Uc67
 wFY/3mfOGWDwz0mtZCKIL+qLVWLwkev+i75x27zKnz5+TtxJrm2BKAwHL8D2pYxgi5CqoxY2aHXAz
 vLsOP2VWxhbaiDIhftuLF79IX4ZUsV96v8hAXolWuZkyb/fsm9/e/p8A+7eE1NauNdFyeyAs0KNrh
 7oZAq0iDgE1rnWwi/12JzFx5MlhaLgD3iqp153AttURaqXwkpkCM1iifJtjtDnkFGjSNHZpwXWUPb
 H58uoKkw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pkPFX-0084OI-QA; Thu, 06 Apr 2023 15:02:00 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH 0/6] drm/vkms: introduce plane rotation property
Date: Thu,  6 Apr 2023 10:01:32 -0300
Message-Id: <20230406130138.70752-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements all possible rotation value in vkms. All operations
were implemented by software by changing the way the pixels are read. The way
the blending is performed can be depicted as:

- rotate-0:
                (x) ---->
    ----------------------
(y) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- rotate-90:
                <---- (y)
    ----------------------
(x) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- rotate-180:
                <---- (x)
    ----------------------
(y) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

- rotate-270:
                (y) ---->
    ----------------------
(x) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

- reflect-x:
                <---- (x)
    ----------------------
(y) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- reflect-y:
                (x) ---->
    ----------------------
(y) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

The patchset was tested with IGT's kms_rotation_crc tests and also with some
additional tests [1] for the reflection operations.

[1] https://patchwork.freedesktop.org/series/116025/

Best Regards,
- Maíra Canal

Maíra Canal (6):
  drm/vkms: add rotate-0 and rotate-180 properties
  drm/vkms: add rotate-90 property
  drm/vkms: add rotate-270 property
  drm/vkms: add reflect-x property
  drm/vkms: add reflect-y property
  drm/vkms: drop "Rotation" TODO

 Documentation/gpu/vkms.rst           |   2 +-
 drivers/gpu/drm/vkms/vkms_composer.c |  77 ++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |   1 +
 drivers/gpu/drm/vkms/vkms_formats.c  | 107 +++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_plane.c    |  10 +++
 5 files changed, 145 insertions(+), 52 deletions(-)

-- 
2.39.2

