Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1136CF0388
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 18:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09C810E155;
	Sat,  3 Jan 2026 17:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fG6uFlDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFEC10E098;
 Sat,  3 Jan 2026 10:44:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4djxy54Y1bz9v6q;
 Sat,  3 Jan 2026 11:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767437053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q490h70nD1q9mLKhZrcgkHWBp8ifCWlFiPf83Y6LE9o=;
 b=fG6uFlDzocisagfyyAB0++nE5/QjrSCGtrUY/4snWl01tEjYQbzp5OCldcmUhS6ZzrULuS
 +BU6AvO6OpNWl58oKTFr505vxeprxzi2YLA9iT6OJ05ICk/kNvX2+RfgnnxP0dIhQMDtyd
 nFlJUn4CKrHwIyPBYEAqj/6YwA86HFbVnx0gqoWEwG53WQDIekjJ3igH6NAJk/1P2z3By9
 Ie6sJiGKiU50msFt1OQXn+trHJBE7HcT0GBviV+5UAP52Wvc+QQkPlAiRNDgiI20tib1mA
 b1wFGw4KLaRVfbnJQdRG18eE8EivbCyPyBgZu0yngbBK1ZtosIgQgN05Qg6iVg==
Message-ID: <fdaf272295d90d2d051d4997a99ee899c45d7b67.camel@mailbox.org>
Subject: Re: [PATCH] gpu: nova-core: use stable name() method in Chipset
 Display impl
From: Maurice Hieronymus <mhi@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Sat, 03 Jan 2026 11:44:09 +0100
In-Reply-To: <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
References: <20260101184137.80445-1-mhi@mailbox.org>
 <DFEV1P747QKG.3O75MCC6HFYK4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5c8225c05414e845f56
X-MBO-RS-META: ms4ecxrcrreiq778guup4eppkrfkzd5b
X-Mailman-Approved-At: Sat, 03 Jan 2026 17:37:04 +0000
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

On Sat, 2026-01-03 at 10:52 +0100, Danilo Krummrich wrote:
> On Thu Jan 1, 2026 at 7:41 PM CET, Maurice Hieronymus wrote:
> > Chipset's Display was using Debug formatting ("{self:?}"), which is
> > not
> > guaranteed to be stable. Use the existing name() method instead,
> > which
> > provides stable lowercase strings suitable for firmware path
> > generation.
> >=20
> > Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> > ---
> > =C2=A0drivers/gpu/nova-core/gpu.rs | 10 +---------
> > =C2=A01 file changed, 1 insertion(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-
> > core/gpu.rs
> > index 629c9d2dc994..be8c882338ea 100644
> > --- a/drivers/gpu/nova-core/gpu.rs
> > +++ b/drivers/gpu/nova-core/gpu.rs
> > @@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
> > -// TODO
> > -//
> > -// The resulting strings are used to generate firmware paths,
> > hence the
> > -// generated strings have to be stable.
> > -//
> > -// Hence, replace with something like strum_macros
> > derive(Display).
> > -//
> > -// For now, redirect to fmt::Debug for convenience.
> > =C2=A0impl fmt::Display for Chipset {
> > =C2=A0=C2=A0=C2=A0=C2=A0 fn fmt(&self, f: &mut fmt::Formatter<'_>) -> f=
mt::Result {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write!(f, "{self:?}")
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write!(f, "{}", self.name()=
)
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
>=20
> This also converts the printed string to lowercase. While this is not
> that big a
> deal, the solution we are looking for instead is what the TODO
> comment says: be
> able to derive a Display implementation (for enums).
>=20
> Now that we have syn in the kernel, this seems quite straight forward
> to
> implement. Are you interested in working on this instead?
>=20
Definitely!

The Display implementation should print the enum value as it is,
without changing the case, correct?

I will have a look into that and send a new patch set in the next few
days.

> Thanks,
> Danilo
