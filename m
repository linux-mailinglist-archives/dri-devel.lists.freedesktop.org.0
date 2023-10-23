Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93027D349E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 13:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EDF10E1BA;
	Mon, 23 Oct 2023 11:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AFC10E137
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698061226; x=1729597226;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=iXJBC1Wjmu0IdEY4IOWBnhoMmiEBZwTrT4Q3ArWCwe8=;
 b=G9YOu8BPaOvSFI/pf+3Eunm2QnaSt7rFDU/IM+Fb4gmTsdvSoxYNopgo
 TXbJpYgD9crUSLiJ7OfQ1kDR6ehnbKZ9fSU9gBYd5/HjKzVJvj8PlQF+y
 nD9u6Eez9OPl+3AoJ94sdhrY3qEszC6YdazV0o39jHdDsSUcM9oe3GLR9
 vfloDQW946of6KIARLPCJDKGZYu57uLpx1d3besi4fZ224S1PPh4f4Dp1
 uwHTCYEVYdsxciUe8vyZg7StT4TOE2WgHbL3dkr2HTc9aZLEylIqqCSEY
 xSZW94U1qdnkCzMyMGq04APTD7qyGVGThsCKYjFuNO9Gzc/9ymBpZ8CUA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="473034127"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="473034127"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 04:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734639430"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="734639430"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 04:40:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
In-Reply-To: <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
Date: Mon, 23 Oct 2023 14:40:18 +0300
Message-ID: <87sf61bm8t.fsf@intel.com>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Oct 2023, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Oct 13, 2023 at 9:56=E2=80=AFPM Pavel Machek <pavel@ucw.cz> wrote:
>>
>> So... a bit of rationale. The keyboard does not really fit into the
>> LED subsystem; LEDs are expected to be independent ("hdd led") and not
>> a matrix of them.
>
> Makes sense.
>
>> We do see various strange displays these days -- they commonly have
>> rounded corners and holes in them. I'm not sure how that's currently
>> supported, but I believe it is reasonable to view keyboard as a
>> display with slightly weird placing of pixels.
>>
>> Plus, I'd really like to play tetris on one of those :-).
>>
>> So, would presenting them as auxdisplay be acceptable? Or are there
>> better options?
>
> It sounds like a fair use case -- auxdisplay are typically simple
> character-based or small graphical displays, e.g. 128x64, that may not
> be a "main" / usual screen as typically understood, but the concept is
> a bit fuzzy and we are a bit of a catch-all.
>
> And "keyboard backlight display with a pixel/color per-key" does not
> sound like a "main" screen, and having some cute effects displayed
> there are the kind of thing that one could do in the usual small
> graphical ones too. :)
>
> But if somebody prefers to create new categories (or subcategories
> within auxdisplay) to hold these, that could be nice too (in the
> latter case, I would perhaps suggest reorganizing all of the existing
> ones while at it).

One could also reasonably make the argument that controlling the
individual keyboard key backlights should be part of the input
subsystem. It's not a display per se. (Unless you actually have small
displays on the keycaps, and I think that's a thing too.)

There's force feedback, there could be light feedback? There's also
drivers/input/input-leds.c for the keycaps that have leds, like caps
lock, num lock, etc.

Anyway, just throwing ideas around, no strong opinions, really.


BR,
Jani.


--=20
Jani Nikula, Intel
