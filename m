Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B258F945ED5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 15:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48DB10E100;
	Fri,  2 Aug 2024 13:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jjS7YOM9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BFD10E100;
 Fri,  2 Aug 2024 13:44:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so42897265e9.2; 
 Fri, 02 Aug 2024 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722606262; x=1723211062; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CcwtTMQVfhKv7XwexErI3oh4Oa+G3cV+0RcW1awDBRA=;
 b=jjS7YOM9UbAHZWqwNYK0lisTaWZ7yFrftbBtDMocz+d1X5Z8uUAXePVIbwycW4O9MH
 EW9XVc3oFCYdOz1z4//2TnaJ+UWcvDmYPCDEleGcYvZCbPGuFi9z61t/R5ZJQUDjQNQ5
 95H9PRxhElGBUl2zcrVFdbYOcYBbRsC/0A9kCiJ1POaIgJuwv2VPXvQrSpQkTeydSgrF
 aoNb/lo0WTSs35/upnqCq98QR38lgTUMAZTggkzsMRAK7tesQTL0KexDt2QVcIzU335S
 YmDVaxKb1UUpxoTU/x6VgZk+y+7KWJdsCcwBO3rlQpXg21XJfB0XwgGhiJ8e8amYJGeF
 zABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722606262; x=1723211062;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcwtTMQVfhKv7XwexErI3oh4Oa+G3cV+0RcW1awDBRA=;
 b=gQVaiJqEX3qyN6+WzRjy2OZ9avEFn4ljNiarCV/sTu+d7GFtH/fvXLrooVr2yCs1rv
 5TgK4APoQKJypO0FdJbnQSr0JGn+/h4eQZn6imvAO2oCbrdGPkXHh+ih75/tHSADHqsD
 hXiJVOYktqTkCae/iLxHutgopvHfX38TH4NVrpv5RxT8/xtBTtEwJiK8pLVEj1ruEdM6
 Xy4PTd4o+I4sQlzwFt/8fe5fYlhveVNu3aLWm1pdGPMgtd1paZJkB5GfobFft+PshwsU
 /oaXuDROJEP+YvmAHl9995/XHR6WJhzENQfYh6fZ9k+asv4YPX1Cbj237j7A4WWelzHs
 bWdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOtVmKd6+ikBWauFIktPckkVtX1OvjVGQ7v+w3Rqsenm5hmAzkaaWkrpG3kEXZTa9Z98By1oxU3v/YhjQ5GiuLE0DTpSUBlbUGgzOLoqftepbiT0FvKwR5MPX8SFnnK9kabdcya6E5Fc5IUnOWR4mL
X-Gm-Message-State: AOJu0YyDQ45wkhAHpNArGAZfuV77mmJzzsI/Foq0+RSMnhUc3S8F1Cfc
 Orp8GI17Ja8Ycn531mZm5yKXm+Jl+lhK+kue/1Xxcdj0jMe9yxep
X-Google-Smtp-Source: AGHT+IHfG0vqtO7zxfbhIi4ginfwQxwejcFL5nLLqb66mHVAL/Ea2qkix54dImYnaTW7CYLeXdZ4wA==
X-Received: by 2002:a05:600c:1d24:b0:426:6e9a:7a1c with SMTP id
 5b1f17b1804b1-428e6fb66eamr19397065e9.25.1722606262025; 
 Fri, 02 Aug 2024 06:44:22 -0700 (PDT)
Received: from trashcan ([222.118.21.173]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb63f16sm94131435e9.33.2024.08.02.06.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 06:44:21 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:41:32 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
Message-ID: <ZqziDJlrhvSnijpw@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-3-vladimir.lypak@gmail.com>
 <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>
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

On Thu, Aug 01, 2024 at 06:46:10PM +0530, Akhil P Oommen wrote:
> On Thu, Jul 11, 2024 at 10:00:19AM +0000, Vladimir Lypak wrote:
> > Two fields of preempt_record which are used by CP aren't reset on
> > resume: "data" and "info". This is the reason behind faults which happen
> > when we try to switch to the ring that was active last before suspend.
> > In addition those faults can't be recovered from because we use suspend
> > and resume to do so (keeping values of those fields again).
> > 
> > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > index f58dd564d122..67a8ef4adf6b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > @@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> >  		return;
> >  
> >  	for (i = 0; i < gpu->nr_rings; i++) {
> > +		a5xx_gpu->preempt[i]->data = 0;
> > +		a5xx_gpu->preempt[i]->info = 0;
> 
> I don't see this bit in the downstream driver. Just curious, do we need
> to clear both fields to avoid the gpu faults?

Downstream gets away without doing so because it resumes on the same
ring that it suspended on. On mainline we always do GPU resume on first
ring. It was enough to zero info field to avoid faults but clearing
both shouldn't hurt.

I have tried to replicate faults again with local preemption disabled
and unmodified mesa and couldn't do so. It only happens when fine-grain
preemption is used and there was a switch from IB1.
This made me come up with explanation of what could be happening.
If preemption switch is initiated on a some ring at checkpoint in IB1,
CP should save position of that checkpoint in the preemption record and
set some flag in "info" field which will tell it to continue from that
checkpoint when switching back.
When switching back to that ring we program address of its preemption
record to CP_CONTEXT_SWITCH_RESTORE_ADDR. Apparently this won't remove
the flag from "info" field because the preemption record is only being
read from. This leaves preemption record outdated on that ring until
next switch will override it. This doesn't cause issues on downstream
because it won't try to restore from that record since it's ignored
during GPU power-up.

Vladimir

> 
> -Akhil
> >  		a5xx_gpu->preempt[i]->wptr = 0;
> >  		a5xx_gpu->preempt[i]->rptr = 0;
> >  		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> > -- 
> > 2.45.2
> > 
