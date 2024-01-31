Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2388449B1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4010FD1C;
	Wed, 31 Jan 2024 21:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C89010FD1C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:17:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so25552666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735817; x=1707340617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aIvaypLdP0+JFHDzqqa1D+EbFHtABYPWV2c8Aa5Q328=;
 b=FNJy4oiWItv0uYTv31sgWAQc9NqVSi29KDXtqHU3Q2u+CK5xSig87Tq14M320h/URp
 C73K7El5jwEEEVxiOhqQKkVayuj1aWVCduM8iUJMH7nWcJYw6iX4//JPssjK1bJn7Ctb
 pLWvbULtlL0/f1JvPErOjxDRcKX140SDRIYon8lVL5HDHkGHe3IS20D1tsEBGPl/V/yF
 934/zIlMAcTFH+0TUHaKQOd29LKB5NCV/0mWIDKfi1/X/8Fz1TwJuFTe//KGLyGPLFfc
 AXZd1qtRIVzu/EQ62FrRqTi5p5UHk5ugcL+jJ+tXed/N543h2d+KpBby7n6vUuB77daK
 UiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735817; x=1707340617;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIvaypLdP0+JFHDzqqa1D+EbFHtABYPWV2c8Aa5Q328=;
 b=hS8eoJHaB0Cf5s8shQa6agwpsdcMsbQAhR5tJTQYZWwMW+Io7X/pcv4Wo6pTbkGyYP
 GQL+CFiNdVo6qiGoCo7IPnwvePKA14No3xl6pAbAKifOznJDb+fFd5qUtFDhHSv0qYZj
 7i09Um+MHlCODcKSP+RLXKuAcq3VKOtEanQuGv4anjtPaP0Lkn2hASHMB6eoxFrXxkBP
 NEc6EiHNO3U7+jkk8JJi3qCndyjoxtK105Mn2OMgm8sFqhsQAHUUweYgPcGPaelllDlZ
 5TiSx0nhZ882IpIk8yelEYousHTWVQ6E5SXVQUg+QiA+wT/M8tQVwHejkDhLr6U9Iia+
 so9g==
X-Gm-Message-State: AOJu0YzECGdGiaJ0iT4iTnb3giq25D+QjLbrjM2FacTlXXzh4KZve3Hd
 5GYW02PGRe+LiEt22u2mBSCNeXWDwdIGg3zLZAtAgJDJI1EfTRtx
X-Google-Smtp-Source: AGHT+IHnO3WBh/+ajC4q+i/16gR61Amb9UqtxVbpXreKVzkmjEyKKcJdnZqL0gzfWAOgay1EoAzL9g==
X-Received: by 2002:a17:906:2495:b0:a35:854f:6c9e with SMTP id
 e21-20020a170906249500b00a35854f6c9emr2058734ejb.51.1706735816769; 
 Wed, 31 Jan 2024 13:16:56 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX6h2Y8J63c7oNmYUJeFHimF+GcNPtlF6WODVlXW+KZ6iCTqVqg0D51fEnFrd9PaRhjVZMpNJaOy2701csFyW8y0S+7/CgZBrNgtpfQ5QMjH5TCCL+CxYGKm0eb62yd17kMdsgnrikdnrrQ7RN0yHC054sAoinbOGzJF/OcbhhEuazViV8Ch9fuHX2KPrdDMQdFmjZfAmcSflVDCUlvyrRV3twI0NTdA6G1uWr/5leHTYx9r3g1pPt8BFAebYLJa9y7YjM4/xqD0AAYwvNpx6x8M6n/re4liSV00Nlsi0Zp8LD1igj6fwWiQubUZ8Bg9Y36dxHYP7Xhp5tHJ2r/3QiJhvIk0g8X73VF2vo/P4MXc74X9IFsLXUf8l0kZINM9D7h07ERqXfY6XQ2Aam1FLixptd7AWHwy0L1F7EC2RrZHxP9Lim31uAmBKQVfqqGbOwZXAxBXqfyQgm9wDKqTALAY2aoWzm3oDK3Y8hw+kPSawpNA8hlxVrMCOcp7FIoj1ZP3t1Y/b2jVCANP7gkha8y76qXMxX4XBnH5El/McGwAP3l8LDmvzdXLRqSpntlGyJUQvnlYt5i+Ht340o=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a35a8571419sm4040634ejc.135.2024.01.31.13.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:16:56 -0800 (PST)
Message-ID: <9b84adf0-9312-47fd-becc-cadd06941f70@gmail.com>
Date: Wed, 31 Jan 2024 22:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 4/6] ARM: dts: rockchip: fix rk322x hdmi ports node
To: robh+dt@kernel.org
References: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
Content-Language: en-US
In-Reply-To: <a493c65e-7cf9-455f-95d5-8c98cad35710@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 andy.yan@rock-chips.com, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix rk322x hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  keep reg-io-width together with reg
---
 arch/arm/boot/dts/rockchip/rk322x.dtsi | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk322x.dtsi b/arch/arm/boot/dts/rockchip/rk322x.dtsi
index 831561fc1814..96421355c274 100644
--- a/arch/arm/boot/dts/rockchip/rk322x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk322x.dtsi
@@ -736,14 +736,20 @@ hdmi: hdmi@200a0000 {
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

