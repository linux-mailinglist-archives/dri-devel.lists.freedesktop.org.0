Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C92842760
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A71131AA;
	Tue, 30 Jan 2024 14:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8F81131AA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:58:52 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so4364283a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626671; x=1707231471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DmcehVDq1GcEjhHx6wGLc0qaDaI/0n7EbffVmbga+mI=;
 b=PFftPu6KACozBZLgI613sL8IBLV9fv06b7xWjcQHGTIsUQ2yFdnzY5A3w7agYSNCmE
 UKUqkiXIE89dMhfExy0h31MCrr4pMtXNa/GcHNQVxmGPBApJ9v7hLo5NbxoW4GeY4UcW
 7q4LqlpnLMzgpdHiqGFb7UMT3E5RpvNw77W4cY5xnCtND+Wq2TXDWUn2Xc8Va5snje87
 4q/IycpD95d+KNkcX9bvCv7i87ottQ+jm+fEsWTCCX8MIqYCpaX/tRA1EsQJWMCIY4ZO
 LgZVoUiHbTt7Vs4chThJStL5+gBero4Vy40l3vQcpPCH1gsxDwITzf7HlJG1IVb8VWot
 Hxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626671; x=1707231471;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmcehVDq1GcEjhHx6wGLc0qaDaI/0n7EbffVmbga+mI=;
 b=ZBHe+wTZNmNDyxMJht77btogv72V110CJB8hdqFcwg9dZk8OsVboN9A/R7tXG1wMc+
 Ue2jNvGz8B3wJh7+wnOhMyJ6a6TiefD0O9AGjm5MUvROZ5BFf/5N3qDE8fDQPg4fNCPg
 hB3GsypF2ag8wLeIzuGrS42XY51vf8GhPtQ3bWfsM03QtBvihAgggbyasEtOk1mw3B0b
 qCRwy5Cs8dqgTOyX3zxR1P5WNJ2e7GsoeeoBCFqmrF/1K+Z+SKORrAyFf/jW0HfssDre
 m8LiEGvDdpaJWB/pcT7Ze7D5jy1HpJvRr8yJ/mW2ZbjnC/FWudkOWHtBCNDzGJVFPhCj
 RvVA==
X-Gm-Message-State: AOJu0YwnlltLRYVCqzrwILR8T7hs3yoaTmdGRKsY+rfEnRci4WH/eiz0
 BSQw8dItVuTFBly1lDzy2mHE5wTwPdbOOH0rCRNvpRTk+VWbcOuC
X-Google-Smtp-Source: AGHT+IEb4naCDu6qsxfxml3F3iSc7EgngZPLyYUgWoadasH9mTVJRoKm7IlmAEYW00Gu1o9PGZLd9w==
X-Received: by 2002:a05:6402:2550:b0:55e:deca:edac with SMTP id
 l16-20020a056402255000b0055edecaedacmr6232937edb.7.1706626671074; 
 Tue, 30 Jan 2024 06:57:51 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU3EbKMiWmvSROr5Ah/T9RLbJmUTfnTZc22fmTiffBecwf/fw2VsXVHg9i1EnHr7aCc6u8/sCjUqhfRBZwjNE7kYDBUJbnCpQa4qB9tmOxWZlTgs/txjGulZ9/GkZjsaFOE5AYwHbFG+HS3/zjd1doGyQBvkA2Qey1gEEJLX9LLU90BSvkDraclnaRrw+DnpHNZ79/zlggmZe2dQP0XTnLex2z1jlL1ZgIyqZE/7WZzLWaQdVrBEHFO9OVGH93sgNc1hw4LdVcaDRHyYX6JdXA6+6ABdWCUekzOvM8s4fBmIobLiGosCGjKGFXkskOl2dSd2Ajthep0jSiJRre1H18H8qrS6dHPdK38Ad2rqgML9i/wTqBRXa2Lx43BXIo0MA079y2jV9QxGA7eUPbDTleh1qdRGvqgub0PQX8xrizN7V5oSCvzF3j00auNb9FMxk1Bk6AMVYRdGL9NZ6T3JEPpjzwXJuA03aTKR5DfVsWvGiILk/HGEzlaxzFg+Cr9hXkBMZiE8rTSCcHx34MmIqGNpLmTizXEoww=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:57:50 -0800 (PST)
Message-ID: <4bdaddeb-06d6-4f43-a83c-6646a9a06f05@gmail.com>
Date: Tue, 30 Jan 2024 15:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 4/6] ARM: dts: rockchip: fix rk322x hdmi ports node
To: robh+dt@kernel.org
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
Content-Language: en-US
In-Reply-To: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, andy.yan@rock-chips.com, airlied@gmail.com,
 markyao0591@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix rk322x hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk322x.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk322x.dtsi b/arch/arm/boot/dts/rockchip/rk322x.dtsi
index 831561fc1814..ff8e778ea50f 100644
--- a/arch/arm/boot/dts/rockchip/rk322x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk322x.dtsi
@@ -720,7 +720,6 @@ iep_mmu: iommu@20070800 {
 	hdmi: hdmi@200a0000 {
 		compatible = "rockchip,rk3228-dw-hdmi";
 		reg = <0x200a0000 0x20000>;
-		reg-io-width = <4>;
 		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		assigned-clocks = <&cru SCLK_HDMI_PHY>;
 		assigned-clock-parents = <&hdmi_phy>;
@@ -732,18 +731,25 @@ hdmi: hdmi@200a0000 {
 		reset-names = "hdmi";
 		phys = <&hdmi_phy>;
 		phy-names = "hdmi";
+		reg-io-width = <4>;
 		rockchip,grf = <&grf>;
 		status = "disabled";

 		ports {
-			hdmi_in: port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				hdmi_in_vop: endpoint@0 {
-					reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+
+				hdmi_in_vop: endpoint {
 					remote-endpoint = <&vop_out_hdmi>;
 				};
 			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.39.2

