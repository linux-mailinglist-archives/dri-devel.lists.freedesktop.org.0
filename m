Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459D892F03
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 10:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E26710E97D;
	Sun, 31 Mar 2024 08:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="k0FTnHnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6EB10E6AB;
 Sun, 31 Mar 2024 06:46:06 +0000 (UTC)
Received: from tundra.lovozera (unknown [46.138.86.221])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5F9F140755D8;
 Sun, 31 Mar 2024 06:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5F9F140755D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1711867563;
 bh=Um1OeF+YjMXHeUez/kZLspj1wOkVZEI9a9MFeGLZNZo=;
 h=From:To:Cc:Subject:Date:From;
 b=k0FTnHnYTdvZURFzBOOYPMVCPYR5A2omqFTQlaRaFzwnHARsJT5Fj5QwrdRktR9J4
 jfced4TYeae7QRKyV7KkJAxZ6BKdeu6N9q/CkaJifFd002w0QdMN212n6YwWnY9sMl
 MUPYvIcBMG5fcxw/67QvuSkNbhV2WhInMT96d9dI=
From: Mikhail Kobuk <m.kobuk@ispras.ru>
To: Karol Herbst <kherbst@redhat.com>
Cc: Mikhail Kobuk <m.kobuk@ispras.ru>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] drm: nv04: Add check to avoid out of bounds access
Date: Sun, 31 Mar 2024 09:45:51 +0300
Message-ID: <20240331064552.6112-1-m.kobuk@ispras.ru>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:36:00 +0000
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

Output Resource (dcb->or) value is not guaranteed to be non-zero (i.e.
in drivers/gpu/drm/nouveau/nouveau_bios.c, in 'fabricate_dcb_encoder_table()'
'dcb->or' is assigned value '0' in call to 'fabricate_dcb_output()').

Add check to validate 'dcb->or' before it's used.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for iMac G4")
Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
---
 drivers/gpu/drm/nouveau/dispnv04/dac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index d6b8e0cce2ac..0c8d4fc95ff3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -428,7 +428,7 @@ void nv04_dac_update_dacclk(struct drm_encoder *encoder, bool enable)
 	struct drm_device *dev = encoder->dev;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 
-	if (nv_gf4_disp_arch(dev)) {
+	if (nv_gf4_disp_arch(dev) && ffs(dcb->or)) {
 		uint32_t *dac_users = &nv04_display(dev)->dac_users[ffs(dcb->or) - 1];
 		int dacclk_off = NV_PRAMDAC_DACCLK + nv04_dac_output_offset(encoder);
 		uint32_t dacclk = NVReadRAMDAC(dev, 0, dacclk_off);
@@ -453,7 +453,7 @@ bool nv04_dac_in_use(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 
-	return nv_gf4_disp_arch(encoder->dev) &&
+	return nv_gf4_disp_arch(encoder->dev) && ffs(dcb->or) &&
 		(nv04_display(dev)->dac_users[ffs(dcb->or) - 1] & ~(1 << dcb->index));
 }
 
-- 
2.44.0

