Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B16E35D7
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 09:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778C210E223;
	Sun, 16 Apr 2023 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5216510E223
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 07:46:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-504d149839bso615252a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681631160; x=1684223160;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MkdkA8OD7cXyH36YAodVZb65lUzLNaRbZnkDa3NDVjw=;
 b=POrUAQj74ePFOTkyI9Ocu3jz366ZNe7TLso7/k+HH8WLT1TraS9ebn6BvxrgYwrPA0
 m6MjzrNgkJwZ8Ma2HfiXIA5Dh8U5RgIgD+uQm+qBZDUeLuY4I0JpZlWWGtk9dVlFBfK/
 DdrvuJut7J27DUQSw6OCM5/eF1bm9P0+xoTV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681631160; x=1684223160;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MkdkA8OD7cXyH36YAodVZb65lUzLNaRbZnkDa3NDVjw=;
 b=JHd8hYHE7arF5nCUICewwzjGNQPHysxd3HbQGF+Nya/ovVsika8XUWnqyAw41sQsWV
 kmcPEqSG0z/jWJjYCy2O0E7Nhq0rXwNEBK5GSlJSQsWy6WxypM7YGFtL18T7VPfwIyRP
 xGWvTCtFbe+lbkedKQoaLKSNmyc3XRb9o4U7eTIfWd12gRdxuUQJdWnfg5fwfsRRPtJ8
 NuvtO2Eq0pFUa/NhTDUp0aClv8z3n7rQ4V95rcyc3bL5GRGaf+2Vljz8Saq8sHZhH+yE
 dv5KGvdG1sCK2k0+A0ZS1pyvYd9uQYpVp2Tm7ceK5hIvhTOFEZMOi0QWr7mdzRB25ejG
 5n+g==
X-Gm-Message-State: AAQBX9dUcFg0vPKSgcDLNvxSFubedIjE3WCG9TqDEy1BCuWGSzWKRuxP
 spWCDvB/wxOmmDKaPaCRdOLh5Q==
X-Google-Smtp-Source: AKy350b9+E31r4O9FxCOgsNfvnlI0wHdQWBpFJiFyNQ30l+w15A/oBQXzxpuPqL25TD9AQdyPqZmBg==
X-Received: by 2002:a05:6402:3495:b0:502:367:d5b8 with SMTP id
 v21-20020a056402349500b005020367d5b8mr7458730edc.4.1681631160194; 
 Sun, 16 Apr 2023 00:46:00 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170906408d00b0094f29a53129sm1510387ejj.205.2023.04.16.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 00:45:58 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:45:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: avoid flush_scheduled_work()
 usage
Message-ID: <ZDuntOkUeh0Eve8a@phenom.ffwll.local>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <b10d5ada60ab823a09b64f3bfd79db2dd601d5fd.camel@coelho.fi>
 <9ee23b3f-e2e1-6a78-4a28-2ed8790636e5@I-love.SAKURA.ne.jp>
 <87edomg4b6.fsf@intel.com>
 <95e9f67f-b198-4946-327c-626de07e45f9@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95e9f67f-b198-4946-327c-626de07e45f9@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Luca Coelho <luca@coelho.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 07:52:12PM +0900, Tetsuo Handa wrote:
> On 2023/04/14 19:13, Jani Nikula wrote:
> > On Fri, 14 Apr 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> >> On 2023/03/15 19:47, Luca Coelho wrote:
> >>> On Tue, 2023-03-14 at 20:21 +0900, Tetsuo Handa wrote:
> >>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> >>>> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
> >>>>
> >>>> Now that i915 is the last flush_scheduled_work() user, for now let's
> >>>> start with blind conversion inside the whole drivers/gpu/drm/i915/
> >>>> directory. Jani Nikula wants to use two workqueues in order to avoid
> >>>> adding new module globals, but I'm not familiar enough to audit and
> >>>> split into two workqueues.
> >>>>
> >>>> Link: https://lkml.kernel.org/r/87sfeita1p.fsf@intel.com
> >>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> >>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>> Cc: Jani Nikula <jani.nikula@intel.com>
> >>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>> ---
> >>>> Changes in v2:
> >>>>   Add missing alloc_workqueue() failure check.
> >>>
> >>> Hi,
> >>>
> >>> Thanks for your patch! But it seems that you only fixed that failure
> >>> check, without making the other change Jani proposed, namely, move the
> >>> work to the i915 struct instead of making it a global.
> >>>
> >>> I'm working on that now.
> >>
> >> What is estimated time of arrival on this?
> >> Can we expect your work in Linux 6.4 ?
> > 
> > I'm afraid that ship has sailed. Sorry. :(
> 
> Well, then, can we temporarily apply "[PATCH v2] drm/i915: avoid flush_scheduled_work() usage" ?
> This patch is a mechanical conversion which unlikely causes regressions. This patch eliminates
> interference from work items outside of i915, which is small but an improvement for i915 users.

I think if someone from i915 team triple-checks that i915 really doesn't
use any of the drm workers (hotplug handling, atomic commit, ...) then I
think we should be fine. The one that's unavoidable is the rmfb work
(which really only exists to avoid signal interruptions when doing this in
userspace process context, it's entirely synchronous otherwise), but I
think that's safe.

With that tripled checked I think the mechanical conversion is ok to land
late for 6.4 and has my

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

[Dropped this on irc already, here just for the record]

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
