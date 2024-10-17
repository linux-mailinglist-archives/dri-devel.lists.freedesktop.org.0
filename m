Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302BD9A1AF8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 08:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085010E79F;
	Thu, 17 Oct 2024 06:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="NzchV/dS";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="YkO6znv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AA210E79F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 06:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729147853; x=1760683853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=14TXucqNvD7mQKvyCwt2zhHYdFZ3+y+5soiHU1J4lT0=;
 b=NzchV/dSFXW8dXom7QFEEoSZWQC7+jiD9OhHHVqOjFaYAg/Yg1seEJL9
 0Y1NMGNAOoeSEWG9mPbXvcfoUfgHA1V4pgfIhTS7uhwI3ukapkYoKP4oq
 Ff1pYRzSR6Y4TONsxKnPu3L8sXcrjcGe9F+2AJfyCuJvGSTUh9sYUPt13
 nzXTdGR/p9JPnQMvQ374ijwQ6SdzaRfYyODqhAgkQxteVchyf8hyjTeeO
 QhMIvAKP3V0WNNg7A+CYkLnmsOf8OF5kw/EWhAp+JBhV+bDg/n0IWE7uL
 1wVxZgzAqzYYu8BPv54MAyYaRYH6Om+IsbypHCl/7cbBjXqrwUFjL3RFg A==;
X-CSE-ConnectionGUID: kI8spMonTD+xfmfeFZmDSQ==
X-CSE-MsgGUID: BnRGMezhSU+NRhwUTYGmvw==
X-IronPort-AV: E=Sophos;i="6.11,210,1725314400"; d="scan'208";a="39508951"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 17 Oct 2024 08:50:50 +0200
X-CheckPoint: {6710B3CA-3D-8E59014-E6F31237}
X-MAIL-CPID: 9E28EFEFEF3BC99ED9E1708D756FE10F_1
X-Control-Analysis: str=0001.0A682F27.6710B3CB.0034, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF256170036; Thu, 17 Oct 2024 08:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729147846;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=14TXucqNvD7mQKvyCwt2zhHYdFZ3+y+5soiHU1J4lT0=;
 b=YkO6znv39zDavTSnnLppwOnFNgjBSQQGrdSbDLxqIOU5vsYHgxm4LQcY7L3bpmjW3wTUml
 aY1iRhZI7nUBuT7dOdJPnXgpfNqBAzY+4NXQM6gg9bL2BpE+LBxMNwOIsbO/Ssd186zId5
 ixqpFd9CGsNxpPa5E7YCFKMNhsQQ2M8HU/rC9kBeTlxdOBzPjq64Jy8UMXIFtZbKebvvOO
 7Wkdvmg6KrPSsmxcBRMEN642TnTcTUxcQ3Ok8j63KExQSnx8l5jy7MENFdpzPOwB07/Aan
 biSTf8myNOUw7iV9lbeHpwkOC6Nsdw3d+gN9ZfEDxubDZnoyn2agQ/OwTqHggg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Thu, 17 Oct 2024 08:50:43 +0200
Message-ID: <2007957.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ovzeljss5uv6rymlbdfjolnjox3dklcv3v2km73gqnh6vejxvg@afhyhfwmt3nf>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
 <2754373.mvXUDI8C0e@steina-w>
 <ovzeljss5uv6rymlbdfjolnjox3dklcv3v2km73gqnh6vejxvg@afhyhfwmt3nf>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi everyone,

Am Freitag, 27. September 2024, 01:13:57 CEST schrieb Dmitry Baryshkov:
> On Thu, Sep 26, 2024 at 04:09:03PM GMT, Alexander Stein wrote:
> > Hi Dmitry,
> >=20
> > Am Donnerstag, 26. September 2024, 08:05:56 CEST schrieb Dmitry Baryshk=
ov:
> > > On Thu, Sep 26, 2024 at 07:55:51AM GMT, Alexander Stein wrote:
> > > > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > > >=20
> > > > The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> > > > registers, or the access will hang. For simplicity, the PIXCLK is e=
nabled
> > > > unconditionally, resulting in increased power consumption.
> > >=20
> > > By this description it looks like a fix. What is the first broken
> > > commit? It needs to be mentioned in the Fixes: tag. Or is it hat
> > > existing devices have been enabling SCFG in some other way?
> >=20
> > We discussed this internally and it seems this never worked, unless PIX=
CLK
> > was already enabled in SCFG by a different way, e.g. firmware, etc.
>=20
> My bet was on the firmware, but I never touched Layerscape platforms.
> Anyway,
>=20
> Fixes: 109eee2f2a18 ("drm/layerscape: Add Freescale DCU DRM driver")
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Any additional feedback?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


