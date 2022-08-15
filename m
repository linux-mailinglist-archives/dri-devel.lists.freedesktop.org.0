Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF459329B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35DCD225;
	Mon, 15 Aug 2022 15:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CB0AE405
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:56:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j7so9556231wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 08:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Vat6AZoY9+pk6p00nX/E13J/m0/mJwwh8QQBSGedRWI=;
 b=ac29o9TVhocYOEq0n2fhWnUeh/CRbCxApxyanuzcOySkw1I5vyt7NwoK0bxhzamhVb
 HNQzJqPV5tZrd5F4nlIP1ovQr4D/RCVfQDVQ1KYKEsswYZahtGPxfqYBY6Y7MagxYflt
 4axUR+APZ1ksLfHhOYmae+5LPccKDbiWXwt0VQ5oLli30ZgZmVPqJnk1p2Hw4+doMZ2P
 x+/Z4LlV5vEu+yq6ZpjsvJ9jiRvk4gTZSPwu2C1oNNcApDHPvRiM8vj6dz/GsNrmj/wv
 FzPjqWKq28QceivuhPWGqIIdhTvvKwXZ4JBWfILM4XhK1l02A4QdygN5tsSbGeIR1+sb
 4YiQ==
X-Gm-Message-State: ACgBeo1pzojWGmuaKf/aU3AbdMqD+gTy7soUy1zFFjo84nGCtuX3alRT
 qRFrls2snxQsPxueFWZz7ww=
X-Google-Smtp-Source: AA6agR6LqwBwhr8IBNtL5BKxuU4r3Y+LjMPMFEeYwRcLmbQKw/Ljf/Ui34QWaaHHynm6D1Y8i9VY5g==
X-Received: by 2002:a05:6000:1e0e:b0:220:5c9f:a468 with SMTP id
 bj14-20020a0560001e0e00b002205c9fa468mr8849712wrb.587.1660578970160; 
 Mon, 15 Aug 2022 08:56:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a5d488f000000b0022395a63153sm7800412wrq.107.2022.08.15.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 08:56:09 -0700 (PDT)
Date: Mon, 15 Aug 2022 15:56:08 +0000
From: Wei Liu <wei.liu@kernel.org>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [PATCH] drm/hyperv: Fix an error handling path in
 hyperv_vmbus_probe()
Message-ID: <20220815155608.uekossy5hejqflni@liuwe-devbox-debian-v2>
References: <7dfa372af3e35fbb1d6f157183dfef2e4512d3be.1659297696.git.christophe.jaillet@wanadoo.fr>
 <PH0PR21MB3025D61C85CD6E724919A9D8D79E9@PH0PR21MB3025.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR21MB3025D61C85CD6E724919A9D8D79E9@PH0PR21MB3025.namprd21.prod.outlook.com>
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Wei Liu <wei.liu@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 06:35:01PM +0000, Michael Kelley (LINUX) wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr> Sent: Sunday, July 31, 2022 1:02 PM
> > 
> > hyperv_setup_vram() calls vmbus_allocate_mmio().
> > This must be undone in the error handling path of the probe, as already
> > done in the remove function.
> > 
> > This patch depends on commit a0ab5abced55 ("drm/hyperv : Removing the
> > restruction of VRAM allocation with PCI bar size").
> > Without it, something like what is done in commit e048834c209a
> > ("drm/hyperv: Fix device removal on Gen1 VMs") should be done.
> 
> Should the above paragraph be below the '---' as a comment, rather than
> part of the commit message?  It's more about staging instructions than a
> long-term record of the actual functional/code change.
> 

I don't think this paragraph needs to be in the final commit message.

> > 
> > Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
> 
> I wonder if the Fixes: dependency should be on a0ab5abced55.  As you noted,
> this patch won't apply cleanly on stable kernel versions that lack that commit,
> so we'll need a separate patch for stable if we want to make the fix there.
> 

I think a0ab5abced55 is more appropriate.

> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> All that said, the fix looks good, so
> 
> Reviewed-by: Michael Kelley <mikelley@microsoft.com>

I made the two changes listed above and applied this patch to
hyperv-fixes.

Thanks,
Wei.
