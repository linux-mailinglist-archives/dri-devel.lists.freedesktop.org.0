Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7147926FBE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 08:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B34410E941;
	Thu,  4 Jul 2024 06:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="BPClduXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9C10E941
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 06:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1720075230; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cbsMDJ54XPbGsKgUiQwKU7Ossbnsg8BxvxEELPKGPAuY/PP74KQ1THVR+f+2W9o+ADhwkcIKw/Ctx5zj0k/8FlCiAPC4pXTwZCwo9zH85KIST7mZ4xeHleItb8vlDzhoPD0amRqk+9HrOdhYr4dxCzesUz9s1QbZI5Y8lXXadRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1720075230;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8hFZAidPcDdSv5uZH+SmygHMQQ9j5VWMuPUkSwHgy9M=; 
 b=aGksZX+N7VCE5DHcZjN5gmSkFCrauOkc3ItXGeXGF8xcbTegqshMq2K92D4c2iwdnrQLgSpoIVYjsw44+pbL62OinZEdvNhpdUHdOhfCSQ5jm8RuaGylhxtXYl+ZQ/DjqrS61LRgO6/AmnsAdtl4cl2V+n9Y/2XajWV05d7kpmw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1720075230; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=8hFZAidPcDdSv5uZH+SmygHMQQ9j5VWMuPUkSwHgy9M=;
 b=BPClduXNj8xNP1fWI91lDWKzZEdUHdscAWayV9vvGrlTnyYXi9iJC9YJ+nu+saxo
 CjtOLXf66Iqa6VfImP7P9rWowH+8uJHhbXhI2mtJXqqdsoR7R8Ub2Y4Mh8GnFKY+k5k
 urMMQ8m4Cb3znWg2Sv3yYplh+Rp0+h2oXH604TfTw7zUCIlM/I1kmchLW3qr63g3CYN
 7RkB1ueWuLspSYOPNbHCrOV/dpdkVOtHLguWI5uWiWu3rIySJBJ/9NALdsiKNFs5j7j
 XVjrC10DVJbjjhW9zfTXDRww3vqTqZKdKmoHqJI4KpUbLrucdGUSmXTQiSn0Widtx47
 N2QEBmh2jg==
Received: by mx.zohomail.com with SMTPS id 1720075227349371.7068907339411;
 Wed, 3 Jul 2024 23:40:27 -0700 (PDT)
Message-ID: <51603213d16493879c85417c0c8cc3f2df0cf7cf.camel@icenowy.me>
Subject: Re: PCIe coherency in spec (was: [RFC PATCH 2/2] drm/ttm: downgrade
 cached to write_combined when snooping not available)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christoph Hellwig <hch@infradead.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 bhelgaas@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Thu, 04 Jul 2024 14:40:16 +0800
In-Reply-To: <ZoY9HZwon3_yiq6F@infradead.org>
References: <20240703210831.GA63958@bhelgaas>
 <99ff395019901c5c1a7b298481c8261b30fdbd01.camel@icenowy.me>
 <ZoY9HZwon3_yiq6F@infradead.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

=E5=9C=A8 2024-07-03=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 23:11 -0700=EF=BC=
=8CChristoph Hellwig=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jul 04, 2024 at 10:00:52AM +0800, Icenowy Zheng wrote:
> > So I here want to ask a question as an individual hacker: what's
> > the
> > policy of linux-pci towards these non-coherent PCIe
> > implementations?
> >=20
> > If the sentences of Christian is right, these implementations are
> > just
> > out-of-spec, should them get purged out of the kernel, or at least
> > raising a warning that some HW won't work because of inconformant
> > implementation?
>=20
> Nothing in the PCIe specifications that mandates a programming model.
> Non-coherent DMA is extremely common in lower end devices, and
> despite
> all the issues that it causes well supported in Linux.
>=20
> What are you trying to solve?

Currently the DRM TTM subsystem (and GPU drivers using it) will assume
coherency and fail on these non-coherent systems with cryptic error
messages (like `[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring gfx
test failed (-110)`) without mentioning coherency issues at all.

My original patchset tries to solve this problem by make the TTM
subsystem sensible of coherency status (and prevent CPU-side cached
mapping when non-coherent), but got argued by TTM maintainer and the
maintainer says TTM's ignorance on non-coherent systems is intentional.

>=20

