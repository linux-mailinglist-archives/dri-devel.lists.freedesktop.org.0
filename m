Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544D219A41
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B776E9BA;
	Thu,  9 Jul 2020 07:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206C86E9BA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 07:54:49 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id w6so1288749ejq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 00:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CMiLxtVTICWAGYOpfZqDMnAVll0zOnONpr0dL/HD6cU=;
 b=SmYStH3m20IIKhmRNMHb2RhcsD2Cjy2R7PyaIBrjxIcMcbTE1hKJ34GqO1Clh8bx49
 E13CudCwvLjXipqkbajp08Xx9W/52kx2fNFYR4Yx31soknuEAOGutnRQrkr9cSkqHCTf
 eUrUro+y669L8Fvfb1P0KBtOWxbziNZ0mpqx8C4ixr0V3i0W5h0w0pdSytSmsnpRgaAr
 VKEE+ixdENrccuMVbNespYie3tqhXQt4yYRvPlq072QbzwZXqdhgvcdTAiFUEouaXHZ8
 uGisImZGbBL2+qcr3I/GLQ8Bkhjx6StwpQEUvP3f3dNAF6/TBx0B9S58WlpcgLpynFE/
 kTyA==
X-Gm-Message-State: AOAM532Wkyk5bVrpATdNPA6PxOrwqZi6/pDFAMdXugrNYkQnulOt7ghP
 H1GzC6IBQH04OrdZsHPiUXw=
X-Google-Smtp-Source: ABdhPJwuhrghB3WBdR6TE0cAVlc4kbY2vXMCKw8yrCqVbPHEHH/gYPd9g7LeIekhAbZVY2G4OtsU7g==
X-Received: by 2002:a17:906:748:: with SMTP id
 z8mr56456214ejb.257.1594281287675; 
 Thu, 09 Jul 2020 00:54:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
 by smtp.googlemail.com with ESMTPSA id h15sm1271905eja.44.2020.07.09.00.54.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jul 2020 00:54:46 -0700 (PDT)
Date: Thu, 9 Jul 2020 09:54:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Fix sparse warning
Message-ID: <20200709075444.GA7306@kozik-lap>
References: <CGME20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f@eucas1p1.samsung.com>
 <20200707110859.3822-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707110859.3822-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 01:08:59PM +0200, Marek Szyprowski wrote:
> Add a proper cast on the exynos_gem->kvaddr assignment to avoid a sparse warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9940d9d93406 ("drm/exynos: gem: Get rid of the internal 'pages' array")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
