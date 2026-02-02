Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GQIBAjDgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:30:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C952CE41E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A4210E4F8;
	Mon,  2 Feb 2026 15:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qh+AvGco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7DC10E4F8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770046210;
 bh=NhgHDfuOdnhZ8vjAEapUw39dYzKBpvAT7v6UDxWFAn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qh+AvGco/f9rLQHbiNF7UQcW7NqsHLSI6VMBW771EKwBaBvLvNjTipWPEo/SxDSan
 1QobQMP9e5IlbN85C9cUbmS85pQsM+h2KvkgY7m7Lp5rOO81jFL8o6Kq0wgAF0/ihI
 BWQwUY7wDL1YpBkCSMc0XUWDbF4BHRKJ+HdbgyF7MzJvqwDGO4I7MMws+LRyyhtr5t
 zjPe5uuE4XPcGRNcbgG2aB7tor5+SeCOiIZLV7JbDwdEsgCglvoewI9W8ZaY3Izw1w
 mQW3VMU4sA9iPKJmjxISYJmQAtHG+5+NgK7+9trwI+R+dCcA7rM7eoJasq2OrqfSk9
 +X4pFInywX/0g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4040017E0E4C;
 Mon,  2 Feb 2026 16:30:09 +0100 (CET)
Date: Mon, 2 Feb 2026 16:30:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Alice
 Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, Asahi
 Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Asahi Lina
 <lina+kernel@asahilina.net>, Viresh Kumar <viresh.kumar@linaro.org>, Tamir
 Duberstein <tamird@gmail.com>, Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v6 5/8] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
Message-ID: <20260202163006.6f83f44c@fedora>
In-Reply-To: <20251202220924.520644-6-lyude@redhat.com>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-6-lyude@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:lina@asahilina.net,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:tamird@gmail.com,m:shankari.ak0208@gmail.com,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,google.com,collabora.com,kernel.org,asahilina.net,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,linuxfoundation.org,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 9C952CE41E
X-Rspamd-Action: no action

Hello Lyude,

On Tue,  2 Dec 2025 17:03:31 -0500
Lyude Paul <lyude@redhat.com> wrote:

> +#[pin_data]
> +pub struct Object<T: DriverObject> {
> +    #[pin]
> +    obj: Opaque<bindings::drm_gem_shmem_object>,
> +    // Parent object that owns this object's DMA reservation object
> +    parent_resv_obj: Option<ARef<Object<T>>>,
> +    #[pin]
> +    inner: T,
> +}
> +
> +super::impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);

As part of our integration in Tyr, we noticed we'll need Object<T> to
be Sync+Send. Given T already has to be Sync+Send (part of
the DriverObject trait constraints), it shouldn't be a problem to have
Object<T> implement Sync+Send too, since, AFAICT, all the functions in
the Object<T> are thread-safe (resv lock held when acting on the
underlying BO, either explicitly, or implicitly through the C API).

Regards,

Boris
