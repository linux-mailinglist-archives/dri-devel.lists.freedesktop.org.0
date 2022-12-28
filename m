Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E0657453
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 09:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBF510E1AF;
	Wed, 28 Dec 2022 08:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAEB10E16D;
 Wed, 28 Dec 2022 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672217423; x=1703753423;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VQip/Z99parCgodreX+wts8zbKulSZQgR4ewC+MO0lI=;
 b=iZ7SbWwVlo4mJtRgSbFT5PS2ifdoyJRdzDrIioJLVS9q5sNO0FczNegE
 OcMguKVdkChL09q3buBr/f2lYLhrcXXC+RZpXjegrB8yJpTr61RXYAT4X
 jk8jz7O6Bc3Z7krw7AV/SHZiFnVN4UrGs9gVkgeFFyGujwZ9CMOJEkueu
 KSPFfcNsSncU6EVB/SM7SWOVOagmTK+ntsSlhd9jKIm8gwEyy+U+ZB1wa
 PIui1t7ZdhZoGbG76zQ2/w2BMAHe5i7Ar6qV2TbiYTnpHdsXOoxqAoMuP
 MIaDA4ULW7yc/CRoCKuxLiuuQOkPT7LR7c6lvxnSvRt4iPWpVzYg+yZnR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="322815665"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="322815665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 00:50:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="655251298"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="655251298"
Received: from kvkhairn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.23.135])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 00:50:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alexey Lukyachuk <skif@skif-web.ru>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: dell wyse 3040 shutdown fix
In-Reply-To: <20221227204003.6b0abe65@alexey-Swift-SF314-42>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221225184413.146916-1-skif@skif-web.ru>
 <20221225185507.149677-1-skif@skif-web.ru> <Y6sfvUJmrb73AeJh@intel.com>
 <20221227204003.6b0abe65@alexey-Swift-SF314-42>
Date: Wed, 28 Dec 2022 10:50:15 +0200
Message-ID: <875ydv29q0.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Dec 2022, Alexey Lukyachuk <skif@skif-web.ru> wrote:
> On Tue, 27 Dec 2022 11:39:25 -0500
> Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
>> On Sun, Dec 25, 2022 at 09:55:08PM +0300, Alexey Lukyanchuk wrote:
>> > dell wyse 3040 doesn't peform poweroff properly, but instead remains i=
n=20
>> > turned power on state.
>>=20
>> okay, the motivation is explained in the commit msg..
>>=20
>> > Additional mutex_lock and=20
>> > intel_crtc_wait_for_next_vblank=20
>> > feature 6.2 kernel resolve this trouble.
>>=20
>> but this why is not very clear... seems that by magic it was found,
>> without explaining what race we are really protecting here.
>>=20
>> but even worse is:
>> what about those many random vblank waits in the code? what's the
>> reasoning?
>>=20
> I would like to say, that this solution was found in drm-tip repository:
> link: git://anongit.freedesktop.org/drm-tip
> I will quotate original commit message from Ville Syrj=C3=A4l=C3=A4=20
> <ville.syrjala@linux.intel.com>: "The spec tells us to do a bunch of=20
> vblank waits in the audio enable/disable sequences. Make it so."
> So it's just a backport of accepted patch.
> Which i wanna to propagate to stable versions

This is not how stable kernel backports work. Please read [1].

Does v6.2-rc1 work for you? It has all the relevant commits. Which
stable kernel are you trying to backport them to?

Though I must say I find it surprising that these changes would fix a
poweroff issue, and it certainly was not the goal. I'm wondering if it's
just a coincidence due to timing and/or locking changes.

Have you reported an issue at fdo gitlab [2]?


BR,
Jani.



[1] https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
[2] https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs


--=20
Jani Nikula, Intel Open Source Graphics Center
