Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0B7F74CF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 14:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1B10E7DD;
	Fri, 24 Nov 2023 13:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADFC10E7DD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 13:21:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D631EB830A1;
 Fri, 24 Nov 2023 13:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A84BC433AD;
 Fri, 24 Nov 2023 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1700832059;
 bh=sEoj9n53qRs/A2Kl+/8b56M1qG901NPWD6gfWCRPhk0=;
 h=Subject:To:Cc:From:Date:From;
 b=UPO9t34gZw4LSbDGycF4Vo6GXdhF11oPkyFTQzuNyHLLCnS0yxwMZF7tKfUyJHM4U
 USfxqkWVVa6fdc49RqMkkdBuadbLjfX6Gw+MFOEuDmitkCYsnZF60uCAb6SY+apUKZ
 pHNGIUEH4368RVLxPedYZPEkMzyAQcVn6qbSHEzY=
Subject: Patch "drm/mediatek/dp: fix memory leak on ->get_edid callback audio
 detection" has been added to the 6.6-stable tree
To: angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 granquet@baylibre.com, gregkh@linuxfoundation.org, jani.nikula@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, rex-bc.chen@mediatek.com,
 wenst@chromium.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 24 Nov 2023 13:18:58 +0000
Message-ID: <2023112458-thirty-suffocate-b88f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From dab12fa8d2bd3868cf2de485ed15a3feef28a13d Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Thu, 14 Sep 2023 18:53:17 +0300
Subject: drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection

From: Jani Nikula <jani.nikula@intel.com>

commit dab12fa8d2bd3868cf2de485ed15a3feef28a13d upstream.

The sads returned by drm_edid_to_sad() needs to be freed.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20230914155317.2511876-1-jani.nikula@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2034,7 +2034,6 @@ static struct edid *mtk_dp_get_edid(stru
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
@@ -2053,7 +2052,11 @@ static struct edid *mtk_dp_get_edid(stru
 	}
 
 	if (new_edid) {
+		struct cea_sad *sads;
+
 		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		kfree(sads);
+
 		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
 	}
 


Patches currently in stable-queue which might be from jani.nikula@intel.com are

queue-6.6/drm-msm-dp-skip-validity-check-for-dp-cts-edid-check.patch
queue-6.6/i915-perf-fix-null-deref-bugs-with-drm_dbg-calls.patch
queue-6.6/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-error-path.patch
queue-6.6/drm-edid-fixup-h-vsync_end-instead-of-h-vtotal.patch
queue-6.6/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
queue-6.6/drm-i915-mtl-avoid-stringop-overflow-warning.patch
queue-6.6/drm-i915-tc-fix-wformat-truncation-in-intel_tc_port_.patch
