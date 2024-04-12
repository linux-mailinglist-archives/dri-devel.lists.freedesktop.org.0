Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2558A280F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 09:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272D010F28D;
	Fri, 12 Apr 2024 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647CB10F28D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 07:31:05 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rvBMx-000lgX-Jc; Fri, 12 Apr 2024 15:30:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 15:31:01 +0800
Date: Fri, 12 Apr 2024 15:31:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: davem@davemloft.net, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 catalin.marinas@arm.com, will@kernel.org, mperttunen@nvidia.com,
 airlied@gmail.com, daniel@ffwll.ch, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 0/5] Add Tegra Security Engine driver
Message-ID: <ZhjjNWKexg8p8cJp@gondor.apana.org.au>
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403100039.33146-1-akhilrajeev@nvidia.com>
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

On Wed, Apr 03, 2024 at 03:30:34PM +0530, Akhil R wrote:
> Add support for Tegra Security Engine which can accelerates various
> crypto algorithms. The Engine has two separate instances within for
> AES and HASH algorithms respectively.
> 
> The driver registers two crypto engines - one for AES and another for
> HASH algorithms and these operate independently and both uses the host1x
> bus. Additionally, it provides  hardware-assisted key protection for up to
> 15 symmetric keys which it can use for the cipher operations.
> 
> v6->v7:
> * Move fallback_tfm and fallback_req to end of struct
> * Set reqsize and statesize based on fallback_tfm
> * Remove ofb(aes)
> v5->v6:
> * Move copy/pase of intermediate results in export()/import() to
>   'update()' callback for CMAC as well.
> * Check for rctx size when using fallback alg.
> * Updated blocksizes to align with generic implementation
> * Combined GCM and CCM init into aead_cra_init
> * Updates to handle invalid cases better
> * Reduce log levels for invalid cases to dev_dbg
> v4->v5:
> * Move copy/paste of intermediate results in export()/import() to
>   'update()' callback
> v3->v4:
> * Remove unused header in bindings doc.
> * Update commit message in host1x change.
> * Fix test bot warning.
> v2->v3:
> * Update compatible in driver and device trees.
> * Remove extra new lines and symbols in binding doc.
> v1->v2:
> * Update probe errors with 'dev_err_probe'.
> * Clean up function prototypes and redundant prints.
> * Remove readl/writel wrappers.
> * Fix test bot warnings.
> 
> 
> Akhil R (5):
>   dt-bindings: crypto: Add Tegra Security Engine
>   gpu: host1x: Add Tegra SE to SID table
>   crypto: tegra: Add Tegra Security Engine driver
>   arm64: defconfig: Enable Tegra Security Engine
>   arm64: tegra: Add Tegra Security Engine DT nodes
> 
>  .../crypto/nvidia,tegra234-se-aes.yaml        |   52 +
>  .../crypto/nvidia,tegra234-se-hash.yaml       |   52 +
>  MAINTAINERS                                   |    5 +
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   16 +
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/crypto/Kconfig                        |    8 +
>  drivers/crypto/Makefile                       |    1 +
>  drivers/crypto/tegra/Makefile                 |    9 +
>  drivers/crypto/tegra/tegra-se-aes.c           | 1933 +++++++++++++++++
>  drivers/crypto/tegra/tegra-se-hash.c          | 1060 +++++++++
>  drivers/crypto/tegra/tegra-se-key.c           |  156 ++
>  drivers/crypto/tegra/tegra-se-main.c          |  439 ++++
>  drivers/crypto/tegra/tegra-se.h               |  560 +++++
>  drivers/gpu/host1x/dev.c                      |   24 +
>  14 files changed, 4316 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml
>  create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml
>  create mode 100644 drivers/crypto/tegra/Makefile
>  create mode 100644 drivers/crypto/tegra/tegra-se-aes.c
>  create mode 100644 drivers/crypto/tegra/tegra-se-hash.c
>  create mode 100644 drivers/crypto/tegra/tegra-se-key.c
>  create mode 100644 drivers/crypto/tegra/tegra-se-main.c
>  create mode 100644 drivers/crypto/tegra/tegra-se.h
> 
> -- 
> 2.43.2

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
