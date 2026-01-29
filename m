Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGU5I8Uge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F289DADD62
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992D10E81A;
	Thu, 29 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TDJOOoa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FF10E7B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:05:44 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-823210d1d8eso246348b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769659544; x=1770264344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qs+TGYRSq+syNgtmamomzVV57rWTcldKeZsL7QkXhHc=;
 b=TDJOOoa2B2UUGEVceyBuNppuOX7k32ao2Ujj1LcL8LUJleWclUGJVJw/qNrhoSUwvp
 gzgdFNfY8cQ4M0NxsGRczS2+C36UxTxVczMBUF3GNZ1tTPoOmFKL+CQbthaVB8HJFDqz
 j1qyZRmoAVbTvCz+ulda3Y7ZGHNkmrndwA3D+CdyF0b+cfyha2yJr5wXsALG0Dzy8jDq
 ou3g79x4nNcAQ/x2yUKqzPc7c1gm1mnP/WP5tzTohdXMDZ7QNbcBqocnXnNwH6qAG+OY
 /IMDPFhYZTp/uol0BbIBvPUH/WYO8ozcLeQdFNxYCNa/QgaYKDDhjFPwGX2nMp1IsahN
 84gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769659544; x=1770264344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qs+TGYRSq+syNgtmamomzVV57rWTcldKeZsL7QkXhHc=;
 b=EniDhyDVl3eJisgt/IBRGX32WntEywGLq/b2oz7o65daCavczzYdRYyXXeum4MKUWY
 vPe2H0JW8EyYuYWohrRPlEZ/CqEFyvhqpOjctMsCUL/rZkU5mIuVxT3uttFAA/Yhd0Bq
 rx8xleajGkmNyN1vQpbHDmi9wnCO9vLPB+HnVw5kD+sdc8wqSqggezrqHbsgQyg9LRzs
 xXIbysKzpajmNInjX7ZXfDeCIPbOG8nxZNrL8C42Td+fY4bOHdmWHXLlj+G6MzNt4bZW
 5fQNmeI1cJWsXSltYpuz/KO7XteICfSd9xkrQfFltIRQW5EZXmAM8FL0/XKYlaZIcSwP
 bcgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfrhDdl5JRRQO0Tpus37Qlabm+CPu9tLRxr03lgFvdLbLi2HvpLBM0OyNSW6v0xxWxFgnKim6vDUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOr827nHRBe2NCHF7RH4En8oHyrzHxxUChkbNyqvg+Hkfq6plw
 1YJYQZHsjrVInD4et1Tite5F1BeELHlltCNPvJDMNQpf6A8ssPrGO37s
X-Gm-Gg: AZuq6aJiOQfkJ4aksKNuYemhHsIQXGEM0iofa1bx91oy+5ySC4CTkpa9m5BPHElwDyq
 hhcGjnWCRRrmumJo6sp7vXx1Ew5l+H5LHYBSL2gypmrkgr+/L4nVPhBCVzmazSddMENC5ZO8zc/
 C3hD18edwO9kpr4xb6O0UBc1EbCC0OEkBXR8oleJDaeSNZKYwPWYQhzKSF2mbdGSDi72F8ecZfK
 snTDFJXYUaQSsUWUhHX1tm11pw1ubSlIvcd+jbC7l26g2rBN4VL81i5A12pJJbCzy0s9uUNDxC8
 IzJim+wkyIiK4qE+Pt3vYFpwRsaV08/NxDRP3N5nxi4fshwreHbinUq56NfLHwz7GA9tMvI9FLA
 On82giguFNB9tdgrs7AhafMKYzu2KDQRx8t9MnsZ04vlQDrCVKfa0vO3U4ZSUlAnFvmK1mKSRJ6
 uf9cLg9zRlhmJSOlKRxAmCkV8vkxlE9iQ+IqpVvNdOhsSDtluIGifIQ4J1vb3lweP+/RQVs6Ze
X-Received: by 2002:a05:6a00:14d3:b0:823:1cae:10bb with SMTP id
 d2e1a72fcca58-823692c322cmr7240139b3a.51.1769659543769; 
 Wed, 28 Jan 2026 20:05:43 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:05:43 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display controller
 support
Date: Thu, 29 Jan 2026 12:05:31 +0800
Message-ID: <20260129040532.382693-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129040532.382693-1-a0987203069@gmail.com>
References: <20260129040532.382693-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[2.102.81.160:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,2.111.199.128:email]
X-Rspamd-Queue-Id: F289DADD62
X-Rspamd-Action: no action

Enable the Display Control Unit (DCU) for the Nuvoton MA35D1 SoC.

This patch adds the DCU node to the SoC dtsi and enables it on
the MA35D1 SOM board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 56 +++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 14 +++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..e596bb452cc9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,42 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	dcu {
+		pinctrl_display: display-pins {
+			nuvoton,pins =
+					   <6 8 6>,  /* VSYNC */
+					   <6 9 6>,  /* HSYNC */
+					   <6 10 6>, /* CLK */
+					   <10 4 6>, /* DE */
+					   <8 8 6>,  /* D0 - D23 */
+					   <8 9 6>,
+					   <8 10 6>,
+					   <8 11 6>,
+					   <8 12 6>,
+					   <8 13 6>,
+					   <8 14 6>,
+					   <8 15 6>,
+					   <7 0 6>,
+					   <7 1 6>,
+					   <7 2 6>,
+					   <7 3 6>,
+					   <7 4 6>,
+					   <7 5 6>,
+					   <7 6 6>,
+					   <7 7 6>,
+					   <2 12 6>,
+					   <2 13 6>,
+					   <2 14 6>,
+					   <2 15 6>,
+					   <7 12 6>,
+					   <7 13 6>,
+					   <7 14 6>,
+					   <7 15 6>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -129,3 +165,23 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&panel {
+	port {
+		panel_in: endpoint@0 {
+			remote-endpoint = <&dpi_out>;
+		};
+	};
+};
+
+&display {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_display>;
+	status = "okay";
+
+	port {
+		dpi_out: endpoint@0 {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7d9d077f12b2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,19 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		panel: panel {
+			compatible = "panel-dpi";
+		};
+
+		display: display@40260000 {
+			compatible = "nuvoton,ma35d1-dcu";
+			reg = <0x0 0x40260000 0x0 0x2000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk DCU_GATE>, <&clk DCUP_DIV>;
+			clock-names = "dcu_gate", "dcup_div";
+			resets = <&sys MA35D1_RESET_DISP>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

