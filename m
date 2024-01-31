Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DAF8449B8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 22:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871C10FD1E;
	Wed, 31 Jan 2024 21:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9035010FD1E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 21:18:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a35b32bd055so20892966b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 13:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735830; x=1707340630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=m809IEfmsOt69Mzj+ewn9rd/I21cqoMQF9Z+13+EcwY=;
 b=AWgwDz89667vxv5vD4/DNeyov/0pmQJ8T6NG2DAYX68F086y246PWZsZ4NzZvgjm3N
 Tr9q3MpiIugeiXz3aHZ0Ryg3jJCYr31FAFJ0K0aiMK933mr6Fx5+8qAJ89rv//uKt02K
 +SkBob0ZU8cwTi4wecNUcR2opMjs2tTJGxR2c6r7dY34u+o+fKTyf9vBYUs5dwtxzUmn
 4z3HvI5RpkwBKcbP+VXKkwmTYWy7FFRh6esSV81U0Ofd3LINnFt2Yz6SwB5l1DYVuyf8
 yoJHBLcMu6zVGpt5llwsp9DvJrZOdooVZQhOlkLBBC+pc7DVLpiDR0YJsMvXMXabdWr/
 IrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735830; x=1707340630;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m809IEfmsOt69Mzj+ewn9rd/I21cqoMQF9Z+13+EcwY=;
 b=BmQsE7Wf4qJwjXQ4mLlWTJAuBScCY7h7DrmO960I3hvf8o8XTGmtmYLywOj5g5su/g
 QlS240jdN3wxsduLRbF/piLoU7KEPpOB3H643G0vtOFuMc30SF5Euo/N2MTs35Y+Rq8l
 zMfMVm6ZsHXU/LOm7WZDr5D90sySxX+vb/mZp1Ng59h/nJIY1EJePQGDAHlC9aS6JsMS
 /ykI8Yd35RS7Yc+MdO1tRnz4vURpxNx1ALVC0sGJ4nt2QQx1jp5Agc2MyQEVp98rvPBz
 jXBSz9y3PwS9KKdvSqYbOs51X1fi2hV5DBqjcfjPzyRZ256AMedOia0Yzy5wpUz97uoH
 QHaQ==
X-Gm-Message-State: AOJu0YyBEEvWWea1DUW91/4B2XBRFOkhAFWrB0TIncbCx32YnXytUdbL
 juRaoZsAxo7kZh89a0eNCLlhaMbvZHw1+YPViUSSbYOfffULYPnr
X-Google-Smtp-Source: AGHT+IErUVMAdxFTL73O0fpk+TAYJywDN+0bWX9BrjrCHQ2aPbxJ4ulDwCy4QPkkxKUz88lXPQE+LQ==
X-Received: by 2002:a17:906:b892:b0:a35:6667:b3ed with SMTP id
 hb18-20020a170906b89200b00a356667b3edmr2101448ejb.8.1706735829899; 
 Wed, 31 Jan 2024 13:17:09 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX4l5u5Ajq9ylzzqYpkqzDFhuvJh6UcTWtUwBEF20/WVE5VlfDsUyor+mEeZhXLOS2GpQoSC9Sgo88wnvbODLkZGVeRbj9lG+gIRVnZP1vsjzbL2G8/xcZUxrmCYT/qtoTMBprmmHqnJqwDTkJA6vZ4g7eo79nvaQ66KWmrR12G4BSEOCMzNZrUO9uruaVQ2jISuTjR/x2xCoc8q0EPUi6S56Wz20U+XQ3GfsmmRq76t4ptsu1HiXh5tOOx1FYeVAxL13LZXKK9mYPpqxSJDV5ZWWsk772icN/1jsPaFih0xzaiBrBt2kULGo7L2yPgsPLl+OdrHDPs0ox70Acg3WsG0ti+vTFkGDdmwZ3Y9PnSqYrRJWmFOIeXvc9C0V9Jfha+QpQMuU/QN92BLmS1l9P5mUcVvIljvPlocx6TTEE9Q/+ZenkbwsEVGHVFh2goYy1Exqm/CcsgmuejRhklC2OVO/VN88jzLu6+Pd1YFVQkX1nH2durRSTdTfWH4FlTdugj1dxzEc8uY3FWDM2/82OoNk4Q6AF9Wv2kcYESlYNmyNni00kfClh7JtANd897aYugEORlc76hXEgrq1Y=
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 ty5-20020a170907c70500b00a35a8571419sm4040634ejc.135.2024.01.31.13.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 13:17:09 -0800 (PST)
Message-ID: <e5dea3b7-bf84-4474-9530-cc2da3c41104@gmail.com>
Date: Wed, 31 Jan 2024 22:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 5/6] arm64: dts: rockchip: fix rk3328 hdmi ports node
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

Fix rk3328 hdmi ports node so that it matches the
rockchip,dw-hdmi.yaml binding.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V2:
  keep reg-io-width together with reg
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index fb5dcf6e9327..a73234b11ff1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -745,11 +745,20 @@ hdmi: hdmi@ff3c0000 {
 		status = "disabled";

 		ports {
-			hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+
 				hdmi_in_vop: endpoint {
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

