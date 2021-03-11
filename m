Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49174336FBA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5F46EB85;
	Thu, 11 Mar 2021 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BF76EB85;
 Thu, 11 Mar 2021 10:20:07 +0000 (UTC)
IronPort-SDR: WomW15jkFYqr8G8X0nIgxvJJL8I7iPy+ZyUn1zOM0jvq35Wvs16oVaU0cLslMoVtPwUAgTCsh6
 fvdFo8lGonDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176239632"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="176239632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 02:20:06 -0800
IronPort-SDR: BhDPf9nXpL63uUErTdiZrOwXpMCElpscdaV3kmDD9+6hEQJh2Y0cLhcMTZhBJSaYKosztRH7ny
 0yugjy43r2cg==
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="410561675"
Received: from csacomax-mobl.ger.corp.intel.com (HELO [10.252.22.132])
 ([10.252.22.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 02:20:05 -0800
Subject: Re: [Intel-gfx] [PATCH] i915: Drop relocation support on all new
 hardware (v3)
To: Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <20210310212606.766121-1-jason@jlekstrand.net>
 <20210310215007.782649-1-jason@jlekstrand.net>
 <CAKi4VAKbEhhr+w1K8ByeioAnrzczH6grnXT9GmdMu9taVPtAmg@mail.gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <69ebe508-dd48-384d-93bc-84e8ccb4c9d1@intel.com>
Date: Thu, 11 Mar 2021 10:20:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKi4VAKbEhhr+w1K8ByeioAnrzczH6grnXT9GmdMu9taVPtAmg@mail.gmail.com>
Content-Language: en-GB
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/03/2021 08:14, Lucas De Marchi wrote:
> On Wed, Mar 10, 2021 at 1:50 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>
>> The Vulkan driver in Mesa for Intel hardware never uses relocations if
>> it's running on a version of i915 that supports at least softpin which
>> all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
>> only supported by iris which never uses relocations.  The older i965
>> driver in Mesa does use relocations but it only supports Intel hardware
>> through Gen11 and has been deprecated for all hardware Gen9+.  The
>> compute driver also never uses relocations.  This only leaves the media
>> driver which is supposed to be switching to softpin going forward.
>> Making softpin a requirement for all future hardware seems reasonable.
>>
>> Rejecting relocations starting with Gen12 has the benefit that we don't
>> have to bother supporting it on platforms with local memory.  Given how
>> much CPU touching of memory is required for relocations, not having to
>> do so on platforms where not all memory is directly CPU-accessible
>> carries significant advantages.
>>
>> v2 (Jason Ekstrand):
>>   - Allow TGL-LP platforms as they've already shipped
>>
>> v3 (Jason Ekstrand):
>>   - WARN_ON platforms with LMEM support in case the check is wrong
>>
>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 99772f37bff60..b02dbd16bfa03 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
>>          return err;
>>   }
>>
>> -static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
>> +static int check_relocations(const struct i915_execbuffer *eb,
>> +                            const struct drm_i915_gem_exec_object2 *entry)
>>   {
>>          const char __user *addr, *end;
>>          unsigned long size;
>> @@ -1774,6 +1775,14 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
>>          if (size == 0)
>>                  return 0;
>>
>> +       /* Relocations are disallowed for all platforms after TGL-LP */
>> +       if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
>> +               return -EINVAL;
>> +
>> +       /* All discrete memory platforms are Gen12 or above */
>> +       if (WARN_ON(HAS_LMEM(eb->i915)))
> 
> HAS_LMEM() will return true for the fake lmem support, which may be < gen12.
> Dropping the fake lmem would be a possibility.

Nothing in CI is currently using the fake-lmem configuration(for some 
months now I think), also its use was limited only to the selftests, 
which can't hit this path, so shouldn't matter here. Plan was to just 
drop it.

> 
> Lucas De Marchi
> 
>> +               return -EINVAL;
>> +
>>          if (size > N_RELOC(ULONG_MAX))
>>                  return -EINVAL;
>>
>> @@ -1807,7 +1816,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
>>                  if (nreloc == 0)
>>                          continue;
>>
>> -               err = check_relocations(&eb->exec[i]);
>> +               err = check_relocations(eb, &eb->exec[i]);
>>                  if (err)
>>                          goto err;
>>
>> @@ -1880,7 +1889,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
>>          for (i = 0; i < count; i++) {
>>                  int err;
>>
>> -               err = check_relocations(&eb->exec[i]);
>> +               err = check_relocations(eb, &eb->exec[i]);
>>                  if (err)
>>                          return err;
>>          }
>> --
>> 2.29.2
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
