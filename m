Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8853EEA0D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CB66E14C;
	Tue, 17 Aug 2021 09:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58196E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:39:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h13so27679675wrp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJSxWYLKnDA66bheHGHNbiU7aF7BawRxoKGnFTnRlBM=;
 b=AQgwWDyF9STNIoiaoUboFEI4Lf1WzX+DQA96iH4l0yrFtip5OvC7LLxkDaJGX9u26v
 /bDezuaUVZ7+xAMbNLxMIueq9aW5414w5jgY3YrWptJq0w0s8PKB6kMN8WHF3Qwew+XB
 lzRgJs1mHZAzeH6Kojx77Z5irfJmIYnfCxSZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJSxWYLKnDA66bheHGHNbiU7aF7BawRxoKGnFTnRlBM=;
 b=gJEVtNyJFS87WFxjQ0IzGBfJtThCrYNGGR7yj7S/8Uc0vhSXFHygFRU+d+8TELMhDy
 bR3l5HJMfxv+1EopmWY+JPUGC7WY4bw8ttw00uJDdWoVUMH3Ryzfn9NGVojqf7tEVQe5
 stQNee4JWJ4n9ZEz7fiS24vNZfEhpTpZVsMDhHzudyRmBHgYcnpEqzwNAOLSHyYK1ELA
 szR36SOWsvXqVbKpQFWF7zPqt7BD0cvs9onVgmGaH7Aj/hMAB+rlxmnzz4RdCkWXrKcA
 H/3np8k2lv+B2hVD47DJTVVW2xgSycK9QKxBOV6jTUnzjLe9RNsHBQlIj7wPwAwzjB2Q
 KnOg==
X-Gm-Message-State: AOAM532eLkgDFU8il/m+gB+5uwLYh47Ll3yQfAAF1t7GVXnet7M1wlDR
 SER/ksYpbEcNcikUSwffVRG62A==
X-Google-Smtp-Source: ABdhPJx219a4HpbSUMZuXDX4kDcHSoRjr6JHVpn98bgWjw4UDPC64d7onillyUh7s7eObVJW1jm9eA==
X-Received: by 2002:adf:e30c:: with SMTP id b12mr2805809wrj.347.1629193171354; 
 Tue, 17 Aug 2021 02:39:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b201sm1471683wmb.6.2021.08.17.02.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 02:39:30 -0700 (PDT)
Date: Tue, 17 Aug 2021 11:39:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 02/22] drm/i915/guc: Fix outstanding G2H accounting
Message-ID: <YRuD0bTDQTivDZux@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-3-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 16, 2021 at 06:51:19AM -0700, Matthew Brost wrote:
> A small race that could result in incorrect accounting of the number
> of outstanding G2H. Basically prior to this patch we did not increment
> the number of outstanding G2H if we encoutered a GT reset while sending
> a H2G. This was incorrect as the context state had already been updated
> to anticipate a G2H response thus the counter should be incremented.
> 
> Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 69faa39da178..b5d3972ae164 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -360,11 +360,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
>  {
>  	int err;
>  
> -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> -
> -	if (!err && g2h_len_dw)
> +	if (g2h_len_dw)
>  		atomic_inc(&guc->outstanding_submission_g2h);
>  
> +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);

I'm majorly confused by the _busy_loop naming scheme, especially here.
Like "why do we want to send a busy loop comand to guc, this doesn't make
sense".

It seems like you're using _busy_loop as a suffix for "this is ok to be
called in atomic context". The linux kernel bikeshed for this is generally
_atomic() (or _in_atomic() or something like that).  Would be good to
rename to make this slightly less confusing.
-Daniel

> +	if (err == -EBUSY && g2h_len_dw)
> +		atomic_dec(&guc->outstanding_submission_g2h);
> +
>  	return err;
>  }
>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
