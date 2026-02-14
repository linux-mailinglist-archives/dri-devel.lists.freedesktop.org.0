Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMqAB0O9j2niTAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 01:09:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDD13A1BA
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 01:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4387410E0A9;
	Sat, 14 Feb 2026 00:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tV504CF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7959B10E0A9;
 Sat, 14 Feb 2026 00:09:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4125E437A6;
 Sat, 14 Feb 2026 00:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C12C116C6;
 Sat, 14 Feb 2026 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771027774;
 bh=xyOf2fWzxOJtK+0/50LLyIpdNvmN+b5hy/uifQGZjmQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=tV504CF88KgFFS510W5jd2+qGEBjYaza1H2B2t7tNFoBa/mtIW7CZIkMfhRuiYPTC
 RLI7N7oV+LDSoTXSyuKAl0xIB/QUTFX74G7fFiUhicLCE64SXyXbBsgLQEaeHWIl9H
 3H82IJgJKq9dMJO2cA1RmKdbMr3MN682E/w/CjGi2D16unBrQAO8f5FuN3ZAJX4eqc
 0bEgVMYRseIB2dFGRH3UJp+2Zix3Xcw3Kk+NwtPqEevpzOxrd7hutHcAff5K/n8oaT
 aM4Hd51G1XPaAPML5gsnCbTD4FiKrYScayQfdn1juepXEq19F5f03aTkkcnCRRhOUN
 hFOBpuP/mnRgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:09:28 +0100
Message-Id: <DGE8Y55O5445.D6KRXL724153@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>, <tim.kovalenko@proton.me>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
In-Reply-To: <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel,tim.kovalenko.proton.me];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zulipchat.com:url]
X-Rspamd-Queue-Id: A0FDD13A1BA
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
> (Sorry Danilo, resending as I didn't hit "Reply All". I was travelling=20
> and not on my usual email setup).

No worries, just noticed it before hitting "send". :)

> If you prefer, I can send out a version with just improved projections wi=
thout
> all the generic I/O improvement stuff.

Yes, that would be great. Otherwise, we can also use as_slice_mut() to avoi=
d
having to touch field_write() directly, but I much prefer the former.

In any case, I'd like to keep the PteArray type. It can at least provide a
function to calculate the value from the DMA address for a given index.

(Would be nice if we'd have something like a dma::Projection<T> type, such =
that we
could have PteArray::init(self: dma::Projection<Self>).)

> I've already suggested that in
> https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/.6=
0Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570456463.
> The issue is that however the PTE array needs the actual DMA address to
> initialize, which Alex and I feel that we shouldn't provide to the initia=
lizer
> when `dma::CoherentAllocation` is not yet constructed.

Ah, indeed -- that sucks.

And yes, it would be super pointless to give out the actual DMA address in =
the
initializer, as it would defeat its whole purpose. :)
