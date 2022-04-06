Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405214F6193
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D27B10E41F;
	Wed,  6 Apr 2022 14:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6D10E0F6;
 Wed,  6 Apr 2022 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649255713; x=1680791713;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=D2k6neIoq0HuAMjXdsRZhn8IXAOS7zwhgg73BXGOJrA=;
 b=dumsWZ7EsJuov1cB4SZ0L5WQi/khKAJNXiBWEaI8zqEIfpa8wu6eMqJ3
 H3/BedafF7eloHm42NMPMjLt6IluLqZd23JKv9+AeHlHicNKPXtXbxj0w
 EZ0cq01/UbO57LQvqPnVwwKw0LwPROsPkGrT+QoTTmd+UTHj3tWAdqmaB
 p0PtBKLXC/IPThUntnMqZ8T72gHrxzK02KBM7WZkY0mYP+e//9f/ixwpF
 I5bJzvHtPvLtaz9690dCU1gCwUChYFu7psDpZtxt73z94HjVrAI3H4CLS
 u1m5wMPaJN1ukTZGps9wOuT7ZGlragU1Jy4x5LYwgkO/z0XkuvvkNxRsu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321759329"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="321759329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 07:26:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="722540100"
Received: from mgrabins-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.141.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 07:26:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Grigory
 Vasilyev
 <h0tc0d3@gmail.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa
 Wen <mwen@igalia.com>
Subject: Re: [PATCH] drm/amdgpu: Senseless code and unnecessary memset
In-Reply-To: <614a4844-fa5d-8b8e-0628-894394f31608@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220405173632.2663-1-h0tc0d3@gmail.com>
 <614a4844-fa5d-8b8e-0628-894394f31608@amd.com>
Date: Wed, 06 Apr 2022 17:26:44 +0300
Message-ID: <874k3670ez.fsf@intel.com>
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Apr 2022, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 05.04.22 um 19:36 schrieb Grigory Vasilyev:
>> Using memset on local arrays before exiting the function is pointless.
>> Compilator will remove this code. Also for local arrays is preferable to
>> use {0} instead of memset. Mistakes are often made when working with
>> memset.
>
> Well actually memset is preferred when working with structures which are=
=20
> given to the hardware parser because {0} won't initialize paddings.

Not that I'd know anything that's going on here... but it sure seems
strange to me to be passing unpacked structures where the padding might
matter to a "hardware parser".

*shrug*


BR,
Jani.


>
> So please don't use {0} in any of the atom bios code.
>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/atom.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amd=
gpu/atom.c
>> index be9d61bcb8ae..537e48fbbe6b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>> @@ -1538,11 +1538,9 @@ struct atom_context *amdgpu_atom_parse(struct car=
d_info *card, void *bios)
>>   int amdgpu_atom_asic_init(struct atom_context *ctx)
>>   {
>>   	int hwi =3D CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
>> -	uint32_t ps[16];
>> +	uint32_t ps[16] =3D {0};
>>   	int ret;
>>=20=20=20
>> -	memset(ps, 0, 64);
>> -
>>   	ps[0] =3D cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
>>   	ps[1] =3D cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
>>   	if (!ps[0] || !ps[1])
>> @@ -1551,10 +1549,6 @@ int amdgpu_atom_asic_init(struct atom_context *ct=
x)
>>   	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
>>   		return 1;
>>   	ret =3D amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
>> -	if (ret)
>> -		return ret;
>> -
>> -	memset(ps, 0, 64);
>>=20=20=20
>>   	return ret;
>>   }
>

--=20
Jani Nikula, Intel Open Source Graphics Center
