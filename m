Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEczGYJdhmlfMQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:30:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F2103710
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF6A10E93B;
	Fri,  6 Feb 2026 21:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PgOuGqgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 491 seconds by postgrey-1.36 at gabe;
 Fri, 06 Feb 2026 21:30:35 UTC
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04E810E13A;
 Fri,  6 Feb 2026 21:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770413432; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TkGT/rcpJE5Vm/RPC/OLo0/DqSafIQP4dRJ9DS5V9ztK6Ke3kRltQ9h4WbEj57/jfaJLtvCMwnIh6yWLQnTLqDq48jerNv6XpjWF8X5j97XVpzK18xlVRoDnSTTu4fuy2JeuB3KoZ9Jr22UoO/dl//sTGhvEt0MSiVFamYw0wkY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770413432;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dHk/uf5/R0o1Pb5W9VHPvuhr+RUwzmWTYbA59LNhJ9M=; 
 b=L6YzZ4DJDJPYpSP3wIFwYXu65xdUaNah/57hxFQLAxsKteOXGvzUi2ZgeyUSNPkqsRX5PCNEeD0pA1KNmjXk/uIjTznAWfAcsE6x4AC4GK7YyMpd37JDrNLheEQ9Kb5ODTN63I2H+AkFaDlr/VMeIiBVHKX+ERmLTM+fLtJjDA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770413432; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=dHk/uf5/R0o1Pb5W9VHPvuhr+RUwzmWTYbA59LNhJ9M=;
 b=PgOuGqgDm2r+bre0v+IcQ1LH7g7YFthyDqz3hqjJrYgXp9ck0UIVNlgNR+4ogr8B
 zu3HbqxQq8nl4tD3M6w2uHxQnQ/DbcuSufmz8XsD8pxovUabdXl98yfhOsYX48rwuYk
 LwfLOpDCV3saDkZIIa+RtC+Uut/J+35pmJ8yGMJg=
Received: by mx.zohomail.com with SMTPS id 1770413430954879.3535008602513;
 Fri, 6 Feb 2026 13:30:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG820GM5YHJS.11E92OR824CWM@kernel.org>
Date: Fri, 6 Feb 2026 18:30:07 -0300
Cc: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <31AAAF36-093A-46CF-AEEA-709CB1DE1E81@collabora.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
 <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
 <DG81V8NG5RC7.38EYLHQZXKTTO@garyguo.net>
 <DG820GM5YHJS.11E92OR824CWM@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 072F2103710
X-Rspamd-Action: no action



> On 6 Feb 2026, at 14:27, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri Feb 6, 2026 at 6:20 PM CET, Gary Guo wrote:
>> I asked for this to be changed to `pub(crate)` because I think this =
isn't
>> something that should be used by drivers.
>>=20
>> As you said, tt might be tricky to enforce that with new build system =
when
>> subsystems are inside different crates. But until then I think it's =
better to
>> limit visibility.
>=20
> It should *usually* not be used by drivers, but there are exceptions. =
For
> instance, it is perfectly valid to be used by Rust drivers that =
interact with C
> drivers.

I agree with what Danilo said here.

I don=E2=80=99t see a reason to forbid drivers from using this. If the =
reason is
the unsafe bits, then isn=E2=80=99t it the same pattern used by =
impl_has_work!()
anyways? i.e.: a macro that implements an unsafe trait so long as the =
driver
gives it the right Work field. Seems equivalent in spirit to the =
clist_create macro
introduced by this patch.

=E2=80=94 Daniel

