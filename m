Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0037E6956
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEC810E8A8;
	Thu,  9 Nov 2023 11:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66A10E8AA;
 Thu,  9 Nov 2023 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699528360; x=1731064360;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2cMk8afTZ0xpcpYsxBrVnE5QK3wysPs4tqRdgoKLhzg=;
 b=nho9Jgyvw9kYQF8LcSyYpgLpA4JDPJ9NTUHoRfJ4KpLH63+hrI09YbEV
 v4oguR+tZ4oCFkJJWdr5/IoeCTCyfokOfxbbJRe5oNuIAtPP6kMAEz6zH
 8R6dEM89Qc8J2gEKb/RUvVvYYeQN4W/iY83/KyIhu/vRSQVPJTDSzFAD8
 NHQQMwYQRAA1dsIBCl6gNevruMJF+Oa8TPupa/riZ35rc8oxZfhlhTvyj
 m4oVK1V+Q/MIL4n5tWu9nRHB69f2oMf0ptqX9532tlMzSAVqqL0SDYjaz
 GR/2m782eh1iuyGX7TtDWnH5DR+jKVshXWmDGkiZK3Xs7FfRBjQDwCG7s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380357063"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="380357063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 03:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11116551"
Received: from kchurina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.220])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 03:12:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam James <sam@gentoo.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm: i915: Adapt to -Walloc-size
In-Reply-To: <87jzqsy3sp.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231107215538.1891359-1-sam@gentoo.org>
 <87jzqsy3sp.fsf@intel.com>
Date: Thu, 09 Nov 2023 13:12:33 +0200
Message-ID: <87zfznw57i.fsf@intel.com>
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
Cc: Sam James <sam@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Nov 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 07 Nov 2023, Sam James <sam@gentoo.org> wrote:
>> GCC 14 introduces a new -Walloc-size included in -Wextra which errors out
>> like:
>> ```
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c: In function =E2=80=98eb_=
copy_relocations=E2=80=99:
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1681:24: error: allocatio=
n of insufficient size =E2=80=981=E2=80=99 for type =E2=80=98struct drm_i91=
5_gem_relocation_entry=E2=80=99 with size =E2=80=9832=E2=80=99 [-Werror=3Da=
lloc-size]
>>  1681 |                 relocs =3D kvmalloc_array(size, 1, GFP_KERNEL);
>>       |                        ^
>>
>> ```
>>
>> So, just swap the number of members and size arguments to match the prot=
otype, as
>> we're initialising 1 element of size `size`. GCC then sees we're not
>> doing anything wrong.
>>
>> Signed-off-by: Sam James <sam@gentoo.org>
>
> The short answer,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-intel-gt-next, thanks for the patch.

BR,
Jani.

>
> but please read on.
>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gp=
u/drm/i915/gem/i915_gem_execbuffer.c
>> index 683fd8d3151c..45b9d9e34b8b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1678,7 +1678,7 @@ static int eb_copy_relocations(const struct i915_e=
xecbuffer *eb)
>>  		urelocs =3D u64_to_user_ptr(eb->exec[i].relocs_ptr);
>>  		size =3D nreloc * sizeof(*relocs);
>>=20=20
>> -		relocs =3D kvmalloc_array(size, 1, GFP_KERNEL);
>> +		relocs =3D kvmalloc_array(1, size, GFP_KERNEL);
>
> Based on the patch context, we should really be calling:
>
> 	kvmalloc_array(nreloc, sizeof(*relocs), GFP_KERNEL);
>
> and we'd get mul overflow checks too.
>
> However, the code below also needs size, unless it's refactored to
> operate on multiples of sizeof(*relocs) and it all gets a bit annoying.
>
> Maybe there's a better way, but for the short term the patch at hand is
> no worse than what we currently have, and it'll silence the warning, so
> let's go with this.
>
>
>>  		if (!relocs) {
>>  			err =3D -ENOMEM;
>>  			goto err;

--=20
Jani Nikula, Intel
