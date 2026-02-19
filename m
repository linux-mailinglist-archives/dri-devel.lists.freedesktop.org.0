Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KstN1w5l2l2vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:25:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE91160A3E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DC810E714;
	Thu, 19 Feb 2026 16:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lIboqRIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34CD10E714;
 Thu, 19 Feb 2026 16:24:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CE3543966;
 Thu, 19 Feb 2026 16:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD2C4CEF7;
 Thu, 19 Feb 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771518296;
 bh=OCRBu9qsD2GHhHV+NJGvV6X8iN1sZS9eqVlDPCtnB9E=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=lIboqRIWWI0Nl11/uAb1VygPApq8lQgg+bC6qBlJREYwyEDXFh+Dofxp3rOm5PPWC
 dLp215UoDS1K1KqVDFaU6waG4ydZq2m1U7C3dGvt1uQ8i6w2xDBLqgkG3mrxcMgHse
 tlDJsS1OHKsdaa0Etb6zN7zn2l9MBt4WUK89r0gxOryHFoRNRHpssPK4uLayAAZZzQ
 JdLWT3UZXTBrmlJET+6UvN8q6ZcBfYRVtI3ZYR3nCQCCM2tYtkag39OXGCG9l1D7Eg
 YUwwql64EkbFNnVDCrsWk8iMbekXQtMs24PBIhpmiIbo2aG+q34Uw9lBE+0NgAZaMY
 +5djkniION80w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:24:50 +0100
Message-Id: <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Dave Airlie"
 <airlied@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
In-Reply-To: <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3AE91160A3E
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>
>
> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>> +RUST TO C LIST INTERFACES
>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you wa=
nt to
>>> sign up for looking after FFI helper infrastructure in general)?
>>
>> Good idea, done.
>
> Actually, I am not sure we want to commit to entire RUST FFI infra though=
 its
> pretty tiny right now. Most of this infra right now is clist, let us star=
t with
> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIS=
T
> INTERFACES [RUST]" sections.

I feel like it makes a bit more sense to have an entry for the entire class=
 of
"RUST [FFI]" infrastructure.

I could imagine that we will find quite some more cases where an FFI abstra=
ction
layer makes sense; at some point it might even go the other way around.

Once that happens, I think it would be good to have people looking after
intermediate FFI layers in general. But it does not have to be you of cours=
e.

Maybe we can create the "RUST [FFI]" entry already with the following
constraint:

	RUST [FFI]
	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
	L:	rust-for-linux@vger.kernel.org
	S:	Maintained
	F:	rust/kernel/ffi/
