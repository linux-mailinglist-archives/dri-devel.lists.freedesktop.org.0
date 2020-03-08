Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7B17DA61
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0906E2CC;
	Mon,  9 Mar 2020 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8E89F27
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 22:38:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j19so7979898lji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r1mtbKzEDo/meMb75uMw1BZ7jNTEHtwbZ1HaLq50rio=;
 b=iRtF062MxEz8DoVakOftgorukRssYJq/gobsPeyUU3Q/FNvCZ63CfjjVOG44Uvit/N
 J6bYfEOump5YU8FSHDNxEe32ALGrc3tARKQU3hHEFuFA35ib0cXITfCM+9IUe8UZ6Rrk
 MfZKTHhPXn4/P/+/1RhvhNiFSJrjDJVDfix3QRVYckUQczGM+tamEezFPDBS8lUIIw9V
 GQKI63qXHtnmESy1OaBFDk0NYSSlhsJL8ebJZqbdAKXSD6TINGoOs3Um60vOH//jvPxA
 UzSttK4sWbw58eX//v4QdC1w/tzGEO9hLoMD20eFZQVa6c2/YDo0dGs+rC0b7dhJTgZ3
 1psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r1mtbKzEDo/meMb75uMw1BZ7jNTEHtwbZ1HaLq50rio=;
 b=m09kiFV4vXlR7Tjc/05TP7I5z/1Uj4BSYAbv6QQRhd1q8+P/91YrTBKz85HejNe9Zm
 mnj9BkjX5a4JoQxSYGYur/8eTIJ1rX0P6RdXS8X6TIy6H5P9Mx6LTrL79ViGzWMHE19z
 l7FjZRwzEhTKvJpwg52OLU/lSa0S0EEE/MYbLcBDc4I0TH/6etOKnmwpfn7HEcCMJN9M
 TNXlfh25QmdDHIufGMPosa2DBtgECILn+0+P1iL3zuaFruYBQfRdnoLTDdj5PwT40+W0
 TuU9t061xoPS6MtRZxysw1ooNllwCQFF3BBpAqMz411zhLC1KOIQM3HIQzBlSRr1/iXM
 yDjQ==
X-Gm-Message-State: ANhLgQ2f+RLpeY4v+Q2JJyh8fk+6ujmH00Jhhx/PonyOTkqhb/9IQbMn
 T3bk5MwNpWlB32W6G+ll0pc=
X-Google-Smtp-Source: ADFU+vsXzHXv5VdhlnXXX8hLbc6jlFJWsroBn0LOAY7V4Cd+5e9xwnsK+JDax5AlLnXD9QiifV6dhQ==
X-Received: by 2002:a2e:5747:: with SMTP id r7mr6076448ljd.177.1583707110744; 
 Sun, 08 Mar 2020 15:38:30 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id y20sm18757695lfh.20.2020.03.08.15.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 15:38:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 1/3] drm/tegra: dc: Use devm_platform_ioremap_resource
Date: Mon,  9 Mar 2020 01:38:07 +0300
Message-Id: <20200308223809.23549-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The devm_platform_ioremap_resource() helper replaces few lines of a
boilerplate code with a single line, making code to look cleaner a tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a4c2..257163dda301 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2503,7 +2503,6 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 
 static int tegra_dc_probe(struct platform_device *pdev)
 {
-	struct resource *regs;
 	struct tegra_dc *dc;
 	int err;
 
@@ -2560,8 +2559,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
