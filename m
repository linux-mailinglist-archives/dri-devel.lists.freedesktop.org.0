Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF26C3140
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035AE10E1C9;
	Tue, 21 Mar 2023 12:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B358910E1C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679400508; x=1710936508;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HrHcuwnczyG0iiuYs2h9nSsX/vgqQn/Fgwihe2DYf70=;
 b=B274F0srQl78LpzhjUYAv1wx9yFev2h1v3XUfQzGHwt7R3K0vf3nZZYO
 GN7bz7uPWk98zHEFmh8ZndFN6W3mDySiRr1MMkpyYsloHH2PDM4oClZGA
 8Ym+gS0taMUorNc6naEQw2NGHwBTsckMrf07zIOE8/Mo242Ok8Of1lNs/
 rF3NG8mdo5oq+W4/U7jP5tsl6tlxcqOzQD1plqirJToBYT1yqetmq4iYY
 6FvtTd/dmWgLx/CJv64kgf/RQyvfPOo6AM9LBgsM1qgStaKtEK3cPuaFZ
 IujtfrIuvCvmizVvVwbEpABKWONXtzUrek6Pc6ZoVaR3GMcugEJIeEpRY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401491061"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="401491061"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750528367"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="750528367"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:07:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: display band (display area vs real visible area)
In-Reply-To: <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
 <87cz528hzk.fsf@intel.com>
 <CAPj87rPPA9oYkZyQ=Y3MRuyJUN71WHDWHpdaRUvuXAxFSLW5SA@mail.gmail.com>
Date: Tue, 21 Mar 2023 14:07:43 +0200
Message-ID: <87355y8fzk.fsf@intel.com>
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023, Daniel Stone <daniel@fooishbar.org> wrote:
> Hi,
>
> On Tue, 21 Mar 2023 at 11:24, Jani Nikula <jani.nikula@linux.intel.com> w=
rote:
>> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolutio=
ns.com> wrote:
>> > On Tue, Mar 21, 2023 at 11:43=E2=80=AFAM Jani Nikula
>> > <jani.nikula@linux.intel.com> wrote:
>> >> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolu=
tions.com> wrote:
>> >> > I would like to know the best approach in the graphics subsystem how
>> >> > deal with panels where the display area is different from the visib=
le
>> >> > area because the display has a band left and right. I have already
>> >> > done the drm driver for the panel but from userspace point of view
>> >> > it's a pain to deal in wayland for input device and output device. =
Do
>> >> > you have any suggestions?
>> >>
>> >> Do you have the EDID for the panel?
>> >
>> > mipi->panel so should not have edid
>>
>> That's the kind of information you'd expect in the original question. ;)
>>
>> I've done that sort of thing in the past, but not sure if it would fly
>> upstream. Basically the kernel driver would lie about the resolution to
>> userspace, and handle the centering and the bands internally. In my
>> case, the DSI command mode panel in question had commands to set the
>> visible area, so the driver didn't have to do all that much extra to
>> make it happen.
>
> There have been some threads - mostly motivated by MacBooks and the
> Asahi team - about creating a KMS property to express invisible areas.
> This would be the same thing, and the userspace ecosystem will pick it
> up when the kernel exposes it.

In my case the kernel handled it completely internally, and the
userspace didn't even know. But I guess it depends on the display being
able to take a smaller framebuffer, otherwise I don't think it's
feasible.

I haven't checked the threads you mention but I assume it covers the
more general case of having rounded corners or holes for the camera, not
just the frame covering the edges or something like that. That couldn't
possibly be handled by kernel alone, but it's also a bunch of
infrastructure work both in kernel and userspace to make it happen.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
