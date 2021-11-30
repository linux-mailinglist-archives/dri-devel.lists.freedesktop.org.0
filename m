Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54146427F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D416E7D0;
	Tue, 30 Nov 2021 23:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0546E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:03 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z7so23588728lfi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=Iz+By4hMaXHUZwDfNCwQnwHPuCiheJc2NwheZRIW0SCUuZLXO6Kzb0rHCFhXIjvcpq
 atkOkbTR7AyNqk3eYgRtR4+8TIHgEHeIX5V7awmkDF+cm8HK+xuAU8gwl0EW6OfiFiRd
 ZJs+lPfBU0yFZXSMvPR7IwR2G9j4BzBRCJUIQfajREXQmUMRjWP4eze74I3lCMdEeJSH
 uDWKf63VDqvCJUvuOA/yd+zanFwsJBx3KsYcJ7hfFxe/VteDysXft6+ITX5XRPiL2XoN
 e2UHyFk5KHUy/kdANpCvj2PHfbn3MizqGQaQnW4vf1cJQjiCOZr1biuXiBEMhC4ZbEGt
 7idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uELYhg3LoYYilCBTSAEvuuZR4UEF9kvdsKmUqE/otlI=;
 b=oUqI5c0nYg9DsdZVkQR/pmXED3UPEjle3U/f/ij0inbC7T+42USA3hgy8CdJzBfMQS
 HPhtM0EWLqPxTgt6kUoVEGhftX9+ULNx6NuW8LyRl8fyxMKfQa3wbiwWSbstKquGFhJg
 84LY0ns+u5TJVpWy4ikw8QE8gV7z/DAZs5RxAeJTmaJtiG3LL0hjNj0x0nrCmyXk31cu
 hdjEy2u9cWw2yk2/Wu6jZRJWyc+VjxH8gljYvnOt0yw3SbJPHupiHJr7Cb7+D0lDB94/
 9gt3lbHNYOCiNg0mwEGpOborSwhxS2yAd1OO3qzwYeMiECClOWH0aG9FwLQKdNHLmpAm
 hDuA==
X-Gm-Message-State: AOAM532HJr8A+sh5wCB+NnZONdbxwzA4f6teGIXXxj1JIpgw/l4GK4o8
 oYhuKI0vRZdrzqfjWMYPpLs=
X-Google-Smtp-Source: ABdhPJyEYwAI+MOhcdvc/yezPcOl+Jxo64iQcq1EFuIqq6TqVcWs235t3mz+TkeZYw65Aj2HR/gfmA==
X-Received: by 2002:a05:6512:682:: with SMTP id
 t2mr2162526lfe.503.1638314641879; 
 Tue, 30 Nov 2021 15:24:01 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:01 -0800 (PST)
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
Subject: [PATCH v16 07/40] dt-bindings: host1x: Document Memory Client resets
 of Host1x, GR2D and GR3D
Date: Wed,  1 Dec 2021 02:23:14 +0300
Message-Id: <20211130232347.950-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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

