Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B616C304F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 12:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBC210E08B;
	Tue, 21 Mar 2023 11:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C16910E08B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679397887; x=1710933887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7I3apq4ODQSdsh261kCLGedqNksk/D6m+fbYeatenSI=;
 b=mfSL2JfiVaJZcu3OfWmOr8HZXMhzA0qUyECO30h4uuAvWMkGKTcrHZk4
 P57xVKszAk3uSd7Ty3hvZAgR0gs1nSM9wZmzY5QeKLWoOM0luJW/3t8T2
 pMKV/1Azwk4nKshgJh0UubMaNznQkNlgMlKPeB050fOcnL+iGiNDNwxoy
 kjo7WhdBMszvZ9e7W4+eD7qoPRAAwyl4BnhGs2fF5F9ppWixTR4qlkdb6
 GJlQSsnetizltOq8S5Pqs7T6w8DsvXQ9oUP4tCrsS7ObP+w2nsBCw4jZD
 n0i3J+QSh1be/yOqkzuiRVYlfNsBBpdivUZQ7ZTzkgqY6OSxj3oQSsllE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="425186563"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="425186563"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="792041572"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="792041572"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 04:24:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: display band (display area vs real visible area)
In-Reply-To: <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAOf5uwkDb=pkEV_qSshA7PnSxCV82sEwrmivAZhth48ae0S++g@mail.gmail.com>
 <87ileu8jwh.fsf@intel.com>
 <CAOf5uw=g1mU1F=kD6M472LRaTWa2B=Sry4GDGXxDApoZknLfeA@mail.gmail.com>
Date: Tue, 21 Mar 2023 13:24:31 +0200
Message-ID: <87cz528hzk.fsf@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolutions.=
com> wrote:
> Hi
>
> On Tue, Mar 21, 2023 at 11:43=E2=80=AFAM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
>>
>> On Tue, 21 Mar 2023, Michael Nazzareno Trimarchi <michael@amarulasolutio=
ns.com> wrote:
>> > Hi all
>> >
>> > I would like to know the best approach in the graphics subsystem how
>> > deal with panels where the display area is different from the visible
>> > area because the display has a band left and right. I have already
>> > done the drm driver for the panel but from userspace point of view
>> > it's a pain to deal in wayland for input device and output device. Do
>> > you have any suggestions?
>>
>> Do you have the EDID for the panel?
>
> mipi->panel so should not have edid

That's the kind of information you'd expect in the original question. ;)

I've done that sort of thing in the past, but not sure if it would fly
upstream. Basically the kernel driver would lie about the resolution to
userspace, and handle the centering and the bands internally. In my
case, the DSI command mode panel in question had commands to set the
visible area, so the driver didn't have to do all that much extra to
make it happen.

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
