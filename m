Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A63D3F27F0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4956EA43;
	Fri, 20 Aug 2021 07:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301FB6EA35;
 Fri, 20 Aug 2021 07:54:12 +0000 (UTC)
Received: from localhost.localdomain (1.general.khfeng.us.vpn [10.172.68.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 47A893F043; 
 Fri, 20 Aug 2021 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629446049;
 bh=ywi09jLJioHV77jNrsti8DgLUfgW57ub1lXIO6DgnXE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=uqV5aOG2xgqbTjj2P+I0fnBSCRlwHzf6pdJ9jmvbO2naQtjMxX5E+X8R3J96oKVOq
 TM5WL3mkXHKfJZ12J4oR35UXfpN942KnL19Lt8Zh3LzLL5ErytLv1LxSwCkRUmloDj
 1fmYVmTHMQ+CGM6eU21V50hrnoirR0h4ZJLlXkCuknUig/rficalZ7tgE4jgDwfLAX
 UV0+XlxxZznOT38DPK2phgMA00N99ASE9CEZ8GGiaXWADS2iqAxwjAuvnR5kAmG1b0
 1tu2AsgjaORkqJA/nc8HyBDzQBTQyuISBKENxnmQ927CUYfYqsiBuqve+5y2VLvPV4
 x3IsY/qBJawHg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Sean Paul <seanpaul@chromium.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/i915/dp: Use max params for panels < eDP 1.4
Date: Fri, 20 Aug 2021 15:52:59 +0800
Message-Id: <20210820075301.693099-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.32.0
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

Users reported that after commit 2bbd6dba84d4 ("drm/i915: Try to use
fast+narrow link on eDP again and fall back to the old max strategy on
failure"), the screen starts to have wobbly effect.

Commit a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for
everything") doesn't help either, that means the affected eDP 1.2 panels
only work with max params.

So use max params for panels < eDP 1.4 as Windows does to solve the
issue.

v3:
 - Do the eDP rev check in intel_edp_init_dpcd()

v2:
 - Check eDP 1.4 instead of DPCD 1.1 to apply max params

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3714
Fixes: 2bbd6dba84d4 ("drm/i915: Try to use fast+narrow link on eDP again and fall back to the old max strategy on failure")
Fixes: a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for everything")
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 75d4ebc669411..e0dbd35ae7bc0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2445,11 +2445,14 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	 */
 	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
 			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
-			     sizeof(intel_dp->edp_dpcd))
+			     sizeof(intel_dp->edp_dpcd)) {
 		drm_dbg_kms(&dev_priv->drm, "eDP DPCD: %*ph\n",
 			    (int)sizeof(intel_dp->edp_dpcd),
 			    intel_dp->edp_dpcd);
 
+		intel_dp->use_max_params = intel_dp->edp_dpcd[0] < DP_EDP_14;
+	}
+
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
 	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
-- 
2.32.0

