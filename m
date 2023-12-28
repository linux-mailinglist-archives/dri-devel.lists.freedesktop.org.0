Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B736F81F6F1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 11:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B310910E136;
	Thu, 28 Dec 2023 10:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB18210E090;
 Thu, 28 Dec 2023 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703759944; x=1735295944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zvpgv8FrB8t0BK9QeQFVK5ibO9rx+qu8P9LcRuNqpyk=;
 b=nyKC7dqAVNzhyBs/ZXr5BcpVsFx96T95G6cAElXaiA1e0mibR8p9v0yM
 d+ORhLuiSQTmBZvzIy1QIbI05tiL5/fcJY0NM770APGlLS52TB15GlekG
 bqDNXD2piFIj0zWo8W4OrKV6Ti38Tr4fB2v0McTLM0DIAgnmjEmFLQZTB
 jqchvDNFA+IbOxVzzQhFbY3/E3jCdUZIw00yAzVOw03V9E5DnvYrJkZIw
 KgwSzkjukFQ9eltfAMyhsXoIJTAz2Ce5zoN8DZ6H6shuwhL/i/fzZKUvp
 FBZmxC6oQeghyFfwDym8TVI1wBfJ7UGDUhyumTRP1+RkZSYmDYqy1NSJF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="376022807"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="376022807"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 02:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="951771060"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="951771060"
Received: from mrusu1x-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.210.145])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 02:38:59 -0800
Date: Thu, 28 Dec 2023 11:38:55 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gt: Support fixed CCS mode
Message-ID: <ZY1PaQKYjWZ8Gsm2@ashyti-mobl2.lan>
References: <20231221170825.356970-1-andi.shyti@linux.intel.com>
 <20231221170825.356970-2-andi.shyti@linux.intel.com>
 <170325187487.40079.14463953486335186680@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170325187487.40079.14463953486335186680@jlahtine-mobl.ger.corp.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joonas,

> > +       /*
> > +        * Track fixed mapping between CCS engines and compute slices.
> > +        *
> > +        * In order to w/a HW that has the inability to dynamically load
> > +        * balance between CCS engines and EU in the compute slices, we have to
> > +        * reconfigure a static mapping on the fly. We track the current CCS
> > +        * configuration (determined by inspection of the user's engine
> > +        * selection during execbuf) and compare it against the current
> > +        * CCS_MODE (which maps CCS engines to compute slices).  If there is
> > +        * only a single engine selected, we can map it to all available
> > +        * compute slices for maximal single task performance (fast/narrow). If
> > +        * there are more then one engine selected, we have to reduce the
> > +        * number of slices allocated to each engine (wide/slow), fairly
> > +        * distributing the EU between the equivalent engines.
> > +        */
> 
> This comment is outdated as we don't consider execbuf but the sysfs
> configuration.

yes, I removed some parts of the original comment already, but
yes, I agree it can be improved.

Thanks,
Andi
