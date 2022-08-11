Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C9590088
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3BB4699;
	Thu, 11 Aug 2022 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089BB46A9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:44:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DC29616E3;
 Thu, 11 Aug 2022 15:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD98EC433D6;
 Thu, 11 Aug 2022 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232641;
 bh=oWt4bHA0SKEbzA6rHRAU0Mg9sn9j7BULLOUuu1JNWrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sbXkOZgNER6M/ag9mM8sml0QtIWR3lt9pkXDkY5Foyj97AUElHmkyHZT+ESI7QAy3
 ekpyOxiyojHStgNolhO3L4nDtqLcUVGxAG2yuLoLeiSwKvH+L1YzagEXvytvYhcDQU
 HPk2UUKa/6H9ukR2FCnfoRgIw5Hc6WzRBbiZ1F6hMwwWrrQRlxQ/Spgpm9nMzMfsRu
 ga8LiXzA4lkiXVykPnjy3Tb6e2CnKnnfqVDYk3Bg1VV9rMd+bzWl5AVmgu96LWQMB8
 MeEQdoFaXcIEzCIcu1gidBMvnQUOwMin2q7RpuWIK82kU2IlJLoY/Sr6V6qw9aWyhe
 ctvHO4U7vzqHQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 13/93] drm/probe-helper: Default to 640x480 if no
 EDID on DP
Date: Thu, 11 Aug 2022 11:41:07 -0400
Message-Id: <20220811154237.1531313-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, airlied@linux.ie,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit fae7d186403ee5a9375ec75938e0de99718e066a ]

If we're unable to read the EDID for a display because it's corrupt /
bogus / invalid then we'll add a set of standard modes for the
display. Since we have no true information about the connected
display, these modes are essentially guesses but better than nothing.
At the moment, none of the modes returned is marked as preferred, but
the modes are sorted such that the higher resolution modes are listed
first.

When userspace sees these modes presented by the kernel it needs to
figure out which one to pick. At least one userspace, ChromeOS [1]
seems to use the rules (which seem pretty reasonable):
1. Try to pick the first mode marked as preferred.
2. Try to pick the mode which matches the first detailed timing
   descriptor in the EDID.
3. If no modes were marked as preferred then pick the first mode.

Unfortunately, userspace's rules combined with what the kernel is
doing causes us to fail section 4.2.2.6 (EDID Corruption Detection) of
the DP 1.4a Link CTS. That test case says that, while it's OK to allow
some implementation-specific fall-back modes if the EDID is bad that
userspace should _default_ to 640x480.

Let's fix this by marking 640x480 as default for DP in the no-EDID
case.

NOTES:
- In the discussion around v3 of this patch [2] there was talk about
  solving this in userspace and I even implemented a patch that would
  have solved this for ChromeOS, but then the discussion turned back
  to solving this in the kernel.
- Also in the discussion of v3 [2] it was requested to limit this
  change to just DP since folks were worried that it would break some
  subtle corner case on VGA or HDMI.

[1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488
[2] https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..2c7902b16321 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -516,8 +516,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		count = drm_add_override_edid_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
-			   connector->status == connector_status_unknown))
+			   connector->status == connector_status_unknown)) {
 		count = drm_add_modes_noedid(connector, 1024, 768);
+
+		/*
+		 * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
+		 * Link CTS specifies that 640x480 (the official "failsafe"
+		 * mode) needs to be the default if there's no EDID.
+		 */
+		if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+			drm_set_preferred_mode(connector, 640, 480);
+	}
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count == 0)
 		goto prune;
-- 
2.35.1

