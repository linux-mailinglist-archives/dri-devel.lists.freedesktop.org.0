Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAE917927
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 08:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D110E086;
	Wed, 26 Jun 2024 06:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KA1gEWYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2047.outbound.protection.outlook.com [40.107.113.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DFB10E086
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 06:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzisIpVahvk/S3ZiU0YJ5NEYfsyV/NpXubqDZ+022pXQbKz7FWXXN7i/IdWK2oNEgDLfduM35k+gxlsVWQOq7i3qTW/OsJ2OLg9w9+3BRk+bpxTCS4gHunIKd7eBiqn9NjfPV2gTBR1BXKJYsZFEZQnF6KfqUJe2sbpcYwbQjqgVN7/5hZb+oyPv41owQ/xrEjRGOXokvEkonhZVGPO1f8keXckvZh55V6TTJDf40BHT/q3JjznFNCu4CS1HtpdHqYJECzeTV+Vt7dQG/35MTt0KVok7e+YnwU8Yyx7JH9frj3AUHwTrpy5O3xIfg5mBgN4IXCOgTtCFwdo0BkYwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghlDJkMwyxa/Us0zr6ZfwpGTuYP1eM0XA4qN+PCJZGM=;
 b=YbxqT5byJXjbqA6QIMQXhYewWtCh7dNyqxhSGxSAaPNNULTv8RUFGPtbl2pg+HTgvCJVHUgwSWr3FvZPbmG3RfCQrsYEAVstW6G5BQTAh9shqovYx5UfljEjWtBuXwVS/sogX5raCrEoMWcwsG7yYQE22lzfUTNw/pQbQh5H648JEYwMTMJyJ62d8onToGXq6lHUG2+/ABDBa4AyhJjlL779aQLLom7z2xg+srEuG3ZbZ25ijEwVfLzZRDVfVaETq3RC53uWY15O34HY9borY2Iacwuv9od6sT3pmk2MLGVr1XmvaQtSXm7qBZQcatua6zusLPKZXeg8YGfJ6ikOPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghlDJkMwyxa/Us0zr6ZfwpGTuYP1eM0XA4qN+PCJZGM=;
 b=KA1gEWYtv0FmA1kwordfgb5+KQFKAi8ro+sepcZiBFP+sGpdJlgOFK6jgizgBDo1swQ4QZZjfi1x6unTGlGzYKrWByL5nFPbq18sq1MxOLA2hcrI7Ht4urBYTpZRms8ksOVHATLOfNeZjjjL6TEtHO6UMLO/N1Eq52WjNoxFzBg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11881.jpnprd01.prod.outlook.com (2603:1096:604:23d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 06:47:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 06:47:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prabhakar
 <prabhakar.csengg@gmail.com>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Topic: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Index: AQHaxvvrCVUVLwgOH0e6KnciNkV+R7HZi7YAgAAOWrA=
Date: Wed, 26 Jun 2024 06:47:22 +0000
Message-ID: <TY3PR01MB113464444BAE5D8B7B0CDD07A86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626055108.GA10453@pendragon.ideasonboard.com>
In-Reply-To: <20240626055108.GA10453@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11881:EE_
x-ms-office365-filtering-correlation-id: ec6c08f6-efdc-425b-2567-08dc95abd531
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230038|366014|376012|7416012|1800799022|38070700016; 
x-microsoft-antispam-message-info: =?utf-8?B?enVocTF1WVozUlp5a2NSWC9sN1NoQ0VoZkZzU3N1RlJpWTlYa1RFdzQ0d1dN?=
 =?utf-8?B?Y24vQnBmMFRNQVo0ZW13UmNiOG55WlVDRGN1VXJzbnBiZ1B5NVVtZDRDNlBM?=
 =?utf-8?B?SjF4b09tcHRneVZDVGhPTzhuYzNzQ3JEeFp6QW1zRjkrQ1U3NWNUTzZoTXpi?=
 =?utf-8?B?Y3Y4Z3NiTzl6dHNjcW1RSXV5QnFvdktKdmZxemk5bk5CUXhOa295T0MvVHJY?=
 =?utf-8?B?TW9vTTNHTmFnUkpiM3BRYlVvbVBBUTBoNnU1VzRsK0Z3NHRBYWJ5Q0wwYWVW?=
 =?utf-8?B?YW5Jcmd0eWdlY0ZRNC9OUER2LzhuN1BaM1dOTDBDcTAwTDF3YVRFYXh0MG8x?=
 =?utf-8?B?Sld2ZEtxdHgvUVByWDFVN1RhckV0aUIzUXYyVlNaM0xKbE9VK1pFVUFxVHcy?=
 =?utf-8?B?NGFUcHp4d2J6dkl2eFA4TUllaTJKdGxPNWVHUjI3b2NnVmpURkxUKzRPNDNr?=
 =?utf-8?B?Qm9BeGJzaCtUUGU0VWJJNkoyOFJuNWlBTDlCMFZEMG9nQ2ZrNWZMTGQveTNy?=
 =?utf-8?B?VDRjSHczYnlnSkxkZ2pRT210UmQrelQ4L2htZWRZWVNKZG91b3M4UnZnZmZa?=
 =?utf-8?B?bkdUWDJtWVpWQ3lNbzlHeTR3TmtWaU92NnFtRStJUE9HMmIxY0ZjU21UWGFO?=
 =?utf-8?B?RDI1aVZNeFFtcEJaQkJpOGFzM3REVVZUNCswUzBYOTI5ekN3YVo0ak5tQnh1?=
 =?utf-8?B?cUZnL0VWbEZ1MFVReldlMjEzcmJkVGhHcjNpcUlkWFdjWDdycTcyNFNNbHRm?=
 =?utf-8?B?aW9zdEtyRTgrZTB0OElGS0lBQ1Mrd3hPZjZubmc1Sm1HRTJKMUhRM1dDekpC?=
 =?utf-8?B?SXdnMmxrNWJzTjhjRkRiekprWmhrZWJ6bmFHeGhhZlZIOWoveEhyRSsxazl6?=
 =?utf-8?B?ZXRHcmFmaXBwaktWT1dpOUVmVlpXSTV5NVg5RGtIUkhaV3BhRHFQOUZzSkRs?=
 =?utf-8?B?RlVpcTJ5dXFNU09YUHBjdHVMaEl1R2NtSWlySFV1ZGVJMTBDOTV5VkRCZVFM?=
 =?utf-8?B?VTFQN20yTGRRemlKaG5yMU1nVEFlc016MTJ6NDAzOExOY0VBSUNrNE9xT3NC?=
 =?utf-8?B?bmYvSkxMQ1NCd1hVMW9jODN5WkVXQ1VNNThMWTJlTzlCckVRSks3SVgxaVQy?=
 =?utf-8?B?eFZZSkNJSFNBVElSemVpZHR5SW9STm1XMlFHNGxZT2EyZy9mZ1lYZk1VdFlU?=
 =?utf-8?B?d24zZCtuYmRBTDFIbWtPeEZTRmlMc2ExYkF6Qzk2cTRBR3BhcU9tQlk3aXZl?=
 =?utf-8?B?empNcXRhRWlwUEJPdnd6dkptZFlkUlI5eE9zNWp3eTRrWGlOOEc3OXBGekFV?=
 =?utf-8?B?WkVSVk5FREdnN3MrS0thZGIwbEtPb2NuVnE1YTltR0lGRHRCaTNSZ2d0TU5R?=
 =?utf-8?B?Z1gzUkx6dTZTQ0JXQUpCUm5GMHp2Uld0bjJsOURUbWpjL3UzL2ZwY1NlVFlq?=
 =?utf-8?B?alduVFRubmkvVGlRSUxybmZYbFdHd1JLSHVQVVBMUFNXV2lCbDdJb3hTais0?=
 =?utf-8?B?YjFMK2piWE15M2RLenRnRTJpbFJMdGxiVnRYZkxUdFRYLzZLcTYyRFFpQStM?=
 =?utf-8?B?UWQ4Y2lPbmZwRy91ZlVzVGhsMk1tM0dvTW5pTHNyWStjT0JvTW1TNmxMWk5y?=
 =?utf-8?B?ZmhYaUs0RkhqdU94MXdpS2NDbkl3ZkhqVTg4dzFsRGxaK3VHM2dJbS9yQUNH?=
 =?utf-8?B?ZlNMb0xXaDdjN0ZIZUtRYkxibk44RnZUbmdqS1NVa3YzK1ZRYjVUUnNEREhV?=
 =?utf-8?Q?qlDCUYSNjuqzyYa4/9IFuk7ZQ1Adak1mVIuxbzC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(7416012)(1800799022)(38070700016); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekpkQjNMYWpxV2cwa2NJVFZuUlNrajlVd0V4WWswZGVKamI4RUN6TTdxYVZ2?=
 =?utf-8?B?YlNQYTlST09rcGZzbnlRS28yUm9uRWZwcGpEWHVUK0FUQjRadU43QkxDMmhN?=
 =?utf-8?B?WW5hdW53emxqOTVjVjdVZVNMRGp1bmNpU0RqZWpzZjlxVnJZNnlPV0Z2a3JE?=
 =?utf-8?B?TWJKQnJwdzg5ZWZqRVpPNWJhSVBvL0tIUXdSVnlFOXpmQ2RrL29qK1MyZEtW?=
 =?utf-8?B?czVFTWFvRXUwOFNSTER1YTlFTmZWRUV4SXJqT3JCVzlnTkl2T2hHYlNJeU9S?=
 =?utf-8?B?OWJzWlh5QWdUM1kvSDBhMFI5RDk1cXVaa3JwS1RwM2tXUS9WeERJcnRzTHNT?=
 =?utf-8?B?U0xibWZxRjArNS9tQTcxRFhkQm0vRnFMSnBrZTRXdlZJWTV1RUpxdktDY2Fs?=
 =?utf-8?B?VHdHdWhrbFBOeFI5dkFLdE13eXE4M001L0JMc0lyTzVWeG1ERWtmaFdKNjJ5?=
 =?utf-8?B?bFB3SUdDSHR5Ym9GUW9ZZ0t4dmRXWnVmVkNXcmVYa2lIYzM0R2ZZMTJRQTNk?=
 =?utf-8?B?WXRSRUNXQklCQTlkMTVPRDg2azlDMkZreStJT09lVTdmUXBaSjRISXdacUVn?=
 =?utf-8?B?WDlJbDQ2L3JzVEN3em5yVHcrVUtkcFpUdWxtUnBqQWFkTlRxak4xcnhmMnVN?=
 =?utf-8?B?YkNtNDl6L0V6cUJTR0lLUnJ6aTEvdi80WlAzWDNwL3poQ0dtQ2JGTE1wbm5j?=
 =?utf-8?B?QXlwRFB4RlJhYjFlS2FNNHJKOWtFWTdNRTArUFFKaHZtbjU5YlJ0blkyeFVu?=
 =?utf-8?B?OFlZRi9oZXJyd2N1clR3NDMzS0I1d2xXS3ZaQ3REM0NVZjlvWStLZzdCS013?=
 =?utf-8?B?VThZQkVRUzBVSHZZeDRDOG1BR2VhSFQ1bWxZK1p0RjRud05FSlVmODNXdkNU?=
 =?utf-8?B?NUlKUDNEemFrM1RWMlg4U2JzRkpDSXhTby9iVnNLaXZXZ1RiVURBR3ZQUThP?=
 =?utf-8?B?UnRaNjdJbzNraEY5LzZiREh2ZXFNWktnWkdkcVoxZFMzSlBvQ3F1T1ZZTEZD?=
 =?utf-8?B?aTRMNkZDQm5sNnkxZDJlV1ZoWG85REEraDF5U1JEMjREUWhTTks0YjNEOUJS?=
 =?utf-8?B?NUJQU21YbVltSkRMQW51d3BybklSWFRaanNucmYwVE5SWmFra2ZOZkFwOTdv?=
 =?utf-8?B?RTc0R1lCcXJkazdqVk1yeFlVK1VxcXRkMDlsMytjTWZ4VFljYUcvWjB5OHhM?=
 =?utf-8?B?TjZ1WmMxazIxMEYxZWFQWWZHSlhlYWxKdnZrQW8yY0dwcndyK05IWnZCV3B4?=
 =?utf-8?B?Z1JOZ0tDMDZydzcwdEc3M0U1TzBBSHJTUWlmNUNpL0M4cW5yMWlVbHdwOUk0?=
 =?utf-8?B?Sk9oL1A2ZWl2Mmt1UXRzSDczeW53aVA3UjQ1d0IxS2NybkJtWGtTTC9BRjkv?=
 =?utf-8?B?TVlzcUNta1czTlJ4OGNrRFVPb2V6aUlMQ1d4aFQ2M0kzMHNJTFRnMnlUczd6?=
 =?utf-8?B?OVNuWm5QV2ZkcWlGcDBSY0ZUZ0JwMVUraWc5SEZ0eHJUZEFIU3JydkVmcXVs?=
 =?utf-8?B?T3NGN1ZUYTR2MDFTZkQ5Rk0vc1oxazEzNGNQK2cxMHo1YXlKYkprbmhnZWJY?=
 =?utf-8?B?RUcvSU1SWXFOVlh0aCtOQThLTkNVbmtKOWNEeHEyN0pVNGYyd2JFVTNpbzJI?=
 =?utf-8?B?VGZkb01IL25yZUdVZ1dEN0dOa3E3NlcvZUlvczhCdTVqMVpNK0pUM2IvWGFn?=
 =?utf-8?B?SGNwUGxlN2NjaTUvOEdERFIrK05ZMFhJNGhveHAybm5oTmIzNTFUT2EwVmhr?=
 =?utf-8?B?RHR1aXJ5SUtUUjNGcjc3WG9WaHMyK2IvdnRZWU5nb2R0UUxxY1NuVVduRXlh?=
 =?utf-8?B?ckhvWXkxYVNqYklUZk5TVndvQ01iSEZKc2svK1l2ak9zalpUVkNQaEc2YUJU?=
 =?utf-8?B?YUVIZnRBSmM2Unh2bzZCRk9mcmVYNGs2bjNOcDRTQjFvNkE1SFZwVlVNZzRr?=
 =?utf-8?B?cHZoNi9acVBTTEM3b3VLSUJQMWl1dCtYRWhFV0t2eWJ1ME1sYW1ETEpLVjU0?=
 =?utf-8?B?ZVlBYVRBSzh1SkZFRUY5WDFFL2pnOWZwSGpkU2JqbzlxQ21DT1kxY3Q1Nm53?=
 =?utf-8?B?VktsaWorcDBobURhNTY5anlZaEdocEs0d2VTdUJLZXo3dm9lNG1saGQ4Wk9v?=
 =?utf-8?B?Wk5LbFpQKzJTMjFGNGJ2TUE3OXNDQ2o5c1B1UWtUVXRQRGQzVW9MNmVWZVJS?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6c08f6-efdc-425b-2567-08dc95abd531
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 06:47:22.8384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHpFD2asftKS4OXMnEPlKCFeUXlXoEQ2TpNROAeRMxzZFaxr3Wv5NP61X0hVcBbg9phULHH5HdKIgCP5fkaTdSNSj0vqhR2Lfs++m+oxDYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11881
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

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyNiwgMjAyNCA2OjUxIEFNDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybTogcmVuZXNhczogTW92ZSBSWi9HMkwgTUlQSSBEU0kgZHJpdmVyIHRvIHJ6
LWR1DQo+IA0KPiBIaSBQcmFiaGFrYXIsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4N
Cj4gDQo+IE9uIFR1ZSwgSnVuIDI1LCAyMDI0IGF0IDAxOjMyOjQ0UE0gKzAxMDAsIFByYWJoYWth
ciB3cm90ZToNCj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBbGwgdGhlIFJaL0cyTCBEVSBzcGVjaWZpYyBj
b21wb25lbnRzIGFyZSBsb2NhdGVkIHVuZGVyIHRoZSByei1kdQ0KPiA+IGZvbGRlciwgc28gaXQg
bWFrZXMgc2Vuc2UgdG8gbW92ZSB0aGUgUlovRzJMIE1JUEkgRFNJIGRyaXZlciB0aGVyZQ0KPiA+
IGluc3RlYWQgb2Yga2VlcGluZyBpdCBpbiB0aGUgcmNhci1kdSBmb2xkZXIuIFRoaXMgY2hhbmdl
IGltcHJvdmVzIHRoZQ0KPiA+IG9yZ2FuaXphdGlvbiBhbmQgbW9kdWxhcml0eSBvZiB0aGUgZHJp
dmVyIGNvbmZpZ3VyYXRpb24gYnkgZ3JvdXBpbmcgcmVsYXRlZCBzZXR0aW5ncyB0b2dldGhlci4N
Cj4gDQo+IEkgd2FzIHRoaW5raW5nIHRoZSBzYW1lIHRoZSBvdGhlciBkYXkuIFRoYW5rcyBmb3Ig
YmVhdGluZyBtZSBhdCBzZW5kaW5nIGEgcGF0Y2ggOi0pDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
DQo+IA0KPiBEbyB5b3Ugb3IgQmlqdSBoYXMgY29tbWl0dGVyIHJpZ2h0cyB0byBkcm0tbWlzYyB0
byBwdXNoIHRoaXMgcGF0Y2ggPw0KDQpJIGd1ZXNzLCBpdCB3aWxsIGJlIHRha2VuIGJ5IGRybS1t
aXNjIGZvbGtzIGxpa2UgZHUgZHJpdmVyLCBhcyB0aGlzIGlzIG5vdyBwYXJ0IG9mDQpyei1kdSBm
b2xkZXIgd2hpY2ggaXMgcGFydCBvZiB0aGUgbGlzdCBbMV0gPz8NCg0KWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQv
dHJlZS9NQUlOVEFJTkVSUz9oPW5leHQtMjAyNDA2MjUjbjczNDUNCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcmNhci1kdS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgOCAtLS0tLS0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAyIC0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICB8IDggKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVz
YXMvcnotZHUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgMiArKw0KPiA+ICAuLi4vZ3B1
L2RybS9yZW5lc2FzL3tyY2FyLWR1ID0+IHJ6LWR1fS9yemcybF9taXBpX2RzaS5jICAgfCAwDQo+
ID4gIC4uLi9kcm0vcmVuZXNhcy97cmNhci1kdSA9PiByei1kdX0vcnpnMmxfbWlwaV9kc2lfcmVn
cy5oICB8IDANCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkgIHJlbmFtZQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3tyY2FyLWR1ID0+
IHJ6LWR1fS9yemcybF9taXBpX2RzaS5jICgxMDAlKQ0KPiA+IHJlbmFtZSBkcml2ZXJzL2dwdS9k
cm0vcmVuZXNhcy97cmNhci1kdSA9Pg0KPiA+IHJ6LWR1fS9yemcybF9taXBpX2RzaV9yZWdzLmgg
KDEwMCUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNh
ci1kdS9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L0tjb25m
aWcNCj4gPiBpbmRleCA1M2MzNTZhZWQ1ZDUuLjM5YWY3M2NmMjA5MiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L0tjb25maWcNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L0tjb25maWcNCj4gPiBAQCAtNjAsMTQgKzYwLDYg
QEAgY29uZmlnIERSTV9SQ0FSX01JUElfRFNJDQo+ID4gIAlzZWxlY3QgRFJNX01JUElfRFNJDQo+
ID4gIAlzZWxlY3QgUkVTRVRfQ09OVFJPTExFUg0KPiA+DQo+ID4gLWNvbmZpZyBEUk1fUlpHMkxf
TUlQSV9EU0kNCj4gPiAtCXRyaXN0YXRlICJSWi9HMkwgTUlQSSBEU0kgRW5jb2RlciBTdXBwb3J0
Ig0KPiA+IC0JZGVwZW5kcyBvbiBEUk0gJiYgRFJNX0JSSURHRSAmJiBPRg0KPiA+IC0JZGVwZW5k
cyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUDQo+ID4gLQlzZWxlY3QgRFJNX01JUElf
RFNJDQo+ID4gLQloZWxwDQo+ID4gLQkgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgUlovRzJMIERp
c3BsYXkgVW5pdCBlbWJlZGRlZCBNSVBJIERTSSBlbmNvZGVycy4NCj4gPiAtDQo+ID4gIGNvbmZp
ZyBEUk1fUkNBUl9WU1ANCj4gPiAgCWJvb2wgIlItQ2FyIERVIFZTUCBDb21wb3NpdG9yIFN1cHBv
cnQiIGlmIEFSTQ0KPiA+ICAJZGVmYXVsdCB5IGlmIEFSTTY0DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3JjYXItZHUvTWFrZWZpbGUNCj4gPiBpbmRleCBiOGYyYzgyNjUxZDkuLjZm
MTMyMzI1YzhiNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2Fy
LWR1L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9N
YWtlZmlsZQ0KPiA+IEBAIC0xNCw1ICsxNCwzIEBAIG9iai0kKENPTkZJR19EUk1fUkNBUl9EVSkJ
CSs9IHJjYXItZHUtZHJtLm8NCj4gPiAgb2JqLSQoQ09ORklHX0RSTV9SQ0FSX0RXX0hETUkpCQkr
PSByY2FyX2R3X2hkbWkubw0KPiA+ICBvYmotJChDT05GSUdfRFJNX1JDQVJfTFZEUykJCSs9IHJj
YXJfbHZkcy5vDQo+ID4gIG9iai0kKENPTkZJR19EUk1fUkNBUl9NSVBJX0RTSSkJCSs9IHJjYXJf
bWlwaV9kc2kubw0KPiA+IC0NCj4gPiAtb2JqLSQoQ09ORklHX0RSTV9SWkcyTF9NSVBJX0RTSSkJ
Kz0gcnpnMmxfbWlwaV9kc2kubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yei1kdS9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9L
Y29uZmlnDQo+ID4gaW5kZXggNWYwZGIyYzVmZWU2Li44ZWMxNDI3MWViYmEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvS2NvbmZpZw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L0tjb25maWcNCj4gPiBAQCAtMTAsMyArMTAsMTEg
QEAgY29uZmlnIERSTV9SWkcyTF9EVQ0KPiA+ICAJaGVscA0KPiA+ICAJICBDaG9vc2UgdGhpcyBv
cHRpb24gaWYgeW91IGhhdmUgYW4gUlovRzJMIGFsaWtlIGNoaXBzZXQuDQo+ID4gIAkgIElmIE0g
aXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCByemcybC1kdS1kcm0uDQo+ID4g
Kw0KPiA+ICtjb25maWcgRFJNX1JaRzJMX01JUElfRFNJDQo+ID4gKwl0cmlzdGF0ZSAiUlovRzJM
IE1JUEkgRFNJIEVuY29kZXIgU3VwcG9ydCINCj4gPiArCWRlcGVuZHMgb24gRFJNICYmIERSTV9C
UklER0UgJiYgT0YNCj4gPiArCWRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVT
VA0KPiA+ICsJc2VsZWN0IERSTV9NSVBJX0RTSQ0KPiA+ICsJaGVscA0KPiA+ICsJICBFbmFibGUg
c3VwcG9ydCBmb3IgdGhlIFJaL0cyTCBEaXNwbGF5IFVuaXQgZW1iZWRkZWQgTUlQSSBEU0kgZW5j
b2RlcnMuDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L01h
a2VmaWxlDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9NYWtlZmlsZQ0KPiA+
IGluZGV4IDY2M2I4MmEyNTc3Zi4uMjk4NzkwMGVhNmI2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JlbmVzYXMvcnotZHUvTWFrZWZpbGUNCj4gPiBAQCAtNiwzICs2LDUgQEAgcnpnMmwtZHUt
ZHJtLXkgOj0gcnpnMmxfZHVfY3J0Yy5vIFwNCj4gPg0KPiA+ICByemcybC1kdS1kcm0tJChDT05G
SUdfVklERU9fUkVORVNBU19WU1AxKQkrPSByemcybF9kdV92c3Aubw0KPiA+ICBvYmotJChDT05G
SUdfRFJNX1JaRzJMX0RVKQkJKz0gcnpnMmwtZHUtZHJtLm8NCj4gPiArDQo+ID4gK29iai0kKENP
TkZJR19EUk1fUlpHMkxfTUlQSV9EU0kpCSs9IHJ6ZzJsX21pcGlfZHNpLm8NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yemcybF9taXBpX2RzaS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jDQo+ID4g
c2ltaWxhcml0eSBpbmRleCAxMDAlDQo+ID4gcmVuYW1lIGZyb20gZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcmNhci1kdS9yemcybF9taXBpX2RzaS5jDQo+ID4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1
L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yemcybF9taXBpX2RzaV9yZWdzLmgNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpX3JlZ3MuaA0KPiA+
IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiA+IHJlbmFtZSBmcm9tIGRyaXZlcnMvZ3B1L2RybS9y
ZW5lc2FzL3JjYXItZHUvcnpnMmxfbWlwaV9kc2lfcmVncy5oDQo+ID4gcmVuYW1lIHRvIGRyaXZl
cnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21pcGlfZHNpX3JlZ3MuaA0KPiANCj4gLS0N
Cj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
