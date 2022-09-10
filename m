Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859375B494F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 23:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAFE10E2D5;
	Sat, 10 Sep 2022 21:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273B510E2D5;
 Sat, 10 Sep 2022 21:18:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5ED3ECE02BD;
 Sat, 10 Sep 2022 21:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D835AC4347C;
 Sat, 10 Sep 2022 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844717;
 bh=+gxl2HYx2Ui/E2dJ0+8vkM5bnjpZDmbWrSJmuo+oIdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WEvfOXeW+VVH075+kaUf9PReNMhKhfpgTKgaCNba1kkCCIL+u+ucuHHKaq6SB4t1C
 ZuQAzI/wX6zk1KrIyqc/2WaSnAxDz+0jTKhT+FeIRoNl0dGTTGrcbi9wQDTt0RotAO
 aItMWEHabxn8CTfz9ZzAhlF5al55lb4sWyn8NPXiNxnKYkcFqw9tmA7Mmd099jGSXA
 T/TyZHAipdr7D3aifGeSd4AFHp5ypbw8/LEiwkOl1nwLSnzdX96npYB702wYvjm4mp
 GPaV5k6fHTFVm8y+QHeH39wXefp5A2coAxJ05A8YwlPXb/I++paWC7gIeTBQOUmC0p
 ZwfiazON2hfAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/14] drm/msm/rd: Fix FIFO-full deadlock
Date: Sat, 10 Sep 2022 17:18:20 -0400
Message-Id: <20220910211832.70579-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211832.70579-1-sashal@kernel.org>
References: <20220910211832.70579-1-sashal@kernel.org>
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
index fea30e7aa9e83..084b6ae2a4761 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -191,6 +191,9 @@ static int rd_open(struct inode *inode, struct file *file)
 	file->private_data = rd;
 	rd->open = true;
 
+	/* Reset fifo to clear any previously unread data: */
+	rd->fifo.head = rd->fifo.tail = 0;
+
 	/* the parsing tools need to know gpu-id to know which
 	 * register database to load.
 	 */
-- 
2.35.1

