Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC559005C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED878B34A;
	Thu, 11 Aug 2022 15:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D8EB4674
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:42:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5737CE2259;
 Thu, 11 Aug 2022 15:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044ADC433C1;
 Thu, 11 Aug 2022 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232573;
 bh=vrdBkE2ZmzcmSjIjhiu+vMiXHBgu40Oq7MDBGADFiN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nb//KzwPkARwMCwk1DNarXtfrZWunnHyG0kxjd+HEOlRIfTpJxuf/7QgImy9H/cDG
 71H16VGdaV3UloH30uoUbe4shEOrysOnpkfgtiITk+KbhZichXkz5yyhbmEHHFJtPN
 7L7a22Z8dK6yHkXCzaXUXiz6ygOan8mdF94uJLGq8+sikiIR/6y6BAlhgEqeNHdkIE
 4RKubDYamvCcNNEcK51BBfBEktF0ajo/CCYgoLBTgJyQACtA50cI+RgTShLdS3PZgM
 jQDqfv0f4p2n/LGpwx2erRGvFa4AoYJLKKwvp37/EMGqJSqyriBU776a7bnM9PqUSZ
 5wsqFsWUt42AQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 02/93] drm/r128: Fix undefined behavior due to
 shift overflowing the constant
Date: Thu, 11 Aug 2022 11:40:56 -0400
Message-Id: <20220811154237.1531313-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
index 2e1bc01aa5c9..970e192b0d51 100644
--- a/drivers/gpu/drm/r128/r128_drv.h
+++ b/drivers/gpu/drm/r128/r128_drv.h
@@ -300,8 +300,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
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

