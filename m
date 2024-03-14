Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5087C3CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 20:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8C710E5B4;
	Thu, 14 Mar 2024 19:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DXScqs7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27F410E490
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 19:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGgx0M8RXCyJj2ox5Ot8QoJdvO1Y+IGWrIuZBt6JZyfp8hJmmB51aR7iKSQs/WYQoiRd8ZLFdBMNe2T9p1TldKlRhFDJgKIbfdLeVhmDL6qHxYawqxqkGpGGNbPRWf+akNz8e5wHhJHWw054vdcIE98WQUnGXLp6MmHLF6mVDvy65PkYNBv8RAU7Oh6MM65LbLLefK6yjJCV46ZTM9ntjYVPkpX4mN51VLVl9B8mEPnreZHv1Vgct1WqbLZdnC88z2iLra54AsAMXUkokwzvSqjrDPDSwQl3jYGA4IwijDNFsbp2tobkXCBqBAbhUhXsXJ8vyc/pKm0BXM30ibg+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHM4jONKJmyeoZsqz3fg+KMDU48asV9CZiaETJJvItk=;
 b=GN+jv+DxH6yoYx5DXpDEc99osdDddz2Pq0p5Uiiob+kTn7SC5OBooPtdq/Q7zbGffJgvrrJNA8ctc1/aUv41i2cKk91UXfTLO06YX/Cr6XxdDIjP2GJTQtDFvzfGWAw6VGjNC0nQdOzeJuC/Tc82OeOVT1Qx9k4g7CucNRZFRbhRY6LivYHxg2mGQxoY7vVmR0nt7ecw+Yh1hVY2pMzj3PvfUXsDBi8iy6Bi/CS+TcD2NCSZRW+cTvwTcrKbTY72z4GsKlBiudw4HfDkTaAQ5wHf8n694oEENxxtJQVWro1bkKH9IjGS9L+O14yPXoyLtKPpL+DPYTynuZlFr/tTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHM4jONKJmyeoZsqz3fg+KMDU48asV9CZiaETJJvItk=;
 b=DXScqs7ykLzeuwBZwm6fEdL4CVRjswVa97fKuqDY9jGjgLKNOEuqzBndHXR1nMewnG2S8TbYK7WOs3aHxZvnXOInzjQOOEJ/9I9Sb9QNjuCUNbW9gQF+3wwr0MNZXyr1fGDCGYLPZJdJQKN5L1CGzE47uJtdKpusRGSpj8KNApA=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 19:43:31 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 19:43:31 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Simek,
 Michal" <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 8/8] drm: xlnx: Intoduce TPG CRTC driver
Thread-Topic: [PATCH v2 8/8] drm: xlnx: Intoduce TPG CRTC driver
Thread-Index: AQHadOEjzq/Vahr1mEq0V8Suc/Gl2bE3Je0AgAB2zWA=
Date: Thu, 14 Mar 2024 19:43:30 +0000
Message-ID: <MW4PR12MB7165A15E233957E3914AA297E6292@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-8-a9c35dc5c50d@amd.com>
 <20240314-esoteric-delicate-sidewinder-5dc4db@houat>
In-Reply-To: <20240314-esoteric-delicate-sidewinder-5dc4db@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|CH3PR12MB7668:EE_
x-ms-office365-filtering-correlation-id: cd9377ab-cc12-4c8c-ea45-08dc445f06ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qA8PyGlTUw+Wa7WFKUkfYFGoKhABNxlUd9YCW8PS/7priCzEP5xDS6l5bidxM6teKgVsajIonsOSd455tjdEXgFNRi5v5L0g6EedWF4KIsQlhOi6X1ZFcZnvI4Al9DryVWoaPCicqZCZxGObbzgq+T6ZPvNISbXoSwcd+90p/5CAno+KZOVScgmr3AYvrIxVJ2TO7RLz8IprR8AnlB0tBn3baM2XX7dHZ8HWlVcYHdXxIcyKJZyR0yz3PqfuQxxJfKpnWXhZlKrzpjQ1tgBE283hoyFvY1n9FyM7HOjmjpiodUTSXkLKTbD4ODxbuqtQAJ3DTxx5zDDSE+P7NUft34Paos4XXTV2WRYxl+RSV1kTl6lGdaEwO1hJN8RL+MB+zg0nvaCrEox/yb1TJqAdQD2wx77SOf6bfjLJoTgYUfXQglfbWqaqmMzsRa9IOONq6eyMI4CnOVNHIOrW9NWdGP7EI7UuXsQCknR1Uq8o2PuRLq8TjXCD1hls+64ZO4RswCeDGbEVNVltopRGtCa/SMReuFvYLDLD55WSdRKCRQhur2X5kYiVJRppCuXDtHCTAN/+DQGggo9gWBKK4WljjexpsjoS+JqCWAN0fizm3hB0ChgawGHF1QcOXzrCG2dc+PNkD2fpP8cSMH97P8M6bnj6KKc3Kgs3hsr0XwHylZBGeRybU4sEDfr6sWfWo0iYCJLYmLB+3mYoW/gzDJkun7FecQZM38BLHJiIpBx8yyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dFiiNdazaCUapWHiqwROeDqHEUoiVhfWBirzm9VArvBPCOpE/Tpe1KnHngyN?=
 =?us-ascii?Q?iMmB0TlmkbOzcPmfxFbgnx+FGYF8kOcxBZTUDFQNNE0obnrsa5Dri+X7UNzJ?=
 =?us-ascii?Q?rc1MoH8JMIwDyiqD9ZhE8ehL7mEerhJRn6J5qwDMewLS1/Zmc/ouBP+Jaedu?=
 =?us-ascii?Q?GdwwNrdaPszIDR+MfHd9F6UPQIrUB9DqbkIWQoQ9oVEqBwqV+dfSyI5ZkKIQ?=
 =?us-ascii?Q?oZ60M2uefZQhotHCluHRJJT9ld88EB7NtlV5j/gRjqZF1tSZlHiCiefT+KuM?=
 =?us-ascii?Q?UvrdD7TgdCSLkG/MMBJhCqP2TRJru+me8/Zq6abdhgosFp9gEoXtymtNV9fG?=
 =?us-ascii?Q?0XgA5KseKnemUaGD8/7Zc3vWJb8y4zjge6MITMxgNmnXzksvKA9MXIrPx2Tf?=
 =?us-ascii?Q?VaLhJm8BbjtkLJ+ApSZoUSkkK2k+WwAHykkBkjfaCYk2TshIg/4cBnhnwKBJ?=
 =?us-ascii?Q?eChU+GdqTx5ke5yFWPszw1PO5472DeHDlqCLyT7+GsmXw34OMVNRrvr7iw3s?=
 =?us-ascii?Q?xfBHPHMhUh+HbtWi1jfo2nHsP+CnP6jqJGrqdPjJqNQoZkG4ZRKF0K36FGKV?=
 =?us-ascii?Q?wNAM3hkSxMTiUZliz+CzOB5Lk+Ui0JY23Kp2rJhR/lwpBlxZ9oF9tMng5zIR?=
 =?us-ascii?Q?ixWC3m7yUIkDauMyx15Y/Jc77JkeDyyYXhbjdiIpYmI7HY02u6G2iCvo7qnM?=
 =?us-ascii?Q?c36KluFiGQwrs4hXz9BFXeCxr2/9uPPrYuZVvcylTqRSIJiuII/O0YICHoY/?=
 =?us-ascii?Q?tHz+s2AjWcXsYAK/tQ+QTQyJqLy4fKQmSSUZKtrpLp7KDfX44/ZAF/0/Tuv9?=
 =?us-ascii?Q?2C8PtsWmtJWZdQlRR+VJpoHQvgOKJmrKqMDrpT6fowPIxTND2u9n1LPOI9xs?=
 =?us-ascii?Q?dicbJjXQe/By+YsZ8qFEkJiQ5tbjnloivZvXc08a27C5LOS+e1uIDkhbfUIZ?=
 =?us-ascii?Q?jF9EB105L32el3bhNrp4V2sDufqY8Dcv2WQMgvulTAyjxt5V+IcYFnXZonxG?=
 =?us-ascii?Q?iIQYolt/Th3mYzY2h9KYOnAjEWPJtKdggde3XeOwMSvFcRR9ZZZgIxKj83AK?=
 =?us-ascii?Q?24br8R4apeeDXwVKz1Zd2Z3pw9Ht5+YZ1RQ8lynrAz0m+mp1DguCpeV0EFK4?=
 =?us-ascii?Q?soTfFkRE9oFhK/4Rb8AE94vnEv47RNN0FeFBRI+yrINNMWq/H02iPp7O3myV?=
 =?us-ascii?Q?tjspmAEC8fi8XRgJ0M9KapSKDZqBjgMPsB6FUXZCrDN+IRVw0n93tcMZvNys?=
 =?us-ascii?Q?Gb0edZFgVtevW5D5IjU8NTTy91Bm82xjYN1aLhNEzaDZ88IU04PrrXBsHVzn?=
 =?us-ascii?Q?Nu3jlbvSxPIhO0synx7TKVamx3Xxgdu6ZvZk5vdTMoJRYzcnfxEx5eFluovi?=
 =?us-ascii?Q?YA8Qopqjp/vQCUELJjGkGWguF9Ltu+888M2qlaDeK4FKLJpECLkyMmFvwNsE?=
 =?us-ascii?Q?KgfyLHz3mHiaOeQpo3GVI77gg3BUm4HQI5Uf2Yihj0YaCvpHKHwGcVLQMG3M?=
 =?us-ascii?Q?8H+Sey2wGBWfceJvZvrIVXyZtFKmj95rDzYiNMKCogZCBqmOErwALgMc/3zv?=
 =?us-ascii?Q?lbKhnprmRRerhRYBz44=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9377ab-cc12-4c8c-ea45-08dc445f06ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 19:43:30.9641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKSD4FK5LMdM/MuO2vhxf7wUiJKk2PGwD+I4lI14Z+cE/jcHgPMDG+G0TNOs1y9dG9epROBRLCthtkykrBnANA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668
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

Hi Maxime,

Thank you for the review.

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Thursday, March 14, 2024 5:05 AM
> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Maarten Lankhor=
st
> <maarten.lankhorst@linux.intel.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter
> <daniel@ffwll.ch>; Simek, Michal <michal.simek@amd.com>; Andrzej Hajda
> <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Ro=
bert
> Foss <rfoss@kernel.org>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec
> <jernej.skrabec@gmail.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Mauro Carvalho Chehab <mchehab@kernel.org>; dri-
> devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> media@vger.kernel.org
> Subject: Re: [PATCH v2 8/8] drm: xlnx: Intoduce TPG CRTC driver
>=20
> Hi,
>=20
> On Tue, Mar 12, 2024 at 05:55:05PM -0700, Anatoliy Klymenko wrote:
> > DO NOT MERGE. REFERENCE ONLY.
> >
> > Add CRTC driver based on AMD/Xilinx Video Test Pattern Generator IP.
> > TPG based FPGA design represents minimalistic harness useful for
> > testing links between FPGA based CRTC and external DRM encoders, both
> > FPGA and hardened IP based.
> >
> > Add driver for AMD/Xilinx Video Timing Controller. The VTC, working in
> > generator mode, suplements TPG with video timing signals.
> >
> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
>=20
> As I said previously, we don't want to have unused APIs, so this patch sh=
ould be in
> a good enough state to be merged if we want to merge the whole API.
>=20

This is understandable, but even having this API just reviewed by the commu=
nity will open the path forward for aligning AMD/Xilinx downstream DRM driv=
ers with the upstream kernel.

> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * DRM CRTC
> > + */
> > +
> > +static enum drm_mode_status xlnx_tpg_crtc_mode_valid(struct drm_crtc
> *crtc,
> > +						     const struct
> drm_display_mode *mode) {
> > +	return MODE_OK;
> > +}
> > +
> > +static int xlnx_tpg_crtc_check(struct drm_crtc *crtc,
> > +			       struct drm_atomic_state *state) {
> > +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state, crtc);
> > +	int ret;
> > +
> > +	if (!crtc_state->enable)
> > +		goto out;
> > +
> > +	ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> > +	if (ret)
> > +		return ret;
> > +
> > +out:
> > +	return drm_atomic_add_affected_planes(state, crtc); }
> > +
>=20
> [...]
>=20
> > +
> > +static u32 xlnx_tpg_crtc_select_output_bus_format(struct drm_crtc *crt=
c,
> > +						  struct drm_crtc_state
> *crtc_state,
> > +						  const u32 *in_bus_fmts,
> > +						  unsigned int
> num_in_bus_fmts) {
> > +	struct xlnx_tpg *tpg =3D crtc_to_tpg(crtc);
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < num_in_bus_fmts; ++i)
> > +		if (in_bus_fmts[i] =3D=3D tpg->output_bus_format)
> > +			return tpg->output_bus_format;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs xlnx_tpg_crtc_helper_funcs =
=3D {
> > +	.mode_valid =3D xlnx_tpg_crtc_mode_valid,
> > +	.atomic_check =3D xlnx_tpg_crtc_check,
> > +	.atomic_enable =3D xlnx_tpg_crtc_enable,
> > +	.atomic_disable =3D xlnx_tpg_crtc_disable,
> > +	.select_output_bus_format =3D xlnx_tpg_crtc_select_output_bus_format,
> > +};
>=20
> From that code, it's not clear to me how the CRTC is going to be able to =
get what
> the format is.
>=20

It's coming from DT "bus-format" property. The idea is that this property w=
ill reflect the FPGA design variation synthesized.=20

> It looks like you hardcode it here, but what if there's several that woul=
d fit the
> bill? Is the CRTC expected to store it into its private structure?
>=20

It's impractical from the resources utilization point of view to support mu=
ltiple runtime options for FPGA-based CRTCs output signal format, so the bu=
s-format will be runtime fixed but can vary between differently synthesized=
 instances.

> If so, I would expect it to be in the crtc state, and atomic_enable to ju=
st reuse
> whatever is in the state.
>=20

This could be totally valid for different kinds of CRTCs, although for this=
 particular case, the bus-fomat choice is runtime immutable.

> Maxime

Thank you,
Anatoliy
