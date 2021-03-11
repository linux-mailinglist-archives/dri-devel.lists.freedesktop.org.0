Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF2337D9E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196206EB94;
	Thu, 11 Mar 2021 19:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550A56EB7B;
 Thu, 11 Mar 2021 19:21:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m22so41607057lfg.5;
 Thu, 11 Mar 2021 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvJsQOP1p7E9AffUBE2QJK2LpjrpqogJTnHjdmlAy3g=;
 b=AUzo78cMdsJJJhGMTgl8WEDo8UZcgsgRLS0Yrs3VHylHmn638Xd0SAmqI/iOnJbWSm
 ra6zNdyXsoQnp0pdaJ/2AJ+T2f1vxGN7nkfcyzC7lnVdgVqe6j3PeF83K9+mRN7lCkKF
 hQAq0EPSrB3u3utzKBpo32mTaZpxpncfzYqtxGLU1AZ9wDs6a+iUwi3/tM/THbo/ZDAN
 xgEZOlxDMPiB0d0auUpg8aYp4Qwd6tjWO3N9l7/0IolDJz5q2IH9RlTR1XQDHY7RfC0b
 zEx5c6UR/WdmgjlHVlAyXchnUUOiwUpQuyG21mOoptBg6CEVwXiQ26Urb5leOWVJKlXQ
 Z0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvJsQOP1p7E9AffUBE2QJK2LpjrpqogJTnHjdmlAy3g=;
 b=S0gzBTme41NzYKL9k30LP+lS2yXeOk1yQFF4Q+sxCmAAFYhlG+38KzS+aNh75/2OaF
 hXN7c9o8geUQ9jj0J0KCY8qEgJyRwj0sRTci+ty7jDegQqB0tebFpfEr+i43DWtzw0pm
 k56AeJY3egREfYyFZ5HCe2Gd5tyAGtkmh/FPGIew8uf28D1ua0cPMqs2JPiTDqVZ1mqP
 JmMzjoUYJjlobKoC5+jVuHuCBy3O8KcoLWFd2eB6J2iZEPrYYvTIISwJ4voCarESHsS+
 Bveqnbf8nKyaNg0uOv46zkIB8J29JLa+4pMp2O1XsCg0z0v+ybXtZTe5arvRJRmBKaBZ
 t1Sg==
X-Gm-Message-State: AOAM532JLyqqlhublWTQgYoyg5Z85yP6B0Lu/AyHqMy/trBnNpv3MsxJ
 2NUOcBvanUlg+7NR6y2PRcI=
X-Google-Smtp-Source: ABdhPJwW9M4QeeMi8R8HV+0T6eXqDdFannBfc6ezCO7f5Qrvj5lHmCCOXOavy0TnJcIgzJWLxaLzHw==
X-Received: by 2002:a05:6512:2212:: with SMTP id
 h18mr3101616lfu.330.1615490512780; 
 Thu, 11 Mar 2021 11:21:52 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 13/14] media: venus: Convert to use resource-managed OPP API
Date: Thu, 11 Mar 2021 22:21:04 +0300
Message-Id: <20210311192105.14998-14-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 43c4e3d9e281..14fa27f26a7d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -860,45 +860,33 @@ static int core_get_v4(struct device *dev)
 	if (legacy_binding)
 		return 0;
 
-	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
+	core->opp_table = devm_pm_opp_set_clkname(dev, "core");
 	if (IS_ERR(core->opp_table))
 		return PTR_ERR(core->opp_table);
 
 	if (core->res->opp_pmdomain) {
-		ret = dev_pm_opp_of_add_table(dev);
+		ret = devm_pm_opp_of_add_table(dev);
 		if (!ret) {
 			core->has_opp_table = true;
 		} else if (ret != -ENODEV) {
 			dev_err(dev, "invalid OPP table in device tree\n");
-			dev_pm_opp_put_clkname(core->opp_table);
 			return ret;
 		}
 	}
 
 	ret = vcodec_domains_get(dev);
-	if (ret) {
-		if (core->has_opp_table)
-			dev_pm_opp_of_remove_table(dev);
-		dev_pm_opp_put_clkname(core->opp_table);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
 
 static void core_put_v4(struct device *dev)
 {
-	struct venus_core *core = dev_get_drvdata(dev);
-
 	if (legacy_binding)
 		return;
 
 	vcodec_domains_put(dev);
-
-	if (core->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(core->opp_table);
-
 }
 
 static int core_power_v4(struct device *dev, int on)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
