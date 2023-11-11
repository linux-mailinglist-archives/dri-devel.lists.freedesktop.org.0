Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197807E89AC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 08:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D8210E099;
	Sat, 11 Nov 2023 07:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.gentoo.org (smtp.gentoo.org
 [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E391110E099;
 Sat, 11 Nov 2023 07:55:15 +0000 (UTC)
References: <20231107215538.1891359-1-sam@gentoo.org>
 <87jzqsy3sp.fsf@intel.com>
User-agent: mu4e 1.10.8; emacs 30.0.50
From: Sam James <sam@gentoo.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: i915: Adapt to -Walloc-size
Date: Sat, 11 Nov 2023 07:54:26 +0000
Organization: Gentoo
In-reply-to: <87jzqsy3sp.fsf@intel.com>
Message-ID: <87zfzk7mhv.fsf@gentoo.org>
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
 intel-gfx@lists.freedesktop.org, Sam James <sam@gentoo.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jani Nikula <jani.nikula@linux.intel.com> writes:

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

Thanks. I have been trying to port to kvmalloc_array where I can if it's
obvious/trivial, but I admit I didn't want to take it on when it'd
require any surrounding refactoring unless someone insisted.

>
>
>>  		if (!relocs) {
>>  			err =3D -ENOMEM;
>>  			goto err;

best,
sam
