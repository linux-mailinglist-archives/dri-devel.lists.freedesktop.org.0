Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23881CDC4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DE310E836;
	Fri, 22 Dec 2023 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EF710E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so1833406f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266957; x=1703871757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qEiW87NdWMqG1i3IC5TsTsEJY+4saJvfxd4Py7tBWk=;
 b=m/c8QDsMSO7F2ENiAIxjPOfGIcr9okzZzGl7nQOLjrK6uJeKm3ssG5scHkwFZkwmOy
 F6rheOT3d+AZ0LppXIpHQP0odv3bwxMSkI9FJRL0JIM5xII1fw514DwJccNGwxezZgKk
 xwoOBtfPhmONIBn9VJ8IqtX7kdanRtVk2TyrSJ/fV7iu6GTtythyCOHZFDta99z2rNlj
 xr++MQZckAoUfN1V9hYvzI2TkftASP56xt7tJzDnfAFoA8vqphNXiqnDIwigOFHk9NNK
 ziBlz0mTBSUvnTrRv5oO4vvtSOxzmIHwF76VbocW3+UNbvtBDP0Fs4fELJTbkZ1y1bxe
 qcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266957; x=1703871757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qEiW87NdWMqG1i3IC5TsTsEJY+4saJvfxd4Py7tBWk=;
 b=KwXhKqdakyJjB8aGYfDmslY0RvFaOAd0dm/lj7uzMwTsI9MZ9J0CAdzyty9Mwvh2tQ
 SfMpQCYo7mk2YRIzAkL6hcG61LmZHlEtm/gNT0AhWqjFTAPnc/W5zps45q0OwAocTh4v
 Ke2okRVem8q5txBfhzhM28N2S33QgsjbJ97GSGMo1vUGJPQKKxCaX4nUGQT8V2cQevjx
 509aOxvG+4yxS634/+kbb6F2bkAlFXQ96euJp/Vp1TVbhK0RCt9eWZgFgP0tscwQ0W2l
 Qfq7vrqJMjZW95A2Ss1rRjjqmkW56vE8tNXzkd78b87YWoUZbtWGyFAuWwLCS5JRU8wY
 k4sA==
X-Gm-Message-State: AOJu0YyiLgpFIH5BSy6eIoB1pUOUSCzfM/U2l0YhWL8RBNu8abhMe8YO
 AxX0mtgq/xUNz/kKKihlCA==
X-Google-Smtp-Source: AGHT+IF/ILntBURjV10Ff56yN/onR9KNU6i4awRUbCKr+V/5OKfVGrXyAKwoOVxh00kqNwRL7i24VQ==
X-Received: by 2002:adf:dd8b:0:b0:336:8940:c4dd with SMTP id
 x11-20020adfdd8b000000b003368940c4ddmr968833wrl.8.1703266957184; 
 Fri, 22 Dec 2023 09:42:37 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:36 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 21/29] drm/rockchip: inno_hdmi: Don't power up the phy
 after resetting
Date: Fri, 22 Dec 2023 18:42:12 +0100
Message-ID: <20231222174220.55249-22-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

inno_hdmi_reset is only ever called when initializing the controller. At
this point it’s completely uneccessary to power up the PHY, since all
what has to work at this point is the DDC bus. The phy will be powered up
correctly when a mode is set in inno_hdmi_encoder_enable and disabled in
inno_hdmi_encoder_disable.
Set it to LOWER_PWR after resetting the controller.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v3:
 - new patch

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f3b90b479ab9..52b49f44a4f4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -202,7 +202,7 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
-	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
+	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
 
 static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-- 
2.43.0

