Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7944BC0B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575C72BC5;
	Wed, 10 Nov 2021 07:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 10 Nov 2021 07:16:32 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0210B72BBD;
 Wed, 10 Nov 2021 07:16:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1636528228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52hDwFdHAjiZoG9Q/bzx1ezVMXrxPGDvDEDmf2w9Y78=;
 b=xDahg9GRMSpf03AEb/QIANJDqVfuDNgbznz1T8OVJ4PhZyjBhYHiKV0k/gCdhsJOzhi81d
 Mejw21OvY0CTv4WdC2zjDP5+Xvy7pmTcUWPV4KNbMoTc5Pv2y4NlR1SDekHrhZ9u4CGy9W
 ppXszT/mMkmOkHe4GRXMdhpwZG7ZA+g=
From: Jackie Liu <liu.yun@linux.dev>
To: robdclark@gmail.com,
	sean@poorly.run,
	airlied@linux.ie
Subject: [PATCH 2/3] drm/msm/dp: displayPort driver need algorithm rational
Date: Wed, 10 Nov 2021 15:09:49 +0800
Message-Id: <20211110070950.3355597-2-liu.yun@linux.dev>
In-Reply-To: <20211110070950.3355597-1-liu.yun@linux.dev>
References: <20211110070950.3355597-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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
Cc: architt@codeaurora.org, liu.yun@linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 chandanu@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jackie Liu <liuyun01@kylinos.cn>

Let's select RATIONAL with dp driver. avoid like:

[...]
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/dp/dp_catalog.o: in function `dp_catalog_ctrl_config_msa':
dp_catalog.c:(.text+0x57e): undefined reference to `rational_best_approximation'

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Reported-by: kernelbot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index ae11061727ff..617dcb799156 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -65,6 +65,7 @@ config DRM_MSM_HDMI_HDCP
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	select RATIONAL
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external
-- 
2.25.1

