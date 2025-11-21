Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE6C77384
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 05:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF5510E13F;
	Fri, 21 Nov 2025 04:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="DC4i+EuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C8E10E7E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 04:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hzz2Zj2PE4ZMghIo2CTC8Yo+e+OHq2z5hxDL3KGquSOTaHykTSqViAHYDAgeniANuZWamSdViAsgmAAbv0qncp7/L0TYDpnGmKMauQCjntnRh8cMwFhCjdqnslkq+trk+9+cWV9Zi6HKRh8kp20eLbK00aSsxnodD9sLWtyUGi44prUW3EDoadY/WkoANL7V8oDc1ULTpKK/naTo38lKNkxs0ROrvIWRaEufhhrr/RX+ZnPNwafH/QYuDCqY8TZxE9BqOzKvU1ahAeTCH1T9Oj2u25VTpg43UE2yeTSTsAGoT3RYaWHQk97EFad02IELmbYXlEk/WnRCYyyK13V7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bznoHMFkJz4mn2RP5+xMIIjlKkLVIalpYTjsUWaHWHQ=;
 b=Q4wFB5KKv6mTvUe9VqQ9xrSAEOJRJDoXfEW4gDnQbGmkSOFggSCQny7/jvutK4Qfupbckv9m1mEcpgxApbx29mK6JLrMuHoZzj93LM+2WMYS5vNEB+f5rC7wxMFCIn0dZgGL7Eiq4L2gaWtzYhAYIZBi7/s+9KAXmerI1ZWbQXCgLlI6lotTNbH6v9RGsPjvMAk4XBwS2OvBUiXzH19w/PWX3yT2PoaYgu4NLRmjVKPGKbG8J3R03AF4VEcMWoSb98ThurJerRGUWXrP1to14wrODT8myqKBvIyDrSoHYZlNv/wZVbnCcnAvGAUTCQpPB5bNrSyzeS0fPAZXFhJa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bznoHMFkJz4mn2RP5+xMIIjlKkLVIalpYTjsUWaHWHQ=;
 b=DC4i+EuAx1p1386osUv7Ta/tgHnG3BiGeQpYLtns3aMH5+PD4OkyJg3lDbw9n8rDhK+3W9n5a5Rprsj8HIlSVHivNKbCMdYc9oFOam4Ot9k2BqMnunijCZjanqFpGvXdsuzEPzJT1LQs70YebLL5XJlymY9aRrRWeWFgnr8pfBE=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB10974.jpnprd01.prod.outlook.com (2603:1096:400:3a5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 04:04:24 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 04:04:24 +0000
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
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT5c60AgADdT4CAAjLVIA==
Date: Fri, 21 Nov 2025 04:04:24 +0000
Message-ID: <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com>
In-Reply-To: <20251119132235.795b633eedbb91f8544262db@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB10974:EE_
x-ms-office365-filtering-correlation-id: 83fedd0e-cdd5-498d-b55e-08de28b30e8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AvYfIk7oajvpu0Irgwl4H6ApyB+pmxFFh9AdWZ6pTft5aIwJDNgEl192+lzQ?=
 =?us-ascii?Q?dbtA/2dj6yHVYWCEJyNu8mVfh9WY+/ahutO2EIruB8EErit/IdHmSSjjpBfP?=
 =?us-ascii?Q?M1G+wl9AM0IonGlGPbntX2cqFXaUBlX7GEspKzgNPvgbILOlsVvw0k+jDSH3?=
 =?us-ascii?Q?QRAdyN0QSQN6qtOMrnjXWWFPjcj2QPFRCwesUkCyF0jYwxDnV9R74CVJRRyG?=
 =?us-ascii?Q?9KQfk8ZKhmGM4WoYl/eHHRaAJDuKTTpsl+8svkUL29s6Pag3898FMo/a9Xe9?=
 =?us-ascii?Q?VE8nDSBMQ2g83eYtaoEIV5CONk8zRz2wy5hU4ELlrmnaJ+s0cdJ9DMe139rd?=
 =?us-ascii?Q?DtqxhibSQ6Avg+HqwuUv8jrMDcXNdKHeDbIUs6hpcUiGANx1jacbanE/ckh2?=
 =?us-ascii?Q?6UhR0Plb8izE6uJV1xCpz7t5U5mk7781mRRA6ut21E6lHVPPWI289x5qUSj8?=
 =?us-ascii?Q?qatN0eg5oPusqDEq4sbD8yv8OMAgiWy62xpAGxuIdStFyX43zPEpk/DGyIU9?=
 =?us-ascii?Q?Wsb3P3CJBDtnD06qn423PEv5aZrH2ZNdojfWP5AaBrGhXOu8GM7k6Et30jvz?=
 =?us-ascii?Q?y+TepiTVf4TbHbeCD1H/hcAV3ZZMbsaGIzLecZSE0xE724k0jlKEZUCCvzWt?=
 =?us-ascii?Q?DphcIRG/uYNexl9QCV2JlbR0PAU4N8pxGGFlijUGD+mTKoAp8iconWHzikPJ?=
 =?us-ascii?Q?MvGJChs+Qm/C+rhiDqPgr0IiXwHtvK9sfIW56di5ufy3dIMg80NPGE67JBxM?=
 =?us-ascii?Q?MTjNBKn/ml9/Vyw+tCljgh7IudgfCFbkO8oYKflDvhZThCW2G04rAZIISAP4?=
 =?us-ascii?Q?zl8cacF15bZNdRXvS201QLXwJ3RqwO0BR+/+Zb0ZWeM3ffxYcxGcZDrme6UD?=
 =?us-ascii?Q?WaQZ8VXZznikWlLdHmtHAQr6XWkAFKNXcO8eJEoxX58aMNw/Axu66f/2N16R?=
 =?us-ascii?Q?tZuagYD8vyvxOo6clXQI3e8xQz8/hLa2V+IuQJxwVEjGfAL3krH8EIpeiCys?=
 =?us-ascii?Q?jAyZ/IGa11T+IgWVm8TDDzTrSsGnC90G4qHk+putX6YP7KyVuNvWglyET7uS?=
 =?us-ascii?Q?LyGPedCLLsbnCsCuTHgllRXK1cZwm/XZfgwq8/WZqajv51Y7RlbVkwvH4Elk?=
 =?us-ascii?Q?w1kY4YxYvV5uG17zKU7O62jMDcD+K48Lg1AwpuI8dAnnjNqH+Hum0Crlr7g0?=
 =?us-ascii?Q?AstIAiUactaMVecIHD/3DBAzS2aDW4Cg4NerSxVqbncpNLSy/bzi2Xvv1KLq?=
 =?us-ascii?Q?5pYN2odfs1BygCCbqZ9syRx1kqA8BUw4uVa8OxX0xaeyQkuqVWEymXRf08+V?=
 =?us-ascii?Q?ZcxKwGRdwK9HTqOpPq288qpXbPD7bCPGFu63JRiXDyQkMI/lgrH8wOh4/b+U?=
 =?us-ascii?Q?WB6M6zfXh1jpltVTCL6L+1kIkul99SMI4A94SG0GE9R1x3nnBs0Mwr+vHGLG?=
 =?us-ascii?Q?btqxpygExX4ra69HPA75ZCV82zYT+jedLOlPpv2+4t5wXovMBRJfeoIggQwu?=
 =?us-ascii?Q?YNBWo1au7NFWsVyeajhhdOCO1yLO5K3aO444?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/rSvzPbm7YNLZruQ9PTqRmtjQMFvss0VilnhA2hVwAak2nJ8tsZ2WHYIVHvx?=
 =?us-ascii?Q?CuJB3Zvd0D9Vg074vGqpIhlD3J3UAtkeEtu+1T2UOw5syAlXGbFNbKf5wseq?=
 =?us-ascii?Q?lu/K4rZ+aidknP5BcD5FsU7lsHjXHF2k2b4J5jqkcAKn/LdgjbVOfqEgDZyQ?=
 =?us-ascii?Q?6oBPWVKxJYOkBlEVxWqiZ+HaT5aIW1//SAQhhtCqRqJfj2oGkAlf/MCCUg3R?=
 =?us-ascii?Q?sCNMJ8XPzWnYetK4q7Mva+If4N8mM77F+LLZRlujFAMjUzSNf34Lk282dnd9?=
 =?us-ascii?Q?ARqa0K8qyiObFqM9YFae/G4+7bV3G/Eomdyx4nGa3P7QA+96o6FbfqeZN0Mu?=
 =?us-ascii?Q?02G5vmycyL83tXngMHBFZqEtE5oWxmDGePl4ttCA3ATs7qo055Xe+hHea+oU?=
 =?us-ascii?Q?8izKQAgs96iw2Az9QEHVfxQLVIT76z5PUxfHWTDuN3OlZl+sLVPrxq+4Navb?=
 =?us-ascii?Q?0W6aDt7TvNb145zGyU9M03TmZ3gjRLkekFH8XpnZSalUlDgQrX8JmXvQKGiG?=
 =?us-ascii?Q?ywUTXqapFd/YuJtFKEVZ3dTCDyq9f1ayxqozXaAdGbntS/6ofP3buOmx+MHc?=
 =?us-ascii?Q?zm9+FSvbNeVPyDqvZx9Qc9Kq70lz1ehovOm6Mv8t6Itm9Y3+9YG+6r/hatq2?=
 =?us-ascii?Q?1yQekpR8SK4sekJ5KvzCsm/sSY2rBbVFtoTiIpLy1aPGDFYkj5g3kg/TLHT/?=
 =?us-ascii?Q?MnjvNNov87VgRRDmoluNRgiB3iOIVibu6qb6PMqpNr8HWkyS0MuF6Msj1FiU?=
 =?us-ascii?Q?xd4HOC0JrnwqRebmfoe2r6rVCuVP4GyFjKZZNF18sAhXdcWRccurpilYI1rR?=
 =?us-ascii?Q?qlQOJ6vSGFMbncxbtKiV6eMWG5pT6PKunB47LzgvCrzKa5zYFmucXcs3uFMz?=
 =?us-ascii?Q?n3kgvLNr6+2QqwQ3Tf8DIRkCO9ul3/nS9hgg+2CxNSBvPuQJD4t8KgBAQHXt?=
 =?us-ascii?Q?JkVOthTOKOe5vBy6fJgsOnF8eqxI+bImpAbzW2zUMR3pPPHdCM+tJucOsESW?=
 =?us-ascii?Q?omUKBkhxFTdlxPXNwxPuv+EfmnwnPRJpgdl67VbOA/5iz8idywTfGj/Xf2CZ?=
 =?us-ascii?Q?8V3cpPi3jFVPOjCVyce9ZCMej1LVv+tXRrsz293ivRqE+d0ciBHrh1MVhfr2?=
 =?us-ascii?Q?L/iR7jdtrZAAEZaIzmC/GNiMsIfBk8ty5uCsJTX89IG0m6wWh6LCiU9wbELm?=
 =?us-ascii?Q?FOmvytNHve59mrF7E8Wr4F46xxp0ElyvVjNbOvfTUbfDAWFhiIRp7eEC4zlo?=
 =?us-ascii?Q?mqzogFKDrI/F3XSnzCXiF1tMFLf+eTX4gyKVHOGgh/sb9giUyHpd+/KoHZZF?=
 =?us-ascii?Q?G88LAFkuf52Ve3EwnJC7dcgPbjUxHPXfwkOlIm38dJtDMvbB2s1jlqlZAr8I?=
 =?us-ascii?Q?GwUtw3ltmJXZmkQoYN1BIGl3ZHYuqCdFW55iCW43HZP+Kgmhzpk/B/+S7Ls4?=
 =?us-ascii?Q?QPfDmUU+BOy7lzQFwUMKaMJqQR30ZdLquRe6cPNEWYljJB3+eUBxOOnFoFXl?=
 =?us-ascii?Q?dFLYdaKagmgYsTeuZu9BShKXbiPJdFuXrRBWcTD82E8JYKpkNofkXJUZbaw7?=
 =?us-ascii?Q?8OTUQhh47HdzEL4opr/CaZMr/x3FjQlIMsG9K/Tn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fedd0e-cdd5-498d-b55e-08de28b30e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 04:04:24.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7IqSPZdPHTnhi4qj1hNaSLTviDr8pBksT78qX6KHVEln1LJwBwWMif0jpSt/JE/WfDNs/sPmyYXsv84ZkfsESIsSeeWy3NJpyOsVH30O54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10974
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

Hi Hugo,

On Wed, Nov 19, 2025 1:23 PM, Hugo Villeneuve wrote:
> > +				params->pl5_fracin =3D div_u64((u64)
> > +						     ((foutvco_rate * params->pl5_refdiv) %
> > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> >=20
> >=20
> > Also:
> >   foutvco_rate (max) =3D 3000000000 (3GHz)
> >   pl5_refdiv (max) =3D 2
> >=20
> > so the result of (foutvco_rate * params->pl5_refdiv) could become=20
> > 6GHz, which is greater than unsigned long on 32-bit platform and overfl=
ow?
>=20
> I confirm that when testing with "COMPILE_TEST" as Geert suggested on a 3=
2-bit platform, the results are not
>  valid for this combination (but they are valid on 64-bit platforms).
>=20
> I think that the kernel robot could potentially issue a build warning for=
 32-bit platforms (if they also build with
> COMPILE_TEST enabled, which I'm not sure about). Maybe Geert could commen=
t on this?

I've got no comment here.

I can't image when someone would ever want to compile this code for a 32-bi=
t system.

So I'll leave it as it is now unless Geert wants me to change it to somethi=
ng else.


Chris
