Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B11B3E2AF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B705110E435;
	Mon,  1 Sep 2025 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ubey+isC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218A10E435
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:25:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45b7d497abaso27440945e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729553; x=1757334353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qbycQLF9MWkGkzA+fGZj0+ulP2LwfvU4kMytcoetwe8=;
 b=Ubey+isCvY4RZhcTJeshrDThlGS0w0zJE3YfLgU3R21jqpRjEVwIbHiNJmDHkAlNH8
 KV26gDZ+hpSiR/2Z7vwdWqQduaDdja3F3F1ZVa3+XjO0bEJ8SCVJSLXu4M5rjw+d8K6S
 WO8IhM9mUtOLhqiL58P897Y+G5Ej87qsQTW+oZUyIpLc1tCOyoIZjCYyZghrAWdWOI99
 /8THNzLSDltoVaAeLui4fOMNx1JOvbbQQzy7kwiDYszfg8ORCM0/6ol4U1oe1ahenOXX
 cet8ypBxNZnAaXwXTLhm4p94ameTaUFFdyWxyCcvcLz36MJ71Yu4ddop3RNf6WYBrdJI
 DBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729553; x=1757334353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qbycQLF9MWkGkzA+fGZj0+ulP2LwfvU4kMytcoetwe8=;
 b=OxducCtJNIIJohlXMtLGKG/en6vpnF8aiUSu0WM09utoUogIlusHI3/f6aE+xjQkur
 nJlO0VpZtgImOQjAt9U0G/jdPMFZCcvaMNKRKu3Mct0e12HjnG7pe5+E+AF3IIKTndhs
 tT5NdGJmRDF9y2+BsYQomHoAYwFKDjX5//DeE21O1Mg1eeoe8b3hSul9PDq4TK19lSKo
 /iFRBMe79yyL2nhEQiAN6o6JOkv5QqPXQoETl+9Dq6H5uWMuDFcwkIOsAEPxmu89jGLL
 0u7afkwR5200BkkYH/rI3fmRNSkUUPeav1gCI5SrJH+3ZZ5t/dNdCl0X/XD6NbEwcHUa
 y2Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHui3qTSEn4p7q8TtGpw3X78lFEDsVRISUA+R2GMFFdDq5YEU2L7doGzug/9mgr/KTnUBIDImCOwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZylpu7PqqMUZSvu45t/DD65j+40XBaU/g+kxNUZ8BOJLwKJP5
 LZlczt634Wd8Y3YG6qmf+so7OoWtkCuFh+t7KbUXst/eim4+4YXhMAC/
X-Gm-Gg: ASbGncsMLDyPKhS+HGMFnhzhxprEZWdxwe9Y2iU8O7xHxc7o7RT5sfpAnlWnjUiv6W6
 hKjUloI0RNq7+y1keZCNO/ZafDozkvRoaHgXAO+mSwg8CRsfNESs5yn5s4HPueJ4uQ46dPlhktI
 8php4+hTpzzZd7P6/epzeA7CKrniqtRTGK99Z2K1WoDx49hJON5W9U0mFXWuIfmJGdwAD0nQ3r6
 j2EEpvnRVkTPZ0bi/PyhfnctBnlm0NXCIVXYlUdMVJuF5OEoNRO716FYJlOBqrFMmUncEHepMRf
 pWceUWGGZAf9vSjYCd4iSjijcQ4HDqzpe8aiL5SvKsQm9W+nQk2wH1tYQQp5p2QOwEIghwHdsfe
 FTFVYGv8EIBHj2cqc0P76DbnU4XYN
X-Google-Smtp-Source: AGHT+IHRynpVpTWD6ySXHOkdCNUyg4PSynT/rcEtXw/LLZpnm9LeRHn2wE/hMLoxu9UKMd4J2YF/7A==
X-Received: by 2002:a05:600c:a44:b0:45b:7f72:340 with SMTP id
 5b1f17b1804b1-45b8557c68cmr69560785e9.25.1756729552446; 
 Mon, 01 Sep 2025 05:25:52 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:25:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 00/16] drm/vkms: Add configfs support
Date: Mon,  1 Sep 2025 14:25:25 +0200
Message-ID: <20250901122541.9983-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

This series allow to configure one or more VKMS instances without having
to reload the driver using configfs.

The process of configuring a VKMS device is documented in "vkms.rst".

In addition, I created a CLI tool to easily control VKMS instances from the
command line: vkmsctl [1].

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12 and 13: New option to skip the default device creation and to-do
    cleanup.

  - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

Finally, the code is thoroughly tested by a collection of IGT tests [2]. The IGT
series is almost fully reviewed (1 patch is missing) and it is waiting on this
series to be merged.

I don't know what is preventing this series to be ACK by a DRM maintainer, but
please, if there is something missing or that needs to be fixed let me know.

I CCed the configfs maintainers in case they can give feedback about the design
of the configfs API or the configfs related code, just in case that is one of
the complicated points to review by DRM maintainers.

Best wishes,
José Expósito

[1] https://github.com/JoseExposito/vkmsctl
[2] https://lore.kernel.org/igt-dev/20250807074550.6543-1-jose.exposito89@gmail.com/

Changes in v6:

  - No code changes, rebased on top of drm-misc-next
  - Added Tested-by: Mark Yacoub, who merged the series into the Android tree (thanks!)
    https://lore.kernel.org/dri-devel/CAC0gqY6ZH8h5aoNh31ck3dP6c3YYtfTRjJ47Obu6xSXSVXm5mA@mail.gmail.com/
  - Added a link in the cover letter the CLI to configure VKMS: vkmsctl
  - CCed more people to try to get the series merged
  - Link to v5: https://lore.kernel.org/dri-devel/20250507135431.53907-1-jose.exposito89@gmail.com/

Changes in v5:

  - No code changes, rebased on top of drm-misc-next
  - Added Reviewed-by tags, thanks Louis!
  - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/

Changes in v4:

  - No code changes, rebased on top of drm-misc-next
  - Since Louis and I worked on this together, set him as the author of some of
    the patches and me as co-developed-by to reflect this joint effort.
  - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/

Changes in v3:

  - Applied review comments by Louis Chauvet: (thanks!!)
    - Use scoped_guard() instead of guard(mutex)(...)
    - Fix a use-after-free error in the connector hot-plug code
  - Rebased on top of drm-misc-next
  - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/

Changes in v2:

  - Applied review comments by Louis Chauvet:
    - Use guard(mutex)(...) instead of lock/unlock
    - Return -EBUSY when trying to modify a enabled device
    - Move the connector hot-plug related patches to the end
  - Rebased on top of drm-misc-next
  - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/

José Expósito (6):
  drm/vkms: Expose device creation and destruction
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list
  drm/vkms: Allow to configure connector status
  drm/vkms: Allow to update the connector status
  drm/vkms: Allow to configure connector status via configfs

Louis Chauvet (10):
  drm/vkms: Add and remove VKMS instances via configfs
  drm/vkms: Allow to configure multiple planes via configfs
  drm/vkms: Allow to configure the plane type via configfs
  drm/vkms: Allow to configure multiple CRTCs via configfs
  drm/vkms: Allow to configure CRTC writeback support via configfs
  drm/vkms: Allow to attach planes and CRTCs via configfs
  drm/vkms: Allow to configure multiple encoders via configfs
  drm/vkms: Allow to attach encoders and CRTCs via configfs
  drm/vkms: Allow to configure multiple connectors via configfs
  drm/vkms: Allow to attach connectors and encoders via configfs

 Documentation/gpu/vkms.rst                    | 100 ++-
 drivers/gpu/drm/vkms/Kconfig                  |   1 +
 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
 drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
 drivers/gpu/drm/vkms/vkms_config.h            |  26 +
 drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
 drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
 12 files changed, 1072 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h


base-commit: 6b53cf48d9339c75fa51927b0a67d8a6751066bd
-- 
2.51.0

