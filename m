Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA2B490FE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A852010E538;
	Mon,  8 Sep 2025 14:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DIZiuZDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B07210E528
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:15:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E4AD6013B;
 Mon,  8 Sep 2025 14:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF55BC4CEF1;
 Mon,  8 Sep 2025 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757340924;
 bh=QgIpB2jfHW0N/3Ci98KVnbv9d6yCAvYXaqlVmdKTBHk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=DIZiuZDGYoJHcsR2Jifa2jIRwnPxYLGVcFW5UIdYOBBalGNeqiNi+/WOnau7DGh58
 7zzHk1P6OoRJGgwLntsdRvDkDIeddkVlChPBWXay2fCwBOA+JEbe+no6FVwIec1Fps
 ihmEFdwfYQUaiTX4fb371HwP4Q2ZLQD8QLRCGyaWZYCjJYFh5NRCD/OZN0lsgXjST8
 JujregcFKLVtyQx38ammLCqL6HnquKDvHLQ1quE8VifSndlN/OoO0wEkErbxkckliw
 HIaAvfaEr8qeXaj+unWhN0l52yFr9C8oAhzPhIPgs27HeVAsv3JolSq6DGNrtqtJbc
 7z+hQfRAzGPuA==
Date: Mon, 08 Sep 2025 09:15:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-leds@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Daniel Thompson <danielt@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
In-Reply-To: <20250908-leds-v3-1-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
Message-Id: <175734087835.1809005.14330068317471966084.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
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


On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
> Introduce common generic led consumer binding, where consumer defines
> led(s) by phandle, as opposed to trigger-source binding where the
> trigger source is defined in led itself.
> 
> Add already used in some schemas 'leds' parameter which expects
> phandle-array. Additionally, introduce 'led-names' which could be used
> by consumers to map LED devices to their respective functions.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../devicetree/bindings/leds/leds-consumer.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated properties are not allowed ('led-names', 'leds' were unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250908-leds-v3-1-5944dc400668@vinarskis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

