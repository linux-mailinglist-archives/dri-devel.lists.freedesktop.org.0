Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E66AA205
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 22:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF81E10E765;
	Fri,  3 Mar 2023 21:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE9210E765
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 21:45:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23454B81A09;
 Fri,  3 Mar 2023 21:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B410C4339B;
 Fri,  3 Mar 2023 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677879897;
 bh=F9liIfmRQVktoAn8wyKTNdmFd0qpqDIml8xV+QZbMDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oyVa9upww0GEiSqiSnhnz0KUCuCOpX6QjbF+XX+ZhfHB+ArDSGWNBHaAoW+kk28uy
 iltO2d8DD97nXOtBUZfRmg+Jj+06EPS1ILMKGshOwDsn1JRdPdy9La5KY/TKwqmIHZ
 Q9xe+XZmGyvPp6Yd6/scdA6hbipRIEIxQFb3KjQ3kafbOyPow91Of8hk+cP+VkPUCJ
 govyjbyum+ddzzBxYqi3CVKmlg0pqo+Ma3EwOMFqXT6QR9630Sdtfx3IJuFSg+66Hm
 irt9kSiRiqJVM6lVatKz+32eP1dktfzXvEDBFPJaB9+QTRNcnW+y73YLaAaB1a8rBJ
 d1IQbicgiqrGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 48/60] drivers: base: component: fix memory leak
 with using debugfs_lookup()
Date: Fri,  3 Mar 2023 16:43:02 -0500
Message-Id: <20230303214315.1447666-48-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214315.1447666-1-sashal@kernel.org>
References: <20230303214315.1447666-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 8deb87b1e810dd558371e88ffd44339fbef27870 ]

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To make things simpler, just
call debugfs_lookup_and_remove() instead which handles all of the logic
at once.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Link: https://lore.kernel.org/r/20230202141621.2296458-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/base/component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5eadeac6c5322..7dbf14a1d9157 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -125,7 +125,7 @@ static void component_debugfs_add(struct aggregate_device *m)
 
 static void component_debugfs_del(struct aggregate_device *m)
 {
-	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
+	debugfs_lookup_and_remove(dev_name(m->parent), component_debugfs_dir);
 }
 
 #else
-- 
2.39.2

