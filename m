Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846D377F40
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DC889FC0;
	Mon, 10 May 2021 09:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4C789FC0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:20:09 +0000 (UTC)
IronPort-SDR: YdF6juSU8Jwhgaqg8pkK0UoZlmZhLPffzj7tKjrjOfibHBAAbaPGP1721CVgUpBIlo6H4uUHsk
 P9+Y66IzM6OQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="196055661"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="196055661"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 02:20:05 -0700
IronPort-SDR: gcVciB9UplP1AQO1EwhP/KB2ZzQkYemqLuaTfs4Nk7sw2sRx7oIppYONZd5aF8K6+OTNHsrXEX
 h6VGGEgc+ZOQ==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="436061399"
Received: from solender-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 02:20:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: New warnings with gcc-11
In-Reply-To: <CAHk-=whJsh4FOcMQ+eDx=f4joa-CCH1pmYtrsw0H7L0HV_GhJg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyKdGHyiRLDooKrMf=02GtNn8U4YfF4dJtXdabnVAGdXQ@mail.gmail.com>
 <CAHk-=whOOVBBuQceJ9D9uZrv-QOUWGMQ4aZe2K+2X24o7xA8cg@mail.gmail.com>
 <87bl9y50ok.fsf@intel.com>
 <CAHk-=whJsh4FOcMQ+eDx=f4joa-CCH1pmYtrsw0H7L0HV_GhJg@mail.gmail.com>
Date: Mon, 10 May 2021 12:20:01 +0300
Message-ID: <874kfbvtby.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 08 May 2021, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> I have heard nothing about this, and it remains the only warning from
> my allmodconfig build (I have another one for drm compiled with clang,
> but there I at least heard back that a fix exists).
>
> Since I am going to release rc1 tomorrow, and I don't want to release
> it with an ugly compiler warning, I took it upon myself to just fix
> the code:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dfec4d42724a1bf3dcba52307e55375fdb967b852
>
> HOWEVER.
>
> That commit fixes the warning, and is at worst harmless. At best it
> fixes an access to random stack memory. But it does smell like
> somebody who actually knows how these arrays work should look at that
> code.
>
> IOW, maybe the code should actually have read 16 bytes from the Event
> Status Indicator? Maybe offset 10 was wrong? Maybe
> drm_dp_channel_eq_ok() should never have taken six bytes to begin
> with?
>
> It's a mystery, and I haven't heard anything otherwise, so there it is.

Fair enough. My bad for not getting this fixed.

The fix is harmless. drm_dp_channel_eq_ok() only ever accesses 3 bytes
instead of 6. I figure the DP_LINK_STATUS_SIZE (=3D6) is there because in
the normal case you'd read that much, and use a family of functions on
that data, some of which do access the full 6 bytes, some don't.

In our case, we use drm_dp_channel_eq_ok() to check 3 bytes of similarly
encoded data elsewhere in the DPCD address space, and the
DP_LINK_STATUS_SIZE is meaningless there.

The straightforward fix would be to replace
link_status[DP_LINK_STATUS_SIZE] with link_status[3], and that likely
needs changes in dp_link_status() and dp_get_lane_status() as well.


BR,
Jani.


>
>               Linus
>
> On Wed, Apr 28, 2021 at 12:27 AM Jani Nikula <jani.nikula@intel.com> wrot=
e:
>>
>> On Tue, 27 Apr 2021, Linus Torvalds <torvalds@linux-foundation.org> wrot=
e:
>> > I've updated to Fedora 34 on one of my machines, and it causes a lot
>> > of i915 warnings like
>> >
>> >   drivers/gpu/drm/i915/intel_pm.c: In function =E2=80=98ilk_setup_wm_l=
atency=E2=80=99:
>> >   drivers/gpu/drm/i915/intel_pm.c:3059:9: note: referencing argument 3
>> > of type =E2=80=98const u16 *=E2=80=99 {aka =E2=80=98const short unsign=
ed int *=E2=80=99}
>> >   drivers/gpu/drm/i915/intel_pm.c:2994:13: note: in a call to function
>> > =E2=80=98intel_print_wm_latency=E2=80=99
>> >
>> > and the reason is that gcc now seems to look at the argument array
>> > size more, and notices that
>>
>> Arnd Bergmann reported some of these a while back. I think we have some
>> of them fixed in our -next already, but not all. Thanks for the
>> reminder.

--=20
Jani Nikula, Intel Open Source Graphics Center
