Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE592EEAB5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8615D6E5C1;
	Fri,  8 Jan 2021 01:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAA36E5C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:10:27 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id q4so4803132plr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Btr4GziZmSmF1Ub4qnq0SpstKPt2/2jleo6UAXy0j/A=;
 b=LOrd8IItXrtGowbDtoko3gWePPveGgoW5WaUJsm8w7E/QxLaVTqiviDlUa9zgRHnT/
 BDHmUwQBWPgo5pbofbVmc7kQF3yNI/G1aQy1cIwSfO+Fs5ZXVA2o7ng+YUEmm+ohkv8Q
 GnMG6BqZHHDUGYG+i2/5MOPE0acEdP+msOn1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Btr4GziZmSmF1Ub4qnq0SpstKPt2/2jleo6UAXy0j/A=;
 b=RWI4IDtbys7vEXjlUlfOayEhUS0lxGik8/ZvqSClrnOHR+ktnGwJs2siaG2pgjJf+B
 1R64KDbiMNyWnm62+P0jA/HqMVtZDFRFb4fk7+9JAJ7rJoP5owZ2d15UYckTwMjKisik
 J72UvqufHuvxQRNb7E6KR7BF4VSXbiEbV12aWU+N4VLeRgtyMjJtw9OG9ZFFqw+vh6XC
 IjsSBm9DXsJ5y8fc3LF6fGtwTn4CcuA2I+5XU/EyonQSRIeOdHENCKCxJarAAVun8kwZ
 ivxwlRFIEoe2aBNltyck20bmH555qR8kxvAkJDJzndhEwXd2tCJ3pjyTAMb56OzkWbN8
 pnnQ==
X-Gm-Message-State: AOAM532HqoU7SghzYQiJ8hq8EZvpz6uBf5sF7w9KD6A5+L9z0YUaXJZv
 SmJnPIWh7ev8J6/Zw9H943UucA==
X-Google-Smtp-Source: ABdhPJy8e1bhkVfYjTqYbpVkR/sIKL1iQSv/8jv8VQGzrgxJMKUQYZHjSXSKG1eGTP2lXsoOnN4Cjw==
X-Received: by 2002:a17:90a:bf05:: with SMTP id
 c5mr1099131pjs.95.1610068227384; 
 Thu, 07 Jan 2021 17:10:27 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:26 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Fri,  8 Jan 2021 09:10:10 +0800
Message-Id: <20210108091005.v9.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108011011.4061575-1-drinkcat@chromium.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
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
require platform-specific handling for devfreq, for 2 reasons:
 1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
    does not support multiple regulators, so we'll need custom
    handlers.
 2. Generally, platforms with 2 regulators have platform-specific
    constraints on how the voltages should be set (e.g.
    minimum/maximum voltage difference between them), so we
    should not just create generic handlers that simply
    change the voltages without taking care of those constraints.

Disable devfreq for now on those GPUs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - New change

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..812cfecdee3b 100644
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
+		DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
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
