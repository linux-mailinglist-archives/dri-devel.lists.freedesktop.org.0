Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC95C92E5A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 19:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025F10E8C3;
	Fri, 28 Nov 2025 18:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="g0tluYk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3310E8C3;
 Fri, 28 Nov 2025 18:21:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764354060; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HGj2zZs7zx3Kfz9Bf4crYGa2ickNhM2lxZXpw/zRq9+bEh53BPyqtHQI28skcG9rO9/MuT22B9wy2qy0XdBq2Ncb/po9VFPOfSZQQPf7WPP9uccVhibD5f/1T218c6v+lGwq/xteJczncCXXB7TVa9Weid3LwjTo+ayPTsS68rg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764354060;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zaTtAvoz+CwteXEEXQTSwU3EqAeWqtk+xEH9OxVecTU=; 
 b=Kp9aAA3qdpEzLwVqY11OfJYwWvl2gh6uomG1pNxIlWGCwt6fg2GkYvVNatQyWpOPcV9HICho8/d0b9aCKZS4xismKqCO9L0oSCYyyr+cIy53uKYRypfQZWrXlVpLXtKIyr8OXEMazkQb2H16LxSbPTEkaf9yr5rsHIVv/gO0I2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764354060; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=zaTtAvoz+CwteXEEXQTSwU3EqAeWqtk+xEH9OxVecTU=;
 b=g0tluYk+7rXYQaANn5dfzRZuUe0ZS4CsRFbVBadkxOGp1Gd2Vp2E0Ce0N9VNA4fY
 fdWgONLF1tqkTTFQDt+4hkeH7QqwJlX5sLL1n147ZB6mKBeDcNWheQZOo8LHuZWOZUo
 hrqMPkuFI159+O+JAKdMPSsQcU58SuB3pQTTThfI=
Received: by mx.zohomail.com with SMTPS id 1764354057956167.8259873164252;
 Fri, 28 Nov 2025 10:20:57 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
Date: Fri, 28 Nov 2025 15:20:40 -0300
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <33553C18-F9CC-47A0-8049-3E4C1A745A84@collabora.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
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



> On 26 Nov 2025, at 17:57, John Hubbard <jhubbard@nvidia.com> wrote:
>=20
> On 11/26/25 10:50 AM, Joel Fernandes wrote:
>>> On Nov 25, 2025, at 8:16=E2=80=AFPM, Alexandre Courbot =
<acourbot@nvidia.com> wrote:
>>> =EF=BB=BFOn Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>>>>>> On Nov 25, 2025, at 9:52=E2=80=AFAM, Alexandre Courbot =
<acourbot@nvidia.com> wrote:
>>>>> =EF=BB=BFOn Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
> ...
>> You do have a point that we have an abstraction leak anyway, so the =
question is do we need helpers at all.
>>=20
>=20
> I'm writing this in order to suggest a stance in this area, for future
> feature tradeoffs. If this is somehow "off", I'll upgrade my thinking,
> but at the moment I'm very comfortable making the following claims:
>=20
>=20
>> I am torn on this. On the one hand, if someone changes how list_head =
api works, then the rust side breaks
>=20
> OK, this is not going to happen, at list not without a truly epic, =
long-term
> effort, accompanied by *lots* of publicity. The list_head API is just =
too
> foundational to change easily.
>=20
> It's been stable since *at least* 2006. The only change since then has =
been
> to add WRITE_ONCE() wrappers to the INIT_LIST_HEAD implementation--and =
that
> is not an API change.
>=20
> Anything is possible, but this is sufficiently far out there that it =
should
> not count for much here.
>=20
> (though that is easy to flag though via doc tests). On the other hand, =
we have the function call overhead you pointed and we are dealing with =
the pointers in rust directly anyway in some cases.
>=20
> Whereas this is very significant! We really, really do not want to =
accept
> a performance loss vs. C, without an excellent justification.

JFYI, and let me preface this by saying I know little about NVIDIA =
hardware: this overhead
had very little impact on the Rust Arm Mali driver.

>=20
> So I think you've made the right decision. The above is just to help
> solidify the reasons why.
>=20
>=20
> thanks,
> --=20
> John Hubbard
>=20
>=20

=E2=80=94 Daniel

