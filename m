Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FFD7F8F4F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 21:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC84110E047;
	Sat, 25 Nov 2023 20:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ED010E046
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 20:55:41 +0000 (UTC)
Received: from sobremesa.fritz.box (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 54CB86602F2E;
 Sat, 25 Nov 2023 20:55:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700945740;
 bh=d0hv3YyRAgqiF4M37fzP8Ro2Ds0NYvFuhF+NO43K8yo=;
 h=From:To:Cc:Subject:Date:From;
 b=PYFXWcqlaFIhqfWxjCWnAqrGxvf9qhGqJWkGGEQX4Td2rhjSPojxrreqGZZFi0tLI
 RbctpvuWVUwxujJ9HgRCI3NXBZ0qyJ69ESSr2SDrIZ/iQ2qhwRZ4x9mT+2q6PtIpV2
 rdIWgNIs0HqP58e25YPkRPssTz+Qw6isU7+3unEj10slEORnM+CZKg4vv4u34/fNJo
 E+1ZRaGoldtufBXk7aajVMx97naRox+rocY9BHcfpX4nj0Lk5mt3B0N3/dSHhx/bF1
 3IDz8TI3LR7PH2YvOAr6BVJQAXkQP74AsZyxERyreRQIh9dYzLs7YrBTezVAYPrFgj
 6YzksXs6X56EQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] Panfrost devfreq and GEM status fixes
Date: Sat, 25 Nov 2023 20:52:01 +0000
Message-ID: <20231125205438.375407-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During recent development of the Mali CSF GPU Panthor driver, a user
noticed that GPU frequency values as reported by fdinfo were
incorrect. This was traced back to incorrect handling of frequency value
updates. The same problem was seen in Panfrost.

Also one should consider GEM objects from a dma-buf import as being
resident in system memory, so that this can be reflected on fdinfo.

Adrián Larumbe (2):
  drm/panfrost: Consider dma-buf imported objects as resident
  drm/panfrost: Fix incorrect updating of current device frequency

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)


base-commit: 38f922a563aac3148ac73e73689805917f034cb5
-- 
2.42.0

