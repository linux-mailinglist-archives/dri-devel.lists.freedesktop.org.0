Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCE5B8402
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1710E8CB;
	Wed, 14 Sep 2022 09:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D640210E8C9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:06:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1956EB81733;
 Wed, 14 Sep 2022 09:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7FEC433D6;
 Wed, 14 Sep 2022 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146372;
 bh=jQHFSnENIQUD3uKsd0Jp00wrCKEODhqOZ+8EumLlAH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a0vKFL3hTLa8V6gdnbWM/eezfKaYS7Fqu6iQhifPHU8i92gK/v/pxXgYkpRcEUfCn
 Kft19AbMWbo3tZSOYJnH5h8HzifZV1nwApEmq0l6coikdVa+VnbHInZYGT3V9uuk2W
 F9kaagzYxCUuj4YPPKyFZC1EVLfFsQnH4uddTzugF1KWQioFJbVGaEEHT7MMeiP/8F
 nDsXFKKL84S9o/FlrUZZOIbRRHFmy3omjl8OLE+vpmXSvdo+Rp6/NOtOLhMPkp2Rkp
 anIq+ZUyfrb9HH2VzSGyB2jd13S9//JxlalC5cdNSyrQV06soPRgSfG2fOeh6QuZGD
 EmmZjhGmC5jqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/13] video: fbdev: pxa3xx-gcu: Fix integer
 overflow in pxa3xx_gcu_write
Date: Wed, 14 Sep 2022 05:05:34 -0400
Message-Id: <20220914090540.471725-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090540.471725-1-sashal@kernel.org>
References: <20220914090540.471725-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Hyunwoo Kim <imv4bel@gmail.com>,
 dri-devel@lists.freedesktop.org, yang.lee@linux.alibaba.com,
 yangyingliang@huawei.com, cai.huoqing@linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hyunwoo Kim <imv4bel@gmail.com>

[ Upstream commit a09d2d00af53b43c6f11e6ab3cb58443c2cac8a7 ]

In pxa3xx_gcu_write, a count parameter of type size_t is passed to words of
type int.  Then, copy_from_user() may cause a heap overflow because it is used
as the third argument of copy_from_user().

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/pxa3xx-gcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
index 184773b6b9e4f..2cca4b763d8dc 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -391,7 +391,7 @@ pxa3xx_gcu_write(struct file *file, const char *buff,
 	struct pxa3xx_gcu_batch	*buffer;
 	struct pxa3xx_gcu_priv *priv = to_pxa3xx_gcu_priv(file);
 
-	int words = count / 4;
+	size_t words = count / 4;
 
 	/* Does not need to be atomic. There's a lock in user space,
 	 * but anyhow, this is just for statistics. */
-- 
2.35.1

