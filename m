Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF7C7730A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 04:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194010E0C7;
	Fri, 21 Nov 2025 03:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Auh7Sbx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A5610E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 03:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ql5b4rVy/fv7/F9RJpSvrVBC0ncNVSUv/PfEL0UtzrcWNBlcfHOvU+WZ1nYS/0ywD1/TWZ9n+uGIacAvMUAjZnOf9pH4w8Kj3YUe+PYm+VK3OUsNlGI7UtSIrLwa5ENVWSheKSlTStT5+X6BqJWgDpATn0+UOXEMtS72tHexj6RGEamLIu0G/VLiXCYVIHAJnjfwNCPC+DS6+ETZZ06Jd7ziU3K80WLcEA3zJNHEocPlV24Sfxcv/o75XKcLdc7ZGNAGbwOuD4cTaQ6O8UztKWIlq9PgCciMZeAd8A5VI8YCzkijbwbv7rf2zeQPHoo7wFpt8KZh06+lRaTwQQyMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoOpVoSb0YYXB3aCakERBj80NuTW9ITd7kKentds1UU=;
 b=k04CxYUf0DrxHQx7MJL9zaQfoiSNq7T2BtlNPT5f5uWfvPCQ4l3w4YDkO4/5kh2EtNftZ4f60T180joz7x+1XattG4eFoNCkm8pZDSQJWlNnbyf8/mVH272t4+NVYVkiwSTBgt28yoKwKc/m8exKpubJ6o38Q9zgFyVNM2lJ0GQSWid61hNOyDqZPNDIb1GdKLwHJC/+UW8MB5l/V7KzxhtgT339ATRjCH22mlt4Sx+HVl+bS6gqsxKe+x3KxJEqoySibEyw7PLND40IyjBzsM4s8zhectFleGagWWVu9kjGTqvrit9OWUcB0fQYvmz+OGtOljDoqUcNt0gomZt+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoOpVoSb0YYXB3aCakERBj80NuTW9ITd7kKentds1UU=;
 b=Auh7Sbx1rC6jqH7yIdaKRed9goEpnmWL1V7VTTk1uD8s5YcJ1HnXgCNoivitn7SFFFQfVAIKjZL1yITJXrtOsoejn2iQpRsGtiriWYgIIcz5DMpEGdJfCZm7FfO7pKjAokoKGRHWcDhWTXem7TaLeLpQ3DmnZ1ZhOS227xyNpIQ=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSBPR01MB16290.jpnprd01.prod.outlook.com (2603:1096:604:3f7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:51:41 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:51:40 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT5c60AgALcLIA=
Date: Fri, 21 Nov 2025 03:51:40 +0000
Message-ID: <OS3PR01MB8319F7BA2E53027CA274D38B8AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
In-Reply-To: <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSBPR01MB16290:EE_
x-ms-office365-filtering-correlation-id: e3d5a57d-d1ee-43c8-4288-08de28b1474e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0scu1N6+0/9CEu2pGlP9I2DNUOxMXmnjAHOEhyz+XLFQrnIq3/ovfkqJNBSm?=
 =?us-ascii?Q?kZgsj035avFzoxYH3Ooh4a9Zkusxb+mjEjrGc9JnHqg59IC2pba2hHnpZD0O?=
 =?us-ascii?Q?tmqrXRB20JISJkWtu9jZKCUxeq7Mkuogi93YYFTx7PPl2VIO2cx+97IxYvLr?=
 =?us-ascii?Q?2efYQTn1n0yDTxcnir5AmbiuwEtTS19RYqfxhL+Knvbzu6GBqhMF0FIzrM9F?=
 =?us-ascii?Q?OfMWAT9USnjkhBmY1SgTaOGOHg9TvEoF8p6Omv9PMShLNGvBRBrb+MDahrjG?=
 =?us-ascii?Q?/v3CTV1oJ30a7xYKUqp5QeWQCMlVidkqSk3JM/Ljibfj8gKddUwuEYmWup3x?=
 =?us-ascii?Q?zd0rJv/bsK94naa+xaj4BZmlGtFQhHIy3Z/DgG1NmqFsyWRlauaKkpsf+6VY?=
 =?us-ascii?Q?24aB871l8t5rL6T6UWZ5+J5FOLhIJl50vDWp2W2JHGtMCHngJYF4DAuRQCrD?=
 =?us-ascii?Q?ffiKx8Y/L8jG5/EDccRebIM9YCFH0a+Hu8337cdcr14VRUMun999Wwee2KiB?=
 =?us-ascii?Q?w0+0RzXIjc5rul7aMlCOzYr9ceiCEGxE+BF/5qb+i4CroiWeb5ykSSH40/0t?=
 =?us-ascii?Q?QSt3UQ6c8gOKMu0dUoyk7YSv2hoNQ/cnY3+dycbE82tYCLEfk9sisSTONlCk?=
 =?us-ascii?Q?Bt2ByJkrrlV6TWPhcd+O4Hd/ZWDW6ShLLdJR1gkaRCsRC5/WT4zKHeQtN0kY?=
 =?us-ascii?Q?0PM9cr7C6gPG3zDRgu2HAE3SWySqGnYmglKp2qRr0ErmhQBQYcYdNPzgdHoZ?=
 =?us-ascii?Q?rQBx9t4yU8E2DavwRvuhp3jNuHHAS91QJ5+zAqVfpoH38casWoLpnkEwDGIZ?=
 =?us-ascii?Q?Y5WwZRpMo8JB3la2r5N+6AyeHZ1Oi0ZrZ+MPUh0+73Ty902ZvF+4LHCAMr6s?=
 =?us-ascii?Q?k9Jz4KOVIP7FxuQ9VBqveWjsz8YLmIeockRF800gxbcvsZGEfzSRXZfiETPe?=
 =?us-ascii?Q?qs0pcHSu9aCh0JLwj9ISdWPHTbkmO5BWNlWk3IaCBIPccgVyVoetcuRDaJeb?=
 =?us-ascii?Q?qI96XwHmpt2h09nZH7m7VrSLhIEy7pVkPJSAf1H+4zXmzI2co2x+As/DNam2?=
 =?us-ascii?Q?PPLybLRH3wuZTNq7r2ZsKOctxUk3C5QwAjntfbAWQEkoXkivuwUGQN5DTuMe?=
 =?us-ascii?Q?4fcf13Tvj7SsbkOuoKKJVAK3DewVQv9acpOxAQ5lb8/0nqVlqPYidTY7/C9A?=
 =?us-ascii?Q?k8m3Kp6ftW/I2sI0uBHSyRigqN4H+6xeAVm8GF7/Q21zslhWsncMYeUVUq3Q?=
 =?us-ascii?Q?rV/0Hma3h7BuIuBslDf28wV5QlTXsd/cOk0jcHHMiPbRkZNuRMCAJA+2Hlai?=
 =?us-ascii?Q?5N6n5rw4LFMY8L2b0IGZjtamKNhLIMBOeSsR5nwGeYHyOsKB2uSoUhL6+8ut?=
 =?us-ascii?Q?Qfyeic7YXOVw0F6xbNFQDwN15R3y781lqDlGizXTGNQZxrBtRWmnnwQOf9Pn?=
 =?us-ascii?Q?Z2+gVk06UxsqPQzHxL43dkHj6Xx02Mal8Xbceuic1tDWMN0+F6gQe0uRi8bb?=
 =?us-ascii?Q?fRAEy9Azi852YETEdsB80yIIMZBYZ3O+RUmB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E6XTGBSCWyC9zLIHphIaxDxlFDZPqe5hmHx2fUubqAisAAfh/UoVUDiBwyUK?=
 =?us-ascii?Q?WzTtO9XB0aRfIyARciA+usCOlrMoDNu6tY45iUaq4IP8dScjBsEfL82VE43v?=
 =?us-ascii?Q?/bUarK64K1+W2Iv4nFkRAGraA+lCO6NREbBcXDEnSSjjJtoG8wR40OeYgGeg?=
 =?us-ascii?Q?6YjjF65Jt2QF6yYEKQjguwTBQalKXBxlNoZ2o/3pI7DLFxxKQXaXATIzcVPi?=
 =?us-ascii?Q?GWsv9CiIwjHBGrwTGne0yo1WgklPIQsVNStfPKopopbeVPZklyim8yykBb1E?=
 =?us-ascii?Q?Kj5CvNo7Ms2+rswd6ug5GH0kb3m7FKRSLFtNbUuS3HgMs+eVZmQA4D6r/gWz?=
 =?us-ascii?Q?9tKyjc2ZOhZ6pYTKXubDKJ0wkXq+HRwl3iZxB3dIMSzLsZGcIegFSGzEPzy4?=
 =?us-ascii?Q?kzto5QtiTl2VeBwMBH87SGdPSSNjHPsof9U+MuQIZ0E1Jcd2D/ummPxAY5AC?=
 =?us-ascii?Q?M6vmRFDivVThSQK7PGbhi5h+yJantv2n0UZpN7HWjx+z19+pyDZWxuA1naKL?=
 =?us-ascii?Q?O8/7Ylgzul1z/2kHricDkSMoTBLwe3TaGlVM2ZthVIIVfCFxNe5Rn05bF0Vr?=
 =?us-ascii?Q?QUx4jyeEScDlK0xo419Y2K03toFV1JK8WEVqYfImosEhdEHmfW+PUw5kg+qB?=
 =?us-ascii?Q?gJXBViIc9njSGkC28Kn17Fdpe8sooQwBgueCDnIKAmEYUntxMC+5BgR+eWu7?=
 =?us-ascii?Q?tJzllTUv57RXKBaIAZ6dxMWPBq4JlJ0gNzR7MFVL9sHMu5OIeGXra81oVpRg?=
 =?us-ascii?Q?1QISvbCCnXxC2AyewX19yLCL3efx8tvxqKLig5R3F69OEVnvSSORBIxXVccT?=
 =?us-ascii?Q?CHyGnddmKR14CbVq7FPj3EKhZUCFJ1OkUos1M0v4zf+iyvxdtwQiBz5g9Tf8?=
 =?us-ascii?Q?SPJjuWc744w9ZjTal5wR5jdcjSli2ogAr6pfIIhSEhQXOGzrNCUe+tngtvy7?=
 =?us-ascii?Q?0t8iwMAifw+LaWEHFkCjMwyk7fSnzTUMhoG4QZKqT24WK/V6Ys3rpm8Ooai2?=
 =?us-ascii?Q?T9bCmTC0RirzjuY5HlCi5hmv5tIP5c2UGmTtbrQ4R4GLzZuMZpJfOoB6dE6E?=
 =?us-ascii?Q?7Gd1grt7J++IOL9vbdAq2l3Bvwv2KG5KHn376TfY/Bvao04ajT/S1e97y0Ya?=
 =?us-ascii?Q?qn80eapTekrR+1BnkUll3fETzjXFontyWaCH+d2i761w9u/g7j56XurGtYL2?=
 =?us-ascii?Q?L5nIQLEdpVMwfkuWcjjxfNhTP+OvUL8b7EaGUHWQKLv7I6MkjwiHpvpdCKCt?=
 =?us-ascii?Q?OXg6QQHoIZZL+I7dR75Y/ThwL6yftZoYfBFU2fSx8Asp2oop357BJhO3Zy4B?=
 =?us-ascii?Q?Pwa5vcVavNYpxzp8ofNXyNrzcspgmP6OKH0216iMQmASk3u1It/JN8CrEvUN?=
 =?us-ascii?Q?sbNn98inMcENmgknNu6vLFiZZnwMIezNs0jIWV4ewquurm4SghRXTrk0rHqR?=
 =?us-ascii?Q?Wmo6sZUvuEBTecrAGl3GDf3nDaA7AG9Yj4mlvTHMu0L9z5TUeMqBV5Ms/fEU?=
 =?us-ascii?Q?Qt3gPqUiz7Y7Ll8YqDEX7y+ac5g4WU5K7YqW0yv8t10gTOwWXmQQlWwbvfJS?=
 =?us-ascii?Q?/ZUn9R+ESQr+/baZGFkuH5GEZoR3EvjXeyGrZRsN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d5a57d-d1ee-43c8-4288-08de28b1474e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:51:40.3386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9uFnkwf36LzLt9dxl0D1vklFNz+iXmBUXdoQqnOlCmBeCoVQzVSdfBmMhbBzgdnLUznl9w2NGyph8rVUyizqanuLPbY3/f9ujin02GcDZbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB16290
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

Hi Hugo

On Wed, Nov 19, 2025 12:11 AM, Hugo Villeneuve wrote:

> > +	} else if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
> > +		/* Fixed settings for DPI */
> > +		priv->mux_dsi_div_params.clksrc =3D 0;
> > +		priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> > +		priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> > +		dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
>=20
> As suggested in V4, use the new inline function:
>=20
>   dsi_div_ab_desired =3D rzg2l_cpg_div_ab(priv->mux_dsi_div_params.dsi_di=
v_a,
>                                         priv->mux_dsi_div_params.dsi_div_=
b);
>=20
> You can then remove the comments re-explaining how it is computed.
>=20
> Then if you change a and/or b you have the new value automatically comput=
ed and not hard coded (less error-prone).

OK.


> > +				params->pl5_fracin =3D div_u64(((u64)
> > +						     (foutvco_rate * params->pl5_refdiv) %
> > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
>=20
> Something is not right here, because the pl5_fracin computation is exactl=
y like in V2, where Geert in his comments suggested you move u64 outside of=
 the modulo operation.
>=20
> It probably is because you had this code block duplicated in V3, but you =
removed the wrong block for V4:

Good catch! I totally delete the wrong block.
It's fixed....again.



> > -	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
> > -	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > -	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
>=20
> Removing those lines make the "8" below hardcoded and hard to understand.
>=20
> But I am confused as a=3D1 and b=3D2 should give a div_ab value of 6 and =
not 8?

According to the hardware manual, valid dividers for that mode are 1/2, 1/4=
, 1/8

Since I see customers generally use smaller parallel LCDs, I went with the =
larger divider (1/8).


> > +	rzg2l_cpg_dsi_div_set_divider(8, PLL5_TARGET_DPI);
>=20
> Maybe use an intermediate variable like this:
>=20
>    	u8 div_ab;
>         ...
> 	div_ab =3D rzg2l_cpg_div_ab(1, 2);
> 	rzg2l_cpg_dsi_div_set_divider(div_ab, PLL5_TARGET_DPI);
>=20
> Keeping the lines with the comments (setting a and b) would be even more =
clear, and simply reusing their values in rzg2l_cpg_div_ab...

The hardware manual says in DPI mode, "set divider to 1/2, 1/4, or 1/8".
So, then if you look at the code and it has:
      rzg2l_cpg_dsi_div_set_divider(8, PLL5_TARGET_DPI);

That makes sense to me. It's doing exactly what the hardware manual told yo=
u to do at a high level.
Other places later in the code it will figure out how to turn that into 'a'=
 and 'b', but there is no need to worry about that yet.
That was my thinking.

Chris

