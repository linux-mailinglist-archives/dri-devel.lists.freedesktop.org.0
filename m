Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821638983EF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 11:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4D11A9D5;
	Thu,  4 Apr 2024 09:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ccof+V0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E958111A9E2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 09:26:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1099C6152A;
 Thu,  4 Apr 2024 09:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799A2C433C7;
 Thu,  4 Apr 2024 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712222768;
 bh=LQHPeCxsTClRiQFklZkM7OeAADhg7xB3paGeP09fuNI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ccof+V0eEDquGLB7ROWgkSuWRHrYjTBY/0h345S8VTXnPbHvM/M0douzbdfJSnRPk
 qHCwLS5haZtliW6qAVMI3aNB5nz/DPmhoOAvnd2wgmhUX2vkFo4JTuMg2URnq58CsC
 VA+RZyLMGk3NUeYB8b8wqjgEG28bi1INAaazGIZ6FvmFcjYpeENlOP+u+R6ikKMFY+
 aVwkX3SVcwmuE6JCd3dNSQDEV4tqjJQv/KZTxZBfLj/nzuqAcFNwLzxJjzPHOxlOMb
 JQfjiZMJTpp/tY/Q2GdV3HJQMg8Zyl3tKaWDk4uYaynFUXI43i33hzOsM60SdjKJhN
 i/uwGLI+moLyA==
Date: Thu, 04 Apr 2024 04:26:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: shawn.sung@mediatek.com, ck.hu@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, 
 chunkuang.hu@kernel.org, daniel@ffwll.ch, p.zabel@pengutronix.de, 
 wenst@chromium.org, matthias.bgg@gmail.com, airlied@gmail.com, 
 tzimmermann@suse.de, kernel@collabora.com, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, yu-chang.lee@mediatek.com, 
 jitao.shi@mediatek.com, conor+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 mripard@kernel.org
In-Reply-To: <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
Message-Id: <171222276632.1805081.13595219837975408757.robh@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
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


On Thu, 04 Apr 2024 10:16:34 +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties: 'required' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
	hint: A json-schema keyword was found instead of a DT property name.
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: properties:port:properties:required: ['endpoint@0'] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml: ignoring, error in schema: properties: port: properties: required
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.example.dtb: /example-0/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8173-mmsys', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240404081635.91412-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

