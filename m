Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKUQDpOAnWk/QQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:42:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1A1858B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A9B10E539;
	Tue, 24 Feb 2026 10:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GAU2pdQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FAA10E539
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 10:42:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E8F761335;
 Tue, 24 Feb 2026 10:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158D2C116D0;
 Tue, 24 Feb 2026 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771929740;
 bh=EdYMSneYGYWOu2MY/gnpVM4ln8olb1RiXGDKI2avrXU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GAU2pdQXeucHDr93YOJlBQA+9WyQyiqX3XUv0GPdy5+63ewH++MkxyrNYQumwLA4W
 YPvSJkU9bCvwg0PQISCbL7pQ53LDJwxCiV6mlupfv3XGnYbITTh1piGzZ+A4mlBMuk
 4BLlREPZdKFZhle5va0yKY3MgMD1Ru8Hzm9tCf+z8+JaypVhehj82iMeu/g36i61cS
 LOK6GF96u2rd6HmI4kigzcpkbtJ/Mu3uUKlP3KL6U4B3ccmjM1712HCHbTYCUdiqco
 kxP5N90jQc3VZcobz2Hi+vK6uI3CzGRjwp0bzDuDcBOAuwMIDp5V4VWUl94VWRudG1
 gdUVkzkXXqWYQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: aliceryhl@google.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave
 Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge
 Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Igor Korotin
 <igor.korotin.linux@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Boqun
 Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org,
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, Asahi Lina
 <lina+kernel@asahilina.net>, Oliver Mangold <oliver.mangold@pm.me>
Subject: Re: [PATCH v15 1/9] rust: types: Add Ownable/Owned types
In-Reply-To: <aZ1VQmtapuoerpVo@google.com>
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-1-893ed86b06cc@kernel.org>
 <aZg44EmMWKK-z5KP@google.com>
 <87wm0333qt.fsf@t14s.mail-host-address-is-not-set>
 <IFU05rWmgywK-tzaInc7eF2Kmy1zf-BDkCrQZfRI_2JN6E0-p3zFaUMu3V6T1YTeQG9xC1hHzXThLCORJqpoWA==@protonmail.internalid>
 <aZ1VQmtapuoerpVo@google.com>
Date: Tue, 24 Feb 2026 11:41:45 +0100
Message-ID: <87a4wy2zkm.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.19 / 15.00];
	URIBL_BLACK(7.50)[types.rs:url];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lina+kernel@asahilina.net,m:oliver.mangold@pm.me,m:igorkorotinlinux@gmail.com,m:lina@asahi
 lina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,google.com,vger.kernel.org,lists.freedesktop.org,kvack.org,asahilina.net,pm.me];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	NEURAL_SPAM(0.00)[1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pm.me:email,garyguo.net:email]
X-Rspamd-Queue-Id: 93E1A1858B1
X-Rspamd-Action: add header
X-Spam: Yes

<aliceryhl@google.com> writes:

> On Mon, Feb 23, 2026 at 03:59:22PM +0100, Andreas Hindborg wrote:
>> Alice Ryhl <aliceryhl@google.com> writes:
>>
>> > On Fri, Feb 20, 2026 at 10:51:10AM +0100, Andreas Hindborg wrote:
>> >> From: Asahi Lina <lina+kernel@asahilina.net>
>> >>
>> >> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
>> >> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
>> >> `AlwaysRefCounted`, this mechanism expects the reference to be unique
>> >> within Rust, and does not allow cloning.
>> >>
>> >> Conceptually, this is similar to a `KBox<T>`, except that it delegates
>> >> resource management to the `T` instead of using a generic allocator.
>> >>
>> >> [ om:
>> >>   - Split code into separate file and `pub use` it from types.rs.
>> >>   - Make from_raw() and into_raw() public.
>> >>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
>> >>   - Usage example/doctest for Ownable/Owned.
>> >>   - Fixes to documentation and commit message.
>> >> ]
>> >>
>> >> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
>> >> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
>> >> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
>> >> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> >> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>> >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> >> [ Andreas: Updated documentation, examples, and formatting ]
>> >> Reviewed-by: Gary Guo <gary@garyguo.net>
>> >> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >
>> >> +///         let result = NonNull::new(KBox::into_raw(result))
>> >> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");
>> >
>> > KBox should probably have an into_raw_nonnull().
>>
>> I can add that.
>>
>> >
>> >> +///    let foo = Foo::new().expect("Failed to allocate a Foo. This shouldn't happen");
>> >> +///    assert!(*FOO_ALLOC_COUNT.lock() == 1);
>> >
>> > Use ? here.
>>
>> Ok.
>>
>> >
>> >> +/// }
>> >> +/// // `foo` is out of scope now, so we expect no live allocations.
>> >> +/// assert!(*FOO_ALLOC_COUNT.lock() == 0);
>> >> +/// ```
>> >> +pub unsafe trait Ownable {
>> >> +    /// Releases the object.
>> >> +    ///
>> >> +    /// # Safety
>> >> +    ///
>> >> +    /// Callers must ensure that:
>> >> +    /// - `this` points to a valid `Self`.
>> >> +    /// - `*this` is no longer used after this call.
>> >> +    unsafe fn release(this: NonNull<Self>);
>> >
>> > Honestly, not using it after this call may be too strong. I can imagine
>> > wanting a value where I have both an ARef<_> and Owned<_> reference to
>> > something similar to the existing Arc<_>/ListArc<_> pattern, and in that
>> > case the value may in fact be accessed after this call if you still have
>> > an ARef<_>.
>>
>> I do not understand your use case.
>>
>> You are not supposed to have both an `ARef` and an `Owned` at the same
>> time. The `Owned` is to `ARef` what `UniqueArc` is to `Arc`. It is
>> supposed to be unique and no `ARef` can be live while the `Owned` is
>> live.
>>
>> A `ListArc` is "at most one per list link" and it takes a refcount on
>> the object by owning an `Arc`. As far as I recall, it does not provide
>> mutable access to anything but the list link. To me, that is a very
>> different situation.
>
> I mean, even Page is kind of an example like that.
>
> Pages are refcounted, but when you have a higher-order page, the
> __free_pages() call does something special beyond what put_page(). For
> example, if you have an order-2 page, which consists of 4 pages, then
> the refcount only keeps the first page alive, and __free_pages() frees
> the 3 extra pages right away even if refcount is still non-zero. The
> first page then stays alive until the last put_page() is called.

I see. We currently only support order 0 pages. I think we can handle
this situation later, if we need to handle higher order pages.

In that case, we could hand out `Owned<Page>` for the head page and then
provide some way of getting a `&Page` for the tail pages. Obtaining
`Owned<Page>` for a tail page does not make sense.

More likely we will build an abstraction for `struct folio`. We can
still hand some kind of page reference for tail pages from an `Owned<Folio>`.

Best regards,
Andreas Hindborg


