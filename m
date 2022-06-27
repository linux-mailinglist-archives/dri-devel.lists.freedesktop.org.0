Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909055BA6A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B1710FCCB;
	Mon, 27 Jun 2022 14:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56E110FD87
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mTP9JKWbQi5X9Aiy3D3CFclT8K0qf8xcDbui6f15aq4=; b=W6sqRIxxffo0n30C1l7/fNRAmD
 BZCgVLH7F8ugAgt15IDudG2LwMVm2HLIjKFSNyo/RGTwsxeZXFJuOwqUyFrEklUIsBK2nEvjvAc1B
 VRu8xBrK0DEHlJWwrhrJ+bYeuLw1dkxoX3ZNJCUlTE8QzZY2PsM2CiwcmqPFEQ94jv2OxUpqw9rMA
 IyUwyct/W6JSoFHxz1+s+RqM68+yQouW16bHIRz2JgHZG+Kapnp2JMbP2OXTPBlUQbTSgX5+yHU39
 nB3V9Xw3uHjNIWG92tIrOqpRyke+NRKYKJ3OBpHGz/29ZHzwfjt7tqXUWbklh2Zu5PTYIvUkplE3/
 rRctnsPQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1o5pbO-003N2J-7w; Mon, 27 Jun 2022 17:20:33 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7/v3 16/22] gpu: host1x: Allow reset to be missing
Date: Mon, 27 Jun 2022 17:20:02 +0300
Message-Id: <20220627142008.2072474-17-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Host1x on Tegra234 does not have a software-controllable reset line.
As such, don't bail out if we don't find one in the device tree.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 5a57165ab0f6..c28939850bf6 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -423,9 +423,6 @@ static int host1x_get_resets(struct host1x *host)
 		return err;
 	}
 
-	if (WARN_ON(!host->resets[1].rstc))
-		return -ENOENT;
-
 	return 0;
 }
 
-- 
2.36.1

