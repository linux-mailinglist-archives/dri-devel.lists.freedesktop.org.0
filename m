Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C815851C8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 16:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A3210ECC6;
	Fri, 29 Jul 2022 14:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3869310ECC6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 14:46:19 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 938F66601B6D;
 Fri, 29 Jul 2022 15:46:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659105977;
 bh=x7gci0enu03Z3g06HixX5JmjjcHMZ89b0mMfv+ZQUqY=;
 h=From:To:Cc:Subject:Date:From;
 b=awt4REHECQz7BTLF92SaUi2t3rqlOAXhq/x/h7psT6i0hGQEI+4mGGB5Ri+i+CuQW
 1MN95XF8rhmvD3t8X4afpgGVo6IL07Nzph9NiPd+/t9aiUh9I1ymFZl0jl2/2muin+
 tCqMk4eBnT+slPYWD5aLzwHTR3R9+Jbk86BO8vFBYVTNRUIDghedYYFw3igexy0SBo
 pyTKZIghrAaWyxGwbCyIs2I7lo+yrg2SLEcymn61eHwpOjp1YC3wKcqH03CWwqWKh0
 DUiWjFcfWTBwfzLAlp7RVdzPTdXWZA47UYopTMIh49m/0LGUMDoBw91NLxeY3IyKjm
 WCxfV8rIXsDhw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/2] devcoredump support for Panfrost GPU driver
Date: Fri, 29 Jul 2022 15:46:08 +0100
Message-Id: <20220729144610.2105223-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
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

This is v6 for a previous patch series being discussed at:

https://lore.kernel.org/dri-devel/20220718172418.584231-1-adrian.larumbe@collabora.com/j

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Changes with respect to v5 of the same patch:

 - Expressed MMU_AS_STRIDE as a bitshift to avoid yet another magic number and
   removed misleading comment on the same line.

Adrián Larumbe (2):
  drm/panfrost: Add specific register offset macros for JS and MMU AS
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 249 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 drivers/gpu/drm/panfrost/panfrost_regs.h |  42 ++--
 include/uapi/drm/panfrost_drm.h          |  47 +++++
 7 files changed, 338 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.37.0

