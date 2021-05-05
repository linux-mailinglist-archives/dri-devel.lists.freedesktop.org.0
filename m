Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC78373D9F
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 16:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2186E4DE;
	Wed,  5 May 2021 14:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89836E4D4;
 Wed,  5 May 2021 14:25:31 +0000 (UTC)
IronPort-SDR: +Gn03ky4Rn/RzWkTMUkhCytMziu1OkrYwgCqeuqmnZTFoGJrMBICDl+VOBwMmxO8WEGk8qMYlM
 ITH6c3sdInww==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178445041"
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="178445041"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 07:25:31 -0700
IronPort-SDR: Vu9Y/FjPFpzwIMMVo/9JeWnMQFWMKLCQgJeBQsYz4XwJuXcsz980SW6E4Wc8V7Vqciph12JG5k
 RJ0udW9PQeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,275,1613462400"; d="scan'208";a="429875942"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 05 May 2021 07:25:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 May 2021 17:25:28 +0300
Date: Wed, 5 May 2021 17:25:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] i915: Increase *_latency array size
Message-ID: <YJKq15HgIWQqFeho@intel.com>
References: <20210505033737.1282652-1-ak@linux.intel.com>
 <87r1ily9k5.fsf@intel.com>
 <20210505141830.GP4032392@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505141830.GP4032392@tassilo.jf.intel.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 Andi Kleen <andi@firstfloor.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 07:18:30AM -0700, Andi Kleen wrote:
> > > Increase all the latency fields to 8 members, which is enough for SKL.
> > >
> > > I don't know if they are correctly initialized upto 8, but dev_priv
> > > should start out as zero, so presumably they will be zero.
> > =

> > Thanks, the warning should be fixed by commit
> > =

> > c6deb5e97ded ("drm/i915/pm: Make the wm parameter of print_wm_latency a=
 pointer")
> > =

> > in drm-intel-next.
> =

> That's just hiding the problem.
> =

> > =

> > There doesn't actually seem to be a bug here,
> =

> Can you explain that please?
> =

> This is the loop in question
> =

>  max_level =3D ilk_wm_max_level(dev_priv);
> =

>         for (level =3D 0; level <=3D max_level; level++) {
>                 unsigned int latency =3D wm[level];
> =

>                 if (latency =3D=3D 0) {
>                         drm_dbg_kms(&dev_priv->drm,
>                                     "%s WM%d latency not provided\n",
>                                     name, level);
>                         continue;
>                 }
> =

> 		...
> 	}
> =

> (no other loop termination condition)
> =

> and ilk_wm_max_level is
> =

> int ilk_wm_max_level(const struct drm_i915_private *dev_priv)
> {
>         /* how many WM levels are we expecting */
>         if (INTEL_GEN(dev_priv) >=3D 9)
>                 return 7;
>         else if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
>                 return 4;
>         else if (INTEL_GEN(dev_priv) >=3D 6)
>                 return 3;
>         else
>                 return 2;
> }
> =

> There is no loop termination in the loop above, it will always read
> every member through the max level reported. And on GEN>=3D9 it will be 7=
, while
> the input array for several of the cases has only 5 members.
> =

> So it will read beyond the array and gcc is correct in complaining.
> =

> What do I miss when you say there is no bug?

We always use dev_priv->wm.skl_latency[] for gen9+. See
{pri,spr,cur}_wm_latency_show(), skl_setup_wm_latency(), etc.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
