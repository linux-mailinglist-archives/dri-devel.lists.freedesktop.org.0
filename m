Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB8401561
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 06:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3661589A32;
	Mon,  6 Sep 2021 04:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945E589973;
 Mon,  6 Sep 2021 04:13:22 +0000 (UTC)
Received: from localhost.localdomain (1-171-98-108.dynamic-ip.hinet.net
 [1.171.98.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 960BE3F245; 
 Mon,  6 Sep 2021 04:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630901600;
 bh=aMyOs5KURw0ylNVRy7PWd+JnRcqnOEgyA7dtb08/Cp8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=A9+QKld1uCsIVfE7kIQEAjCKwCAcUwjJDbK3EbExPWjfmsCRIExsEelE/4zdclKm0
 i8KI9qBJciphkEf51w/7R7pmpXagbetc0v6He5jfaT9PMQW3rVUpIULhp4sLQZ1TuR
 CeBh+uNtY3U8BTptq4kRy9O5II2KUkqnUu0a3DeFYiRR7pXIyyXLh/MQkHNFo/AY+P
 sPqlQ7mLVLE/owlv+LPt4PM2SBh4Lhh26q+TjeG/aBmyTCXPP+HKCmrxvK9fUhg7/+
 ptTLbLxKsWP8KzrpqHBszkYLshGvswsJoECAT2xbIWkWRgv9yL2QMz6GFAlyV6Z+fh
 JJFJ4FHm8YZ/A==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/audio: Use BIOS provided value for RKL HDA link
Date: Mon,  6 Sep 2021 12:12:59 +0800
Message-Id: <20210906041300.508458-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.32.0
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

Commit 989634fb49ad ("drm/i915/audio: set HDA link parameters in
driver") makes HDMI audio on Lenovo P350 disappear.

So in addition to TGL, extend the logic to RKL to use BIOS provided
value to fix the regression.

Fixes: 989634fb49ad ("drm/i915/audio: set HDA link parameters in driver")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 532237588511..4e0f96bf6158 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -1308,8 +1308,9 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
 		else
 			aud_freq = aud_freq_init;
 
-		/* use BIOS provided value for TGL unless it is a known bad value */
-		if (IS_TIGERLAKE(dev_priv) && aud_freq_init != AUD_FREQ_TGL_BROKEN)
+		/* use BIOS provided value for TGL and RKL unless it is a known bad value */
+		if ((IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv)) &&
+		    aud_freq_init != AUD_FREQ_TGL_BROKEN)
 			aud_freq = aud_freq_init;
 
 		drm_dbg_kms(&dev_priv->drm, "use AUD_FREQ_CNTRL of 0x%x (init value 0x%x)\n",
-- 
2.32.0

