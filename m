Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C12BFDF2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97FD89B8E;
	Mon, 23 Nov 2020 01:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4148889B78
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 00:31:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j10so3728018lja.5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 16:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=kIBfjtzjMxKLFjJgXEEAKXcl3ov1jq/BrBvl77UGHUmdfPCufpfKXVrwIkHiSyGgyD
 LdMa24krxJaC1ueS2JTSv8k+EV1+Jhd4ykKys4b7fAMrVzkicgDH6LmUyKuQjRRbbN57
 a8dv/Xu0cgsjPzIAz4E9mQ7x4XFFln3nCA01Oh826AYLp65MhBspgDmelScAv8Z0WZym
 Tv7b8QkN3gGBchzLLymygOFNUd7zbKkHE58E0Zzm2t8n8KmvE0h/z51JrR4A6x3J+mu+
 d3CBgt00PQOK2BsN6JdIHkUfdhZZdNYZbaVQz91kVDmD2gkxT1nVkv1gjdoYcR/mK0Zi
 jfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70AwH8cNmd6w58ds7pz1XboJoFvv7hESZcajbSOVJ0Y=;
 b=oqRYvykI7WrmnsjN5p18C86LzrLhwoc5+/73kJLGiZYhG+A8HRJAom/c4e8nK4IqNe
 1adNL7i1M2iERFHc8j2uZcjZbPIdS0Tlpwx7yUyoelSWhWfSiZcXZAJpf6wUZTrZ7LS8
 UaDhIGTc1SQBM73DyJply61fc6AR2StWs0j0MzFRN3Dd1XYmlKhLTQWmbAvV4FYZIz/C
 EpUWdrwFwnHlh/OjgMjiScZc+h5fBfoPIPVmUTfAiOVxE+LyTdJpqMVsSf27rhtbOqJe
 3ogFcABNLWK2lqBdVrJ1kYrP5/whAfCtpXPlP+pb2DObtZ1F88/g1EG8Wkazj+cG/F+c
 T5xg==
X-Gm-Message-State: AOAM5301LI+axtdElVuRxgoW0R99zq/LajpM/xefPwBQy7bpzhhDnBS+
 q9bbg8QVR/IEQOz4QKAso7o=
X-Google-Smtp-Source: ABdhPJyiNH4h/8h8zz59oXRW/lFxfTeYv1BIFvhjeOfz93zo8pVAnnpIlPs6f5cPhCPRf1xlcEzaTw==
X-Received: by 2002:a2e:9205:: with SMTP id k5mr11255310ljg.38.1606091491729; 
 Sun, 22 Nov 2020 16:31:31 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id r27sm1225823lfn.290.2020.11.22.16.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 16:31:31 -0800 (PST)
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
Subject: [PATCH v10 16/19] ARM: tegra: Add nvidia,
 memory-controller phandle to Tegra20 EMC device-tree
Date: Mon, 23 Nov 2020 03:27:20 +0300
Message-Id: <20201123002723.28463-17-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
References: <20201123002723.28463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add nvidia,memory-controller to the Tegra20 External Memory Controller
node. This allows to perform a direct lookup of the Memory Controller
instead of walking up the whole tree. This puts Tegra20 device-tree on
par with Tegra30+.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2e1304493f7d..8f8ad81916e7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -663,6 +663,8 @@ emc: memory-controller@7000f400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	fuse@7000f800 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
