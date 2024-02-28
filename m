Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9A86BA51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 23:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557CC10E18D;
	Wed, 28 Feb 2024 22:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gMuRm0mO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5810E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 22:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNWHE7QWIaSQoUsPJamUSHOZRwptzizgZ2WalkIf+BGo/oG9yiJpzjUtC/G285flHQMxHmXlMTwCshKs6tOI7Z9RCAb5ThVUDDOHwzezosiThkIsZWuigD+QViUoFrgz0bjErpLgkol2Vl0RsJTiF1uOUBOSgHibBCP4bM8EXSUP3JOPqtmO0DYHVn8kTWptSJGXEEma73c5slbpD7W6jKeOVCtcX+siPzycGKrbcah2frHVEeJrz6uYm+IR/RgJpg4VyB5IVawpmm+Xq+vPXSaE0TZqpZ3nBsFBcyhLPeX8lojXl84sKengdvl+M7CX+LOscnLMwVPhreZrHPzW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rSSgaTNh4QcCH36G6qgl0xsQVtHbeyyLcQkloogpaM=;
 b=NULuYrTgsdLVzwMK/F58THnhndK3VtsNzQoUcl3Wfgl1BJqvzQ40mgPdsObEYfltCW6GrfGxazgP14JL7nHEOXsfggnTQ6XQaGWPgq/qR/pKgGCrP2AlCZFg2tY6zFg12Cd7+o4tIq5SXXL0e82h1I8MZnOlJNtdzG7Gzua++GWoNNihGQeiW1o9HN31OlXBV2a5nfVWH/DhPBTG8WH9J7VTTzJKiS322D4oPoi7R7GvZhM65N6pyu9Fk1K6CGVovMU+19KPCpJHWKT6SVYTygVlLCG//MFIB+Sc5XLUPKMaQXkulztqmiZTJPQSoxfJY1hvwlDTLheatenw6JRmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rSSgaTNh4QcCH36G6qgl0xsQVtHbeyyLcQkloogpaM=;
 b=gMuRm0mOiQ3E3q1fNFYw6uJ0UKYtOf0ycA8DoVzvWEnRPiQXr+5ETNf+vFm16debq8zajRRdXi7bN8Nzkta+HJ4gCjkcIsuXmwwNIoJppzhjQnYxK8Q1ap0f9cTFPtTa4nIvQIM9E9r6rAohXWrkhqGrQ83pj+myitpEsA0ExmQ=
Received: from PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 22:00:19 +0000
Received: from PH7PR12MB7163.namprd12.prod.outlook.com
 ([fe80::5f0:63bb:49fb:e647]) by PH7PR12MB7163.namprd12.prod.outlook.com
 ([fe80::5f0:63bb:49fb:e647%4]) with mapi id 15.20.7316.034; Wed, 28 Feb 2024
 22:00:19 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Simek,
 Michal" <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
 callback
Thread-Topic: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
 callback
Thread-Index: AQHaapGE8X8PDnmqPkCPFIu/krDfHg==
Date: Wed, 28 Feb 2024 22:00:19 +0000
Message-ID: <PH7PR12MB7163136599B97B071979E72EE6582@PH7PR12MB7163.namprd12.prod.outlook.com>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-4-b78c3f69c9d8@amd.com>
 <20240228-nifty-flashy-shrew-905edc@houat>
In-Reply-To: <20240228-nifty-flashy-shrew-905edc@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7163:EE_|LV2PR12MB5775:EE_
x-ms-office365-filtering-correlation-id: 73cde6fc-896a-4d18-0362-08dc38a8a754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: btKIHyBsMatI9ppKIiWl/S3OVN7jp4DIw4kEw0rs4i+ATH00xjQbwgefUQImODlUeHbh0vKX2HbFOxAfYn6rbHGw3K4mNOiitERy96vamaE+hupb4J5RTzAhq6eGECSOCQZmgQs2+nAJxKaVA+1jaCErGBn2UMTnpXNlUuf8UmDy/9trvxLMTxGOqQbbUO0mZbbzo8AzxLrL8TCDCvAlpprMyWGC+zd+voaN2ivXXRSZZ7IN8CXVRD+R4TtS12Zc9qV36f37G+Md2xTYTJ8QvSsX4uf4lpY7Nm86XeartOcEbUqfZRxwucUqu517/0PNAYAx07btEHMUf3/U62/BrrH4QICahU8yAqvsEJo6NxppFV3BOXqfYRHBPc+2x7NL1eJwSkoSQCAJCeztKy7+6nCrTY7gVHSnTp/q32aLoHnkDHSS9P8ZBorerNaSp+eJN4VtJWL+xmvicGa1QC3Ky858UeNKvpQFBAvxroQ8uA7RLE1lAi+XvaGplI42Tz+jWeJLifvUCtfYyA+RZ/bEYzoBqxQB4yOovRa0tLgvK1W5n60yviP/sztfl0bHleC037jqOGz+IKWL/IcZPRD/HpLrDsD6m5Yr3isQ5Ms3K2ZnHKDjOW8kdFEDv+mGmSY/Dc+eykFgkDrtXD+XPSjGCerLZfiKJCeUM8aDK4Xe19xv0I0MV0HgYodhwV1oUeZzA/yLQQmmUy2zQ0XwENxXOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7163.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5xV5nMQ5xmdWKHE7lynoFA05qa9ms7CAL9Eski1TifZ6ytDiuTm083hdZj/x?=
 =?us-ascii?Q?PbMl2PE9wmFZJQhBXADmvgsITUSMN9RgFZZLloPbIUaYHSptgteFr+QY15y0?=
 =?us-ascii?Q?0QIs5ndBaKbkypEyn6PMlWUu+RZmWj+/IQvTmIj2V19MomWo4VKrkWAfV7tz?=
 =?us-ascii?Q?RVFp+HfvLZqzYwQqGdXrLvlThJK0SuIzO3q8l8MaqsnIBWCJ1LvbBY2ZwQSh?=
 =?us-ascii?Q?tX9JN1TuCUI5gE3X1y09sKMZ/rCH9t1AAmTeIIzk1YRnJy+e70fBeDZMc+kr?=
 =?us-ascii?Q?RKsJqLL3gprghTKIagZb0Zuj7q1D2MN8uqW6f9xcScVjmbxeYqWOKdgaG4wH?=
 =?us-ascii?Q?Q74pqJi2b1m0luIUGbh+dVWa8ZaRUad1PBgAkhe5mha/aOGyO2230IXinC1J?=
 =?us-ascii?Q?zA18ISqJUOEyTT1XduiuCsbyUyR5dQT34psjtmTCca9SD4HNVVrSGW1AFvdu?=
 =?us-ascii?Q?6ydttgDFW3N+BPIUTr4/n/9Dlspk+sMGWgdGdTaSgi/KvczBMVX4z7t759sP?=
 =?us-ascii?Q?EP0cFU9j0/AlBQZQioxZbmg4/yiqmYNms7tW0L7lF86PVpuTZoh+fHosqjp9?=
 =?us-ascii?Q?efaSUuFDrr3LY7G1ZTSJB2g885NrphRHXuD81zElcrrBm8yIcH1XfgW9zzsI?=
 =?us-ascii?Q?yz0bC6ilTb8sc1RQ2D4B33JYK1JhP23G+K4lf/MNN4jAy8qsAFhXWj96MFsI?=
 =?us-ascii?Q?EUO2azNNCISvsPgUgDiA0rY2QK5rF4zlWxj3idw+RyKKX/5HGkNOo8025Lqw?=
 =?us-ascii?Q?uW6b56AR67/y3ELFcV4WET0+dUkUdSzHlxxj8Qe4hpwspi+X4iXXubhHdTSq?=
 =?us-ascii?Q?o8s9qLaqYe/UXYvBXVCSzQvPnhOBjDivnOqLjFkKcTBnTSrcx1Y+p2InNqZf?=
 =?us-ascii?Q?9493iSbJEJJVgQI37OIUiP9sq4DkkgMP/IIDrVsRera2Y13HJUvQGl5Bc0wl?=
 =?us-ascii?Q?PgLYyQGw1fGc0/vAlPGyYQinpLr0YpqDICA1GyF0anDOAE6YjHK7acpGIe6k?=
 =?us-ascii?Q?yFXu6yQ4O/bqWsv+ogfukruukS7cDchC9VfpJwoXeMOHyAp6+SB5SLxVhAGk?=
 =?us-ascii?Q?QIVzHBH6OOIOsKwM87v6kXQKtEGpBr8feRrx1qT1cMmE60rW2l5tV6PFjALT?=
 =?us-ascii?Q?gMs7VthdGcxeYsMynw5p4mcfggp8NCPyHJ15J52lGD4KJC9KP+sWrv5LSvbV?=
 =?us-ascii?Q?C5mteYwVqYsZ7Mdod2LNTpFcF4l/SY/R++u3q+3/93Yjz9USBBH8dCTLdFAV?=
 =?us-ascii?Q?YzwKCfSU2oqnSxB8NInCg9LoJ2nMCEwrSFL8lu36Nopq47LZiFVQo27hgiF2?=
 =?us-ascii?Q?5EQR9zdoY91wuaQL9SNGC87y7dQNgveNPuVm0sKr7euNZKG1fHZvegI3xbos?=
 =?us-ascii?Q?q8MmSzRarbdUJCVm5cGUVpfygJNFX4Afarkj9Pf97dTId+mWnjFOqeoF8W/z?=
 =?us-ascii?Q?VXEjtdoIJvVVH0czPiVHpNBYLi8t/YRMKcESIyhlu+p0lA52X55hXWqayzBV?=
 =?us-ascii?Q?aIlvUBrp5VhuvZ9inkzOjVtSeqWj4y0I7PaXCsSy1bfhod6Kc4XfvZxEGmj4?=
 =?us-ascii?Q?eTLUZXK2Rklmf8Xv6Hg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7163.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cde6fc-896a-4d18-0362-08dc38a8a754
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 22:00:19.2674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WvIKRpAbGd4wAYmfDDKKujoo9p6lFoTpr6A2Vnj3wwCdhGKtGmAKhQaS3uCmO92gHF97j4ZikXNDRZHXXI7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
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

Thanks for the review.

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Wednesday, February 28, 2024 7:30 AM
> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Maarten Lankhor=
st
> <maarten.lankhorst@linux.intel.com>; Thomas Zimmermann
> <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter
> <daniel@ffwll.ch>; Simek, Michal <michal.simek@amd.com>; Andrzej Hajda
> <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Ro=
bert
> Foss <rfoss@kernel.org>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec
> <jernej.skrabec@gmail.com>; dri-devel@lists.freedesktop.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
> callback
>=20
> Hi,
>=20
> On Mon, Feb 26, 2024 at 08:44:45PM -0800, Anatoliy Klymenko wrote:
> > Add select_output_bus_format to CRTC atomic helpers callbacks. This
> > callback Will allow CRTC to participate in media bus format
> > negotiation over connected DRM bridge chain and impose CRTC-specific
> restrictions.
> > A good example is CRTC implemented as FPGA soft IP. This kind of CRTC
> > will most certainly support a single output media bus format, as
> > supporting multiple runtime options consumes extra FPGA resources. A
> > variety of options for FPGA are usually achieved by synthesizing IP
> > with different parameters.
> >
> > Incorporate select_output_bus_format callback into the format
> > negotiation stage to fix the input bus format of the first DRM bridge i=
n the
> chain.
> >
> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c             | 19 +++++++++++++++++--
> >  include/drm/drm_modeset_helper_vtables.h | 31
> > +++++++++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c
> > b/drivers/gpu/drm/drm_bridge.c index 521a71c61b16..453ae3d174b4 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> >
> > @@ -879,7 +880,8 @@ static int select_bus_fmt_recursive(struct drm_brid=
ge
> *first_bridge,
> >  	unsigned int i, num_in_bus_fmts =3D 0;
> >  	struct drm_bridge_state *cur_state;
> >  	struct drm_bridge *prev_bridge;
> > -	u32 *in_bus_fmts;
> > +	struct drm_crtc *crtc =3D crtc_state->crtc;
> > +	u32 *in_bus_fmts, in_fmt;
> >  	int ret;
> >
> >  	prev_bridge =3D drm_bridge_get_prev_bridge(cur_bridge);
> > @@ -933,7 +935,20 @@ static int select_bus_fmt_recursive(struct drm_bri=
dge
> *first_bridge,
> >  		return -ENOMEM;
> >
> >  	if (first_bridge =3D=3D cur_bridge) {
> > -		cur_state->input_bus_cfg.format =3D in_bus_fmts[0];
> > +		in_fmt =3D in_bus_fmts[0];
> > +		if (crtc->helper_private &&
> > +		    crtc->helper_private->select_output_bus_format) {
> > +			in_fmt =3D crtc->helper_private-
> >select_output_bus_format(
> > +							crtc,
> > +							crtc->state,
> > +							in_bus_fmts,
> > +							num_in_bus_fmts);
> > +			if (!in_fmt) {
> > +				kfree(in_bus_fmts);
> > +				return -ENOTSUPP;
> > +			}
> > +		}
> > +		cur_state->input_bus_cfg.format =3D in_fmt;
>=20
> I don't think we should start poking at the CRTC internals, but we should=
 rather
> provide a helper here.

Makes sense, thank you. ACK.

>=20
> >  		cur_state->output_bus_cfg.format =3D out_bus_fmt;
> >  		kfree(in_bus_fmts);
> >  		return 0;
> > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > b/include/drm/drm_modeset_helper_vtables.h
> > index 881b03e4dc28..7c21ae1fe3ad 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -489,6 +489,37 @@ struct drm_crtc_helper_funcs {
> >  				     bool in_vblank_irq, int *vpos, int *hpos,
> >  				     ktime_t *stime, ktime_t *etime,
> >  				     const struct drm_display_mode *mode);
> > +
> > +	/**
> > +	 * @select_output_bus_format
> > +	 *
> > +	 * Called by the first connected DRM bridge to negotiate input media
> > +	 * bus format. CRTC is expected to pick preferable media formats from
> > +	 * the list supported by the DRM bridge chain.
>=20
> There's nothing restricting it to bridges here. Please rephrase this to r=
emove the
> bridge mention. The user is typically going to be the encoder, and bridge=
s are just
> an automagic implementation of an encoder.
>=20

OK. I'll fix than in the next version.

> And generally speaking, I'd really like to have an implementation availab=
le before
> merging this.
>

Well, 2 instances of this callback implementations exist as drafts, as this=
 is the new API. A little bit of a chicken and egg problem. I'll try to gro=
om at least one of them into upstreamable shape and attach it to the patch =
set.

> Maxime

-Anatoliy
