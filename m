Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E2C9E65E
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB98110E0FD;
	Wed,  3 Dec 2025 09:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NkdyvTKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D6D10E0FD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lKGn1CzxAhdrGZVszVj9FBDrL6gSkSoPWkxyoNvNpvw=; b=NkdyvTKio1N6sUq48yCwwlkRcZ
 hDam83s4uoWbiJZoZZAAfSdqh1O9HZI1qAfKeMEwY2DDTpgVdAR8jTL2q503kGOOQupUb/sbqvkcn
 4o5rb0sjcT774wsIz6c+4GQxRIFDyqLDESFjT2z43U5zRPibYhl2CWfHcX/3eCxsQtIL4mg1H8hxw
 NUHaP/H2qZrArUwrzPRFi1RJZ/S6/ARoU5pst74kgoB38lOrMfdSe5YtdlOwAfX7gGYQesbLS2p3o
 vGdQC2AKn90qDFmt1acMciWEo4g88+1XBlWrpMRIwZC4x7czVEhsPueczfuDHSEreSZsdZbJtOyv3
 Jx94l6Rg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vQipK-008Bpb-Kd; Wed, 03 Dec 2025 10:07:10 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Subject: [PATCH v2 2/4] efi: sysfb_efi: Fix lfb_linelength calculation when
 applying quirks
Date: Wed,  3 Dec 2025 09:07:04 +0000
Message-ID: <20251203090706.53778-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
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
Cc: linux-efi@vger.kernel.org
---
 drivers/firmware/efi/sysfb_efi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 1d8b6966731c..14b61414c33a 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -358,7 +358,9 @@ __init void sysfb_apply_efi_quirks(void)
 	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
 	    dmi_check_system(efifb_dmi_swap_width_height)) {
 		swap(screen_info.lfb_width, screen_info.lfb_height);
-		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
+		screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
+					     screen_info.lfb_width /
+					     BITS_PER_BYTE;
 	}
 }
 
-- 
2.51.1

