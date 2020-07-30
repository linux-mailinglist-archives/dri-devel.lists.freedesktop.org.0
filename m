Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52F234018
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922826E9FA;
	Fri, 31 Jul 2020 07:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09E6E915
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1596120517; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qt3g3tEVpW7ed636/4tctSkOhvgTtF4IyDUbEY1/K24=;
 b=iyjT2kOLlcBMF51VsqjIRvQl4qzXQLULQ97FlzLdnj4Xc7sjsxYrccGYbWGIsYp689mmwi
 ayjn9IJx1ssEL6eBL3mz6GnsuLdYSCDnr2pWs7VphhSiSDopBF/8my7PAfHbrAZCS3m0+a
 nCqyg175MIoL8OnbUhjLrsvyAJZ0LnA=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/ingenic: ipu: Remove YUV422 from supported formats
 on JZ4725B
Date: Thu, 30 Jul 2020 16:48:29 +0200
Message-Id: <20200730144830.10479-3-paul@crapouillou.net>
In-Reply-To: <20200730144830.10479-1-paul@crapouillou.net>
References: <20200730144830.10479-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When configuring the IPU for packed YUV 4:2:2, depending on the scaling
ratios given by the source and destination resolutions, it is possible
to crash the IPU block, to the point where a software reset of the IP
does not fix it. This can happen anytime, in the first few frames, or
after dozens of minutes. The same crash also happens when the IPU is
fully controlled by the LCD controller (in that case no HW register is
written at any moment after startup), which points towards a hardware
bug.

Thanksfully multiplanar YUV is not affected.

Until this bug is fixed or worked around, address this issue by removing
support for YUV 4:2:2 on the IPU of the JZ4725B.

v2: Update commit message (remove the "crash beyond repair" bit)

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 7eae56fa92ea..7dd2a6ae4994 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -795,10 +795,16 @@ static int ingenic_ipu_remove(struct platform_device *pdev)
 }
 
 static const u32 jz4725b_ipu_formats[] = {
+	/*
+	 * While officially supported, packed YUV 4:2:2 formats can cause
+	 * random hardware crashes on JZ4725B under certain circumstances.
+	 * It seems to happen with some specific resize ratios.
+	 * Until a proper workaround or fix is found, disable these formats.
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_YVYU,
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_VYUY,
+	*/
 	DRM_FORMAT_YUV411,
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV422,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
