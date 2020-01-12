Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF9713866D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6B36E536;
	Sun, 12 Jan 2020 12:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953216E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 00:16:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 20so5835718wmj.4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 16:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TO4ro9G4vD3zIHyJt/0agdTa39l4m1TB7ZW3wf7lrf0=;
 b=UH7MWGgmwpk+vFbDOSAfRRM5C2mVjwsDV1I/lidLxqldDbgNh2mQf1YvA9C/MsU15K
 eSNVEdudBaJL3+6RGJN2DaZN3xbK4vXy5fdslb47DmZYmpER4EKUUIMYxqpmcOntHN1l
 h0OGL18OHKnXe/pn/dS+JeYnlNQ36lO5c+iEAPAm95AnQBFva2HCmFAgf9whFsoL3rPk
 vAP5147OME9RQ3F9CGQP5epoyqVAK/twGXgZIFxRjJM97l6b+4qqcaRMLldmjvfZtp/g
 hTifIsQG74JrK5hFgARq04sLxGb7P2nGygPB1DnFV1tFlija8XeEg34NvACoT25k77PD
 2ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TO4ro9G4vD3zIHyJt/0agdTa39l4m1TB7ZW3wf7lrf0=;
 b=Lp7qaKzE3cuzmQ29tXVFpgS0s7q7q/n0m0s6WcRUb2fgAV0XoXTG2ABmSf7PbeB38w
 ErnaMzODyIYbKgSnRcsYgMZCCOpYuDoEhpslYimWY919bhCPsmqSDbgx3I7Uj1ccQOkh
 y/XVv6UymfFuZUB5+TGtAIyOCBRamynSaVhkT1B8IswU9VHMwClxU+Iw8rE6hWtgXol/
 sNck6pEfDX70+Cl0UVNwuohNXJr7j6ElFC1olQAe7LA5BWOZTZu2dWSqoR+FBgeu1SaJ
 M3Vajx/NZUgXox5LuukXlmCOmMop6vIz4cc934LPr92FL60La8EzBnTlmge694OjT+JR
 noPQ==
X-Gm-Message-State: APjAAAVxMFS9zU4287fnw6269Fbb8rgx6w2leiCwWO77qB6eeB4o1JK8
 x/X8Lq33/hpya9vPHEuLtyxdWdFx
X-Google-Smtp-Source: APXvYqxwsOHaGPq94M95EVR5OBQt7fgZiB2P/O5Jg9DgUSfO9JLb4kiGFlvW8Na/knMYtda6GHHQNg==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr11799060wmo.12.1578788204957; 
 Sat, 11 Jan 2020 16:16:44 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id h66sm8575535wme.41.2020.01.11.16.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2020 16:16:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v2 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
Date: Sun, 12 Jan 2020 01:16:21 +0100
Message-Id: <20200112001623.2121227-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
References: <20200112001623.2121227-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, sudeep.holla@arm.com,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decouple the check to see whether we want to enable devfreq for the GPU
from dev_pm_opp_set_regulators(). This is preparation work for adding
back support for regulator control (which means we need to call
dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
means having a check for "is devfreq enabled" that is not tied to
dev_pm_opp_of_add_table() makes things easier).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbf..1471588763ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -5,6 +5,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/clk.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "panfrost_device.h"
@@ -79,10 +80,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
-	ret = dev_pm_opp_of_add_table(dev);
-	if (ret == -ENODEV) /* Optional, continue without devfreq */
+	if (!device_property_present(dev, "operating-points-v2"))
+		/* Optional, continue without devfreq */
 		return 0;
-	else if (ret)
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret)
 		return ret;
 
 	panfrost_devfreq_reset(pfdev);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
