Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5094B929E9C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE4210E00A;
	Mon,  8 Jul 2024 09:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ioCeZxdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A610E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT3Kar1IVz11/Jy0kuh/aF/uBAUioEtMCYo7Lj6gni0AjRu9XeSYV5EfYRnCOYEglHXFURLn5Vha01EoyQHUkxz17vBX0ZjF/AtFEZhx3IDP6u888EwJEgqtrl9om5tITzSzsSfPj9hwdPsiE1ME9GEkPRLaZKCLDS7CYxxHIU+P/6PYEh/udu24MIi4t4+EY9ryc/tgS01CsZVjUhZJV3i76vLEk1S5+D/rq4AFmoOzOGSKxR+EYgJbTCRC1N9rsqdwiA1Xoelf8JFU8j91wTl+Lw+FEoXPNlvAy1fnFSohUAlOuHW1vkrkePVYKiE+tHeprs92OXrga3lCcJNkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMwyVnSr6sui8+X//Mse9hEqoDmw/d1DAf26rukCbJE=;
 b=Rh0rCRtWfwMHm5LVI0FtNdW3t6CxZm5jXWLfgMCrHJ3rg9PrQI8GyoX+JQTi4ZJGesk7XVExB7DVGaMqK/4blTvPHuPjSGyNlb1ar6KYU3vUjQfdGycUE1+QnMyA6R5KGn8DsdEqPso3vrLZipTn7RSM63cki4kwVAgA4H7bTGboQpYw36tzl1+d/O34SHOfJbizFbvh3HxMHYLgGY3TWqOzUWDmYv1LuylKaTn1ceaib4kfWBSR2CdMDa8J/RsF6x4fjR42vxZ8G4nLCyBkFqBnMWo3zBseTPQmjdywX9JEwThnzJorR9EMzKECHGXPC09fSXxbUlLNJtBXCHNq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMwyVnSr6sui8+X//Mse9hEqoDmw/d1DAf26rukCbJE=;
 b=ioCeZxdOIleNIjBGyIhiDgsDuUsOXfSnOYHaoN+e3W06oDJQxgt9Ti/6IgtDVCR5kR8hugAdWPxDQWM9MyiCcrvcCrOLdjV6qKb6LJ5uG5KCelt6BlOp0JpFy+Jz6AL0Ji8OCA1Z6b9Z5r5ar2eEStGRr/L3qZ2e/ljlYwzoxVE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10103.jpnprd01.prod.outlook.com (2603:1096:400:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 09:00:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:00:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
Thread-Topic: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
Thread-Index: AQHa0RCneh5Q9SmpwEKRFAYXUPoVVrHshnoAgAABQ9A=
Date: Mon, 8 Jul 2024 09:00:33 +0000
Message-ID: <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
 <20240708-mighty-squid-of-glamour-6c1af7@houat>
In-Reply-To: <20240708-mighty-squid-of-glamour-6c1af7@houat>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10103:EE_
x-ms-office365-filtering-correlation-id: eb816ea2-318a-4587-f32a-08dc9f2c6cde
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qZGGXY6rE4OMSsRCbOE9/mAoQiCFizSxOg8VSrWpkCchGUMpAy7TxQycZvw3?=
 =?us-ascii?Q?ln/4QekLnCay6c01ZvRkcvNJScEUPFOYGpbLaPSFRpxXYJUQr5/91wtq9Z4l?=
 =?us-ascii?Q?Lcrbq09tJnoJoueEDKjJzpjKN9/ZtBOZCHe/PNbmEOI73BLFXyd1qpDbLH0O?=
 =?us-ascii?Q?NQ41oMze7vJHc+Ag/Y0m9tjHkbsbNc6hPFX1VILRA6+2bMgs5JDnekQ21/JT?=
 =?us-ascii?Q?wwbb6gsLyOa8WtKZPUPbGXD2cPRWloB2OnthqwRv+W9QtSlWD/CNMAbsW1W6?=
 =?us-ascii?Q?NgK08mnYMgyQslxwv6CLXeOJTHIRM9iMuCq3u0EQrfHELq3KfCP5Wt2Kl9oT?=
 =?us-ascii?Q?Ts8fG3vLpyPHYA9CTYUCimXimO+IFFZd4ltsP/EGjHnX7UJnMzQGi6vlcF6M?=
 =?us-ascii?Q?8GCDohMddwrv0qYezx85AtK17js5nLcB8ze0fr0uym/MqIwwkJ7zAN1OqVy2?=
 =?us-ascii?Q?obckAlv5+M3PQgz/yFJuTEwpNJH1cqKodlnw9UNAUaRx3jJkpPZD0CiEsTZm?=
 =?us-ascii?Q?41irEKe198xvoeClut+3jMPScLM1eW5M5jHNKdPsCDiiGbnlnUpZZFGqau/O?=
 =?us-ascii?Q?jUOtlCyrmpn7j6U+HqFRHt32BGBaxvQwCQmyHtwoK00ocXkHZJ2t57fKB8ai?=
 =?us-ascii?Q?N/mEMKHQ26WSq402oQ6zVZYyf3seO8PwQaVuo/T6ecsBGwMvpn6A9/wfpdD1?=
 =?us-ascii?Q?ridR1wD8OS8ebj6yputDVvc2taV6/mZ774S8m3gQDSiirvWb+5ZGBAg62n1c?=
 =?us-ascii?Q?FuOiIXDJ4Cxb2j8aa1Ickm/LuSBPgq+eeTLx9DuFEXo7fSdRO4G2PlIlaIz5?=
 =?us-ascii?Q?8bB/s/tFDj6FK9w2BJSXUCbSNyg7GZB7bPFFwGVSuIW/zLf2LjN+gXdRVvK6?=
 =?us-ascii?Q?RBDI2KuzNs0+7j7owKGEpJZSBx7DnVpHRA5Q9b79CWIimSU0pi816yFa2VkI?=
 =?us-ascii?Q?enqmGMp3j/3JcGELR1Y8D/UTs7eBQLVPgpYCilJ8CJQ9p6Ug633N4Bydz757?=
 =?us-ascii?Q?FuZzRLFVsAfJYBZAGS07fATq3Wds6G61PJUPMcjvUfMvcHYn0Dq/AX1vLVWB?=
 =?us-ascii?Q?6kbKi2m+M8DHApiYM2HCtS4vJN3Oj1REc2zcZMCcVCJEGMbngDUaUor/YdTf?=
 =?us-ascii?Q?/mqPEvLUEbXTJAWP8knGzYgbezBK9UEYHgrMUTuXyuN8wmh+RQfMdH1TTRrr?=
 =?us-ascii?Q?K4M0hoMilPOl5mRpa1HIShw+MYurxk2D7scZsLWSonaNbkztKeZm+uNCZxA4?=
 =?us-ascii?Q?4AFks7RzPippiL5D0HebTaTrdmoi/WEcWKxyXV4op3cmkGlILEe+/NC3twN5?=
 =?us-ascii?Q?ZEHc+V8PFNhf/bofwSJCGFTqXUgkEXovsVVbQy2lp3z+P5M4A8HUm58OERCo?=
 =?us-ascii?Q?E3NCFQ8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RelXr/XVuyQSEt9uUUSGwsrXcYxNlcAI9Cwjmw62zW9HttErvA9/9NMW/Yqz?=
 =?us-ascii?Q?62sSsyRwiYLKbpdCjqQl2REotTcdQyBPLhUBTZ4g9cgZYD5dOL/VJWmaGE25?=
 =?us-ascii?Q?OyB3702OWi9NyXj5kQN/U0lT8kqto3OiHXa5kixjuFWoWjXMaIRvJVYzhZN/?=
 =?us-ascii?Q?rNFxkHJYMRXMQUaC4FzM3ArAmZvXw8gnWKd8FMcIz+iGociE/5Sgsg0Pkc+y?=
 =?us-ascii?Q?jWkMrDgi3MmSh3ZKDLn1zrosjHyt1ojwWffJYPV98Te4gwM5mIhTEMvzorl4?=
 =?us-ascii?Q?le7dSybkAGYZY0zc4Y0UHG1gsTvpQLQPm6yJMd+Nzd4bmIt/HuGjranXUw+V?=
 =?us-ascii?Q?/GuKRep2T3At3nENAnn8Ldv0tVkl4svfAb5iQ3PnYqECymsUdpDd4GrqKUV+?=
 =?us-ascii?Q?sb1QiLvPMhNR8xi4l3YlL6aQzyvOLo8m6btiNEuxGBNLKTdiSS3eZx0Qh8RB?=
 =?us-ascii?Q?gRIXPBQA9CJUvxZz+c9CS5qE+4oDkBwA1+zow3Ee3r28oVzmyHULEM4tCI5Z?=
 =?us-ascii?Q?43TmnvlnqeG2LLALSXmxq4qQbJvOVppWHd0CJGTqd+8dYMqe/THt6ISv4x8a?=
 =?us-ascii?Q?6Vyl3BmAMoEizMNSzKNeB+tnoP/eRiFa459pZjuUJQckGieilAQ7cqKuPpFf?=
 =?us-ascii?Q?FBO3ED75eIEVmUv9Yoijix5V2oQghuOJ4nPFQEZQC5nZKjHMbNX6f4M5dJPf?=
 =?us-ascii?Q?XjRz+PsY0cIU7iCyTjzsLtN+Mx+wQ4Y2lkqyWOd8B4BwGUmIzzu3n7ZUZO34?=
 =?us-ascii?Q?RlRg52vVNfscatNZpCjt0vj6gGjOM29wLvCZryaWeqXs5x4iKPiUm+pUyqne?=
 =?us-ascii?Q?K0eLfujQr2YJQ81RFE35pSNo1kKAFICVNCAdUNtRtWdOUDI4Vpj6ihR0+QFQ?=
 =?us-ascii?Q?2opSAoJ9WOieZSzBG6ZRiLiHlATezcU6p0/bfsPTJrg6rCO0hD6pZ4866rwp?=
 =?us-ascii?Q?5pS81uRqHw+liM0oKOIsaUr9e85g8lVIPNp7/0mnI9IrK+MC8W6pDOF3hK3N?=
 =?us-ascii?Q?5ZpGjC/ae8zgJfUQJnDt7Pev75skTcGPyCmLvUh+ZkIgliSQHetxml2IQP8V?=
 =?us-ascii?Q?Jo53McWv5pNmISJT+KSmy1ZHPI543ijkW3SbxqbIxE5BWqCX+jXYqclXlMto?=
 =?us-ascii?Q?o6OaSNbNGlDm+06vV0Gna5LF9mxNl6jcuThNmt7onSZWl0TfQ5EWf2etNm1Z?=
 =?us-ascii?Q?ox/TLLd2njOdZsA33QzRfk+urmNzx/CjtmHoAASgdBvKzD2Gn9l0UuQbc5MS?=
 =?us-ascii?Q?bv0AQ7E13UkwMLKTmXdNkV3KnOKMjEWyx7am6P6/QiolX6oBitB6re1kLQ95?=
 =?us-ascii?Q?kD7K7+CqxYK2c+WbYLQdoiTBWrt9vlT0o4R5MjCRaGF4HqF+7lu+spKFghxM?=
 =?us-ascii?Q?a4wZ70MVkV3rk68SjakP4LUp6+51z8M9HizP+VMN07WLuG1AHRelq2ULkcGJ?=
 =?us-ascii?Q?z1+6KbA6IJqWL2w+0/Xs3eOnFoWWLXEObxJfuFhhxOCUrML6pKvd51UHJbv0?=
 =?us-ascii?Q?H4kVzausHiIJUj2SIP8XVoSK2ZoFAbUhdyTJ6mUxZsDlivsZ1Rc4ylTo74wO?=
 =?us-ascii?Q?6zUXNHZAZyYk6ozREUuULUvkjIiax3P6H95iVfA++gIG19rq+iz7BGlHwJwL?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb816ea2-318a-4587-f32a-08dc9f2c6cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:00:33.3544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYiKEpSA3G95M8Gp3RGK/PeZ7moWgDnOUneY3L63tsPcfi/vyNNYU+2//dpFBCm7Qf6+1JKmxR4fGRAIXO2gGaHgA6EFn6KKv7RE3JsNbHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10103
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

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Monday, July 8, 2024 9:54 AM
> Subject: Re: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbala=
nce if RPM_ACTIVE is true
>=20
> Hi,
>=20
> On Mon, Jul 08, 2024 at 09:27:09AM GMT, Biju Das wrote:
> > The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> > case it won't call a put. This will result in PM imbalance as it treat
> > this as an error and propagate this to caller and the caller never
> > calls corresponding put(). Fix this issue by checking error condition
> > only.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > index 2e2f37b9d0a4..42a5d6876bec 100644
> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > @@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct drm=
_crtc *crtc,
> >  	int ret;
> >
> >  	ret =3D pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > +	if (ret < 0)
> >  		return;
>=20
> The documentation of pm_runtime_resume_and_get says that:
>=20
>   Resume @dev synchronously and if that is successful, increment its
>   runtime PM usage counter. Return 0 if the runtime PM usage counter of
>   @dev has been incremented or a negative error code otherwise.
>=20
> So it looks like it can't return 1, ever. Are you sure you're not confusi=
ng pm_runtime_resume_and_get
> with pm_runtime_get?

It should be ret < 0 as ret =3D 1 corresponds to RPM_ACTIVE and the API doe=
s not call put() when ret =3D 1; see [1] and [2]

[1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/ru=
ntime.c#L778

[2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_runt=
ime.h#L431

Am I miss anything? Please let me know.

Cheers,
Biju
