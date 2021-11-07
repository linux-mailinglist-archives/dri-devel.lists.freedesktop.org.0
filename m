Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CD4476A5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 00:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162E89A1F;
	Sun,  7 Nov 2021 23:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B763899E9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 23:08:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m5so7610403ljp.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Nov 2021 15:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9v5NLsd56QrV5nZJkQ+d7hO2Yd8PMU4HBZ61bzljSys=;
 b=f4839dAeeTsiZ8mj63AV5j5utFMeJpPEnDERo1l0hCv1MW8oGkf8ONuBsSPkuqxYNK
 E335rYXB8bC9uffWBpf5yKOqcRj33o9Ffruv6Gcbp6Afkl6ZzMBzKMX+zxTP3T+a6cqn
 FmMouQVK2kGAci5Kx2+bWF6KKyLnTN4iMgtlMVxONaMLyu1OgvC64Na4PVHDXLHVsOCe
 XhtS0qXxZXfIi6Yh80VDaO32de7dzSD5+AkQu0/Ry5FS6I1rXz0DT2lDdwSkhk/3TR02
 cElQ+InWWLrLJzeJ7soPDG28VGWWcbFYS0xcrUiKf+8MgK+y1xkxBdPZy+wOWd2UraMO
 zEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9v5NLsd56QrV5nZJkQ+d7hO2Yd8PMU4HBZ61bzljSys=;
 b=a/NuaVm3htAIgtF2mez06AUFgcYEVsk/E6hOxTzJ9QrzdR0F9PhVG4eybHX3kQ6GbS
 Z4sKcEKq1fTVx+GQWJpC0wxobmtAUTxp4ReyETZIyLKK5/mDPO1VyhEWd+7gIsS0mEfv
 h0qa/pRNusBpvCeMGXV20OQNJkyHqPiT1Jj8g/0Id8ymsUoH2AB7lYA2JdfrodXIhoJT
 ACo37SrrOO8eQmgo9bbg4i+7xpQjs8jrBi/YBwnm5RGkM9Z4wbYgJU+zM8HmdZK5do5E
 di+l/v9Sig7Y7rc1j3KnBnKsUQ2zpNMmtDur/n49nHLS9MXZwLG1VmcqFn6fXMYe60Su
 YePA==
X-Gm-Message-State: AOAM532gYLGUTwhi4jpPrqZ6Ta2HA+uexpyBFy5JjR3CL+lcJkTxt0gc
 tjG7peCzFgcWB3M6SEhT28A=
X-Google-Smtp-Source: ABdhPJwYMReUcW/m+iND89XbkH7e/3YwLyLnc+Op38AjupihC25kL8XmQ80YSeO1/5ALAPUOmI9uHw==
X-Received: by 2002:a2e:4e1a:: with SMTP id c26mr76325410ljb.27.1636326506483; 
 Sun, 07 Nov 2021 15:08:26 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id l13sm1785694lfh.270.2021.11.07.15.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 15:08:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
Date: Mon,  8 Nov 2021 02:08:21 +0300
Message-Id: <20211107230821.13511-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211107230821.13511-1-digetx@gmail.com>
References: <20211107230821.13511-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_dp_aux_register_ddc/chardev() helpers that allow to register I2C
adapter separately from the character device. This fixes broken display
panel driver of Acer Chromebook CB5-311 that fails to probe starting with
v5.13 kernel when DP AUX registration order was changed. Tegra SOR driver
is never probed now using the new registration order because tegra-output
always fails with -EPROBE_DEFER due to missing display panel that requires
DP AUX DDC to be registered first. The offending commit made DDC to be
registered after SOR's output, which can't ever happen. Use new helpers
to restore the registration order and revive display panel.

Cc: <stable@vger.kernel.org> # 5.13+
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..e0d675c7c2e5 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -532,7 +532,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->aux.transfer = tegra_dpaux_transfer;
 	dpaux->aux.dev = &pdev->dev;
 
-	drm_dp_aux_init(&dpaux->aux);
+	err = drm_dp_aux_register_ddc(&dpaux->aux);
+	if (err < 0)
+		return err;
 
 	/*
 	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
@@ -585,6 +587,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
+	drm_dp_aux_unregister_ddc(&dpaux->aux);
+
 	mutex_lock(&dpaux_lock);
 	list_del(&dpaux->list);
 	mutex_unlock(&dpaux_lock);
@@ -718,7 +722,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 	int err;
 
 	aux->drm_dev = output->connector.dev;
-	err = drm_dp_aux_register(aux);
+	err = drm_dp_aux_register_chardev(aux);
 	if (err < 0)
 		return err;
 
@@ -759,7 +763,7 @@ int drm_dp_aux_detach(struct drm_dp_aux *aux)
 	unsigned long timeout;
 	int err;
 
-	drm_dp_aux_unregister(aux);
+	drm_dp_aux_unregister_chardev(aux);
 	disable_irq(dpaux->irq);
 
 	if (dpaux->output->panel) {
-- 
2.33.1

