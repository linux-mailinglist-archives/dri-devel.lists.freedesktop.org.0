Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOOhDC+mjGnVrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC829125DE0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65E10E627;
	Wed, 11 Feb 2026 15:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bSYf7r3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2001610E623
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:54:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF6F043EA0;
 Wed, 11 Feb 2026 15:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9AEC4CEF7;
 Wed, 11 Feb 2026 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770825258;
 bh=XJIA8EDuYw4A7eKIj4JUJHIaDE0zJ4PIbTD3LegeG3c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=bSYf7r3uFh8NBEonzIuBMWBoBL2QNzzVHAJLQw5gripUbEaTbSmiN6aQgjGI2Z46i
 pwTZ7UuS8jSCoQroik4oWWlY479jnDilqVDx++npn5j4Lc9vGV+YNziPTxmvLAY6AY
 6PmoSiyN/8D1d0QjZt5GANSnIgC3p8NQU8kCLY19stHIYswYUr1nS6I6pwigs8MYIg
 5+MahKe6a8s5O8NcS6w1SRa2zNe/eHFjc2PZ7At81OGpodImpqpJkAzsj3F4GqRfxR
 U0HckYkfAI+N4K//v8g8iNLLkqAZFDWvGkqsM3IOtQSC3z3PK4Fsr0zAz288YoQ1qu
 tE/Ts3m30/lvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 16:54:14 +0100
Message-Id: <DGC95VFNOLZI.ZGK7O5OIZVR@kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Cc: <phasta@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Gary Guo" <gary@garyguo.net>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Benno Lossin" <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
 <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:gary@garyguo.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:phasta@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,collabora.com,garyguo.net,gmail.com,ffwll.ch,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC829125DE0
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 4:20 PM CET, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
>> On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
>> >=20
>> > Back to this particular job dependencies use case: we have to embed th=
e
>> > DmaFence pointer in some wrapper with the ListLinks element anyway,
>> > because DmaFences can be inserted in multiple of those lists in
>> > parallel.
>>=20
>> Okay, if that's the case, then the linked list is *really* not the right
>> tool for the job.
>
> We have to distinguish what we are talking about here.
>
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.

You mean it wraps the ARef<DmaFence> into a struct Dependency which has its=
 own
ListLinks.

But this requires an additional allocation for every dependency, whereas wi=
th
xarray you can just store the pointer directly in the xarray with
ARef::into_raw().

I.e. it scales much better than lists for this use-case.
