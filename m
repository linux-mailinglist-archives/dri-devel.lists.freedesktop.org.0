Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4809A4F7ACC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4442210E6DA;
	Thu,  7 Apr 2022 09:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF810E656
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:01:30 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id j21so7685325qta.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7k9wHjGCmirLGQtDNZunWvATfCdcYy0H3Z1yCUnVVgo=;
 b=eoSQ6dFjX7ebCs11Jl1ZGRgtLmSxbNl8ge+CP32X1ALfHiAP2IqJsNz2PI1FytMYUG
 wUlrBhsUyB8iWdbxQvx7SEou0vURFav0N5dpZmkhWn1epeWwsbtahWixJ+DvtrgxM7O1
 cAyCa3JpyK47O59pZ7QhhwWLIWuO1h3ttFuePmUQSOpK4UesJik8t17h7x/b1PySd85y
 W1hb6lPqoW6xpJx88rax1kgFmWI8v/12R9K4AU+Y8W6Vs3STD1QjVe0nB0w5ZedFy8Ql
 94sSm72kvl24tKaaqoNkeiKR56ArK91gf6jWl5bv1YLhOjabEm6zcLamLIAsZFavr8sQ
 VyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7k9wHjGCmirLGQtDNZunWvATfCdcYy0H3Z1yCUnVVgo=;
 b=wQ1BIILeoZOpRu3AVe94NtJE+MNrSqmayAgrlsi+gdzTCfDJXtfWrMaUFeb7334qbv
 Tmg4WqzHSccT+beRpY/4bjqJQdniBzHo9Ak2Sl7JO9hB/BnxacgwFLcg0EPAHaAfa7iw
 WQCr3SpxAfWfHeUMqW4JWuvQU87Ujg2kf/PZ0wTWXaR3OVS2i2k+d8+194Izo0zhUXIk
 z7MzaOJ4O52qkC4FgPRVZugAhFH4e9HTv9TVgMjvZtGClzev2X6tr/PPoX/GbOoCK+YQ
 DV7dPZw4BKb27KbpQkMnBPCUnDRRcbOkNNpypl0m5KeIl7AyexjMs2kxxvN5d6RkZOYf
 6z4w==
X-Gm-Message-State: AOAM5311nL3FC1v5jdFqbo65pCgmBiYNkTqExs6rEK4vpEcvOIU8jGQ5
 qSF1W73AWeqFXSklI0PT2/c=
X-Google-Smtp-Source: ABdhPJyt6Mnnqh0FTkOo1W8dKin7q9bCtIm4dDnlr76kyfZvugnPP3KPcRcXj0jwBM7EhC3Ss1VxKQ==
X-Received: by 2002:a05:622a:653:b0:2e1:c046:4825 with SMTP id
 a19-20020a05622a065300b002e1c0464825mr11178669qtb.430.1649322089296; 
 Thu, 07 Apr 2022 02:01:29 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 o21-20020ac85a55000000b002e16389b501sm15031194qta.96.2022.04.07.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:01:29 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de
Subject: [PATCH] video: fbdev:  Fix missing of_node_put in imxfb_probe
Date: Thu,  7 Apr 2022 09:01:22 +0000
Message-Id: <20220407090122.2491922-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, shawnguo@kernel.org, deller@gmx.de,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

of_parse_phandle returns node pointer with refcount incremented,
use of_node_put() on it when done.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/video/fbdev/imxfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 68288756ffff..a2f644c97f28 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -925,10 +925,12 @@ static int imxfb_probe(struct platform_device *pdev)
 				sizeof(struct imx_fb_videomode), GFP_KERNEL);
 		if (!fbi->mode) {
 			ret = -ENOMEM;
+			of_node_put(display_np);
 			goto failed_of_parse;
 		}
 
 		ret = imxfb_of_read_mode(&pdev->dev, display_np, fbi->mode);
+		of_node_put(display_np);
 		if (ret)
 			goto failed_of_parse;
 	}
-- 
2.25.1

