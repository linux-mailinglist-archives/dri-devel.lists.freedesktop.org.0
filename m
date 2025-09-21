Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A2B8D79A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 10:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7C10E337;
	Sun, 21 Sep 2025 08:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="UfF29hF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D5910E337
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 08:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758443816; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nxXNMqI2qg6zufy0Xd4Y514jhC0IROp7AKcI+Aanga4iNtC53S+f5SZL28kR7zqaLaKqnEOeEdfFgZZaSSjYIl0mPPFMAT0Cfj+G3lVh2nZNyrNxZVjiKR3/GoZHdaVYCpz3JnsLttwE6Cp1y1to0+RcxHJ1/L0hbdOyCc5ma+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758443816;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=codWgtTq6Zb64pUUOo3Dzr6/p0mx/o9YUriH+67Le3Y=; 
 b=OZWl27m87tvRQ788UMUql8HK10J3MIqNzlvXMwQJ6vcMokzda0xrsNi1mptshA5/cIUt62X0XQwyo2Kwce7HsF9ciMa7SNzzEdzCZ3gWW6yMssgRly90DoLOJlLjfMz8uHa4eOqQI/gTI5BvQ4YI2x/0TvuxOnixhzNoEKr24fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443816; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=codWgtTq6Zb64pUUOo3Dzr6/p0mx/o9YUriH+67Le3Y=;
 b=UfF29hF1PQmU2MZ1Ge9X15w6oi2ao/rzoft/tWrDjnjk2+okrjGjfXRQI0xCNBub
 UVPT3Tu9DJNDAtKt2eW1Ew/fDjDHd3TkCa2aPYSrXtqQTjU56WEdmdLjKlQhqFARjHl
 9Kv/R6793q+gkpEcZc/12JSK9MGbqJyzG4soMAFYY7MuMUulyjY2dnOdw1Sb/XuJPnu
 0+L3lyKvwsuruJcQQU36oQFC1hRIcKxeOtkaDoWCgrPH5134OWdtyuud08tftrbvXo7
 tdUzRqiYaUOkkC9VjOPVYWn3caGMCW2Yy8ltlL9OjUuFbLZJWH4k+QyFquq4NOfjZ00
 vQCziCay2g==
Received: by mx.zohomail.com with SMTPS id 1758443814250482.2030454290558;
 Sun, 21 Sep 2025 01:36:54 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 7/8] riscv: dts: thead: lichee-pi-4a: enable HDMI
Date: Sun, 21 Sep 2025 16:34:45 +0800
Message-ID: <20250921083446.790374-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lichee Pi 4A board features a HDMI Type-A connector connected to the
HDMI TX controller of TH1520 SoC.

Add a device tree node describing the connector, connect it to the HDMI
controller, and enable everything on this display pipeline.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 4020c727f09e8..3e99f905dc316 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -28,6 +28,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &padctrl0_apsys {
@@ -54,6 +65,20 @@ rx-pins {
 	};
 };
 
+&dpu {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out_port {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.51.0

