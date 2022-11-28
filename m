Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F463A100
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 06:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7110E1B8;
	Mon, 28 Nov 2022 05:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D1310E1B5;
 Mon, 28 Nov 2022 05:53:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF9B6B80B3A;
 Mon, 28 Nov 2022 05:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51424C433C1;
 Mon, 28 Nov 2022 05:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669614795;
 bh=F1tZe3L8xlQngrBiywG/9x6CZyvGLosQ+052v73UiLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZXp6QUcDfbxUMSO99TLA5rvBfzDhBtTvqPEmLtJRDzX5BpsK1PByDxGELXhZD34l
 Xkmp60eTC4kCxPnuAtnsYfNAjpyOYMntIW1TFynB3JYYDmrS3CvYHsRligVRbEz1x/
 YXRimu6Okl+0xHfYiZg0HCyIdOF41Rz8Vqifr6LMjl2WpM3TZvUcQ1ARPdnwDmgMJV
 lmuHDnWytBDKFV4LIX+4rs3yzI39R68ZgS5BRItHsrQOrtpYnfn5Ioid+aH1vrw6uP
 PjCo2vkIhJySvNv8EVdbD7lHU+F/3dWlJ8IBQi7vZ+zthiNVfJpWAGhFy7FjQ52FoI
 b5A/cW9yGGVYA==
Date: Sun, 27 Nov 2022 22:53:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 2/2] Kconfig.debug: Provide a little extra FRAME_WARN
 leeway when KASAN is enabled
Message-ID: <Y4RMyAoa0+sJS9F3@dev-arch.thelio-3990X>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125120750.3537134-3-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125120750.3537134-3-lee@kernel.org>
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, sunpeng.li@amd.com,
 ndesaulniers@google.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, trix@redhat.com, alexander.deucher@amd.com,
 akpm@linux-foundation.org, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022 at 12:07:50PM +0000, Lee Jones wrote:
> When enabled, KASAN enlarges function's stack-frames.  Pushing quite a
> few over the current threshold.  This can mainly be seen on 32-bit
> architectures where the present limit (when !GCC) is a lowly
> 1024-Bytes.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index c3c0b077ade33..82d475168db95 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -399,6 +399,7 @@ config FRAME_WARN
>  	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>  	default 2048 if PARISC
>  	default 1536 if (!64BIT && XTENSA)
> +	default 1280 if KASAN && !64BIT
>  	default 1024 if !64BIT
>  	default 2048 if 64BIT
>  	help
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
