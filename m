Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66E1F4F03
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF516E36F;
	Wed, 10 Jun 2020 07:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832176E2BD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j12so12452116lfh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tzjWXOFJZUWh4EJTzInOXHHEbdt+siqMf/YejHURVDA=;
 b=VnryWu+aK7L0DcpiyL1N3EE7vSAAw1+NT32TBAV1tcBb/suSZax3CH7mFh6FHpLDM8
 87OUFDzWVfo6qk3nbUEHkvI9kH21D+K6986gejHq+PeXGdN5AsW1CZIGo+SIbcMz7F0J
 +F4XLpJCSLPHX/BpmPlFdGd/Ur+gu3ozUYLTCQMGnaBERJYvYSNUL0bDKIG5DxlVBljg
 cqNlOz1kuqV60AHRNZuWl3kxJm78d4zTyXd1IFik28f9SlGmfBeovETkWgYl1dbbS1bf
 SHgzmt9BMXIUa+oqWX/w6adLSx8GqSkglDqU9Yg3+TnkUfxTPqvXnDhFQCIQs+Ujp11A
 YrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tzjWXOFJZUWh4EJTzInOXHHEbdt+siqMf/YejHURVDA=;
 b=rhgNN32G152s21XhQT5PWmRIJ2rXJATqs3A61E/IzoekUD3fw2fKXfXCX6dCUbGxvF
 BQvTGUrCgGCY8tLYF32rm0VmkuBJrMymlljIy6PoSnPrsjAVQJS6NBgneFkTcJyoCLfY
 WRxtCQq8JrQHo0HfX2cL/JEj3CCB0ltKM2kQE7mpMVJS67f5h4hn4dRA23XAS1bXRXFa
 cKa1keCs2qZfJKNyRwyCvZCp7bEKjouycLizG6uQ/S7uJzvRq/1l2qI1awTJBX/0V/Hq
 7lkkO+Yo4/jIPMg7QFlcD91OYzVNQ8ivl9mH0HecKUTggKR79Z0phcYxotvPuNoIRoRL
 7zzw==
X-Gm-Message-State: AOAM532FtX3bZ93lw1VZy/Tuf1RvbKJAqhQVZJ92tH5aFP6XTTE3y5X/
 GuCbyqM7GQ112AVVm+FOYgBfsLmx
X-Google-Smtp-Source: ABdhPJyeHIUP/pqKNcqji83du0vLJY5MSz/ENMwIxIYDajj/AC39DJqr1Xg3KQnU0hJWGNaSztmNng==
X-Received: by 2002:a19:6914:: with SMTP id e20mr15497190lfc.27.1591708474918; 
 Tue, 09 Jun 2020 06:14:34 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:34 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 08/37] soc/tegra: fuse: Export tegra_read_ram_code()
Date: Tue,  9 Jun 2020 16:13:35 +0300
Message-Id: <20200609131404.17523-9-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tegra_read_ram_code() is used by EMC drivers and we're going to make
these driver modular, hence this function needs to be exported.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3cdd69d1bd4d..b3c930b805c5 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -65,6 +66,7 @@ u32 tegra_read_ram_code(void)
 
 	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
 }
+EXPORT_SYMBOL_GPL(tegra_read_ram_code);
 
 static const struct of_device_id apbmisc_match[] __initconst = {
 	{ .compatible = "nvidia,tegra20-apbmisc", },
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
