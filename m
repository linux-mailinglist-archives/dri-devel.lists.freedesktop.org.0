Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D202DDFCA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08889BF3;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB9E6E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id o19so34205381lfo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cl0K+0TJ44kvt29rpR6eiUIQXd8X64NWC+nXmDDHd1E=;
 b=MuUFzZ0hzx33koe8Q6SIGZb5hKTQFzBpBJUqh/SixgLOznrLg7KOMWUpURY+xeV5Hx
 k/U2399Zm9gNeQBBswlgsbKInco0EB6omSTVgO9I39a9yEFyNbqx2xScbrINdw4W49qY
 oiKEDur9FjWfspdRBhJVowgv3c0OeHonvL9BobDtgnQY/086LE0DqE29kK45w1BEDk7I
 zzqJiWQFQ1bVlAlIio0abJ+fAaM3fA84dpqAwotrs+rIc80eNPDuZdkjvHELUM24Caal
 /nFPceaxGOpDV1296lZGIWzVC+Jwil9tc0hiEppkOjRemaz3NCAyDRkyMJl/pkge85aG
 auXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cl0K+0TJ44kvt29rpR6eiUIQXd8X64NWC+nXmDDHd1E=;
 b=j7fW5rbBHqnOsJq+MEJVFCEwWjO5GVJ2GM37cIYc31XG17xJOz6F4XfhiZlFZB0QPM
 +MFCnmb6prXPDPh0lnlAnmopyTFdDhmcrLS2wAoaj35PdnPcx2J2TqagvYf8dFaf4bWf
 rrA4sA3rrsr4ZI/Zc7872TRa0G6iVYwT2U9KdHrelEESAp8tkQsjrV/phIRX0kKwA2/W
 7eG4xWOv6mgUn9N0UmrepbnFAxKH/fCjveDTWRCC94Y6yGgsAOKEqVOcAFYoJXUeh7uS
 q6NDrG5upWQOf7Ud9sj/ri0EjsAFII3RzE+MkGW6dxvzxxBToairIMbZRitVWqi0YkVk
 M/Dw==
X-Gm-Message-State: AOAM533IZxYvHx1djrfmUlFtuYflT93UU+tSDzx0jUoWSShIwWWNNTyv
 F+U2m9HhQgsOXi3LxdM0YGU=
X-Google-Smtp-Source: ABdhPJxPFZeRibTS1CFC1H/daUZkN+6BWmcuzHohtcds5PZPgAc+ohRMJgojJ6j8E/2dmWtFFWDUxg==
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr207999ljl.279.1608228439106; 
 Thu, 17 Dec 2020 10:07:19 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 01/48] dt-bindings: memory: tegra20: emc: Replace core
 regulator with power domain
Date: Thu, 17 Dec 2020 21:05:51 +0300
Message-Id: <20201217180638.22748-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index cc443fcf4bec..143439b50c92 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -23,7 +23,7 @@ For each opp entry in 'operating-points-v2' table:
 	matches, the OPP gets enabled.
 
 Optional properties:
-- core-supply: Phandle of voltage regulator of the SoC "core" power domain.
+- power-domains: Phandle to the SoC "core" power domain.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -48,7 +48,7 @@ Example:
 		interrupts = <0 78 0x04>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		nvidia,memory-controller = <&mc>;
-		core-supply = <&core_vdd_reg>;
+		power-domains = <&domain>;
 		operating-points-v2 = <&opp_table>;
 	}
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
