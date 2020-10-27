Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D74299D1F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 01:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4982B89C93;
	Tue, 27 Oct 2020 00:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7980989FC8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 00:04:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC17A20882;
 Tue, 27 Oct 2020 00:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757074;
 bh=bPU4rbdcLVtHx7ZGEBtwbIdqje5u3vkwEJxkoWyd8EM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tODANPf6ZdMBgjyBbcExBAONy68/cASMcwZsdFAAxQL4ywkrIu5RgRQ11h4d2UQm6
 M3tmJC5JMNzc5SePp1SwGycs1XoIIJW0DKekWEaEwkjtCyIIQUhIpZFmRJRocqHKGI
 DzU7JCQY66kcrKMIH4pZgp3hp7ZaKS9HcYRK7i5w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 15/60] drm/brige/megachips: Add checking if
 ge_b850v3_lvds_init() is working correctly
Date: Mon, 26 Oct 2020 20:03:30 -0400
Message-Id: <20201027000415.1026364-15-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000415.1026364-1-sashal@kernel.org>
References: <20201027000415.1026364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Nadezda Lutovinova <lutovinova@ispras.ru>, Sasha Levin <sashal@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nadezda Lutovinova <lutovinova@ispras.ru>

[ Upstream commit f688a345f0d7a6df4dd2aeca8e4f3c05e123a0ee ]

If ge_b850v3_lvds_init() does not allocate memory for ge_b850v3_lvds_ptr,
then a null pointer dereference is accessed.

The patch adds checking of the return value of ge_b850v3_lvds_init().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200819143756.30626-1-lutovinova@ispras.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 2136c97aeb8ec..dcf091f9d843f 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -306,8 +306,12 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
 				       const struct i2c_device_id *id)
 {
 	struct device *dev = &stdp4028_i2c->dev;
+	int ret;
+
+	ret = ge_b850v3_lvds_init(dev);
 
-	ge_b850v3_lvds_init(dev);
+	if (ret)
+		return ret;
 
 	ge_b850v3_lvds_ptr->stdp4028_i2c = stdp4028_i2c;
 	i2c_set_clientdata(stdp4028_i2c, ge_b850v3_lvds_ptr);
@@ -365,8 +369,12 @@ static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c,
 				       const struct i2c_device_id *id)
 {
 	struct device *dev = &stdp2690_i2c->dev;
+	int ret;
+
+	ret = ge_b850v3_lvds_init(dev);
 
-	ge_b850v3_lvds_init(dev);
+	if (ret)
+		return ret;
 
 	ge_b850v3_lvds_ptr->stdp2690_i2c = stdp2690_i2c;
 	i2c_set_clientdata(stdp2690_i2c, ge_b850v3_lvds_ptr);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
