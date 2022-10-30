Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E332B612B4B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 16:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496E10E0FC;
	Sun, 30 Oct 2022 15:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18B10E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 15:44:50 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 007AA6601639;
 Sun, 30 Oct 2022 15:44:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667144689;
 bh=PBCW1pQYZlulS+wkcdlxXBG/yfECQX+mmoneFqYHeMc=;
 h=From:To:Cc:Subject:Date:From;
 b=KO/aESh02ORnQ42eMXxzJ5iTOy+T7I0QoN2WW71yk2KrvzJmauqcX+laILuetlsTq
 6xGve78DarOd2CW6TbZQLpfpbB1qluBlOU5efCRwOK82ksWmf+0WM+XT5g9CqcK9b7
 49uHQ/s6ghJGOXEazU7RFcCg893+Lx0OLVqgnU6PnXW1tLcMYYDBN7jecVpknpKOtU
 0jZB09ZdvKnKRxWVUvHXtQw1YFkkyaFf5Sak1ob3ie8MRnm2bZmsDvkOCIO8szSH4H
 CbOgtXPQz7q0aUD9AgiceotOH02FnVVtwvH+i3RmaPinm7MDj6p+BXkUtPUL+KASJ0
 aR1J1LciYfYSQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 noralf@tronnes.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 0/2] Fixes for dma-buf locking issues found by Smatch
Date: Sun, 30 Oct 2022 18:44:10 +0300
Message-Id: <20221030154412.8320-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Here are the two patches fixing minor problems introduced by my
"dma-buf locking convention" series. Thanks to Dan Carpenter who
checked linux-next with Smatch and reported the found issues.

Changelog:

v2: - Added ack from Christian König to the dma-buf patch and improved
      the dma-buf/attachment pointer check.

    - Dropped v1 patch that added GEM NULL-checking to
      drm_gem_vunmap_unlocked() and replaced it with the NULL-checking
      in drm_client_buffer_delete(), like was suggested by Christian König.

Dmitry Osipenko (2):
  dma-buf: Make locking consistent in dma_buf_detach()
  drm/client: Prevent NULL dereference in drm_client_buffer_delete()

 drivers/dma-buf/dma-buf.c    | 4 ++--
 drivers/gpu/drm/drm_client.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.37.3

