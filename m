Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9F70C252
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59A10E35B;
	Mon, 22 May 2023 15:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BA210E35A;
 Mon, 22 May 2023 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684769136; x=1716305136;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=bpgFgKuYbsHrhrdrffTR96osOjma99xLp0ZCFcOyjsU=;
 b=LzwHwkyOiLYdz0lXfcgtctudxA+gEk0QPGmh12IkPmx4PD/3UD+YWfCP
 e0gXkVHtH5MhLTcNCxHteGkPzdeO33L4RgTu0y1HBojGd1c40b831gDS4
 D9jJO+bDD+JjR360wuI1nIY4Kx8di9j0KKOeIci19x0u3FpRP+GiMUi6L
 YplatvN0xeKqL9KTGeF3hOTwtG22anbXRfW/Qt3Qp3ONg0AdsJD2VCrtO
 ZvfGiNhP8LlSD2FT0WjXGq0EArnMriNTZgWFazrGfejvUu2wYHQ5WoIjx
 AfQIUVjcb19DPEelRoXDKozfLWSiz3YO1TRk/SOk6sUhsflleo7UzqdVx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="381183548"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381183548"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 08:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="877796880"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="877796880"
Received: from pbujose-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.203.127])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 08:25:34 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZGtXmBh42oLIxcyi@ashyti-mobl2.lan>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <20230519051103.3404990-3-fei.yang@intel.com>
 <ZGtXmBh42oLIxcyi@ashyti-mobl2.lan>
Subject: Re: [PATCH v10 2/2] drm/i915: Allow user to set cache at BO creation
From: Jordan Justen <jordan.l.justen@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
Date: Mon, 22 May 2023 08:25:33 -0700
Message-ID: <168476913389.1509813.15102550159463496187@jljusten-skl>
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
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 rohan.garg@intel.com, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 04:52:56, Andi Shyti wrote:
> Hi,
>=20
> On Thu, May 18, 2023 at 10:11:03PM -0700, fei.yang@intel.com wrote:
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
> > Test igt@gem_create@create_ext_set_pat posted at
> > https://patchwork.freedesktop.org/series/117695/
> >=20
> > Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2=
2878
> >=20
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>=20
> last call for comments and reviews on this patch. If nothing
> comes I am going to push it tomorrow morning (Europe).
>=20
> There is also a merge request from Mesa pending on this so that I
> don't want to keep it hanging any longer.

No need to wait any longer with regard to feedback from Mesa.

I definitely was hoping for more consideration of the userspace
request, but it's been decisively rejected. My ack was not readily
given, but it stands.

-Jordan
