Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F44B25B87
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F0B10E7EC;
	Thu, 14 Aug 2025 06:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HIt5glWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA4810E7EC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aimdxuRBqsfs7O9pRoIb+ARYMULXbSe/LqXLBNy/LV/WuOFaPq4ytXszKjUxWFJZn9NCiHE9oZ4U9XKTg9EKXVwWpyJl+ooz/BcdW7tvr/rIDdDij1BUiAQJ26HuqGYOZqQBk35xW0uMJsLzCi3Xt+N8Kh9PvHOYCsVIQU2OHExZ5cNl0q3qrVIU497ZpGP8e8SOG2ZZC8tyuF93+ux1gqjuewMxZyLof20JAoCXSPzIlr8j9JtZsG2dfsbDCDozcs3je65SR/HTHFETPd/FcJdbR1zT8E3cLYSMiW2jLOd5fJDJCejk+TCO2hH1YFTYDmb+Z2DRAgSCD8fPeg6Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EH03MKiTdODG6l4SfzYgf5MxpuaCCZpGCxSj+cFbsh4=;
 b=EyqvMHM8tY8MPPMrmSOzlwq1pn8hpaTx80QHr21lTKlsFLvzKWLLmvSHnz94P7TXLATLvQ5+fbZYJliKDVFlCJy9B/AHoQYqRlV9SGhVh17aVEURWQne6zACPk0mjmvlnmlq+eUOMpEX8u0fG6+FpuGQQHLyqkIGfpwkfPQNJpZS5UVvgJdDbBvDMThtbxuyFTOeTbPmF0Ixmm1elt6QAXw57LxzFRQykXQjGdDMIBqB6ZdCyD7E9qFeieZnvVIE8TXu3XczJ+MeaRhoZsNZPhVxJKkB1qK650nLNDwOUmnd8YAqwCrSFUkVG2qe8HdGsf07U2nw1ftvakT+fB1teQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH03MKiTdODG6l4SfzYgf5MxpuaCCZpGCxSj+cFbsh4=;
 b=HIt5glWy49uyvfiUQ5veJTbyZRJqkwG3hpNfQXZA/Lc7uAMnSnriPIvSWCd7TYL2y4rEbHhnfhYcRyIrKxb0Rism3ITmEG0gLOSmNLncIFWkXDySClhGd6ZD7OxsY77uJ+WfrPnAyKRYiKWguZRzTeZMsud1Uyr38Q5VCkzdseQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9909.jpnprd01.prod.outlook.com (2603:1096:400:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 06:04:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 06:04:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to
 RUNTIME_PM_OPS()
Thread-Index: AQHb8QFhNutWp9A0X06pg/ebOf+IWLRh3xWw
Date: Thu, 14 Aug 2025 06:04:26 +0000
Message-ID: <TY3PR01MB11346A6EADCCCA3C7E510CB7A8635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
In-Reply-To: <cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9909:EE_
x-ms-office365-filtering-correlation-id: 3fd43556-9c43-4ef5-a367-08dddaf86c88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?42WgpWGvxUsipz40lJcyP9O98QUv+sVpV3AYm10/KDHFOsFGod/Xi5I53cLQ?=
 =?us-ascii?Q?lyzzSbLzei0gR8HpgcPudrq7W+cDEAUMQCZgDHqbYLRyLsKH7hQ/A2N6C98+?=
 =?us-ascii?Q?+x8js1bcHuCtiuL6NBlJMI4RCHql0SwjVJeDLSNFAtIjlP3r8v4CfiO1pWh+?=
 =?us-ascii?Q?eJR+TG3wlQeL14wBGt3JSsWCx2uQEy6O17rA1Aa+nDtUHTU6PwqxI9zSVV2l?=
 =?us-ascii?Q?3poSJJqqWEIWN1q9Xcy4RaP9u2ejSLkFoC6z9ENi27RiuUw38ODVvVH9+cAF?=
 =?us-ascii?Q?7c86AdswuNRdrTutVmDKr9Js1LWdJ68JW5NnHCfhKRXM6EO/bpjCfgjpR/YL?=
 =?us-ascii?Q?X6nmybpzcnCFssyMESrYNPPbgi/2GE9ESkMQcYBKQ08n6gSMNDOeDxH054QC?=
 =?us-ascii?Q?psL3GJBmVHUxReeF0Jfz3seRlPQIApaitxC/kExAkT9VGScwmLJOKFFTDU8r?=
 =?us-ascii?Q?6KZvSjZxWOVlEuYVlTaHZHfbGZU1AWbG5bOcJn/LO0p0lHM3VDPa1/0hgpWa?=
 =?us-ascii?Q?PZUF2lx+aO39tC7KLmKD3cd047EiQdJNCPtfhhh3ZLb3hkL/g/JeffOZIT3T?=
 =?us-ascii?Q?jZ5MuNuL/+5CCO56oyqcyig3W12X18z84UufFGjx5R/sflHfqvCexFYoRRvW?=
 =?us-ascii?Q?HJBLSCZ93ubeF64LWRDdA7L7AVMsrKHTwTpFrHucTr4+m2mXL8FZj6Vt0qdt?=
 =?us-ascii?Q?iAqXr880SkPO9JbKaOhVo0aszqiEGbSbapsYglijIoTKgpWJYc0E0Qig6wv9?=
 =?us-ascii?Q?s7NHGXVO/96nlbJ2GFCNjjJ3wl3u0Lfa2QWWMwhS15yOWvZDR0ZBE1IdAlIB?=
 =?us-ascii?Q?OpDjyP8LFthaQdalTYO9aK+Jb8m5DYtWPQqQ6I8vnp3EJGlpC3HyvF/0anAh?=
 =?us-ascii?Q?uDRFOTDemcFeQjB2SEHASc91aTZIGX0tMCFH+DgzixOXNNFF+M/LP4mfUw/q?=
 =?us-ascii?Q?A0ZaqlUBW+MgXH+lrDA5svL4wstWasmRW36JDCmJJsKdwdWYf10MTddPl4mc?=
 =?us-ascii?Q?VWxLgfjQXC/QgCeOVudzHIQY7fm8TBZUhoR9NI7AM+ag5FWx0d7etD+7trHr?=
 =?us-ascii?Q?yN59zB5fLricg+g/xA8eSDu5JnMjU9JBCYCjD6p+7PULIjynk0v8GArXKtW1?=
 =?us-ascii?Q?GY9/dA2y7NLtozkGyVBt9wRKW/Us8x7yxKxPdame9xrcT2U7/kfiqdkKzhUQ?=
 =?us-ascii?Q?QDP4ZYVDZg65z7qDMoLBYia4UvPiR4h7IZaII8R//JakNK1V299MdlMfSI+g?=
 =?us-ascii?Q?5mNVGYIitUWtR9jO0br8F8htSpCQa0H7W4fI4rnhAAE+1sbXkinodN1C1F8G?=
 =?us-ascii?Q?2E4xCPypH8YCyXbulniRDufiiHwbgyqLe4Ovxle2Fw4e+c6CoxkwrNuUfdtB?=
 =?us-ascii?Q?4FEkjWkGzsKsePqi18L+7EhOZEOe0RwNtAhYCcVlrNn5n68yCOviLtSPmZKa?=
 =?us-ascii?Q?wAIxH/KUrtOS3nyFoxoH+Joh2fP1Z/gIDqZ3xqmM5okIPsWGklYt1g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BmhlDIYNvHZ7On+j9I9bQumoFafUUAZ7BRJrpyAgq/t7rHg90wQ4gNDvAVKY?=
 =?us-ascii?Q?pOVh396FAV6ziMJj66MQfYRjYGR2GpQJlXGJoGYZCC2IGnwsBvQvaLSres/n?=
 =?us-ascii?Q?K2/Nvd5ZhgXcBLSj0cpAUddQluWpIEifkRr1/T2JX8NzlG5ODmBTVsGkc34a?=
 =?us-ascii?Q?lUqxXf54C9PxyFiz/4lk9GfSYxDsFvGtKLd/gCToK9Lb/nDjGSTBlb8Nhgkx?=
 =?us-ascii?Q?XPRdhCswd1WqQ8Q/FiaNDHrHvYpnqzFPO5kU28kyIH22Vu31uRB/M+WfPyWY?=
 =?us-ascii?Q?gR03x3r0oQLKmEhYi4ELRMQHHu0j4VdyyEBKyIYTdsWI/Q7326nYZ8e9IDJC?=
 =?us-ascii?Q?H+K5TwJbEQZz1CU4kJYKTeSJznZam0/6BH86YCUT6+p7eZ7koHA1lvZzt2xz?=
 =?us-ascii?Q?zQnb8Td9owBZpTCHvRv1QIpJDS2xJVz8mcFS6t5sjAP1FKXoGLbpHA/LwSkC?=
 =?us-ascii?Q?QOPT/XDQNd2zK3SUuEZJRDfYX4056my9qP1EERcR8A+1AlY3ZkKDsIDXF0Ga?=
 =?us-ascii?Q?Jj9vZ3HVluD+3ZxIqWsfKHUj3v9e4yC4cBPsiZbEiPLc7Cfezyy0VaDAGfX7?=
 =?us-ascii?Q?I6I9fada4zxYqeRUiNJ71rwGJjSNgcg8mqqwnu/81pu7z3ES/weZagPA0xN2?=
 =?us-ascii?Q?n6NKR7Jggp1h2WhSR3CMy+22pWGpJXHAgKJC5Pak9kEcPVT7Z/TpVfvkx1xj?=
 =?us-ascii?Q?qLcdItbnlDhXJen1S8+Dq9Bk8HvBeQgM8vpPkNlNDYcGSPz3+M8UwLnkW/up?=
 =?us-ascii?Q?s9u+UVhkykhgG396bAqWfGpzzKq0H4Mgu7sDrtudG6Nuzgr6u2tzg8hhPiaZ?=
 =?us-ascii?Q?4O2iJCmKctoZkSAAP8YJ5qYd2bMxey0vSkz+WR+BH4+Jq53820j1aS1MRJ/x?=
 =?us-ascii?Q?XbUfnt7z1w4JKAF2q1sIBiEgvLGfJUMBzdlXZu2m5rO/R1B7gxUrRStItWQG?=
 =?us-ascii?Q?kopx99UBDUEV+6FYBvYglXgITHs2o5xHrhxCbZO97b9hs9Yqc2JaKUKe5IXy?=
 =?us-ascii?Q?IkM+E2wdZ2/eW22mz8TOWW4m/PCiG/V80e/RE08n7hC6UnThFllOJmaA+vDC?=
 =?us-ascii?Q?kBXVmAWgDjK2zG/2eoUDDKyEmeD9h9DrODg052J2tkYsxJ/0elhYi6Ccs2MC?=
 =?us-ascii?Q?PN0kOmgY8AEQRWHUAwxMpunHXzAksR3/as5efhFXcWZXlOtQ6YwM3OpJtcgD?=
 =?us-ascii?Q?AN2Bh2CEtSxZFV0rEX3pVv7GAwXSQHjyDyRe2eultHBzizYM4x4wCl46dhQa?=
 =?us-ascii?Q?Vi2pWAUHAkCtJ6sbNTziK/RQlUaOoAxCpjHTjYqGQtkt5TkkjN5G4Su0149C?=
 =?us-ascii?Q?dEmsg/gGpCzN2O3aEqML18diqK8xidUvNLOQrfnodhzA7uGQr4HN1d44fszI?=
 =?us-ascii?Q?6+AuIvDjtTGHH6bQVQFIfd48BHDiEDXJMGQwDcK5QUaSS8xcaO4wX1VZdT1q?=
 =?us-ascii?Q?18YBN5gWTVVS6SQ5vm8g9m81h+aO2xbnF49VakhM/BE8hey7kWtvBjGKfjgm?=
 =?us-ascii?Q?AFsZqJzyC/JXZZO9HRwCznBlwDEsInn2ePcBNiErCyH67j4Bw6OnZbhwGkwn?=
 =?us-ascii?Q?TSHbWm++n5NG9W07YYAbqTXthli4h9ARn+MT49I8sbIjy9kRK/bvKkz0CAmH?=
 =?us-ascii?Q?ew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd43556-9c43-4ef5-a367-08dddaf86c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 06:04:26.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fIDEW5jKlkszw7+eGN600yEWm2TyYaGmazNdw9Nx+0cOosY9j8cu4Kch1CFmRRfiz38I0X3uRjZM02c/OGgRuXjYL8y/sMVZVYE5JLUgtM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9909
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



> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 19:43
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS=
()
>=20
> Convert the Renesas RZ/G2L MIPI DSI Encoder driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us drop=
 the __maybe_unused
> annotations from its runtime suspend and resume callbacks, and reduces ke=
rnel size in case CONFIG_PM is
> disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to drm-misc-next.

Thanks,
Biju
