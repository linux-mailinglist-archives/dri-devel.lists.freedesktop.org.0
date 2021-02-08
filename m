Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8253143CD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844D6EA27;
	Mon,  8 Feb 2021 23:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0B56EA26
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 23:31:30 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612827089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW/rfNBqb6SK1XEXbpPIWeuc3FX/LJUm19wTvuFCO/w=;
 b=1q7ZnPQog0qZ6EvkUtPUXN4H95iNMqRmN/wCWMpZERl2WBwdqYA8DwRkRKeMNzj+B8TG57
 c8TyjzpQYaZCz//5L9+YzE4vAt4mjlryaQjQyPwpmWrLdfaaT9+FSDBRDxb/kBTl4QTJ4K
 3zi/6uDhEU3de+w5L6GBRDgwjcN4P/xMR0CgJTcIseNiQKY1iaeyeSIf+L6l93/jxjJczj
 5AQDM3eVyFazkeI770mL7+ehGEzj36ERclaEfuDMX4DXLeaFr58OvuWTTf8NQtvwPGy8U3
 zS2AQpWyqvkWkETqxOCL1ZQuH2+IY9Fq85PE6PCyJtFAQnTjL+Yep01l2vedYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612827089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW/rfNBqb6SK1XEXbpPIWeuc3FX/LJUm19wTvuFCO/w=;
 b=BzUkbLqY+PBvZWCyytkWWjw+GhFbJ6cm2zbE0VDj1A31jCEURyYCu1dhOVhV/RK1FkaVIx
 o0qaKW4ZAqW7dcBw==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/gma500: Remove in_atomic() usage.
Date: Tue,  9 Feb 2021 00:31:16 +0100
Message-Id: <20210208233119.391103-2-bigeasy@linutronix.de>
In-Reply-To: <20210208233119.391103-1-bigeasy@linutronix.de>
References: <20210208233119.391103-1-bigeasy@linutronix.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is using msleep() if it is safe to use based on in_atomic().
This is not needed this macro is only used from
i2c_algorithm::master_xfer() which is always invoked from preemptible
context.

Remove in_atomic() because it is superfluous. Remove wait_for_atomic()
because it has no users.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/gma500/intel_gmbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index 370bd6451bd9b..eb0924473a218 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -44,13 +44,13 @@
 			ret__ = -ETIMEDOUT;				\
 			break;						\
 		}							\
-		if (W && !(in_atomic() || in_dbg_master())) msleep(W);	\
+		if (W && !(in_dbg_master()))				\
+			msleep(W);					\
 	}								\
 	ret__;								\
 })
 
 #define wait_for(COND, MS) _wait_for(COND, MS, 1)
-#define wait_for_atomic(COND, MS) _wait_for(COND, MS, 0)
 
 #define GMBUS_REG_READ(reg) ioread32(dev_priv->gmbus_reg + (reg))
 #define GMBUS_REG_WRITE(reg, val) iowrite32((val), dev_priv->gmbus_reg + (reg))
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
