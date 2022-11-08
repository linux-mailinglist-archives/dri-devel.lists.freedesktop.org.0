Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4343620859
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 05:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9910E220;
	Tue,  8 Nov 2022 04:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9C810E220
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 04:41:46 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so11969076pjs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 20:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1LhW8LVwSoxQQpyW4009bvl9o+iGdIJ8EYui4FeN5lI=;
 b=JrLTnqEqQQX/olx97uyFYEYYUbQ36qk5VkyCuZyuuWn1R7J3wu+34ybKhjRzMLHpkK
 SLYbJcs9eIRjjJmcIfRkwNgdkz/j98i7O1M2SL0VB8dHybCDB7FgWk32NbOPFCD3LOpf
 xTbXcCVQ6J1hJ9CQgnf8YLZQlKaACiv/VX+iAnPD/iL/0nnjzqyM7jorrphS2C3j5rsV
 W9ZWnrLfcasVe1qsmIqxMfUtyNb4e8wGiVo6tzHOE9t49CmEKZP3m4JR2CtX9tI6wkqo
 WOqvpRjODd2B1RADPzMGK8q0DyHrNxzgd2RTkFe8W1rXXGhYEbv/UjzGnmNJClev36Qi
 CDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1LhW8LVwSoxQQpyW4009bvl9o+iGdIJ8EYui4FeN5lI=;
 b=NibbY2+WUE/V+HKAyvjpvMcK4iTZORl8ptt/pCFihkimtfrWYE+JOIOe/UfCRNypdg
 q17WNINYlNB0EVDXASdKijBibTPr2QHPUn5bSy+66xklRivhgd3jK9+n+GOSMIOdhrQ4
 I+SGpsbMgHxmPi3WH8yZyLhkVzOTJS+0p0wtxi1WvKPRzY7F/gMcYk7tCAhu8XgCSGXa
 aAyIhcdePK7BG1tI00CdZXdI7LCwpXPpgLv8Txsxf3U+6I28x84Egg0c3uMAxRKt/veC
 L6WBsF4P/EdxGnouT5MHByd3KQGHloCEkimWeQUVnMb2qweOo6gSA6uNE9KAgfIeQoMM
 3Tvw==
X-Gm-Message-State: ACrzQf3S6d+/2tPLoyx2FVqJlyCpbHVDh26aaGjlrBC502eCJoz4e2kp
 +Ek1RccM0C8q7Hlq6nP0ml0=
X-Google-Smtp-Source: AMsMyM7L1FtirDOVqJjIsUVZ7WCVdzk4jypU9W5LWPfUxEa7dwpdnbp8zexf2QhSOS+ruG6K0QT3zg==
X-Received: by 2002:a17:90a:c7c7:b0:20a:db08:8a8a with SMTP id
 gf7-20020a17090ac7c700b0020adb088a8amr913509pjb.141.1667882506250; 
 Mon, 07 Nov 2022 20:41:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fb10:b5b0:232e:4afb])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a1709029b8b00b00178b6ccc8a0sm5810357plp.51.2022.11.07.20.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 20:41:45 -0800 (PST)
Date: Mon, 7 Nov 2022 20:41:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [RESEND PATCH] drm/tegra: switch to using devm_fwnode_gpiod_get()
Message-ID: <Y2neBkfe6b+MzQGa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_gpiod_get_from_of_node() is going away and GPIO consumers should
use generic device/firmware node APIs to fetch GPIOs assigned to them.
Switch the driver to use devm_fwnode_gpiod_get() instead.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Marked as "resend" since the contents of the patch are the same (however
I did update the description a bit).

 drivers/gpu/drm/tegra/output.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..a8925dcd7edd 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -133,11 +133,11 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
-	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-						       output->of_node,
-						       "nvidia,hpd-gpio", 0,
-						       GPIOD_IN,
-						       "HDMI hotplug detect");
+	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
+					of_fwnode_handle(output->of_node),
+					"nvidia,hpd",
+					GPIOD_IN,
+					"HDMI hotplug detect");
 	if (IS_ERR(output->hpd_gpio)) {
 		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
 			return PTR_ERR(output->hpd_gpio);
-- 
2.38.1.431.g37b22c650d-goog


-- 
Dmitry
