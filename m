Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4D42F2E0A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066876E1E6;
	Tue, 12 Jan 2021 11:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329E6E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j0tFJ4PTsbEyOOS9crz150IXZd+LYRNiBCWMdF0RqTs=; b=znUFsjd4fOOeNkYwXVIBHHt2KN
 fAmkm/hDHBxv8qEVumKVWfi+DpUZTgZzKaS9mVXZr9orUnoiqBnXE5unfbvonervbsRTYqgA/Ga1T
 HgDwMNOZqxGgKqbpW3Pacz8pTFd6WNYuHed9NJkQEYtY5zd+ysW3Zbprbi3y9Lotpua35w1A6R66M
 FlNQMnE2MtGcTNR/XQSIX0ugeLJcQ8RktWg6OKGnsCjY60Bj0eRy8AfiYa5gJ5GrzmvRI1IOfoZC4
 VF9b162BHmnfo/6YS0OdKvcHPSMFuw2vyxMpajAtcrn5hAv8yF3VU75rsupUyvpj81m3aLt6VeGT3
 SavkEvlQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kzHzZ-0000zo-0q; Tue, 12 Jan 2021 13:37:41 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com
Subject: [PATCH 2/2] drm/tegra: vic: Add comments on STREAMID registers
Date: Tue, 12 Jan 2021 13:37:07 +0200
Message-Id: <20210112113707.3837876-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112113707.3837876-1-mperttunen@nvidia.com>
References: <20210112113707.3837876-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments clarifying use of the THI_STREAMID0 and THI_STREAMID1
registers.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index a3dbb8813faf..48e98a60ab6e 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -117,7 +117,19 @@ static int vic_boot(struct vic *vic)
 		if (spec->num_ids > 0) {
 			value = spec->ids[0] & 0xffff;
 
+			/*
+			 * STREAMID0 is used for input/output buffers.
+			 * Initialize it to SID_VIC in case context isolation
+			 * is not enabled, and SID_VIC is used for both firmware
+			 * and data buffers.
+			 *
+			 * If context isolation is enabled, it will be
+			 * overridden by the SETSTREAMID opcode as part of
+			 * each job.
+			 */
 			vic_writel(vic, value, VIC_THI_STREAMID0);
+
+			/* STREAMID1 is used for firmware loading. */
 			vic_writel(vic, value, VIC_THI_STREAMID1);
 		}
 	}
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
