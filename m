Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLUWOxuMeGmqqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C192304
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4210E027;
	Tue, 27 Jan 2026 09:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eLgHuhiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B4810E027
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:57:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso47013875e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 01:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769507862; x=1770112662; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2e0LebsihOgK1n8wthh7i3DWNd7QqTelv44kSjU7JJE=;
 b=eLgHuhiKuGtIgkoejTYf5+NEeTplZ6ACzKjp7TD+zT8wFxtpf+zpVz51UuSXj2yEGO
 6QFAVkKRiZIOGh62GFvLgCA7tk5ie9vKd40/2SfaD0KNhVvJBcOqiJQOSZJSMcUKfAwF
 lkyafPKwKZAZZTzHJ+2e74gXJu4dT/3N5gOaAo6URvVEgZ7K/A7XJm3b/6W5irDPEVRE
 K0yHXGzop3kSo1akwpXzFft6Z9Vq4/f9hvEEEE5vCmR4XAvKD0iONuos7XCJ9MpE7318
 5JffTRXHUPsdpa+azQ/wtk77rWDXtrx/i+QbZOwa6AVcZhpF6u7rC/uOUL9TPRVbjH9X
 C20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769507862; x=1770112662;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2e0LebsihOgK1n8wthh7i3DWNd7QqTelv44kSjU7JJE=;
 b=YhviSEYJ8bphdfn1yrWKw8Hmy0vIO9R0mj70Y+z7gq2rEJZdpX31ANQElIXznHGytS
 eXB7q1IdVpq06AO47Pmg7bXhHSf3jA27RT8GEaSVcZI/SC9x+zI5bFcaSi3BqqRruj2Y
 VxlwnEnYsrovowbQThq0E2wM/hgaWwIZSg/pixk2RFR6obIRrHuQlue/xPlMR1nAmPnr
 QFOxvJ+lUb4chTJ32aEznt7BbZ+eoG2pPR7gDL8CKmILXAnW00DxcIojKUFrRjH24DV4
 Qxe+cyQ1SHaCy/ZJBu0tp/+bjv9f0kBMy5p1YSJwjYGCEouHZZ+ViF0b+I01ydqrv/Bx
 3FwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXBYoZHBnBOYf9xZU8ZNDY0WWgH488Z9kqYjQCEWe9yj0alm1BZZNWSh81hHqAWS5D29Ca69AQpeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVB96lYHIF0CIOUY0VCPnnGLvJWWfWXb+s9XFiUrqXJ7ayBg8G
 x7YA5/6dW5DX8aksbVmtInuszxQwvTgULmD8xrhlxWmU5JFov78qbyt1k5rM5mII/Sw=
X-Gm-Gg: AZuq6aJzUhQvrKRFCiiwnYVanNRherCFd/yk/gYAq/iRBFCmIB0qyQnoh4M/ArCzndE
 +DapukH6tMLhjqNrbAP5FJdsZ6vY5UbdXcSsD3H9zFZknEfBVK5SpUKhWLddvhTtW1c3LeSvYsq
 SkfQRep69gKpB+ycq+WDSE6+Y5byka7qP14Ioqp05BwJpnorltQVjrA5/HvhSCU8JtSHltMYtcB
 YQ7oUpRmUpV3vCRUvh4xX3k0j+lYFjve1DS+7adIe9B/gpcaVbKeqtQf6vYOXNuROTu6Gcu1rhW
 U54EFLktPg+doY9sKHRAHXXT6uwgZtkHAo8sOL5U2siXOKRateGbSzZ4JYNHeyunbWGVhVJgQas
 zNV62oAOTMzhtZz4l0Y2aRfOlthEepwgiAAIcblsMrjfIotSzJjSpY9/5qI28D7jRmsPshFkVn9
 eE5ms3S+I9z7/+XshU+Rvi9w4vcrPXmVQ=
X-Received: by 2002:a05:600c:350b:b0:480:49ce:42cc with SMTP id
 5b1f17b1804b1-48069c0de5cmr14612455e9.9.1769507861972; 
 Tue, 27 Jan 2026 01:57:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 01:57:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Add support for the Ayaneo Pocket S2
Date: Tue, 27 Jan 2026 10:57:27 +0100
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeMeGkC/5WNQQ6CMBAAv0J6dk1bLKme/IfhUMoWNmpLuoRIC
 H+38gOPM4eZTTBmQha3ahMZF2JKsYA+VcKPLg4I1BcWWupGKq1gThN54LdtjAS3uogJpuSfOAN
 r6BwjSOPri8XQ26YXJTRlDPQ5Jo+28Eg8p7wez0X97F/5RYGErqvD1QTlpTX3F0WX0znlQbT7v
 n8B1huUUdUAAAA=
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1Ho0XG7dS+YggQv/oK2R0s/FYzjIvQaih1Dhu9EIl4g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwRROCpb0TMHeAc6TMUdXNXB9/fuPUVBZL9uXyU
 2FlCoHWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEQAKCRB33NvayMhJ0aEaEA
 CFi7NkRxXRZmDOfjdMNhmQFgH9m9TO18dvcYR4Szl4XAM66hsfrAr2BzHliKhGsuZGVQCn21OEacn1
 2psYd7D5fe821xwIpunC1uX3v5BxWozwN1D1h+ZMYLTyRLiOfWeboymDJvSvpQb7bivUNVwQKG5O4y
 maY86FceNdv8JJwC8sx96Bzf2R4r2aPtUJwFU/ua8IYGbGtUAOc8L2DuQhM6RPz1wRNcXiggPUzhyP
 jwaPYUsqvJeCW5+PXLUSHu2yYQKbxVt8d1RC+rzY+a+u7Ur5H9B23XHwGHUl6MnC//pDNtHoPeri3v
 X8F6MS2V/EudvIBqHZeTU4OOlEzEDtHXrMqR2+ZkK1DL/is/kkSFX48e5gJkKEL6J5BFR0gXGC1dE0
 Pkas7nXik4ArNrYr4EsYR1odk5y/a1Ix68QBRSA3M3hn+O9OgTZtveQyM1LuIHx86NiAKVNnrJnkFf
 7ZonrJyjqpd1ei/d+t/ELDeQrNxydxQi0jLuga8L2ZNm03YgRkSeL1/rukXbQ8Iior/wdS0YB2WN+W
 iGHVYXymMyCW1c2ZtKs97b2qGEc1EpoAllwjD2LwdJfFvDLdlsc+mfBbyKANuVDVHRTypu9Af2UY5Y
 X6N+TMHRPHf7v8/JbJ+3SlI3zqCz80sBujApWp0WGIJCilnZgrDhN6eVHVQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linaro.org,oss.qualcomm.com,outlook.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,ayaneo.com:url]
X-Rspamd-Queue-Id: A01C192304
X-Rspamd-Action: no action

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add proper regulators for the USB controller, with bindings & power ctrl
- Add proper regulators for FAN
- Dropped support for headset over USB-C, audio is connected to a jack port
- Cleaned up Audio routing and fixed the DP endpoint index
- Added i2c clk frequencies
- Renamed fan node and used interrupts-extended
- Dropped the usb-c self-powered
- Reordered nodes alphabetically
- Renamed pcieport1 to pcie1_port0
- Link to v1: https://patch.msgid.link/20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org

---
KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Neil Armstrong (6):
      dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      pci: pwrctrl: add PCI pwrctrl driver for the UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      arm64: defconfig: enable pci-pwrctrl-upd720201 as module
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/usb/renesas,upd720201-pci.yaml        |   55 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1559 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pci/pwrctrl/Kconfig                        |   10 +
 drivers/pci/pwrctrl/Makefile                       |    2 +
 drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c        |   88 ++
 10 files changed, 1743 insertions(+), 23 deletions(-)
---
base-commit: cd31ece0d7a4f2fb2266d6d6abd4d33f45e93dac
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

