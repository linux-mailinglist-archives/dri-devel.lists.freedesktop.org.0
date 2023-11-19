Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43957F0549
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0C510E1C1;
	Sun, 19 Nov 2023 10:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2C10E1B2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-548b54ed16eso68865a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388900; x=1700993700; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=ITGtzTeIgRzEeWG1DdxepeiHfZBj+IhnNf9CER5qB960vMdo1PquhAUzuPsNL7yloJ
 8HNGWeodF7jwF3RtjsinYcq4PRJIgJCc/DPo3SFIrpfrZJV8W5s5xL8vtearUTIVeYND
 jCSDRAgXkC/MlfrwNAToVKrqS0LFzAO4luLHzW4te7A95RbISmLFP73hsQFUJah9pNf4
 ot+WRa4Vswx8y8LVrVw9yzJk3yL0ZJjvixRD3paZsGvI9G/+pHl71Jkp8PpJUsNkh+ln
 p5jsbX2b/KnoKJqAkfjAty9nPyLfYEsFQPd8mTJY3BOfh5aOg/AbCLLqLTin54AQgA7A
 S46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388900; x=1700993700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
 b=enarmB1wBcziPtxUvEtJ9ytL3M9T+e1TCl98ZpKBrYOQ6nnfyaGivpq7yIIIjwT/O2
 MHSXlQpN3ZBcm2QYzo4C10lH6hx5toLbr4Q65D1ibeYBcYG+HZqGE97ecWwCRwy0PRsy
 kwgJ66SMWu4XJc75ocR5lFF0Q6MoNCBP3SPuXHTNc9bO2NcBqIqnucY3wQC6unoS92i4
 TIh9AFYvqFeiY6C4XkFgsPkOOeUSVQGFDYI+Ye9asxY89oY6fkAZzHKCg3sqAiezWjZ7
 kcCYVNqgo+Juth79KXKOffoSpSwHelq3mnGmocieQwF8J9JkVtQV7q3ptWfKIwE1dHae
 aL5Q==
X-Gm-Message-State: AOJu0YxfXUFQNFeFs3fxGVkOiwEkmijfx0SAsnXlcGfWLx0ZfmbHxz25
 R+8IaKv7JehkdHC7Up0DpYk=
X-Google-Smtp-Source: AGHT+IEA+I/p5Y2kpMMwz/wbD8AVKRFd+63nqxTeNaPbKOxKJmEk1Il1T/beHX2wdaQOaGPL4A2UqQ==
X-Received: by 2002:a17:906:221c:b0:9c7:5a14:ecf2 with SMTP id
 s28-20020a170906221c00b009c75a14ecf2mr3807104ejs.56.1700388900287; 
 Sun, 19 Nov 2023 02:15:00 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:59 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:37 +0100
Message-ID: <20231119101445.4737-13-hkallweit1@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;

