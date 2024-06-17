Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643D90C44E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8BA10E5B2;
	Tue, 18 Jun 2024 07:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="Dg1qfJ4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 15:41:06 UTC
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38DE10E43C;
 Mon, 17 Jun 2024 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
 s=default; t=1718638547;
 bh=c7Ne3E0RAcjQQpufIt0xSyD5MfaGm6a4FInMzdzowj0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Dg1qfJ4nJNei4EcLrlqmvHQWJppfrXCN7kivxzBGhmIM2ab6rjlzWx+NICGMZ0ugP
 51Wy6tiAeSsI0PwkoCHx8oSKaQsqEWE1n779LcQyOJ29JgMW1yqyFiakej18s/nbQS
 np8+MGxOvGWHBGVVsF+YVpHKhJmhP9WmT1xnoWno=
Received: from [IPv6:240e:358:11e5:c700:dc73:854d:832e:2] (unknown
 [IPv6:240e:358:11e5:c700:dc73:854d:832e:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 7428967547;
 Mon, 17 Jun 2024 11:35:41 -0400 (EDT)
Message-ID: <e27a5acebe5c7d1e09edbc9dc49f52b672d72988.camel@xry111.site>
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
From: Xi Ruoyao <xry111@xry111.site>
To: Icenowy Zheng <uwu@icenowy.me>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Pan
 Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Mon, 17 Jun 2024 23:35:33 +0800
In-Reply-To: <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
 <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
 <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Jun 2024 07:29:33 +0000
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

On Mon, 2024-06-17 at 22:30 +0800, Icenowy Zheng wrote:
> > Two consecutive writes to the same bus address are perfectly legal
> > from=20
> > the PCIe specification and can happen all the time, even without this
> > specific hw workaround.
>=20
> Yes I know it, and I am not from Loongson, just some user trying to
> mess around it.

There are some purposed "workarounds" like reducing the link speed (from
x16 to x8), tweaking the power management setting, etc.  Someone even
claims improving the heat sink of the LS7A chip can help to work around
this issue but I'm really skeptical...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
