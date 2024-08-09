Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AA94D17A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 15:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FCF10E90A;
	Fri,  9 Aug 2024 13:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFuU4szb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0871C10E90B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723211041; x=1754747041;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2q0JM7DrkXRljkEfvXBBolWlbIn4WXdGt6ny9v9+17A=;
 b=aFuU4szbdvI/evgEdadBUKbgVnSxpiBn9z1IKXTH81RzMeshPpCn/9NP
 53+kqAy0g8XWRH3rsV7WqNxMOBiDQpiBMyYluXJN3nSIKoqNjIOKTAtF/
 sRZJtqXtiFj8efgUuLQ5d0zVglMwpbrzCOpa+qThiZ8mXtsYHILqoCWO8
 szQBhmqL1gJzI+mukmLwaFVrZe8gznyqZm4Bwv7Dabp9AAO+zWtUvtIt1
 Kjoh3MRTeEqJ9BEdXR9SGNVfAP+Wq3ws4+eZf6g6AKLAlw9wrMlhYQBBa
 bXpSIhz3CV4bjVwgM95bBcdxjTvtVZmp3z4vzZMzTlhxbg76XanpZfNe5 A==;
X-CSE-ConnectionGUID: pdZVENkiQjq0uumzQpel3Q==
X-CSE-MsgGUID: zx+wHr2AT/m1TcPFyjPF8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21042866"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21042866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:44:00 -0700
X-CSE-ConnectionGUID: NkD5g5i3Qpuz8Ulnc2Fw+Q==
X-CSE-MsgGUID: sKqde5szQASt+0rtduSOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="58140371"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 06:43:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter
 <dan.carpenter@linaro.org>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/ast: astdp: fix pre-op vs post-op bug
In-Reply-To: <57cea156-1abc-4860-9a6a-0a5fdb4a2971@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <f7790a38-6b72-44dd-aaeb-550d2de14cf2@stanley.mountain>
 <57cea156-1abc-4860-9a6a-0a5fdb4a2971@suse.de>
Date: Fri, 09 Aug 2024 16:43:51 +0300
Message-ID: <87h6bt3j6w.fsf@intel.com>
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

On Fri, 09 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi,
>
> thanks a lot for the bugfix.
>
> Am 09.08.24 um 14:33 schrieb Dan Carpenter:
>> The test for "Link training failed" expect the loop to exit with "i"
>> set to zero but it exits when "i" is set to -1.  Change this from a
>> post-op to a pre-op so that it exits with "i" set to zero.  This
>> changes the number of iterations from 10 to 9 but probably that's
>> okay.
>
> Yes, that's ok.
>
>>
>> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomi=
c_enable")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 5d07678b502c..4329ab680f62 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -148,7 +148,7 @@ void ast_dp_link_training(struct ast_device *ast)
>>   	struct drm_device *dev =3D &ast->base;
>>   	unsigned int i =3D 10;
>>=20=20=20
>> -	while (i--) {
>> +	while (--i) {
>
> If this loop ever starts with i =3D 0, it would break again. Can we use
>
> while (i) {
>  =C2=A0 --i;
>  =C2=A0=C2=A0 ...
> }
>
> instead?

FWIW, I personally *always* use for loops when there isn't a compelling
reason to do otherwise. You know at a glance that

	for (i =3D 0; i < N; i++)

gets run N times and what i is going to be afterwards.

Sure, you may have to restructure other things, but I think it's almost
always worth it.

BR,
Jani.



>
> Best regards
> Thomas
>
>>   		u8 vgacrdc =3D ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
>>=20=20=20
>>   		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)

--=20
Jani Nikula, Intel
