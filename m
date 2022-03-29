Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9D4EA99F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF44910E7B5;
	Tue, 29 Mar 2022 08:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430410E7B4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:49:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r13so23709540wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3WOsP0N8pQYSZR7dCr/GEolSLsBOcDjGOSuUf4Q8y5c=;
 b=Cr8k1GfBxjxgkiKcehLqVxYA6mL2h4XI3jCGech6aDvqrYzO39ohK4BWHM7caw8U+T
 vYUExF3iJ6E0zzY1UXPqlQQu0ZEda+9cCZVbaE1pv1kCOJ7Fqmw3GXMhujiTrYvzPJ/t
 DGAmNOSeVp8M3HYk+vTLA/ofD2NBtrKdEuzP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3WOsP0N8pQYSZR7dCr/GEolSLsBOcDjGOSuUf4Q8y5c=;
 b=3oS9l77gUz3C09yo+nSJEJLHbu10qPgasdc25I0Kf7dp0P5ru5ns4GRgVbOeTFKdjS
 4xnT0B4IwvLGKqwXVkFxt/DEczcaRQS7sq4OirQbQ3GogLlc2dtQGSh9qmeFfd0GuBFr
 U51zxX8+hv7jq2SSwsh7ZyJTsW5RgYj8PdE5DODKGbcGbxpDRULecVb2MinPd96yfvIt
 cGxGNoUa9i8S6HlT7gUm6JonJq2Qz3IRqG9DUUP2D19c4gAUtbaav3F36KM2Bm4zrZly
 1ezfDLRUPwdk0HTIOsqn4fmjQfj3ccffprJUx4Wig64JrUGUAfSp9xnCAw+VS+oklkDm
 V8Jg==
X-Gm-Message-State: AOAM533AuXDJMTBLao9FVYLpzcctzRGe/RwxjXV+zRAlBDBdpqmRgLcB
 II8DzSqhX8hhHA+rPSkkF7Z1OA==
X-Google-Smtp-Source: ABdhPJxsBo7mH6qQdvfu4gCQhAS59ss1wdC1AX1XGHJLm8qth9AwFe6z+gofLqam6doW5OJmi4ZNmA==
X-Received: by 2002:a5d:64e7:0:b0:205:8cc7:aa82 with SMTP id
 g7-20020a5d64e7000000b002058cc7aa82mr29697748wri.247.1648543780450; 
 Tue, 29 Mar 2022 01:49:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm1613852wmc.25.2022.03.29.01.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:49:40 -0700 (PDT)
Date: Tue, 29 Mar 2022 10:49:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Message-ID: <YkLIIhzuiE9jN8xK@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
 <20220329070001.134180-2-christian.koenig@amd.com>
 <YkLHypwNnLd+qA4H@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkLHypwNnLd+qA4H@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 10:48:10AM +0200, Daniel Vetter wrote:
> On Tue, Mar 29, 2022 at 09:00:01AM +0200, Christian König wrote:
> > A bug inside the new sync-file merge code created empty dma_fence_array instances.
> > 
> > Warn about that and handle those without crashing.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> 
> > ---
> >  drivers/dma-buf/dma-fence-array.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > index 52b85d292383..5c8a7084577b 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> >  	struct dma_fence_array *array;
> >  	size_t size = sizeof(*array);
> >  
> > +	WARN_ON(!num_fences || !fences);
> 
> WARN_ON and then dying randomly is kinda not nice, I'd wrap this in an
> 
> if (WARN_ON)
> 	return NULL;
> 
> with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Uh strike that, you handle it gracefully with the check below.

> 
> > +
> >  	/* Allocate the callback structures behind the array. */
> >  	size += num_fences * sizeof(struct dma_fence_array_cb);
> >  	array = kzalloc(size, GFP_KERNEL);
> > @@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
> >  	if (!array)
> >  		return head;
> >  

Maybe add a comment here that this is just defensive programming, like

	/* No fences isn't allowed and splats in create, but be defensive */

Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> I guess,
coffee not quite yet working.
-Daniel

> > +	if (!array->num_fences)
> > +		return NULL;
> > +
> >  	return array->fences[0];
> >  }
> >  EXPORT_SYMBOL(dma_fence_array_first);
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
