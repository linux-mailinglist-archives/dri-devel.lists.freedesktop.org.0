Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BAE60EBCF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 00:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24EA10E5AB;
	Wed, 26 Oct 2022 22:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95910E5AB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 22:47:22 +0000 (UTC)
Received: from dimapc.. (109-252-112-196.nat.spd-mgts.ru [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 83AC766025FA;
 Wed, 26 Oct 2022 23:47:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666824440;
 bh=uz0L9V/MufGQfPQFvGuBTw01sGpXsDlYGwsQzODExM4=;
 h=From:To:Cc:Subject:Date:From;
 b=dwpZi68zeMshEPYyX1trG3cZXPZISoztx6rQP8i8XauKBPRc25VG8T5418gG6SAKH
 FmDbd9+KkcM2gfqZQHuzjOUbgfd6N1iHXHdM9HxgLAb46oCoqdWZf6B1z8LKfe7YMd
 tkIoG/tfprrlkNOJUiCbZu4NdSAwG1+yfVYIVX5khzWPqF6a1pbk3NKodlIri/nS0K
 SZErMHh3ihpgO0OiPIH2r0ILp4PxsmdFDqk7kpszBYu+D4aZ+GDigDJvVZqbgQiHOj
 xOXasHa4fFtJ1d3t+JdMTyvDTvN2pY0WrIji4HsFm7zmC0cysrfbs89kaSQUkWO0im
 Z34Na5XVxVhUQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 noralf@tronnes.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v1 0/2] Fixes for dma-buf locking issues found by Smatch
Date: Thu, 27 Oct 2022 01:46:38 +0300
Message-Id: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Here are the two patches fixing minor problems introduced by my
"dma-buf locking convention" series. Thanks to Dan Carpenter who
checked linux-next with Smatch and reported the found issues!

Please review/ack, I'll apply the patches to misc-next afterwards.

Thanks!

Dmitry Osipenko (2):
  dma-buf: Make locking consistent in dma_buf_detach()
  drm/gem: Check whether object is NULL in drm_gem_vunmap()

 drivers/dma-buf/dma-buf.c | 3 ++-
 drivers/gpu/drm/drm_gem.c | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.37.3

