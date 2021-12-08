Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A346D446
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 14:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6BE7342A;
	Wed,  8 Dec 2021 13:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F777341B;
 Wed,  8 Dec 2021 13:20:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="218511970"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="218511970"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 05:20:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="503047989"
Received: from cahanley-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 05:20:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] drm/i915/display: Delete redundant post_mask
 assignment
In-Reply-To: <YbCtUZUSbEpCuDoi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211208074619.404138-1-luo.penghao@zte.com.cn>
 <YbCtUZUSbEpCuDoi@intel.com>
Date: Wed, 08 Dec 2021 15:20:15 +0200
Message-ID: <87lf0v44j4.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luo penghao <luo.penghao@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Dec 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Dec 08, 2021 at 07:46:19AM +0000, cgel.zte@gmail.com wrote:
>> From: luo penghao <luo.penghao@zte.com.cn>
>>=20
>> This value will be overwritten by the following if statement, even
>> if the if is not executed, the value will not be used
>>=20
>> The clang_analyzer complains as follows:
>>=20
>> Value stored to 'port_mask' is never read
>>=20
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
>> ---
>>  drivers/gpu/drm/i915/display/intel_ddi.c | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/=
i915/display/intel_ddi.c
>> index bd18432..3aad0c3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2011,7 +2011,6 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct=
 intel_encoder *encoder)
>>  			return;
>>  	}
>>=20=20
>> -	port_mask =3D BIT(encoder->port);
>>  	ddi_clk_needed =3D encoder->base.crtc;
>>=20=20
>>  	if (encoder->type =3D=3D INTEL_OUTPUT_DSI) {
>
> 'port_mask' declaration could now be moved into this block.

I've basically given up on patches from cgel.zte@gmail.com,
luo.penghao@zte.com.cn, zealci@zte.com.cn, etc. The patches are the
simplest possible changes to silence static analyzer warnings, with no
further analysis of the issues, and no follow-up on questions.

Until that changes, I think we're better off just regarding them static
as analyzer reports.


BR,
Jani.


>
>> --=20
>> 2.15.2
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
