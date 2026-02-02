Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBV9HhGhgGni/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 14:05:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC125CC942
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 14:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C997510E00D;
	Mon,  2 Feb 2026 13:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FdM2WSOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB6410E4C5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 13:05:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63AC5600C3;
 Mon,  2 Feb 2026 13:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5443BC116C6;
 Mon,  2 Feb 2026 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770037514;
 bh=EA8qmHxvlMjKBeqgsh6FoAR2kX5IcYCMu3Q/fDbz/zg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FdM2WSOEpeVQ0G9EyU21z1S0Lc0i5nKom3jrdf4XT0vgxVkmSvVv01d7Bbqzor4Fr
 CKetcy6KuujlK1hofUqZhdONhdECK3R68Fs7v//6QJguXupZST0CUs8zTOP9DioDPT
 IUnmq8kMggsi9hM/2sWsGOulgfdLPcK393LWYJkIgu+PxzntGjJR8JkaKZmODhjqMr
 4Ea8+agyrb3fZaidYMXZ95Vvnc/vkji4291P5tmXEeFMR/upeh++8DYO0R1c5Phm5z
 UTz1+AHlfwlF8f9Wzh344oXZckqGRPiIKrhA4666Jd7Zkj638nJsu/G51PO4f0Yq98
 RRwcBhArrCJpQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Oliver Mangold
 <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Paul
 Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Asahi
 Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-security-module@vger.kernel.org
Subject: Re: [PATCH v13 1/4] rust: types: Add Ownable/Owned types
In-Reply-To: <DG4H66NZ5ME0.3M9CQY1ER4Q0X@garyguo.net>
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
 <20251117-unique-ref-v13-1-b5b243df1250@pm.me>
 <20251201155135.2b9c4084.gary@garyguo.net>
 <87343jqydo.fsf@t14s.mail-host-address-is-not-set>
 <rHWhMe7C5fnwgGCnKS4N7G90SrX0Ao8332cwKPH2o-Em_lCBG3lm_erDn9dtg55SpjMFQQoJ_hhDU3bKOdYfAQ==@protonmail.internalid>
 <DG4H66NZ5ME0.3M9CQY1ER4Q0X@garyguo.net>
Date: Mon, 02 Feb 2026 14:04:56 +0100
Message-ID: <87o6m7pa87.fsf@t14s.mail-host-address-is-not-set>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:oliver.mangold@pm.me,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:lossin@kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:rafael@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:lina+kernel@asahilina.net,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-security-module@vger.kernel.
 org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,linux.intel.com,suse.de,ffwll.ch,zeniv.linux.org.uk,suse.cz,oracle.com,ti.com,paul-moore.com,asahilina.net,vger.kernel.org,lists.freedesktop.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CC125CC942
X-Rspamd-Action: no action

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Feb 2, 2026 at 9:37 AM GMT, Andreas Hindborg wrote:
>> Gary Guo <gary@garyguo.net> writes:
>>
>>> On Mon, 17 Nov 2025 10:07:40 +0000
>>> Oliver Mangold <oliver.mangold@pm.me> wrote:
>>>
>>>> From: Asahi Lina <lina+kernel@asahilina.net>

<cut>

>>>> +impl<T: Ownable> Owned<T> {
>>>> +    /// Creates a new instance of [`Owned`].
>>>> +    ///
>>>> +    /// It takes over ownership of the underlying object.
>>>> +    ///
>>>> +    /// # Safety
>>>> +    ///
>>>> +    /// Callers must ensure that:
>>>> +    /// - `ptr` points to a valid instance of `T`.
>>>> +    /// - Ownership of the underlying `T` can be transferred to the `Self<T>` (i.e. operations
>>>> +    ///   which require ownership will be safe).
>>>> +    /// - No other Rust references to the underlying object exist. This implies that the underlying
>>>> +    ///   object is not accessed through `ptr` anymore after the function call (at least until the
>>>> +    ///   the `Self<T>` is dropped.
>>>
>>> Is this correct? If `Self<T>` is dropped then `T::release` is called so
>>> the pointer should also not be accessed further?
>>
>> I can't follow you point here. Are you saying that the requirement is
>> wrong because `T::release` will access the object by reference? If so,
>> that is part of `Owned<_>::drop`, which is explicitly mentioned in the
>> comment (until .. dropped).
>
> I meant that the `Self<T>` is dropped, the object is destroyed so it should also
> not be accessed further. Perhaps just remove the "(at least ...)" part from
> comment.

Right, got it. The "until.." is in place to allow reuse of the
allocation. There is no requirement here to drop `T` via the `release`
method when an `Owned<T>` is dropped. Implementers are free to implement
schemes that reuse the object without drop and re-init. This can be used
in object caches such as for the block request cache.

>
>>
>>>
>>>> +    /// - The C code follows the usual shared reference requirements. That is, the kernel will never
>>>> +    ///   mutate or free the underlying object (excluding interior mutability that follows the usual
>>>> +    ///   rules) while Rust owns it.
>>>
>>> The concept "interior mutability" doesn't really exist on the C side.
>>> Also, use of interior mutability (by UnsafeCell) would be incorrect if
>>> the type is implemented in the rust side (as this requires a
>>> UnsafePinned).
>>>
>>> Interior mutability means things can be mutated behind a shared
>>> reference -- however in this case, we have a mutable reference (either
>>> `Pin<&mut Self>` or `&mut Self`)!
>>>
>>> Perhaps together with the next line, they could be just phrased like
>>> this?
>>>
>>> - The underlying object must not be accessed (read or mutated) through
>>>   any pointer other than the created `Owned<T>`.
>>>   Opt-out is still possbile similar to a mutable reference (e.g. by
>>>   using p`Opaque`]).
>>>
>>> I think we should just tell the user "this is just a unique reference
>>> similar to &mut". They should be able to deduce that all the `!Unpin`
>>> that opts out from uniqueness of mutable reference applies here too.
>>
>> I agree. I would suggest updating the struct documentation:
>>
>>     @@ -108,7 +108,7 @@ pub unsafe trait Ownable {
>>         unsafe fn release(this: NonNull<Self>);
>>     }
>>
>>     -/// An owned reference to an owned `T`.
>>     +/// An mutable reference to an owned `T`.
>>     ///
>>     /// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
>>     /// dropped.
>>
>> And then the safety requirement as
>>
>>  An `Owned<T>` is a mutable reference to the underlying object. As such,
>>  the object must not be accessed (read or mutated) through any pointer
>>  other than the created `Owned<T>`. Opt-out is still possbile similar to
>>  a mutable reference (e.g. by using [`Opaque`]).
>
> Sounds good to me.

OK.

>
>>
>>
>>>> +    /// - In case `T` implements [`Unpin`] the previous requirement is extended from shared to
>>>> +    ///   mutable reference requirements. That is, the kernel will not mutate or free the underlying
>>>> +    ///   object and is okay with it being modified by Rust code.
>>>
>>> - If `T` implements [`Unpin`], the structure must not be mutated for
>>>   the entire lifetime of `Owned<T>`.
>>
>> Would it be OK to just write "If `T: Unpin`, the ..."?
>>
>> Again, opt out is possible, right?
>>
>
> When the "mutable reference" framing above I think you can just drop this part.

Agreed.

>
>>>
>>>> +    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>>>
>>> This needs a (rather trivial) INVARIANT comment.
>>
>> OK.
>>
>>>
>>>> +        Self {
>>>> +            ptr,
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /// Consumes the [`Owned`], returning a raw pointer.
>>>> +    ///
>>>> +    /// This function does not actually relinquish ownership of the object. After calling this
>>>
>>> Perhaps "relinquish" isn't the best word here? In my mental model
>>> this function is pretty much relinquishing ownership as `Owned<T>` no
>>> longer exists. It just doesn't release the object.
>>
>> How about this:
>>
>>
>>     /// Consumes the [`Owned`], returning a raw pointer.
>>     ///
>>     /// This function does not drop the underlying `T`. When this function returns, ownership of the
>>     /// underlying `T` is with the caller.
>
> SGTM.

OK.


Best regards,
Andreas Hindborg


