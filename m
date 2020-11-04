Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA72A5B00
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 01:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FF76E91E;
	Wed,  4 Nov 2020 00:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B431C6E91C;
 Wed,  4 Nov 2020 00:23:45 +0000 (UTC)
IronPort-SDR: p4/ovvuhyWCppEWw+TAAeh1wljK/MF+ktTCqa5Mgo9t6qNsB//PsPzFhliO5XARlRoZ1YYAgoQ
 oBbCJ9jjpeKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156920786"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="156920786"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 16:23:44 -0800
IronPort-SDR: Jff7IlV79j1jQMkLh8k4p93F+1d+yFxSliiIUcZ8FDi862LIN4rimgC7/+CQJyDIYYqiuOhgqh
 lYdPC5Llv4yA==
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="538691531"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 16:23:44 -0800
Date: Tue, 3 Nov 2020 19:25:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20201104002508.GG30349@intel.com>
References: <20201104093705.10b43959@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104093705.10b43959@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 09:37:05AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/i915/gt/intel_lrc.c: In function 'gen12_emit_fini_breadcrumb':
> drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: error: implicit declaration of function '__gen8_emit_flush_dw'; did you mean 'gen8_emit_flush'? [-Werror=implicit-function-declaration]
>  4998 |  cs = emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
>       |                               ^~~~~~~~~~~~~~~~~~~~
>       |                               gen8_emit_flush
> drivers/gpu/drm/i915/gt/intel_lrc.c:4998:31: warning: passing argument 2 of 'emit_xcs_breadcrumb' makes pointer from integer without a cast [-Wint-conversion]
>  4998 |  cs = emit_xcs_breadcrumb(rq, __gen8_emit_flush_dw(cs, 0, 0, 0));
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                               |
>       |                               int
> drivers/gpu/drm/i915/gt/intel_lrc.c:4902:63: note: expected 'u32 *' {aka 'unsigned int *'} but argument is of type 'int'
>  4902 | static u32 *emit_xcs_breadcrumb(struct i915_request *rq, u32 *cs)
>       |                                                          ~~~~~^~
> 
> Caused by commit
> 
>   c94d65d2ff6d ("drm/i915/gt: Flush xcs before tgl breadcrumbs")
> 
> I have reverted that commit for today.

Sorry for the trouble. Dependency picked to drm-intel-fixes now.

Thanks for reporting,
Rodrigo.

> 
> -- 
> Cheers,
> Stephen Rothwell



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
