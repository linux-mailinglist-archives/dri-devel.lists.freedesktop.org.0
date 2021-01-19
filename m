Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71172FBE2F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 18:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C326E43C;
	Tue, 19 Jan 2021 17:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0116E43C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 17:47:38 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id e17so5184899qto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yeg/VtiYIWCTT8IDKqMsAHwup1ZdQsI7JD3r5qOl2Aw=;
 b=GI5mKlTTU8pn3IApiTYvorvKsArEFXZPnNbpKRIOdkE3QuQg5Lcf3g5rdV08KKFYR2
 XnfM+gReGIugL8F9eIh2pjrfNfUm4HhycmB+dhEzBcqzkcrMR2w2yttv8jQt1N3p4LJM
 ZzfWmxRBp8NRFr9eRzn9lrRXIJis61/YFhfgULs5c7yxmpPIlwIOP+Wt3b5NCcfGFiPT
 B/Fjf/edurxMYg2xm+PAu+NX2GwJ1hu8TXPNpAT1ZDwLAb198RN/m+VIxleng9VWL+3/
 7yJIm3/WMIqwU4U04/r+KAldmgqYCxIkKO/ZEFASF8BUXKW8MWtNyT5UTRYwtdQM8b6V
 8nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yeg/VtiYIWCTT8IDKqMsAHwup1ZdQsI7JD3r5qOl2Aw=;
 b=E6J89giNKDFfow4FDOnJ8ALG3m+jFyAyeXNIEVeTtnKU5vACDoQthiW6tHwkuX3+zl
 MUaAJbENhN5FsjeKVWgBnHyDPVd+E9vdeFe2gGjam3WbPQXmqpKB0V35KrvPVyYi9eqN
 g/q3tzAeMSanGD0PP6escvvPmMYwiCJ0ioRtCs9sKPDNs2F82Kj1/tsWyjad7FAFx2DX
 PccklmsFKcDvkqDQTSLHkMkf5AJDxTeCv37MjTUzKfQqMy7Vqg3OQnqbgKc0aB5PCBr4
 +Bre82MzusOJ4Q261qG+yZMAPs4988/py6rh2kZFqiu8KOY4D+0GzRGouCrkReEw2uBy
 mdDw==
X-Gm-Message-State: AOAM531ekszjcz/TjmLR1x7phnc0CqBlam2FUk2z4JVXkKAbeM9HKYU2
 OAqvHHNVIbHzmIocl7lXxoIH20AOFbM=
X-Google-Smtp-Source: ABdhPJyfGQZt3zTLX+BWFBt7zR0QnEIrt8r94am/1p/rkOnHgjtoNgZ1JF/XwqKJ3FSLVWhhl+vOJw==
X-Received: by 2002:aed:2e47:: with SMTP id j65mr5352944qtd.231.1611078457170; 
 Tue, 19 Jan 2021 09:47:37 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id u5sm13501582qkb.120.2021.01.19.09.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:47:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm: Call shutdown conditionally
Date: Tue, 19 Jan 2021 14:44:55 -0300
Message-Id: <20210119174455.2423205-1-festevam@gmail.com>
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
Cc: mkrishn@codeaurora.org, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, stable@vger.kernel.org, kernel@pengutronix.de,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling the drm_atomic_helper_shutdown() on i.MX5 leads to
the following flow:

[   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
(commit_tail+0xa4/0x1b0)
[   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
(drm_atomic_helper_commit+0x154/0x188)
[   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
[<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
[   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
[<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
[   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from

In the i.MX5 case, priv->kms is not populated (as i.MX5 does not use any
of the Qualcomm display controllers), causing a NULL pointer
dereference in msm_atomic_commit_tail():

[   24.268964] 8<--- cut here ---
[   24.274602] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   24.283434] pgd = (ptrval)
[   24.286387] [00000000] *pgd=ca212831
[   24.290788] Internal error: Oops: 17 [#1] SMP ARM
[   24.295609] Modules linked in:
[   24.298777] CPU: 0 PID: 197 Comm: init Not tainted 5.11.0-rc2-next-20210111 #333
[   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
[   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
[   24.317743] LR is at commit_tail+0xa4/0x1b0

Fix the problem by calling drm_atomic_helper_shutdown() conditionally.

Cc: <stable@vger.kernel.org>
Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 108c405e03dd..c082b72b9e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1311,7 +1311,8 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(drm);
+	if (get_mdp_ver(pdev))
+		drm_atomic_helper_shutdown(drm);
 }
 
 static const struct of_device_id dt_match[] = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
