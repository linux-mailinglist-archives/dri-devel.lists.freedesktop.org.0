Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31B590252
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A610F164;
	Thu, 11 Aug 2022 16:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225A82A2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:08:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8FBEB821AD;
 Thu, 11 Aug 2022 16:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4A9C433C1;
 Thu, 11 Aug 2022 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234109;
 bh=45+YsP0xL7+ZOaRuNdItW2YXHQez1xUpc1k9kr6omPM=;
 h=From:To:Cc:Subject:Date:From;
 b=O3wmqHEbzZ2QwvMmXXyA1SDqkhoNZ+ocjNkkPs5bNwoH5GLxuBe7AeYG+Sz3bZqsf
 9e+QxyR5gwbZk/hx1NwAPUXugUW15s3UdzkaMP70vmROx79lDv8Y6y+9aipv/kS3sc
 Ee1jb+jmPpF1y+jEyPYo9uEjAqib87yRhAPl9H6R2oeZm9IkUewrUiZcbEqDckQwEd
 1+dO8D8P7PctXGyBDy3ygDuEZOjZwv0ipkPwt88+kbzBhSVPZeiFGylQ4way/QQXy3
 zqHNzYVmSxYDHc3fncCq7dMPtFlfIFdL16FkwCEywolhbVkth/YsqYontJE8Siw+P8
 BPwIowxssd1Kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/25] drm/r128: Fix undefined behavior due to
 shift overflowing the constant
Date: Thu, 11 Aug 2022 12:07:56 -0400
Message-Id: <20220811160826.1541971-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Borislav Petkov <bp@suse.de>

[ Upstream commit 6556551f8848f98eff356c8aacae42c8dd65b2df ]

Fix:

  drivers/gpu/drm/r128/r128_cce.c: In function ‘r128_do_init_cce’:
  drivers/gpu/drm/r128/r128_cce.c:417:2: error: case label does not reduce to an integer constant
    case R128_PM4_64BM_64VCBM_64INDBM:
    ^~~~
  drivers/gpu/drm/r128/r128_cce.c:418:2: error: case label does not reduce to an integer constant
    case R128_PM4_64PIO_64VCPIO_64INDPIO:
    ^~~~

See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
details as to why it triggers with older gccs only.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20220405151517.29753-5-bp@alien8.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/r128/r128_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/r128/r128_drv.h
index ba8c30ed91d1..9a9f2279408b 100644
--- a/drivers/gpu/drm/r128/r128_drv.h
+++ b/drivers/gpu/drm/r128/r128_drv.h
@@ -299,8 +299,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
 #	define R128_PM4_64PIO_128INDBM		(5  << 28)
 #	define R128_PM4_64BM_128INDBM		(6  << 28)
 #	define R128_PM4_64PIO_64VCBM_64INDBM	(7  << 28)
-#	define R128_PM4_64BM_64VCBM_64INDBM	(8  << 28)
-#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15 << 28)
+#	define R128_PM4_64BM_64VCBM_64INDBM	(8U  << 28)
+#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15U << 28)
 #	define R128_PM4_BUFFER_CNTL_NOUPDATE	(1  << 27)
 
 #define R128_PM4_BUFFER_WM_CNTL		0x0708
-- 
2.35.1

