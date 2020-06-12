Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CC1F7A41
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEEA6E982;
	Fri, 12 Jun 2020 15:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411B76E982
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 15:01:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g10so8448374wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPVJde5G6vCu7P63RAneWEkRXL9RWQBNNVI3/sqrw5k=;
 b=h0Vqr9EDa7jv0/PqjhzbsDDXtoiIm581w6Ckjafpp1UmdxjIsJMJXANBz2IaKtSx1y
 8IJvactV9GYUbdDnG4WoGfY3OZd0DdPkij7NxhJUI3S93TgdNUeAPFp74bNLxTLasGT7
 H5BsgaSF9NzrbiYnQ8qEgon83KQx3OVOV37v2yyDiWbO28flyqQzp0uEm0A+B+0ML6cm
 GCyb4dZhVfDv+M1/saDCXuF8BNwuKtdbD+4QjkOJOaK0Z7Xon/el+3aS9+dnszfuRFu4
 e59vrUdYmutSrvlb64mUPYfdUudYeAS8ciuf92gw9YB/QzMjoG1u5tzDAL2qR7dDW/ZC
 gJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hPVJde5G6vCu7P63RAneWEkRXL9RWQBNNVI3/sqrw5k=;
 b=cxuzkSOuYHsII124faQUY0BALDbqLSrGaK5AhApsvGUIMx4dpIf64+6Qo//PoHy6hr
 RoW6eUJ74cqHYOJ1QoZMle76x4a6mD0F60U0DVoqvQQNBYtgbwokV2loeHhCK/XeBK48
 D/FMg04OOGgMS+dwtv60+WkN5y9p2JmaNxVfa/ieLuS/U/hM09CHa+XEuAGFPzd6VC6M
 KBUPqO7wWPosCLlVs6Sy3MxZI2+N4hV/PcfbPKjTFfZkAAfE7J0Ak01b+AVK27oRtuaF
 q3l79mWo989lca5SAiqPHmfcypvIDaf3+uUCJ6hBWE8OZZEN6qSkq1cAsTwsrZ3orC8Y
 TNbQ==
X-Gm-Message-State: AOAM531otyS+nsZqT7/LvqHLi6woc5YOaaYL9mG5FU47nKJ3ojYJPtOO
 TI2w+AcgAhVDTCPj3ZbkuK0=
X-Google-Smtp-Source: ABdhPJwpZU/V4xi+IOdUOKQdpzm2cMGHMXYqD43AGxHGGcF2X/iHBTrwTCiSI522GbAql1jPKU+jgQ==
X-Received: by 2002:a1c:a943:: with SMTP id s64mr13613777wme.103.1591974066838; 
 Fri, 12 Jun 2020 08:01:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 40sm11203723wrc.15.2020.06.12.08.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 08:01:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] gpu: host1x: Register child devices
Date: Fri, 12 Jun 2020 17:00:59 +0200
Message-Id: <20200612150100.2419935-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to remove the dependency on the simple-bus compatible string,
which causes the OF driver core to register all child devices, make the
host1x driver explicitly register its children.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3c0f151847ba..d0ebb70e2fdd 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -470,8 +470,14 @@ static int host1x_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto deinit_debugfs;
 
+	err = devm_of_platform_populate(&pdev->dev);
+	if (err < 0)
+		goto unregister;
+
 	return 0;
 
+unregister:
+	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
 	host1x_intr_deinit(host);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
