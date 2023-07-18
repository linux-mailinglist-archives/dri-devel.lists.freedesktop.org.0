Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFEB75769B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40EB10E2F6;
	Tue, 18 Jul 2023 08:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792CC10E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:33:26 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R4sfW5gXnzBR9t3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:33:23 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689669203; x=1692261204; bh=9692ZzsrczkdihRNiWFTcjEgW54
 h208pZatp5xPJadg=; b=zsOBdYFusN0CaVsamgWdkXWQHhVVFz5+w0dZ2iIVMAT
 m/f6el4k34ESupKF1HomWsvKO6xjExtykVaK7TQoy3+Cf8PwrxC/Aqh9yebX4Q3/
 I+onZRDXZ95KoFqO5B8bksWHtp+dF6T4BcLv3REZEn9cbGvyeVh+kphWQj4AVZrZ
 x6dJLwbvT2SFAKdMEpaVI3Li4u35cgjPkSh4t+xkQGeTTURQnJJHy7lzQgzC19d1
 1h+EvIInp0f6Qm0caT5RYH3yWHWgJ/RXpbZvhN+MCyy7Pwr4RIMMjd8nmK0CTxJ2
 qYWbxye8YqBUpqF5O21XtIdYdMDb7QRc0Pq5ohebeXg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SfImNAXGWQCC for <dri-devel@lists.freedesktop.org>;
 Tue, 18 Jul 2023 16:33:23 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R4sfW1qkXzBR7bp;
 Tue, 18 Jul 2023 16:33:23 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 16:33:23 +0800
From: sunran001@208suo.com
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/msm/dsi: add missing put_device()
In-Reply-To: <20230718083149.17178-1-xujianghui@cdjrlc.com>
References: <20230718083149.17178-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <225e67f32dbc423daa4a83bc0c4f2179@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_find_device_by_node() takes a reference to the underlying device
structure, we should release that reference.

Detected by coccinelle with the following ERROR:
./drivers/gpu/drm/msm/dsi/dsi.c:50:1-7: ERROR: missing put_device; call
of_find_device_by_node on line 32, but without a corresponding object
release within this function.

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/msm/dsi/dsi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
b/drivers/gpu/drm/msm/dsi/dsi.c
index 81461e8852a7..5e3cc287f0d3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -46,7 +46,7 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
          DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", 
__func__);
          return -EPROBE_DEFER;
      }
-    put_device(&pdev->dev);
+    put_device(&phy_pdev->dev);
      return 0;
  }
