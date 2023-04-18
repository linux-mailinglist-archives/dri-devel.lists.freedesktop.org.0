Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872C6E8B0D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8B510EBA1;
	Thu, 20 Apr 2023 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4F510E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:22:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dx24so28639985ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681820556; x=1684412556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2yquulr973fRel1eU8dSJwKYT/PoTU0TB+X3j3sNB9Y=;
 b=W0hNp96l4frmtftLzTZh9VnrtYZaHDsS34GK3qM7WCNRaJGDez8ajYj7Ol86o+LP1G
 pL/Zp5o9gdvqvXvlEcneVHqTHg2PCfVJW8NH7KzH9fiRsu5JqBeNF//+FxO2BsYeaBVq
 7Jd26dJu74wHuBAeAgNoNwa4q18pDSOZJ2vFRCMHVlvE14JHLppIW1kzOQ5uM83Z65m9
 Fi7wN5xG2izZJXNO56zWWTTJ91uxAV2UHL6wxRFS6QQQ63+FMr+rt3hf0qFrEtkwq2OI
 OHGuvP0MU7oFKPa6fCaW+c9KWeKtatwiPgvP5XyenxUioNFWM+xQgmtniwYvLX493Vj7
 DMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820556; x=1684412556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2yquulr973fRel1eU8dSJwKYT/PoTU0TB+X3j3sNB9Y=;
 b=fZWQo1nOJgmVLIrBWq9vBD6/PiIpXH5QO3UNDGuYa5E5Y0MyiD7uMIMaaxDSbsdSni
 R2eazhvKUFujs58parh3qwFByJN5uNY1/zQW2I4couMPJiRSck96F5A9JgnAy/DyzqsS
 5I6nItAlNRVdGDsDhToPYX3j9j/hwmUtyys+IMbpHYOhW2bPLru/UYM/6DgMiYFWHC5R
 PI8rOf9Q5UcDmLxKakqZTmfgkznlyWAu8M3dY9W1KLzaeTflOdHogXNZSCd388TRGtdV
 /Bk2/2OdKxid2FtVk5OrTncM5szkxvoYOsP9LW9otSHXqZ50zzl1t5TFWr4XGuhnnK0i
 YHlg==
X-Gm-Message-State: AAQBX9eFVj2L249W3AZtkg5ewCRDfIiwnPU0k1BBjPmRnN3Ng8m4cTW3
 cNLgp7sdE/10yYZe/Y61oZEXaAHBYa8ufA==
X-Google-Smtp-Source: AKy350Yi7h2XkDFO6tHiPFQSHtE0iBXU+OI6oUeFXqAikMcTwRafGjOamnd2pfpAGtTnxCY/vueTBA==
X-Received: by 2002:a17:906:cc53:b0:94e:c6ad:1119 with SMTP id
 mm19-20020a170906cc5300b0094ec6ad1119mr9768278ejb.13.1681820556516; 
 Tue, 18 Apr 2023 05:22:36 -0700 (PDT)
Received: from localhost.localdomain ([154.72.160.133])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a50cd8f000000b00506addaaab0sm2221252edi.32.2023.04.18.05.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:22:35 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: bridge: icn6211: Only warn on invalid chip IDs
Date: Tue, 18 Apr 2023 13:22:03 +0100
Message-Id: <20230418122205.16632-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: marex@denx.de, Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 robert.foss@linaro.org, jagan@amarulasolutions.com, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid aborting chip configuration after reading invalid IDs and
instead issue a warning. I have a bunch of these chips and they all
report "Vendor=0x00 Device=0x00:0x00 Version=0x00" but are successfully
configured and go on to work just fine.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 0e37840cd..39de9a7c7 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -361,8 +361,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 		id[0], id[1], id[2], id[3]);
 
 	if (id[0] != 0xc1 || id[1] != 0x62 || id[2] != 0x11) {
-		dev_dbg(icn->dev, "Invalid Chip IDs, aborting configuration\n");
-		return;
+		dev_warn(icn->dev, "Invalid Chip IDs, configuration may fail\n");
 	}
 
 	/* Get the DPI flags from the bridge state. */
-- 
2.30.2

