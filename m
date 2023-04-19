Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB30A6E7034
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4395510E705;
	Wed, 19 Apr 2023 00:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD58B10E3EF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:44 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id m16so19583156qvx.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863043; x=1684455043;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VoyOtevA7zWVcY2FMaSNxcWdqWdjwOkjpS+Kg2w2jSA=;
 b=sFykKzA97PqsK5KYynP+h9AsjamexIk+Nn10QGXknsUrLemzpQYJQ87TqQT9VO71m3
 EySGCOwets/U/hy0lFm7hVA42oJtCjU5VWVYoiJDulRErN+FD4m292/qDV9e5BfNbCRM
 5VpHOIPBJ64a37DqgoJSCHE+6jPLZrxrP9967Hq/BqG8LhhaTXe8kIkTSZ1HNCJeydrg
 ElgHVXbowPSnKEEiEPE/r4sVSZ3Wgs9VglaaIz6Y39OivnoLVFe51J/cKNR6EUKikwnl
 0XqC5pDhuRrfxNAbCUQycn4gL/8rG6CJ+I7z7ulNgTVqyqh+k1aQN0I0GvOR3elKPxPV
 APRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863043; x=1684455043;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VoyOtevA7zWVcY2FMaSNxcWdqWdjwOkjpS+Kg2w2jSA=;
 b=i1wdSius4RxkPEzHroKosjdkf3+DXmwJ1CMLjew/xM+DxEXLXg2eHF5KzLy6K/Xq9y
 WvkWgM+gBzJ6wm3UfsLRlg+qDr5Zq8CE/54AhvkicERI9LuerZFW0urxTi/vpDywvg+I
 TG76x4z/YNXiloAPQqpBmH7AQl6qYoF7TGbo0Hn+jMZgn41fShBA+bPn6l9B64g6oGcF
 gkTDRvkfvZRUU7EvxFj4PyjMGQ8X5Py3/d5e+kRmEHCFaETGb/yB4cI601LTl33z752T
 fXas7yVBmWyRcr6z9ly8hH4AiTc1Ez91N1rKopcdD2w7/EhvAr87mo6aW+GybAHKrJa0
 szmQ==
X-Gm-Message-State: AAQBX9cAXf5QUajyxRzkshoSIJ01uC80dJd3y7LFNiGW03JR+wWf9rnZ
 mJ6hCW86onVSOv1FrU/o2FFK0a+TOUlg9A==
X-Google-Smtp-Source: AKy350ZfbVnjm7WTZXlNXTdPmRjM6xggqlbBTZwnwChNwmErHuEZDhi4LipIpV3OEHwNKezANor72w==
X-Received: by 2002:a05:6214:20e2:b0:5ef:4655:192e with SMTP id
 2-20020a05621420e200b005ef4655192emr22363479qvk.36.1681863043415; 
 Tue, 18 Apr 2023 17:10:43 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:43 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 4/6] net: phy: mdio-bcm-unimac: Add asp v2.0 support
Date: Tue, 18 Apr 2023 17:10:16 -0700
Message-Id: <1681863018-28006-5-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 Justin Chen <justinpopo6@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mdio compat string for ASP 2.0 ethernet driver.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index bfc9be23c973..6b26a0803696 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -334,6 +334,8 @@ static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
 			 unimac_mdio_suspend, unimac_mdio_resume);
 
 static const struct of_device_id unimac_mdio_ids[] = {
+	{ .compatible = "brcm,asp-v2.1-mdio", },
+	{ .compatible = "brcm,asp-v2.0-mdio", },
 	{ .compatible = "brcm,genet-mdio-v5", },
 	{ .compatible = "brcm,genet-mdio-v4", },
 	{ .compatible = "brcm,genet-mdio-v3", },
-- 
2.7.4

