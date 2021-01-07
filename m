Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4702ECC1C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705226E416;
	Thu,  7 Jan 2021 09:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F220C6E416
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:00:38 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id h186so3481195pfe.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DastRFZT0YRTJbhjin4LYkaltVM19avoz7xyKVGj6Dw=;
 b=WrquiLyHqpze9casezEGrj757u5zzRnCqbtbUbvIk0QNnvRcaJNK0xR0rdxlvB7CVS
 FtN+2XUyriUFa1bhhxvy7N/Y4ric5y6tEAy/jbM37TOvErEvReLZ32l3Haj+Y7Q0n54q
 vBbYoVGOdM/cXwFGSUX3rJeoaot0xKiveejdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DastRFZT0YRTJbhjin4LYkaltVM19avoz7xyKVGj6Dw=;
 b=XOWNYAnHcJAlgdo+zXNrTQO/DFIiC2PPGVguSW9Jyr5HcjZ2ZhbSQ1UdXs65llOlIU
 Loi6T3fDgsQ+J8I7irtWTxx7D+UQmq1q8DyQwGuB5h6Gyz64CcBFVfeR2uAPme7OYECs
 WuWcR6Pym/MwGEaLrUq1r6f17qjdk69dn8ND/X3q8KPdzUpE903ze4QE6RC+Zrc1qOYl
 +QdZE6hn0jlwpOtpBtNeKyRVGb3QAUPGOaTnK/iAPD8whTHHGeu7abp+psQZP1+4z0AE
 AlCspN9ps8KZTN+Nw5glWo90TtNMumK8nLBhyzZIzx9OXnnoCmYZI1fWDEf4KlICqtkg
 /hfw==
X-Gm-Message-State: AOAM5310Gl2Ndq3o8tIPuW/oZeyvk2nKcWfYgOYc0R0tDjrgru9SZB2c
 sHc5tgboILeSmItGrxuzZOqCXQ==
X-Google-Smtp-Source: ABdhPJyY+YV3V4DWR0ayGdUUpbnvU4ijK2h17JSY9FskuqIWSGOaaLwPCjnzSF8RjQYbhqKoNKhhtA==
X-Received: by 2002:a62:145:0:b029:19e:a395:bd3d with SMTP id
 66-20020a6201450000b029019ea395bd3dmr7842250pfb.13.1610010038443; 
 Thu, 07 Jan 2021 01:00:38 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:37 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Thu,  7 Jan 2021 17:00:21 +0800
Message-Id: <20210107170017.v8.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107090022.3536550-1-drinkcat@chromium.org>
References: <20210107090022.3536550-1-drinkcat@chromium.org>
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
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

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
