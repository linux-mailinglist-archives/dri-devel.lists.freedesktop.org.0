Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE86A59EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 14:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8D210E6AB;
	Tue, 28 Feb 2023 13:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E710E6AB;
 Tue, 28 Feb 2023 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677590584; x=1709126584;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p6OLPYVQC2+xRGYvXaVikQE1uKCCG9JBxl3CfNIUEJ8=;
 b=Yhf15NkRLiIw1lapqaDeYlddUxFSU9EXrStxNr6EhU69MUuspqUYq5tO
 CMpae0lcRgkLNX0z3wr1WhBzhrBVpyj7Iw2Je6HfiM86FYoz/hZGcGZFr
 OHR+oAN8UeEVa+4m2OKdkqvgUnO2k0h4IIsuWleARITaqYk5n3mjBHF2a
 HRkS+t3T0Uv4FEU2dRzhnV5ffk/vI3EsAFp3p23YPjUXiG/dQ+wDDByed
 tVdhq4F42yGkPRt7V6vHHJMCR0AG43g627KDaIPV2qm4OXh3uwPIb4Hff
 59XQtAi/MOIBzo2WcpjKOKdkHhuwtS1XpPLyj6t7Go/zx5sH1AhX3B/1X A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332859099"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="332859099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 05:23:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="817075360"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="817075360"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.82])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 05:22:59 -0800
Date: Tue, 28 Feb 2023 14:22:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
Message-ID: <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan>
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Asahi Lina <lina@asahilina.net>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, Feb 28, 2023 at 04:15:28PM +0300, Dmitry Osipenko wrote:
> Hi,
> 
> On 2/28/23 15:50, Andi Shyti wrote:
> > Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
> > lock") removes the drm_gem_shmem_get_pages_locked() and
> > drm_gem_shmem_put_pages_locked().
> > 
> > But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
> > drm_gem_shmem_get_pages_sgt()") reintroduces it.
> > 
> > Somehow these two commits got mixed up and produce the following
> > compile error:
> 
> The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a bad
> merge conflict resolution in drm-tip that was fixed yesterday, there is
> no problem in misc-next. Where do you see this error?

yes, indeed! I was indeed surprised to see this mismatch.

I see it in the Intel's drm-tip branch[*]

Cc'ing the Intel's mailing list and maintainers, as well.

Tnanks,
Andi

[*] git.freedesktop.org/git/drm-tip
