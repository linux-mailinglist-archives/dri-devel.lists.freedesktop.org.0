Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D08839FCD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B8F10F5C3;
	Wed, 24 Jan 2024 03:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7A10F5AE;
 Wed, 24 Jan 2024 03:01:10 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40e800461baso59670575e9.3; 
 Tue, 23 Jan 2024 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065208; x=1706670008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1360rsVcUfkyEFKvnwoRZUEjTgSXHZgyaxAgVpcjy0=;
 b=VgyeVd8Fs9PLTjVTLSckGZJoM9Cb4IWrM+1M0jENwvhqWq+mxf73zvcU/mi9J3ylRN
 ZTPyF2QIhQYkEBc3VAX3AtJjwJk30SDH+Q8R2ceiR4/VTnLLj1+HwLwAyrfgd8vvmW4m
 fQDL9Ww5DcawEq7hwTeot3cDxbqx7JXpOih7jI2k5JEDDFH1hwRrIXmQ69WR75PBqxQG
 H0Kc42GyWpqpaCA15kntXfkbzINZYsC/u4uJAhkt6b7B/wYsg7PGqdKDJgF7629Wu04N
 6ZvHiokCKbC1JkZvb9dRXOwO8bzrXTYm449e83ROP0vi/iCP/aEWqMSP9l3mg/BypTZm
 5Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065208; x=1706670008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1360rsVcUfkyEFKvnwoRZUEjTgSXHZgyaxAgVpcjy0=;
 b=HTRdX1uu4cpPtj0tNcGddy84Cmmhsbc3sbWCkv+tyz7hk/WlZ2dKsOn9lL8vJUjsc4
 kocxjxGH94khIWzns9k71H0Jf5IDZdW5rmz6i42gZq9QhJypf9HaAT9hm2Ha1p0tglUb
 EuoBluYijtdA7BQFNRUbuvxOJ6oMvPy0SLaWjXR7cFJuPhr4N8IuR3YFKf7WI/ZBGtLL
 Vipg2b4RFC/q01+L93VnCJN5TraYAN26rP+zApyWVXI1Ii7FV9zlfqgbEO889ttnsLwm
 TcsYYL+V+7qbkfIHcHaiIf+9wbsVN/6tdYisv9YfWm6CrJ9SkGo+uhl/gAqMgXoQwxo9
 kqzQ==
X-Gm-Message-State: AOJu0Yxxl7SuDnWHuNDa1nsj8xdRLopMrrAoTen4ED4edK42mAiRtRog
 5Sdf90x/eDo3A2OyxquUnlXSqvghdEtGyQQo2992QQgMn+s07XAq
X-Google-Smtp-Source: AGHT+IFNvK8jVLAW43M53dxq/xZnF+II50JMUfdmJD7TTTDRnFU0EbdDhlFtmzEGVNhr51i6+nNWzg==
X-Received: by 2002:a7b:c350:0:b0:40e:88b1:95be with SMTP id
 l16-20020a7bc350000000b0040e88b195bemr603402wmj.304.1706065208438; 
 Tue, 23 Jan 2024 19:00:08 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:07 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/lima: fixes and improvements to error recovery
Date: Wed, 24 Jan 2024 03:59:39 +0100
Message-ID: <20240124025947.2110659-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1 reference:
https://patchwork.kernel.org/project/dri-devel/cover/20240117031212.1104034-1-nunes.erico@gmail.com/

Changes v1 -> v2:
- Dropped patch 1 which aimed to fix
https://gitlab.freedesktop.org/mesa/mesa/-/issues/8415 .
That will require more testing and an actual fix to the irq/timeout
handler race. It can be solved separately so I am deferring it to a
followup patch and keeping that issue open.

- Added patches 2 and 4 to cover "reset time out" and bus stop bit to
hard reset in gp as well.

- Added handling of all processors in synchronize_irq in patch 5 to
cover multiple pp. Dropped unnecessary duplicate fence in patch 5.

- Added patch 7 in v2. After some discussion in patch 4 (v1), it seems
to be reasonable to bump our timeout value so that we further decrease
the chance of users actually hitting any of these timeouts by default.

- Reworked patch 8 in v2. Since I broadened the work to not only focus
in pp anymore, I also included the change to the other blocks as well.

- Collected some reviews and acks in unmodified patches.


Erico Nunes (8):
  drm/lima: reset async_reset on pp hard reset
  drm/lima: reset async_reset on gp hard reset
  drm/lima: set pp bus_stop bit before hard reset
  drm/lima: set gp bus_stop bit before hard reset
  drm/lima: handle spurious timeouts due to high irq latency
  drm/lima: remove guilty drm_sched context handling
  drm/lima: increase default job timeout to 10s
  drm/lima: standardize debug messages by ip name

 drivers/gpu/drm/lima/lima_ctx.c      |  2 +-
 drivers/gpu/drm/lima/lima_ctx.h      |  1 -
 drivers/gpu/drm/lima/lima_gp.c       | 39 +++++++++++++++++++++-------
 drivers/gpu/drm/lima/lima_l2_cache.c |  6 +++--
 drivers/gpu/drm/lima/lima_mmu.c      | 18 ++++++-------
 drivers/gpu/drm/lima/lima_pmu.c      |  3 ++-
 drivers/gpu/drm/lima/lima_pp.c       | 37 ++++++++++++++++++++------
 drivers/gpu/drm/lima/lima_sched.c    | 38 ++++++++++++++++++++++-----
 drivers/gpu/drm/lima/lima_sched.h    |  3 +--
 9 files changed, 107 insertions(+), 40 deletions(-)

-- 
2.43.0

