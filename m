Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62F78D593
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C310E4FC;
	Wed, 30 Aug 2023 11:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F7A10E4FC;
 Wed, 30 Aug 2023 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693395351; x=1724931351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3ZazSER22rib2B9TYZzPIsIlIRyHDfzHJ5qdZQmJFY=;
 b=bJOZV0m7JCPC3uHmYz4vUDydrBnZMZ7fJGSIIOVQ09Z3LBWhRlfsIdO0
 1JHIxA1esCXJAdTQsuKvydhe4rJ2G1ij/ho0aEVdj3+9DllTmdutECBIX
 QJAgWWVBn7rodpuDlj6UuQW7sTe1xSDRHTWSMu4FM2e73N/e3KOIOAfn9
 LoihQCKWkLn6iHpvzVrVncMneddjuIPufinwF71OKhADZuF7dMKmTuBGb
 3853J+rB1ZYx9fsqPsUeW7NeJ4TIPylR/bnHaQ524kfypWiHZhjZfmsvT
 yPTK/I3E4R92/zgVNyPM3dnMTMfjiYf3FU/L8sgv0+u5RhzhXfkDcZqM2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441981273"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="441981273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732585103"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="732585103"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.15.207])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:35:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: David Gow <davidgow@google.com>
Subject: Re: [RFC PATCH] kunit: Fix test log size limit too low for some tests
Date: Wed, 30 Aug 2023 13:35:45 +0200
Message-ID: <4506938.LvFx2qVVIh@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CABVgOSmZ56p8BBFHNXqigNrH95O_YjMZxfpbhWcZJFrSMS3CDA@mail.gmail.com>
References: <20230830075419.26484-2-janusz.krzysztofik@linux.intel.com>
 <CABVgOSmZ56p8BBFHNXqigNrH95O_YjMZxfpbhWcZJFrSMS3CDA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 30 August 2023 11:23:43 CEST David Gow wrote:
> On Wed, 30 Aug 2023 at 15:55, Janusz Krzysztofik
> <janusz.krzysztofik@linux.intel.com> wrote:
> >
> > Now we have memory space available to a kunit test case log exposed via
> > debugfs limited to 2048 bytes, while some parametrized test cases, e.g.,
> > drm_framebuffer.drm_test_framebuffer_create, need more.  For this reason,
> > debugfs results from affected test cases get truncated silently, and
> > external tools that rely on parsing of debugfs results can fail.
> >
> > Increase kunit test case log size limit to 4096 bytes.
> >
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> 
> There's a patch series we're hoping to take for 6.7 which allows the
> log to grow to fit whatever's written into it, which should make this
> patch obsolete:
> https://lore.kernel.org/linux-kselftest/20230828104111.2394344-1-rf@opensource.cirrus.com/T/
> 
> Would that work for you?

Yeah, that's going to work perfectly for us, thank you.

Janusz

> 
> -- David
> 
> >  include/kunit/test.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index d33114097d0d0..d20eb1884edfa 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -34,7 +34,7 @@ DECLARE_STATIC_KEY_FALSE(kunit_running);
> >  struct kunit;
> >
> >  /* Size of log associated with test. */
> > -#define KUNIT_LOG_SIZE 2048
> > +#define KUNIT_LOG_SIZE 4096
> >
> >  /* Maximum size of parameter description string. */
> >  #define KUNIT_PARAM_DESC_SIZE 128
> > --
> > 2.41.0
> >
> 




