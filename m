Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B77E24D6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC2310E317;
	Mon,  6 Nov 2023 13:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216F810E316
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699277138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rpy5xRn2sdo2EVUDX8IiTKUqfSS+Q8LE0WaVGslmrGY=;
 b=T7n4sWTyUJORuF7YLQP32YMo0kPR1t66KSeVsnoMoxbDSjVGoMtRRLmyeGLU8Y9vcRlfNR
 eDYlrZorJxtW/W9Xb8vUhp5xCOZiG8G9fUAbmgxboJcmKqBX2J+PIysULDHMl/vUYNOrs8
 UApk02GBLYpVMj2u5VwN0zzpyOPNs8E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-HWRRxAAePneEFLoYCbbdZw-1; Mon, 06 Nov 2023 08:25:36 -0500
X-MC-Unique: HWRRxAAePneEFLoYCbbdZw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99c8bbc902eso312076866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 05:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699277135; x=1699881935;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rpy5xRn2sdo2EVUDX8IiTKUqfSS+Q8LE0WaVGslmrGY=;
 b=vF9Xw8olqT4eeIb9O9z5IjKPvnBElVH3dhMRrNcjko8ibZZRIqdyNECufpncECTcFl
 z9Dx3UKjfpsmhzlHtNGoPOn03t8Y+jP3oeMRRlkedfqAG2ag67YCuGNv5i0Nj7Swmft6
 XWY/1A6pce9db5Nto9+l2T1Xmt+pm8hf1fBrdX9UPqumsxTeejfdUz2OHrEgIz11BDqp
 W/B5H8O1B+IfMVJ+baogPeiYarDdw9JGh2xUew2XY4wvq3AZAt0ztxqnZmHtaPWVIrfe
 DrQxZZiE7iit5PQ/x45Vxjk6s2jQSZFhndfRzCBYHsGKiv+hzlIG5UZmxRz+YiS8yb/n
 xc1Q==
X-Gm-Message-State: AOJu0YzB5eRxq1Wb0NEfdbxagJ+D1TYuftmXKk4O/33a71usgTmqXClo
 7CTVECagEAiNamihkwJ/M4ALmKTZVDATqWXFTyGa1W6F3G/LTLNU2m0uzHnbRbTs1ZlQE29sARp
 LO4lgj/r5jwKmJQk1qE1JtNgwo3f0tZMnYKkW
X-Received: by 2002:a17:906:4fcd:b0:9d3:2de:5cbe with SMTP id
 i13-20020a1709064fcd00b009d302de5cbemr14678058ejw.18.1699277135422; 
 Mon, 06 Nov 2023 05:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+2Rlz6zRkSz8QDwF3b6yOIEhtFAZ8L6x+JL5z+2UyeMJfdT6n1OTl9hrwWid1tfh6yo9EEQ==
X-Received: by 2002:a17:906:4fcd:b0:9d3:2de:5cbe with SMTP id
 i13-20020a1709064fcd00b009d302de5cbemr14678044ejw.18.1699277135135; 
 Mon, 06 Nov 2023 05:25:35 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709067c5100b0099bc8bd9066sm4195999ejp.150.2023.11.06.05.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 05:25:34 -0800 (PST)
Date: Mon, 6 Nov 2023 14:25:32 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/gpuvm: Fix deprecated license identifier
Message-ID: <ZUjpTCTDKgmYEYQc@pollux>
References: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Maxime Ripard <mripard@kernel.org>, David Edelsohn <dje.gcc@gmail.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 06, 2023 at 12:48:27PM +0100, Thomas Hellström wrote:
> "GPL-2.0-only" in the license header was incorrectly changed to the
> now deprecated "GPL-2.0". Fix.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Reported-by: David Edelsohn <dje.gcc@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/5lfrhdpkwhpgzipgngojs3tyqfqbesifzu5nf4l5q3nhfdhcf2@25nmiq7tfrew/T/#m5c356d68815711eea30dd94cc6f7ea8cd4344fe3
> Fixes: f7749a549b4f ("drm/gpuvm: Dual-licence the drm_gpuvm code GPL-2.0 OR MIT")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Acked-by: Danilo Krummrich <dakr@redhat.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 2 +-
>  include/drm/drm_gpuvm.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 08c088319652..b80d4e1cc9b7 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0 OR MIT
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>  /*
>   * Copyright (c) 2022 Red Hat.
>   *
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index bdfafc4a7705..c7a0594bdab1 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
>  
>  #ifndef __DRM_GPUVM_H__
>  #define __DRM_GPUVM_H__
> -- 
> 2.41.0
> 

