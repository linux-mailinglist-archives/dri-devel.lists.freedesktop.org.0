Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D007F054B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B17E10E1AA;
	Sun, 19 Nov 2023 10:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CD410E1BF;
 Sun, 19 Nov 2023 10:15:03 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so4629806a12.3; 
 Sun, 19 Nov 2023 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388902; x=1700993702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=fnL1iQzbQuIP5jP5LRnd/omRbh6XLqPYmBkjRm8ADdOMWnAeEcWfFjE97dC5aVNvIo
 PgjlzcSCQdmKTIyPRGbMuMIa8zkhfEXwxeECrRU1q1KHeJetkFH+ZH2Km6D6IdnZye6l
 XsHuq4iloNt3KrAEjbvUcq343r0LjkZCDjeNw/t8cjpU/8OYOW4/rkWJL4WCYgCDSh1I
 te8cDEgW5XsQ+0L6bE3Bl5U7oa/JD74CwaqzvzWCVbSVP4cwcm+OWaoCxQBPGhcPwAo6
 X9fMa4Nx1RpQ6WxgcgIB/FrNR0vfySfrHcnwFrU4IKtiodUzONpH+Vyy4yYQHT4Uazs0
 BVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388902; x=1700993702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwYQsxTIlPnpbp305mlbq5GplvUv/n/Jh48i1GH8+AY=;
 b=RvsnFioYYXCoRewUqjaqOcpG4PDjBJsnjjkDQUVuKegRd1BQjEFdPoGscpPgxQGTp6
 PBBPTvhYhzB5Yc5ov68960LJfUARYBW5SE9u2TgfFn8GhrJ9VtWXD4+BKSPVfFqTVG0w
 6O5ZstpQKfUaGid5r1uHlki+1BsPF1Qa7im0e5jFj58GjMV1KO1EWihqRv2TmZYG2ID7
 YSsp4o5o+t//oo2NPDwK/3CSEoK+rRIYe6AuMKLARE5hswg3HVKkI7m51VMd2Cmppg6j
 JGaxSjHyaRNG6QEa+f17z5YIHtX1GVfxl3OikL9LjthWyQF5pv0lGqneaos47EYLbv19
 P3PA==
X-Gm-Message-State: AOJu0YzqGG8uNWzNYflUfLyNTOvHReRV9+sztdJCV2b8MSoqxwg1AM3w
 YJenR7ARyh0eMByOee1nCiM=
X-Google-Smtp-Source: AGHT+IFev9QS7E6H4FnlLJ9liXoF5szMOjAZoTWwnTK7QH9BaW1t5+tIQ2w2UPUQ8sPueN6bcCrDGA==
X-Received: by 2002:a17:906:1001:b0:9e5:1db7:31b1 with SMTP id
 1-20020a170906100100b009e51db731b1mr2848642ejm.2.1700388902097; 
 Sun, 19 Nov 2023 02:15:02 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:01 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 14/20] drivers/gpu/drm/msm/hdmi/hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:39 +0100
Message-ID: <20231119101445.4737-15-hkallweit1@gmail.com>
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

