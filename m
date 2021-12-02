Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B3466803
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0EA6FB3D;
	Thu,  2 Dec 2021 16:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874F6FB2E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u3so72841568lfl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=q69PrNnnB342xHj0Cmqq2IVpuiQ2yIr1SiDnwh853ktdMDtdg2yLC7IW7gqRU4i6/U
 5nKC8Jp00I0jT4jKqq+MuCr4Z4iDPu+tBACGO5C7TYYhrCPaNBaxyj4V10DohzUP9wD/
 5OXCvt9fdCHB0NcTEHQf58Qiaj6Qs0YNyJ3mawa5+QnakKhRkEZO/+6AJoHjpf3C6gG1
 5ER80osacA2YezjNOQZ8SmyD85KO87uHQL7SPIpDejg6m3uyLioFtPKYKnRrNDk2z/si
 ymaCyxjh9lLmGm1XlzjUWX1olcNo964QNqvZTbdt6kcNceEvlsWzqTK9/qJRnRE89zN1
 WsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=KE7u67vjoAsB2d9PfSnqi/NuunZV9EWBDBewGd0cvEA8YqlbB72FhMEPhr6ibkBBGH
 c2QpBpdhEV2VuTJLFJDsLrEOOGnS4FNT1t40uvtDH4+ppFDth7yIYsT9wOoP5jn3K4po
 llf3wfdkUB0B8i0rgM6DRPug+onHhF2ssoU8srVuwD9kJlyoSM5G0HejYdLyIpsPPSPe
 97yr4AIkVGeKYD/Gp0MYsBG+jHV+4sQ9eOOKYaUm04PsRZlwnB60HS9MUoYXXTLoQU+W
 MaK0RV4FxaJrjc8d4D3SkdLFnhy+X87hh24irt7iVmFvvTYvM3XuYGWTjEwb+yX3mdV6
 4zgw==
X-Gm-Message-State: AOAM531iuPmDaR+bVQsnK+HVo8zhRf7kOz6pF73SoVAd9GpUMxB2P2XP
 gy5g+TSJg1vDZ5kuYLtHnbg=
X-Google-Smtp-Source: ABdhPJwz0qeqhDbbsnUNCtz+fTMa7GcVlIXkWFGDQHWdI9fpFBeUVePGAgCtQXEjmzk6lOE1dH7qyw==
X-Received: by 2002:a19:6b08:: with SMTP id d8mr12695068lfa.39.1638462326465; 
 Thu, 02 Dec 2021 08:25:26 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:26 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 11/20] ASoC: tegra20: spdif: Support system suspend
Date: Thu,  2 Dec 2021 19:23:32 +0300
Message-Id: <20211202162341.1791-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index bc45a0a8afab..a4aa5614aef4 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -345,6 +345,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
 			   tegra20_spdif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
-- 
2.33.1

