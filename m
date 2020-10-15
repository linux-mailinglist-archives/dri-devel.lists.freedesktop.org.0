Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F132913EE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE6C6E217;
	Sat, 17 Oct 2020 19:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838556E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:10:52 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Thu,
 15 Oct 2020 11:10:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=PsqLTnqbkQyhQKxXe
 V6MvaAmElLso9QGfdiutEPg14M=; b=I0hIeF2uwSCg4aw1GlF93p3PJRKCcZN2+
 K+y8VcopYAgGyWZpX6r/Q240qFn/vNH/2AGVOhK1GT85eNL5YrVenIbzyX64YwaQ
 PDo56GqYhs3Cm8r5Ub3SnD773CE9hofdpwSOz4aQ/gUmjFbBpbObCGGaKC6fDgXS
 CjMG6sFGWk=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Thu, 15 Oct 2020 11:10:48 +0300
 id 00000000005A0932.000000005F880408.000016FC
Date: Thu, 15 Oct 2020 11:10:48 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
In-Reply-To: <20201014090913.727e79bb@linux-uq9g>
Message-ID: <alpine.DEB.2.20.2010151048080.21509@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de>
 <alpine.DEB.2.20.2009171407330.6530@whs-18.cs.helsinki.fi>
 <4ccd1076-29e3-044a-0696-fd205b100374@suse.de>
 <alpine.DEB.2.20.2010140938100.6967@whs-18.cs.helsinki.fi>
 <20201014090913.727e79bb@linux-uq9g>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-5902-1602749448-0001-2"
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-5902-1602749448-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2020, Thomas Zimmermann wrote:
> On Wed, 14 Oct 2020 09:58:37 +0300 (EEST) "Ilpo J=E4rvinen"
> <ilpo.jarvinen@cs.helsinki.fi> wrote:
>=20
> > The high-res mode works, however, I wasn't expecting it to be this sl=
ow=20
> > though as I can see the slowish sweeps to redraw the screen or large =
parts=20
> > of it. Maybe you meant all along this slow (I was expecting something =
like=20
> > memcpy slow and this looks definitely much slower)?
>=20
> First of all, thanks for testing. I didn't expect it to be that slow ei=
ther.
>=20
> >=20
> > While a large redrawing operation is going on, mouse cursor stops mov=
ing=20
> > normally until it is over and it then jumps to catch up. When the mou=
se is=20
> > over something that doesn't require large redraw, it seems to work qu=
ite=20
> > normally.
> >=20
>=20
> That sounds bad. The cursor is drawn by hardware, so I'd expect it to m=
ove
> smoothly across the screen. Maybe the position update is blocked from t=
he
> framebuffer's memcpy within the kernel code.
>=20
> I was hoping the performance would be acceptable, but this sounds like =
a
> dealbreaker to me. I can look a bit closer if there are issues/bugs in =
the
> code that make it run slow. Not holding my breath for it though...

Yeah, with like 5fps with full redraw it's not really acceptable (it's a=20
bit hard to estimate exactly but certainly less than 10fps). Writing to=20
video mem / normally working memcpy itself really cannot be this slow as=20
it would impact fps in non-shmem case too I think.

Also, there's more into this. I noticed that after using this kernel,
I cannot boot normally neither warm nor even cold boot after poweroff=20
(POST is slower than usual, beeps one less and gets stuck, I didn't=20
manage to switch into textual POST messages to see if there's any info as=20
the tab key for swithing got also broken). Sadly those beeps don't match=20
to the motherboard manual in ok nor broken case so I've no idea what they=20
mean and whether the beeps really related to POST or e.g. from graphics=20
init.

Only after cutting power entirely from the machine, the boot again=20
succeeds. To me those symptoms sounds like it somehow managed to break=20
something related to IPMI because IPMI is reinitialized only if I remove=20
the power. If I've understood correctly IPMI is somehow connected to=20
graphics side within the AST.

I haven't yet tested with the plain 5.9-rc5 to rule out it breaking=20
the boot (but I find it less likely to be case here).


--=20
 i.
--=_script-5902-1602749448-0001-2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=_script-5902-1602749448-0001-2--
