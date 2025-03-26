Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18908A72079
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 22:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7A310E056;
	Wed, 26 Mar 2025 21:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="YIjfw2wK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C6710E056
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 21:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1743023391; x=1743282591;
 bh=RpFb68sfUuLucQKFl/LvCo6BIWrsfhNT9hY9gKkIojc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=YIjfw2wK1j2h6azYTqWRVEH0cuiyeF3PG94+4kPpWByxyEylHxw0yQ73QMVZYJpHE
 enuZwCDqIfktzADNY3W4VW9qxXpnNVZ+qU/+ZkmsA1kaA9IhNHEyTAFxsbAfN7CGob
 yjy+Nsyi17yd4c4EO69HPaAvBFwtz+mx3Q85qArKW5RqcxXdKP4h7NjQDNwMtfVB2+
 1qU3SaIvILaFIGyOtnlmAmy2At8S/6bHl2gQ8TwJrAUGPmnGDFFPBY2nRrP6R1QHcn
 h2ILwNEWubh1bOBRCdkoe5lERIkf3BJHUs9m7fkcfvkvILO7/wnIc7ox7EkEr4A/tN
 7bP6FyKUEueYg==
Date: Wed, 26 Mar 2025 21:09:47 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
Message-ID: <D8QI804Q3DAS.2BV4WSL81H52Z@proton.me>
In-Reply-To: <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
 <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
 <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
 <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
 <CAJ-ks9nKT2PUDm6=b4AB1QUWwwvcqPn7Vz60=c0B+uFMZrqPew@mail.gmail.com>
 <D8QDOBUM6NF0.CGJY7ZA5KD9S@proton.me>
 <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: db89d0d8c8162336c902db644badce1251720b1b
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

On Wed Mar 26, 2025 at 8:06 PM CET, Tamir Duberstein wrote:
> On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>> On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
>> > In the current code you're looking at, yes. But in the code I have
>> > locally I'm transmuting `[u8]` to `BStr`. See my earlier reply where I
>> > said "Hmm, looking at this again we can just transmute ref-to-ref and
>> > avoid pointers entirely. We're already doing that in
>> > `CStr::from_bytes_with_nul_unchecked`".
>>
>> `CStr::from_bytes_with_nul_unchecked` does the transmute with
>> references. That is a usage that the docs of `transmute` explicitly
>> recommend to change to an `as` cast [1].
>
> RIght. That guidance was written in 2016
> (https://github.com/rust-lang/rust/pull/34609) and doesn't present any
> rationale for `as` casts being preferred to transmute. I posted a
> comment in the most relevant issue I could find:
> https://github.com/rust-lang/rust/issues/34249#issuecomment-2755316610.

Not sure if that's the correct issue, maybe we should post one on the
UCG (unsafe code guidelines). But before that we probably should ask on
zulip...

>> No idea about provenance still.
>
> Well that's not surprising, nobody was thinking about provenance in
> 2016. But I really don't think we should blindly follow the advice in
> this case. It doesn't make an iota of sense to me - does it make sense
> to you?

For ptr-to-int transmutes, I know that they will probably remove
provenance, hence I am a bit cautious about using them for ptr-to-ptr or
ref-to-ref.

>> [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html#alternatives
>>
>> >> I tried to find some existing issues about the topic and found that
>> >> there exists a clippy lint `transmute_ptr_to_ptr`. There is an issue
>> >> asking for a better justification [1] and it seems like nobody provid=
ed
>> >> one there. Maybe we should ask the opsem team what happens to provena=
nce
>> >> when transmuting?
>> >
>> > Yeah, we should do this - but again: not relevant in this discussion.
>>
>> I think it's pretty relevant.
>
> It's not relevant because we're no longer talking about transmuting
> pointer to pointer. The two options are:
> 1. transmute reference to reference.
> 2. coerce reference to pointer, `as` cast pointer to pointer (triggers
> `ptr_as_ptr`), reborrow pointer to reference.
>
> If anyone can help me understand why (2) is better than (1), I'd
> certainly appreciate it.

I am very confident that (2) is correct. With (1) I'm not sure (see
above), so that's why I mentioned it.

---
Cheers,
Benno

