Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DF23E53E6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 08:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88E89E26;
	Tue, 10 Aug 2021 06:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Mon, 09 Aug 2021 23:25:14 UTC
Received: from smtp2.de.opalstack.com (smtp2.de.opalstack.com
 [139.162.136.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D731589DE5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 23:25:14 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp2.de.opalstack.com (Postfix) with ESMTPSA id 28644127909;
 Mon,  9 Aug 2021 23:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
 s=dkim; t=1628551046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESqyDYqed0L+jmDAA13fMCcbg4AcR1LU+fD4aUu1PY4=;
 b=w4p/FItTz5sWMg+MXCDGPOwlTGas3+TeyXUdWEN22YWs/AOX3Q2efK6quHo6NR8ACw7NUM
 /3bqHZfraBQXTtD6Wswj6f7Gx/2SvMdQbPAlXhPUHhplvJR72/MlzpMbJ7dP3EwPtYM+OV
 tCyQmpw06Axbo/PyNVfjDERqsSu/rkE=
From: Paul Boddie <paul@boddie.org.uk>
To: Paul Cercueil <paul@crapouillou.net>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
Date: Tue, 10 Aug 2021 01:17:20 +0200
Message-ID: <2242071.3D3ZAXhqrE@jason>
In-Reply-To: <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
 <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.52
X-Mailman-Approved-At: Tue, 10 Aug 2021 06:51:13 +0000
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

On Monday, 9 August 2021 18:22:12 CEST Paul Cercueil wrote:
>=20
> Le lun., ao=FBt 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> >
> > quick feedback: our HDMI on top compiles fine after fixing 2 merge
> > conflicts, but dos not yet work.
> > Will need some spare time with access to the CI20 board to research
> > the issue, i.e. can not give feedback immediately.
>=20
> Alright, no problem. I'll be back home in about 2 weeks and then I can
> test on my CI20 as well.

Just for reference, I looked into this initialisation failure. The HDMI=20
peripheral driver gets initialised satisfactorily...

dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a with HDCP=
=20
(DWC HDMI 3D TX PHY)
dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2C bus driver

But then the reported error occurs in the DRM driver:

ingenic-drm 13050000.lcdc0: Unable to init connector
ingenic-drm: probe of 13050000.lcdc0 failed with error -22

This originates in a call to drm_bridge_connector_init from ingenic_drm_bin=
d:

connector =3D drm_bridge_connector_init(drm, encoder);

The invoked function iterates over the registered bridges, one of which see=
ms=20
to be the HDMI peripheral (it has bridge operations defined identically to=
=20
those specified in the Synopsys driver), but the type member of the drm_bri=
dge=20
structure is set to 0 (DRM_MODE_CONNECTOR_Unknown).

I might expect the bridge to expose a type acquired from its connector, but=
 I=20
don't see this propagation occurring in the Synopsys driver: dw_hdmi_probe=
=20
sets the bridge operations and other members of the drm_bridge structure, b=
ut=20
it doesn't set the type.

Also, it might be possible that dw_hdmi_connector_detect (exposed as the=20
detect operation) is not getting called, and this would explain why the=20
bridge's connector member does not have the connector_type set, either (sin=
ce=20
it is also set to 0).

Paul


