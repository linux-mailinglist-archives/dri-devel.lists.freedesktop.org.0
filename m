Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DEC17DA5C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0D89EA3;
	Mon,  9 Mar 2020 08:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD0E89F27
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 22:38:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f13so7979927ljp.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=756rkPJJl2bGPuKXslFucuMnGYV6EvOGDv872EgSIk4=;
 b=Dvm1pJzgRCqs5/znIAA6QdOvIEEvaI0HDuiwH2jMGSLc5tETgXc++bKdyGSg64NlAx
 mQn48NOIYUbPvwM14wl61MFZsMIHV9g7hyNXLn7esUKQEljSlTNDba/gyySMPe+VFYXP
 V3fBAfAwefXSq90PP0qfYFJwhpX87CbT/NTCQDkexiVHiJQYqGSDL8OvhCgxQMUBTxO1
 9oj8MzHkDD0PYCSO+VUlnvdZYP4S2O0iz8la/Xy8fnFRGeGeaGZtFYXEGTRa6G2i+gih
 se2WWdgNQZjMs/JEC37M5abtZj/inhW9AmWbkbp0gUh/KSZvKgFFXf4rshuEO5iUwIjt
 83gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=756rkPJJl2bGPuKXslFucuMnGYV6EvOGDv872EgSIk4=;
 b=aHpfxcwRPlCu4kgdVubDv1s1FuB/nCJrSYVs9lx0vUD2h37XVgQ8w/JaLnh0BDCd38
 HVDPlT89FtuKjrgHy56GskrYoWCDmMOnP5wR5YQZ0gjVKwfbzD/YOkoX/+/xwCbPArux
 rtnhXPu12dadN7U867dN9p2GrgsX67IRt56S+fruYxZltaHpW1elfnxJNMnN/a2eopJO
 UyD6xfA1Qh6+92Vwr3NHHw/5/cKhBQM2TeofYmhXeciGyD/Je9Yp0n/0e5oQFqy1hH2v
 H8pWVlGZ8Q+ZIxBUvuMBtqE1XBwNhjvcDmPRiBYg8Q+QUQm96dr4t6aduwtO7EBUjwoF
 8Wug==
X-Gm-Message-State: ANhLgQ1xJ1KuANFKKBK41RAuLs8f3qqI2qcdOcJE9ZxYyxwhdbRRtd7T
 6JE72Cutmiqm4hMy3Qype6w=
X-Google-Smtp-Source: ADFU+vvq2IKLjdguf2Yq2iAXj8IWRfLLbzwjgXMzUeZtZ0Ut1yCz9+H8DOWxDcHvROoD6dJxfghnnQ==
X-Received: by 2002:a2e:7c04:: with SMTP id x4mr8307885ljc.60.1583707111582;
 Sun, 08 Mar 2020 15:38:31 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 15:38:31 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 2/3] drm/tegra: dc: Release PM and RGB output when client's
 registration fails
Date: Mon,  9 Mar 2020 01:38:08 +0300
Message-Id: <20200308223809.23549-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200308223809.23549-1-digetx@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Runtime PM and RGB output need to be released when host1x client
registration fails. The releasing is missed in the code, let's correct it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 257163dda301..56d933e81797 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2586,10 +2586,16 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto disable_pm;
 	}
 
 	return 0;
+
+disable_pm:
+	pm_runtime_disable(&pdev->dev);
+	tegra_dc_rgb_remove(dc);
+
+	return err;
 }
 
 static int tegra_dc_remove(struct platform_device *pdev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
