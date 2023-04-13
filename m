Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5701C6E08D8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033110E121;
	Thu, 13 Apr 2023 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B3710E121
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KKG30S28GcImO9fjjiMWJCrRczwA06I44fh0HArJMdw=; b=cFxLsR4NhRubxrLXp8YIRnE+ty
 EaYZ+AUsoa+HvlKjdoHKeOOoIWGllAe2t4mW7TN2rs0sCcY1z0E7GgARvD29MNZ0Phb/4L3oW0cD5
 kCNvHprgvJthYCVCv7ejDkx7snyOuCp2F+PtZO7Vym6s9V3lFjGUZNkf/IFOrvE/6nqX715LSmUt/
 +jKYmqmU7S/pSPBMoyijhVaBGeWKdfuWsckjjOfwK1ru9w+tCVP+hjYjoLNBIl5aDFiyd787WARJE
 FCxOEZnWn4bE5eHHky4DyxZq188/LHvEFbrJ6t7ACkFOAeWHuUB8p6MoQLg7mTqZB9+g0wT1aD5Zl
 JLzm3FNw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pmsDc-008oPu-3l; Thu, 13 Apr 2023 11:22:12 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/tegra: Add error check for NVDEC firmware memory
 allocation
Date: Thu, 13 Apr 2023 11:22:01 +0300
Message-Id: <20230413082202.114721-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.2
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
 Dan Carpenter <error27@gmail.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

The return value for tegra_drm_alloc was missing an error check.
Add one.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index ae78a81e5eef..15ce5e89fad4 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -276,6 +276,8 @@ static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
 			return err;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
+		if (IS_ERR(virt))
+			return PTR_ERR(virt);
 	}
 
 	nvdec->falcon.firmware.virt = virt;
-- 
2.39.2

