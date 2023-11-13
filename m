Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667D7E9B12
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4427710E354;
	Mon, 13 Nov 2023 11:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEBD10E353;
 Mon, 13 Nov 2023 11:24:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso31960505e9.3; 
 Mon, 13 Nov 2023 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874654; x=1700479454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=H57oAMA+MtBP40SJQZeKxDrQb0sz60tJWol0vK7/Vr0gh7KJT5AWBPg+chuVIMHx7M
 jgmhwNpuxoGBZbWA68Y1z3LbPE3rP4s63SnG4E3zxji1WLn3IL5A6iRCQARWM4vNGfHm
 xw9eyOOYE35WeithXrxxkkvyopWMwJvKpIGI2DHCRnps6niWlVQoesKJUWE0ZeclIYan
 UEB5ee7iAVxH87Z1UCIGphhkYIH6/EtTERtUz9caZqNcMvh3mns+EQivbZo+zfp35ahU
 WdmoAzyy/mz0Zyj0gT2AbS9JlRHhq8SWw/cGb11b/1UB1MZzvWpU+yLKnamB3m88WiTg
 segw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874654; x=1700479454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=GEyDlpMyUdpg51Q0WnKsSKVvDAREXma6RPaa+jGHlK+eHUACZxoHxjImUTHHb0+l8E
 rNwcCLJVFPJAEy8y4iwnYDsTuEcJkmYnRrQF0pFkpYHg6j3XLV06uca3JlnkSf2Ajkdb
 tn6QUsuGY+6dbDThwxyhGsrWFg6EKWbDLtpv9a049Qccj3a9+njQXbH2vbshyO1Afd+a
 jweFDTbqhsWXn9EDnMM5rV++XJmjK/LRklo1Oh56oSlpsRrznxnaM8sUay3pZtevdpMd
 KOrYuTxSmSdz1LwEk/601MaC7DYQWT0w4btGGSsK2bzZ2wtBqYeVQoCkeSjxnhYs+tsw
 nhzg==
X-Gm-Message-State: AOJu0YydcV5S/HT5oDiboHIMPy4D99862yIzNs0LuEgG2+b1TZyZsE5A
 9iinuyJulkbMIbbISyfkwgE=
X-Google-Smtp-Source: AGHT+IFbNwXT87/A3jEt8J3J2IIJaKfXP5VLFa7X0d4Q5ivIh7Rq49/jVdFtcRm7vBeOvUh6yIYXWQ==
X-Received: by 2002:a05:600c:4f54:b0:401:daf2:2735 with SMTP id
 m20-20020a05600c4f5400b00401daf22735mr5024747wmq.31.1699874653800; 
 Mon, 13 Nov 2023 03:24:13 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:13 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:38 +0100
Message-ID: <20231113112344.719-15-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004..7aa500d24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -249,7 +249,6 @@ struct i2c_adapter *msm_hdmi_i2c_init(struct hdmi *hdmi)
 
 
 	i2c->owner = THIS_MODULE;
-	i2c->class = I2C_CLASS_DDC;
 	snprintf(i2c->name, sizeof(i2c->name), "msm hdmi i2c");
 	i2c->dev.parent = &hdmi->pdev->dev;
 	i2c->algo = &msm_hdmi_i2c_algorithm;

