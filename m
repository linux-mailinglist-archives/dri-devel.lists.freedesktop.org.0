Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C4673A83
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207D10E93E;
	Thu, 19 Jan 2023 13:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A058410E932
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cCRPUE11I9wW6gD+lY0+1Jt5X4C0ntbc38lYEy0+g/A=; b=15TLyCCWQtQEJR3z4yDIfqLMgP
 JaVqVFodu42tudZ8L/Ko/nuZTv2buHzhIjCjisR/vTpsphfa43AAays8wddolbEto9xofoW1/N+iG
 PbqWKI7Uxu4GAJczSEv5YZSeqRquA8SXEoAvmB8aY2Y5PypGk8hhuw/XdmFdZZHS+2xeyYBunZa2q
 1YWbE18e5u9mJzpIluDXIF4MhUg59zuh6vAsH5kVEaXYsaJsPMIB4zfi62URrvPpHFEvttru2geWP
 zpZyCSxvVu7ZUgU9mPnPdfoVS8gRrcPqeVuigcU//zmTvr7uMaR2GkV79PAQugGbwGFj3IrYLoBW1
 MUUhzclg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pIV8H-0016bd-AX; Thu, 19 Jan 2023 15:39:09 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/4] drm/tegra: firewall: Check for is_addr_reg existence in
 IMM check
Date: Thu, 19 Jan 2023 15:39:01 +0200
Message-Id: <20230119133901.1892413-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119133901.1892413-1-cyndis@kapsi.fi>
References: <20230119133901.1892413-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

In the IMM opcode check, don't call is_addr_reg if it's not set.

Fixes: 8cc95f3fd35e ("drm/tegra: Add job firewall")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/firewall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/firewall.c b/drivers/gpu/drm/tegra/firewall.c
index 1824d2db0e2c..d53f890fa689 100644
--- a/drivers/gpu/drm/tegra/firewall.c
+++ b/drivers/gpu/drm/tegra/firewall.c
@@ -97,6 +97,9 @@ static int fw_check_regs_imm(struct tegra_drm_firewall *fw, u32 offset)
 {
 	bool is_addr;
 
+	if (!fw->client->ops->is_addr_reg)
+		return 0;
+
 	is_addr = fw->client->ops->is_addr_reg(fw->client->base.dev, fw->class,
 					       offset);
 	if (is_addr)
-- 
2.39.0

