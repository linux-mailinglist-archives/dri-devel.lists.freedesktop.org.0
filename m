Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578F5EF09D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1E910E2B3;
	Thu, 29 Sep 2022 08:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7E10E2B3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:36:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdRXW0Bs9z4xGG;
 Thu, 29 Sep 2022 18:36:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1664440575;
 bh=Zm00l+zmqsCWLK3LqHtfXzxyyxS1KKRiDBtm93jjX9o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HvksgIIi1oeSL3sCDaWnCOeWcGonlpaPKJKiI3OtvAu+BHn2yjS8AR76e3Ton4Nmy
 +EG26HHK0KGq8vBvYX1EeVNsxcIp9mIU6us0cOvxy60zyQiQGRFQuv/txggXaNqN90
 ZKWhlWHVgkpzhtZMxMhIP2Bw8oAKyLOzGZWe9yuxbUXzVLSr62mIeEvbWCpkSHrZlO
 Twy98ZJlAAXDut/ui87OToN2gdrJMOcxFt0qGiH5Q17PEp3FYZEI4DXZJQ30tNXk1t
 9aFxJpinn/zEKI8MPHuL3gndj8LsbUTOOq0tZEPF560BHpeqU2OY2AdZ4ghD6NHw5p
 pKXBKh32qbh6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc
 functions
In-Reply-To: <202209281011.66DD717D@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org>
 <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
 <202209281011.66DD717D@keescook>
Date: Thu, 29 Sep 2022 18:36:05 +1000
Message-ID: <874jwqfuh6.fsf@mpe.ellerman.id.au>
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
Cc: Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, llvm@lists.linux.dev,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David
 S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kees Cook <keescook@chromium.org> writes:
> On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
>> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wrote:
>> > The __malloc attribute should not be applied to "realloc" functions, as
>> > the returned pointer may alias the storage of the prior pointer. Inste=
ad
>> > of splitting __malloc from __alloc_size, which would be a huge amount =
of
>> > churn, just create __realloc_size for the few cases where it is needed.
>> >
>> > Additionally removes the conditional test for __alloc_size__, which is
>> > always defined now.
>> >
>> > Cc: Christoph Lameter <cl@linux.com>
>> > Cc: Pekka Enberg <penberg@kernel.org>
>> > Cc: David Rientjes <rientjes@google.com>
>> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>> > Cc: Andrew Morton <akpm@linux-foundation.org>
>> > Cc: Vlastimil Babka <vbabka@suse.cz>
>> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
>> > Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
>> > Cc: Marco Elver <elver@google.com>
>> > Cc: linux-mm@kvack.org
>> > Signed-off-by: Kees Cook <keescook@chromium.org>
>>=20
>> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
>> Remove __malloc attribute from realloc functions") in next-20220927.
>>=20
>> Noreply@ellerman.id.au reported all gcc8-based builds to fail
>> (e.g. [1], more at [2]):
>>=20
>>     In file included from <command-line>:
>>     ./include/linux/percpu.h: In function =E2=80=98__alloc_reserved_perc=
pu=E2=80=99:
>>     ././include/linux/compiler_types.h:279:30: error: expected
>> declaration specifiers before =E2=80=98__alloc_size__=E2=80=99
>>      #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __ma=
lloc
>>                                   ^~~~~~~~~~~~~~
>>     ./include/linux/percpu.h:120:74: note: in expansion of macro =E2=80=
=98__alloc_size=E2=80=99
>>     [...]
>>=20
>> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compile=
r).
>> Reverting this commit on next-20220927 fixes the issue.
>>=20
>> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
>> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bdd8=
11ffe708cf839/
>
> Eek! Thanks for letting me know. I'm confused about this --
> __alloc_size__ wasn't optional in compiler_attributes.h -- but obviously
> I broke something! I'll go figure this out.

This fixes it for me.

cheers

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index f141a6f6b9f6..0717534f8364 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -275,8 +275,13 @@ struct ftrace_likely_data {
  * be performing a _reallocation_, as that may alias the existing pointer.
  * For these, use __realloc_size().
  */
-#define __alloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__) __malloc
-#define __realloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__)
+#ifdef __alloc_size__
+# define __alloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__) __malloc
+# define __realloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__)
+#else
+# define __alloc_size(x, ...)	__malloc
+# define __realloc_size(x, ...)
+#endif
=20
 #ifndef asm_volatile_goto
 #define asm_volatile_goto(x...) asm goto(x)
