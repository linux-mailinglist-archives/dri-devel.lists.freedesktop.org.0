Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD57528132
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022BA10E790;
	Mon, 16 May 2022 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C110E798
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pGQX1JKxanPmqedEue8d2htEoS8AyrUnifwuz1TiUYY=; b=stj2aNYDMNKtVVFXkAJyNwiVwE
 5jmjneZb5CXQlIaAfydH3UNASfeBHXJcLNzbvqYwsBt2IrRd9XfI+1teMYw5QlVX5eqDFFjnFJeXO
 QTdBoeSqgSkHaJzS3Pz2gQPsDt7oGbRlvvMOFUF8dP8ZqOD0ul8dfjg2JmQu91KrDV9VHotNsjAbI
 QTJYH9rOwmmOZ5V3l0OXeu4AluaJosZCBME2vLXAKa+bmjW4pVVpIR7H/6gt/dVZel1Svrb0Xk39P
 rup9+leHFKAvzB912bBW6/1wYRtxqRgmgHyyz6pB+gj+cDkEuAbntk1l8rP3GMvxuyRaBRQWh1dEW
 xZSey3CQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYg-0005yU-O8; Mon, 16 May 2022 13:02:34 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 12/13] gpu: host1x: Use RESTART_W to skip timed out jobs on
 Tegra186+
Date: Mon, 16 May 2022 13:02:12 +0300
Message-Id: <20220516100213.1536571-13-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516100213.1536571-1-cyndis@kapsi.fi>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

When MLOCK enforcement is enabled, the 0-word write currently done
is rejected by the hardware outside of an MLOCK region. As such,
on these chips, which also have the newer, more convenient RESTART_W
opcode, use that instead to skip over the timed out job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/cdma.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 765e5aa64eb6..bb1f3c746be4 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -457,9 +457,24 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 				 * to offset 0xbad. This does nothing but
 				 * has a easily detected signature in debug
 				 * traces.
+				 *
+				 * On systems with MLOCK enforcement enabled,
+				 * the above 0 word writes would fall foul of
+				 * the enforcement. As such, in the first slot
+				 * put a RESTART_W opcode to the beginning
+				 * of the next job. We don't use this for older
+				 * chips since those only support the RESTART
+				 * opcode with inconvenient alignment requirements.
 				 */
-				mapped[2*slot+0] = 0x1bad0000;
-				mapped[2*slot+1] = 0x1bad0000;
+				if (i == 0 && host1x->info->has_wide_gather) {
+					unsigned int next_job = (job->first_get/8 + job->num_slots)
+						% HOST1X_PUSHBUFFER_SLOTS;
+					mapped[2*slot+0] = (0xd << 28) | (next_job * 2);
+					mapped[2*slot+1] = 0x0;
+				} else {
+					mapped[2*slot+0] = 0x1bad0000;
+					mapped[2*slot+1] = 0x1bad0000;
+				}
 			}
 
 			job->cancelled = true;
-- 
2.36.1

