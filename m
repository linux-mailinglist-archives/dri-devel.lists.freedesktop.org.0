Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1538B01FE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6C311385B;
	Wed, 24 Apr 2024 06:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YXIwA+L5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10E411385B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:36:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30EC060B98;
 Wed, 24 Apr 2024 06:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366E3C113CE;
 Wed, 24 Apr 2024 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940587;
 bh=q+qnEpK+l59jPIQe5UqWWsiYjfA7aXbDpteN/UQE4iA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YXIwA+L5lnMLivG8Ty4VlkldYLZBJZPHVVZMR7CTjhW+GrLhvcLYVr97KR3EvltKy
 mxtpqmvPaHIZXvzV8eT0jlixtWZ3xh2QXaTMPa6IGG4p1VHEaxnlHdkZ+MOSUVEESj
 jmUAq+E9AcnjSHKsrj78MpyR7YYPeN4oPNUzJBG1rJRihgFkOJu4XbplXbCpzhDIUy
 fcBi/Cl8klNVmB4h4wO0XDMTkG4I7Ivgslvta3HSqjYYs/az22Y4ZG6p/b/qHEGtih
 9WsxJToWE/vq25/SJ1SqPJ9cWerEhS3jYmspvsRwsUqIFGq5P7adOML7RcGx4zgFSl
 KP5ImGssJdGIg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:45 +0200
Subject: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=krzk@kernel.org;
 h=from:subject:message-id; bh=q+qnEpK+l59jPIQe5UqWWsiYjfA7aXbDpteN/UQE4iA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfuTlvNIAwrbpIVvZdLwVKRUFDW99McbcRZO
 QcDFmCzNHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin7gAKCRDBN2bmhouD
 1yEQD/wNRPPVi0sZ02CXQxc7WhjX2fS8W+11eReyDlq0TrPblfN1uN5EMVeLOipf070lASAUEgU
 Gtb/gaAZ5okrFRW0X2hOeeIODr5KW1USIedvITCosTww6e0o9/cTpygkeVTOALUJOnVMgpLJY55
 XRMvMJ4qGnfcWgPBAbjF93sxBkG6/HFDtOpxQDDQY7SHg59WVwHZi5oBviEKsJAYPrV9HcUMQ+f
 3NoMhI72z6PrcVfGF5cqmzjrohnUZ62BHJHta13v+PzzYI7MSKNL7cJ7yZ/IpxZoD98gBNLGad9
 981Jw4EwZJDQ+SZkds/AN2cOvHrrCiR7H1ufn9aL7sMA+SMYsVdyZWNvxiYu4+x0SxlKB7nU3jt
 2iLwQLhDJRdPEarPDky8Zb4NwSmci44wy+6CkYp5wt7CN+jJLGTMchJNos8QG22urVDwI/ioxVf
 gwkTBb55aKgzI7G/igaFKh/KyHdHZfxdKwtWKi9qNCi8rIWmr8obybUjejGetKkDveClRmLwX1G
 +upKHPFu6Tu5tH87v78kZ52gfA6f9kojKKKevH0+Lrsr+H41Al/5f7RJm3/5eoLmoLnWdSKxiYN
 4zuMqxjysxD7OdAaSsdgxFdiZhtldi3P0icA+Ykb2lvqkxFh/X4AIunJukrYCK5w1CEf/fOHFTq
 UcMo7yh1XzNrCMQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'struct lcd_ops' is not modified by core code.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Patch making lcd_ops const in progress:
https://lore.kernel.org/r/20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org

Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 scripts/const_structs.checkpatch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/const_structs.checkpatch b/scripts/const_structs.checkpatch
index fa96cfd16e99..52e5bfb61fd0 100644
--- a/scripts/const_structs.checkpatch
+++ b/scripts/const_structs.checkpatch
@@ -39,6 +39,7 @@ kgdb_arch
 kgdb_io
 kobj_type
 kset_uevent_ops
+lcd_ops
 lock_manager_operations
 machine_desc
 microcode_ops

-- 
2.43.0

