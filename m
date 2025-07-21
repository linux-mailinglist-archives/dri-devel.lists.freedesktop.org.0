Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF3B0C7D6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAA010E292;
	Mon, 21 Jul 2025 15:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="kSxZqN1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E08110E286
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753112488; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HI7Kp10SOEBe90eukRNm+97yPa0yHbzcKWorLbmdaJ7w0UH+MJqSvjqqYKans13V7J/Oz5XHS+lqWUey9WhcqSZU4Q97amMugIa1lJRcXjBrG2U4UxiXqOqF241lmPvCzP/7WPMlWQZrdq4Ye6JP7jn3/Iep4eJ6ALY4Q3e66wQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753112488;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YZi0zqTGo3J7y/8O18KYDFsD8BHaEVVjRBIxO7kKR3g=; 
 b=a0GHsrEDhthsSh47YKxTXC2BA5OTxkUofRcyrrZ+FOLa6zhBEm9GDnvIikZbMLKgbGM1DS8Dzn97N8qu4T3twkUyVx2gOZXrpHt6q80ThIDvM27pAuire4KRwziZWBMwFFnVAjURtyENMYQF/N4MWBLsBazVW1OpgneA6DZ/iVM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753112488; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=YZi0zqTGo3J7y/8O18KYDFsD8BHaEVVjRBIxO7kKR3g=;
 b=kSxZqN1jGciH9ZhHV78mbbWfMezsJAv7VY/DRE9MvAM6N5rPAx3FmdJAXqvIhOXA
 Ys8Ee6A+/u7QE/fXqvgZfEvwBYrXt+vSt610oXgmK1cEIASNtfXv6wv900HMrt96gFp
 8GzRFOvjC3VibYGYhtRwq6IQ1lBCyBemE9EVokPo=
Received: by mx.zohomail.com with SMTPS id 175311248704378.99479297581865;
 Mon, 21 Jul 2025 08:41:27 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DBHUCKLO3YG6.3MFXYIE4XZMN1@kernel.org>
Date: Mon, 21 Jul 2025 12:41:11 -0300
Cc: Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <537E8E9E-AB3E-4BB0-A1BF-5188A958361B@collabora.com>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
 <DBHUCKLO3YG6.3MFXYIE4XZMN1@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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



> On 21 Jul 2025, at 12:33, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu Jun 26, 2025 at 6:23 PM CEST, Beata Michalska wrote:
>> With the Opaque<T>, the expectations are that Rust should not
>> make any assumptions on the layout or invariants of the wrapped
>> C types. That runs rather counter to ioctl arguments, which must
>> adhere to certain data-layout constraints. By using Opaque<T>,
>> ioctl handlers are forced to use unsafe code where none is actually
>> needed. This adds needless complexity and maintenance overhead,
>> brining no safety benefits.
>> Drop the use of Opaque for ioctl arguments as that is not the best
>> fit here.
>>=20
>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>=20
> The patch does not apply on top of drm-misc-next and does not have a =
base
> revision.
>=20
> Can you please let me know which commit this patch applies on top of =
or resend?
>=20
> - Danilo

I applied this locally on top of nova-next. Nova still builds, but I =
don=E2=80=99t
have the hardware to test.

=E2=80=94 Daniel=
