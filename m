Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59C2ECBB5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA246E40B;
	Thu,  7 Jan 2021 08:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239F6E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:27:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id w1so3735575pjc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 00:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VG/JPHW1nyFJkWn3hxAWpxYTfHmRQhs7/jRSVGbcaCA=;
 b=YIclqMxRK17U0P0NMoxt/Z+WcW8XzzwtBVqX3gpcdgcnk3PTRBRPCTIvlFvzEKpYp5
 Gd43oJi+5M80ZT4X294OjTsmF3bM+v/S1WbhjoM8ymRkIHhlCCuM2uYeBKkrm+0aIYPD
 YKHL4xwlkSOagLE+JAzWlowpI6jgQX1x7aFgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VG/JPHW1nyFJkWn3hxAWpxYTfHmRQhs7/jRSVGbcaCA=;
 b=S6SSO66H/nnIalqVdi68v0+7/NOwcWJyn6RdrYxd4CULHybM/CrGGqaNFtc6p9bRhG
 iqVIFALo7mqtDuk36upMDApwjSUv5FO/84+2rROupVqORrvbaRkMktfZJALg/tiGZUPM
 fNt4Glig0oa7flH2Pm03cRytAvOkZSkvEpoiq1JIco9YlWBn2QAl3Ni3mECunx18Jges
 MgHh6zBq1CvIUQyxd+kzlt03caHfRrprXox0oT6fk5z8WXZTpdrLRalEWZb5onfGee0n
 WpA/XtAFL0EAuR/LZwP4TD2VWxniuVpUmClw2ZH/wyEI2cdYbg435NMWDLMlNL3vQJDN
 mIqw==
X-Gm-Message-State: AOAM533YoFM4ybJj7NSc9W1/KfSg4WCgN/Knr1LNh8LCI6U+o4sR+TFX
 PYJ4zHxWY1fpFFcc3VmF3saYaw==
X-Google-Smtp-Source: ABdhPJyxZnXxHUFuIui/rSg6OnuKbTGgDktbellBSXe/r4uAs+7zkOfP9EmPNCE0+2p1EBEit0h7eA==
X-Received: by 2002:a17:902:7e85:b029:da:72a2:de1 with SMTP id
 z5-20020a1709027e85b02900da72a20de1mr8145955pla.57.1610008032888; 
 Thu, 07 Jan 2021 00:27:12 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o14sm5825580pgr.44.2021.01.07.00.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:27:12 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v7 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Thu,  7 Jan 2021 16:26:52 +0800
Message-Id: <20210107162632.v7.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107082653.3519337-1-drinkcat@chromium.org>
References: <20210107082653.3519337-1-drinkcat@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPUs with more than a single regulator (e.g. G72 on MT8183) will
require platform-specific handling, disable devfreq for now.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - New change

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..1f49043aae73 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
+	if (pfdev->comp->num_supplies > 1) {
+		/*
+		 * GPUs with more than 1 supply require platform-specific handling:
+		 * continue without devfreq
+		 */
+		DRM_DEV_ERROR(dev, "More than 1 supply is not supported yet\n");
+		return 0;
+	}
+
 	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
 					      pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
