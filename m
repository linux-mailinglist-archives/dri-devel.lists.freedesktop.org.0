Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBD3EAB45
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53816E450;
	Thu, 12 Aug 2021 19:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610D76E450
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 19:47:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r6so9921045wrt.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TT6J1wH4E49/YqdjXU7Fs+j02XrHPOfra71orKUdVXA=;
 b=CidwpQaG+j3L3iCZQmdLloeYgxNokEolGvj4BHDozsD+Fwvg2hHhBnKi4XYQ2OGuem
 KKTvt9g6GQBNRqWp7DQ3TT+pz+U9QkpY33jWkciyEZgC1xy9BJCBt2AdKuJbYqTvWrrA
 l0+3Jc+dn7mol4C/cc+xyTlDRegKY94LCDbg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TT6J1wH4E49/YqdjXU7Fs+j02XrHPOfra71orKUdVXA=;
 b=Kwv0i5yC/8eJR0Ijv/o/NWC3KbyvIIlIDIE24cco6xcNdVp3CorPAOTh7BddVjUE6Z
 cyOaJx4nV8ajV9z63NajyD9L536FqOPp4CW0Z4JP/tblRVTduE75t8jtSacdtiucfTr2
 cQQ9VHcVcvz+ncxFtRTknG4NE+6AzNJ5B38/dNxlaUXeKQ2CMLwmzyQf+rvjZSt1ENnn
 wmeBTgr7bCg/SRaEhoUzzELA5UEogYoCpnkHEU+bqFvk7DCzboTktTUHMWig+pALc0sC
 qYSSLKZTbr5MRse7SCZUdo2S1+GNFwVULIFtemkX0A+YCGTaMEKbjHMfbXJZsP419lVa
 2hCw==
X-Gm-Message-State: AOAM531BbTtHreC9PuHbbZ1Qso4ZQ2bf/9TzIuK4RBMTgOfkIK6bqS/x
 OfaiQsfwcOW56MiJxRR5c8DOPQ==
X-Google-Smtp-Source: ABdhPJyHIjs3/n40ZbYFgjS4t8CipXO4B6NRG4OEREVXcHNWstum8C3Jq8C2fnx+kdTX6aZjuAJGKg==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr6002260wrm.200.1628797645887; 
 Thu, 12 Aug 2021 12:47:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u25sm3476071wml.8.2021.08.12.12.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 12:47:25 -0700 (PDT)
Date: Thu, 12 Aug 2021 21:47:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, gfx-internal-devel@eclists.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915/guc: Flush the work queue for GuC generated
 G2H
Message-ID: <YRV6y4vFc2UWE3zp@phenom.ffwll.local>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-6-matthew.brost@intel.com>
 <YRUsEAowykuHCjUM@phenom.ffwll.local>
 <20210812152330.GA480603@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812152330.GA480603@DUT151-ICLU.fm.intel.com>
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

On Thu, Aug 12, 2021 at 03:23:30PM +0000, Matthew Brost wrote:
> On Thu, Aug 12, 2021 at 04:11:28PM +0200, Daniel Vetter wrote:
> > On Wed, Aug 11, 2021 at 01:16:18AM +0000, Matthew Brost wrote:
> > > Flush the work queue for GuC generated G2H messages durinr a GT reset.
> > > This is accomplished by spinning on the the list of outstanding G2H to
> > > go empty.
> > > 
> > > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <stable@vger.kernel.org>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 3cd2da6f5c03..e5eb2df11b4a 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -727,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> > >  			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> > >  		} while (!list_empty(&guc->ct.requests.incoming));
> > >  	}
> > > +
> > > +	/* Flush any GuC generated G2H */
> > > +	while (!list_empty(&guc->ct.requests.incoming))
> > > +		msleep(20);
> > 
> > flush_work or flush_workqueue, beacuse that comes with lockdep
> > annotations. Dont hand-roll stuff like this if at all possible.
> 
> lockdep puked when used that.

Lockdep tends to be right ... So we definitely want that, but maybe a
different flavour, or there's something wrong with the workqueue setup.

This is the major reason why inventing any wheels locally in the kernel
isn't a good idea - aside from the duplicated code because likely there is
a solution for whatever you need. There's all the validation tools,
careful thought about semantics (especially around races) and all that
stuff that you're always missing on your hand-rolled thing. Aside from
anything hand-rolled is much harder to read, since intent isn't clear.
-Daniel


> 
> Matt
> 
> > -Daniel
> > 
> > > +
> > >  	scrub_guc_desc_for_outstanding_g2h(guc);
> > >  }
> > >  
> > > -- 
> > > 2.32.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
