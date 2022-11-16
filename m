Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48AB62BEFE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CB10E12D;
	Wed, 16 Nov 2022 13:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFEB895B9;
 Wed, 16 Nov 2022 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668603970; x=1700139970;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=InMnGBG9WIu93rX/1BniIAb5g2P3gQSwtf4zO3a6OCk=;
 b=XISL0dHhL+TwTWYx85T2MQZ/oQ5+QEAJzl/OxS2OsI8kc37NN93dJmMp
 uyolFDVADtTvUYYbsBJyHcxtFplZCrL7QCHvJMD2FZC3xszVFcPLtBVmI
 7PmpU5OhJtNjMbKLaev+zq6y30zHUocenVaQl1kgJFDC3Z15WbB/CNo1T
 19GaoaBX2vBOBkCqi0ZSIqsFLe5HiJ8AbV5djzpctUACkhl/toAPFhbE/
 X3NWMtoOrEO7rikmHkasLY/TV1uKNbn40vHY5IyllRg2MSq3DtPP9VNon
 32gwquw6ezfedJgh6AVmeQxOpC9nLgT+nuAvZQT2SGS40s9AfaW7+mYBj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="339351385"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="339351385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 05:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="633622290"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="633622290"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 16 Nov 2022 05:06:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Nov 2022 15:06:03 +0200
Date: Wed, 16 Nov 2022 15:06:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] How is the progress for removing
 flush_scheduled_work() callers?
Message-ID: <Y3TgO7pHo9z9FINO@intel.com>
References: <e170edc2-e5b9-4c8b-4ed3-7e2d7a2850dc@I-love.SAKURA.ne.jp>
 <877czv2ov8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877czv2ov8.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 12:08:27PM +0200, Jani Nikula wrote:
> On Sun, 06 Nov 2022, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> > Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> > macro") says, flush_scheduled_work() is dangerous and will be forbidden.
> > We are on the way for removing all flush_scheduled_work() callers from
> > the kernel, and there are only 4 callers remaining as of linux-20221104.
> >
> >   drivers/gpu/drm/i915/display/intel_display.c:8997:      flush_scheduled_work();
> 
> Thanks for the reminder, I've pinged folks to get someone working on
> this. We do schedule quite a bunch of work, so it's not immediately
> obvious (at least to me) what exactly needs flushing.

Here's my earlier cursory analysis of the subject:
https://lore.kernel.org/intel-gfx/Yy3byxFrfAfQL9xK@intel.com/

> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/7546
> 
> >   drivers/gpu/drm/i915/gt/selftest_execlists.c:88:        flush_scheduled_work();
> 
> Removed by commit 7d33fd02dd94 ("drm/i915/selftests: Remove
> flush_scheduled_work() from live_execlists") in drm-next.
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
