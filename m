Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25021C056
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 01:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F9D6ED8A;
	Fri, 10 Jul 2020 23:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403626ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 23:02:50 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d10so2852499pll.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVqx7g36rFA8fGH9HPQE1NOw2DZAuX6VKaMN/UQGYmk=;
 b=Et6Dk9C0ZAXRSSAVBOeYyozI3Jj+uhoeW1ZrbIn4h7Zhux2W8tHEXkW2/mrDbKQZqL
 Uvg6xpKFBy1wu6a4o5ZQrtYyfcgypwjH2LJNmsuaN5NHupqledwdyeX8dcn770r3gX2g
 hlziyVRNx3N8dW2y2fAPskxRWpjbeRquFS9fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tVqx7g36rFA8fGH9HPQE1NOw2DZAuX6VKaMN/UQGYmk=;
 b=Vo6hYZ907DJ5bK4fwFrIITEyro8yhLC3Es3o7ElUxIvvdNs4c81f9btYvpJ2G6cPGC
 AwiJbuI+BoT9LfTT0wY62C7vfeMUFWT/TuMKg8pxfIrai5gE/Fvf8VHL/VTnJ72vxQjt
 KxvIWWckOBcJfmtpNrSB1fQ8/x3Q1zn5yy6d3csbqjjsUJSXIvJXTkN9WIZgfmuQDcuR
 wgOurfTElXiFKZ+kytFmANPBgRHDHqWogtw2F1oXoH7qVcV2Pbd5VrE/daXU0hZG3ELr
 +6zQoE4rbHRwglMt9QvzYUr69SRKgxK4/i4gcrsKfB86ZmiawAR9/A2OnsPiNXCPeOpn
 U3iQ==
X-Gm-Message-State: AOAM533ECR/YDzoZP4nBXuEF2xnlQpt+Zik+Tuwp/jL1l/C/N7rPYJKm
 alG/82uPYlBbDmFSolgcmiPrUg==
X-Google-Smtp-Source: ABdhPJw4NYcILGIGbzu/Mo7t5i5bNT/aUinQfG5IFKgb6SVXfZdHoKdaoadkxhHDmq9STiHl74UbJg==
X-Received: by 2002:a17:902:d215:: with SMTP id
 t21mr40582652ply.136.1594422169822; 
 Fri, 10 Jul 2020 16:02:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 16:02:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/9] drm/msm: Avoid manually populating our children if
 "simple-bus" is there
Date: Fri, 10 Jul 2020 16:02:19 -0700
Message-Id: <20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If our compatible string has "simple-bus" at the end of it then the
system will handle probing our children for us.  Doing this has a few
advantages:

1. If we defer we don't have to keep probing / removing our children
   which should speed up boot.  The system just probes them once.

2. It fixes a problem where we could get into a big loop where we'd
   have:
   - msm_pdev_probe() is called.
   - msm_pdev_probe() registers drivers.  Registering drivers kicks
     off processing of probe deferrals.
   - component_master_add_with_match() could return -EPROBE_DEFER.
     making msm_pdev_probe() return -EPROBE_DEFER.
   - When msm_pdev_probe() returned the processing of probe deferrals
     happens.
   - Loop back to the start.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/msm_drv.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78b09fde9e29..f7c6ef147095 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,10 +1208,18 @@ static int add_display_components(struct device *dev,
 	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
-		ret = devm_of_platform_populate(dev);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
-			return ret;
+		/*
+		 * Old device tree files didn't include "simple-bus"
+		 * in their compatible string so we had to manually pouplate
+		 * our children.  When existing device trees are fixed this
+		 * can be removed.
+		 */
+		if (!of_device_is_compatible(dev->of_node, "simple-bus")) {
+			ret = devm_of_platform_populate(dev);
+			if (ret) {
+				DRM_DEV_ERROR(dev, "failed to populate children devices\n");
+				return ret;
+			}
 		}
 
 		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
-- 
2.27.0.383.g050319c2ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
