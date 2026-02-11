Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NT/Mk6djGmPrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:16:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E0A125890
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DE110E008;
	Wed, 11 Feb 2026 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qb0jaNmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203B510E008
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:16:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBE1960018;
 Wed, 11 Feb 2026 15:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754D3C4CEF7;
 Wed, 11 Feb 2026 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770822985;
 bh=hZJ5H7P+c7sLl4niQJXf9CZ5lH2NB8YyuYiSe4B/q9s=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=Qb0jaNmbX+5NERHoK1/3NX97zwiyUKtLreH96hzA5/gN+dn65EnMmpICHmFfvKtN5
 vdCLPYHpR4kaCqVsK+lstfcjT2NQjihQR9pA9YcXKnsb1q03G9z3rPK1OSWQWMSnlV
 s2N+Uus0LI/k/czsGLHjTUInBapAnMfFw9iVdqYSYEFe4vBDGnGPgHPXJXj+tqCuPx
 tNsuKzjPdIUmw14A/NpLZv8FK8EZagrAaH62aiDL1UvbPl4tU9Bg8ROUDv6Plm1evk
 3KTRkxkaaorcGLw08YSsUYlawYYCOQx4NKawxoaIWBRzgQ0MjMelqWzzr49kZr5hJO
 CmQkVPgaqTUwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 16:16:20 +0100
Message-Id: <DGC8CUUJCDKJ.5XVHXB6I6V5F@kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora> <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
 <20260211121223.78674f22@fedora> <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
 <20260211160059.6e0d3b60@fedora> <DGC84SJI67NG.5QGAR13XBM75@kernel.org>
 <20260211161444.3d170ea1@fedora>
In-Reply-To: <20260211161444.3d170ea1@fedora>
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[google.com,amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 50E0A125890
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 4:14 PM CET, Boris Brezillon wrote:
> Okay, that would be one DmaFenceWorkqueue only used for the driver
> JobQueue instances (or one per-instance if the driver wants that)
> wrapped into some object that doesn't expose it as a generic workqueue,
> so only JobQueue instances can use it. And then drivers are free to
> instantiate their own DmaFenceWorkqueue for anything else that's
> still in the DMA-signalling path, but not directly related to
> JobQueues. I think I'd be fine with that.

Yes, that sounds good to me.
