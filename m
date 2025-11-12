Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A4C541AA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 20:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359210E1CE;
	Wed, 12 Nov 2025 19:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGYZNJB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB410E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 19:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762975396; x=1794511396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hvW5MfhbFDSN99ebzzoa8i+LHa0rM/rFbGQQNSkbOCQ=;
 b=KGYZNJB1UBqxuc9hnfMN8lMtB9esQYdsZkYx9y/HZSrnfsnY8IYHk0cw
 v+64cpfJoaQ4YKEqHyA4LwMy+RpQQboAs0WY8rnRNmC0VlgOB6IP7QwXG
 dUBxNOcF7EUvcrejQZNVVuXA5AYad1FAftxFCUtEJKXA0bCuWExv00kTY
 /7FW/w2Jl8D8dEX6Hz/iBrez+pv4YjVoSV3jVsqkjBL6VFslNPkUDVdMW
 PkuiDvg4kG3UmcLHVNJm/3Lg80olvcivnkU+HbeFhr8T/uIboLLgi9Mmn
 aLIJdoPkTu6R0J7b4KIxh697NQ5xtzni+2ReCD4n8SUR7jnL43bxCakU5 g==;
X-CSE-ConnectionGUID: 2tmqKMnTSxWZeBzR7a2yTQ==
X-CSE-MsgGUID: a5iF/QZRT+KTFMGY8NNU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82679556"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="82679556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:23:16 -0800
X-CSE-ConnectionGUID: ln9UcHszSp2t5l0oEMVd5A==
X-CSE-MsgGUID: gF/zBEGaSbqlZU7D/KDfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189578289"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2025 11:23:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id DD35095; Wed, 12 Nov 2025 20:23:12 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] staging: fbtft: core: fix potential memory leak in
 fbtft_probe_common()
Date: Wed, 12 Nov 2025 20:22:07 +0100
Message-ID: <20251112192235.2088654-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Jianglei Nie <niejianglei2021@163.com>

fbtft_probe_common() allocates a memory chunk for "info" with
fbtft_framebuffer_alloc(). When "display->buswidth == 0" is true, the
function returns without releasing the "info", which will lead to a
memory leak.

Fix it by calling fbtft_framebuffer_release() when "display->buswidth
== 0" is true.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed in accordance with Andy's review

 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9e7b84071174..8a5ccc8ae0a1 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1171,8 +1171,8 @@ int fbtft_probe_common(struct fbtft_display *display,
 	par->pdev = pdev;
 
 	if (display->buswidth == 0) {
-		dev_err(dev, "buswidth is not set\n");
-		return -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "buswidth is not set\n");
+		goto out_release;
 	}
 
 	/* write register functions */
-- 
2.50.1

