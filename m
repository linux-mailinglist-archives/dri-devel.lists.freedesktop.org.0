Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F25F987520
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1D610EB60;
	Thu, 26 Sep 2024 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ELCI9Ljg";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OPWxx9X4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ABC10EB60
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1727359754; x=1758895754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aU7DhuM0MRl/oleJUgNjJ5QLB7b0wpiBWF3UI3tBfO8=;
 b=ELCI9Ljg9tROS/b7AKj4VWhZZEXDTG6zoxJFPXxMqyNAFy9e4VZ15fez
 hfPvXwEMGjOSdU7NhmwfbhkPFYjXRCgoAIAYNfVz0T2LP5CxvZb9EQy/s
 ixvbk2A1qQBaVl9lqLx052I1VPeYKhoNs41LWTAOBo3ftZbOyGT9CXaDc
 PLjIIRFb9AXh18CP8YpdxYgiwh1lHzjPApfWABqXMiFFq1y3qT75EknNY
 vLhcvQ/om/VTnn22rOXA4pUKPZzZ7Swc5PcLBsz1YyhHJ/DLUfq98HVV0
 h1dqbVmgVIdwYTGeMbEshgbSR0WL5bSbC/bEZaTxdXa2Hg5Gg7+SL+wvI Q==;
X-CSE-ConnectionGUID: WesfB8g6TUKNOiDFyfVYYQ==
X-CSE-MsgGUID: oLILoqlWRbGX4q8dhpshqw==
X-IronPort-AV: E=Sophos;i="6.11,155,1725314400"; d="scan'208";a="39145675"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Sep 2024 16:09:11 +0200
X-CheckPoint: {66F56B07-1-B62731C4-FB8D8F8A}
X-MAIL-CPID: 52217610F519004650615E3A9DFC3094_3
X-Control-Analysis: str=0001.0A682F20.66F56B07.00CA, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 965B4163464; Thu, 26 Sep 2024 16:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1727359746;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aU7DhuM0MRl/oleJUgNjJ5QLB7b0wpiBWF3UI3tBfO8=;
 b=OPWxx9X4ANG+tfcreBmeS7UkQnvUB8Tdyb3lXfCasPbyVNlo51xaTvZixvroKUOUzmSLZt
 Nm7+NU9S8+iOyDJlYY5c9MWNMr+aB9kcNGz+szuokdlhPEg9e+fJz/NyVlZcysPfnTAxCG
 vJ8A/goAltjeIWEB5wUW8hAZLK0BNpTGlS+SErUZcIa+6WMiBKNgDcwdl5hGoyOPK1VvHb
 yVwwrnz3tfNIcdfvv98iPWHJQw8E46dip1xZRbKUCnwZHmhqoHEFyimeIN6azYSLxPTMtz
 DVZvlFI+hrz5tGHoTSVQ9LstuT+rS7979zREacLyehfrn0HJYWU+RmQq2LuV3Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Thu, 26 Sep 2024 16:09:03 +0200
Message-ID: <2754373.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <tosilxaxfg6hejtqs2fslf6ez5pdg5yxj776pohmodja3bn5jp@4jbdprx52fqx>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
 <20240926055552.1632448-2-alexander.stein@ew.tq-group.com>
 <tosilxaxfg6hejtqs2fslf6ez5pdg5yxj776pohmodja3bn5jp@4jbdprx52fqx>
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

Hi Dmitry,

Am Donnerstag, 26. September 2024, 08:05:56 CEST schrieb Dmitry Baryshkov:
> On Thu, Sep 26, 2024 at 07:55:51AM GMT, Alexander Stein wrote:
> > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> >=20
> > The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> > registers, or the access will hang. For simplicity, the PIXCLK is enabl=
ed
> > unconditionally, resulting in increased power consumption.
>=20
> By this description it looks like a fix. What is the first broken
> commit? It needs to be mentioned in the Fixes: tag. Or is it hat
> existing devices have been enabling SCFG in some other way?

We discussed this internally and it seems this never worked, unless PIXCLK
was already enabled in SCFG by a different way, e.g. firmware, etc.

Best regards,
Alexander

> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Add note about power consumption in commit message
> > * Add note about power consumption in comment
> > * Fix alignment
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


