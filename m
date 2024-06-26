Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF6917BF6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370B010E7E7;
	Wed, 26 Jun 2024 09:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5zwQjgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB28A10E7E7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:10:46 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so3872514e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719393045; x=1719997845; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K9DxdgeKMMft6xMjBxtEtJeBs1IRRZ+tM3VA4YjpJIQ=;
 b=S5zwQjgFkrWo1jbXYRRxjqp5GEvMW/fz46HZWVGYN6EZtT0DIFiwQJFmbY4QyA7Hh5
 LNOkeBaq56oXimSyECbdFwD6BgZEB9/7Jd0TUzWRCpLdGxhbUKpuIBwkC3dPmf+9NENZ
 GPWkZl2+7wihIaBDvQTEHAJV0kjwpfiuxAxTlPpiTfiqhdlYVPoGNS2UwJi9Wqg3DmaV
 SWxAQjHyeM0Ftv4UrRrAHl1Esd8xVQegzvNBJsrOMb/s4xPhySeatC5d5rVKO8y3Gn3z
 Q+BjErMEI4U16nfRTq9Cq9y/hyFvUgWQnkya9jv3wZIN3OORhte9IqWOpFE0FchZ62il
 H/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719393045; x=1719997845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9DxdgeKMMft6xMjBxtEtJeBs1IRRZ+tM3VA4YjpJIQ=;
 b=xFF+Xx5y/fmCuEbb2cOZXZTWvwZ9Z6Jc8pRNPs9ivinUhCCFF0ip6sefJfc0+paawl
 I9pRvuszaNsi0ijm7GHjJ19gwnPTyXKQa4Cb+VIoWtmh8R6zsvE0lqWaqfztFURrjqtJ
 yFnLw2q15D+AfKno00RVnNVq9XTH519/IT088kWYE/6aLNzzUHP7vFB5hRXvMcbMYPaC
 5E+kt/WobBIU1AXuaSJpJWEP9n1srpK0zWxqRZHhDy39rQoBu14kypp+bm/yvBI/wOuk
 RxyI3WMEsg85F34SnoWbZneztjf0gGj0lEH4quhCOERWk7O+rKIgjN7stgJtcwtGfwNz
 IYYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxxbOiBpIBmLCCBpsCUwFWfZK+v5w6hc2lf9gbGPrBtyC6wCRP3tGD0pth0cX8Acu9KNRdsmozbWgiJMr/cV4yp4Bnz4WTMcRvXuQq1oVW
X-Gm-Message-State: AOJu0YxhI0PblJin8ajoN0mvXrIOko0bR5cjkQ5voFUrJz6SPt01RO0i
 tHB+Dn7xMyeCrVvWzt8h/0ak5Omp44kzlfP4v9RGJxtVu1gnkRg+9rZbYR7m1GU=
X-Google-Smtp-Source: AGHT+IFvrbmku8++KEgdhPN6vMMbENH5sTMYShPkgpp/P2CeiZpWl1jaG6IAS5BzaorZcPBCCmiE4A==
X-Received: by 2002:ac2:4258:0:b0:52c:dac0:7993 with SMTP id
 2adb3069b0e04-52ce063e74cmr6594046e87.8.1719393044774; 
 Wed, 26 Jun 2024 02:10:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1493661e87.56.2024.06.26.02.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 02:10:44 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:10:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <cq7xbwehvdyopndjjmxl2ekq2v7gpynxrhzh5yqkt5etao6hee@ifxdrp4gmtmb>
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
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

On Wed, Jun 26, 2024 at 11:01:11AM GMT, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
> > On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> > > The function drm_simple_encoder_init() is a trivial helper and
> > > deprecated. Replace it with the regular call to drm_encoder_init().
> > > Resolves the dependency on drm_simple_kms_helper.h. No functional
> > > changes.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
> > >   1 file changed, 40 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> > > index 6695af70768f..2fd9c78eab73 100644
> > > --- a/drivers/gpu/drm/ast/ast_mode.c
> > > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > > @@ -45,7 +45,6 @@
> > >   #include <drm/drm_managed.h>
> > >   #include <drm/drm_panic.h>
> > >   #include <drm/drm_probe_helper.h>
> > > -#include <drm/drm_simple_kms_helper.h>
> > >   #include "ast_ddc.h"
> > >   #include "ast_drv.h"
> > > @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
> > >   	return 0;
> > >   }
> > > +/*
> > > + * VGA Encoder
> > > + */
> > > +
> > > +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> > > +	.destroy = drm_encoder_cleanup,
> > > +};
> > > +
> > >   /*
> > >    * VGA Connector
> > >    */
> > > @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
> > >   	struct drm_connector *connector = &ast->output.vga.connector;
> > >   	int ret;
> > > -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> > > +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> > > +			       DRM_MODE_ENCODER_DAC, NULL);
> > What about using drmm_encoder_init() instead? It will call
> > drm_encoder_cleanup automatically.
> 
> IIRC the original use case for the drmm_encoder_*() funcs was to solve
> problems with the clean-up order if the encoder was added dynamically. The
> hardware for ast is entirely static and ast uses drmm_mode_config_init() for
> auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
> like a bit of wasted resources for no gain.

I'd say it's qui pro quo. We are wasting resources on drmm handling, but
then keep it by dropping all drm_encoder_funcs instances.

-- 
With best wishes
Dmitry
