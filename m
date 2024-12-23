Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F79FB099
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 16:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E407D10E548;
	Mon, 23 Dec 2024 15:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/8PDBNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C3B10E548
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 15:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B6DEA40F7B;
 Mon, 23 Dec 2024 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABA3C4CED3;
 Mon, 23 Dec 2024 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734966973;
 bh=BB3R4LhpT1qumoCcyu94hcb/+Z5AodbxcVxv7XXNnlo=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=J/8PDBNAjDsbMHT4ohKjjYowkPAH8mHtko322ltly9LGNpsGn2abCfbajgZjkxjiG
 eWAEJNKTFt1BOllO+CrxjZg97NPoeWTng+3BPQyK5YsNDVjvJiiMlzVKXWMNk4XsRV
 rH9ia4oQSTR/QZ2B9+ibwQlr+PSGYVsDLHgmpvaknHODudO+5TE+0FOAx+PNJy6lv1
 oUwNgZeUtMCUtf+58quO0uw3w16aT9XTZllfis6IXgtwo1mkNCnVwOxwn2KyGB1wRO
 x20tu6Q1LmafO/5i6X5pxUUdUL4CBzrBQckDb782bczHoXH+huTZB93wBNFpBL+C+X
 1dg9lLVjt/+vw==
Date: Mon, 23 Dec 2024 09:16:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, sboyd@kernel.org, mripard@kernel.org, 
 jassisinghbrar@gmail.com, dri-devel@lists.freedesktop.org, 
 m.szyprowski@samsung.com, palmer@dabbelt.com, jszhang@kernel.org, 
 aou@eecs.berkeley.edu, airlied@gmail.com, ulf.hansson@linaro.org, 
 frank.binns@imgtec.com, linux-pm@vger.kernel.org, paul.walmsley@sifive.com, 
 devicetree@vger.kernel.org, p.zabel@pengutronix.de, 
 linux-clk@vger.kernel.org, matt.coster@imgtec.com, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, drew@pdp7.com, tzimmermann@suse.de, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, wefu@redhat.com
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241223125553.3527812-4-m.wilczynski@samsung.com>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
 <20241223125553.3527812-4-m.wilczynski@samsung.com>
Message-Id: <173496697225.830201.2249501258776075204.robh@kernel.org>
Subject: Re: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add
 support for power domains
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


On Mon, 23 Dec 2024 13:55:37 +0100, Michal Wilczynski wrote:
> Introduce a device tree binding for the T-HEAD TH1520 power domain
> controller. This allows devices to specify their power domain
> dependencies, thereby improving power management for subsystems such as
> the GPU. The new YAML schema describes the power domain node for the
> T-HEAD TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-power.yaml    | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/power/thead,th1520-power.h    | 18 ++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: /example-0/firmware/aon: failed to match any schema with compatible: ['thead,th1520-aon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223125553.3527812-4-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

