Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DF6073D2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0D110E673;
	Fri, 21 Oct 2022 09:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8F710E534;
 Fri, 21 Oct 2022 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666343906; x=1697879906;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=nVetjXHRfqyVKF1htzqfquwo9eva30/LnRsHGeRwraI=;
 b=h1V89JMANjYL2XQMmYSxMUTH2g3cNVPj6I58cc2nZjBpRv1itAziqdoJ
 Qq1z+Ye/kC7jhd8Z3gsyjbp2SJNCC4vQy1KcXNCchhAw6vR/HjRehjIqO
 D8t00Z+wLtUcUcLbY0SwjdIv96dUkoE+SmYTL/Xkgr5J3F5w+BiSIECcq
 oQxOM76yWXx1cDjchVd+L+nKP6mVTBP1H8JhHUMmH1ROHVCVEM5RlAGtp
 Hzxb70Ju4Iche2wvX4NSXzasY28l4Xxh07MYIlwn2kK4XP2aKZaLvKF1p
 w67hr2z2tNM1mYBGRhfmuXL3KraIwXscQ4Tl2WAXRIi35u7qVfQP8NZCQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="290265067"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="290265067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 02:18:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755707666"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="755707666"
Received: from avilla3-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.53.153])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 02:18:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
In-Reply-To: <Y1Fyuh12g/gt3Izn@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
Date: Fri, 21 Oct 2022 12:18:17 +0300
Message-ID: <87a65pfsbq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
>> > hi Greg, Dan, Jason, DRM-folk,
>> >=20
>> > heres follow-up to V6:
>> >   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
>> >   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
>> >=20
>> > It excludes:
>> >   nouveau parts (immature)
>> >   tracefs parts (I missed --to=3DSteve on v6)
>> >   split _ddebug_site and de-duplicate experiment (way unready)
>> >=20
>> > IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
>> >=20
>> > If these are good to apply, I'll rebase and repost the rest separately.
>>=20
>> All now queued up, thanks.
>
> This stuff broke i915 debugs. When I first load i915 no debug prints are
> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
> the debug prints start to suddenly work.

Wait what? I always assumed the default behaviour would stay the same,
which is usually how we roll. It's a regression in my books. We've got a
CI farm that's not very helpful in terms of dmesg logging right now
because of this.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
