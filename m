Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4F40C317
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 11:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D236E8F0;
	Wed, 15 Sep 2021 09:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D276E8F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=BCjzl5InWXrrE07+i9aAPJnv7UBJQLhh+xxUdLR/bEg=; 
 b=rkcG3XqvBvcDubYLkhqnWVkDGpeVWIZxAeS8L+zn2q0s2umHToOMnYBHr7m5r2J2LE0whXCObxSTuYc/V8eH2ny9Jwm6C9LIqMmeH1bBAgN8p1TupJxnZBlmU8Kg29FYD5HRx4K5vhcl66FPHmfez3SjK4Y0ex+SQtwHSfZ1oqbl1U+9/a+sZzZHIKk592j8sGWMbNETyFLWfbokMFJXILnw21OzBdheTFlF8bxd6AYSQ5jqbiE0Gs3+ZGiGY8vtQX6R2TjhnLP60SeLYLIer00b88n5Hf8PtsC4u2Avw9Bh2k0lt5zRIFXr7W1tJME9incGxTkHVQHIGTFtDFnqrQ==;
Received: from 191.49.165.83.dynamic.reverse-mundo-r.com ([83.165.49.191]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQRd3-0001mB-Uz; Wed, 15 Sep 2021 11:54:58 +0200
Message-ID: <0131f4a040341b42e7502f24ae72db19fb3286ff.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: fix wait for TMU write combiner flush
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 15 Sep 2021 11:54:48 +0200
In-Reply-To: <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
References: <20210914055549.4340-1-itoral@igalia.com>
 <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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

On Wed, 2021-09-15 at 09:57 +0100, Melissa Wen wrote:
> On 09/14, Iago Toral Quiroga wrote:
> > The hardware sets the TMUWCF bit back to 0 when the TMU write
> > combiner flush completes so we should be checking for that instead
> > of the L2TFLS bit.
> > 
> > Fixes spurious Vulkan CTS failures in:
> > dEQP-VK.binding_model.descriptorset_random.*
> Hi Iago,
> 
> makes sense to me.
> 
> can you add the fix tag?
> Fixes: d223f98f02099 ("drm/v3d: Add support for compute shader
> dispatch") 
> 
> also, you forgot to add your Signed-off-by tag.

Will include both, thanks.

> > ---
> >  drivers/gpu/drm/v3d/v3d_gem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> > b/drivers/gpu/drm/v3d/v3d_gem.c
> > index a3529809d547..5159f544bc16 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -197,7 +197,7 @@ v3d_clean_caches(struct v3d_dev *v3d)
> >  
> >  	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
> >  	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
> > -		       V3D_L2TCACTL_L2TFLS), 100)) {
> > +		       V3D_L2TCACTL_TMUWCF), 100)) {
> >  		DRM_ERROR("Timeout waiting for L1T write combiner
> > flush\n");
> hm.. would it be clearer to say "TMU write combiner" here?

Yes, I guess it does. I'll add this too.

> 
> in the next version, you can already include:
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
Thanks!

Iago

> Thanks,
> 
> Melissa
> >  	}
> >  
> > -- 
> > 2.25.1
> > 

