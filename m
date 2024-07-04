Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52266926D4C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 04:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5959110E15A;
	Thu,  4 Jul 2024 02:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="JKs7+zda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8410E15A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 02:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1720058458; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jTPPN3UWqhQUDqQtg3DjdoaPCUaAPjQz1EhA4whcnVIT9tLBl4ph0YhVUVe8l79AmG+cXYpWr/cI5wdVk9MYsCIDVjI34Ns4aLWgkK6Lg1JYJKsCz0cMHStP1tMyBwjvQLxz90jzw0RymHF77jIWlgisR28c1Rsyk88uH1zIk6A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1720058458;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=W9OqunnTPDg38IVBRFQeGAZEa+FOMhVSSOueR/HZRCM=; 
 b=ljpvD26QvxfwKCCSx1FyIOscIXBDcoDhM0Be1ehzJ/BF+tY7nTjJ6dhNc/YFnGDYLC8wzDVrhD1RUVCWZ9ZDgAk9SnjnYtuQfBjOX7Cgc6E69vBQXgOHTpFXG+gNQvitNKgWP8ssw/xnKed6whao/Zr0URPTW3jqU4eeBO2VG1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1720058458; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=W9OqunnTPDg38IVBRFQeGAZEa+FOMhVSSOueR/HZRCM=;
 b=JKs7+zda2gRlGQPNroBAk6XPtG+JU6IsNrK8x6DlfWcwUEZH5QLZUposwTfB9Jgx
 5vCmgJpE/b3EStejE0mRewFRXW1GW+/CniuIFQ0NbNbufeoUpDt6hbU5n3rQak3rBmm
 te3iTzjZg6ptiWXnJg1QhaosWyLU9RRnnwPhfkKQMYHGWOOUZJwhKfdOZ4wkI91Vlg6
 iDLKv3cXcD2nDAgZKd6uySxMaSXmyX6MG0N1VS0DY1milWSdVRXiFfuUPkwAUone5l2
 tiB65K0RkQ0DtKokAIPo8lvEP0ou+DHMj31aH2TkLho69N6iEfimtOXEUrtACmneu0B
 5A6s2i1zFg==
Received: by mx.zohomail.com with SMTPS id 17200584565631004.9071576656763;
 Wed, 3 Jul 2024 19:00:56 -0700 (PDT)
Message-ID: <99ff395019901c5c1a7b298481c8261b30fdbd01.camel@icenowy.me>
Subject: Re: PCIe coherency in spec (was: [RFC PATCH 2/2] drm/ttm: downgrade
 cached to write_combined when snooping not available)
From: Icenowy Zheng <uwu@icenowy.me>
To: Bjorn Helgaas <helgaas@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>, bhelgaas@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Thu, 04 Jul 2024 10:00:52 +0800
In-Reply-To: <20240703210831.GA63958@bhelgaas>
References: <20240703210831.GA63958@bhelgaas>
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

=E5=9C=A8 2024-07-03=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 16:08 -0500=EF=BC=
=8CBjorn Helgaas=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jul 03, 2024 at 04:52:30PM +0800, Jiaxun Yang wrote:
> > =E5=9C=A82024=E5=B9=B47=E6=9C=882=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=886:03=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> > > =E5=9C=A82024=E5=B9=B47=E6=9C=882=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=
=8B=E5=8D=885:27=EF=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > > Am 02.07.24 um 11:06 schrieb Icenowy Zheng:
> > > > > [SNIP] However I don't think the definition of the AGP spec
> > > > > could apply on all
> > > > > PCI(e) implementations. The AGP spec itself don't apply on
> > > > > implementations that do not implement AGP (which is the most
> > > > > PCI(e)
> > > > > implementations today), and it's not in the reference list of
> > > > > the PCIe
> > > > > spec, so it does no help on this context.=20
> > > > No, exactly that is not correct.
> > > >=20
> > > > See as I explained the No-Snoop extension to PCIe was created
> > > > to help=20
> > > > with AGP support and later merged into the base PCIe
> > > > specification.
> > > >=20
> > > > So the AGP spec is now part of the PCIe spec.
> >=20
> > Hi Bjorn & linux-pci folks,
> >=20
> > It seems like we have some disputes on interpretation pf PCIe
> > specification.
> >=20
> > We are seeking your expertise on the question: Does PCIe
> > specification mandate Cache coherency via snoop?
>=20
> I'm not qualified to opine on this.=C2=A0 I'd say it's a question for the
> PCI SIG protocol workgroup.=C2=A0 https://forum.pcisig.com/=C2=A0is a pla=
ce to
> start.

Sorry for the disturbance.

As individual hacker, I am not eligble of being a PCI-SIG member and
join the discussion there.

So I here want to ask a question as an individual hacker: what's the
policy of linux-pci towards these non-coherent PCIe implementations?

If the sentences of Christian is right, these implementations are just
out-of-spec, should them get purged out of the kernel, or at least
raising a warning that some HW won't work because of inconformant
implementation?

>=20
> Bjorn

