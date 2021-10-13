Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11442C3A6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAD06E069;
	Wed, 13 Oct 2021 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B726E069
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:41:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA91061154;
 Wed, 13 Oct 2021 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634136073;
 bh=tDFfvQ6Y5Er/PsDNRRoutIE4JMdB/Lr2Di5tJToSVvk=;
 h=From:To:Cc:Subject:Date:From;
 b=RVsTrvhG2JPVsb2kL67NK9nvOavH9u6hPDSZZXXb+A+TD04Ou9LEd6tqVnLgh/s35
 qgVPLdBBbb+XRmfpJ+zeh0hCSx6SMSKFe9s7l0ILjNRb1Tor6f7VEyxJMFPSGNV6Ur
 RjoG470646xpDDPt0dqE9ybNvv9sZ3CGyytIGy9XLalbYQvpcRlBr3xdlrCgEpUx0Z
 eKz1rrZApZr359084SX81RkFAH8NckRZPX7M96dLQzu4iw8IUW7dow1qn8xtyHZpNm
 PEhSzMJhW2iiW4ksUiHlMIzAuIg6ZVXzeUaMWFHWWtj+230AK0LCRjqWJ7XS/4ltUA
 OUXDoqcs4kVeg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: mark nvdec_writel as inline
Date: Wed, 13 Oct 2021 16:40:58 +0200
Message-Id: <20211013144109.2191071-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

From: Arnd Bergmann <arnd@arndb.de>

Without CONFIG_IOMMU_API, the nvdec_writel() function is
unused, causing a warning:

drivers/gpu/drm/tegra/nvdec.c:48:13: error: 'nvdec_writel' defined but not used [-Werror=unused-function]
   48 | static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned int offset)
      |             ^~~~~~~~~~~~

As this is a trivial wrapper around an inline function, mark
it as inline itself, which avoids the warning as well.

Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/nvdec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 410333e05de8..791bf1acf5f0 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -45,7 +45,8 @@ static inline struct nvdec *to_nvdec(struct tegra_drm_client *client)
 	return container_of(client, struct nvdec, client);
 }
 
-static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned int offset)
+static inline void nvdec_writel(struct nvdec *nvdec, u32 value,
+				unsigned int offset)
 {
 	writel(value, nvdec->regs + offset);
 }
-- 
2.29.2

