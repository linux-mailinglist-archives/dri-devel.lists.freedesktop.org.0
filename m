Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D313EE9A3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD9B898A8;
	Tue, 17 Aug 2021 09:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80F8989C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:21:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g138so13240863wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uh4VRS/T0smkQ973beOpdBffExTecp/MJ9La1DdXkdw=;
 b=GETX8i+RS6Ulm3acTx6EYsApbt/xkcltG0uoMf0QXmcieZu8Dbr5nItuGNWCg1Ei92
 DY3xhNX2zrPZ/8zTb1Gtzz8szsrvyTY0hWozaG1vBByqRFQO5CnscoJgr7t8GZIQfRv0
 Y+WOsCcag6+aiwEz4Qy6cW4HmLipmXB20tbQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uh4VRS/T0smkQ973beOpdBffExTecp/MJ9La1DdXkdw=;
 b=na/fdH1vosQ0dlQDPLVYDWuPhkaJMDIB7lr5gFTlhA/A5QReo2IUhRHMtXLLhRi2T6
 O0At4WwG5Zi5LxG3u8Nb+r6sXW8hnhISRfNc2Orl2Sx0LhnHS1xZlgtCQG6TFWOxHnh6
 j6bsDGygJyj1HY+BFzUwpP97S+raSXy7gwn8lL7/vqZwqWpq4UW3XIK39GJKiQ8stJWT
 8iTvlW1NlKOCiv8YHKEVbORHfTSUVAXdMuTGy+SiB2Ryw/aLrdoL7Tlf/FrBg2t0EIKT
 f5SZSIB8Yso+AxhD+J8kDBSLz3B/itg8HiNkZSmn0Ro5WUDbLb+iLZXMgHStwnjDVZr1
 zeCw==
X-Gm-Message-State: AOAM5313ZxasdNsHkIG97G81kW6aUS3g/UDi4fo778S4bMpuJI7B/r/4
 r2iKhDeDt6TYPz+FECD1OJbncA==
X-Google-Smtp-Source: ABdhPJx8fB5Umd4nOHquu5E2DBsSWJQZ41RXcT0BOVqkRlh7KFkIJTn2vrorjbA+AzxLLzqEn+KLDA==
X-Received: by 2002:a05:600c:c2:: with SMTP id
 u2mr2298606wmm.106.1629192089752; 
 Tue, 17 Aug 2021 02:21:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j36sm1326619wms.16.2021.08.17.02.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 02:21:29 -0700 (PDT)
Date: Tue, 17 Aug 2021 11:21:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 06/22] drm/i915/execlists: Do not propagate errors to
 dependent fences
Message-ID: <YRt/lynczP00iJqF@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-7-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-7-matthew.brost@intel.com>
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

On Mon, Aug 16, 2021 at 06:51:23AM -0700, Matthew Brost wrote:
> Progagating errors to dependent fences is wrong, don't do it. Selftest
> in following patch exposes this bug.

Please explain what "this bug" is, it's hard to read minds, especially at
a distance in spacetime :-)

> Fixes: 8e9f84cf5cac ("drm/i915/gt: Propagate change in error status to children on unhold")

I think it would be better to outright revert this, instead of just
disabling it like this.

Also please cite the dma_fence error propagation revert from Jason:

commit 93a2711cddd5760e2f0f901817d71c93183c3b87
Author: Jason Ekstrand <jason@jlekstrand.net>
Date:   Wed Jul 14 14:34:16 2021 -0500

    Revert "drm/i915: Propagate errors on awaiting already signaled fences"

Maybe in full, if you need the justification.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>

Unless "this bug" is some real world impact thing I wouldn't put cc:
stable on this.
-Daniel
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..cafb0608ffb4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2140,10 +2140,6 @@ static void __execlists_unhold(struct i915_request *rq)
>  			if (p->flags & I915_DEPENDENCY_WEAK)
>  				continue;
>  
> -			/* Propagate any change in error status */
> -			if (rq->fence.error)
> -				i915_request_set_error_once(w, rq->fence.error);
> -
>  			if (w->engine != rq->engine)
>  				continue;
>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
