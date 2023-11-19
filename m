Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F258A7F0545
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCAB10E1B2;
	Sun, 19 Nov 2023 10:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F0210E1A3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9de7a43bd1aso460277666b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388899; x=1700993699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=gap7q+RelcT+ZZJj74TtFaVnAIiNmLjHdDh24qaw+gbu6Ay+KruG9WOoddI/HBrb4P
 tavGu6dZNAZvyoTgP93l5zuhj5V9sQGEea2gGOxumQ1LT6rtur8Y+f6RFp/AvKPHuWar
 Djxv0FciDgqK2BJa92eAl6x5CfDBWnOg7U9M8eWuvb5sI486jslNrQ/Vxywixaclbccs
 6LSdVvMz/5lKisr1Gtwi5qtMgUkLZxd791lnBVz2Mw4JqiHpqTwiqzvQtn57aFQrSV0L
 azJKRmfhqH1FWKtIw/Iw7y5cUbkgA5luhwtRNMUwBAum1xh5G8mw+B3GpyZKKzjewRXt
 oh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388899; x=1700993699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=LkMOSvurej5hNLvnWEjdmWvDDtJ6vqpZEltcHmubZMNfCzJ1Y+5kO23mJKTeugOcpM
 avLSEi+P3TY4+BkpukYg1yuhsMakvJHUpdPTfs5vTz9j/R0I+u2jzCtzCYMKD6QazHhf
 0FLZwdY8XQmhTzW5BXyebrlpYza43x5I4FdLgwoCDjh1LeAQ0WWGloJc0v3xNxE6ssV0
 J7m9184vveWWWZJOt8l1q32aEBd23cBVosbVYJOwRR5CMMDpNfLirujLt4e909ouXe8X
 GLMqna2bkQq5t3ipj9MkewTIschAavO/4rhkrVDHXu9AVYN3lSc1cA4fEnF00XhooKT0
 iB2w==
X-Gm-Message-State: AOJu0YxwrRQaBrzNq8YEE8IFlrxQudAI980No9geqgldiMkbtlc73gIe
 izleUWkLkDBCCa/BQLjBCSU=
X-Google-Smtp-Source: AGHT+IGxVgtj8iBRN4Uc5cMOHBm70nnnpeBmu/gwXvx3Y3ra4Uxo51EceybqbcoqUopaknIFYYEiQA==
X-Received: by 2002:a17:907:c018:b0:9bd:bbc1:1c5f with SMTP id
 ss24-20020a170907c01800b009bdbbc11c5fmr3589383ejc.35.1700388899176; 
 Sun, 19 Nov 2023 02:14:59 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:58 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:36 +0100
Message-ID: <20231119101445.4737-12-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;

