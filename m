Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fd8VNunBj2mfTQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 01:29:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12C13A25B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 01:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E175910E840;
	Sat, 14 Feb 2026 00:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JUITrCym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE1810E840;
 Sat, 14 Feb 2026 00:29:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 544C960054;
 Sat, 14 Feb 2026 00:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EB1C116C6;
 Sat, 14 Feb 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771028963;
 bh=YvsPEh6HCGUHqoLXvFZixMboBz4g8kUXgB9HcJr15SU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=JUITrCymFE8WY9hXlJPFWo1wD9IY5UpE/H2jZVoxtblH62tkk274itODMFESplm7R
 fvoFDorHMV1IMoUHzdUuLjF6/9W1vBitY/h0vpZPMLunQcJv4nwUA4ryOAuPnwXZuB
 3qEgddDEJRyVY+9v4uogaxdb8yxJKBN/4eSE7moAiWHHqjZf5j1JNrd584FEjIUHJ8
 17IWEhk/D5TvGOh95pox7cFI13u31SPRGocJn2nf9LjLt0NaoBeLEcbGpHr1kJhZzq
 dvcj9/pFauSyKNtGq6PVF5CzhyGS7l+5XMWRf6+NZUlQJw0+bzgaC1VrmqlOOFteTv
 Yh63U7tikoLJQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:29:18 +0100
Message-Id: <DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org>
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
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
 <DGE8Y55O5445.D6KRXL724153@kernel.org>
 <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
In-Reply-To: <1b7adbcbb4405fdc3e8ea7d3cc0dc526@garyguo.net>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel,tim.kovalenko.proton.me];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4E12C13A25B
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 1:18 AM CET, Gary Guo wrote:
> On 2026-02-14 00:09, Danilo Krummrich wrote:
>> On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
>>> If you prefer, I can send out a version with just improved projections=
=20
>>> without
>>> all the generic I/O improvement stuff.
>>=20
>> Yes, that would be great. Otherwise, we can also use as_slice_mut() to=
=20
>> avoid
>> having to touch field_write() directly, but I much prefer the former.
>>=20
>> In any case, I'd like to keep the PteArray type. It can at least=20
>> provide a
>> function to calculate the value from the DMA address for a given index.
>>=20
>> (Would be nice if we'd have something like a dma::Projection<T> type,=20
>> such that we
>> could have PteArray::init(self: dma::Projection<Self>).)
>
> I think once I/O projection work is done, this would just be
>
> impl PteArray {
>      fn init<Base>(self: io::View<'_, Base, Self>>, dma: DmaAddress)
> }
>
> and the generic I/O projection is used inside.

I guess I should have written "Would be nice if we'd have something like a
dma::Projection<T> type *already* [...]", i.e. I meant to say that this way=
 we
could remain close to what the final implementation will look like eventual=
ly.
:)
