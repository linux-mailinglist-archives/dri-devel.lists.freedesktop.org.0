Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460568E46E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 00:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069410E63F;
	Tue,  7 Feb 2023 23:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2300A10E63F;
 Tue,  7 Feb 2023 23:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KKCxYUeoozeU27i58OD1InNHwJzW3SoY8B2DvPcOSg=; b=RdccXekeQ2yeF62bNcACqz+WqA
 jYCmL0ZdyUv38I/colbd7k8tHpi6t4FlEzbAvkoXtP1ImEzEdMdOkx2ERaEP1SsZ/q+szqTFsxVxj
 2pSZw363tpWFnxTBbJk4sqXmN3WwJBkIHA8k3ZJz+kkD8toc4yM208WM/V7AunKTQ/sZG29stVEhN
 XSiOTe7hTL/gH72pzbNCSkP6w++0GKoq5OJoW25/99bTax60hvh0G3HfreFclKkVBotxDqqme2dpX
 g/HeCaqjOFcy/pIsYz+80hbfEvaRRleJ+zDQ0W+Y1k1st0GoW9zVTT1Rl5hxkfvjYUH6xIUCIIklD
 qfbNt2vQ==;
Received: from [38.44.66.31] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPXSE-00CH3W-3v; Wed, 08 Feb 2023 00:32:50 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: fix glitches on hw rotation without pipe
 split
Date: Tue,  7 Feb 2023 22:32:35 -0100
Message-Id: <20230207233235.513948-1-mwen@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Brian Chang <Brian.Chang@amd.com>, David Galiffi <David.Galiffi@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Martin Leung <Martin.Leung@amd.com>, Martin Tsai <martin.tsai@amd.com>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix glitches when moving cursor close to the edge on a rotated screen
for drivers with one pipe (without pipe split) by halving dst_x_offset.

Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

I'm not sure if having dst_x_offset (or only for the one pipe case) is
the right solution, but it solves the issue on different devices when
the pipe split policy is AVOID.

Context:

Some artifacts appear on HW rotated screen when moving the cursor close
to the edge, as reported in:
https://gitlab.freedesktop.org/drm/amd/-/issues/2247

This issue was initially reported on DCN 3.0.1 and it's not present in
DCN 2.1 by default, for example. These two drivers follow different
pipe_split_policy, where there is no pipe split on DCN 3.0.1 (AVOID),
but we see pipe splitting on DCN 2.1 (MPC_SPLIT_AVOID_MULT_DISP).

Splitting (or not) the pipe changes the way DC calculates cursor
movements and its position, as we can see in
dcn10_set_cursor_position(). In addition, it's possible to reproduce the
same issue found on DCN 3.0.1 by setting DCN 2.1 to avoid pipe splitting
plus rotating the screen to any angle different from zero. However, from
my experiments, setting DCN 3.0.1 to a different pipe split policy makes
the system unstable and causes GPU reset (even though DYNAMIC seems to
be the default policy for DC).

I see that plugging/unplugging the charger changed the intensity of
these artifacts and also see some temporary changes with different power
performance settings. Keeping that in mind, I verified calculations and
register updates related to cursor movements
(dcn10_set_cursor_position(), hubp2_cursor_set_position()), and we can
see that some clk values participates in the final result of
dst_x_offset. After halving dst_x_offset, the artifacts no longer appear
and it solves the problem when pipe splitting is not allowed.

This change doesn't affect the correct behavior with more than one pipe,
but may affect the optimal setup of bandwidth and clocks. Perhaps, the
current values doesn't deliver the right performance when the pipe is
not split and halving dst_x_offset is exactly the right step for only
one pipe, but not for pipe split. 

Finally, if this is not the right solution, I appreciate any feedback to
address this problem correctly.

Thanks,

Melissa

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 4566bc7abf17..1ff85d81237e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -1018,7 +1018,7 @@ void hubp2_cursor_set_position(
 		src_y_offset = y_pos - (cursor_height - y_hotspot);
 	}
 
-	dst_x_offset = (src_x_offset >= 0) ? src_x_offset : 0;
+	dst_x_offset = (src_x_offset >= 0) ? src_x_offset / 2 : 0;
 	dst_x_offset *= param->ref_clk_khz;
 	dst_x_offset /= param->pixel_clk_khz;
 
-- 
2.39.0

