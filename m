Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784BD1A5229
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533CC6E313;
	Sat, 11 Apr 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0466ECEE;
 Fri, 10 Apr 2020 14:17:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v23so1111850pfm.1;
 Fri, 10 Apr 2020 07:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=phSmRmK8df1FHnQ5vNeBAAQ75z9yd9I/uZBVXE2qr20=;
 b=ZIcVsJn4UjSA3Sp2PX7HxaKIqILbmsW9A/S68ICfQKGX9CF0a+50UJwdgJ7OJxD0hp
 jr/sN1M4oYKX2je/xhRlzyMsuTpOC/WzAmV59qc16o7lFp6orQOubyqUtRSCo7kYW+Ra
 cLamay1/p2mWIS+KWm660wWRi6Lu1IdUZvy8ZtWgCfdHt1k7qgZQqr1i+KR7KixzSbgn
 NcnTmrYMVcIoaN5QhOPnLfRng6dm4Qm9EWx5FwL2tDYYJviXRSIZoje4bepiKAHshpYt
 bvAibkwC2AhG7E47K9lS1eTfuhYWQBryG/rUDtT9pvWw6jzgNaNmXgQrxK3Dt4i3Dsr3
 pN+Q==
X-Gm-Message-State: AGi0PubJNh5WRAGLZBpjMhRd5hDdSE4m/2gcxW9+70Tq5kpaaJd+3aMC
 5+AUruhj4tedIB9O2yiuKos=
X-Google-Smtp-Source: APiQypJeGWMtEkYgrzBPjdIl7sj2PdpafWKmiZDlFKA/qWp0FO3nWji0ifyG/uz4StCCWE0/jA2S/g==
X-Received: by 2002:a63:f403:: with SMTP id g3mr4880072pgi.47.1586528262067;
 Fri, 10 Apr 2020 07:17:42 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id s9sm1841879pjr.5.2020.04.10.07.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 07:17:41 -0700 (PDT)
Date: Fri, 10 Apr 2020 07:17:38 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] drm/i915: Fix ref->mutex deadlock in i915_active_wait()
Message-ID: <20200410141738.GB2025@sultan-box.localdomain>
References: <20200407065210.GA263852@kroah.com>
 <20200407071809.3148-1-sultan@kerneltoast.com>
 <20200410090838.GD1691838@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410090838.GD1691838@kroah.com>
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 11:08:38AM +0200, Greg KH wrote:
> On Tue, Apr 07, 2020 at 12:18:09AM -0700, Sultan Alsawaf wrote:
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
> > Note that this bug only affects 5.4 and has since been fixed in 5.5.
> > Normally, a backport of the fix from 5.5 would be in order, but the
> > patch set that fixes this deadlock involves massive changes that are
> > neither feasible nor desirable for backporting [1][2][3]. Therefore,
> > this small patch was made to address the deadlock specifically for 5.4.
> > 
> > [1] 274cbf20fd10 ("drm/i915: Push the i915_active.retire into a worker")
> > [2] 093b92287363 ("drm/i915: Split i915_active.mutex into an irq-safe spinlock for the rbtree")
> > [3] 750bde2fd4ff ("drm/i915: Serialise with remote retirement")
> > 
> > Fixes: 12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
> > Cc: <stable@vger.kernel.org> # 5.4.x
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > ---
> >  drivers/gpu/drm/i915/i915_active.c | 27 +++++++++++++++++++++++----
> >  drivers/gpu/drm/i915/i915_active.h |  4 ++--
> >  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> Now queued up, thanks.
> 
> greg k-h

I'm sorry, I meant the v3 [1]. Apologies for the confusion. The v3 was picked
into Ubuntu so that's what we're rolling with.

Thanks,
Sultan

[1] https://lore.kernel.org/stable/20200407203222.2493-1-sultan@kerneltoast.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
