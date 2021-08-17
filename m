Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D743EEA8C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1A1891AA;
	Tue, 17 Aug 2021 10:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0996E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:06:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v4so20593172wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vkCyLEz9chqCmLVRns2Wyvxr9JhObbqxsNa0Ed7C+5M=;
 b=D4+BrnoqwhSUraduMPTjO0EI5waCTm5Kj/As+1BEMbUFTewkjVQUn4cuM1blUmiDXo
 uC/MZZJvqCgJcsB3h+JvWt2pfs8ubj/XntYUqYEpJw7uQILPGncCKMDO2r29m4T671Wz
 casfHQ/hTn4jXF9zmI0Cx4QzgqZ9BBXYThSuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vkCyLEz9chqCmLVRns2Wyvxr9JhObbqxsNa0Ed7C+5M=;
 b=e0Q3/Z3wf8O0v5wcysCSuyJ0Q1x9z8Zsex+ZFgE/AOKrZMb1oUMIgubYvYOn3Au7oo
 cTCNI5ipKdRvEhz86zTuWdrBE4w6NCs3OcH4Sj26TeUxG0TjmMCyWWbKwiiRMXqxjCnD
 6S1HwxhcywGrK2OrAtlBv0VjYBDVJ01wxeIG7/4duWLAl2Y/KBm+aukcl/rwpKlFfA5R
 9rP9RA3+iaQ5VXlnmZM1SIjvKjgIaVYPgwptPU2K/WNYPpLMGUAoWAXufg484V9raPH8
 qQw5x1QTcOD3lGEgmtdtSw7ANREXaGZkYfEM0q20Z1sUbNxuXJsAy+o4sdp1bgK+q0tV
 6PWA==
X-Gm-Message-State: AOAM532G11CC7aSa/EoW5RQHujV2StJBQd92HmjB/IJNrHVHrTTUqJgn
 1Jw+ENJWTOiMR4ajEse03kTcnw==
X-Google-Smtp-Source: ABdhPJxrCtcEpAeSMuiIzwk/H/Gb3IfiwoOOaBGoN7+bi0o6/E23lE6EQ0DJukrqAFWyLlLVmpBZuQ==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr2986296wri.261.1629194816924; 
 Tue, 17 Aug 2021 03:06:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k17sm2056398wrn.8.2021.08.17.03.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:06:56 -0700 (PDT)
Date: Tue, 17 Aug 2021 12:06:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 15/22] drm/i915/guc: Flush G2H work queue
 during reset
Message-ID: <YRuKPnyQeVwV1CRp@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-16-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-16-matthew.brost@intel.com>
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

On Mon, Aug 16, 2021 at 06:51:32AM -0700, Matthew Brost wrote:
> It isn't safe to scrub for missing G2H or continue with the reset until
> all G2H processing is complete. Flush the G2H work queue during reset to
> ensure it is done running.
> 
> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3a01743e09ea..8c560ed14976 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -707,8 +707,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
>  
>  void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>  {
> -	int i;
> -
>  	if (unlikely(!guc_submission_initialized(guc))) {
>  		/* Reset called during driver load? GuC not yet initialised! */
>  		return;
> @@ -724,20 +722,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>  
>  	guc_flush_submissions(guc);
>  
> -	/*
> -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> -	 * each pass as interrupt have been disabled. We always scrub for
> -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> -	 * be incremented after the context state update.
> -	 */
> -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> -		intel_guc_to_host_event_handler(guc);
> -#define wait_for_reset(guc, wait_var) \
> -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> -		do {
> -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> -		} while (!list_empty(&guc->ct.requests.incoming));
> -	}
> +	flush_work(&guc->ct.requests.worker);

Same thing about flush_work as in an earlier patch.
-Daniel

> +
>  	scrub_guc_desc_for_outstanding_g2h(guc);
>  }
>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
