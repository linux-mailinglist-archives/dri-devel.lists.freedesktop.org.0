Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C1CA8378
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A93510EB56;
	Fri,  5 Dec 2025 15:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QwlYp8N9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B0D10E080
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zgbjPldvwPZHqbqdzTcMNvL83B2Q4VyHokhRsIxduC4=; b=QwlYp8N955Zu30IQ3jvNVtR8ED
 oGIV8JqewjafYN6Ob1hCMERaqHyTrC8m0Gjeb+lKRz4lq+gZlMIDNqF25q3+sXSERAq30EXQLNpeQ
 i4YrjNpKsbu5OahJgejZ12FkVggGXdgkzgvkUCqv+nPa8RKCsn1npPgC4GE2RXy+rOP9Fpy4mi1d7
 eWB7N1gICZthr1UQYmXo7XTHpKTcKO4yQ/gnL5xWUVeUpTxtVVSc3KjqJ9Dax8Q1Y8S6DTEJMUmLM
 UJfLY2e33Ckdmmok4Izx1tFNI9rok1yVq3RKiB6FPt8xgehQb+FSXtY/e5keRvpPxskjy7ZjVzdI0
 QKgw/iOg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vRXqz-00980G-JG; Fri, 05 Dec 2025 16:36:17 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH v4 2/4] efi: sysfb_efi: Fix lfb_linelength calculation when
 applying quirks
Date: Fri,  5 Dec 2025 15:36:09 +0000
Message-ID: <20251205153611.93297-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
References: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
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

PIXEL_BIT_MASK formats can have either less or more than four bytes per
pixel so lets fix the lfb_linelenght calculation when applying the
swapped width and height quirks.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>
zCc: linux-efi@vger.kernel.org
Tested-by: Melissa Wen <mwen@igalia.com> # v3
---
 drivers/firmware/efi/sysfb_efi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 1d8b6966731c..997bbd2a2f33 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -357,8 +357,11 @@ __init void sysfb_apply_efi_quirks(void)
 
 	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
 	    dmi_check_system(efifb_dmi_swap_width_height)) {
+		u32 lfb_depth = __screen_info_lfb_bits_per_pixel(&screen_info);
+
 		swap(screen_info.lfb_width, screen_info.lfb_height);
-		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
+		screen_info.lfb_linelength = lfb_depth * screen_info.lfb_width /
+					     BITS_PER_BYTE;
 	}
 }
 
-- 
2.51.1

