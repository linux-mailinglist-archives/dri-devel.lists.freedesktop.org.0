Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5B554D7D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187B1133B7;
	Wed, 22 Jun 2022 14:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321691133B7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:36:33 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A976166016E1;
 Wed, 22 Jun 2022 15:36:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655908591;
 bh=e1jHV1jFBK1kFZPrPZ8Mx6UExJgGovqplBxOxQSUtJA=;
 h=From:To:Cc:Subject:Date:From;
 b=PoMRHR5HH4njc3SLEk00lt+4C/BIT73s5YUZLtVUdmcnakixnVBCbWXHrJnS3d46X
 +QJ1rORFyke55IyNA4ASiEuDDzVM3UxoBvDtJh/xiVbobq+Ja0qwXck1KgrXf3E4EH
 d3GhIfZTxuWGluc7fd9VLLvQpsOqIFGf9eQ8ILQP+NJrPF8ZcKn5b9MQ0DTSLba3io
 TiQqJOOK+rW35TDgsCGFdvh0msQnhOHfrnNX3lN/a1FnbiK9zFo4JsRwe3xjcu75tn
 mI59KHl7qjNL7l3qyrVz8MQxkYRRQS0N1073hBEsQwmFyKbSURPfJcLvpcvEjgSIvz
 BEeT7IKh2U5Qg==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] devcoredump support for Panfrost GPU driver
Date: Wed, 22 Jun 2022 15:36:14 +0100
Message-Id: <20220622143616.1265405-1-adrian.larumbe@collabora.com>
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

This is v4 for a previous patch series being discussed at:

https://lore.kernel.org/dri-devel/20220622015420.1130814-1-adrian.larumbe@collabora.com/T/#t

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Changes with respect to v3 of the same patch:

 - Remove useless no-op when checking job slot index
 - Actually use JS_SLOT_STRIDE when selecting the right js register.
 - Explain the reason certain GFP flags are picked when allocating memory
 for the coredump file.
 - Move new JS and MMU_AS register offset macros into its own commit.

Adrián Larumbe (2):
  drm/panfrost: Add specific register offset macros for JS and MMU AS
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 249 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  39 ++--
 include/uapi/drm/panfrost_drm.h          |  47 +++++
 7 files changed, 335 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.36.1

