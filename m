Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0F65D3A9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13510E109;
	Wed,  4 Jan 2023 13:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FCE10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:03:16 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C05D76602D0B;
 Wed,  4 Jan 2023 13:03:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672837395;
 bh=ffgpNYuADm/toveb2OX6/0yHi/EnNAdV4kCDw5uHltU=;
 h=From:To:Cc:Subject:Date:From;
 b=gvYZ1R9gryRtolYOGZdH3gJuQ1FlDXJalqryirgAym24ochQSByQNq/gGFS7MCis8
 gcqw91+kxxjHn0/GrW8sTF11kdwRydzW4xVWFL/bjKaCujVQfzEfblonXJxDR7BMJo
 2W6FF8EH+gg/vMLVfhpHDON/rfeLdKTA+x3ULb7SydnRu4xq8xFegeMIPajltaLPZO
 As3hJEghpixKTFiRL9+/YDocKkcmDtVCnK/IO4m431WziTfkJxHamFyKQPO8zUe+0b
 /9AX51dA1Vyhs6+f0zJWxp1K+DuI00jiJtR1dWUQJpIOk7I8qSVZ23KubDmY13aZIW
 elLCnjsTYo50A==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RFC 0/4] drm/panfrost: Expose memory usage stats through fdinfo
Date: Wed,  4 Jan 2023 14:03:04 +0100
Message-Id: <20230104130308.3467806-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Here's an attempt at exposing some memory usage stats through fdinfo,
which recently proved useful in debugging a memory leak. Not entirely
sure the name I chose are accurate, so feel free to propose
alternatives, and let me know if you see any other mem-related stuff
that would be interesting to expose.

Regards,

Boris

Boris Brezillon (4):
  drm/panfrost: Provide a dummy show_fdinfo() implementation
  drm/panfrost: Track BO resident size
  drm/panfrost: Add a helper to retrieve MMU context stats
  drm/panfrost: Expose some memory related stats through fdinfo

 drivers/gpu/drm/panfrost/panfrost_drv.c       | 24 ++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |  7 +++++
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c       | 27 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_mmu.h       | 10 +++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.38.1

