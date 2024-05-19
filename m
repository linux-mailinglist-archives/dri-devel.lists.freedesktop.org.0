Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613DF8C9582
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 19:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73AD10E011;
	Sun, 19 May 2024 17:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KcPlKyBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7216910E011
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 17:18:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34dc8d3fbf1so1278261f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716139085; x=1716743885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZFfFHRscCa8sWyp/mI5Ke4tlOhkyrUjzyPT9JQYiZXs=;
 b=KcPlKyBdzCCdhzgmNfTBBs+dmy8N4lxjKREQJ03Bqpa422Qvf/kb6zhhhL2NsGVwRp
 +w3dyDXKfCnJEb/+s/O1lsLyQfIwJ5dNYyhXbuSdXe8dgP9VFMVtGLaPFPkkKDohlni4
 UOduSeHReiaycQvn3K61aAMb7CWU84ByXgm/4zfWU+LXYh87cKbhayLsAfCeYOS6BZCH
 KWgbiIlI5XblpLyvUSHrBohDb8TBJTYcNmlf9qAkv33Ut7GL4RAHpBx6vSJyv1ATY1ft
 jgFAvUafWxhTJ3a1A5DSDGxXi11b93qkgmL8FBNNxF2Wf312o4y2EGWsDI1QuLT0fmgw
 tg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716139085; x=1716743885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFfFHRscCa8sWyp/mI5Ke4tlOhkyrUjzyPT9JQYiZXs=;
 b=fIu4+UpBnQZk9p2wtOYqV/22KlImJvTKgQ6SZw5pjmgdWLIAY0gzcOIDgNZ2W6A5sW
 uRh1cR04MZIRPt2EupN/l7maHKwQj6Wthxdo8wh9hmPx8e3JdgwxHPcCcnVhrpucZ/3w
 wN+U9X06EDM8SKcHynInhXY11f2npt+2c/508sSMwH82SMkBxnfVBEoxNqAhQHGyrUSW
 bu/7sDXQsv8JXDVahjjcVq6v/4GEv5A8k6L7O5IhMw+zqSDn688/tuWJ6gKLSZMXkae5
 Nqm0j1BF3iMu+GGTYF+3l3Gq99cqAfAUm8jva4H1BGcq7WhV143RGxU6Esv6WOoN1Y9Z
 hsww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAypVqkBrJBMQ2jNw1QJtroqC9bbOatapNsTLzNhbyeNNB3fDxPn9vgtSGgSOadED37QpX6w6r0Y4aeuofFyfaztaZESQSU0w/9TWgY9ME
X-Gm-Message-State: AOJu0YzT4PzWOFUBZlUAV9WnriLg4azwlvPGrSFh8nPfiF1lBztEA4/3
 U1PkoXjWBWtTdfU08QhOWUHDDW4x1BJBVJKbEpd4KRyjVFO4yfFpCu7cl8FMGIg=
X-Google-Smtp-Source: AGHT+IEVe3OJrvn9s1tUxcavG0nrrG8NUEl7NTZuN0MfcIVSegrUuefd4sCREc8FAj/4MId4r0LPwQ==
X-Received: by 2002:a5d:6350:0:b0:351:dea5:f808 with SMTP id
 ffacd0b85a97d-351dea6093bmr7250421f8f.26.1716139085076; 
 Sun, 19 May 2024 10:18:05 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a89sm26871478f8f.31.2024.05.19.10.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 May 2024 10:18:04 -0700 (PDT)
Message-ID: <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
Date: Sun, 19 May 2024 19:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
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

Hi Angelo,

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> +    oneOf:
> +      - required:
> +          - endpoint@0
> +      - required:
> +          - endpoint@1
> +      - required:
> +          - endpoint@2

I'm not sure this is what you expect because I must remove this part to pass the dt-validate.

I have 2 possible display at the same time (DSI and DPI), then I add this in my DTSI:

		mmsys: syscon@14000000 {
			compatible = "mediatek,mt8365-mmsys", "syscon";
			reg = <0 0x14000000 0 0x1000>;
			#clock-cells = <1>;
			port {
				#address-cells = <1>;
				#size-cells = <0>;

				mmsys_main: endpoint@0 {
					reg = <0>;
					remote-endpoint = <&ovl0_in>;
				};
				mmsys_ext: endpoint@1 {
					reg = <1>;
					remote-endpoint = <&rdma1_in>;
				};
			};
		};

But the DTS check returns me an error:

dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
/home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@14000000: port: 
More than one condition true in oneOf schema:
         {'$ref': '/schemas/graph.yaml#/properties/port', 

          'oneOf': [{'required': ['endpoint@0']}, 

                    {'required': ['endpoint@1']}, 

                    {'required': ['endpoint@2']}], 

          'properties': {'endpoint@0': {'$ref': '/schemas/graph.yaml#/properties/endpoint'}, 

                         'endpoint@1': {'$ref': '/schemas/graph.yaml#/properties/endpoint'},
                         'endpoint@2': {'$ref': '/schemas/graph.yaml#/properties/endpoint'}}} 

         from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#


In other hand, if I use "ports" to keep only one endpoint for each port:

		mmsys: syscon@14000000 {
			compatible = "mediatek,mt8365-mmsys", "syscon";
			reg = <0 0x14000000 0 0x1000>;
			#clock-cells = <1>;
			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					#address-cells = <1>;
					#size-cells = <0>;
					reg = <0>;
					mmsys_main: endpoint@0 {
						reg = <0>;
						remote-endpoint = <&ovl0_in>;
					};
				};

				port@1 {
					#address-cells = <1>;
					#size-cells = <0>;
					reg = <1>;
					mmsys_ext: endpoint@1 {
						reg = <1>;
						remote-endpoint = <&rdma1_in>;
					};
				};
			};
		};

The DTS check returns another error:

dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
/home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@14000000: 'ports' 
does not match any of the regexes: 'pinctrl-[0-9]+'
         from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#

Additionally, with the last DTS example, displays aren't working, probably because "ports" isn't 
well parsed.

So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
- removing the current "oneOf".
- adding the "ports" support in the documentation and driver (to be parsed).

Still possible I missed something and I doing shit :)

-- 
Regards,
Alexandre
