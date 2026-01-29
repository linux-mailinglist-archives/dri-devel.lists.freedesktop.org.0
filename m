Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oi42A9CnemkK9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:20:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B13AA35C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5EE10E2F0;
	Thu, 29 Jan 2026 00:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJVinoa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF010E2F0;
 Thu, 29 Jan 2026 00:20:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71F7A6001A;
 Thu, 29 Jan 2026 00:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5174C4CEF1;
 Thu, 29 Jan 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769646025;
 bh=Lpd9kC+1aougw4btdvzon7ENBBCLCGY+Jd5QG33v4yw=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=bJVinoa06mK4xDCvuVXnFC/HzeXb5E5HreC05Ge7Gbap+2Ww2i1UazpaSSuCwpbxX
 prY4MV0AbboQIm7vAP+TP3ycwQ0JJMqBwzQqF/3LWLYE25Cvi/QLp3qZjaHPMubdAl
 RHrTVZI5hWzMVTNqcYq4RSuckDQCz9eYgIceqaB9e5CsCzioNaOl2vsIjQb2x936Q5
 yvt6K+CGz0VTgy45y+Wm1TbAEerZjmxQkMUQsCoI3qii5c+y9JlOI9R9aGW84ddTNl
 6xA7u54/EFrClsJyDkB8/vijBmalgJ3b/wVJcQL1pQwZoK+tLWgF21G12W1J8RxAi3
 fR/ne5i7l1Zsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:20:18 +0100
Message-Id: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
In-Reply-To: <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 80B13AA35C
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &V=
bios, cmd: FwsecCommand) -> Re
>>>           let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>>           let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>>>  =20
>>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size()=
 + desc.interface_offset());
>>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>>=20
>> I do get the idea behind those comments, but are we sure that's really a=
 good
>> idea? How do we ensure to keep them up to date in case we have to change=
 the
>> code?
>>=20
>> If we really want this, I'd at least chose a common syntax, e.g.
>>=20
>> 	// CALC: `imem_load_size + interface_offset`
>>=20
>> without the variable name the resulting value is assigned to.
>>=20
>> But I'd rather prefer to just drop those comments.
> The idea of adding these comments was to improve readability. However, I=
=20
> can drop them in the v3, that's fine with me.

Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
concerned about the comments getting outdated or inconsistent over time.

Besides that, it more seems like something your favorite editor should help=
 with
instead.

> Do you want me to wait for additional comments on this series, or should=
=20
> I make the update and repost it?  Thanks,

As mentioned, I tend to think we should just drop them, but I'm happy to he=
ar
some more opinions on this if any.
