Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FB89090A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 20:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C078112528;
	Thu, 28 Mar 2024 19:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 438 seconds by postgrey-1.36 at gabe;
 Thu, 28 Mar 2024 10:13:38 UTC
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266E10F4FF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:13:38 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rpmkw-00C7Rn-5k; Thu, 28 Mar 2024 18:13:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 28 Mar 2024 18:13:26 +0800
Date: Thu, 28 Mar 2024 18:13:26 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: davem@davemloft.net, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 catalin.marinas@arm.com, will@kernel.org, mperttunen@nvidia.com,
 airlied@gmail.com, daniel@ffwll.ch, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Message-ID: <ZgVCxnI0sZcE04io@gondor.apana.org.au>
References: <20240319082306.34716-1-akhilrajeev@nvidia.com>
 <20240319082306.34716-4-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319082306.34716-4-akhilrajeev@nvidia.com>
X-Mailman-Approved-At: Thu, 28 Mar 2024 19:21:35 +0000
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

On Tue, Mar 19, 2024 at 01:53:04PM +0530, Akhil R wrote:
>
> +struct tegra_sha_reqctx {
> +	struct ahash_request fallback_req;

This doesn't work because ahash_request is dynamically sized.
So you'll end up clobbering the rest of the struct if a fallback
ends up being used.

You should place the fallback_req at the end of the reqctx and set
the reqsize based on the fallback reqsize.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
