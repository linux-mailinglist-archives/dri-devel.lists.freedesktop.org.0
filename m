Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB12712371
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD4210E194;
	Fri, 26 May 2023 09:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCBF10E194;
 Fri, 26 May 2023 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685093112; x=1716629112;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PhMga7S8KQ54sZAHlEIKmYrtRc8SK77qP6RLA5wZU2Y=;
 b=Dd+khE4BaqBlaOJIvzaRRqtvlHf9S0XjkUbo3NDfyhGyvsgechjQtgDE
 BDC3HNUly95QtUGJKc4/UksNHQHUEw64DLbUllp0WvsAaRi1Mj3lTSPKj
 7f7q70zS/d+bXgfoZAop4Ueyl7wEiz2VVrME8AtwUTwkUsSfgkIAv2XAb
 G5cLC16/OXayEKPTFbGI2YRDOF51gf3Spo7M4Hxa3Ll/mD45NYSdejxhu
 v/nAAXc+SWIxW0YQLFNFyBoPWCAHbbSVNFPliRfBpGUuSBOsGH63IcRsV
 V9LuLyno3SX9Z0uEwxqo0lY7effYyTAjwmpz9LYUZE7thAVlPpSNkrrOh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343657390"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="343657390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 02:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="775021242"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="775021242"
Received: from rdota-mobl.ger.corp.intel.com (HELO localhost) ([10.252.44.87])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:25:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
In-Reply-To: <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
 <CAKwvOd=jZJouuNMd3Rvc--goA0EXPHcf6cHXUA6W1kXJg2ay2w@mail.gmail.com>
Date: Fri, 26 May 2023 12:25:05 +0300
Message-ID: <871qj3jvgu.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev,
 kernel test robot <lkp@intel.com>, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Wed, May 24, 2023 at 8:38=E2=80=AFAM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Clang warns:
>>
>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotate=
d fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>>                   case I915_FORMAT_MOD_X_TILED:
>>                   ^
>>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'bre=
ak;' to avoid fall-through
>>                   case I915_FORMAT_MOD_X_TILED:
>>                   ^
>>                   break;
>>   1 error generated.
>>
>> Clang is a little more pedantic than GCC, which does not warn when
>> falling through to a case that is just break or return. Clang's version
>> is more in line with the kernel's own stance in deprecated.rst, which
>> states that all switch/case blocks must end in either break,
>> fallthrough, continue, goto, or return. Add the missing break to silence
>> the warning.
>>
>> Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=3DQ=
FNuDoE_J2Zu-g@mail.gmail.com/
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks for the patch! I've never seen the closes tag before, that's
> new to me. Can you tell me more about it?
>
> A few more tags
>
> Reported-by: Tom Rix <trix@redhat.com>
> Link: https://lore.kernel.org/all/20230523125116.1669057-1-trix@redhat.co=
m/
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch and review, pushed to drm-intel-next with
s/Link/Closes/.

BR,
Jani.


>
>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/=
drm/i915/display/intel_display.c
>> index 0490c6412ab5..6d49e0ab3e85 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -6008,6 +6008,7 @@ static int intel_async_flip_check_hw(struct intel_=
atomic_state *state, struct in
>>                                             plane->base.base.id, plane->=
base.name);
>>                                 return -EINVAL;
>>                         }
>> +                       break;
>>
>>                 case I915_FORMAT_MOD_X_TILED:
>>                 case I915_FORMAT_MOD_Y_TILED:
>>
>> ---
>> base-commit: 9a2cb1b31c040e2f1b313e2f7921f0f5e6b66d82
>> change-id: 20230524-intel_async_flip_check_hw-implicit-fallthrough-c4c40=
b03802f
>>
>> Best regards,
>> --
>> Nathan Chancellor <nathan@kernel.org>
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
