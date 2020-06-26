Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5A20AD4B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04D36EC34;
	Fri, 26 Jun 2020 07:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E816E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 03:41:10 +0000 (UTC)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 28E347EC0F;
 Thu, 25 Jun 2020 22:30:36 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1593142236; bh=02YN1ayW2X/zW5QiWWQyey8muOEEWO2Xr33scSYqXdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxl/qzcfdPj5oFVlBe2QdykR5DmahHEunE4aX/K3GMARuuOqeVuG1MPjA6VYd3O8+
 QzIsx5aXKgqADTJ8Gr3l8HLEIyGVxdDZabdO8UMqb2MFcwmjAy2OaQOAAeWrxB0+kq
 gmlSY6iTsCHuUhw6SWqN0ZUqtKM/IwtBOTipkJHPQKLipR+JovID0UYC6BDLB1WeL8
 JdEk+SBkFtFVd1G98iJHQbDCDnnI7hAAjAjqbl+D5yOK3vsBsIDcRyoc0Q3xI10OWX
 qCFO+sHaztOdB/BpQYFUfodzzVneSmN3mW6ES0A7cfm4oL2tX3nw8d2Ntmm2qxljDQ
 XI+W42dcLbcdA==
From: Shawn Anastasio <shawn@anastas.io>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/bridge: analogix_dp: Add enable_psr param
Date: Thu, 25 Jun 2020 22:30:23 -0500
Message-Id: <20200626033023.24214-2-shawn@anastas.io>
In-Reply-To: <20200626033023.24214-1-shawn@anastas.io>
References: <20200626033023.24214-1-shawn@anastas.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: airlied@linux.ie, a.hajda@samsung.com, linux-kernel@vger.kernel.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a toggle to enable/disable PSR from the kernel commandline.
This is useful in situations where PSR is supported by the hardware
but is not desired by the user. One such use case is working around
hardware errata.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 76736fb8ed94..9735ab71fca7 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -35,6 +35,10 @@
 
 static const bool verify_fast_training;
 
+static bool enable_psr = true;
+module_param(enable_psr, bool, 0644);
+MODULE_PARM_DESC(enable_psr, "PSR support (1 = enabled (default), 0 = disabled)");
+
 struct bridge_init {
 	struct i2c_client *client;
 	struct device_node *node;
@@ -979,7 +983,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 	if (ret)
 		return ret;
 
-	if (analogix_dp_detect_sink_psr(dp)) {
+	if (enable_psr && analogix_dp_detect_sink_psr(dp)) {
 		ret = analogix_dp_enable_sink_psr(dp);
 		if (ret)
 			return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
