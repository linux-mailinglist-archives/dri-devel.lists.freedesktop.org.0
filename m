Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5C842762
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 15:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868911317D;
	Tue, 30 Jan 2024 14:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DBE11317D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 14:59:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55ef011e934so3226263a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706626697; x=1707231497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wDIfMQ4YppB4DGt1fhFV2sj3z9j8y70f63I+fQjYLro=;
 b=BLG0DjgFWoOYZLYLIEAvd0U178ibqrGM/HfYRqpU+Wjs1ZT/7ha3fYla4FYvlkvvra
 7lh8GBuzzHyV4aTjWpuXR9sWhCZuWGo8AV39TxF04LtQMYQPGP45Y6L5AjdhamH0DSPm
 z8NEVXK1cySZc5tij5N+H1S8X3zmb1C4ivYTMT2q/+vANynG3SDlHkJvvtcs3OLkHxRH
 670UqrK7vYBrIg6aOh02UwHWsNtubrncJd5D0pSe1d6Ezpvw4a2ITuv2ZQAtBs37C9pJ
 zg6w56aL14BWqCSR6T4a4e6VGWnkEd6VlwKbZ/DlW8XtAyP4pkr7r7T73J6KX9SFxmVo
 lgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706626697; x=1707231497;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wDIfMQ4YppB4DGt1fhFV2sj3z9j8y70f63I+fQjYLro=;
 b=iFsgQhbCr5GAFABCXL3P8ZPcccC2awE/sOOc5P6L53tkJGTHS4tSTBFMoYmV1CsGjG
 6jaKMx0vHt+pyxGA0GroOCZ4c2BX3xm3eEhLw1oI0QFMmryrcsz31wEs7zD2c6qgT+mp
 JahAc1JVUiFL1ZaatlpScy1yN2Sqs/hfnbh1l8P5nT1er4i7wL7tSvrWfn5ubEWTfW3l
 s3ix8kKE8/XVRCgtUAF3ITkiYcjEOEx8nI5SiVlaQ3AB8TTNKEdbLWFDF5Q3WNGYdEvv
 9TA9IuIVXGnXXXkyPVnd1K/DA4rqd1+nxyqu2fENsatmJh39uZqcDN6NFzKjVOThpb9K
 +29A==
X-Gm-Message-State: AOJu0Yx0WSaN9c7U9/wLKXETxPTGuiIfUU6prLWiTrxo7FZlC3t4MQCo
 2+FtBNVMhlDq2J4sX0IWwrpAP6G4+BS1s53aM0yTtmTcBOd5MGIs
X-Google-Smtp-Source: AGHT+IHvJArqPJqZnH6euVbiof6RL1gXCHBYuSD6TyZvGNld40TRQAsIZ0dZSKcNjKL6L/R4KE/cHw==
X-Received: by 2002:a05:6402:5248:b0:55f:1a79:8b88 with SMTP id
 t8-20020a056402524800b0055f1a798b88mr3505590edd.8.1706626697028; 
 Tue, 30 Jan 2024 06:58:17 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUv0zzlmDCmLM/C8Pog5kBc4B7TOhbegqNOybC25UNveppsRNbfGbmpkYOJ+AeIijxejLdpeAquEl81uTcvas8OKRqoB1wRBPz2yAvN+Mvl6TmmWHD3oCyzrtgHR6WBMoRhyjkj1ai7xb2WlZFNOmfQ66/C/1PPpjIYx0jAlt2sQJBIsxFloLhANWpKLhkKK3bZ86AvMFz+O2CbpiLb7UA7uolrrgwwdLb0xx3QHqsCHP+/eDm2vtrzUncfdGy98MqPEkv7l+AlfaQCov73u+twnInqBCVw3VakzFOzL4usSAmQnhsB0B0Kzs4ISKvSbjK8nZrbl8G/z7c4u/soKDEkUHt1qiCnP8rI9lkgUwjRa+Uzx+vLoN/s9Ty3gMPn+zHTax5DV/8U0bbxRK4oZ87lFeD5uy4ao2DdBeEvg+P8pZyjwHhTZt2V2rJMdtaeK714eCG8TKm+IKD17UK7h9WO7sy5spFExRjXRQIM9/21JEFKSjkQi8goCg3Ghd3p6wkbwTocaKTz9wLnMxsJO1cyLKpoGAk65cI=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w7-20020aa7da47000000b0055f0c027a3esm1879542eds.30.2024.01.30.06.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 06:58:16 -0800 (PST)
Message-ID: <e15c95b6-7981-4075-9f5c-44220822166b@gmail.com>
Date: Tue, 30 Jan 2024 15:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 6/6] arm64: dts: rockchip: fix rk3399 hdmi ports node
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

Fix rk3399 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 0caa842bba0e..2c4924465aad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -2036,7 +2036,11 @@ hdmi: hdmi@ff940000 {
 		status = "disabled";

 		ports {
-			hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -2049,6 +2053,10 @@ hdmi_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_hdmi>;
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

