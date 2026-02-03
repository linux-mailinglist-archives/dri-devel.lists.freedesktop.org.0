Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KN6KFT+gWk7NQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F75DA378
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2B10E661;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TEQQT4xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9536C10E65F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770126925; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mqpErazCYJwWsKbalny940d+xNG67LuWdf+RjZkkuq/biWxMMJZK5jB0JBDew84/XQMe+ZPPQlxiNIwNz+Y09GEbgaAatTzrluKXr/66AjzNJ7n9gjcKYmhg11lcKrl+DX87eHhgREAotCYYZHLfKA6Iw3qkCiaf7vLnKMk6pTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770126925;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2blSuRUPsP6+4ceJBo384cKeJKIWx4uTqBEcRiz5ods=; 
 b=W5puTORxBCCUx5ioGJP5obhlLJLb3U1CH1/frhpZEcsr0ydo0e8t5fZMO5gNb8yRazIKpH5CplFPDhlTHncOGTy93cBN8uhimwZLK/ZCXBknWzZIK10VQqp0SxY1kDhFKPJHOhcyDzytntI20XkCbDk9SclS57zFAkhlDGPMapQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770126925; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=2blSuRUPsP6+4ceJBo384cKeJKIWx4uTqBEcRiz5ods=;
 b=TEQQT4xbTfWVfPNOg0xCXb4lASGYx+OI0vE+k0g0C53zBi5kGDHziUlC8sPs37pC
 J1akyXM96Jugpf5zq+PuZf3cgjPoa2o164mWE4yMsSpW/akFV/lQ47P+RB+M5QulQO8
 6qRchcKH4FaTpf/tHdZWDT5OKasnsWHhw8EQFzmo=
Received: by mx.zohomail.com with SMTPS id 1770126924198180.96689099106857;
 Tue, 3 Feb 2026 05:55:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
Date: Tue, 3 Feb 2026 10:55:05 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <20C2CC23-4558-4490-A5A9-E46AA150E7DD@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
To: Gary Guo <gary@garyguo.net>
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
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:mripard@kernel.org,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:gary@garyguo.net,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: B5F75DA378
X-Rspamd-Action: no action



> On 3 Feb 2026, at 10:42, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Tue Feb 3, 2026 at 1:33 PM GMT, Daniel Almeida wrote:
>> Hi Boris,
>>=20
>>> On 3 Feb 2026, at 07:39, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>>>=20
>>> On Mon, 19 Jan 2026 12:35:21 +0000
>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>=20
>>>> On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:
>>>>> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote: =20=

>>>>>>> For example, it's quite typical to have (at least) one clock for =
the bus
>>>>>>> interface that drives the register, and one that drives the main
>>>>>>> component logic. The former needs to be enabled only when you're
>>>>>>> accessing the registers (and can be abstracted with
>>>>>>> regmap_mmio_attach_clk for example), and the latter needs to be =
enabled
>>>>>>> only when the device actually starts operating.
>>>>>>>=20
>>>>>>> You have a similar thing for the prepare vs enable thing. The =
difference
>>>>>>> between the two is that enable can be called into atomic context =
but
>>>>>>> prepare can't.
>>>>>>>=20
>>>>>>> So for drivers that would care about this, you would create your =
device
>>>>>>> with an unprepared clock, and then at various times during the =
driver
>>>>>>> lifetime, you would mutate that state. =20
>>>>=20
>>>> The case where you're doing it only while accessing registers is
>>>> interesting, because that means the Enable bit may be owned by a =
local
>>>> variable. We may imagine an:
>>>>=20
>>>>   let enabled =3D self.prepared_clk.enable_scoped();
>>>>   ... use registers
>>>>   drop(enabled);
>>>>=20
>>>> Now ... this doesn't quite work with the current API - the current
>>>> Enabled stated owns both a prepare and enable count, but the above =
keeps
>>>> the prepare count in `self` and the enabled count in a local =
variable.
>>>> But it could be done with a fourth state, or by a closure method:
>>>>=20
>>>>   self.prepared_clk.with_enabled(|| {
>>>>       ... use registers
>>>>   });
>>>>=20
>>>> All of this would work with an immutable variable of type =
Clk<Prepared>.
>>>=20
>>> Hm, maybe it'd make sense to implement Clone so we can have a =
temporary
>>> clk variable that has its own prepare/enable refs and releases them
>>> as it goes out of scope. This implies wrapping *mut bindings::clk in =
an
>>> Arc<> because bindings::clk is not ARef, but should be relatively =
easy
>>> to do. Posting the quick experiment I did with this approach, in =
case
>>> you're interested [1]
>>>=20
>>> =
[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/d5d04da4f4f619=
2b6e6760d5f861c69596c7d837
>>=20
>> The problem with what you have suggested is that the previous state =
is not
>> consumed if you can clone it, and consuming the previous state is a =
pretty key
>> element in ensuring you cannot misuse it. For example, here:
>>=20
>> let enabled_clk =3D prepared_clk.clone().enable()?;
>> // do stuff
>> // enabled_clk goes out of scope and releases the enable
>> // ref it had
>>=20
>> prepared_clk is still alive. Now, this may not be the end of the =
world in this
>> particular case, but for API consistency, I'd say we should probably =
avoid this
>> behavior.
>=20
> Is this an issue though? You cannot mistakenly own `Clk<Enabled>` =
while the clk
> is not enabled, (and similarly for `Prepared`), and that should be =
sufficient.

It is not an issue. However, I just find it a bit confusing. With a =
typestate, one
usually expects state transitions where a new state fully consumes the =
previous
one, and that assumption is =E2=80=9Cbroken=E2=80=9D in a way when you =
add clone().

>=20
> Having `Clk<Prepared>` makes no guarantee on if the clk is enabled or =
not anyway
> as you can have another user do `Clk<Unprepared>::get().enable()`.

Although you=E2=80=99re right here, I find this less confusing than =
clone(). You
have to explicitly craft a new Clk<Enabled>, where a clone() is a =
shorter way
to basically get around the =E2=80=9Cstate transition=E2=80=9D idea on =
an _existing_ Clk
reference.

This is a bit pedantic on my side though, so I have no problem in adding
clone() if it's the consensus of the majority.

>=20
> The only guarantee is that the state the clk have is going to be =
greater than or
> equal to the type state, so allowing cloning an intermediate state is =
no
> problem.
>=20
> Best,
> Gary
>=20
>>=20
>> I see that Alice suggested a closure approach. IMHO, we should use =
that
>> instead.
>>=20
>> =E2=80=94 Daniel


Is there any pushback on the closure approach? If so, mind sharing why?

=E2=80=94 Daniel

