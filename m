Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735F8AF506
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F310E29A;
	Tue, 23 Apr 2024 17:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZVURHw+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27710FD0D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 17:07:45 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41aa2f6ff01so10225245e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713892063; x=1714496863;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HfFEhDy7wrc1JJ4JwN66dtF2lU/7GHQL5ceh8i2rCk=;
 b=ZVURHw+a20C6Iar2fnO6aHz3xLyqser0n7lN/JW+twsPK5SQIkhxIeVY7W/w1WSOTm
 RKz/Kj1ljq/EbHdBPRKRmaOP3YHjubGT6Am7hU3u+a/0X2E5/8p/8ORHGQwduuEXuvtA
 Fz8dl6bYJPpJbP3Ck9GH/f+6eaiFXk1COKK5ZA3vlHKoCj1Ly+v3EePOLNjJCvtdldN3
 hIibKzl5YkFfnORkLhaOGFCtUGUL4QOX23+gf5/5dZ7mJRhG/aoeptcxtsGadJPXsKFg
 v3nsSlujB2nCq+3UTlSfsFaD/Q+dll27YMcv1Qc/HNxzQvHJVZ3hrO+qx4l2m0WZeJ1V
 aWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713892063; x=1714496863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HfFEhDy7wrc1JJ4JwN66dtF2lU/7GHQL5ceh8i2rCk=;
 b=Ewegl1an2NZN384zIvYnCp0+5rF3e2vtqDAXYbRJrJjX39+4Rqcd3PsBDhvIaiUw/i
 getHvW42axQnf5igr11x9l+SZhxQEOo8HFJA9fzkQgnLYmKtPo6Id96tuswot5Z1j8Kb
 u7yNt2WOVCrSZ9jCyiBlwuxHT/GmrHU6/5dvNG3f2LrG1e8NnF0LQh4IWdeiNINVkuP0
 XU2ij29Ge0HJ9PJCSwPHaf1ekR41CRljQhwElvR4mPNNW5CC/KKvUKqwj8Kh8qzcEe4Q
 XdJkafaa1nXSBgmssKeIMIi/kGhhlbCUwY78rnzdvIxFSaFJDljkL1giQxSX0416ycRg
 D2cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUsJNW25+X64WL5NPsWLbpecKi2PDIIm+johss9Z1rGF98wtMJZ6nhoaCuzbYq71W2VXixGy2i+V9oTHu1O7ut9m0cJTa8N7/zv0pNNY77
X-Gm-Message-State: AOJu0Ywv423rVjRJ55w/1FaGNwYVT1ByKub2mZ95s65pXVz1sV19LTiJ
 UUVY3VYQN/OYzv3pZKYbzU37DpEhRn/PMgufzNKcxmD7/WmHQx+U1yA2qV5BX5A=
X-Google-Smtp-Source: AGHT+IEeml7xlDPvKVEJlBPjkyqYO1K/a3UWyW6pbqsDEH7Dp3zHkT8MMXjVjKAP5avnRrImiMosWg==
X-Received: by 2002:a05:600c:a001:b0:418:a7a7:9bd7 with SMTP id
 jg1-20020a05600ca00100b00418a7a79bd7mr8084322wmb.24.1713892063377; 
 Tue, 23 Apr 2024 10:07:43 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b00414659ba8c2sm20996935wmq.37.2024.04.23.10.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 10:07:42 -0700 (PDT)
Message-ID: <a8730bb5-4f51-4c75-b049-6f00e3de5855@baylibre.com>
Date: Tue, 23 Apr 2024 19:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-3-16bb2c974c55@baylibre.com>
 <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <481abafd-33af-44a6-8460-068b4a85d764@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/04/2024 17:55, Krzysztof Kozlowski wrote:
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    codec {
>> +        mediatek,micbias0-microvolt = <1900000>;
>> +        mediatek,micbias1-microvolt = <1700000>;
>> +        mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
> Sorry, this does not work. Change voltage to 1111111 and check the results.

Actually it's worst ! I've removed the required property (vaud28-supply) but the dt check pass.
Same behavior for some other docs like mt6359.yaml

The at24.yaml doc works as expected, then I tried compare an find the issue, without success...

I've replaced "codec" by "audio-codec", according to [1].
I've tried multiple manner to implement the example code, without success. I'm wondering if what I 
try to do is the correct way or parse-able by the dt_check.

If I drop this file and implement all these new properties into the MFD PMIC documentation directly, 
I've the expected dt_check result (function to good or wrong parameters)


+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -37,9 +37,32 @@ properties:
    "#interrupt-cells":
      const: 2

-  codec:
+  audio-codec:
      type: object
-    $ref: /schemas/sound/mt6357.yaml
+    properties:
+      vaud28-supply:
+        description: 2.8 volt supply phandle for the audio codec
+
+      mediatek,hp-pull-down:
+        description:
+          Earphone driver positive output stage short to
+          the audio reference ground.
+        type: boolean
+
+      mediatek,micbias0-microvolt:
+        description: Selects MIC Bias 0 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+      mediatek,micbias1-microvolt:
+        description: Selects MIC Bias 1 output voltage.
+        enum: [1700000, 1800000, 1900000, 2000000,
+               2100000, 2500000, 2600000, 2700000]
+        default: 1700000
+
+    required:
+      - vaud28-supply
      unevaluatedProperties: false

    regulators:
@@ -88,6 +111,12 @@ examples:
              interrupt-controller;
              #interrupt-cells = <2>;

+            audio-codec {
+                mediatek,micbias0-microvolt = <1700000>;
+                mediatek,micbias1-microvolt = <1700000>;
+                vaud28-supply = <&mt6357_vaud28_reg>;
+            };
+
              regulators {


Is the implementation above looks good for you ?


[1] 
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

-- 
Regards,
Alexandre
