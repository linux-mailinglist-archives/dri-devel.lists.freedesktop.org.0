Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E423EA96FCF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4CB10E5EE;
	Tue, 22 Apr 2025 15:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F+nCEjGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0BD10E5EE;
 Tue, 22 Apr 2025 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yvpT/rrigGA6lKTs04bRSuZcgou4BDbXSn6H3Qu6d3E=; b=F+nCEjGPvdyYkc54YEvEl+4++5
 3m+k8BVvLTKS6bkStEUlNjKUBooxEtvpbH0tUoKixlVSlPWNDMr/5F/7iKXeKc2fvAARYP62jSRGq
 YrtjKRtZrhmRVCgaX38K9zAUfXKlRzS4nsQGuj9cIUQsiM2hbd13859co7cVwoqmdQpai/fQc4k12
 OUGHCMoNnPXLE/D2+8W7Pj2OqquAJCEmnEq38WdqBsqV98drJVi/mIu5HDgdUi48kKGGXerSPLT32
 TDmgVnvw+Bj7GL8IZh7qyqfYSFWECmEygEIJJ/BE98kXJvA3wLN+9lBGzjf9fizHdoZJmEfu78oHy
 EJOBnuog==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u7FAs-006UjB-5Q; Tue, 22 Apr 2025 17:04:38 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Roman Li <roman.li@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] Revert "drm/amd/display: Hardware cursor changes color when
 switched to software cursor"
Date: Tue, 22 Apr 2025 11:58:11 -0300
Message-ID: <20250422150427.59679-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This reverts commit 272e6aab14bbf98d7a06b2b1cd6308a02d4a10a1.

Applying degamma curve to the cursor by default breaks Linux userspace
expectation.

On Linux, AMD display manager enables cursor degamma ROM just for
implict sRGB on HW versions where degamma is split into two blocks:
degamma ROM for pre-defined TFs and `gamma correction` for user/custom
curves, and degamma ROM settings doesn't apply to cursor plane.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1513
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2803
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4144
Reported-by: Michel Dänzer <michel.daenzer@mailbox.org>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

I suspect there is a conflict of interest between OSes here, because
this is not the first time this mechanism has been removed from the
DC shared-code and after reintroduced [1].

I'd suggest that other OSes set the `dc_cursor_attributes
attribute_flags.bits.ENABLE_CURSOR_DEGAMMA` to true by default, rather
than removing the mechanism that is valid for the Linux driver. Similar
to what the Linux AMD DM does for the implicit sRGB [2][3], but in their
case, they just need to initialize with 1.

Finally, thanks Michel for pointing this issue out to me and noticing
the similarity to previous solution.

[1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/d9fbd64e8e317
[2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/857b835f
[3] https://gitlab.freedesktop.org/agd5f/linux/-/commit/66eba12a

Best Regards,

Melissa

 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
index 1236e0f9a256..712aff7e17f7 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
@@ -120,10 +120,11 @@ void dpp401_set_cursor_attributes(
 	enum dc_cursor_color_format color_format = cursor_attributes->color_format;
 	int cur_rom_en = 0;
 
-	// DCN4 should always do Cursor degamma for Cursor Color modes
 	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
 		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
-		cur_rom_en = 1;
+		if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
+			cur_rom_en = 1;
+		}
 	}
 
 	REG_UPDATE_3(CURSOR0_CONTROL,
-- 
2.47.2

