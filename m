Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28B74E7DB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 09:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD310E320;
	Tue, 11 Jul 2023 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DC10E320
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689060192; x=1720596192;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y0/zOB9UbBv1wCcPDfqbK7qzMXd4kMqleyT13B7lePQ=;
 b=ftRdaoklpMOhCyMDTAaraVfWcvKFpg3dzpzQrlRINQwA/qF9aZMAdl/3
 ItGXtvYPD0jfJtsdbgJiHdvpO44K+8a5KzRl3geLcK1DB0hi5Sq8HgdHz
 Eyc7o2gzUn2YnT/eB6uZ5sQRBDlMjry/VZKTR+JSXLjMCqcLDvuNpPHVG
 g/a3jtnqZ6kJ2TTPJXhIDIurjSXhAmBhNiytF1WBsO0XqchBoVq2gMWC5
 Z5icjI08TCwYkgAJIbn8CVFXMZ97EMkKH+OCbXZpNnwCb762UivLpilGF
 r13bwmhvNOiR1d7lIQsojkcpHuuvaH5HTji1QU37eUWOh/TDbJXUhESP6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="395333214"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="395333214"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 00:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="811093001"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="811093001"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 00:23:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH RESEND] drm/bridge: anx7625: Use common macros for DP
 power sequencing commands
In-Reply-To: <CAGXv+5HPaJf_M0nAgaGsUZ3mG=BFhTkS-ASbMwjL4K8CRkxChA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710090929.1873646-1-wenst@chromium.org>
 <87edlgjbvg.fsf@intel.com>
 <CAGXv+5HPaJf_M0nAgaGsUZ3mG=BFhTkS-ASbMwjL4K8CRkxChA@mail.gmail.com>
Date: Tue, 11 Jul 2023 10:23:05 +0300
Message-ID: <87lefmj4iu.fsf@intel.com>
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
 =?utf-8?Q?N=C3=ADcolas_F=2E_R?= =?utf-8?Q?=2E_A=2E_Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Jul 10, 2023 at 6:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>>
>> On Mon, 10 Jul 2023, Chen-Yu Tsai <wenst@chromium.org> wrote:
>> > The DRM DP code has macros for the DP power sequencing commands. Use
>> > them in the anx7625 driver instead of raw numbers.
>> >
>> > Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downst=
ream")
>> > Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into no=
rmal status")
>> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>> > ---
>> > Collected tags and rebased on v6.5-rc1.
>> >
>> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/d=
rm/bridge/analogix/anx7625.c
>> > index 8b985efdc086..9db3784cb554 100644
>> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> > @@ -931,8 +931,8 @@ static void anx7625_dp_start(struct anx7625_data *=
ctx)
>> >
>> >       dev_dbg(dev, "set downstream sink into normal\n");
>> >       /* Downstream sink enter into normal mode */
>> > -     data =3D 1;
>> > -     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1,=
 &data);
>> > +     data =3D DP_SET_POWER_D0;
>> > +     ret =3D anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER=
, 1, &data);
>>
>> So you have code to implement the drm dp aux abstractions, why aren't
>> you using drm_dp_dpcd_writeb() and friends here?
>
> I didn't write the original code. Nor do I do much DP stuff. IIRC someone
> pointed out to me these had proper macros, so I converted them.
>
> Would you accept a follow-up patch to convert the AUX transfers to the
> DRM abstractions?

I believe they would be welcome, but I'm personally not familiar with
the driver in question.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
