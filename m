Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIK0IXhHi2kpTwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:58:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1011C2AB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ECC10E1D0;
	Tue, 10 Feb 2026 14:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kcJXaioD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9EC10E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770735475;
 bh=8fqNgMt4GEKsfnrjQVVwOS/ylSwIghuovg1fPQrBZHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kcJXaioDfCmRrGoBA4yLRF1rGkr7VcLOPZqqAKn5DOlnLn8nAgCGUp5zNqi2W8mqN
 G3RF4gHiQVfbWuWB7710GMHrYbzpmwHpCKn7eXLDJnKcfHlWfEarilutNP1cTuxRzJ
 lXK4E7cPAN8Vuux76JDQIZUNbGi0N+AkFToQQgVqVME52GQ37Y2x+nTzMqnnwdsC21
 dq+9grSd4rDLYT6IyP1oooguVRB4y3sq+OccYfbv7tiWe5HA/4qiymg2UWnniZoYSi
 984QIemsUm7QMwrau2zgVRrytOdSzvJuLbTYBgGB7BX9jiCTHADYdkHurJUAMeI6Nr
 SpL7UYQYZEn3g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 083D417E1305;
 Tue, 10 Feb 2026 15:57:54 +0100 (CET)
Date: Tue, 10 Feb 2026 15:57:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260210155750.5cdbe6cc@fedora>
In-Reply-To: <20260203081403.68733-5-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org>
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
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 09E1011C2AB
X-Rspamd-Action: no action

On Tue,  3 Feb 2026 09:14:02 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> +/// A jobqueue Job.
> +///
> +/// You can stuff your data in it. The job will be borrowed back to your driver
> +/// once the time has come to run it.
> +///
> +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ownership transfer).
> +/// You can set multiple [`DmaFence`] as dependencies for a job. It will only
> +/// get run once all dependency fences have been signaled.
> +///
> +/// Jobs cost credits. Jobs will only be run if there are is enough capacity in
> +/// the jobqueue for the job's credits. It is legal to specify jobs costing 0
> +/// credits, effectively disabling that mechanism.
> +#[pin_data]
> +pub struct Job<T: 'static + Send> {
> +    cost: u32,
> +    #[pin]
> +    pub data: T,
> +    done_fence: Option<ARef<DmaFence<i32>>>,
> +    hardware_fence: Option<ARef<DmaFence<i32>>>,
> +    nr_of_deps: AtomicU32,
> +    dependencies: List<Dependency>,

Given how tricky Lists are in rust, I'd recommend going for an XArray,
like we have on the C side. There's a bit of overhead when the job only
has a few deps, but I think simplicity beats memory-usage-optimizations
in that case (especially since the overhead exists and is accepted in
C).

> +}
> +
