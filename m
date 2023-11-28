Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BF7FB7C6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3249210E4A0;
	Tue, 28 Nov 2023 10:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920C10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:28:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D3C5CE193B;
 Tue, 28 Nov 2023 10:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502D6C433C7;
 Tue, 28 Nov 2023 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701167300;
 bh=nnqZ06ksK0pk3r0lDcdYcgWXjjX1wHxDRcwFEc8XS0Y=;
 h=From:To:Cc:Subject:Date:From;
 b=rXUxKllRuBxV9GetXRXTafM9LWGk5dnCV9/zUrU6M673IhyjL0FNCdblspQNwCumW
 cpaW4+ofvJr1iFT4oBGnqq8XHTsxmagiB7s112d0l9bYGAHpiXgpliRdhiq7QuA1O/
 dSlazoAyeO0+9w+lyJYEzV5SZ3Rimcd/rvjJsOJM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] driver core: make device_is_dependent() static
Date: Tue, 28 Nov 2023 10:28:15 +0000
Message-ID: <2023112815-faculty-thud-add8@gregkh>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Lines: 40
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=nnqZ06ksK0pk3r0lDcdYcgWXjjX1wHxDRcwFEc8XS0Y=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDKmpB/bLBQs3V5yIlQ+42nn61s0pxodteqLW35WU7toXH
 vGCZ1VsRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzEXphhwTGF33HxL68oJxtf
 U2Z+vLTvDut+GYZ5BoaTNhatcc76K/lZUbq5JDbGT+kAAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function device_is_dependent() is only called by the driver core
internally and should not, at this time, be called by anyone else
outside of it, so mark it as static so as not to give driver authors the
wrong idea.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c    | 2 +-
 include/linux/device.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dafdb9970901..6dcc26eec096 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -298,7 +298,7 @@ static inline bool device_link_flag_is_sync_state_only(u32 flags)
  * Check if @target depends on @dev or any device dependent on it (its child or
  * its consumer etc).  Return 1 if that is the case or 0 otherwise.
  */
-int device_is_dependent(struct device *dev, void *target)
+static int device_is_dependent(struct device *dev, void *target)
 {
 	struct device_link *link;
 	int ret;
diff --git a/include/linux/device.h b/include/linux/device.h
index c11d60cabaab..6a4ee40af3df 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1071,7 +1071,6 @@ int device_rename(struct device *dev, const char *new_name);
 int device_move(struct device *dev, struct device *new_parent,
 		enum dpm_order dpm_order);
 int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid);
-int device_is_dependent(struct device *dev, void *target);
 
 static inline bool device_supports_offline(struct device *dev)
 {
-- 
2.43.0

