Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAuGFHPbgWmDLQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:26:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB2D84DE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CB710E32A;
	Tue,  3 Feb 2026 11:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JQ3ZxiPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3CF10E32A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770117996;
 bh=c2+gYkdchGPjD2P9JpmsB+DRIFYZMK0TCeVAo3W5bi4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQ3ZxiPl2rBLEEWmvBwGo0TC1cNmU1PXUFSCCzFL6cKhdiA0NFr/jSbUwCuvctW3K
 L4Nqe2T/JU9zS/E1gWZ47AZFwpsEUEd8RP6v7HzvMLWGjHGUd+LJYQ2/4a6b/23jl3
 xPPb6QW6Mi8pvARe+TpG/jRIaBWAogTkwWImZlkzg+eFo/6xcHXdsfuhLkzWd4kU5y
 4G2yq9p/UZcy4WVN9vXCCrRN0s3PwrcMNwtj+pImqggAIXJH0FLEXamE+qBf99ZHle
 kJCRSem8WvUEo8u9YWTqFkenSh94C/uFqhv3mTka99dcR1iOz2rMDCg24rHv1J6V/r
 r6DeezIyDquMA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C1FA917E12E5;
 Tue,  3 Feb 2026 12:26:35 +0100 (CET)
Date: Tue, 3 Feb 2026 12:26:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, "Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?=" <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203122631.3a94a935@fedora>
In-Reply-To: <20260203113902.501e5803@fedora>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com> <20260203113902.501e5803@fedora>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:mripard@kernel.org,m:daniel.almeida@collabora.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ADFB2D84DE
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 11:39:02 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 19 Jan 2026 12:35:21 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:  
> > > On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:    
> > > > > For example, it's quite typical to have (at least) one clock for the bus
> > > > > interface that drives the register, and one that drives the main
> > > > > component logic. The former needs to be enabled only when you're
> > > > > accessing the registers (and can be abstracted with
> > > > > regmap_mmio_attach_clk for example), and the latter needs to be enabled
> > > > > only when the device actually starts operating.
> > > > > 
> > > > > You have a similar thing for the prepare vs enable thing. The difference
> > > > > between the two is that enable can be called into atomic context but
> > > > > prepare can't.
> > > > > 
> > > > > So for drivers that would care about this, you would create your device
> > > > > with an unprepared clock, and then at various times during the driver
> > > > > lifetime, you would mutate that state.    
> > 
> > The case where you're doing it only while accessing registers is
> > interesting, because that means the Enable bit may be owned by a local
> > variable. We may imagine an:
> > 
> >     let enabled = self.prepared_clk.enable_scoped();
> >     ... use registers
> >     drop(enabled);
> > 
> > Now ... this doesn't quite work with the current API - the current
> > Enabled stated owns both a prepare and enable count, but the above keeps
> > the prepare count in `self` and the enabled count in a local variable.
> > But it could be done with a fourth state, or by a closure method:
> > 
> >     self.prepared_clk.with_enabled(|| {
> >         ... use registers
> >     });
> > 
> > All of this would work with an immutable variable of type Clk<Prepared>.  
> 
> Hm, maybe it'd make sense to implement Clone so we can have a temporary
> clk variable that has its own prepare/enable refs and releases them
> as it goes out of scope. This implies wrapping *mut bindings::clk in an
> Arc<> because bindings::clk is not ARef, but should be relatively easy
> to do. Posting the quick experiment I did with this approach, in case
> you're interested [1]

This time with a proper RawClk(*mut bindings::clk) wrapper, so we can
clk_put() called in RawClk::drop() instead of in Clk::drop().

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/6fa6cb72f14373b276c61d038bc2b16f49c78f74
