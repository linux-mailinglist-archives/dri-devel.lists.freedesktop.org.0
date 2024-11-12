Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD749C533A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FC110E5B0;
	Tue, 12 Nov 2024 10:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cpwY5bkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0635E10E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8ij0wNvtRwmULVCEsZc+L9GZEhy5YRJO2RCzCD7qfp4vlGGMzAudvIksoocB0mnJNIdv8L68z5a0jc3ZQXF1mDBZ4hfCQ8gf/aHniEn4bGoRSHWJq3bof9+hH2w2pVudkgd5mevsdjx2vBYEp6FYnwlDBhOp5wYvZrhZ9ddD3r1fqIEAAQ2cW2kKBo4Ot60inzEO7NO3Yh9RX1TOf0kDjMohk+nXrRCq0Y2nvm/KWAC2DgkHWfXVsZLmgDVwOZRDymEahPUdZ0YfF9eDClTDp3pjgsD2q6LPIM0M1Uyix+zoW1qa2gtgt3wPH4jctEgOgWHVWXzA8N9p0Qe2HwJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6rIjPLjwTWDjvcUsfzNELl7ZQFW/SDhQPcrg+sdDAo=;
 b=NjtOBO0bhSCwonTr12v6NEiDlAAuCo8VPEf+lLQJDPgf+ODS4tz9+S0Q0QXUJ/kcc5QXiUvWEu2TjS7tcw/H3K3p/Nq5dkJ+7d7UgkgTtLRVGBNKUykQFzs1fMvvmCh2pib95Nluf0GoziD9xniLQpAejMd5T0q41CiTdJ0DZOOEwdCBEAXfCudk5M1wSCIJXpbR8MVnu74K1okV0I2Vnvtb+gecYSmfK+n7et1OUbDyThPeOszNki2JEUKUlS5uVMhSyiOK+JJgdANLcvQI6eceQgZb9KVKzaZX6vvC4fZLMxD8PirrO96IXhBGoAnhZ3CBqwnP0Skc7gPukS0QUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6rIjPLjwTWDjvcUsfzNELl7ZQFW/SDhQPcrg+sdDAo=;
 b=cpwY5bknMn4iC3hOu0rI376dkiW+wFAQtqiWljaUTraYRYU4Z80bFTlA7MvylVntC79ags6FSn/jy9gIq9FWIfwWTnlJARWhSfdESOMHMM3oK2ZwlFA3O8fktmC915X/cP10wltEYRXX3GwPG+k0wHqPWDLhxfYEqwcMcZNShgc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10435.jpnprd01.prod.outlook.com (2603:1096:400:257::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:24:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:24:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Liu Ying <victor.liu@nxp.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
Thread-Topic: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
Thread-Index: AQHbNOzgUbwqUiJ2cUGyo9Mi0uk/LrKzcDWQ
Date: Tue, 12 Nov 2024 10:24:58 +0000
Message-ID: <TY3PR01MB1134646424EE505AA5525AE8C86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
In-Reply-To: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10435:EE_
x-ms-office365-filtering-correlation-id: 56829fcb-f57e-48f7-0a20-08dd03044240
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?76mK5WE5F/a93/hLzNKufJM+yKJcqIVaG4Ghki2YPVxYKxvuCyp8r8ny8UEM?=
 =?us-ascii?Q?q4yhjYCCA4TOM06vJS8rDTalih2s9/JUbQIcp0u48JqF9OYZLLfpEKi4zVxN?=
 =?us-ascii?Q?/mlpjJBR1cfKpfBEvzCJH6y+3FROOOZqidgToCnLios0f1QWh9YTpKRBShP/?=
 =?us-ascii?Q?Eimn2wci1zh3Q6eU/UWJfRyXEVWlG00yvMZ9qAfxZke0BbMrkO4TVT+4ZY58?=
 =?us-ascii?Q?GBbat08lmxatD3bBdOVce31PuPjkU4Len0dX3m/+DfAK3Ukv5gnWw4effKLN?=
 =?us-ascii?Q?pKLUEVhcb5pqL6jr1465SSI29ELkzs0935aryg2Q7V523rBSDukgqEFSHVvS?=
 =?us-ascii?Q?zBKDJrAZVQQDfbkoUHU58xh+Q078eFjPEMu2fLnOcPAFS3JEfi191UEuN4JM?=
 =?us-ascii?Q?4ehNBy+cUXZRMm07J6QM1pgNcEl8DB4XsQgE/OuStyiNsHe8uzVuMz2qPQwU?=
 =?us-ascii?Q?of9F+e79yq1SrybDOJySPLwGY6qJ2JsUfiT+AgqJ/+LiFVcJE1tsR+U2ZnBX?=
 =?us-ascii?Q?4N4jGRWHN6QUJ3GV5VuaLxh4DEl04FCe4rtnEyUbKaZi8Nbaw8RlFif4rCvd?=
 =?us-ascii?Q?EpWd1CvwUZKfsKB/xlqDX+spx77HYw55HwZGDXPlRYXis5Ipb5jKxdOoqO7l?=
 =?us-ascii?Q?CintljaqwAtIGt1fG30OvDWl1/V0bwmraPPVc4hIKuxZHFJDAhMRjCfqKPkJ?=
 =?us-ascii?Q?uuey+pIES32iQYcVGx4QqKbFwuUkmZLilu7ydA4nYbsaxhXhUE57dPSGMYNR?=
 =?us-ascii?Q?9TSJg+q4Btq5cuuxaR1TDyp+umJfVVZuV+vA/u0vPpnyJB/Z/QDEfvDuS1Ed?=
 =?us-ascii?Q?ogPcqGYKgs1KPC07J1zaRiGrCXqjw9pq/Hw2SEfmM08pcBGzLewAyl8oS/Tg?=
 =?us-ascii?Q?392iDRcUsJxfBzQ4noT7OW6AbVP06utOokO+zxNzR0NQk1aTdxNExOIm6l4H?=
 =?us-ascii?Q?UaK1mrxDdTHn3YUDSNKVkoNxnsg42sOmeJgTk40FKyPWn1RAXpRRwRlbTqLY?=
 =?us-ascii?Q?2YAIRDufuVRhqyPUunKbM5khkMkj4rRdR/voWPYHJNBQtFMGV0K+qoUE8AiH?=
 =?us-ascii?Q?D+0UwjBbOBbqMiNJBS2hBKVw2PXbnBplF23Rbz1YZNawnePMvNIybLxZtQTE?=
 =?us-ascii?Q?yWUMClJSyLiw7s8R6xnI2LFipjk6GRZ7sjb9Hpm/kIC8yy0lgGv8urFuC/8M?=
 =?us-ascii?Q?Ta3oM0m4aPmJqk9g2JsMQ56HsHgDxN1uJSX4pllusMENALNPxLOpFeVCW8i0?=
 =?us-ascii?Q?SK5VlyxF4mJfg7v0veDkE8rA9zt5dz2hvVq8CXGebqnxK6ZLALt2M3VcVzcp?=
 =?us-ascii?Q?lSlCZEKxBz6SFTyc6mx25L7Vdz1JA0Z9dO9q4HCBkv9ETxQrkuQuc9tz3a16?=
 =?us-ascii?Q?mLKMQGI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J0uPmu15O4Zi4SVhEwYmUjtEJB0/ZmrgM6jG9JE/9Kr43gldYJ0KJaLZ8OJO?=
 =?us-ascii?Q?nsMtHrYAG8yfBZQHW/boNicqi5GAquu+T3YrRppV84EtE5FmbjRsY+S/294w?=
 =?us-ascii?Q?xjUnK5ySJprGz3aBDjkv1oQsJVLrt+3Q0CR1p2eS3pzhH7vRVdYISXVvRS1u?=
 =?us-ascii?Q?aFbG9r96nuaJ4/xKEAsdzpBvcIbsIjZEBOec9f3Pz6SofisSKfAm+j8D8Nd9?=
 =?us-ascii?Q?QIGuWdPRN4XuhzOJOcrKdeyFV4o1bEfWkiSEMaEv/CpRZOyufzVQXwUPlr9X?=
 =?us-ascii?Q?y1Dk3WZQyKY8woEzfW8hkTY44F9V6sFSqZHaj5kTJPIvrQxTj0bvg61vHrR4?=
 =?us-ascii?Q?DxxV1QE8IpUBmq0iDFRi8PZ84p6a8NQgeQK3eeYdijHee1m5/+aHb/Ud9J6I?=
 =?us-ascii?Q?TTLEWbA7gM3cbvJo8RgJqhkmOlKRjMk07HLatEV2slWonyNqTVNdcAKw2z4n?=
 =?us-ascii?Q?YbaDohH2ovfqOHSVkVdec7ReuqB+3Wan3c7O6JeD3UcKucaZeWaSHwH0cWa8?=
 =?us-ascii?Q?oloDYkgP9rB26sfjBGDRgsLqX0J4DXLJLtVpFxx6X219hfSse7ylGs58pdla?=
 =?us-ascii?Q?wDVLqhITYywGpqHlfW/hbjGzRpzyxg+z7i9bqX/Dsd+LAcKUnIhjTK+6/EgT?=
 =?us-ascii?Q?+AZP+Y0lJt8qhkDrTkxjdyWTw1eNW9DqWpRLRd9pj1wEkx+8v0PgvM7qebez?=
 =?us-ascii?Q?gMBMDU1VTonK5fsNaW/s9KJyQrqHNsqJWViYiwJ1dtFU7ZrL0oHQSBLIYn4y?=
 =?us-ascii?Q?0Gbw+hpWMEnntEKAi9PleIp3cPi5phMVdd4sYkwn8OmiT1q0yTG7IAlLbVzc?=
 =?us-ascii?Q?kTU6woSLXuyVr2tHpj0b5snoC9AqQSfqkbqvhSs7dt/8rwmsNKUonT2ggSPZ?=
 =?us-ascii?Q?r6V1IHYYCC2MXMtn4OA4hfgMIqMWz8a1ThtEHX7SLbQs9JQ14srb/PyIBO/Z?=
 =?us-ascii?Q?24K7cve9nsiDkrqD+DL3RmhsmumKVCSPHVLiWGxe2wwfEgLlqFD5L5tEiJS4?=
 =?us-ascii?Q?Q/uwgA1+zJm185rw806DYLemsmh/1aeoLw6NcUvOKWZ0JldcExkpV7FCkguO?=
 =?us-ascii?Q?0diJ/DtBEVtn7TeMlAEJ3lbyAWs33tWSJeTixiOJ3UPcGmm9e0OtVtrVGlP/?=
 =?us-ascii?Q?Vgyvbq4OSagdL+IaCg3iD4qekmgIT6SJ+8wxoIJq8U50DxPT1KW0X5+1EVpT?=
 =?us-ascii?Q?9tqnz8dl5oNhyhMvR77UJxCZmzR0yU341Kuscs+G7llFXbdQVzebF/hoyCZf?=
 =?us-ascii?Q?LNWHaku30FdIRPBehQnsOOZp1mO+GjoDLrRU2p8DZd0acPPHrIlp4z+dutvA?=
 =?us-ascii?Q?vRowFuBZQJRDs4WgOGxgiS0vErLV9DbdtATVdGbviUaidQbjvjBes2QOV3h3?=
 =?us-ascii?Q?eGV9+1PKb9KgBnf8MhliCHTPZ7F6jYvDvtSLwpCVxFKrwdjHgcgyfG0wuDqR?=
 =?us-ascii?Q?PXQXy8fY2j6WuHZYx5AsPYe7o4yqPVmKthVtw0TdV0ntQvz1lOIHExDh+RZ0?=
 =?us-ascii?Q?y0CntxnM7yj39GLYLqoE0aFPzOGLoJbyVL8Mn7bsmo/1+l8SsObFcWh33MAz?=
 =?us-ascii?Q?yGCmcs5b2qCehOih+nwrkR4ntqzDA9VLvsysR4R4JJXKEXgesBPmleKWsXW5?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56829fcb-f57e-48f7-0a20-08dd03044240
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 10:24:58.2665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O79eCds1ZvALDXoa7wKvg9Bpa2iPnAOPeW1asCViK3iuLYfIKtjnMPLk7sULNjxw7Hsae7NIOaQeLbKBo0vBpx2Z8eCR8G/A8uApkwjBb6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10435
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

Hi Dan Carpenter,

Thanks for the patch.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 12 November 2024 10:23
> Subject: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer deref=
erence in probe()
>=20
> If devm_i2c_new_dummy_device() fails then we were supposed to return an e=
rror code, but instead the
> function continues and will crash on the next line.  Add the missing retu=
rn statement.
>=20
> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge=
/ite-it6263.c
> index cbabd4e20d3e..5f138a5692c7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -845,8 +845,8 @@ static int it6263_probe(struct i2c_client *client)
>  	it->lvds_i2c =3D devm_i2c_new_dummy_device(dev, client->adapter,
>  						 LVDS_INPUT_CTRL_I2C_ADDR);
>  	if (IS_ERR(it->lvds_i2c))
> -		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
> -			      "failed to allocate I2C device for LVDS\n");
> +		return dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
> +				     "failed to allocate I2C device for LVDS\n");
>=20
>  	it->lvds_regmap =3D devm_regmap_init_i2c(it->lvds_i2c,
>  					       &it6263_lvds_regmap_config);
> --
> 2.45.2

