Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCInOaM2o2nP+QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 19:40:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607E11C61A5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 19:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F3C10E05A;
	Sat, 28 Feb 2026 18:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j/InzrVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F110E05A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 18:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A332F60008;
 Sat, 28 Feb 2026 18:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F95C19423;
 Sat, 28 Feb 2026 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772304030;
 bh=1MGoOeWO4a7jzpvdquCXe6JL9LK4o55NoxWsra1wzgs=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=j/InzrVodnQsLneccidK60stBfW++8hhtyv7LFiOjfZZ9tCIY56BLd/YAo1sX6ZFg
 zqrgiEZjHvKNc+JsvHiDprdj44UmhpbHicQ0n0/xe2tbwDuHca1uMyL/hKq7eXaj52
 HV/H4PyPgAMege1M57xWBvGHUtGjzYn+IHv5uir1LCtwNsVxtOpOTUgXJHBUyLohpf
 b7kGQCYIVLnQgEegoI9Kbm4rK55hQ53PUoPSmWau+v6va61MAcYtjNxiUpECBT96m3
 WY8VzpQdCmbY1JIieTkbsnyjfKVGMMr0QB+3xfNXlO6VvDiAvwIbKf/qNL8NjYW1LO
 3GmoYwJLkxnHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 19:40:26 +0100
Message-Id: <DGQTCDOIVTHW.3OGUVXRS496FP@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: drm: dispatch work items to the private data
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-2-bec25b012d2a@collabora.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel.almeida@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 607E11C61A5
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 9:40 PM CET, Daniel Almeida wrote:
> This implementation dispatches any work enqueued on ARef<drm::Device<T>> =
to
> its driver-provided handler. It does so by building upon the newly-added
> ARef<T> support in workqueue.rs in order to call into the driver
> implementations for work_container_of and raw_get_work.
>
> This is notably important for work items that need access to the drm
> device, as it was not possible to enqueue work on a ARef<drm::Device<T>>
> previously without failing the orphan rule.
>
> The current implementation needs T::Data to live inline with drm::Device =
in
> order for work_container_of to function. This restriction is already
> captured by the trait bounds. Drivers that need to share their ownership =
of
> T::Data may trivially get around this:
>
> // Lives inline in drm::Device
> struct DataWrapper {
>   work: ...,
>   // Heap-allocated, shared ownership.
>   data: Arc<DriverData>,
> }

IIUC, this is how it's supposed to be used:

	#[pin_data]
	struct MyData {
	    #[pin]
	    work: Work<drm::Device<MyDriver>>,
	    value: u32,
	}
=09
	impl_has_work! {
	    impl HasWork<drm::Device<MyDriver>> for MyData { self.work }
	}
=09
	impl WorkItem for MyData {
	    type Pointer =3D ARef<drm::Device<MyDriver>>;
=09
	    fn run(dev: ARef<drm::Device<MyDriver>>) {
	        dev_info!(dev, "value =3D {}\n", dev.value);
	    }
	}

The reason the WorkItem is implemented for MyData, rather than
drm::Device<MyDriver> (which would be a bit more straight forward) is the o=
rphan
rule, I assume.

Now, the whole purpose of this is that a driver can implement WorkItem for
MyData without needing an additional struct (and allocation), such as:

	#[pin_data]
	struct MyWork {
	    #[pin]
	    work: Work<Self>,
	    dev: drm::Device<MyDriver>,
	}

How is this supposed to be done when you want multiple different implementa=
tions
of WorkItem that have a drm::Device<MyDriver> as payload?

Fall back to various struct MyWork? Add in an "artificial" type state for M=
yData
with some phantom data, so you can implement HasWork for MyData<Work0>,
MyData<Work1>, etc.?
