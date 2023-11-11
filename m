Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF287E8A4B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DAC10E267;
	Sat, 11 Nov 2023 10:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDE210E268
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9df8d0c2505so585436166b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699364; x=1700304164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKRsMdTRp52wX/RfOne0bAjVlYqKCb2FkmXxuvgSsdI=;
 b=U3xviCFJmP2InTPlTQeu0Dsqk2j2sE9oT+NPEpR5eNHHBHMUo7DVFdK7VHU/ChNBP6
 vHhmLTWoyHBLRuskvDHeracAmLha/6hZHn2Yxm1FTRXnCXuQ59IAzSgxWAe2ouqfM/Wm
 U3uxTHg2KLsmqy0xiAMqXK1Z4532AINTmRh2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699364; x=1700304164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKRsMdTRp52wX/RfOne0bAjVlYqKCb2FkmXxuvgSsdI=;
 b=YTT+1SV4td8eDHG3e4OTOuo53XEZ8gcD+dhxPyQwMRi+0trSWPlNOKWlOE64XGz+sK
 jI/b3nsAp26bLY43Nuiv4wnDC2Rti8EI4jZWt03DlSu3cPzi8FycTfSTq6qvUAu1P2p9
 zyuWGW7L9CsXIiEWRaMN4VQpxrMmyjhOESMnihYPqpT2rCOzbwBwDUGFZCtMnmjA4ESg
 PW6MBx7nGpa3dab/3lDguXhLNE8AdeNpHAJGM/lu2HbHH10PiRk0DXv6vWh4Vl/JJlRB
 7FcW6e/P/Ph4HaWSX5A0rQCGupHMFuNeDve0dFUOfeZ6du1wJOjW7p+Zx7RUWmTkwn5s
 0YwQ==
X-Gm-Message-State: AOJu0YwKNew35Ha3V4basZnnHjpDJwa1Na4zX88w7LI0uL08CmaZY6Na
 HqATORHrPsyQwNKVUKC+ZKkjAw==
X-Google-Smtp-Source: AGHT+IEJbLdVs0JW+jcGlc8xPQxdZhfaKGnEyX/Ga6OBU0qyC2zAkwbXYZvVAliT6vWUL6mEDi9zyw==
X-Received: by 2002:a17:906:4e4d:b0:9ba:8ed:ea58 with SMTP id
 g13-20020a1709064e4d00b009ba08edea58mr1653246ejw.30.1699699364258; 
 Sat, 11 Nov 2023 02:42:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] fbdev: imxfb: drop ftrace-like logging
Date: Sat, 11 Nov 2023 11:41:55 +0100
Message-ID: <20231111104225.136512-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolve the following warning reported by checkpatch:

WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index de1434069530..83497f6998f1 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -694,8 +694,6 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
 	struct imxfb_info *fbi = info->par;
 	struct device_node *np;
 
-	pr_debug("%s\n",__func__);
-
 	info->pseudo_palette = devm_kmalloc_array(&pdev->dev, 16,
 						  sizeof(u32), GFP_KERNEL);
 	if (!info->pseudo_palette)
-- 
2.42.0

