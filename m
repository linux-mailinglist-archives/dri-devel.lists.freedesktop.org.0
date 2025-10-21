Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85CBBF5F64
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7D10E5AC;
	Tue, 21 Oct 2025 11:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XSpFW6Kv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C476E10E29F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:11:02 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-427054641f0so805246f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761045061; x=1761649861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5EyTqZZ7MGdSDa8l4x23g921Hy97xpn6zc3palSUX4=;
 b=XSpFW6KvCWRWoFcd9nvl8P78vw6jw/qD6TPem+haXL37gOH+ufBNrzi50sy2XlZiHv
 pmnU8OEpjEgw67ymqoqGxs7j12yRnQVoRqBH+6S58G7ygGBOQfxkLN9B23MWodPzSHIy
 UmYBIWmM1zdVuoA4fbxtABJs23HCN9wIB+c5eNONgKvkYnLqndbWiRpextQ8/ndK9Txc
 gYQqVUT021t/iVu1MremaAlo7YJ8lbU2E1oGMMCq246v9zQTrkd2p8jEtCYkoCYMtQ6I
 5XVDRKyJToEl/58JGDgK0n5i2q0CyHUIs41kD7GHmZEzsbCcbZc3MMfAO16VtaYgS3cU
 63wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761045061; x=1761649861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5EyTqZZ7MGdSDa8l4x23g921Hy97xpn6zc3palSUX4=;
 b=eidBVvDOKPrE0hR7VhEpIQTlK3x0ZucYQ33+BZkuPSjQUeCY7fv/4R7z/m+cSczFgX
 yZuGWHdF76CBvc84t0BRm/b1NCat9ZIBFO+SdlQ4I8Dzxl3K+htoaPokmnPz1u1rKtWo
 E4vWVLG5lFJwkKCWm0mDbTjSqcDrLTnKJKoOKtoZj5O9nAPRSEp/izTW3BtgScR6pZfs
 8q3yONcfzuv04cK87ob9s6UZF1lN//YjEF2bgmQk85yTfPpk2rRsbKL/sAEz47usIwv3
 7XjaKLu8ORseluDnZZ9KWYTseMyycw/Q3g34iwUYN+UlQTNqc9qKbjUMmrzFM6JNXZEz
 Nkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrCgTAFsTrOALvd47JJhibMp0RVRswWDJEDCDARINuTwJDSCj/1h61K1ZoV1y+SI5oJ/xNST/+yfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTBxEM4GuFByCzZAJiFJb+K5xf/3QWhNiZv8m/xwGKqVE96H1B
 RJtE+Wt3QygLLBS01SEaXNLKFsPr2ZSyop1BOSx6MUb0onVOvorE4fsJ75hTYlV21z4=
X-Gm-Gg: ASbGncs5jg73x2vH8JOBVA0GmxufCY3hDNh7sFdu5EW8qXe7u3XhnhZm8JatRqLBAUa
 hPBzdq5yfg1anpNAeCYiHdLRDvnaQDTPNNG2xihKGy58gBQwRRjkMfimuXOjXT/6zkZoO9qO0jm
 f1FzfYZITBlez3MAw36ND69YUhArT+ok3L9/WTiwjLCw6Ydz3qsXB0edOD2RxoOsqczzNA3NKe4
 eED2OWW/I9HFb4HkjkbAzmREzLa+KUj0WY2V7f4ZBHGMWK9pyhD/8y4Q5NnHTCheKBcvnrNnAZC
 Juwaw8goZndC9M0SkuTTHDVJ/o5YiOyDS3q/x+VNNdh33PEhPiIO7y17b+orXQn3e3Lm0rG65r0
 B4jDbMwaHvjEvFnkPZ79f+s9huIIjBFFycgM+ogRUhJGAAu0nk0+cw6K3rpIn69tN85blw1kQH8
 D22lBaHOJw9co=
X-Google-Smtp-Source: AGHT+IE6kW17wi16G56epg97Q5LRZhtLyC50m5D+iXMza5wlR5ua98abI/s6v0YwjekhlOLH+56S6w==
X-Received: by 2002:a05:600c:19c7:b0:471:152a:e57d with SMTP id
 5b1f17b1804b1-474942d9c6fmr12082165e9.3.1761045061205; 
 Tue, 21 Oct 2025 04:11:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce06bsm19510485f8f.45.2025.10.21.04.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 04:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over
 DisplayPort
Date: Tue, 21 Oct 2025 13:10:52 +0200
Message-ID: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
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

Add necessary DAI links and DAI name prefixes to enable audio playback
over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
should carry respective DAI name prefix regardless.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

ALSA UCM and audioreach topology will follow up as well.
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 654cbce9d6ec..103c4ca97adb 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -351,6 +351,54 @@ sound {
 				"VA DMIC1", "VA MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -1013,6 +1061,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -1021,6 +1071,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
@@ -1028,6 +1080,10 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	sound-name-prefix = "DisplayPort2";
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
-- 
2.48.1

