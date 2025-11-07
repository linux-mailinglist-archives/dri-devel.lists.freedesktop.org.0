Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B1C41AEF
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 22:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367DF10EB88;
	Fri,  7 Nov 2025 21:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="P6KmBn1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6A10EB7E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 21:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTkDeA9XAtS8s+Sb5qlSY9dpjnJFJhKymis4CN3wlZsC4FGobtM2Jv0lm+RDULbuzx0Fz34cCEsqSURj5bEmpoZkamcDtJjsGSLiqwqYoSWiqUidEBbmQbj/sFWuFdoVBm2vHif7bthoTRo4Q1i4JBLx0z50gr6m4gzcStvoWjZ25ykAuHgdZnU1c+AroOSOy7ZpRLHw6m8Fnnw9USoCjQQGOMujgF1l3n1HvThUdsqcmA55H8KrpMn24PNAHBQj+4vqnJ8HDT22UrUAy83zl3DqCaNnvTf1SIcmkz5GnVvlxE4B3AiPveQGkfTPwCqMEZFR8k+Izhpue/HOcUZ1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMT3TWEhVwKHWy2zkrjYsM5R/aW8ddEgr/WVJC8n6gw=;
 b=bCIicIGcu/RtlPP+fAE5zJ0zH4IHNrfb0PvVW+fbaUrQzX2IO7KCXJQPB3Wy04aeejarIjwSAIpxc3GYvg57uEcvHRS1jZwkc6Iam64la9UuCrsy1iNxPbByyXUiKCMtmW3RH3BJXwXj4rrPN0H5LZLDPrJLRpANz4GsBlQdw/mh7ekogiRMy/JiUmTumEHiGdoN1fVdErtIo0uG6LGlOpz5QskIwDWiNq7hsmqMcJhwGxjNLNNSeXIcnuAqYtSWZ7fLQo2bSfs7moOCfsBkoJhaqrfHq9cBpYg0ykhRwShDyj4YpsuGHgQInQTwybIrT6LxZLCF2Y8EFNIz5rNa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMT3TWEhVwKHWy2zkrjYsM5R/aW8ddEgr/WVJC8n6gw=;
 b=P6KmBn1dEIdSzezrmoP5RK1xremjIzW+i736kr6fLxGRpOPI25+5E7W7skvDIWwkBN+qNUOGPlZ1PA8FiGH6JLvyCRPP23guZXd+wEWiZtJvavucJJzFMmfvXRegsPfbI1yfaEqAMwQvn6FjQPDa0zd4WJPWz6ZTyPwN5N2TDXk=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY4PR01MB14830.jpnprd01.prod.outlook.com (2603:1096:405:25b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Fri, 7 Nov
 2025 21:07:00 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 21:07:00 +0000
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
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcTqM02+OCahzeqkGZBdprKCVrd7TnaoQAgAAejkCAAA1GAIAAHs9Q
Date: Fri, 7 Nov 2025 21:07:00 +0000
Message-ID: <OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
 <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
In-Reply-To: <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY4PR01MB14830:EE_
x-ms-office365-filtering-correlation-id: 76d3edea-dd9e-4307-5c4a-08de1e41981d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?i3WKUZ0KHSfs3MiVpaKH49+2EBR71rkeMo+opGw41thhdqPrRtexpnQw0f93?=
 =?us-ascii?Q?U2HqOwWRwLy6ttU+ZMQoFoPBYAbuCUfSiI7aYqur10Jn7sjZWDu781eS6XSW?=
 =?us-ascii?Q?cIsRCSm6YeHYerx3YVxFpTR6c2qF/I4F7GJrWh+W7oMvI3Tyo70AWt2EQzd/?=
 =?us-ascii?Q?dOXgUCsoJE4GnziDNkODMmYgkgJZRm1pFKrcdKleHnI0MedK7Zg/q2esiuGY?=
 =?us-ascii?Q?JUXsVjmqW+pFhhcWPkSrUDB4u05VoSxPmrh4rSEELjRMI08Fgumurs22fbDG?=
 =?us-ascii?Q?0hMlAXQWlOkRERG/yVuWMyHmh24oJZbN7I9jIoW60ZG5XYedwhoZZU/rkJJD?=
 =?us-ascii?Q?lzTOzER5bdSRCwIctRKe8WTebBBFbvLdwSRT7O1rBhvHADues0t4s3VhlaWz?=
 =?us-ascii?Q?oQRB0ds2c/uz8jmk2ZOdHphqW2ZMJ/fqbTIbqSxfjAoHtBd38q02OlE4G8IC?=
 =?us-ascii?Q?kuwEf5ebj59F0/HK1MGYfO7H/oqMZtqmczpOpqTp7slKQvcjvixM5PmyNDC+?=
 =?us-ascii?Q?RoI5tCGVIJssJ8VUsQY9Jd5zIlG1u6IpLDTYKP87U+Y+ysG9lTx2tP/3G/HO?=
 =?us-ascii?Q?qU2ogK9Ycq7TkCHDYGsBBzk4nb8SXfcjGGx/uWvyI2f2us6q73JWqDH827Bj?=
 =?us-ascii?Q?c9J8US6ENHzsQTurw2mf5Li5UeK2FVVFqHrQQcjNrpJ8bdXfEKzVAStW1RPj?=
 =?us-ascii?Q?ybVwlt+lpdzVh4HtROUFsQGItKT3+lzBRsdxDL82vPTZ1hoqCk/4UztoNgoG?=
 =?us-ascii?Q?eTq93qnHhP63UCbjfOa6gt06lbMpTWs+Bz2/4WcwJFXjKxhnny+ofk12irrA?=
 =?us-ascii?Q?qbz6kKf7fh+0kLWVXWOg+ZejuKPiUB7rUJfnR86JF2xq0d2ARWZz/vOvSyzX?=
 =?us-ascii?Q?WaXBNmSZDQLC9Z6myftNWx4A2eGL9r1eXH7Mr3aN5KvUJdupdx+5IQ796ejr?=
 =?us-ascii?Q?j1L8bcbN8zqNI/O0wbbYAxB3cDrpri5ejEgB2H7tMTXknChVavuaWgi7UceG?=
 =?us-ascii?Q?d8av6dtL6t/mqzhVX0Gt9IJ15Cn5W91t36+MA2zVSnQh7is+Hl0OrBuMiH+c?=
 =?us-ascii?Q?vY/JwHTe/N8QW4Xol1ToGvnHfnZpwxKkxmgCzU1YAsh8rIcUT5Rit3PJwmY8?=
 =?us-ascii?Q?HExyyVWgl9YQ0WbLBVL26cwm+ViCAW9AdbxtCW8nQmfScNNzYiVmLo10BXZT?=
 =?us-ascii?Q?0YZAvKnJd/Bv5mgMKuPOwv0G/xKljrjcOC7tSlhvqCJBjsOZM3/muP2540TT?=
 =?us-ascii?Q?KSkY/ulpSzhrlytsYvHb1m8FduOCA8LWO/UzHDsyakbzU4F3OMex00ciJg/b?=
 =?us-ascii?Q?5Dyksiaj89CcUU2m4lDJdKKKIyrGp7VPHSIcGuo3/YMzGpSM5XMwAmygIE0E?=
 =?us-ascii?Q?alYGWqLN999YAnmE1FhaEYlyRqmWuCIiz9cKGnKQQkyLixP29tZSw307rVEN?=
 =?us-ascii?Q?GyodsQwSXwiW5do59XbaIGoVFH0oQ4do+PzwvGR/mOqgx5aDyJXhIfzxJ7ol?=
 =?us-ascii?Q?suIEMcGz8KjekmTEg1iUun1AuSs/RWhvXz8f?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mSAJY405eYcxCz/KbclMSNxLZYyGb3TzBjmuNq+KMY/+YC8uKghMlrmEBBOO?=
 =?us-ascii?Q?OWyYduikIIxjrM4qvsyoaUzuitMzwSMU9YtZFCwb0ZW+rilQ5WN8OfWRPoNT?=
 =?us-ascii?Q?HCS9Q/HA30mOLkqQVtS1r1O2FpgAv9mXjCD0bPEMprCgul7cZd2m5VfoIv0L?=
 =?us-ascii?Q?0zpsIthKTTrEdDogTn26cgD443UgEkgzPji/WEyHsXXMBwOVhXqAsZl9Y+kN?=
 =?us-ascii?Q?2SZ1nNXGZ25LTsfWaT80SLp87GPe/i0Jwo8bGDdHbDCdgcIkc+qAoWjsSOW/?=
 =?us-ascii?Q?FP/ImYjGI2XyNwQi3rsYJJssdmPnlqKe0YWMKFrzSJwUPhqzwKK1/WeeD5bK?=
 =?us-ascii?Q?c+HITs5mNidpJfA0l+Q5H5t4vaR76JKtvNe9UKc+iU8F0wfFCo03cm+ONU47?=
 =?us-ascii?Q?rRj6ukfQfwQPUjGW70C8+eDgAOQPTqa8f/ufbgcVRD6ZiM/b5uCaKoI5vlhG?=
 =?us-ascii?Q?8GAQ9Y90ZxySuDEAcxPUyU9tU5tnZy+Vf0nQ7yEc8bttgpvdnXfcsU8lX9Cb?=
 =?us-ascii?Q?QORv5+VD3pZhQkvCnwHXwuz42q9MSBu9gQv8fWfGX/wZVvYab4Ve5W5OXDT4?=
 =?us-ascii?Q?vMOM28CO+xok3QxNat5R6Yj6HtJMgGD2CcvmyM5tVfaz24pAfMyLm3n0ASmB?=
 =?us-ascii?Q?jarcGaCNfTjGktSwzmT1S7DZklPpDlcPQvZ61fVL+Mp0C2CWAufqzIuIf8n9?=
 =?us-ascii?Q?9RZLH3xx0xXVq9miK5+jPKT3kXkivJVueRO5XGa5fg08InbZ5R/2QbuEytI8?=
 =?us-ascii?Q?ADamV70l9lg6GAuBReOqcTPm7AUEaPZUp2POxUUnke2Llq5mlwd3sgB29kf0?=
 =?us-ascii?Q?aHUf7jhxPkEPdMCBLRl94Yy+L5DwUHnuy/uuUleaWlwyu8UQHOX2XruxrS8k?=
 =?us-ascii?Q?s2n0FZZr59G4IkrUXpN4JNnbOODS05L/dJ14Kh6GNNz3xYZcFRpe6tVdIImL?=
 =?us-ascii?Q?zyEmH3MXHkTja7AJv6nVKc21FMUKn/svvtDmKMQW/TxqyAmBXsJEj6+WiJ3J?=
 =?us-ascii?Q?QNfIDBm1k0rfjg+nEj8+gP4oCsn4k/LJJZ/0XRuzYSjNDLWmN8+jIzRFpvHR?=
 =?us-ascii?Q?GBl8lPUCjMI9Ty6pySldfOnwwb6naN4Dv30AOvBxhOiANPIbQKVQ2Upj5lK0?=
 =?us-ascii?Q?iP89x+otHM2dHprTXi88LOiJhFLd/W7i0hlUesdS2thyb1ypMh3yNvw6esWJ?=
 =?us-ascii?Q?WXfEqWQv8THB4pvi4RS2gQPu29+sOQ7cL2W2Hg/EIQJIwwXgOCPICfVroeiU?=
 =?us-ascii?Q?bIhXbsew5Tz+jfmz2ZYRO4Us5Q7KJnG3SpBOp8+eJfOlr7HLb68YpHF/BELN?=
 =?us-ascii?Q?FX9u1/SNny1tjal3Ruw/Y1T4feLiTm24qYIp3r5uRmsNCpuhp/bYvczdduyA?=
 =?us-ascii?Q?4vWuGro+ggbSi82VdJoHc+AWF8hEU4RI9kdzkYxXXqrMLkWgCiYATqzgca7W?=
 =?us-ascii?Q?yUHW0vomGva+WC+qmU5fASMmqspol8MyD+NkngNDabm8/lwGW+xW3McHs+AC?=
 =?us-ascii?Q?9qfR66eT9Nttu68xhzHp5lFEkwawp0pxbsO1ICzI+q6D0LF7loOlj9s6KkLr?=
 =?us-ascii?Q?Y+4xOZmTwLJ/AV4JxXdMg8NLWRvB88AsF9ozUz75?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d3edea-dd9e-4307-5c4a-08de1e41981d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 21:07:00.6469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9Gx+FyqbtHWjN6ErG3eI/3v7zHsALThCGqXgZOA2WG7C9HFh6w6tEsDoMj4Dqze+8YjHzp+7XqpUQIABuBBVsia3PAGnP2LnE6FalRCQVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14830
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

On Fri, Nov 7, 2025 2:08 PM, Hugo Villeneuve wrote:
> You can add the "Fixes" tag (not "Fixed" as I incorrectly stated):
>
>     Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk suppor=
t")

Thanks for looking it up.

I'll also add you with a Reported-by

I'll see if there are any other comments, then I'll resubmit the patch seri=
es by adding this new patch at the beginning.

If nothing else, this review was good because it forced me to go back and r=
eview internally what the hardware manual
says as compared to the driver that we have been using for the last couple =
years.

Cheers

Chris

