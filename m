Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CB4ABFB8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918A410F14A;
	Mon,  7 Feb 2022 13:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C2710F14A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=THrB40q/yOSt5cd0Iu4CGyYT6zUZMR21yUK3lUKzKZ8=; b=wB2ahBMfpiwLs/yizKobnktO1e
 r1u64pQ6f24ow6srdnt3Tbbva76WV8L8463+JUWKL3EdW+oeDAx51OZ4NzY5WAXVmWu/Aq6OBWkxj
 vTo9jDJYwzGZ24k4AH2YGFaoM9mozOGAjZi2eBO/pEHTrh2n+xpsYWzbCqmv+gPd8ktYKkDAEQV9Q
 2A95CHTFjEVx0gbbujjtbHavxlbhEolM08i63GQHByszZgJElzML0b0ATOVEn2RBfjhkFN1BNzG3F
 9JLisrq26hRVnpdL5xr1V2nTyQI8NjfX+xpegLm0Cho5LmnxXtR18JLfoNpzFflNJBIKQ5iqp8bOP
 BtEShDFA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nH3vx-0007xv-M8; Mon, 07 Feb 2022 15:19:57 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com
Subject: [PATCH 1/2] gpu: host1x: Always return syncpoint value when waiting
Date: Mon,  7 Feb 2022 15:19:31 +0200
Message-Id: <20220207131932.2164560-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new TegraDRM UAPI uses syncpoint waiting with timeout set to
zero to indicate reading the syncpoint value. To support that we
need to return the syncpoint value always when waiting.

Fixes: 44e961381354 ("drm/tegra: Implement syncpoint wait UAPI")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e08e331e46ae..fb4036a32095 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -227,27 +227,12 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	void *ref;
 	struct host1x_waitlist *waiter;
 	int err = 0, check_count = 0;
-	u32 val;
 
 	if (value)
-		*value = 0;
-
-	/* first check cache */
-	if (host1x_syncpt_is_expired(sp, thresh)) {
-		if (value)
-			*value = host1x_syncpt_load(sp);
+		*value = host1x_syncpt_load(sp);
 
+	if (host1x_syncpt_is_expired(sp, thresh))
 		return 0;
-	}
-
-	/* try to read from register */
-	val = host1x_hw_syncpt_load(sp->host, sp);
-	if (host1x_syncpt_is_expired(sp, thresh)) {
-		if (value)
-			*value = val;
-
-		goto done;
-	}
 
 	if (!timeout) {
 		err = -EAGAIN;
-- 
2.35.0

