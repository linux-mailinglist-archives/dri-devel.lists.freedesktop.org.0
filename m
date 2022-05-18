Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13452B8E6
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36B110E068;
	Wed, 18 May 2022 11:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4F910E068;
 Wed, 18 May 2022 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652873982; x=1684409982;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rjF4zWNjVkRaA4u9AigM/0O/Su6Qa+NPXOPo2kzYSB0=;
 b=I16iBUE0/p9kag9SgM12YwEc2hqFmYPL8AZAS77ocyah+/bwqKelCljU
 wm2CgLOg8cblNcjcdk8s4FfkkStGY+H9FH+wCy0d0x8sNSIDm/7tOW4st
 U+e9DXLcJDMiS114SUh3XJDGWz4tQjIb3EeUSJ06qBu4A8LnCtL6w32jf
 FXipvgY1BpRuKlvsUCw/dQeLprcAkla9VF3coPWzYRE+zCFOjFAes5/S2
 p8V6/ox/QAKtLfDpLwVbCGjvSUlOB/xC1br9VzIAWdTSx5Mb2QmL9h5mB
 le4LsKeBQ/Z5yHaetHuKB/1aOl9u/evdMX/XlFKjpjF3kZqS7pJ2pef/z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270453941"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="270453941"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 04:39:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="626998272"
Received: from jwasiuki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.47])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 04:39:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 11/11] drm/i915: Fix undefined behavior due to shift
 overflowing the constant
In-Reply-To: <YoSj9O/6yA0nn/xW@zn.tnic>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-12-bp@alien8.de>
 <78e67e42-7e1e-e9fa-036d-441168100731@infradead.org>
 <YoSj9O/6yA0nn/xW@zn.tnic>
Date: Wed, 18 May 2022 14:39:14 +0300
Message-ID: <87k0ajdq8t.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 May 2022, Borislav Petkov <bp@alien8.de> wrote:
> On Tue, May 17, 2022 at 04:05:46PM -0700, Randy Dunlap wrote:
>>=20
>>=20
>> On 4/5/22 08:15, Borislav Petkov wrote:
>> > From: Borislav Petkov <bp@suse.de>
>> >=20
>> > Fix:
>> >=20
>> >   In file included from <command-line>:0:0:
>> >   drivers/gpu/drm/i915/gt/uc/intel_guc.c: In function =E2=80=98intel_g=
uc_send_mmio=E2=80=99:
>> >   ././include/linux/compiler_types.h:352:38: error: call to =E2=80=98_=
_compiletime_assert_1047=E2=80=99 \
>> >   declared with attribute error: FIELD_PREP: mask is not constant
>> >     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
>> >=20
>> > and other build errors due to shift overflowing values.
>> >=20
>> > See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
>> > details as to why it triggers with older gccs only.
>> >=20
>>=20
>> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>=20
>> Is this merged anywhere?
>
> It's state is "new" in their patchwork:
>
> https://patchwork.freedesktop.org/patch/480756/

Basically we run all patches through CI before merging, and because only
one patch was sent to intel-gfx, the CI just sat waiting for the rest of
the series to arrive...

Anyway, didn't really like the changes in i915_reg.h, sent my version of
that and the rest separately [1].

> so I guess not yet.
>
>> It could/should at least be in linux-next so that other people
>> don't waste time on it.
>
> -ETOOMANYPATCHES I guess. :-\

Yeah, sorry about that.


BR,
Jani.

[1] https://patchwork.freedesktop.org/series/104122/


--=20
Jani Nikula, Intel Open Source Graphics Center
