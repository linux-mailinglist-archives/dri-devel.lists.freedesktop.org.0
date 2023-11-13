Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2307E9B03
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7910E341;
	Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6517710E081
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:20 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so12110791fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874658; x=1700479458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8o2HXYJRUVQ1Lpbm7zM61UahrNOCCIAHF27L8iRvJeA=;
 b=EbYRLcwxupyOJ3bk2Xj+BkwNNzNvs6sCJq/fRGqLClJnfORNx8NPhzlJUDjID08115
 f7a/6UjX0w52azE56VplBsRm5iruhc/31kUCjQ/JbEKjSFmXBax3nqPmN9f4bb3+IIBF
 58WSGmwlNid3CXYorw/0BHgFKk3Lmbk5ZCYNmSRVQdRFIyxT7zkSCkQAvdeUo/Z7ZNAU
 exsuzIjLNFZP5GVaUnt2HtQ4j0Kd55/s/GVaRw5CgSft2V9inTlCcw/TnWCFzs1jy2SH
 Dur+IbBZLcTr4C8QqLqV9cA1istHN8rnC4HAeVDumzcXjT29Czrd7ejxaO0V9sIbt4vL
 XurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874658; x=1700479458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8o2HXYJRUVQ1Lpbm7zM61UahrNOCCIAHF27L8iRvJeA=;
 b=HqZvg0UzzA5rME9XF5d03mTkA2TLgqqcn0nWleHV+GLuwfN+w71x2sAmxTkgpflR+v
 z8jT/KyjpW5dO4wO2Cf/uUjBJfqAXbEHa/dzlVP+EhuNmxsugqRx9FqLCwLnMzInBomv
 tKcjiJjbQuRPqHdjK8c5yxMEWGArP1v0eR9XO6HBjvR3caZHwgxOeakJlAi4WfgNuXYi
 CgwX1ckHmqVMIpAD6g2eyQL8FjjHq2rHrCeSVKyCrEC8x29sOEF+yBlXwn+YnuSWXogJ
 33/ZZqd/yQ+Z72Njwj7nJuNj0s8IVxl0TogpsbdXI0K+0tOdmUY7OoDDwch1CGjGzWUD
 3QoA==
X-Gm-Message-State: AOJu0YwX88tB8BWvKvbG5T+OLZA9V/TC62wt6jh8ZVWtmzekQx0mVV0H
 Av+jQLxicYfZDtYjACBc9vw=
X-Google-Smtp-Source: AGHT+IFM+nvF+UETcm6JP5xDJkQVdoRgP72tN5q6tLWm5ga4IahPJk8LYKIlkJQCwwcn7w1SgkhZHQ==
X-Received: by 2002:ac2:5e87:0:b0:508:19be:fb2e with SMTP id
 b7-20020ac25e87000000b0050819befb2emr4055348lfq.58.1699874658428; 
 Mon, 13 Nov 2023 03:24:18 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:18 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:43 +0100
Message-ID: <20231113112344.719-20-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;

