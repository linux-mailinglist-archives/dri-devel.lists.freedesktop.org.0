Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE4D182788
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 04:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F3B6E239;
	Thu, 12 Mar 2020 03:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5A6E239;
 Thu, 12 Mar 2020 03:52:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m33so3324208qtb.3;
 Wed, 11 Mar 2020 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KQg257bFU/54D8sZD22vQvVkmqU+8hmHZdOg7G3dJQ4=;
 b=TcIxJvpOUP/f+7MPbEGA4d+S0Zxx5fuLASCk1047vjuKQBiyWaRR7fJmmW637eBk5P
 DIi6ZuWmL6nfYbHDTybLBkrk9tEfPWYuonggc6wFzSEhPzNeh7PpC8OY8CshPSbQENl0
 ubbOVZ6pk39VI/sk6bwZXFCOq0nmi23wi1R4kODWy7JY8gwjyOiLyfPETafK/MxiRajH
 8IhtMhmffv1RXh3LysaVC4+PD1P8vMOuCBv9/vcRraqaJg4Chg0VeqX/MqtZ8/14yEgY
 i1dAcPpR326qbjxajTL33jt22gojvFa7P0rDJzjrHxSKePi3sNb0RsFiYRmdrxqgFkmB
 E24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KQg257bFU/54D8sZD22vQvVkmqU+8hmHZdOg7G3dJQ4=;
 b=UXOylac6JKON7doo/QNiTje08DCRgK9zRLGwgEagKtvIGo8OB+BlMNbyflyI23DLyZ
 bWYads/8HDDJVplAz+Sf6uVtkw5UoF7GMsuDubsL19oI2KFLuw+AAHoYTJj3mqYDT5cW
 dJRMKjylt4QsCaJHDQ4l7xO39vBiOKEAqCNZtB/ipk1G62XBKBvwrYZ4VgMSZ2aW35Q4
 nvBhZxKnVFTEIbgpCAhXs7xBBToalnY6C51kTVaT6a0zgmMRTHZl9XicnIftoZDvE00P
 kbSZTSYgqoiHBLsBL7jRNPcxmqgwUpc0nBURt0Ox5Dh7Kxx8j+5kC0c5TZ66aDhx5w4i
 N5ug==
X-Gm-Message-State: ANhLgQ126jUE4CunqnB/5XNOZ7157IyWBfsZXQrY5qGS0hj8TzRrUaSB
 Ts9IeItfbOHBe9xVgWodektrJodz7LE=
X-Google-Smtp-Source: ADFU+vtj53M9tfsuivBLtWhYCrZBup+7hHZahjU3LIYwZDJagukCdl1qw81rCRN0nwK8SPWKPjAi3Q==
X-Received: by 2002:ac8:6708:: with SMTP id e8mr5484258qtp.229.1583985140745; 
 Wed, 11 Mar 2020 20:52:20 -0700 (PDT)
Received: from athos.hellosponsor.com
 (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
 by smtp.gmail.com with ESMTPSA id x1sm7836250qkl.128.2020.03.11.20.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 20:52:20 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm: avoid double-attaching hdmi/edp bridges
Date: Wed, 11 Mar 2020 23:51:54 -0400
Message-Id: <20200312035154.1621-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each of hdmi and edp are already attached in msm_*_bridge_init. A second
attachment returns -EBUSY, failing the driver load.

Tested with HDMI on IFC6410 (APQ8064 / MDP4), but eDP case should be
analogous.

Fixes: 3ef2f119bd3ed (drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder)
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 drivers/gpu/drm/msm/edp/edp.c   | 4 ----
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
index ad4e963ccd9b..106a67473af5 100644
--- a/drivers/gpu/drm/msm/edp/edp.c
+++ b/drivers/gpu/drm/msm/edp/edp.c
@@ -178,10 +178,6 @@ int msm_edp_modeset_init(struct msm_edp *edp, struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, edp->bridge, NULL);
-	if (ret)
-		goto fail;
-
 	priv->bridges[priv->num_bridges++]       = edp->bridge;
 	priv->connectors[priv->num_connectors++] = edp->connector;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 1a9b6289637d..737453b6e596 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -327,10 +327,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = drm_bridge_attach(encoder, hdmi->bridge, NULL);
-	if (ret)
-		goto fail;
-
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 	priv->connectors[priv->num_connectors++] = hdmi->connector;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
