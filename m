Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E1A4ACCC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 17:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89510E08D;
	Sat,  1 Mar 2025 16:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ICWxcXXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id C819310E08D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 16:16:44 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id DDEF72038A3D;
 Sat,  1 Mar 2025 08:16:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DDEF72038A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740845798;
 bh=sf8ttahzm+9GqpA9ajwAW7LpDIvZye2F3bcdngIic6g=;
 h=From:To:Cc:Subject:Date:From;
 b=ICWxcXXJHGq8jS1KvB/OX7qhnCv1s6h85Cg++CKY/Nfvxjd/argKjPyfUOOyAfjWV
 +bjOb4nAYp1ddkFX5onJexMY8Z7zo7446B8VRRTIOJRTlfUQs8+R8swk7cvOlD0iUV
 cSPcuUziRh8GrmqWq+FfT764yzlqkfrAdcFpdxXA=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, deller@gmx.de, akpm@linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: ssengar@microsoft.com,
	mhklinux@outlook.com
Subject: [PATCH v3 0/2] fbdev: hyperv_fb: framebuffer release cleanup
Date: Sat,  1 Mar 2025 08:16:29 -0800
Message-Id: <1740845791-19977-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

This patch series addresses an issue in the unbind path of the hyperv_fb
driver, which is resolved in the second patch of this series.

While working on this fix, it was observed that hvfb_putmem() and its
child functions could be cleaned up first to simplify the movement of
hvfb_putmem(). This cleanup is done in the first patch.

Although hvfb_getmem() could also be cleaned up, it depends on
vmbus_allocate_mmio(), which is used by multiple other drivers. Since
addressing hvfb_getmem() is independent of this fix, it will be handled
in a separate patch series.

[V3]
 - Add a patch 1 for cleanup of hvfb_putmem()
 - Use the simplified hvfb_putmem()

Saurabh Sengar (2):
  fbdev: hyperv_fb: Simplify hvfb_putmem
  fbdev: hyperv_fb: Allow graceful removal of framebuffer

 drivers/video/fbdev/hyperv_fb.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

-- 
2.43.0

