Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63B700F75
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 21:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5331B10E2A6;
	Fri, 12 May 2023 19:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2488B10E2A6;
 Fri, 12 May 2023 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683921285; x=1715457285;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=42l0w6A0sLXQHwqgTZjORD9VAgWRT1QeiSd6JXsne70=;
 b=No2ydlHGzUvHzn1lcWmj5ixqiSltv0Tyo5Ub+aOZ7Jqg7WEmOKw5PaRw
 MgPb3T7fnAhZ0oEJy+hLO6wwMIVt7l2cPPVcDkCjoxizGt5aVLjvMfzi0
 VWGykCItem4TNWtWmnMmZE/v1QHzvw+MpENpl6yO2wC2Q8NoxUx9Q4c/V
 M+hhk/AojmDLQv5F/VoGJewLBjB2LsddXEtDFvl836KqZ2+mR93iPPwlH
 a9ZVnon+xXYWsswM32SuTHOFlRoOGhznjnSkzdzKVTCDQjbaC7AOjWIjI
 lvmtdwfRjxpDTAOq+Xb2h4VQ8QB9v5n3ubk+Z7mMljVmUuPUKDwGRTRZJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348366242"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="348366242"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 12:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650755690"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="650755690"
Received: from pnordeen-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.139.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 12:54:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZFwXOPV9eY0mCSyz@ashyti-mobl2.lan>
References: <20230509165942.2155-1-fei.yang@intel.com>
 <20230509165942.2155-5-fei.yang@intel.com>
 <ZFwXOPV9eY0mCSyz@ashyti-mobl2.lan>
Subject: Re: [PATCH v7 4/4] drm/i915: Allow user to set cache at BO creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
Date: Fri, 12 May 2023 12:54:33 -0700
Message-ID: <168392127300.1245490.15218496130423132985@jljusten-skl>
User-Agent: alot/0.10
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
 Arkadiusz Hiler <arek@hiler.eu>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-10 15:14:16, Andi Shyti wrote:
> Hi,
>=20
> On Tue, May 09, 2023 at 09:59:42AM -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> >=20
> > To comply with the design that buffer objects shall have immutable
> > cache setting through out their life cycle, {set, get}_caching ioctl's
> > are no longer supported from MTL onward. With that change caching
> > policy can only be set at object creation time. The current code
> > applies a default (platform dependent) cache setting for all objects.
> > However this is not optimal for performance tuning. The patch extends
> > the existing gem_create uAPI to let user set PAT index for the object
> > at creation time.
> > The new extension is platform independent, so UMD's can switch to using
> > this extension for older platforms as well, while {set, get}_caching are
> > still supported on these legacy paltforms for compatibility reason.
> >=20
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> just for a matter of completeness, this is new uapi is tested
> through the "create-ext-set-pat" test case from the "gem_create"
> igt test[1]. Can any of the igt maintainers give it a look,
> comment and ack?
>=20
> The mesa merge request is here [2]. As there is a merge request
> in progress, would anyone from mesa be so kind to give an ack to
> this patch, as well?
>=20
> With the mesa ack in place this patch should be ready to go and
> I'm looking forward to having it in.

I tested my MR [2] in our CI. There was some bad news, but I don't
think it needs to block these patches.

The good news was that I found that OpenGL testing with our iris
driver appeared to have ok results when using this interface.

But, our Vulkan Anvil driver was not stable with the current patches
in the Mesa MR. We will need to debug this further before using the
interface on Vulkan.

I don't suspect that this is an issue with the kernel interface, so
you can add:

Tested-by: Jordan Justen <jordan.l.justen@intel.com>

-Jordan

>=20
> Thanks,
> Andi
>=20
> [1] https://patchwork.freedesktop.org/patch/534955/?series=3D117185&rev=
=3D1
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
>
