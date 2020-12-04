Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5532CE9CC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310596EC6C;
	Fri,  4 Dec 2020 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594FC6E122
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 03:53:30 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j23so4421426iog.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 19:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K46J11OuhAH7Ds8aixOF5TU2H/Kjo5yHrmhtSRIp5TU=;
 b=p0BGihhBa64eNmopWOvTN7ox4Ck1IVh2mFJsyp8lB1U1vZ4WdGaz6rcUpopFT9JLez
 lYhANwAM+c66g9Os6Cr5SgXWXP9UnsvFd6O7lUKg8StYJIlPich5Qz3v2g6282sAdku/
 C4KFE4YmHYNbEsaNqBCVjXPjlSbvJdTZu4dOA/5NFURw7FQbFKQDOs8mmOBkjLRx4idR
 3zRSJQHHYpoEMaNBZZTTf38+3UHaDw98w4B98ISA0HVkpwOMR5WTXcbT9hnvyRXuM64O
 GsKpcvx+jzU1rq72oOM/OLH1+HKehCkAnXDDjYmlNKLq/CU9/si8uSIBmYBokBNmNN1t
 1kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K46J11OuhAH7Ds8aixOF5TU2H/Kjo5yHrmhtSRIp5TU=;
 b=Xh1N6blJmSW/O6hPsFSJe1iK2aGXNMrvt+hMsVZqgc8BTEAeHaQaOe55VOEh+aAkK2
 7HVrGO4eYfNFVotag2Kh7OU9oX0U4gJzxdrQ8VGYka7+s1ngl+yj5Me03Nc6CbwYyChW
 dyBu8drRwXLv+dTWpcbGLl5cpVZClwsywNxTLi73cCwumOV73u9T3Xw4FJ8Tmv5+Bwbs
 Rsdk+1RxWYmRlJHBa2S11C0FYHWH4ibMw7eq1j6JZtJ2dPBLi4wlzbWWHMscER+knR9G
 Xj1AXmkl38nahaOO01o4VyTCGbqTzH6w6D3/xe3dFPGJ/O22Ge8/JXXp6L7MphJFQOoh
 q/pg==
X-Gm-Message-State: AOAM530viIUF2YbAOztCJKArhAihyiNWQUMQNHfB5WWlVkSTr0oA+9ee
 M2WHNMMKbN21C1+gn4MzDhHWJ0p86YQ=
X-Google-Smtp-Source: ABdhPJykXXanjpHBCbmyiGm2JEVaEU8jlsqOBpQAQQyq/B36FBcHwgS+ru3hhjyd2ymyz6ZR5GUysQ==
X-Received: by 2002:a02:ccca:: with SMTP id k10mr3490531jaq.100.1607054009282; 
 Thu, 03 Dec 2020 19:53:29 -0800 (PST)
Received: from frodo.mearth (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id o12sm671361ilj.55.2020.12.03.19.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 19:53:28 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] drm: use dynamic_debug
Date: Thu,  3 Dec 2020 20:53:16 -0700
Message-Id: <20201204035318.332419-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hello gentle readers,

These 2 rfc patches convert part of drm-world to use dynamic debug.

1st one addresses drm.debug category based logging.  If DYNAMIC_DEBUG
is configured, then CONFIG_DRM_USE_DYNAMIC_DEBUG controls whether
dynamic-debug is used to avoid runtime costs of drm_debug_enabled().
We require CONFIG_JUMP_LABEL too, since we are selling its
optimization.

This change adds many new callsites to /proc/dynamic_debug/control;
~300 in drm, ~200 in drm_kms_helper, as well as ~1500 in i915 driver,
and ~3200 in amdgpu.  So there are substantial implications here.

2nd one is for i915, which I have in my laptop.  `grep pr_debug` found
~90 callsites with a meaningful format-prefix-string, to demonstrate
use of "format ^prefix" to control user categorized debugs.

Jim Cromie (2):
  drm: RFC add choice to use dynamic debug in drm-debug
  i915: POC use dynamic_debug_exec_queries to control pr_debugs in gvt

 drivers/gpu/drm/Kconfig            | 13 +++++
 drivers/gpu/drm/drm_print.c        | 75 ++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/Makefile  |  1 +
 drivers/gpu/drm/i915/i915_params.c | 74 ++++++++++++++++++++++++
 include/drm/drm_print.h            | 92 ++++++++++++++++++++++--------
 5 files changed, 228 insertions(+), 27 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
