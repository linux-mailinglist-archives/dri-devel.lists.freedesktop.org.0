Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F066B151BE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380E10E05C;
	Tue, 29 Jul 2025 16:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JSOZNZp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3FB10E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753808229;
 bh=mEPXsYWPYpYLEFgdiQIe331mwN5OSQSvwTcIc8AtpmI=;
 h=From:To:Cc:Subject:Date:From;
 b=JSOZNZp/Za9X60IOYEVzMbN6ayE7ubw5QfXOX6v6soFqLZj/b0LoJKhJW3XngL/fx
 IYwdYU9qLyZLiEDmiRcIG+ffgAvqQ/7aa79HvKAHLxwHypLE8l2jx+vXIL+kHuWM3A
 Df1cy05CSGMNfEl45XuTXi9xFXaUuUWTJgc+5zxy2YacNLS93rIBdespNJc+lx0609
 POU6n259Bry4L7YMx7E+7sI/WrlDEQeJvkTQyL7XmXynt+k25P08wKmiRkSYQJs2Gj
 LTXQzzAA0Cs/vzO1ixU1rGMO06SmFdTk4hZe7UNviwSZz7OSw2Za1/8H1hjdCmRNfE
 tUULrWLeDt9rQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e802:5400:c944:7b00:6281:94b5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 72AA917E14DD;
 Tue, 29 Jul 2025 18:57:09 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, marius.vlad@collabora.com
Subject: [PATCH v2 0/2] Pass down hot plug CONNECTOR ID to user-space
Date: Tue, 29 Jul 2025 19:57:06 +0300
Message-ID: <20250729165708.9947-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch series addresses a shortcoming where we're sending a hot plug event
without passing the actual CONNECTOR that caused it. This takes into
consideration both the polling path and the HPD (Hot Plug Detect) path.

v2: Address comments from Daniel

- split patch into 2, one that introduces a bool to track connector
  connection status change and a patch that uses that to be able to send
  hot plug events with the proper CONNECTOR ID to udev and further pass
  that down to user-space
- nuke out mutex when iterating connector list
- fix typo

v1 is at https://lore.kernel.org/dri-devel/20250627131751.2004-1-marius.vlad@collabora.com/T/#m9e35be35b70dc0d799dd950ce3cb4ef9c910e9c5

Marius Vlad (2):
  drm: Introduce a new connector status
  drm: Propagate connector status change

 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 34 +++++++++++++++++++++++++-----
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 include/drm/drm_connector.h        |  3 +++
 4 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.47.2

