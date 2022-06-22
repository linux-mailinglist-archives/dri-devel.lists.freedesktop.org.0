Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B12554046
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFBA113374;
	Wed, 22 Jun 2022 01:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C050113374
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 01:54:31 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A52CE6601692;
 Wed, 22 Jun 2022 02:54:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655862869;
 bh=jEAhRg5QOALmC/XxLaViTEPh8bKe3wZldI0b23bVh7Y=;
 h=From:To:Cc:Subject:Date:From;
 b=cMarKs416jyLRn+ZTDYeZ3EGQMZlQl1J6bjARLhSfDWNdkkaoXtVI4vv5XxOfWgUD
 Kp4GdbhbIdUgTqXIP2BI6/OlCisLFrKcj/Ah4yvwy2pX/jISQTrUiR1aVW3mOv48sx
 H1P9u02RjfIsGYtoUvcp2IMEgWwmcTyml/+wuNrHKBEmzKI5C8dFYEkonl7CrfG73z
 rkoBDUY53yuIK6cWnx0MC/prC28PrSrbctODzDK+YSlf62yb0tB0rEt2PznNiLPlVT
 Bq4IHaRZdsDmXmWpJlYBq3VvxAvzMv+5f46V/0xjYPixpKwXDwG0ERUHec71RTu2Hy
 FdFWXgIW0NtKg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/1] devcoredump support for Panfrost GPU driver
Date: Wed, 22 Jun 2022 02:54:19 +0100
Message-Id: <20220622015420.1130814-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.36.1
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v3 for a previous patch series being discussed at:

https://lore.kernel.org/dri-devel/20220621023204.94179-1-adrian.larumbe@collabora.com/T/#t

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Changes with respect to v2 of the same patch:

 - Added JS and MMU offset macros for selecting the right register in the dump rather
 than using magic numbers.
 - Added sanity check to make sure Panfrost's page size is the same as the CPU's
 - Added major and minor dump header version numbers

Adrián Larumbe (1):
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 243 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  39 ++--
 include/uapi/drm/panfrost_drm.h          |  47 +++++
 7 files changed, 329 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.36.1

