Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9B824373
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D644510E477;
	Thu,  4 Jan 2024 14:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5710E477
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 14:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSB+3HTu9jdwo96EWZPRjvQIPne36PmbftCmFS0YAOixeLwReQy32HdKPoWR/dn9E4KzHFGAfvt4UFKULWsALyS3NnjLXiQ96eifAauC1bpTOH1MqDwyA8+mF+C4zTVTPq6zvv0cfmvehjoHhJKBcmJa3WCTVtsTD3GI7BHMAA8+/Nyi4Pat0pTYQHsEdk5hSsZwDo9VAaXe1ezWijap0oFtoOyMwLuM5zJ2M+B0h3x1FME/jWP3vvnoGVOTzBKA4CU9HrvJRgGD9XfgylAGbIaP+VWs2WjHZk3hRr0SjhgzIsj38tSXxXq2m+Niphv2M3JTs0lO0NlCmfM/Iw4pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqFeUNVy9TvWWZ4j/GQsbh9gji/V5ss32n3CNVojFRU=;
 b=Sp+eD64wOfXbixzgNWdPXUo8qFHzjwLv3lPbJtOZI6vYgRPT8au4WFQQns8plpKI/1FRf4FhwTIrOlP5wdhP2Um0rmyYV8Gx/JYeOT5vipW1/geYYTUNHM946eGGF9tnIjg6Q0tVayUv+GllVBmvlTXxmiHv7d0xaSorMaNbsMXsmOBnMJiKiPHKCRd96LWaECFnHedVAQfjQk6bSVYQ6dK4/sRnBKNfRhk1O1jDU0P5dAl9tFLxyzolMGzi9iO41QjNQWJ/6TkpYg24QbdK4hkB6nUe98PeTML0ou+DmJZcKAYm1ZosilAmyOl3M9GFxGiqc8XzUy/6GTYgLUnJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqFeUNVy9TvWWZ4j/GQsbh9gji/V5ss32n3CNVojFRU=;
 b=F/NL0XKKGE7KR/OcikGRD+NCA3JEZiF96smtke4vgStgEN6H/ZxM0oBTKau/nEFw9wsevZlpY2GrwuqfJdXxcw8hdO2wfaXmaktZkJ9cQ7JAp20KevmF25mNnVYzT+Z0yTfdbfBdlR3Xh1RX4VbWuVQucd79YXAIIJHMs7Q7hXg=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB10130.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 14:17:40 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 14:17:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEt4AgAADUYCAH1ohsA==
Date: Thu, 4 Jan 2024 14:17:39 +0000
Message-ID: <TYCPR01MB11269726F051D0F497597F28A86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
 <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB10130:EE_
x-ms-office365-filtering-correlation-id: 880b0111-0a82-4393-9f1d-08dc0d2fe8c7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmfQWkXeQJ/Eyhr+XqoKSHNl6OujsOj3ditdB/DDXWQnttS8/RHo2Sc8/dou7g9fqJTQ7El7Yzy1bgP4n02uRto076Taa74USsIccQzSr5rT7wVjYZhmoflV2D2cO+AuYYIKkeZyt0qjH7lK2gTsdOaY1DeWIfMB0KJ9TsBcAO0O3miH96XGJNW/FfOfvaBx0VcukUdryz94G5KPHJrKuoCkuVYC2oprFLSHjDcaEGArL8KtbzURxu3HPVBUxjRY/9yS8lvc5MQUDpEjKiN1dmR5ybMI712ZbNpjBDXP33BiVDMplHsJ3hB3XMJi+NcHah8vN17uY0NXAA0lF9iOnlUjDTB2H2OG6kAOyURtjdxQVI1JjIAG1noAIQ3nhlZ1evgQYMqmqD/LLFlEAITdEJv7SP1J8Rb6qdGC51u/vxthTxUDqiNRFImFHldP9Brmj0RAY1W7LpaYlRBUNkYiXEmFjy65z9aYR6r0nbXwhbfTre1sIOhT/pKTKqmdmlAdQ09S85LIUVgw6vaJdnVgkEmAC4/kV/LMGoLyhf+EiRvBC223pPXbDpC9aljCBRIOwM1Q5AAfOtWOc0H0WEzaIMLNO8xdHN+OJAEGKPw/fjpbXibeAtv/SQ76Vh7rDA6n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(53546011)(4326008)(55016003)(52536014)(110136005)(316002)(54906003)(8676002)(122000001)(6506007)(8936002)(7416002)(9686003)(5660300002)(2906002)(38100700002)(76116006)(66556008)(66946007)(66446008)(66476007)(7696005)(71200400001)(64756008)(86362001)(83380400001)(478600001)(33656002)(41300700001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QYUmvyQ+1+2rn3S3W6ZjknKUFO8bEnSMkKYR1ybQsbGlSVR06rTeT16kfmCo?=
 =?us-ascii?Q?I4fwKOVFoQepeP8UNqgilfcyHMVSGcKES76M0auCQ6+KeFjVykHtBnLHgLhq?=
 =?us-ascii?Q?81G3KUGkWk+5iIcJf8Kna1OclqoQevIu5o06LtQZOJv9mD8tsoixuHdKN6VL?=
 =?us-ascii?Q?BdO/sS4NUbrvscRSTV9L4cmQw1qJ20Wdl4FMcrsUQTwsKAqbJfBUg/XYjyPJ?=
 =?us-ascii?Q?HuuRByNZiDmVWSkEdta8Rku0bS6Jmpg77llER77uFVt05dv4hx1DB6BtV7+R?=
 =?us-ascii?Q?1xodQ5qm0n5uXr6cwxwSnlo6i4AvLjk5eMnbtDXw4w1NGid7IVCDvaUY1/Qw?=
 =?us-ascii?Q?U1+cSxXGXMlbYamPQuedXFbG43dhgu6N1PYtCf4/FfcgSs8eMUT132bd1wUw?=
 =?us-ascii?Q?7yCKqJ3fsQYdWYuOwngcJatltdf1GSFc1sagy1cK4aKfeTCJ0QTt+T2IyoTo?=
 =?us-ascii?Q?zR9e1tXg1/D60MwVoVbyTzQxqaUaZHT77N/xQWikuhykdhBzKt//5qIJZzuf?=
 =?us-ascii?Q?s600vXSOWGhnM58pSiNPoH56VdTldWhx06RlkGnrUQyvGlcl0aJ8AKFWfYcn?=
 =?us-ascii?Q?XNjqwa/Ov03H7ogqowp3bJq83OGEct834mXxYr15iF4Pq2CyjkeabmoTOFEf?=
 =?us-ascii?Q?AqxhG/T5vsVbmNgUuJyCANxJ8Vyre8AZFArUh6J2FE780vyBnZJ6soJrk9oy?=
 =?us-ascii?Q?CYa0D/q65W3S4fL47MbMFie4FokvFmGb+qXA9GUBVvZjfLfPAwiYRBOt7ZBn?=
 =?us-ascii?Q?FQCPseoppZrSeFGbgvXe+gOfS3Xjo6xy4zOsRZLSKI1PKOhnCGMs3lKOdgMA?=
 =?us-ascii?Q?I6stM8ER2msD+HYNcYTyUmRcKV9sGhjCHBAp3e/ZD6Om1DWUY6xxFzAwAB8u?=
 =?us-ascii?Q?e5ETMFe5qL2EB5b7c6iWUYPuNwI++G9AeW12/YtUN+HVDEFpDpq+8sTH//t7?=
 =?us-ascii?Q?lJNOgY7DyVcXmqj+uhRGS5cxdue+KYAB/c0P17+x8SwZW0tG5u0/jyMlMXwQ?=
 =?us-ascii?Q?d4QcS3fqn3OsJoGltKoIzdm+n9/IGNVOOT0ZtsAeYGmfrcF37uZ6/5F0LY4q?=
 =?us-ascii?Q?FqjRuZH4IlcHTaD1Zn2nXhIXwPl+wWvUs3iRxgRJulsNFLXd3lBMvoGr+Jl8?=
 =?us-ascii?Q?p+i71eQWsFGzsYHiLhixCE5QIPBdCPwpYLOfW4iMcNOxd28IqPudKtY5ldWv?=
 =?us-ascii?Q?6xBQwaH5aOxBCP5iGgKW8hfzeoqRR8i+6CNw5k1ODO9jqVQGFxP/wqPBiCpF?=
 =?us-ascii?Q?xGqfA7Acx1h8khlriAhVBNtyUUWkJh20AOCUouxl0EpFGIa+DBLlGJLTKuM6?=
 =?us-ascii?Q?yBlrJ+A1E12OnxSl55xiSjaGYw4CH37SUMuhLlx2oc3X60HGiU0lzhv6OkJb?=
 =?us-ascii?Q?fqas54zz5FpjJkmYXoHz8TVrm5Nomq+dbqgvxhD4lmAWkklk4uaptibB9O85?=
 =?us-ascii?Q?+wOSpTUOR7ldZefeIB5izPqTEP6y34E3QuzAk6fUJ14Jz2mJNkGf8tPRgvHG?=
 =?us-ascii?Q?NIn5gazQz1nbeMrfAHwgA3tEfx3bwUGy69tj7L+YbsSu8pQG1rffK0TgtJ34?=
 =?us-ascii?Q?JjOLvBOjazNQjwpxF/k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880b0111-0a82-4393-9f1d-08dc0d2fe8c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 14:17:39.9390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fd96gg5MqzlcjRM5nn0IOhjoGCN/6KfKffiWQO4YKCtWBuhqogIKIxMnEyjKBbeB8/pFMZBMgFcmUd1h//NeAsxHL8ZsNoWcSiAA8J5z6f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10130
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime Ripard,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, December 15, 2023 2:56 PM
> Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20

> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 2:18 PM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >
> > On Fri, Dec 15, 2023 at 01:52:28PM +0000, Biju Das wrote:
> > > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc
> > *crtc) {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct
> > > > > > > > > +drm_crtc
> > > > > > > > > +*crtc)
> > > > {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > > > >
> > > > > > > > You should enable / disable your interrupts here
> > > > > > >
> > > > > > > We don't have dedicated vblank IRQ for enabling/disabling
> > vblank.
> > > > > > >
> > > > > > > vblank is handled by vspd.
> > > > > > >
> > > > > > > vspd is directly rendering images to display,
> > > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > > called in vspd's pageflip context.
> > > > > > >
> > > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > > >
> > > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > > reporting is going to work. Could you explain it a bit more?
> > > > >
> > > > > We just need to handle vertical blanking in the VSP frame end
> > handler.
> > > > > See the code below.
> > > > >
> > > > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > > > status,
> > > > > u32 crc) {
> > > > > 	struct rzg2l_du_crtc *crtc =3D private;
> > > > >
> > > > > 	if (crtc->vblank_enable)
> > > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > > >
> > > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > > >
> > > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > > >
> > > > Then we're back to the same question :)
> > > >
> > > > Why can't you mask the frame end interrupt?
> > >
> > > We are masking interrupts.
> > >
> > > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > > [   70.650243] #########rzg2l_du_vsp_disable ############
> > > [   70.652003] ########## vsp1_wpf_stop###
> > >
> > > Unmask is,
> > >
> > > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > > [  176.354922] #########rzg2l_du_vsp_atomic_flush ############ [
> > > 176.355198] ########## wpf_configure_stream###
> >
> > Sorry, my question was why aren't you unmasking and masking them in
> > the enable/disable_vblank hooks of the CRTC.
>=20
> I have n't tried that. Will try and provide feedback.
>=20
> Currently the IRQ source belongs to VSPD in media subsystem.
> So I need to export an API though vsp1_drm and test it.
>=20

+ linux-media

Laurent, are you ok with the below RZ/G2L specific patch[1] for enabling/di=
sabling frame end interrupt in VSP driver?
Note:
I need to add a quirk for handling this only for RZ/G2L family as other SoC=
s have Vblank specific interrupt available in DU.

[1]

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media=
/platform/renesas/vsp1/vsp1_drm.c
index 9b087bd8df7d..39347c16bb27 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -936,6 +936,14 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_ta=
ble *sgt)
 }
 EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
=20
+void vsp1_du_mask_frame_end_interrupt(struct device *dev, bool mask)
+{
+       struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
+
+       vsp1_write(vsp1, VI6_WPF_IRQ_ENB(0), mask ? 0 : VI6_WPF_IRQ_ENB_DFE=
E);
+}
+EXPORT_SYMBOL_GPL(vsp1_du_mask_frame_end_interrupt);
+
 /* -----------------------------------------------------------------------=
------
  * Initialization
  */
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 48f4a5023d81..ccac48a6bdd2 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -117,4 +117,6 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned =
int pipe_index,
 int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
 void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
=20
+void vsp1_du_mask_frame_end_interrupt(struct device *dev, bool mask);
+
 #endif /* __MEDIA_VSP1_H__ */

Cheers,
Biju
