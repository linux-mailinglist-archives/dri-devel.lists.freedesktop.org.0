Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64464FC9E3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FC910FAD2;
	Tue, 12 Apr 2022 00:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FDC10FAD2;
 Tue, 12 Apr 2022 00:47:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46FE2B819B5;
 Tue, 12 Apr 2022 00:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86207C385A4;
 Tue, 12 Apr 2022 00:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724450;
 bh=DDpiuvyZPMOVx2gNhL7oXsN4aLctbYZMvh6l2bO/8k4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h40daArEAgC2iJMn/9HXmJo6XnyogNGrUgPRzansfoVPW9WqNR0xFQ/87rR8vB77x
 8tVDjHQ318BV1WEfVBE//Fr/Us02DeGmp/iESokpRRxPZE7xAbGQ1zaYXK2WaqLTN0
 7i/wivY4RcBilltk9cxFal8JbMmWzVa6Nsfe+mW1pNUGdV629gsjS5/JGWj7AHL7Kg
 DtReIMHEwf5ItGCvEC8/xcMowuEe8GNQUP9Oupf4QmGcdZ2BytgCgN7VzmRVYALNNU
 U/RmtJAwAz3e0iog3gLdurdeyUFLTnOKhOU/r/LE3CD1eF4vxmsc6SGwWA9OWCAVTK
 B0oYyTWGs8Utg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/41] drm/amd/display: FEC check in timing
 validation
Date: Mon, 11 Apr 2022 20:46:19 -0400
Message-Id: <20220412004656.350101-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004656.350101-1-sashal@kernel.org>
References: <20220412004656.350101-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, lee.jones@linaro.org,
 Jimmy.Kizito@amd.com, Sasha Levin <sashal@kernel.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, michael.strauss@amd.com,
 Alex Hung <alex.hung@amd.com>, Chiawen Huang <chiawen.huang@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Martin.Leung@amd.com,
 Eric.Yang2@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>, roy.chan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chiawen Huang <chiawen.huang@amd.com>

[ Upstream commit 7d56a154e22ffb3613fdebf83ec34d5225a22993 ]

[Why]
disable/enable leads FEC mismatch between hw/sw FEC state.

[How]
check FEC status to fastboot on/off.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chiawen Huang <chiawen.huang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index b37c4d2e7a1e..35a27fe48f66 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1377,6 +1377,10 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
 	if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
 		return false;
 
+	/* Check for FEC status*/
+	if (link->link_enc->funcs->fec_is_active(link->link_enc))
+		return false;
+
 	enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 
 	if (enc_inst == ENGINE_ID_UNKNOWN)
-- 
2.35.1

