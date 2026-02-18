Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN/4IANKlmngdQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:23:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E915AEA8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 00:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8410F10E04A;
	Wed, 18 Feb 2026 23:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nUrVkqPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24610E04A;
 Wed, 18 Feb 2026 23:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2BFB743FD0;
 Wed, 18 Feb 2026 23:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82C0C116D0;
 Wed, 18 Feb 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771457022;
 bh=q0iO2ljlV0MFFC/vV07sdCxQMgbw432DuvfkuBRn4gM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nUrVkqPgItrxOCe2NunlWOI0X9iDkWaR4VmlQaUZSP4r4ilF6N5RCnEglIFzPNfrL
 4Z7srVAihVudfix6XmV0DyQ+7aL5Cl5bN6HoaWPId2Hx3+lbkn3enPSIcVDlXlXeeJ
 bzqHJrtsT6U2EdBGpgqqZ1BQ8Wzkk2esZTl2qqO88aO3DmksX1IXhfx7yHjbT8jzlE
 xCaZGZYeVeOsRIJGf3FieWCvsNsiFah6GG4LghXL2ZzR4SxsXZlPDJ7Fsn7t+1zx/M
 BOBYZ8ETtM3cOzHTP3sux4V43fMFPu7kjYnsvvD6gf94xmxXNwFD3vegP/Dn/jxPF4
 BSeK+u19tQ7yg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 00:23:36 +0100
Message-Id: <DGIH3QYWSOG9.2E6DVO2CNGOHI@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Tim Kovalenko via B4 Relay" <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,tim.kovalenko.proton.me];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E04E915AEA8
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> Changes in v3:
> - Addressed the comments and re-instated the PteArray type.
> - PteArray now uses `init` instead of `new` where it writes to `self`
>   page by page.
> - PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_m=
ut`.
>
> I hope I understood everything in the V2 email chain and implemented it c=
orrectly :)

What I meant in the v2 discussion is that we can see how the patch series f=
rom
Gary [1] goes and once landed base this fix on top of it, so we can avoid a=
n
intermediate (conflicting) solution.

If, for some reason, [1] does not progress as expected, we could still fall=
 back
to using as_slice_mut(). So, given that this fix is not super urgent, the i=
dea
is to wait a bit, see how things go and then take the corresponding directi=
on.

But don't worry, this is your first contribution and it is not on you at al=
l --
I should have explained it better.

For now I suggest to wait a bit more, see how [1] goes and then let's follo=
w up
on this.

Thanks,
Danilo

> - Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094=
f78721a@proton.me

[1] https://lore.kernel.org/rust-for-linux/20260214053344.1994776-1-gary@ga=
ryguo.net/
