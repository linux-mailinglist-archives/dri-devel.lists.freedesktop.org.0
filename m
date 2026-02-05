Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHZhFphjhGkK2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:32:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA9F0CF6
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3F10E81A;
	Thu,  5 Feb 2026 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="qBGotRTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1EB10E81A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770283922; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dt6c+lGTk7TFncQIuSv5MzP6r3530psaQoAjw9ySuJWEkCy1CGqZVxiox53v8AQYnHIuYdxJZxfKYrZbfPOaURzUHD/+Yk7Hc4Rv01RsTDM+dwsZsWdrVGkxbCTqvA6GlOAN61CPjD15gySk/KEr/yZwZbEDrjZe7odvRey6Sfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770283922;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6s3Fiw0IohGEWd3mxUYh7sVioub9N6nKr760G37qtso=; 
 b=Vvcub+bCtndQCVN2YRgMcdJP+yUaucF5RJBUafIUi255IQPFLylTF6ECEctIZTJkPKTdAdnQbqqmu1v7XtX5RvDWwXNQlAOKOxcwnsoIR2rfx2R2ieiQSsfD5S3PGQI5Fd3NfLOPsysX1cL2xx/OWj97GCmc9jzhCLNuAyjO3zM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770283922; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=6s3Fiw0IohGEWd3mxUYh7sVioub9N6nKr760G37qtso=;
 b=qBGotRTUIVAisc5FCEluUVdBvZ4YXt37q89wHuU8jRbNnllvR3SrgyL7fXSMr4vX
 TTiDFMQzsJYG8kRddEl9ErMykSIe3LQXP+a6Aka4Bjjl1QgpApZ1wdgiUELVVbKQiSO
 pPkRvN56hzrIeKpwVmMrBAggoJ34r7egwn0kWp+Y77YS/kb20lEfma875F3KiZT5h9m
 tH+RiWUK0KF64TQmwW/2tkXFqlRdnRJ5QKfx+TzNn3Iz8u38lZIw11eimW4YpnkXnyV
 YLOaRZVq9H00KZBjp9UVwhZ2Ue93pjBeDNHhJ+AK1XUoOjJ17bOzCNkVDQm1afOV+Ir
 wmxF0NjXiA==
Received: by mx.zohomail.com with SMTPS id 1770283921434896.1591653598891;
 Thu, 5 Feb 2026 01:32:01 -0800 (PST)
Message-ID: <7958c0021c7a50c33ffe637ec5ee5b2e2a451ca2.camel@icenowy.me>
Subject: Re: [PATCH v7 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <gaohan@iscas.ac.cn>,  Yao Zi
 <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 05 Feb 2026 17:31:50 +0800
In-Reply-To: <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <ccb973b8-4b13-4a70-be48-06b2cbe0adf8@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:gaohan@iscas.ac.cn,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2EA9F0CF6
X-Rspamd-Action: no action

=E5=9C=A8 2026-02-05=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 10:30 +0100=EF=BC=
=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> patches 1 to 5 have been merged into drm-misc-next. In patch 3, I=20
> replaced COMPILER_TEST with COMPILE_TEST in the Kconfig file.

Ah, Thanks for correcting this.

Thanks,
Icenowy

>=20
> Best regards
> Thomas
>=20
> Am 29.01.26 um 03:39 schrieb Icenowy Zheng:
> > This patchset tries to add a driver for Verisilicon DC8200 driver,
> > and
> > demonstrates the driver on T-Head TH1520 with its HDMI output.
> >=20
> > This display controller IP is used on StarFive JH7110 too, but as
> > the
> > HDMI controller used there isn't as common as the DesignWare one, I
> > choose to use TH1520 in this patchset.
> >=20
> > The DC driver is written with other DC-series (mainly DC8000, which
> > is
> > known to be used on Eswin EIC7700 SoC) display controllers in mind,
> > and
> > uses the identification registers available on all Vivante branded
> > IPs.
> > A known exception is DCNano display controller, which is unlikely
> > to be
> > supported by this driver because of totally different register map
> > and
> > no known identification registers. (P.S. the in-tree loongson DRM
> > driver
> > seems to be for some DCNano instances based on the register map.)
> >=20
> > The HDMI controller seems to come with some common PHY by Synopsys,
> > the
> > DesignWare HDMI TX 2.0 PHY. By searching a few register names from
> > the
> > BSP driver of that PHY, that PHY seems to be used by a in-tree dw-
> > hdmi
> > glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
> > contains all 6 registers set here in the th1520-dw-hdmi driver.
> > Some
> > more suprising thing is that RK3288 uses the same PHY too, but the
> > in-tree dw_hdmi-rockchip driver writes the configuration data array
> > in a
> > weird way to reuse the HDMI 3D TX PHY configuring function. It
> > might be
> > valuable to add common configuring function and configuration data
> > definition for this HDMI 2.0 PHY too, but the current driver in
> > this
> > patchset simply duplicated most configuration logic from
> > rcar_dw_hdmi
> > driver (but with 3 extra configuration registers configured, which
> > is
> > done by their downstream kernel).
> >=20
> > This revision contains only little code change -- only a Kconfig
> > select
> > is added. The other purpose is to collect Thomas Zimmermann's tags
> > and
> > squash MAINTAINERS change to real driver per his suggestion.
> >=20
> > Icenowy Zheng (8):
> > =C2=A0=C2=A0 dt-bindings: vendor-prefixes: add verisilicon
> > =C2=A0=C2=A0 dt-bindings: display: add verisilicon,dc
> > =C2=A0=C2=A0 drm: verisilicon: add a driver for Verisilicon display
> > controllers
> > =C2=A0=C2=A0 dt-bindings: display/bridge: add binding for TH1520 HDMI
> > controller
> > =C2=A0=C2=A0 drm/bridge: add a driver for T-Head TH1520 HDMI controller
> > =C2=A0=C2=A0 riscv: dts: thead: add DPU and HDMI device tree nodes
> > =C2=A0=C2=A0 riscv: dts: thead: lichee-pi-4a: enable HDMI
> > =C2=A0=C2=A0 mailmap: map all Icenowy Zheng's mail addresses
> >=20
> > =C2=A0 .mailmap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 .../display/bridge/thead,th1520-dw-hdmi.yaml=C2=A0 | 120 ++++++
> > =C2=A0 .../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 122 ++++++
> > =C2=A0 .../devicetree/bindings/vendor-prefixes.yaml=C2=A0 |=C2=A0=C2=A0=
 2 +
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0 .../boot/dts/thead/th1520-lichee-pi-4a.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0 25 ++
> > =C2=A0 arch/riscv/boot/dts/thead/th1520.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 66 ++++
> > =C2=A0 drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/bridge/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> > =C2=A0 drivers/gpu/drm/bridge/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/bridge/th1520-dw-hdmi.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 173 ++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
> > =C2=A0 drivers/gpu/drm/verisilicon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_bridge.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 371
> > ++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_bridge.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 39 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_bridge_regs.h=C2=A0 |=C2=A0 54 ++=
+
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 191 +++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_crtc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_crtc_regs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 60 +++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_dc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 207 ++++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_dc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 38 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h=C2=A0 |=C2=A0 27 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 182 +++++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_hwdb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 150 +++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_hwdb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 ++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_plane.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 124 ++++++
> > =C2=A0 drivers/gpu/drm/verisilicon/vs_plane.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 72 ++++
> > =C2=A0 .../gpu/drm/verisilicon/vs_primary_plane.c=C2=A0=C2=A0=C2=A0 | 1=
73 ++++++++
> > =C2=A0 .../drm/verisilicon/vs_primary_plane_regs.h=C2=A0=C2=A0 |=C2=A0 =
53 +++
> > =C2=A0 31 files changed, 2384 insertions(+)
> > =C2=A0 create mode 100644
> > Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-
> > hdmi.yaml
> > =C2=A0 create mode 100644
> > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > =C2=A0 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.=
c
> > =C2=A0 create mode 100644
> > drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> >=20
>=20

