Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNCNOKlqpGnwgAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:34:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBA1D0A5B
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 17:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45A710E326;
	Sun,  1 Mar 2026 16:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TKgzX0hf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A910E326
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 16:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4618A600AD;
 Sun,  1 Mar 2026 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC44C116C6;
 Sun,  1 Mar 2026 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772382883;
 bh=je5mLoR2Jxu2IjLDAPypnbsm91i4Kuu9GRu6352moZk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TKgzX0hf3d0lhMQetjAEiiWCOKnFnzvXZWHgmPaqhbewdN3fJRosoCZCc9qBvc/po
 evHx93y+6jGFm1MG3XNqYQsOr8ddGPjYTtni3MBr4+Wfeg0Bdp7DgyJtpeSaRoBKsq
 /8EmI4goKRcWrT+Ty8VXffQn9jZgFIq3COzQDhZXz+v1zP/sZmvi7J3/9qpNTmJlXX
 dvga5zyWNUWjv9DVOk3rU4gbLyOte0fKmobQCF487i0iZ6UJJpeiE7pdPHIoBrDEge
 JZG83Fy8G1/GE+0kCzgow04ihq31SX509/egQfJwEahHcltsBfRDzs14I3kQCC0Q4D
 NTYljGVX/IW5w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge
 Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Igor Korotin <igor.korotin.linux@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Uladzislau
 Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v16 01/10] rust: alloc: add `KBox::into_nonnull`
In-Reply-To: <DGRHAEM7OFBD.27RUUCHCRHI6K@garyguo.net>
References: <20260224-unique-ref-v16-0-c21afcb118d3@kernel.org>
 <20260224-unique-ref-v16-1-c21afcb118d3@kernel.org>
 <eeDADnWQGSX9PG7jNOEyh9Z-iXlTEy6eK8CZ-KE7UWlWo-TJy15t_R1SkLj-Zway00qMRKkb0xBdxADLH766dA==@protonmail.internalid>
 <DGRHAEM7OFBD.27RUUCHCRHI6K@garyguo.net>
Date: Sun, 01 Mar 2026 17:34:26 +0100
Message-ID: <87ldgbbjal.fsf@t14s.mail-host-address-is-not-set>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:ojeda@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:vbabka@suse.cz,m:urezki@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:igorkorotinlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E5CBA1D0A5B
X-Rspamd-Action: no action

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Feb 24, 2026 at 11:17 AM GMT, Andreas Hindborg wrote:
>> Add a method to consume a `Box<T, A>` and return a `NonNull<T>`. This
>> is a convenience wrapper around `Self::into_raw` for callers that need
>> a `NonNull` pointer rather than a raw pointer.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/alloc/kbox.rs | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
>> index 622b3529edfcb..e6efdd572aeea 100644
>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -213,6 +213,14 @@ pub fn leak<'a>(b: Self) -> &'a mut T {
>>          // which points to an initialized instance of `T`.
>>          unsafe { &mut *Box::into_raw(b) }
>>      }
>> +
>> +    /// Consumes the `Box<T,A>` and returns a `NonNull<T>`.
>> +    ///
>> +    /// Like [`Self::into_raw`], but returns a `NonNull`.
>> +    pub fn into_nonnull(b: Self) -> NonNull<T> {
>> +        // SAFETY: `KBox::into_raw` returns a valid pointer.
>> +        unsafe { NonNull::new_unchecked(Self::into_raw(b)) }
>> +    }
>
> Hi Andreas,
>
> It looks like this patch and many others in the series are missing `#[inline]`
> for quite a few very simple functions. Could you go through the series and mark
> small functions as such?

Sure.

Could you remind me why we need this directive? Would the compiler not
be able to decide?

I know we have an issue when we have call to C function in short
functions, but not in the general case?


Best regards,
Andreas Hindborg



