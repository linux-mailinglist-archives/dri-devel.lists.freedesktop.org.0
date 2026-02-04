Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCO9FSY/g2kPkQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:44:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FB4E5F3B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 13:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D4810E63B;
	Wed,  4 Feb 2026 12:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="D9fY5vsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8475210E63B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 12:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770209056; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VlpkdDeeeuo06wVd3QoFjeQF4Ze/WvqBlenT7Jxm0kIXdrUYyqy7ANv1tLtDRRzzqfLYNdrPNkWVquUaNRftFbw42AH49LYk/zkoDXAH0Ntfo1HhhYgXERyL497cdRdqm1Ex72I7fUcm5KVNgfWVA5+svJoKXiMwu0aq6H6hApQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770209056;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZHEfRwCP34SKP/etqf2R3yvPOUYfeiMlExy0k9a0BNk=; 
 b=EY8CFOFttnCRasix3rIcqXqI3UN2g9W04GFEFPR1ZNNP7jOpoKfAPlwvbOXuBrv3ukECbHXQdEntU4zuZB9MoDDQYHSsmIMITHZTSaQnIUbIz/xw2HPCQXTbcSNzzFhJfuJWkqdUlbiIeqlXhHvA8G8g9SXqaQK0wBphiTsMpOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770209056; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ZHEfRwCP34SKP/etqf2R3yvPOUYfeiMlExy0k9a0BNk=;
 b=D9fY5vsYmDzxbb3wnJ6GeN2NPcWUM3P96dDZwTdg8wRu0RO5UFiU0nieyb+hVJ0q
 yI8/bK2piXW4wuCwLcUWSkwryxH+w1MDZSTV5OJjf4H1/lV+m+0ge2r2zOoB7bn9DUC
 xBaM6iGniq4R2heDGhtciZgJAlf8pNM31KS9AmSI=
Received: by mx.zohomail.com with SMTPS id 1770209055218580.5695590716871;
 Wed, 4 Feb 2026 04:44:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260204-nickel-seal-of-poetry-8fdefb@houat>
Date: Wed, 4 Feb 2026 09:43:55 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
References: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
To: Maxime Ripard <mripard@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:mripard@kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_MAILER_COMMON(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C4FB4E5F3B
X-Rspamd-Action: no action

>=20
> I'm probably missing something then, but let's assume you have a =
driver
> that wants its clock prepared and enabled in an hypothetical enable()
> callback, and disabled / unprepared in a disable() callback.
>=20
> =46rom a PM management perspective, this usecase makes total sense, is =
a
> valid usecase, is widely used in the kernel, and is currently =
supported
> by both the C and Rust clk APIs.
>=20
> The only solution to this you suggested so far (I think?) to implement
> this on top of the new clk API you propose is to have a driver =
specific
> enum that would store each of the possible state transition.

Yes, you need an enum _if_ you want to model transitions at runtime. =
IIUC you
only need two variants to implement the pattern you described. I do not
consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small cost to =
pay.

I would understand if this was some elaborate pattern that had to be
implemented by all drivers, but a two-variant enum is as straightforward =
as it
gets.


>=20
> That's the boilerplate I'm talking about. If every driver wanting to
> implement that pattern has to make such an enum, with all the relevant
> traits implementation that might come with it, we go from an API where
> everything works at no-cost from a code-size perspective to a =
situation
> where every driver has to develop and maintain that enum.
>=20
> Maxime

There are no "traits that come with it". It's just an enum, with two =
variants.

> API where everything works at no-cost

The previous API was far from =E2=80=9Ceverything works=E2=80=9D. It was =
fundamentally
broken by design in multiple ways, i.e.:

> a) It only keeps track of a count to clk_get(), which means that users =
have
> to manually call disable() and unprepare(), or a variation of those, =
like
> disable_unprepare().
>=20
> b) It allows repeated calls to prepare() or enable(), but it keeps no =
track
> of how often these were called, i.e., it's currently legal to write =
the
> following:
>=20
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();
>=20
> And nothing gets undone on drop().

IMHO, what we have here is an improvement that has been long overdue.

=E2=80=94 Daniel=
