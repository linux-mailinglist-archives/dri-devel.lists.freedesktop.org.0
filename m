Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07363EA644
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 16:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6A86E0A0;
	Thu, 12 Aug 2021 14:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448CE6E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:11:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so4697716wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rzdWgaqBFhLS7UFJzcQqLbbRhD8tIgIPbfGNRFXAGDw=;
 b=VCu6datLxtu6zSE4OEfhOGID2ht/kBjziNBzSOEVe5q3d5TB8Z4G3katK2oyy8WdGS
 dPTfdkptIBk+B89z9sDbceOxE8oeDcqHpWRS2um6zXCJZgJU5FXZXtCgboCfbodH8TT3
 SZVKACVqkKbBKRLsGgfKhucWvAt1i2wBC3cDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rzdWgaqBFhLS7UFJzcQqLbbRhD8tIgIPbfGNRFXAGDw=;
 b=mE9ZG3djd/vfmeU4KGNaVSqI1rODl99eb7pvL9xfQT0HLZe/JSphhJKgH2Hfk0KDrM
 dGqNYiKhNJ/sojAuF4WNPAyta/z5AL09u56IJlV4UDDeGLUDoZQkwwWI0iCxSOhr1Gg3
 WdiA0sUsv4Ad07OOLY40LMtDmcPC+bDpNosf4iyPVJ81Om9GJsh+u0Vv+tihuEszaEan
 YAjxovO9uFySEV9nJopaTrPLURjJRExfJlIAq70cQTGABa5KBt21HN8Iq8AlY3kO61aj
 Lhj3tGLDkPJKo1nfqYGUdPgUFnVgKVDsQZLEqMnkyn7dyNAtvzB9w4vmuDEFBSCfYTXM
 6erQ==
X-Gm-Message-State: AOAM532Iy9CreyrU/uGL43I6wOwzt8NsoNSc0ZPrCHACmU+IX+BRK1wL
 i2Dc0ChZDEoMtYw/LnVnSCbKnw==
X-Google-Smtp-Source: ABdhPJzanauWH0+nHdHLXQM76cOHsKUxN5w6jX8dM2l/7Tdf6F9y59KE3+U6adbCZqgmjv+X/K2yew==
X-Received: by 2002:a1c:9852:: with SMTP id a79mr4411866wme.2.1628777490802;
 Thu, 12 Aug 2021 07:11:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e17sm1828632wrs.78.2021.08.12.07.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:11:30 -0700 (PDT)
Date: Thu, 12 Aug 2021 16:11:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: gfx-internal-devel@eclists.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915/guc: Flush the work queue for GuC generated
 G2H
Message-ID: <YRUsEAowykuHCjUM@phenom.ffwll.local>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-6-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811011622.255784-6-matthew.brost@intel.com>
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

On Wed, Aug 11, 2021 at 01:16:18AM +0000, Matthew Brost wrote:
> Flush the work queue for GuC generated G2H messages durinr a GT reset.
> This is accomplished by spinning on the the list of outstanding G2H to
> go empty.
> 
> Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3cd2da6f5c03..e5eb2df11b4a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -727,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>  			wait_for_reset(guc, &guc->outstanding_submission_g2h);
>  		} while (!list_empty(&guc->ct.requests.incoming));
>  	}
> +
> +	/* Flush any GuC generated G2H */
> +	while (!list_empty(&guc->ct.requests.incoming))
> +		msleep(20);

flush_work or flush_workqueue, beacuse that comes with lockdep
annotations. Dont hand-roll stuff like this if at all possible.
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
