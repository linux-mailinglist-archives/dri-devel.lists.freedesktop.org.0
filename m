Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMXnH79+lGmnFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:44:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38F14D40B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5079710E4E1;
	Tue, 17 Feb 2026 14:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vFMNHvzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DD310E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:44:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD36244261;
 Tue, 17 Feb 2026 14:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCB1C19423;
 Tue, 17 Feb 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771339450;
 bh=2oWspgWTfE+doh9thO9zPOHhPUiiYxuk5CyDdkfhIGU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=vFMNHvzrm2jgRRVOmO3s1u9p9VVJsONAB0DSWBycXzQAqCzP9QZzGoSKf5wzBQmVP
 GskIxynLrc+vHumnPJhQem4AWqfBUiK0vkC8QRxC/hQmb5EthJ/+lhSLBMbkaAoJaq
 mWkhl6heqF0IBTsysAkViSTXZQERtDBAQBkh59YQ8ofeS5QNseVuLbTTbGtk5exGeW
 sw4lj6whYmiw6ZVouyOInxEk6t/DUJdjPv9zPKBJkzKtaQZFmizY8peK0z7JTemoOx
 8J/PJz99G5zgdHYG2NP1qjUO/yaqa+fsKkJUb+7rlIpliMd00kVL8toyjs2U4c+pgT
 HxZqwTigvmVCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 15:44:06 +0100
Message-Id: <DGHBFFSLQH1F.162H7FOVAS22B@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: <phasta@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Alice Ryhl" <aliceryhl@google.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
 <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
In-Reply-To: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,google.com,collabora.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:phasta@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0A38F14D40B
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 3:28 PM CET, Philipp Stanner wrote:
> OK, maybe I'm lost, but what delayed_work?
>
> The jobqueue's delayed work item gets either created on JQ::new() or in
> jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=93=
 implement a
> delayed work in its timeout callback?
>
> That doesn't make sense.
>
> JQ notifies the driver from its delayed_work through
> timeout_callback(), and in that callback the driver closes the
> associated firmware ring.
>
> And it drops the JQ. So it is gone. A new JQ will get a new timeout
> work item.
>
> That's basically all the driver must ever do. Maybe some logging and
> stuff.
>
> With firmware scheduling it should really be that simple.
>
> And signalling / notifying userspace gets done by jobqueue.
>
> Right?

Well, the timeout path is part of the fence signaling critical section unti=
l all
fences have been signaled.

But, if I, for instance, just kick off another work from the timeout handle=
r and
subsequently signal all fences by dropping the JQ, this other work must not=
 play
after DMA fence signaling rules anymore and is free to do whatever (maybe e=
ven
take a device coredump without needing GFP_NOWAIT).

Xe does this with xe_devcoredump_deferred_snap_work for instance.

>> You also potentially want device core dumps. Those usually use GFP_NOWAI=
T so
>> that they can't cycle back and wait for some fence. The down side is tha=
t
>> they can trivially fail under even light memory pressure.
>
> Simply logging into dmesg should do the trick, shouldn't it?

You can't "log" a device coredump into dmesg. :)
