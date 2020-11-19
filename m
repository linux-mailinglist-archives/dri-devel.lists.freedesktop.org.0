Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448D2B9414
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8366E52D;
	Thu, 19 Nov 2020 14:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52EB6E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:07:39 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a9so8427523lfh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=by9rdaiSTNhh25rGcdMhydBPT1Ee6Q+Ur1BB4O7C4Tk=;
 b=tWYBBjEyHLLcUdZV3JTAQ8MKQEQ2kqZgcQ5MDERuYEGvL2/ppp2n5esSze20TLaGOi
 c4EhVEVoixCWm/H79N2t+a00SFj4PRlAhn5BU5e65yywr+THQA+MGDJqyzIRVwhJ8Ovm
 uuenvZ+v4MZ/Tuj/3VnUKDo/htf5Otr0n62kEZLRThkQDgNlKNTdj5+Lt89zis6Y48Lv
 VKggH458/phEKCV3+9wSUYCs9mvIZSPP8U8r8p0TMYcIEBjougHLM8NFPOtEww2hjN0h
 t5wynqI6UqxEPWEBxA6bevACRN1z9bg3enfgsJGGIa4kUDVQGT8ULyjpwrb0j5MFL5ir
 ZgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=by9rdaiSTNhh25rGcdMhydBPT1Ee6Q+Ur1BB4O7C4Tk=;
 b=EAFJq5LNaUPfVOc2iH/k7B5pm6pBDuqDxMzm5+2MbhmLpXmael5vgJusdpif6a4NwZ
 Q25j7c3x5elRRw8LAiTRgsgs61DzlHyCMZnSm5YVTzbDSDZuCWVfbGNyMhw958+xM6eb
 uayigOdb5ksVcrLgqgmys/q5WLxNteNnEpV/bBU2+8WbZ4HGnnKyC0DZW4akgFic/Tsj
 DbuVmpzbgEpSo7l5fzNt8IQEnj2WY85fah1Axp8+lWgWtATaD4c6Xk334tHCh2HAruQu
 A6PaftL9dTtNTUswA9jS4ox8WIUB+nX6Dk/WsV64/GG96Ldp1Bgb+sCSqF3F3QBy0R7o
 D3+A==
X-Gm-Message-State: AOAM530FcX8wcfJQDnwKXyNBQAPOEHHXGHkXlKtfYZ3JlXYWBC3ZuYGi
 ebvrkUhNCCB9HVg6HkZR/LEgTczM13FVUNNN
X-Google-Smtp-Source: ABdhPJz16YnQNj458eZvEVvW7NxGWSmTcZqoP1RkFR1v7kfmXpaxFUlpiU33ocN4k0m+m7d3/OdQfw==
X-Received: by 2002:a05:6512:3048:: with SMTP id
 b8mr5524416lfb.575.1605794857954; 
 Thu, 19 Nov 2020 06:07:37 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id r8sm3983292lff.238.2020.11.19.06.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:07:29 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix uninitialized value
Date: Thu, 19 Nov 2020 15:07:07 +0100
Message-Id: <20201119140707.1008407-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"val" isn't initialized on the default: errorpath.
Just return from the function if this happens.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 192e11c88d72..d941026b940c 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -569,7 +569,7 @@ static void mcde_configure_channel(struct mcde *mcde, enum mcde_channel ch,
 	default:
 		dev_err(mcde->dev, "unknown flow mode %d\n",
 			mcde->flow_mode);
-		break;
+		return;
 	}
 
 	writel(val, mcde->regs + sync);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
