Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B01476F6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 03:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1E66E1B3;
	Fri, 24 Jan 2020 02:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2523 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jan 2020 02:46:09 UTC
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D386F6E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 02:46:09 +0000 (UTC)
Received: from [IPv6:2601:646:8600:3281:4dd4:188:b5a7:5dd5]
 ([IPv6:2601:646:8600:3281:4dd4:188:b5a7:5dd5]) (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 00O23PpB1651500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 23 Jan 2020 18:03:28 -0800
Date: Thu, 23 Jan 2020 18:03:14 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
 <fc5c94a2-5a25-0715-5240-5ba3cbe0f2b2@c-s.fr>
 <CAHk-=wi8FvaeRv6PpisQ+L_Cv52yE6jCxZzUHQPZ_K7HzFkaBQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
To: Linus Torvalds <torvalds@linux-foundation.org>,
 christophe leroy <christophe.leroy@c-s.fr>
From: hpa@zytor.com
Message-ID: <1BC4F810-1BF4-4C15-9113-890A163FDBE2@zytor.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On January 23, 2020 11:57:57 AM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>On Thu, Jan 23, 2020 at 11:47 AM christophe leroy
><christophe.leroy@c-s.fr> wrote:
>>
>> I'm going to leave it aside, at least for the time being, and do it
>as a
>> second step later after evaluating the real performance impact. I'll
>> respin tomorrow in that way.
>
>Ok, good.
>
>From a "narrow the access window type" standpoint it does seem to be a
>good idea to specify what kind of user accesses will be done, so I
>don't hate the idea, it's more that I'm not convinced it matters
>enough.
>
>On x86, we have made the rule that user_access_begin/end() can contain
>_very_ few operations, and objtool really does enforce that. With
>objtool and KASAN, you really end up with very small ranges of
>user_access_begin/end().
>
>And since we actually verify it statically on x86-64, I would say that
>the added benefit of narrowing by access type is fairly small. We're
>not going to have complicated code in that user access region, at
>least in generic code.
>
>> > Also, it shouldn't be a "is this a write". What if it's a read
>_and_ a
>> > write? Only a write? Only a read?
>>
>> Indeed that was more: does it includes a write. It's either RO or RW
>
>I would expect that most actual users would be RO or WO, so it's a bit
>odd to have those choices.
>
>Of course, often writing ends up requiring read permissions anyway if
>the architecture has problems with alignment handling or similar, but
>still... The real RW case does exist conceptually (we have
>"copy_in_user()", after all), but still feels like it shouldn't be
>seen as the only _interface_ choice.
>
>IOW, an architecture may decide to turn WO into RW because of
>architecture limitations (or, like x86 and arm, ignore the whole
>RO/RW/WO _entirely_ because there's just a single "allow user space
>accesses" flag), but on an interface layer if we add this flag, I
>really think it should be an explicit "read or write or both".
>
>So thus my "let's try to avoid doing it in the first place, but if we
>_do_ do this, then do it right" plea.
>
>                 Linus

I'm wondering if we should make it a static part of the API instead of a variable.

I have *deep* concern with carrying state in a "key" variable: it's a direct attack vector for a crowbar attack, especially since it is by definition live inside a user access region.

One major reason x86 restricts the regions like this is to minimize the amount of unconstrained state: we don't save and restore the state around, but enter and exit unconditionally, which means that a leaked state will end up having a limited lifespan. Nor is there any state inside the user access region which could be corrupted to leave the region open.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
