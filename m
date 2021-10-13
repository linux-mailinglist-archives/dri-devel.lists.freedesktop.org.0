Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11642C3B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCAA6EA00;
	Wed, 13 Oct 2021 14:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9126E875
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:41:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E372561164;
 Wed, 13 Oct 2021 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634136112;
 bh=FnygDVALxuB6jzfdbNL9ETJk+t+tvoto1moRUkWnoa4=;
 h=From:To:Cc:Subject:Date:From;
 b=blmtjwVQ44gx2yksClstXIIuCIKlj42Zg4rAXRmJbWq1jWfUHvwsNV1usBK/b+KoS
 Xm36wyw7WogQiiIK6XZ3PSBLcsC6rl2DfzWsRzVWIRIiRieZCKVYoaKWoUnbYuZqx8
 OSiXJX+jGfaR7L1jX+NVL8tSkNGzDw1DblD4lQS1hBjUJbddYpxZnbdkcxBOW2IgaD
 OL3yWPnPjCDviqhkN9915JLQQz5mvcmrlY0VKF42opvMg9WPw6YDtydX+gZDAMQi5X
 thyDojZd++nO5AzUbPbN45fdvirIKUdNGrOwWyGemtIA2OmLTfV/u6h1S9VjBiCon2
 59jTZa2hxWBuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: mark nvdec PM functions as __maybe_unused
Date: Wed, 13 Oct 2021 16:41:36 +0200
Message-Id: <20211013144148.2208472-1-arnd@kernel.org>
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

The resume helper is called conditionally and causes a harmless
warning when stubbed out:

drivers/gpu/drm/tegra/nvdec.c:240:12: error: 'nvdec_runtime_resume' defined but not used [-Werror=unused-function]
  240 | static int nvdec_runtime_resume(struct device *dev)

Mark both suspend and resume as __maybe_unused for consistency
to avoid this warning.

Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/nvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 30105a93de9f..791bf1acf5f0 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -238,7 +238,7 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 }
 
 
-static int nvdec_runtime_resume(struct device *dev)
+static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 	int err;
@@ -264,7 +264,7 @@ static int nvdec_runtime_resume(struct device *dev)
 	return err;
 }
 
-static int nvdec_runtime_suspend(struct device *dev)
+static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 
-- 
2.29.2

