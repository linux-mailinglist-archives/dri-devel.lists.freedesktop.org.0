Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 929661A940D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FE6E862;
	Wed, 15 Apr 2020 07:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC86E197;
 Tue, 14 Apr 2020 14:52:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m21so6406pff.13;
 Tue, 14 Apr 2020 07:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4WBdHUkYY7smG8N50aarxY/4v+FvQTuqufQXoC73mFQ=;
 b=MEXki3BaFWnYoRR85tDAQx5t+k2hbOoYL1UqxELV4hJ9Q/vNcmjnM/eNLsd3Ut0Dug
 8Sg0yl+favtQwMzms5YE30YSRcIkEOGPnc0+of4JYt8tWMd4ZFhi/G83ivnIOh1jZFtx
 pNIa3474B2SkRtM0KFb1ef5ktSAvpCqX3EHYHtTCY9zct1IhmCuH286dv9chQseJzmmx
 dGiWnBIUCU4DBMUUrZhRbJuaCf5b1AL2u2QGUW/R2IGdpVssI4X4Krj+TpvuUP7Wz0nG
 Qx5+jhpNbi3WwMy+xdgPBuARVPQ80BG3/cfDityDixgrGRqW41iGACfIUJf81cD/kjXL
 qzpQ==
X-Gm-Message-State: AGi0Puayc0mPdAlIR6C4f9N1UQmG82Bmh6zJx6bMKSI27I06Rdk4j8DC
 bYDWgXJ29k/3Fqi6bkTKqiE=
X-Google-Smtp-Source: APiQypLsvkblz51WUZpaRhQYiOLEZSBo6rwtEWCpFLomKuFySQ2et7hfOCSdy26kKt9i4WSgUjZekA==
X-Received: by 2002:a63:2cce:: with SMTP id
 s197mr23209940pgs.184.1586875937101; 
 Tue, 14 Apr 2020 07:52:17 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id i190sm9442055pfc.119.2020.04.14.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 07:52:16 -0700 (PDT)
Date: Tue, 14 Apr 2020 07:52:13 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/1] drm/i915: Fix ref->mutex deadlock in
 i915_active_wait()
Message-ID: <20200414145213.GC2082@sultan-box.localdomain>
References: <20200407062622.6443-1-sultan@kerneltoast.com>
 <20200407062622.6443-2-sultan@kerneltoast.com>
 <158685200854.16269.9481176231557533815@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158685200854.16269.9481176231557533815@build.alporthouse.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 09:13:28AM +0100, Chris Wilson wrote:
> Quoting Sultan Alsawaf (2020-04-07 07:26:22)
> > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > 
> > The following deadlock exists in i915_active_wait() due to a double lock
> > on ref->mutex (call chain listed in order from top to bottom):
> >  i915_active_wait();
> >  mutex_lock_interruptible(&ref->mutex); <-- ref->mutex first acquired
> >  i915_active_request_retire();
> >  node_retire();
> >  active_retire();
> >  mutex_lock_nested(&ref->mutex, SINGLE_DEPTH_NESTING); <-- DEADLOCK
> > 
> > Fix the deadlock by skipping the second ref->mutex lock when
> > active_retire() is called through i915_active_request_retire().
> > 
> > Fixes: 12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
> > Cc: <stable@vger.kernel.org> # 5.4.x
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> Incorrect. 
> 
> You missed that it cannot retire from inside the wait due to the active
> reference held on the i915_active for the wait.
> 
> The only point it can enter retire from inside i915_active_wait() is via
> the terminal __active_retire() which releases the mutex in doing so.
> -Chris

The terminal __active_retire() and rbtree_postorder_for_each_entry_safe() loop
retire different objects, so this isn't true.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
