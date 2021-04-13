Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5235E47D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 18:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4A96E81F;
	Tue, 13 Apr 2021 16:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC046E81F;
 Tue, 13 Apr 2021 16:59:45 +0000 (UTC)
IronPort-SDR: 8ZGdGym+Rj4x6VLZuKqQBgwSJTT06zyoAWV/aU4dNn1/CJovN0f2evPJh0+Xfh8/pR8IkLHTBr
 sR3lySrZl7Dg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181582333"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="181582333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 09:59:41 -0700
IronPort-SDR: b9JQnHmyNK9H0SxG2ldlD6mtXXg/Cwe1SH7FDueh3LgvnB1ET5V2880Yxkm6i8xK9N1XD7izze
 ToJ8S6k9gT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424337626"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 13 Apr 2021 09:59:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Apr 2021 19:59:34 +0300
Date: Tue, 13 Apr 2021 19:59:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <YHXN9lqtdvisT8gn@intel.com>
References: <20210413170240.0d4ffa38@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413170240.0d4ffa38@xhacker.debian>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 05:02:40PM +0800, Jisheng Zhang wrote:
> I met below error during boot with i915 builtin if pass
> "i915.mitigations=3Doff":
> [    0.015589] Booting kernel: `off' invalid for parameter `i915.mitigati=
ons'
> =

> The reason is slab subsystem isn't ready at that time, so kstrdup()
> returns NULL. Fix this issue by using stack var instead of kstrdup().
> =

> Fixes: 984cadea032b ("drm/i915: Allow the sysadmin to override security m=
itigations")
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>  drivers/gpu/drm/i915/i915_mitigations.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i9=
15/i915_mitigations.c
> index 84f12598d145..7dadf41064e0 100644
> --- a/drivers/gpu/drm/i915/i915_mitigations.c
> +++ b/drivers/gpu/drm/i915/i915_mitigations.c
> @@ -29,15 +29,13 @@ bool i915_mitigate_clear_residuals(void)
>  static int mitigations_set(const char *val, const struct kernel_param *k=
p)
>  {
>  	unsigned long new =3D ~0UL;
> -	char *str, *sep, *tok;
> +	char str[64], *sep, *tok;
>  	bool first =3D true;
>  	int err =3D 0;
>  =

>  	BUILD_BUG_ON(ARRAY_SIZE(names) >=3D BITS_PER_TYPE(mitigations));
>  =

> -	str =3D kstrdup(val, GFP_KERNEL);
> -	if (!str)
> -		return -ENOMEM;
> +	strncpy(str, val, sizeof(str) - 1);

I don't think strncpy() guarantees that the string is properly
terminated.

Also commit b1b6bed3b503 ("usb: core: fix quirks_param_set() writing to
a const pointer") looks broken as well given your findings, and
arch/um/drivers/virtio_uml.c seems to suffer from this as well.
kernel/params.c itself seems to have some slab_is_available() magic
around kmalloc().

I used the following cocci snippet to find these:
@find@
identifier O, F;
position PS;
@@
struct kernel_param_ops O =3D {
...,
        .set =3D F@PS
,...
};

@alloc@
identifier ALLOC =3D~ "^k.*(alloc|dup)";
identifier find.F;
position PA;
@@
F(...) {
<+...
ALLOC@PA(...)
...+>
}

@script:python depends on alloc@
ps << find.PS;
pa << alloc.PA;
@@
coccilib.report.print_report(ps[0], "struct")
coccilib.report.print_report(pa[0], "alloc")

That could of course miss a bunch more if they allocate
via some other function I didn't consider.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
