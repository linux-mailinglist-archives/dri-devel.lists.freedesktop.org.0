Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A83669FB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 13:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840B6E98D;
	Wed, 21 Apr 2021 11:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2946E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:37:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id x12so42255945ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHPBRNcf/mIFQvI2veEoaTkCy/iKf9n28pbccYjYXzA=;
 b=unu4VSdpOU99/2qbQWFLR3P0Xi4bGJBJuYm6CbgBX7gpHnzdR86dp5Ik0Nu0lVpHJ7
 UPXdYzMERza/jsW/FJGMKnXeAtjckCO+9osHhhscZqymqO9hRECzGBPaMBiXgxMlRpbw
 zMFSWTsX0drpSyCA/Qgmt99JQNpiMqzBFPh+NPPDQYWX5m/FGzqy2zapBacKTUMsYrTz
 i+Xa4KWsdmVV9Hl8H8ThngYmknVKAjKU+xqVKg7yLmUt+8YFxyAEGvFkDvwlmA75iHLN
 fw35NxeARSlN+IBa/cvnQFEqE0kgHAC7Wx8xEIEXzgDR7g1hX4WGtP3bHJhpK8/Q7O+u
 WlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHPBRNcf/mIFQvI2veEoaTkCy/iKf9n28pbccYjYXzA=;
 b=Fz0EfiX4oOJMKOaIGpSNkBnmfGaFAjQDNGaw9eXhKPNh4o9evmQJELJWoKDcQr/q7x
 7nPpBQSRouHJV3Ik0NUgTdgXi62qzd56IxYCgQ7MkXfFV5lOolOtsQ1PuwQzDWAZKVuh
 UhOAkrkvY1gsNrZhV8KKtk8/9kPUMerpIBCCzbdIRZdiRgWA3q7wII/ui5BXDuWtsejC
 Za+Wj65NpUUXZg7f1QR7FhQMDHGLrg2jMknImapH1xep6ZCIdXjN6CVeIL0hmVpWFUkJ
 va+BDB2ncZzO9rfbOvfep9I4hP5qHcEJ+JjBQYM+tFpVsO3Op/G3ux9JMvS0gXjRv30m
 ChMA==
X-Gm-Message-State: AOAM531A8wuREpGVeApRtc8306hnEGW4+ouXa9TOMRWmD9W7Z2Ewjm/a
 gZa0eCYHQiwBWT+fPp0w7oo=
X-Google-Smtp-Source: ABdhPJy7e1DNvDfwj/J9yrKUHtmEwYN3jGa1s9aEn1NfTisNrd7hIyEJ/BbUdnnVv4SH8mZHkgddzA==
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr31497632ejb.204.1619005055719; 
 Wed, 21 Apr 2021 04:37:35 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id i1sm2735928edt.33.2021.04.21.04.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 04:37:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v3 0/2] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_*_all() with DRM_MODESET_LOCK_ALL_*()
Date: Wed, 21 Apr 2021 13:37:14 +0200
Message-Id: <20210421113716.15472-1-fmdefrancesco@gmail.com>
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

Replace the deprecated API with new helpers, according to the TODO list
of the DRM subsystem. The new API has been introduced with commit 
b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset 
locks using a local context. This has the advantage of reducing boilerplate.

The work is carried out in two consecutive logical steps: the first patch 
converts the code to use drm_modeset_lock_all(), then the second does the 
final replace with DRM_MODESET_LOCK_ALL_*().

Changes from v2: The work is split in two consecutive logical steps.
Changes from v1: Added further information to the commit message.

Fabio M. De Francesco (2):
  drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all() with
    drm_modeset_lock_all_ctx()
  drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_*_all_ctx() with
    DRM_MODESET_LOCK_ALL_*()

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
