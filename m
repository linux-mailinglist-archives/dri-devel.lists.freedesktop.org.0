Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5146E24C1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D736A10ED49;
	Fri, 14 Apr 2023 13:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0C10ED47
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Qo2suIwgpLTHqcAjZeYqW9lquF4QeGAfYBNp+MfA3E=; b=Ihhb7LgvyCChWLCWT3ywOIal/z
 qgg11YxBfU+9LD7mZfQqDEPeX/HQo0rctmj1/krrfXMz+qwwDVw55dSAXxa9rQwHQ6wZQelsZO91n
 O/KvkjB/ApbWQ7XyHz4Z39EuHF5AglKeQLTGymibsmKIZWV/76L6jXsYYWAiFryWwfx1iAKoDriPC
 eNO0QxMMy1+3ADCNWx8zn9/NZatQifWw1QgOF/Az30PxJFJjx3CZ2zEyEO3R2vie9RluhooQZTZMs
 CJN1mOOBn4ZUEGsZSd9YkFLb1di1kcnXOpgmtJz22bN3LRtiktw3hgbwfStI6XRkEuxe21gI022Je
 hRBqlY5w==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqO-0015Av-Ol; Fri, 14 Apr 2023 15:52:05 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 0/7] drm/vkms: introduce plane rotation property
Date: Fri, 14 Apr 2023 10:51:44 -0300
Message-Id: <20230414135151.75975-1-mcanal@igalia.com>
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

In order to avoid code duplication, I introduced a patch that isolates the
pixel format convertion and wraps it in a single loop.

v1 -> v2:

* Add patch to isolate pixel format convertion (Arthur Grillo).

[1] https://patchwork.freedesktop.org/series/116025/

Best Regards,
- Maíra Canal

Maíra Canal (7):
  drm/vkms: isolate pixel conversion functionality
  drm/vkms: add rotate-0 and rotate-180 properties
  drm/vkms: add rotate-90 property
  drm/vkms: add rotate-270 property
  drm/vkms: add reflect-x property
  drm/vkms: add reflect-y property
  drm/vkms: drop "Rotation" TODO

 Documentation/gpu/vkms.rst           |   2 +-
 drivers/gpu/drm/vkms/vkms_composer.c |  79 +++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |   5 +-
 drivers/gpu/drm/vkms/vkms_formats.c  | 153 ++++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |  12 ++-
 6 files changed, 163 insertions(+), 90 deletions(-)

-- 
2.39.2

