Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKLtJyXBcmmxpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 01:30:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15516ECA8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 01:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A6C10EBC8;
	Fri, 23 Jan 2026 00:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JFVN7vr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CF110EBC8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 00:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769128221; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IZX+1LsCpQQ+Rl7KDSFtZgqKtr0PFsWoY/u+das8x/TXSxh+Ln1Hk9x+LvhBnMOhhD04WoVYYpE5cQ7UuNgeA7XlHCsKB5IjjWyZ1BvfungO69wQ/8scKUuKaVt01w89ed8KawoVYjMdgiGCZoTubcf9rarqe8R+8TI2Y8+77dc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769128221;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/yeziewaw15H86mUs/MvNCnEniIqbrsf9kqGH0zpSXc=; 
 b=Tt3GOU/H/cyscwd7myazOyzRW77JnO56/aqYeAt/Zkpoe1vOTJYpVVs//RrL8nLiVC50uAxu8dPVbEFPFncY3Zi8ScUHJFG/fTrevf7PE1rmXyegT6LtmAMu7xKcFSitHRUUDmxCOgHUfHdefBNj9kz+/maGAMxgCUlPa0Xryes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769128221; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=/yeziewaw15H86mUs/MvNCnEniIqbrsf9kqGH0zpSXc=;
 b=JFVN7vr2V3WZMOROff8QAPjioTjWXyMphmAFlpev66SuROF3067M31vA00BA9Qdv
 9k2102LwLuyRGbUhXPt7+F8xLhnysIan5A9yTTYnFciNuqWiFEWVWPUEbWV9s4yDnMX
 8Y0Hf0auyWwWFoUrq7zk34PewHnWOptInla8L9JM=
Received: by mx.zohomail.com with SMTPS id 1769128219741646.6810529308862;
 Thu, 22 Jan 2026 16:30:19 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
Date: Thu, 22 Jan 2026 21:29:30 -0300
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
Message-Id: <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:mripard@kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.328];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D15516ECA8
X-Rspamd-Action: no action



> On 22 Jan 2026, at 10:44, Maxime Ripard <mripard@kernel.org> wrote:
>=20
> On Mon, Jan 19, 2026 at 03:37:17PM +0100, Danilo Krummrich wrote:
>> On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
>>> On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
>>>> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
>>>>>> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> =
wrote:
>>>>>> I think that if you still want an API where you just call =
enable/disable
>>>>>> directly on it with no protection against unbalanced calls, then =
that
>>>>>> should be the special API. Probably called RawClk and functions =
marked
>>>>>> unsafe. Unbalanced calls seem really dangerous and use should not =
be
>>>>>> encouraged.
>>>>=20
>>>> +1; and unless there is a use-case that requires otherwise, it =
should not even
>>>> be possible to do this at all -- at least for driver code.
>>>=20
>>> I mean, it's great, it's safe, etc. but it's also suboptimal from a =
PM
>>> perspective on many platforms. It's totally fine to provide nice, =
safe,
>>> ergonomic wrappers for the drivers that don't care (or can't, =
really),
>>> but treating a legitimate optimisation as something we should =
consider
>>> impossible to do is just weird to me.
>>=20
>> I said that an unsafe API with potentially unbalanced calls is =
something we
>> should clearly avoid for drivers. This is *not* equivalent to =
"treating a
>> legitimate optimisation as something we should consider impossible".
>>=20
>> If we discover use-cases where the current API doesn't work well, we =
can
>> invenstigate further.
>=20
> I'm not sure I'm following what you're saying, sorry. I've pointed out
> such a use-case already.
>=20
>>>>> I think we should discourage RawClk if at all possible. But if the =
consensus
>>>>> is that we *really* need this easily-abused thing, I can provide a =
follow-up.
>>>>=20
>>>> I think we should only do this if there are use-case with no =
alternative, so far
>>>> there haven't been any AFAIK.
>>>=20
>>> I don't really care about which alternative we come up with, but =
look at
>>> devm_regmap_init_mmio_clk for example. It is a valid use-case that
>>> already exists today, and has had for more than a decade at this =
point.
>>=20
>> I don't see the issue with devm_regmap_init_mmio_clk()? It takes a =
reference
>> count of the clock and prepares it when called and unprepares the clk =
in drops
>> its reference in regmap_mmio_free_context() called from the devres =
callback.
>>=20
>> That something we can easily do with the current API, no?
>=20
> The current one, yes. Doing that in the API suggested here would =
involve
> some boilerplate in all those drivers they don't have right now.
>=20
> Maxime

Maxime, I know you=E2=80=99ve already pointed out a use-case, but I =
think the
confusion stems from why you seem to think that the current solution =
cannot
cater to the API you mentioned in a clean way. You seem to imply that =
there
will be a lot of boilerplate involved, but we (or I) cannot see this. =
Perhaps
it would help if you highlighted how exactly the type state solution =
would be
verbose using some pseudocode. I guess that would make your point =
clearer for
us.

=E2=80=94 Daniel


