Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B801E0464
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 03:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8B389C55;
	Mon, 25 May 2020 01:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A7089C53
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 01:29:34 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id l20so16001176ilj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R71dV7S9rJQPlMHMjk6Vu0NBsTKVA0V6AR1/+ijdTXU=;
 b=YG0i9AGd6c2S5ULFReX3uDyCO0YWpEQCkwusIvHlXGkiFJT+GtuhdBKe9bqYDEGHPb
 E3+x+B/bMoy6IQPVjsI7AggtSBmpul1UTgun/A+Q2EOnJlbgXz7On0eFGyvM62Jcq7TB
 0e6p3z/qn1cDJ54BSMybkDq/gImwKoRitLte8r8ujFU5kvQuKUP/haYS5ztBh5IQkiDh
 eBo7a6dG4doC9fuPhpq6/5Veb5dmh532DftU9nhEHXRZwxNZ3Cxd0qrGxDy/Q1dv6Smw
 mYrc1BOsvh5Me6Ghy6A/PUZTwGaIkt67xwxK5HvPqmsw4BnfM8sJ5IpaaJ+eBhTnJ38Z
 AM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R71dV7S9rJQPlMHMjk6Vu0NBsTKVA0V6AR1/+ijdTXU=;
 b=dN+aJZisHpL9ezOKgNAvFM6F4plPm5H5DpjV08/LBOTuXzw4jjvXIrzBFtoCpibmWn
 rgGmQPsaXZioboJBT6ZMtW5lME1zlTxpVVCxJrCE1VQ9Q4Q8e0XNt3Utlo4eR+X9oPEl
 lcy3UuMvZGUY7S9yA8EO23vYXYK2ZB5OB3jW/kZxBbLFm/mHGKn7VCpyO5vLw3879KEF
 m5w0h7hP2pIwNo8ZYRQXHfyec/XMjqTwDdvZUTj37cT2nUd0g9BwCFVDPjpYPfPvebbL
 MjqnbIfL7uS/+I3UQ2ZnA02COILbK8jX12zxtFkxb208kc4Wi+eOJXLiegauZk6FU887
 BCVw==
X-Gm-Message-State: AOAM533Upcb6gfJZlI2NZ5Q2lN8srg9PyoMEbK3oleiKErVAlGpI3Gdf
 NHDO4+yXRpsaTM8noh05MUWWBXYbVjM=
X-Google-Smtp-Source: ABdhPJypDVQv9J77hH8HwSGLN96MDsXiBlnK/6+cLrJxFiV/47Xdl8IvjqMmRo6j1STXYHmMcm0URg==
X-Received: by 2002:a92:da52:: with SMTP id p18mr23324203ilq.173.1590370173505; 
 Sun, 24 May 2020 18:29:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-23.hlrn.qwest.net.
 [71.218.100.23])
 by smtp.gmail.com with ESMTPSA id t10sm8396302ilq.62.2020.05.24.18.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 18:29:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH] drm/vc4: hdmi: Silence pixel clock error on
 -EPROBE_DEFER
Date: Sun, 24 May 2020 19:28:59 -0600
Message-Id: <20200525012859.267433-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the vc4 hdmi driver loads before the pixel clock is available we
see a spurious "*ERROR* Failed to get pixel clock" error.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
no response in over 2 weeks
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 340719238753..6d4ee3f6b445 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1338,8 +1338,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdmi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(hdmi->pixel_clock)) {
-		DRM_ERROR("Failed to get pixel clock\n");
-		return PTR_ERR(hdmi->pixel_clock);
+		ret = PTR_ERR(hdmi->pixel_clock);
+		if (ret != -EPROBE_DEFER)
+			DRM_ERROR("Failed to get pixel clock\n");
+		return ret;
 	}
 	hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(hdmi->hsm_clock)) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
