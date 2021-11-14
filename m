Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07C44FA3F
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AB76E87A;
	Sun, 14 Nov 2021 19:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E566E875
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:05 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b1so31688301lfs.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=QhEZ8tLrd3loe2fHwxK6+51M7PXBhYl2Mb3I/CA3ScH2m6Kjyk6heV5l8nMCzW90HO
 rTUwhpfLT4qom95awhIvBEd/ZCMV2yRJcNNBD6s9BrgbOYOsPjGybWYQvzslajFCIs8H
 Afs5Rt6w3qQ+0XHhVE8DMtP7pFA9Qk9Wcjjh4PEe6XQWNenE/6xRSN8GZmslq1LB6Kn8
 g3Qxc+QYbg/YgSuiY5Dpiu4dCOfXoDYfIyxSzJ902bqMc5XVe/9IIbpn1hUUN/0BvOu4
 PjwMRCoROJqI2+8I7FJspdHzmDqhkgsG875PDL2/bpfUVroxNpoHzhSQ+WY/reTg7kGe
 blMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=Qpi4IqKVaCVN95rxwlrk2BLf7/5kIA2szVqJImjwp3N/A2dLBFdHbG5bUevF5l7xJP
 7pqeV9/e9+tiuTxgLt/aWK1zFkiz5gnGmUjqShwrSONpveYOUWd9YDxRMyg1oFQ0sDdo
 2/qT5aA8+yvYtZ3FaNzfF5hGPPA0DwIY/zk6VTkv6U8B1oVjVTXt/eXMhTCWLCnGUZqH
 DXNxdFBxi7IR1AUGgPnK3VHvJ7ZQ0RZshgTBdb//1PsqevH+m8cLUm5VjPHTWiz5ci0F
 FMwUj//KjUwUC4wlpOUbYr9sYjHbkH6oc+FGv0I5Dfd3L80O5BPYt7GmHRoX9uG89cqA
 JSeQ==
X-Gm-Message-State: AOAM531dk2pRCTWxCNpoc8MNk4h7QrxI1n+hjLQFrDlIT4/gUwvNQoZV
 +FdXJZZAXRyQwnpUQ07GuyU=
X-Google-Smtp-Source: ABdhPJy78tsaHkTtXQkUANfdWprKBp3QKCSyznqTf+vgxWn5eWntkrq5cYbdV+7IaqR1XP1suHMkvA==
X-Received: by 2002:a05:6512:23a4:: with SMTP id
 c36mr29320459lfv.634.1636918563468; 
 Sun, 14 Nov 2021 11:36:03 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 07/39] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Sun, 14 Nov 2021 22:34:03 +0300
Message-Id: <20211114193435.7705-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory Client should be blocked before hardware reset is asserted in order
to prevent memory corruption and hanging of memory controller.

Document Memory Client resets of Host1x, GR2D and GR3D hardware units.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 62861a8fb5c6..e61999ce54e9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -19,6 +19,7 @@ Required properties:
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - host1x
+  - mc
 
 Optional properties:
 - operating-points-v2: See ../bindings/opp/opp.txt for details.
@@ -198,6 +199,7 @@ of the following host1x client modules:
     See ../reset/reset.txt for details.
   - reset-names: Must include the following entries:
     - 2d
+    - mc
 
   Optional properties:
   - interconnects: Must contain entry for the GR2D memory clients.
@@ -224,6 +226,8 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
+    - mc
+    - mc2 (Only required on SoCs with two 3D clocks)
 
   Optional properties:
   - interconnects: Must contain entry for the GR3D memory clients.
-- 
2.33.1

