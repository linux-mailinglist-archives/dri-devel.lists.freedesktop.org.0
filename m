Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45357AB76
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 03:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B4D18B28E;
	Wed, 20 Jul 2022 01:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21D418B28E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 01:12:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EACEF61769;
 Wed, 20 Jul 2022 01:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038B7C341CA;
 Wed, 20 Jul 2022 01:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279570;
 bh=1EQpcFTZlk54ZdjOp1LnLv7GXGgLmqXYhR43h8huLFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAJcd4mAz0WxgC2Rzr4O/vRuhzhaI5r7Fcfl1ecU7pmu1jYsUWNWGDVrjhP2xr4BL
 J/MbhrfvbzYKWRReEfyysUomibjuLfXvvThOEWRNxgpApciALoKviZ9ba+58yCXQOe
 afEspmhm7cEaXlU6HeVI2czN/4AWazxBh4gWuGoZfqVcrl45pGG3GB5Am+XTZkgX1R
 kfevfv7N9TccosOtpJVcvLB1vJkaWhHHeOmAyjGHtsIY21nnZXKLpSF9ENEDqLZUwf
 rktcIhT9UuPmYep3E3HSbuGFSibIDgaom0ZzLCRKKSuotNgZ6CQ+MTkPQ7N803lS14
 HTg3V9qvp3VqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 35/54] drm/ssd130x: Fix pre-charge period setting
Date: Tue, 19 Jul 2022 21:10:12 -0400
Message-Id: <20220720011031.1023305-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

[ Upstream commit b68277f19e31a25312c4acccadb5cf1502e52e84 ]

Fix small typo which causes the mask for the 'precharge1' setting
to be used with the 'precharge2' value.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220706184133.210888-1-ezequiel@vanguardiasur.com.ar
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 38b6c2c14f53..9a8a8f5606fd 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -293,7 +293,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 
 	/* Set precharge period in number of ticks from the internal clock */
 	precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
-		     SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep2));
+		     SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd130x->prechargep2));
 	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
 	if (ret < 0)
 		return ret;
-- 
2.35.1

