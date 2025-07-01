Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998DAEF1F2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA0C10E53E;
	Tue,  1 Jul 2025 08:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+rU7K6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530F710E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360190; x=1782896190;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OAO/ikfI+GMvqFN77olj2KKo2t9HbvIdrcFz2wQvYKo=;
 b=j+rU7K6fHT78c6AdduWBAhEaydPm0rNIeqG4/kJJU+mV4SG65Pi5ginM
 +UjToE0uHr2KFizcUISHa9Hkn+GeVovvwcMjipoLl04pEowhrzHr9RX0R
 hDJ5gAbbM1iHcMbMd6ci9L0mXijQVtD1bPCMAMCyRPEoj+LLKr5fYgBlz
 u2nfKHRzuZs5TZgVopB74Y2VRkcWb9yN9yxirQpH00DLMY+4hSDRgNWI+
 MdDvvVnpgYqUtczr3g2rwGfirZtAR4HO9xnFstAY5sqC3RZMkXujL9Xzw
 q6+Vm1Q+rXsBIa1Ue7PHtABZQaW09JKObAWo37eN1IYBXrSobYIjKrhkX A==;
X-CSE-ConnectionGUID: XSEaljMQSkq/7ENcgLemUQ==
X-CSE-MsgGUID: flEvqhxhQJaLpiSflNcVWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53552006"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53552006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:56:30 -0700
X-CSE-ConnectionGUID: gUkcfxYbTVidcD/fTGvoyA==
X-CSE-MsgGUID: qdixlhaNR2ib5PoAEil8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153478831"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:56:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
In-Reply-To: <CAFEp6-2N4G0J+Fmke369t7zsnHDpi4zPuRx_Xn-hXAWN7URoJA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
 <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
 <20250630-angelic-macaque-of-spirit-fadc59@houat>
 <CAFEp6-2N4G0J+Fmke369t7zsnHDpi4zPuRx_Xn-hXAWN7URoJA@mail.gmail.com>
Date: Tue, 01 Jul 2025 11:56:23 +0300
Message-ID: <77a6722549f3bb5d5e22a11762bf55bf16935e85@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Jul 2025, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> On Mon, Jun 30, 2025 at 10:40=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
>>
>> On Mon, Jun 30, 2025 at 09:46:40AM +0200, Loic Poulain wrote:
>> > Hi Maxime,
>> >
>> > On Mon, Jun 30, 2025 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
>> > > On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
>> > > > DRM checks EDID block count against allocated size in drm_edid_val=
id
>> > > > function. We have to allocate the right EDID size instead of the m=
ax
>> > > > size to prevent the EDID to be reported as invalid.
>> > > >
>> > > > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid mor=
e")
>> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> > > > ---
>> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/g=
pu/drm/bridge/analogix/anx7625.c
>> > > > index 8a9079c2ed5c..5a81d1bfc815 100644
>> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> > > > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_r=
ead(struct anx7625_data *ctx)
>> > > >               return NULL;
>> > > >       }
>> > > >
>> > > > -     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK=
_SIZE);
>> > > > +     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num *=
 ONE_BLOCK_SIZE);
>> > > >       kfree(edid_buf);
>> > >
>> > > Do we need to cache the whole EDIDs? AFAIU, it's only ever used to g=
et
>> > > the manufacturer name, which fits into a u32 / 4 u8. We should proba=
bly
>> > > just cache that.
>> >
>> > While the cached EDID is indeed used internally to retrieve the
>> > product ID, its content is also returned via the DRM read_edid
>> > callback. This value is then used by the DRM core to enumerate
>> > available display modes, and likely also when reading EDID from sysfs.
>>
>> You still don't need to allocate and store a copy of the EDIDs in your
>> driver to implement what you listed so far.
>
> Right, we could change how the driver behaves on callback and just
> cache what we need for internal usage. That change was initially a
> pure fix, do you recommend changing all of this in this change, or in
> a follow-up one.

If there's a follow-up, I really *really* think it should be to rewrite
EDID reading in anx7625.c altogether. The current thing is busted in
more ways than I have time to enumerate right now. And it's not because
I'm in a huge rush. Just look at sp_tx_edid_read() and the functions it
calls.

The end result should be based on providing a straightforward read_block
callback for drm_edid_read_custom().

I've actually started this a few times myself, but it's a bit much for
someone without the hardware to test it, nor skin in the game. The
current code is too complex to trivially refactor.


BR,
Jani.


--=20
Jani Nikula, Intel
