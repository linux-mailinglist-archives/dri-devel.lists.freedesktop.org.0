Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DC548524
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAABB10E522;
	Mon, 13 Jun 2022 12:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34C10E522
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:41 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d18so6034263ljc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWtx4fIImjTx8I7ZPlBLDjf00U3xjXt1lXOyZewZ3Zo=;
 b=K9IldOEelq9dcN8/NS8pYNfLW8/FPiROQEmHAbK11Ry8wGhRv3rRpuq8nomMHKbK8A
 Jxi3e1huJLuXtKwM675U4TOkqyX4QZqCjgDqPajnDC8DWTz+fa5ezsqrGQHFaokSGIZP
 9+i87Psj7P6+wn8gvZfF5T58k/WitC53V79Z2YYJZtfRfzIjjt+U/E2r+GijrOPQvA5z
 5HPfRPoK1VvW9aLIF4/R/UDzDqV8EgMycUlLdeZ+CTgmcokSJmCOTJNsqbA1McRjoSDo
 f7mibOaelwALNrEnN/svINl5x5WNvz4qpWSr0+rup862xKzhGG3peYgK21gSNUWVgT2E
 45+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWtx4fIImjTx8I7ZPlBLDjf00U3xjXt1lXOyZewZ3Zo=;
 b=ti/nbBU8M+n/PiRegycCYX4fVbZJzR233MezyzqfVL9jnPIqMpWq5PQCRr+MKBZ4WB
 lEszs2LxbG4kcxf1F3/4aKUZYLwULXboaqBTW36pnd9cxEShMjYyJCfvKj32EPw0xuLj
 307uWJDFqU8ejVIOdq5A/jVmGwyci8wi98OjPuaBzGeEa/ZxtdHW1Soxzjnr2llOQv3c
 WJ1tuf5m1QdsgxzhfNhBsaGNVmi/A5x8NhbsBHLbiMG+ZIoFisNRbUofpGKxPyy2I48I
 aXAfAu7RY5sHJv3wtaDqy1ZV2CqFbFxxXDhf0ZDB9+8YyUQ39Q7r31cNdJcssOynzHjH
 qxBg==
X-Gm-Message-State: AOAM531gtEZt+3+N3jO+y80R2DlYuCLLED6L4aB6oimzuzVgA1j01VVR
 T2yjNTI0h9KWXp2YV/KtOaWxtXXEssI=
X-Google-Smtp-Source: ABdhPJxjObch6Lr7n9PpEVPN2XTNrjhqQf1O5GPDnHhzYGYhTKZBqun6Wub/HLQaRuTJTBf0BsSSUw==
X-Received: by 2002:a2e:9213:0:b0:258:fe1c:f1a with SMTP id
 k19-20020a2e9213000000b00258fe1c0f1amr4610778ljg.490.1655123678761; 
 Mon, 13 Jun 2022 05:34:38 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:38 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/19] drm/gma500: Unify most of the lvds code
Date: Mon, 13 Jun 2022 14:34:17 +0200
Message-Id: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Much of the lvds code for Poulsbo, Oaktrail and Cedarview are almost
identical so there is no need to keep three copies of it. Unify as much
as possible into one implementation. There are still things like the
init code that can be unified but that requires unifying other parts of
the driver first.

Patrik Jakobsson (19):
  drm/gma500: Unify *_lvds_get_max_backlight()
  drm/gma500: Unify *_lvds_set_backlight()
  drm/gma500: Unify *_lvds_set_power()
  drm/gma500: Unify *_lvds_mode_valid()
  drm/gma500: Unify *_lvds_encoder_dpms()
  drm/gma500: Unify *_intel_lvds_save()
  drm/gma500: Unify struct *_intel_lvds_priv
  drm/gma500: Unify *_intel_lvds_restore()
  drm/gma500: Unify *_intel_lvds_mode_fixup()
  drm/gma500: Unify *_intel_lvds_prepare()
  drm/gma500: Unify *_intel_lvds_commit()
  drm/gma500: Unify *_intel_lvds_mode_set()
  drm/gma500: Unify struct *_intel_lvds_helper_funcs
  drm/gma500: Unify *_intel_lvds_get_modes()
  drm/gma500: Unify struct *_intel_lvds_connector_helper_funcs
  drm/gma500: Use i2c_bus in gma_encoder for PSB
  drm/gma500: Unify *_intel_lvds_destroy()
  drm/gma500: Unify *_intel_lvds_set_property()
  drm/gma500: Unify struct *_intel_lvds_connector_funcs

 drivers/gpu/drm/gma500/Makefile         |   1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 390 +-----------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 462 +++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  38 ++
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 112 +-----
 drivers/gpu/drm/gma500/psb_drv.h        |   1 -
 drivers/gpu/drm/gma500/psb_intel_drv.h  |   2 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 507 +-----------------------
 8 files changed, 530 insertions(+), 983 deletions(-)
 create mode 100644 drivers/gpu/drm/gma500/gma_lvds.c
 create mode 100644 drivers/gpu/drm/gma500/gma_lvds.h

-- 
2.36.1

