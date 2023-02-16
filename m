Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4454569976B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278C810ED8F;
	Thu, 16 Feb 2023 14:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C656910ED8F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676557772; x=1708093772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+I2KAMDx037/R9NsawQn5d7tMSDPQZO0PVR+h6apQ5A=;
 b=V17XS5Oaac79XbJErKAi7gXtpWaohIWbujOu15Z4khJSYUBEpemqr/Yy
 ARihv+DKj9aHMPmCtdKLwOO5VVFit7X20P2u6tbIxQvDoTL284kNyODxm
 kfhpw8FlMTls7zqoRs+926/MoFdHUUjKs0fxGByC4Oy7upt17U3jBAqRO
 1+oTSMLMlksPyzRPqo1n/yaL4wSVy81RFk3gNGGDicQxnGOOZsnkEz8BW
 0/u4QVcVK//ubr4UgazTttnQnN9g19U/8befY0CeedT+SP80FwuyKPkG9
 +nP+ttlPBBMOzLDJYMQ0Mv8UEjMmqFRoWi1QH/8QR5FB59dQBBSxi3gHQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359158187"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="359158187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:29:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700505140"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="700505140"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:29:30 -0800
Date: Thu, 16 Feb 2023 15:29:28 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 18/27] habanalabs: change user interrupt to threaded IRQ
Message-ID: <20230216142928.GG2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-18-ogabbay@kernel.org>
 <20230216102821.GA2849548@linux.intel.com>
 <CAFCwf13K+y7GgYkVYSgxOrQK6VJkQ+vV6uxs9qy06J-6Ds1ZuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13K+y7GgYkVYSgxOrQK6VJkQ+vV6uxs9qy06J-6Ds1ZuA@mail.gmail.com>
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
Cc: Tal Cohen <talcohen@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 03:47:44PM +0200, Oded Gabbay wrote:
> On Thu, Feb 16, 2023 at 12:28 PM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > Hi
> >
> > On Sun, Feb 12, 2023 at 10:44:45PM +0200, Oded Gabbay wrote:
> >
> > >  irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
> > > +{
> > > +     return IRQ_WAKE_THREAD;
> > > +}
> >
> > This is not needed. You can pass NULL to request_threaded_irq() and
> > the irq core will use irq_default_primary_handler() which is exactly
> > the same function :-)
> >
> > Regards
> > Stanislaw
> >
> >
> You are correct but in patch 19/27 (the one after this), this function
> is filled with actual code, so I don't know if it's worth changing
> this patch...

I see, no need to change this patch if the function will be extended.

Regards
Stanislaw
