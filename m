Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2965B490F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 23:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6297610E2D6;
	Sat, 10 Sep 2022 21:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2B10E080;
 Sat, 10 Sep 2022 21:16:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8351960E1F;
 Sat, 10 Sep 2022 21:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D8C433D7;
 Sat, 10 Sep 2022 21:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844589;
 bh=/Z5VauDP6NZb5Qbbk5QtyDSUJrRx1CVHUG5+Lgr4zrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nw0v9aomqumUWn5giZ68z91Qmodd/XRCiDBLIvtHgCaxY8W/8SiiycTOM4/EbyoHo
 47NyUSeUjTz2IoLP4QQiiM+P0s1JpkFaSo3yUc0euX7ovG6JExOpcL3dzN4vNomJGD
 CfrT2OJQH0x5Q25F+d/6w/0Oa4iFE7LkgX63pL4hF3u7q640vc0rbA+EzxgnBQUryK
 8+vRNsX9aW7xEyKR6hcQ5Y6fslp32vG+h+eKI44Ma6O840ICsWZ8gfDJOohUSp79gD
 vKaZkErFiQmI5UQPz/hKPCs79AyzhM/E9g9XE3h2OohS1tJTWm/U8MqgheH1Qc4hUk
 ahHn8NkwvbTcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 03/38] drm/msm/rd: Fix FIFO-full deadlock
Date: Sat, 10 Sep 2022 17:15:48 -0400
Message-Id: <20220910211623.69825-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211623.69825-1-sashal@kernel.org>
References: <20220910211623.69825-1-sashal@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 174974d8463b77c2b4065e98513adb204e64de7d ]

If the previous thing cat'ing $debugfs/rd left the FIFO full, then
subsequent open could deadlock in rd_write() (because open is blocked,
not giving a chance for read() to consume any data in the FIFO).  Also
it is generally a good idea to clear out old data from the FIFO.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Patchwork: https://patchwork.freedesktop.org/patch/496706/
Link: https://lore.kernel.org/r/20220807160901.2353471-2-robdclark@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index a92ffde53f0b3..db2f847c8535f 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -196,6 +196,9 @@ static int rd_open(struct inode *inode, struct file *file)
 	file->private_data = rd;
 	rd->open = true;
 
+	/* Reset fifo to clear any previously unread data: */
+	rd->fifo.head = rd->fifo.tail = 0;
+
 	/* the parsing tools need to know gpu-id to know which
 	 * register database to load.
 	 *
-- 
2.35.1

