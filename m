Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DF3CFE5E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD7A6E0E8;
	Tue, 20 Jul 2021 15:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FB56E0E8;
 Tue, 20 Jul 2021 15:57:34 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id EFFF2408B7; 
 Tue, 20 Jul 2021 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626796652;
 bh=3II+PC97VCoKt9T8F7pnL4yTXL+6p6xVAwlLpzbPYU8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=wamHC7s9ZUcpEsWL5kOnny8dJU+Awirb8oRm5Y/2RXgjZks+aV2HQ4AeH20sGvBfr
 iKhGC44hNjMmWGN43/ATPYl6wJWfQAqCB1bdaCDGrSwlUgnRA0pblL5D5nAB+8lx8h
 ywKKsN+sAyQDiz1SIGH8oUU9j74gI1yoP+kZoVT0WORkTjdVC5omewH8nZB+hmmtjr
 jytKz61f4ZqLSA+xZa2XpSK1ppdU+nJEdGHkTggapNtj+tWO6bkIaWsPQcpyNRnPYD
 0dkR4mBDPq3vhn4HA7FNTKggBMCUW3arWN1KeozryRPMx9AoC3FkjL70jdBLZNHz8R
 tO8eAJ/BfoBzA==
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/xelpd: Fix unsigned compared to less than zero
 error
Date: Tue, 20 Jul 2021 16:57:26 +0100
Message-Id: <20210720155726.73628-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The subtraction of fw->size - offset is operating on two unsigned
integers and the result is unsigned and hence the less than zero
comparison will always to be false. Fix this by casting fw->size
from a size_t to a ssize_t to ensure the result can be signed to
allow a less than zero result.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index f8789d4543bf..dde1f243d375 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -645,7 +645,7 @@ static void parse_dmc_fw(struct drm_i915_private *dev_priv,
 			continue;
 
 		offset = readcount + dmc->dmc_info[id].dmc_offset * 4;
-		if (fw->size - offset < 0) {
+		if ((ssize_t)fw->size - offset < 0) {
 			drm_err(&dev_priv->drm, "Reading beyond the fw_size\n");
 			continue;
 		}
-- 
2.31.1

