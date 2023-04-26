Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861B6EFA68
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470110EA04;
	Wed, 26 Apr 2023 18:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329010E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:54:55 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b62d2f729so5958159b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682535295; x=1685127295;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/ltBIeGTYyg79oc/ZiZiDTqh37bCSEcDIezVzdk5HLU=;
 b=YH3upLfK3z4YdSraod17XRacklyLaG5drH5GqlW/GAWaZbl51/j8shNBZ4OYmj4WbW
 mLG8klPqQ3OcGwRTlhj+rc9sq0NFbNkwOcpbXEsuo0z2G1rIiBA/A/sOTDVBbqmq4r7Z
 aod5EEJNNe1+KOqqMVBrAUsVPgiGsJmwjfWO+lLcnWhwRqqRqpOAV1sXd4nRLVLnqB9K
 1zlwa/TYrAzhTmZZygJqpGoWTKunDcPr1lTVVUR7dv+tlMtDwfcpDkw3wGcGhjFcbUSP
 rASIFuuc2Xy3oS79yAw8K9qIIkQ3qMILGXDwGwinEvSobmRR4oSO+SeM88Xx7Xi1c+bR
 eWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535295; x=1685127295;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ltBIeGTYyg79oc/ZiZiDTqh37bCSEcDIezVzdk5HLU=;
 b=YZ4XtV53zscQ9gqUbVdm4qwJJoYll4uDzmI7cD6vrgBj+1aSvKmuVhHkc1de+L4hQS
 J2cAyiAeZaaMyjR0LPnmE94YER9rOscNkCl8UnzJmXN/e8Kmi4SzxzOZzjvrKIi52cko
 9Q8phvfzO/D/1bWFutkZzFZjM4KINsva/avY6hwXzTWD5AOB6aFnUBdByRi3b31Evrpe
 ke9aIJYjcOQw2tZ72hewi9ENZuRSp8KZdqlAGB2k89y+kHoTnjW74AFfBdv+CBeE1H6J
 Rf7Y2daWi/rXp7x9CQzLf02DrBsDQZRvNmPHXHihAKArpAdu618a5mYGxWBR4nrEvgrl
 6pDA==
X-Gm-Message-State: AAQBX9fIEGiY97bTsiSTJffVvCr5mIZNeRltvxDwEYJjeIYtumIZyfCf
 Ox/DaZC6BX4XOcVDxSyPIOo=
X-Google-Smtp-Source: AKy350bSuikIcIqojWr8teMubcHLwpy10Bmo+SkE51TpE3wpfmcxjp9cVN+PRNV31Rq7zLFgDVVYRQ==
X-Received: by 2002:a05:6a00:13aa:b0:637:f447:9916 with SMTP id
 t42-20020a056a0013aa00b00637f4479916mr31430352pfg.16.1682535295177; 
 Wed, 26 Apr 2023 11:54:55 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm11639254pfb.104.2023.04.26.11.54.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:54:54 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2 net-next 4/6] net: phy: mdio-bcm-unimac: Add asp v2.0
 support
Date: Wed, 26 Apr 2023 11:54:30 -0700
Message-Id: <1682535272-32249-5-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
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
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mdio compat string for ASP 2.0 ethernet driver.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

