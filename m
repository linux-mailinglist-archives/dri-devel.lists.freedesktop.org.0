Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E73E549E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 09:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5318E89D9B;
	Tue, 10 Aug 2021 07:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5A389D9B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 07:52:45 +0000 (UTC)
Date: Tue, 10 Aug 2021 09:52:36 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
To: Paul Boddie <paul@boddie.org.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, David Airlie
 <airlied@linux.ie>, linux-mips <linux-mips@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Message-Id: <OV5MXQ.C3JR71EBG5P51@crapouillou.net>
In-Reply-To: <2242071.3D3ZAXhqrE@jason>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
 <0TYKXQ.YAJ6UYG2GTXS1@crapouillou.net> <2242071.3D3ZAXhqrE@jason>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Paul,

Le mar., ao=FBt 10 2021 at 01:17:20 +0200, Paul Boddie=20
<paul@boddie.org.uk> a =E9crit :
> On Monday, 9 August 2021 18:22:12 CEST Paul Cercueil wrote:
>>=20
>>  Le lun., ao=FBt 9 2021 at 13:14:03 +0200, H. Nikolaus Schaller
> <hns@goldelico.com> a =E9crit :
>>  >
>>  > quick feedback: our HDMI on top compiles fine after fixing 2 merge
>>  > conflicts, but dos not yet work.
>>  > Will need some spare time with access to the CI20 board to=20
>> research
>>  > the issue, i.e. can not give feedback immediately.
>>=20
>>  Alright, no problem. I'll be back home in about 2 weeks and then I=20
>> can
>>  test on my CI20 as well.
>=20
> Just for reference, I looked into this initialisation failure. The=20
> HDMI
> peripheral driver gets initialised satisfactorily...
>=20
> dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a=20
> with HDCP
> (DWC HDMI 3D TX PHY)
> dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2C bus=20
> driver
>=20
> But then the reported error occurs in the DRM driver:
>=20
> ingenic-drm 13050000.lcdc0: Unable to init connector
> ingenic-drm: probe of 13050000.lcdc0 failed with error -22
>=20
> This originates in a call to drm_bridge_connector_init from=20
> ingenic_drm_bind:
>=20
> connector =3D drm_bridge_connector_init(drm, encoder);
>=20
> The invoked function iterates over the registered bridges, one of=20
> which seems
> to be the HDMI peripheral (it has bridge operations defined=20
> identically to
> those specified in the Synopsys driver), but the type member of the=20
> drm_bridge
> structure is set to 0 (DRM_MODE_CONNECTOR_Unknown).
>=20
> I might expect the bridge to expose a type acquired from its=20
> connector, but I
> don't see this propagation occurring in the Synopsys driver:=20
> dw_hdmi_probe
> sets the bridge operations and other members of the drm_bridge=20
> structure, but
> it doesn't set the type.
>=20
> Also, it might be possible that dw_hdmi_connector_detect (exposed as=20
> the
> detect operation) is not getting called, and this would explain why=20
> the
> bridge's connector member does not have the connector_type set,=20
> either (since
> it is also set to 0).

 From what I understand the last bridge in the chained list is supposed=20
to set the connector type. The HDMI driver's probe function should get=20
a pointer to the next bridge in the queue and attach it (see how=20
ite-it66121.c does it). The last bridge in the queue should be=20
"hdmi-connector" (display-connector.c) which will effectively set the=20
connector type.

Cheers,
-Paul


