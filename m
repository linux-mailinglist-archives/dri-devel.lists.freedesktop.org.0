Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F38403DCB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BE3897E8;
	Wed,  8 Sep 2021 16:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681689496
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:46:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1603053wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0FtxDQcrUwzDD3CEJno/YlqKVX8CmQWK6QX+v2195wo=;
 b=PhvlH9EFJT+xHlpBrh9zZPI0q72wsNF3oh5eGh9/NSg5MqXB71qFVPj45fZG+BDlYd
 QL1dKzdTybtOQFKwW9t1hPK/cQvEiYdWbzOZnrlcAHa9l8sTCpw6+YlVlaDNpoLE5QJ3
 WZIkEw1MSE8OLLhud9llG/MVlwrGEyJ4J1i9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0FtxDQcrUwzDD3CEJno/YlqKVX8CmQWK6QX+v2195wo=;
 b=HqJUfF/ZSsOJWpriAqU+PNoPlGSN2v0UILzG0p8nX6Vlo6q5OEDpgvj37wKJQvVgGW
 HoEIYxNPFPcd7zdKTQG9oIqwJ44caBnXjoZCxTclsPbhI/n2AJ4rEpRQLFrl+Q6ideBM
 hLxlei4q7JMxZIuXuqLcjkuW0iwXAn1fF5NZxvZw9/cOg5u/rxYzI36JYK9k6ieq9n74
 gU71BRv9vPWvHumEEwx6Ra1CTnaX80prk5DB9sQNN/fDnqVUqp7JZ6YAO8i2px31gmq6
 A0SGEYA9LR9Vl1AMT7UJoFruPajVs7optjGwnewl5YCGySOq/05K9MEOxXPXtaSrNXUn
 GURw==
X-Gm-Message-State: AOAM531tjQlA5KwZdXB4/WytV0e6veky5DagAr/tYqXI09wbmszLHOdh
 1htHKKJAJl/eCVLmyX6TOgPluw==
X-Google-Smtp-Source: ABdhPJx8WESdySp5mpSM7TZvHePNXC8vJnnCRMdVk+GFIUIwjw0LMA0CN7xwDhs35kwEaya8O5ikDA==
X-Received: by 2002:a05:600c:1d29:: with SMTP id
 l41mr4555656wms.177.1631119592080; 
 Wed, 08 Sep 2021 09:46:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m3sm3407321wrg.45.2021.09.08.09.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:46:31 -0700 (PDT)
Date: Wed, 8 Sep 2021 18:46:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/xehp: CCS shares the render
 reset domain
Message-ID: <YTjo5Yfcjoyf/Evz@phenom.ffwll.local>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907171916.2548047-3-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 07, 2021 at 10:19:10AM -0700, Matt Roper wrote:
> The reset domain is shared between render and all compute engines,
> so resetting one will affect the others.
> 
> Note:  Before performing a reset on an RCS or CCS engine, the GuC will
> attempt to preempt-to-idle the other non-hung RCS/CCS engines to avoid
> impacting other clients (since some shared modules will be reset).  If
> other engines are executing non-preemptable workloads, the impact is
> unavoidable and some work may be lost.
> 
> Bspec: 52549
> Original-patch-by: Michel Thierry
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Do we have igts validating this all properly?

Specifically that the reset stats are incremented correctly for guilty
respectively victimized contexts.

This is necessary if it doesn't exist yet.

Also you need a patch set here that fixes up the igts which have wrong
assumptions about context isolation.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 91200c43951f..30598c1d070c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -507,6 +507,10 @@ static int gen11_reset_engines(struct intel_gt *gt,
>  		[VECS1] = GEN11_GRDOM_VECS2,
>  		[VECS2] = GEN11_GRDOM_VECS3,
>  		[VECS3] = GEN11_GRDOM_VECS4,
> +		[CCS0] = GEN11_GRDOM_RENDER,
> +		[CCS1] = GEN11_GRDOM_RENDER,
> +		[CCS2] = GEN11_GRDOM_RENDER,
> +		[CCS3] = GEN11_GRDOM_RENDER,
>  	};
>  	struct intel_engine_cs *engine;
>  	intel_engine_mask_t tmp;
> -- 
> 2.25.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
