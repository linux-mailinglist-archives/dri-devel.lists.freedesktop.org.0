Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDo4AH6Tl2mL1AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:49:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67294163600
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 23:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456B10E33E;
	Thu, 19 Feb 2026 22:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dXOkDEQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75C710E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 22:49:30 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8c70ab3b5fcso200425785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 14:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771541370; x=1772146170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MfQfBaf9AAlms3smQ5+Ri25UHHgHjEr008f22TiaTqo=;
 b=dXOkDEQYFz58jSHQYHjARiUZfoDkl13fOp2bci/no4gvg+sAK7STlRZ4UKeH8AECob
 ZxlTXtctoI86IEzP89MF/BAdfks9lIMhxa+Ql5LWbW96eaG6jPOvCFYTV2ROw0IQnzCy
 V3kkydBW/dKvO+m0iIrhK29sx56B3jzZvQ1GZsoOBZhnI4c1aVVWnmo1UnmQNHIUafFp
 osP9vr6cnkI9IDAefsreS1ryFCvd7EehQpXe4EpJNfgvO7iXQwuosdQEs83XukJW67JJ
 c7CdPGNBaCbM5Ug+MCw7svSMqu1/Zp1UImit/YVWPj6uBpbWXJ4O6baEKpM+98OcEy7U
 eahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771541370; x=1772146170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MfQfBaf9AAlms3smQ5+Ri25UHHgHjEr008f22TiaTqo=;
 b=nxQJorNtzY9Ckt57TzllMYw7oYsJ1SNjUMZB++LcRrWMBsGPDh1+LQwkuI2Xe1rcc4
 j9OSMQXDfB/MGbUGX3ZNkrSmy60lFB4ZQP6NtMqShcFFNqeRP68s7no9O+OL4h0sQpjk
 Zd0d+JL3aK+3KwOackM4+RlRDieLmau3VjQ6nMgsBiiuAwsuyp3omTNfIx3/pgHIp0AU
 Sd4a4WIpPrh3g9niS5eO3603h0Jpd+kJ+dfXAl04tYJSHvkMwBzDWJ5YqsXRgBZJ76/7
 7sehbNnE4cLny9dUxFMyFR8XHAyvTGSuUs5um2eeiurq5xNXJCwtvo/T/nEjRcRnsvP8
 ZXrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmKL/CKU8FMvY5HvWqYNtuKtIsueuZV7gu/A6fyxbZe5ysWgd8YAnJfmMz1pDEjDSCSxzsJwjf8A0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx4+ZkjYdIx2W9AdzC/zvfooqB7aOMw7jAA3kxlQbjyTd4XSZG
 84YYojZTFU3wjw24VzJoppxIIgGUzcCj70m3M21IXgK690+e4Tb090Bc
X-Gm-Gg: AZuq6aIqQJfLsFMKAjRLHWVVUBMJUX1bXKgzb0pdZA2tbzsM+imSpMakoOl/5AdNPqc
 kBUDlUmd+5+xpgqTpmtmEIucJu11G0Ks4AK0fjAuzLZVFuqXpHLwimaXY843+yN7jjvrzeD5+aa
 TMFVbuX+xI2JLKu4vXumhK+YoluTf4wZP57Espi2FPA3WkbYZnmffltnX5NdJb5NAh8GpJ+kS/P
 Q8wHA1YnkLp2PWhiHa4Tcbk3oAznp//zRCqo0zFsHc3WcI48o7XGiC0GJkwLp/SZB6sLFafZko9
 YG3gha12BNQALwPKLYOzrA7sBWA+dB+Dv7wH/JegtYB29PKbtz6kq8WNHwfkrybSdSE4Q5BwCcB
 WAjiC/zebOreGqjWdi+gkUyeAyFbuA8eYR1Bz5BcO4HrM4q8I4ZtT/YDVMaP4e4jLGNmCvnHu0w
 Lrm+ncGgbF6ndEUQWZGoqgY69tLsevzv3wnHhYNA8N2El/lSe7O1SkKGyDMnxrKe6u3U1ZJWnoK
 kilojVUe4E=
X-Received: by 2002:a05:622a:613:b0:4f1:d85c:d7c3 with SMTP id
 d75a77b69052e-506b4020b97mr249828281cf.66.1771535059258; 
 Thu, 19 Feb 2026 13:04:19 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506b275d59fsm153971511cf.32.2026.02.19.13.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 13:04:18 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v6 1/8] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Thu, 19 Feb 2026 16:04:00 -0500
Message-ID: <20260219210408.5451-2-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219210408.5451-1-bavishimithil@gmail.com>
References: <20260219210408.5451-1-bavishimithil@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.48:email,ti.com:url]
X-Rspamd-Queue-Id: 67294163600
X-Rspamd-Action: no action

Add a dedicated DTS file for the TWL6032 PMIC (Phoenix Lite). Already
has driver support with TWL6030 (Phoenix) since both of them are so
similar, some nodes can be reused from TWL6030 as well

This can be included in the board files like twl6030
Example:
...
&i2c1 {
    twl: twl@48 {
        reg = <0x48>;
        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        interrupt-parent = <&gic>;
    };
};

/include/ "twl6032.dtsi"
...

Used in devices like samsung-espresso, amazon-jem, epson-embt2ws etc

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 arch/arm/boot/dts/ti/omap/twl6032.dtsi | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/twl6032.dtsi b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
new file mode 100644
index 000000000..d599a2ca6
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/twl6032.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Integrated Power Management Chip
+ * https://www.ti.com/lit/ds/symlink/twl6032.pdf
+ */
+
+&twl {
+	compatible = "ti,twl6032";
+	interrupt-controller;
+	#interrupt-cells = <1>;
+
+	rtc {
+		compatible = "ti,twl4030-rtc";
+		interrupts = <11>;
+	};
+
+	vio: regulator-vio {
+		compatible = "ti,twl6032-vio";
+	};
+
+	ldo1: regulator-ldo1 {
+		compatible = "ti,twl6032-ldo1";
+	};
+
+	ldo2: regulator-ldo2 {
+		compatible = "ti,twl6032-ldo2";
+	};
+
+	ldo3: regulator-ldo3 {
+		compatible = "ti,twl6032-ldo3";
+	};
+
+	ldo4: regulator-ldo4 {
+		compatible = "ti,twl6032-ldo4";
+	};
+
+	ldo5: regulator-ldo5 {
+		compatible = "ti,twl6032-ldo5";
+	};
+
+	ldo6: regulator-ldo6 {
+		compatible = "ti,twl6032-ldo6";
+	};
+
+	ldoln: regulator-ldoln {
+		compatible = "ti,twl6032-ldoln";
+	};
+
+	ldousb: regulator-ldousb {
+		compatible = "ti,twl6032-ldousb";
+	};
+
+	smps4: regulator-smps4 {
+		compatible = "ti,twl6032-smps4";
+	};
+
+	gpadc: gpadc {
+		compatible = "ti,twl6032-gpadc";
+		interrupts = <3>;
+		#io-channel-cells = <1>;
+	};
+
+	twl_usb_comparator: usb-comparator {
+		compatible = "ti,twl6030-usb";
+		interrupts = <4>, <10>;
+	};
+
+	twl_pwm: pwm {
+		compatible = "ti,twl6030-pwm";
+		#pwm-cells = <2>;
+	};
+
+	twl_pwmled: pwmled {
+		compatible = "ti,twl6030-pwmled";
+		#pwm-cells = <2>;
+	};
+};
-- 
2.43.0

