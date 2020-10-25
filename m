Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178EB2987F0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC06E9B2;
	Mon, 26 Oct 2020 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395846E214
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:18:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m16so7720756ljo.6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ovd3NfCSdg9bU9dh+4Q2Hup4+qw/LQb8GLpwFqymMtc=;
 b=vApupjdqceo8kwP7tkGiF+CeQ8HvVO4ehToXNBsBsUmIc4KnM+YJ0S4Y4ArrsEMGjn
 +BPJRAJRcghbrs0VxErvKhsyNxIp/ZJ23/QrhfQjJ4uJk51ZXep0Z+ZPhPhCmfaoN6Rn
 eaGHbRlrBGqavhKX+ofjdK9bnocwog2+2nA3fmns0BkNXQAdeQ5ufrg3tih/245qGrOn
 tGM1NY7Bp50qpSHx0SUuiH2KMsCljtOwXJPwAv9Hm2zUZqQViG0UbP36596PMpPi9dQy
 x5XDMfT8AplUSiGEnjQB4KLE11Puqq+7Uahrf+KUEqJAtCbDvDrczogIMmKe4iKK/Pn9
 Zpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ovd3NfCSdg9bU9dh+4Q2Hup4+qw/LQb8GLpwFqymMtc=;
 b=QA7vbwUij10G6q5i6rDoDbUDPLrXvUyQeVyDACxTtBagXwfP8fr32UU0Tay8dYxve/
 HP7+9g08sl2OHUDcjceAjfEI22L+r7n7tMuKzzdDxiz4pNkYsI3ZVWg8NXtFmQIzfHKC
 mBqTUkPzJuB1PvzlC9xr0ECHw75U+QZXlaqxMJFcOtsSqdCgzHZ4Hgkf1egga7SmogxL
 ZRbJ64b+XGFbwgrTdm0ElP6Fj3xw9iyz0cp0as1x93h+KIZjdYmSucMdZiUQTYZ660gm
 wGNRzs0mAZZ4gEsXwe/PXKC7wtnyW7S6CyYUdi9IRHsaXTg5DM/VKItnUtdB5sVZZiYF
 XKQg==
X-Gm-Message-State: AOAM530hrez6nU+FXj1aBpYXvszE0wSoHd1iVMxgUiVHiMrIKrO90bJL
 ZKUPxIxii5YKLf09kNpEYJk=
X-Google-Smtp-Source: ABdhPJzbzWcQnlQaOvimb0g2tW9/XFIjvrZFeaz5eC3PWUlh/rIicLca75To2aVhmYyDwr8FIPqAJg==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr535291ljn.378.1603664320708;
 Sun, 25 Oct 2020 15:18:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:18:40 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 46/52] opp: Put interconnect paths outside of opp_table_lock
Date: Mon, 26 Oct 2020 01:17:29 +0300
Message-Id: <20201025221735.3062-47-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes lockup which happens when OPP table is released if
interconnect provider uses OPP in the icc_provider->set() callback
and bandwidth of the ICC path is set to 0 by the ICC core when path
is released. The icc_put() doesn't need the opp_table_lock protection,
hence let's move it outside of the lock in order to resolve the problem.

In particular this fixes tegra-devfreq driver lockup on trying to unload
the driver module. The devfreq driver uses OPP-bandwidth API and its ICC
provider also uses OPP for DVFS, hence they both take same opp_table_lock
when OPP table of the devfreq is released.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 2483e765318a..1134df360fe0 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1187,12 +1187,6 @@ static void _opp_table_kref_release(struct kref *kref)
 	if (!IS_ERR(opp_table->clk))
 		clk_put(opp_table->clk);
 
-	if (opp_table->paths) {
-		for (i = 0; i < opp_table->path_count; i++)
-			icc_put(opp_table->paths[i]);
-		kfree(opp_table->paths);
-	}
-
 	WARN_ON(!list_empty(&opp_table->opp_list));
 
 	list_for_each_entry_safe(opp_dev, temp, &opp_table->dev_list, node) {
@@ -1209,9 +1203,22 @@ static void _opp_table_kref_release(struct kref *kref)
 	mutex_destroy(&opp_table->genpd_virt_dev_lock);
 	mutex_destroy(&opp_table->lock);
 	list_del(&opp_table->node);
-	kfree(opp_table);
 
 	mutex_unlock(&opp_table_lock);
+
+	/*
+	 * Interconnect provider may use OPP too, hence icc_put() needs to be
+	 * invoked outside of the opp_table_lock in order to prevent nested
+	 * locking which happens when bandwidth of the ICC path is set to 0
+	 * by ICC core on release of the path.
+	 */
+	if (opp_table->paths) {
+		for (i = 0; i < opp_table->path_count; i++)
+			icc_put(opp_table->paths[i]);
+		kfree(opp_table->paths);
+	}
+
+	kfree(opp_table);
 }
 
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
