Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58E59026D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7414B3BF;
	Thu, 11 Aug 2022 16:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728E08BBC6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:09:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B84886141B;
 Thu, 11 Aug 2022 16:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F111C433D6;
 Thu, 11 Aug 2022 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234191;
 bh=IIslqguGBnJAcYACMSP4X8jA/8fGBDS0WfT7u88uSJo=;
 h=From:To:Cc:Subject:Date:From;
 b=YsX75p0fUN0I5QBbn6hG9qqzrnP853brpupDaw+MyjrExWlE/5lpvfzGGv7e4x6oC
 tLM6Yi9xQhfwCUXti5Vd7WljrvqnwpDaPLGoWHp8dMIUSOIdh0VtIarurGLHuxCoLz
 SPDFj04Rd9WK8wX3nUrZs7ZvDrL88IeY0d9Wn5AIJ0GS5+odXbmSmAMGoV5SZ+3Atc
 DYkIkdMKfyjefITKsYv/Sn5njwsAwbLrE6VdmEbSAkb++F+tMeJD7AzcOpetFCm3UX
 4XaKjCeU5BHeXKzVf9MvL2fYQf+2k/ydyQPixlSNxP1ex3qGHwdJMWBijrU7icORTN
 eOvpxiDQZ3L1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 01/14] drm/r128: Fix undefined behavior due to
 shift overflowing the constant
Date: Thu, 11 Aug 2022 12:09:29 -0400
Message-Id: <20220811160948.1542842-1-sashal@kernel.org>
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
index 2de40d276116..1d5dcd151618 100644
--- a/drivers/gpu/drm/r128/r128_drv.h
+++ b/drivers/gpu/drm/r128/r128_drv.h
@@ -293,8 +293,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
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

