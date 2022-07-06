Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47B569B93
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C711B377;
	Thu,  7 Jul 2022 07:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8007811B0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 18:41:39 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id j1so15958083vsj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx+gg3QeKmgimEFCxkgENq8mFFJCcPLK3Tpa8KBdXZQ=;
 b=5ImEhxj9zI5QeixgMRy2oCb09ZTGtoB6sy1iCWHZJEwpEb/2tcEQxNADRv6npBljpf
 RBFko9PzIovMhvzHZ+vyuSY9vlzgMgLtBESaw2zseX/uky3RQSPesFJA7iiB5rqdAelc
 QqO/eolI+l+BGzAnaeiSqx+J2cXRfnGkBXNCoX8Cocg4mvfcLmEDIYihPzYg3lL4e6fH
 c31WF1yoKJqHG4OJKSXfh3bZjjACv8KSKvVqBdHOm2zFuV0N1e9b1eTWMLU8SyRimOVg
 qN9LUzsND3dfxynncyS+fU3Q3Yv20MOwuTJjyZFc71LvOjkWOc9oJIOSzCqOcTAZh26S
 Pc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx+gg3QeKmgimEFCxkgENq8mFFJCcPLK3Tpa8KBdXZQ=;
 b=xnx8TI22O0bO76RRKEiT4vi7ilHnSzm7YiPwAxx967SYmUS3WyY7+r5SN8JeuusvRE
 ShI08cPTcBXUp54PPEJ0/e0QKZs5++BhccL3Y0m73xfU9mEnRZ7Gd+iNIiAVrpC0Ftem
 rsgnoWGYe3dXfvvATwQYh2cA5elrz/xUPURy11GIWAAZlFLkw/KribFbG3LGpBCDToU+
 5LKy8381VTc7ykKR4BNg5YBNUKZgO8x4XVSpYM1Z/CGKqMQ+dHxg2KngFWLgUHbrl/1j
 KXxH/d4j2jHRZkfJy7XoxumB7av+LH5yGsX76LsjvsZHYRKQTzUyBL6KoTLOsO2bON90
 z0wg==
X-Gm-Message-State: AJIora8drJgMw49oLcm2nIB4QBF9JSYZYxG88GiMJEOvezAD1vK+gWsN
 oo9By3KNe4tBnIHCIfeHXjL08MsVkGPJQ/Xb
X-Google-Smtp-Source: AGRyM1s5ukynxxAouwTdeCJdufFu6R51/gQaW1DL+UIgufieP8aySiDkibXdqieMtaA8i4QJFxT64Q==
X-Received: by 2002:a05:6102:244a:b0:354:4eaa:f176 with SMTP id
 g10-20020a056102244a00b003544eaaf176mr22415969vss.45.1657132898361; 
 Wed, 06 Jul 2022 11:41:38 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ab06cac000000b003828662fb30sm6052225uaa.39.2022.07.06.11.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 11:41:37 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Fix pre-charge period setting
Date: Wed,  6 Jul 2022 15:41:33 -0300
Message-Id: <20220706184133.210888-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Jul 2022 07:29:50 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix small typo which causes the mask for the 'precharge1' setting
to be used with the 'precharge2' value.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 08394444dd6e..f4886e66ff34 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -350,7 +350,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 
 	/* Set precharge period in number of ticks from the internal clock */
 	precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
-		     SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep2));
+		     SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd130x->prechargep2));
 	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
 	if (ret < 0)
 		return ret;
-- 
2.34.3

