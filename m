Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dVmkBYyljGnErwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:51:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817DC125DAC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBF68905A;
	Wed, 11 Feb 2026 15:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CNDcXoyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB728905A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770825093;
 bh=Iey+EChssgWRCogmVNhp2zKX7+c9DLDfWteHuP7l6NE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CNDcXoyKyfmyh3YVu9cXAANvfM/X8USP/9da2lw+3wSnAp9dQnSUnVO2PdWgTAqJo
 xY5LR0A+sjgu5c1FbewjiapYQB2ly/2vsNDY4tWZZC3RVKJCTSV20sWIBULJ4Tzick
 rzBX92qVlROwMJn6g3CHq21gSmeZ+9D2IfMVCMtSTTi2vprji9Y1G4g9DJpCSSI9Py
 n3AZbuICn8C/7rIfH/udwwtkXayKytCzpNYsZ8cIaN35HyYoA5U5tLNDnGxinpEOMK
 DepTw4swRHXtYIznt22FCJ/l+LnMmG8Ey9ppOXVIqXIEoVBfxFxFiG3EB39voF1l81
 oum8a8TZJmDlQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F51117E1144;
 Wed, 11 Feb 2026 16:51:32 +0100 (CET)
Date: Wed, 11 Feb 2026 16:51:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>, Gary Guo
 <gary@garyguo.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211165127.19f2f56e@fedora>
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com>
 <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
 <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,garyguo.net,gmail.com,ffwll.ch,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim,mailbox.org:email]
X-Rspamd-Queue-Id: 817DC125DAC
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 16:20:15 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:  
> > > 
> > > Back to this particular job dependencies use case: we have to embed the
> > > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > > because DmaFences can be inserted in multiple of those lists in
> > > parallel.  
> > 
> > Okay, if that's the case, then the linked list is *really* not the right
> > tool for the job.  
> 
> We have to distinguish what we are talking about here.
> 
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.
> 
> Whether the driver has other clones of that fence in other list is not
> relevant because it's not the same list head.
> 
> JQ's lists and list heads are internal.
> 
> I don't see a problem.

Both the list and xarray-based implementions will work, but what you end
up with when you use a list is items that look like:

struct Dependency {
	// Two pointers to insert the element in the list
	link: ListLinks,

	// The pointer to your fence
	fence: ARef<DmaFence>,
}

vs just the ARef<DmaFence> that's stored as a ForeignOwnable pointer in
some xarray entry. So the list overhead is still very much present, with
none of the benefits of the direct access you'd get if you were having
something like:

struct DmaFence {
	// Two pointers to insert the element in the list dependency
	list link: ListLinks,

	// Put the rest of the DmaFence stuff there
	...
}

which you can't have because a DmaFence can be in multiple dependency
lists at the same time.
