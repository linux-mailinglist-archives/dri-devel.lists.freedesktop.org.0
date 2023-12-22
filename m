Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C2181CDC6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D810E853;
	Fri, 22 Dec 2023 17:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843E210E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so1845458f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266955; x=1703871755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoHup+tJ34Km8AW+9n07V9L+jLAh9fwpCrHBqqRCe/E=;
 b=izeFE3XIVpCPcE3y3b6wY7TpIjI1NomFOYPP5wI96CTkXcvl3tkGX1XxFGNKBbnoei
 czVAD6iJToCMmHmdzOd7eAHV3MEh9vI3Q6xlEeQv4Yl9e1sRzVstR+rllhWZJtRun0UT
 jXPn3IMfh4UJfwEfJ1NpHgdMkO52pIZHmY7+VXwYD54QNOo9h6yDwH610hAvaOnxiC1E
 wksLc0DlfxKVkQrNNhQ9PPD88Bncry1dmvJ9YmtcN/UWWOfAi1D8spR7KuX9Z/pDzapa
 3Ku/FaAI7rMHnFZKTz57ygGRCYebLjZDqXYmmoVvRCamdbFxXdgxH1vWfDzf3wl+8Qud
 IPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266955; x=1703871755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoHup+tJ34Km8AW+9n07V9L+jLAh9fwpCrHBqqRCe/E=;
 b=T9wxduPaq9Ni3F8AcDJs792VUenRhIH7qQ25KeOygKLF3FMmo03JPo+XfMGq+pcJYZ
 fLdbWK7OoAqVCdc1ccRqBlFiGRRp6Mibx9SgoWecwt+rtDOD8xMssCUEr2HonMH0vK7Y
 vtKlStNs1CCAPRAnaBlaMXZTuYwu6z44hDYoYoFaKquQsBxXy4aXHMjtjYV9MeoOS6ri
 9kcvEX4lssLFmjKJes39P4cxQN5qnWF/Y1BhM17O1r6Gf72BcaSeAkIqkU6iLH+shdX+
 G6rxozHFIKH3c3rkQJBsXye/xblP3Lv6D2QUBO51SP52WffroMYaYg0dnGWP1RJzzqBY
 ZdEw==
X-Gm-Message-State: AOJu0YxuXnN7ZW7a3+dEiWzC9LD6PxuswQxG1rGkz3BnQ+ZW4Lil7cT8
 gKFvVbCV5G2Ecb7DAMiy2w==
X-Google-Smtp-Source: AGHT+IEnGIoJqNWWyiWZwjEzr0L5g9377mlPC0xqKPYwtqdze7Um6irPMyQs814kV87bqN1XpP/smQ==
X-Received: by 2002:a5d:400f:0:b0:336:8063:e066 with SMTP id
 n15-20020a5d400f000000b003368063e066mr798319wrp.52.1703266954984; 
 Fri, 22 Dec 2023 09:42:34 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:34 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 18/29] drm/rockchip: inno_hdmi: Remove useless include
Date: Fri, 22 Dec 2023 18:42:09 +0100
Message-ID: <20231222174220.55249-19-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inclusion syscon.h isn't used anywhere. Remove it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - new patch

changes in v3:
 - collect RB

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 138cd4287dea..c306db90832a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hdmi.h>
-#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-- 
2.43.0

