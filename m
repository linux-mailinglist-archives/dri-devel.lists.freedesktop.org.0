Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8CB27831
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 07:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D00A10E1AA;
	Fri, 15 Aug 2025 05:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s28UjF0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542C10E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 05:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOMH1GHetunyMhOpfARZ8P6tUZWct6HDpZE2aWwO5j13wcBUKnbsA1JbAitCg5OJcNAa19VZmhwXV5TxuLXvuGSXjAKAR8m8inW+EobPsW6J9nLM6y/VVBXBFSB3ztkxwSBBG7f1kwOVK1eFo8xW7IfGsoa53wtRRuStC+sYvxLmVGGE6OhQe80Q6dbOKAFtxvIAf8jvGUGAP5QfYitiI/njNsSvvC27CYrr3SgmmcjoxxkmMGGMA/IdEkpTSUVrY6wEbq3ZnvyMy1GkMIxVYlc9d0I3awB+CF5Bt2m0lfHs6p54IsgFGbFzjhGEs5Mmxj2pXoNCpK1JJG3TkX1IuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08UPekhG2Qhn4wcCKSpu5E2Bo4nWuXvUCshRQ1M0NJk=;
 b=etZ4BZgXTeLXvqluCsNd5b/Y6KvmqYUSeCG1Nbw5gUEskb9eGxst4atFuzINP+jCFjbOv0dsLkv4gMuIvQENwr6/e3rw8VXTfR14N24XkaqoW4wtwPEzPkhS8BQgt7gjM2vFN6nMVv4wJNpgH4NyxnOiywyQanKWeQo5QDJ5qd7E69baZzs0qA/4+8jDNNUY3/PSFjBl7nlH2qcJiqLc+LuhyJBWZhhgIsmqTeQ92XK2Fc3nFyGDVOUEoD3n5OYP/kMYx24QI5E752tr/fwhWOxmyPRzhTdm780RnhTg8dBhVk6C6keulYMFhu6JEjvr4gOWHjwkTpGuk6XFB5Ie5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08UPekhG2Qhn4wcCKSpu5E2Bo4nWuXvUCshRQ1M0NJk=;
 b=s28UjF0nY9I3Fea6zIKkEMfIleQKycCgcZffQ6gmOPwFCYtcISHesnH6Xqup7fRU0KFMf0hKAdm8e0tFo4CtT02JlzwM/J+blfrotC5NHkImwReAOx9v1v/ipfDvSQ2LmXXg2CptJao8uZcBjGuq7c69ByAHNWtxQf9c750JUXs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15136.jpnprd01.prod.outlook.com (2603:1096:405:224::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 05:14:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 05:14:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
Thread-Topic: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset
 entries for DSI and LCDC
Thread-Index: AQHb//xDhyd9VrNCk02PvKHkdjXVXLRjRqyg
Date: Fri, 15 Aug 2025 05:14:39 +0000
Message-ID: <TY3PR01MB11346FBB4598B008FB1FC0CDF8634A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15136:EE_
x-ms-office365-filtering-correlation-id: 099d557e-6539-4ddd-acde-08dddbbaa28b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/7Bcz1ih0IlqSdhWb+3j+qUbl1MWx5t8vsuaRvQJafzvRhdd8z5B9yWS93ne?=
 =?us-ascii?Q?RyPHpxIIGJhp4RkW+BrHqsE+P3ZZ5SO/N3VSOw9EcM3ggH3Yg6EomcwnhF1r?=
 =?us-ascii?Q?Ku3FpfIEOHIQSPO/isbOsiUYDihcDZXEHkDYRdfKYDTGg+oeYCdoDPrlyTNg?=
 =?us-ascii?Q?WQSKob0t6pLfXunDlG7Ukj9SE9G6598bQFPsq0V7ftU60/0QHrmDy/DWRhnT?=
 =?us-ascii?Q?bkiJoZhC767JjvhwiBANgyndSvEGOQGWOQx69Mk1Rn9QSz6dtEIsq0ygCz8s?=
 =?us-ascii?Q?6pB62GTfoty1WR2UBWj+fd4ltXTtLj6VAV4Y5UWpVjIZ2JXadRpK1qgBYJtl?=
 =?us-ascii?Q?hEC/w0kSIrH/RvQNqVBdmC1wRuFJ/6k1131EAxzvIOkBvJG/8MUC4fkOHd7T?=
 =?us-ascii?Q?9bVRsK/VEbiNFaJA7xFcMXGLFxkSwm78DBKhpq2vCGfOwiUS9hr8SCrNRRce?=
 =?us-ascii?Q?8xj3XhZLbSF7hBRMYcf6uEmegly/wJJz01Mp9jwU0nmkndZiiVAgknIqShq0?=
 =?us-ascii?Q?Bo1zlrAa+zQ43h4tS8vX7vOQ7tlMxnTQZN/1JGO0JS1GpM9gM9W9EGoKvCkN?=
 =?us-ascii?Q?U781uP1TeakEOeurP9JBo9sqR5Ym4WSqXnu9zbdA2cGitopAtosFXAY2zIs+?=
 =?us-ascii?Q?xLAgAYKUm9E5zJ7DeRnYiiKpiVoV9LP77YqhcPUJYBgO5NWd093pVdyYeoTb?=
 =?us-ascii?Q?ACTibsGins8S8+aPNNGNOegxdWqXtlwhXcoDtJoI8yEpqLRDiw0CKAsedfPt?=
 =?us-ascii?Q?qJkiXazNxo6O9YMukTAuRX0wpWJxIQwZa72BmfW8B2KkhluLOgqrANUXGQVd?=
 =?us-ascii?Q?yJcFu8qKFgCc401b/vvi+MU9LxS910aNLV6yPO4z4553puU9fpKIztXRggkg?=
 =?us-ascii?Q?He6faJtDQRNbcimQg4KPq9nT0frv7+9PWZzeaBDEZrfWDBoUXlMhwiAaJ0pR?=
 =?us-ascii?Q?XiakDbGNBNuJlsLFNXkebUf2OEgHNnuZcdOYYeRA8xdNHjPqXNz09eja33yf?=
 =?us-ascii?Q?CZGwqpxej8a5Pnrr34Y4L5Z/HjAwTpv+hDbFCe65c7yjPE343U4ffTowgE48?=
 =?us-ascii?Q?NPKqPQlJ3huEhCk45WD0+MJ9ZmgfCCRZLNPj1b1Cy1I94qYjEkcQ0NfvxeyW?=
 =?us-ascii?Q?5yiri4wIWuNCj1vCfXfY6f0G2Wrp2h6nIprSjh2h7b00VYRhbj1ktcHmJ/MM?=
 =?us-ascii?Q?Jk3xucm4G6a9TIw9UxMJzig/VfetHXxWwTWwA92caVvRuKCvhjFnFRduj2Oi?=
 =?us-ascii?Q?X36pIJ17wSjW9IpIUEG5elmk6uJbaBzz0DOfmn7/J2QfHVFjt59sX/BQsFCn?=
 =?us-ascii?Q?5eL7qoTo8hNIbEfgNOCFYoIbHDTZ1vnXyRcIKxAH3eLJp0G1CqHBAfK2/ERB?=
 =?us-ascii?Q?E2O4oIUZA0rfaiYekDqZDG0/+LmSYuhKzSFA24G/HICOsWoPDRw1tg+O7V0s?=
 =?us-ascii?Q?rFYXdOvFip7FrPR+wFD2go6gDqmGnRlOg7zLfHzVQk8qX/nN5llU5rQ7hkSN?=
 =?us-ascii?Q?rnEE54yvC8ZvH3E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hw2PF6m1v9g+KTRG/KhQ9ZKSm04BAqTAguAlHz/QjUCn5MQZDK5rcMLjOQDP?=
 =?us-ascii?Q?BmjZI5tJvTmvjR1RYw4WwS8qXMzzhnA7BiffS3P/oFpJAjUxekXB0BTQIp2X?=
 =?us-ascii?Q?3iBafztzsDpIeClVJMAJ4hpYKSP/gwcWeWKykRd7LgTWX3jBrEfeFg8fW99A?=
 =?us-ascii?Q?1w9z/IRmM285vAZWHcH67EYVnij4MwF31EntRSTIoycUF1m26vhZv4b+XlQh?=
 =?us-ascii?Q?SWEoi3ie0RQtsZMZIc8ck0xkp6SawlqLAzUuzaLUKa1z2SsV/kaS+CjnRQkg?=
 =?us-ascii?Q?OGXElbEJdwyMOLhgY33XYJnAe81wIwS5r1Kv+XeAx3ilJM4FojuGxGv/TZFJ?=
 =?us-ascii?Q?tann6DBnuwi1NmfOHEQNCJNDakCb/gQ+J4PI4R21pQzzi3bcC5y1H+N9UpGC?=
 =?us-ascii?Q?dTFaV0s/QKW/x2cmySKW6ds17byR4qfID8xYvBRH0YGui/vZgKCYRUptV82+?=
 =?us-ascii?Q?jjZaYxnd5AcLGNCSDA6/8n8GDkeo9sW2QxsfiaWg1Ldv1jSI1yyQ0GQrOFGx?=
 =?us-ascii?Q?e6VO202bi44vStnI12QwDTBTwZVchSrOP2GJffWxDUpHEqw3y+RVrY7yqURA?=
 =?us-ascii?Q?f13j0JstF72ADxFolqAAd5WYtrCnOhbr8R8hE96KgAuNCo7gbMYW5sz3b2zh?=
 =?us-ascii?Q?arChhCfGQhg7P1L5E/N/Qpc3Rs41Vyn5FEiQ0ffAzATzl4iugB8FtmzCwn8b?=
 =?us-ascii?Q?yV4caCM5kxFd7RcwBvuMsJbmmku/llgt0Y65R2bsUCRJr1GfP/vnepZ2ME4W?=
 =?us-ascii?Q?ug0j1ypuKpkhtjmcm1HIUK1Ml+h3LRKmEPB6b0qePsyuZaALNMGZQ6AJraLe?=
 =?us-ascii?Q?Mu1fSslpDSx27ddC8yn4kdaaGe0oxsWeZgDHw3L9c3d16kHp04yj8OZz2fab?=
 =?us-ascii?Q?FIY3Prf40Imamv/aJ2GSgbpRBN5+XyBIxNDmJ0y2R3xn0qPs3ev7eobSCJI6?=
 =?us-ascii?Q?0hsfx0vlT/L8jNeHXFkktS0N0Rgb1pmk/uRF+vTLQ+eoguBFsLI+mWlVH84b?=
 =?us-ascii?Q?aZM7FlSJIVStdwkLImPX48DW15Q6bAKcOO/WBQVUeVOuPBvZTcjNK7oxantU?=
 =?us-ascii?Q?q150tDqj/Qxr3SkySWUhh/zetFxkk8xHveQd0tDjSBst0HPxt2EwYxrNfeCl?=
 =?us-ascii?Q?ucsz7e/FO3OXAlEMlpouhjVk6WiBZovaa61Z5mfadEQAYK/e9e6/mspY9OqW?=
 =?us-ascii?Q?r5ZNzC8kbyv4AqCabKEjnDXUcp9gooV68tTFP1lIkv9wNcnhRacZtKA7puw4?=
 =?us-ascii?Q?jVl2s3veOICIpNt36bPVRXd3iuhRQ0LyUZyk++rUYJOzsZGodEq9u6rHXWZ8?=
 =?us-ascii?Q?IUglpL5k75updo6wfr9mfhO/dIRjohXgsIVZ4iSJyZKyS0PDjmipAESyFdzZ?=
 =?us-ascii?Q?EgR86xhteF/a58HqYr7Cm5/8r2GmM2/JQVdKBwjnsjDYlDgoT+LFrvaV4Ynk?=
 =?us-ascii?Q?ULlYSw5g3cjE2deKyu0EYgfsrwIirrShnZe581/ba2iLkkCvEBv8UvW65ow7?=
 =?us-ascii?Q?D2AlocSNn3MlSRzrOnh8Zs7ztIRnqzYVfplUK2OImvPyIfsVrIdBNyzeO6C/?=
 =?us-ascii?Q?oDFj8MOlZAC7UWjU9/pHdPkfW3sDZXsv9XFby9t4DySgSx41EqqGI2pWBY6x?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099d557e-6539-4ddd-acde-08dddbbaa28b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:14:39.3715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXEnBw5ZozUa9tCXi4yAn5Qyh0nTwnhDyMt7KwYNwXuaZL/BCvDw2NsLWQuiJDc7UPsUo4jCic3OlI0+WZruEvEE/jHMXMzqd1ikcyjDJ2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15136
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

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 28 July 2025 21:15
> Subject: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset entr=
ies for DSI and LCDC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add clock and reset entries for the DSI and LCDC peripherals.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

