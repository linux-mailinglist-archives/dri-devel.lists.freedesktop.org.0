Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701D552960
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 04:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E60010FEDC;
	Tue, 21 Jun 2022 02:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD1710FED0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 02:32:14 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6985366016CE;
 Tue, 21 Jun 2022 03:32:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655778733;
 bh=uRHScXUsUEGIyIRLNUL2rOwRFYAZIDE6YVCG+QmKFu8=;
 h=From:To:Cc:Subject:Date:From;
 b=n9zGJt5H8B3612BPqDkGsD81+TvjxZI1z8e6iALHqSh3d6+WEWU7Cl8+GLq2hx05Q
 B/1l/TCG21W14lu6I4YQHCrGzwa1UHc7Lf9xDnzBzPpxKNxJWNOCcrRnz7xISAcC2S
 ZrDBBm/a8uF0zNp8WsVB6T4iM5RHoUWE+IB52Xn5ueT7NnEDMJP7FFS0FV3Ju5A6fL
 vzUbjgPpxuYPW/ROQlMMxEzwFCzry+F/UemQqNcAT+WQkBkAV8npfoxWFRNl1PD2es
 bnqNaVzQ0P4XZAVvCo1i61EsOW9Z6p4txG2+wKnkNqk3OnitHfbm0OE0TcrxQoS5LB
 zeu1rFZQiUGTQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/1] devcoredump support for Panfrost GPU driver
Date: Tue, 21 Jun 2022 03:32:03 +0100
Message-Id: <20220621023204.94179-1-adrian.larumbe@collabora.com>
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

This is v2 for a previous patch series being discussed at
https://lore.kernel.org/dri-devel/20220517174216.381287-1-adrian.larumbe@collabora.com/.

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Changes with respect to v1 of the same patch:

 - Change the list of dumped registers to those of greatest debugging value.
 - Fix bug where an invalid bomap header wouldn't be dumped
 - Changed the way that a decision is made whether to dump a BOMAP header so
 that no compiler warning supression has to be done.
 - Changed magic number for header fields to something more representative.
 - Changed the dump header format to a union whose members are the different
   header types.

Adrián Larumbe (1):
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 233 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 include/uapi/drm/panfrost_drm.h          |  44 +++++
 6 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.36.1

