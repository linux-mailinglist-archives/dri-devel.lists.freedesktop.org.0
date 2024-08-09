Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC894CE86
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6CB10E8A6;
	Fri,  9 Aug 2024 10:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="basstEx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238110E8A5;
 Fri,  9 Aug 2024 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723198864; x=1754734864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MRiCKmVw2DmotETWL0aG13ClGtDoQfH7PI74ejuxaZg=;
 b=basstEx4RTE2d9n69NyUcn36RIJ6p9Lbsr8JAshjNGyh2kuQCzC73Zy4
 Qjt29nnl1xqu5OQku/2J3ymbx6ujHSwK01vgY0G7chfh8n5juspnztRam
 z/I0qozbYl5D1QnJxcchseOja976RHq+IlZvGcNTBz1mCrZeoHDnIs581
 Tuci7xgF/7UqkZ0J4ZXSB0iIMP+xk32rN/12VhvR9QPhOVUlfFffLEP21
 NVDVOIV9gwaZzOT1QvGTDITVtpvJ+LhQDcysC8E43UcsIhA/lkBqC3gdq
 QCuN4Jsx4VtXfQ1iw6BDRl/pfs1IOoYFSNoWTo9vCddv5RwxNbMhoDnN6 Q==;
X-CSE-ConnectionGUID: M/ArGUgzRPeO03+YMjAapQ==
X-CSE-MsgGUID: 3i3ALLDlT8GucEJaAvP2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25135156"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="25135156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:21:03 -0700
X-CSE-ConnectionGUID: 3KPHK4ccRQye0ave7C9hGQ==
X-CSE-MsgGUID: GO1eurZjSc2s5d+Xxral/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57172849"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.169])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:21:00 -0700
Date: Fri, 9 Aug 2024 11:20:56 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
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

Hi Sima,

On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > This patch series concludes on the memory mapping fixes and
> > improvements by allowing partial memory mapping for the cpu
> > memory as well.
> > 
> > The partial memory mapping by adding an object offset was
> > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > Virtual Memory mapping boundaries calculation") for the gtt
> > memory.
> 
> Does userspace actually care? Do we have a flag or something, so that
> userspace can discover this?
> 
> Adding complexity of any kind is absolute no-go, unless there's a
> userspace need. This also includes the gtt accidental fix.

Actually this missing functionality was initially filed as a bug
by mesa folks. So that this patch was requested by them (Lionel
is Cc'ed).

The tests cases that have been sent previously and I'm going to
send again, are directly taken from mesa use cases.

Thanks,
Andi
