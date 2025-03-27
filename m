Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D106A72D35
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966E10E2D1;
	Thu, 27 Mar 2025 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="mGszbYpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1BC10E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:01:34 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1743069687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHLOBT3idkFgvXNfDI3YEo7317l4Nl2O9zMCAnRi99A=;
 b=mGszbYpj2K9Vh0CF1hIrPcsW7W/IVtKUzYXFFwYUsJh+5+FeSpElBHENDfuzKXhql1p9+A
 hD2QEep9xllE9+UnTztpT+2/QCBj8Hbi/Hx/3CpAOmbmjLnaKhCcQFNmhbZQ6P/7o4lz5W
 WWtbdUcnEN5joJ6396r7valD+k+PbMA=
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 1/1] fbdev: atyfb: Fix buffer overflow
Date: Thu, 27 Mar 2025 13:01:24 +0300
Message-ID: <20250327100126.12585-2-arefev@swemel.ru>
In-Reply-To: <20250327100126.12585-1-arefev@swemel.ru>
References: <20250327100126.12585-1-arefev@swemel.ru>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value LCD_MISC_CNTL is used in the 'aty_st_lcd()' function to
calculate an index for accessing an array element of size 9.
This may cause a buffer overflow.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 210fd3ac18a4..93eb5eb6042b 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -149,6 +149,8 @@ static const u32 lt_lcd_regs[] = {
 void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
 {
 	if (M64_HAS(LT_LCD_REGS)) {
+		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
+			return;
 		aty_st_le32(lt_lcd_regs[index], val, par);
 	} else {
 		unsigned long temp;
@@ -164,6 +166,8 @@ void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
 u32 aty_ld_lcd(int index, const struct atyfb_par *par)
 {
 	if (M64_HAS(LT_LCD_REGS)) {
+		if ((u32)index >= ARRAY_SIZE(lt_lcd_regs))
+			return 0;
 		return aty_ld_le32(lt_lcd_regs[index], par);
 	} else {
 		unsigned long temp;
-- 
2.43.0

