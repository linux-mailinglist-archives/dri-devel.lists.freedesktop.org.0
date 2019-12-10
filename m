Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9248119382
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80C6E952;
	Tue, 10 Dec 2019 21:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948C6E952
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:12:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33B3D222C4;
 Tue, 10 Dec 2019 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576011881;
 bh=wGLr9TQaZb4mysbQ1RUTvwzfb1gr3SQoaCDKmcFNx0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KaWGeyDSwgZYLhj5P2hXYJa3/NZWSlei7a2H4ZytYFpJduEBYU+nDhEZKuzl2wciu
 09PFR8cWN2jAM94I0xGiO6qBnrSugH8IsOcCZ9PtFMv49EtqVxelaB3U1xNLzN0Lmq
 euQFHXAkYD0NYzsYYks3S6gNlWycksIntVaY+c+8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 032/350] drm/komeda: Workaround for broken
 FLIP_COMPLETE timestamps
Date: Tue, 10 Dec 2019 15:58:44 -0500
Message-Id: <20191210210402.8367-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210402.8367-1-sashal@kernel.org>
References: <20191210210402.8367-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, James Qian Wang <james.qian.wang@arm.com>,
 Ayan kumar halder <ayan.halder@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mihail Atanassov <Mihail.Atanassov@arm.com>

[ Upstream commit f59769c52cd7d158df53487ec2936f5592073340 ]

When initially turning a crtc on, drm_reset_vblank_timestamp will
set the vblank timestamp to 0 for any driver that doesn't provide
a ->get_vblank_timestamp() hook.

Unfortunately, the FLIP_COMPLETE event depends on that timestamp,
and the only way to regenerate a valid one is to have vblank
interrupts enabled and have a valid in-ISR call to
drm_crtc_handle_vblank.

Additionally, if the user doesn't request vblanks but _does_ request
FLIP_COMPLETE events, we still don't have a good timestamp: it'll be the
same stamp as the last vblank one.

Work around the issue by always enabling vblanks when the CRTC is on.
Reducing the amount of time that PL0 has to be unmasked would be nice to
fix at a later time.

Changes since v1 [https://patchwork.freedesktop.org/patch/331727/]:
 - moved drm_crtc_vblank_put call to the ->atomic_disable() hook

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
Signed-off-by: Ayan kumar halder <ayan.halder@arm.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191001142121.13939-1-mihail.atanassov@arm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 624d257da20f8..52c42569a111f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -250,6 +250,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	komeda_crtc_prepare(to_kcrtc(crtc));
 	drm_crtc_vblank_on(crtc);
+	WARN_ON(drm_crtc_vblank_get(crtc));
 	komeda_crtc_do_flush(crtc, old);
 }
 
@@ -319,6 +320,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
 		}
 	}
 
+	drm_crtc_vblank_put(crtc);
 	drm_crtc_vblank_off(crtc);
 	komeda_crtc_unprepare(kcrtc);
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
