Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EA791593
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 12:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CF010E14A;
	Mon,  4 Sep 2023 10:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3282210E304
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693822587; x=1725358587;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=S/aSjMNDAjpHn3244kVfHhOk5YW4CIBo+j/v3T95cTc=;
 b=L9R4Zvpf36zuMwDi96vOH695xLGj76/qw/XgXCDobCYp4ygTJs0iskoD
 kcHESMh/YmKszVocMCp5vBWtrtZsArCWly14a5xheWJsyA3cjijd2M1eB
 nXZ1srvLw4h3/BTxJYn2npgK5oOmk9ImUOeZ39EGCvd98ey7GLgkK/NfT
 kfFsd2pa9c9mTlpn/nwdRff+uYT6U0ejECyI254W0LYAi3Y7YW9w6FTP5
 uhPRoyjCH43y8HIUtnyEmYuoJv8lJIiGPm/uKQo6uprB6dAoNyKzauR7L
 ivTXk4JxuB1Gg0bU4G4ttSJQ1XhbRBZC33PnRmGs1+BT7micE2WsGbIEJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376499379"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="376499379"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="1071541329"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="1071541329"
Received: from rapetroa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.79])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:04:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Peter Senna Tschudin <peter.senna@gmail.com>
Subject: Re: [RFC] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
In-Reply-To: <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901102400.552254-1-jani.nikula@intel.com>
 <CA+MoWDrtgtT26F-rZ-7s0PtQcTLqB6g1BARkegfZ3qQnhw=3ZQ@mail.gmail.com>
Date: Mon, 04 Sep 2023 13:04:40 +0300
Message-ID: <87fs3ui79j.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Zheyu Ma <zheyuma97@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ian Ray <ian.ray@ge.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 02 Sep 2023, Peter Senna Tschudin <peter.senna@gmail.com> wrote:
> Good morning Jani,
>
> It has been a long time since I wrote the driver, and many many years
> since I sent my last kernel patch, so my memory does not serve me very
> well, but I will try to shed some light.
>
> On Fri, Sep 1, 2023 at 12:24=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> The driver was originally added in commit fcfa0ddc18ed ("drm/bridge:
>> Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)"). I tried to
>> look up the discussion, but didn't find anyone questioning the EDID
>> reading part.
>>
>> Why does it not use drm_get_edid() or drm_do_get_edid()?
>>
>> I don't know where client->addr comes from, so I guess it could be
>> different from DDC_ADDR, rendering drm_get_edid() unusable.
>>
>> There's also the comment:
>>
>>         /* Yes, read the entire buffer, and do not skip the first
>>          * EDID_LENGTH bytes.
>>          */
>>
>> But again, there's not a word on *why*.
>
> The video pipeline has two hardware bridges between the LVDS from the
> SoC and DP+ output. For reasons, we would get hot plug events from one
> of these bridges, and EDID from the other. If I am not mistaken, I
> documented this strangeness in the DTS readme file.
>
> Did this shed any light on the *why* or did I tell you something you
> already knew?

I guess that answers the question why it's necessary to specify the ddc
to use, but not why drm_do_get_edid() could not be used. Is it really
necessary to read the EDID in one go?

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
