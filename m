Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640529620C0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7B310E150;
	Wed, 28 Aug 2024 07:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KWXFOjZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324E10E150
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSy4cr47B5wcowhaW5pU+AFMquphnjcuhu9IXoOhCRufRdinadzG+AJV4fFTW6t97mUokLDF7cfKSp7N3l4CFdfPbRZ8h3hzZVm0dm60hPxsB7ayp9s1+hGhuqifqR48Qkf8IOgnx6aJi/AQ0bXQjEJ/+Nq4IMLEq836eVZTIyT3tkyKdb5KLtPaQmLwt9US0c75pN81Aw8oK0vv+QNlQ3Np4M5tEPANnGQ7P4eM5hTmNWAJIUHY1NZY0qGBWnIW5WGs/RDOs4DCyDkxG/kgm2DvA8Az9V8qqOSsKHc30fLPU6U5+N4WRm8YSpYyxcz0ZqZTCrVxmPqbTtD24n2qUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2fPb9d5/9AGks4cT3JfdFWY7iJkxbYOOrt6JaP1VeU=;
 b=zWH+EMcucCsLKTHaNs10WfHhfoDE15WDlJ1ptDdnMROwLoAAPIaFkiA1UdR+4H+fsXqZ8W0Zk4Pb8nGmtnRdXQS3iYGoVzGIHlTbRIlLC5ZrGkW26WGe24Ydirw6MXncdomfSIlO+yJonL6tzHp5XwlZxOovTNN5sLvx/n9sM3AeUaVmMjyGyA7MyRRFzKhqfbnUNF9ohAjyorT+vOaTQt3lbfiWb0Qju0MMx3uNH+S7OaiUdUi1CRId9XrzXpv8GUVQ+uQowterfYmU4Ajh9rL96PRYjYl+QRY/gqJUe66Is4ARQM5Q2GWhTnXssEC5EljbAUXmLureoQzO+8zy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2fPb9d5/9AGks4cT3JfdFWY7iJkxbYOOrt6JaP1VeU=;
 b=KWXFOjZIPqqpctSFUaBJLdauBc+sYtBOc5Mk+41PX3Qc/RYyr0sxNwJJQfNSL0nveMPmIETja8ZRFezjvEfb+S3gWgn3d60LYmTSIK0tHlbYmDiLCVVHoE471jlOh4tlYjZw19LY3swmLWQM2++3K/NDENHTUwTUN6WccaZ1vUw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5714.jpnprd01.prod.outlook.com (2603:1096:604:b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 07:21:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 07:21:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Topic: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Index: AQHaGIfbNkLqQJf+iUioLkutiw4N1LCvC8aAgY4DQCCAAF8ogIAAlV8A
Date: Wed, 28 Aug 2024 07:21:32 +0000
Message-ID: <TY3PR01MB113469F39EFC94916FC2570B986952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
 <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240827222237.GH30398@pendragon.ideasonboard.com>
In-Reply-To: <20240827222237.GH30398@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5714:EE_
x-ms-office365-filtering-correlation-id: a620961b-e115-4725-f8eb-08dcc7320aa8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UVZMVjRZZDA3NDV3ZUlqTi90ZERyemxQNElUNWNwTHhoWkNyWEI5STREbnYx?=
 =?utf-8?B?dUlBSE5jSmUvNWlnVGI1d2xHek51N0pWdXp0NXByc0ZSNFJVUTlRbE9YOUJT?=
 =?utf-8?B?UkdtMFBoYUZNZmVEUmZ0OWxBK2ErN0ExMktWY3N5K3hCTFlqSWZQNmQ4Y1d0?=
 =?utf-8?B?dkU2cVFVMW1GeFJGL1pPMExZdWVVVUJKYXA3RmdGamdrOUxTdEg2RG9qVUNS?=
 =?utf-8?B?bktEUllaSXRiMnRuTnY3RXhpdzY4Q2dCRWc0c1JwWDV1YnVSTzdJMEZ2Sm9p?=
 =?utf-8?B?Y2kzYWxWSXRYVkVONVFXZkFvd05OYm43cXM0TXJ4UzUxMHpKMDRLY3puYjVZ?=
 =?utf-8?B?MWNZaFVjSEdMSmFpV21sMlg4N3JwNEwrWnNzalUyWGJLL1pXS2dPalVpcHZj?=
 =?utf-8?B?a016bzhiQ3VkS2dtTjlMaW1YaFBoK3k5bEZWRDBUTDFGZm5sWFRyTVJGc0hx?=
 =?utf-8?B?eGI2RkNYVnZzQkRyUGcxckpPR0VqUFVLeE1FUzBBSGg5ODNXTnNQR0lsZnpo?=
 =?utf-8?B?Qkp4dWlhU21VSnNwdDk5TmRSNHkwalc1RTd1eE5iTTU3NWlXWTdMMjJGd3A1?=
 =?utf-8?B?MGdzb0swTjFzdkFNNlpHMjJSYmVPUXJ4QzlsMWZzc01vc1pUdCtzMnFleXB3?=
 =?utf-8?B?Uk13RDU3T1luSzNObkdHdWxrYzZEdGVpLzQ0QytkWTFRUVU3cm5KR3hCcEE1?=
 =?utf-8?B?TDBvK1hreFQyZmNPMmNFdWRwYmpsZG5td3V1UXRwNnR3RkpGMjFtVk1GOWhv?=
 =?utf-8?B?VDNBOTJzbkRoQTNwbDFkakZzYmRXazU0WjJYalVxWDcxWjJzUmtKWVEyZzU1?=
 =?utf-8?B?TmhKajFlYm10Wk1HMmU1WmdqQkEvcWZaVEJ2eVNJU0J5c1RSR3Q1Y3AwaS9a?=
 =?utf-8?B?dDN0b3FyaFp6d01lZVMzcGNrTHYrbVRSMWQyUDJHbXErNUVEbGpHdXpHNnZW?=
 =?utf-8?B?WUhMSkdBZXp6eTh6eCt2RHBZeUxlQ3Y1elBJRnRLL2Z5aVpENU9ZbHpoU0VV?=
 =?utf-8?B?dU15bllMVFJlbGNFU0hPMzZTcFVkKzVxdlZpSi85V0tIT3RkdkdxaHpRVnNG?=
 =?utf-8?B?N2loZW5HRjkyeHdsVVUwQ3ZtYUl4TmZveW50RmV2bWVqdU1HYmczSTV3QVNr?=
 =?utf-8?B?b1ZZblNKeHk3WURwRHlucWVMcnREUVU5OERMZjNOWlovQUw4dEFMZEI0UzV3?=
 =?utf-8?B?WXFoUEhZWmZtKy95eW9FNmhCYUVHc2JWRGprWTNnQmFCWGZaaDFtbjRYVTlR?=
 =?utf-8?B?ZkVnajNwMzNoazQvaHNTdWR5bGxiSUxzSFJvWDNzQS9PRjVDL2krTVZBNDlH?=
 =?utf-8?B?dDlKV0FxOUZITjdNRXI3OFFkZE9JNEcrc2tQanBkMURzQk9IcHVMOCtSUWti?=
 =?utf-8?B?QmFhUnNsNlZjVXlLTEFPVUJUbGxWZkZjU2JtMTFxZTFwTGFTejV4a3dMTFQ4?=
 =?utf-8?B?OTJMSkExUlB1bUUrZUJGRHJoc0xVL1hkMUtjaE1RaU1tNFA1cmZEQ3dDekZD?=
 =?utf-8?B?NFNDK0VVNVdHdFdBelZMK1ZKNE9CODBCeWkweU5MNUdFelY1NS93MXdNMzJu?=
 =?utf-8?B?cjVhbXIxelVtN3dlcFJIcmFYaTBlc1pxbCtIWHpBbkp5TDRoMlpPbDQxL2Zq?=
 =?utf-8?B?cWJRQzExV1ozckR4UlFJTmJncXBUYVRoTkxiV2YwNnpaREdTaFY5VGg5bWl5?=
 =?utf-8?B?Q1BoNnJmZWd3dWh3ZVNNbWZDb1Z0eWdvaW5BZmRSTXR6R2hmSU92cENjK1k0?=
 =?utf-8?B?K1lJMGRHNk5RNExONHFSSEhWMDZtOXVKbjRTbzJWN0N0QWFDc1U5NDNubXdw?=
 =?utf-8?Q?598E8bxg+BvHmgrgCzg6K1hLpAep8yn73HJU8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHBNUUZ2ZWNjdURBNy9pTERTSGpleUlmTnZmZHJGODAzZlcwblllMWhPUkYz?=
 =?utf-8?B?V0hoRVFrUktuRVkzVUFaZnRmRUlHbmcyWXFtS3VaZWp0RGtoWkQ4V3o0bWN1?=
 =?utf-8?B?VUFsV2JiMHMrUC9uQnVvdEFSUTBlbWlJZGpXSW9OUzVGU3BCWDZxZ0ZPckFN?=
 =?utf-8?B?VmkvZS9CZ3FEUXUzQzh2aE1wS2FWd0l2YTJyTm9ob2wwNm9WdXhlaXM4RGtW?=
 =?utf-8?B?UE9PQjRRbEdxMTZieStHVVRwWkdoVDEyUWZhc0xpOTRScUJJZmxjR0tIT0ht?=
 =?utf-8?B?R3lZbU9XaEV6ZG1lcVJSRlZXMWMwYmZodHNldHZyTTVpY0dLb2cxbmo5ajc0?=
 =?utf-8?B?NGZwdUYvaTNrLy8zbjBjejFMS0I1VHNreTdsTEdXb2k3MnJkdGd2WVdGekNx?=
 =?utf-8?B?dlc4bGZwNnJiR3dob2EwbC9aM29CTFVselR6eW01MnhyZ202cmhneExYMVVq?=
 =?utf-8?B?Z2Zia2x5Wmx6ekU0aTlHcTVXU2hEalJhc0hPaVc4TkZCeUlXeG1nUmlObUJM?=
 =?utf-8?B?MHowT2I1MDBKV2s3ZVJNdERKbEtGTlAwbVMwSXNOUmlWZnhkd041MTRwL2o1?=
 =?utf-8?B?NVAyN05rdCtCSTBRdzlsQjBnR1ZDL2drbml5WDJNbGVxTmw5MUNubnpUOUlN?=
 =?utf-8?B?eUVYcjJOcnc2YzZIeGlRU1BhcjVwNkdDUzdWd0YwUVBLdnY4TFBVVzk4eTdL?=
 =?utf-8?B?R3FibjZPdlBCcnlSakNZejlRaklZNHd2VDdGaVpjMHlFb3IzUG9waFBNZkFy?=
 =?utf-8?B?ZHBtdkYwVHZyd0JDQjVNS01WNzZRbCtSakxsWUwyMERkb3dmcXpldFFiUU9w?=
 =?utf-8?B?WjlyRkJWV0YrQmNsUnowV0JnaTFybTJpdTUydEgrejN5cG42aVBRQTFSZktG?=
 =?utf-8?B?Z1l1OHRUY21zbTY1ZEdCV1NCT05rUVRCTFQ0VmthYXgrRlJZcUtjbnNaYmw2?=
 =?utf-8?B?T0w5enppV0djVVBUakg5Z1RzYlBwcVBpemdxaVh0R05ZUG52SlZnVDFoYU9u?=
 =?utf-8?B?NFAzTVg0Q01TZDA5UmNLbEpqVERaQ2VtOW9wOG1HK3FLRlFLUit4MWIyQjN6?=
 =?utf-8?B?Y0w4OUZva1JJYktpd0lTbUdyTzR1YXZ4ZVNhdXY2TVIxVW1UTHp1cktXaFAv?=
 =?utf-8?B?azBINXdQUXhOWURlM1lUVXhDUlpDcTgxUWpkNWxNS3N4YVZPREFzUy9BOUxQ?=
 =?utf-8?B?TFJXMzZEcS9MSy9BL3BGb1o3SndWRFFjcDlRNzZjM2sxMVhkR29EMDU5aEp4?=
 =?utf-8?B?OGlrTkhKMEozdm9iNTg4OU5yT3VJaEpTQUZGRFE0eG1Qd2kxRFh5cmR2akdv?=
 =?utf-8?B?Q3Zvc21lc0JSUURHeUlTdnRxL3VQbzhBK2pERG9tQkRVSG84N0lvbll2d2t0?=
 =?utf-8?B?TjZRODVoRjhXSFdhS2FEaDA5cDRmMDYvVEUyNkNOTWN0ZHJmdHhjV1A3b1lK?=
 =?utf-8?B?UkZ4d01ZVitBc2VMeWtidG5iOVpNTTNaQi82Y3ZHSWF2R2FSL1RBQkJLcjNW?=
 =?utf-8?B?K3htWGpOZXNWMmJWbW1jR2tWQ0VSejY4TVV3QmM0ajI1ZDdXaXYybnBtdlU3?=
 =?utf-8?B?em1TWmpFdXJocSthUXkxcVBLZmRGalo4azFJazRwY0NtNW9aY1NwZ2t0dGxy?=
 =?utf-8?B?bWwzamZ6ZE5kajQycUJCd1ZBRXJ6UUtQelhyRWMwSEFNdzlhdTRGclVOV2Fn?=
 =?utf-8?B?TEZlZWdFSmhOK2ZlU0hLZDAxRWQyV2lLTXNoRW5MOWp1R3dWK0d4Zm00aXJs?=
 =?utf-8?B?U0pmNFV6ZGkwOVZ0Y3RNNGl3dnovcWFCdUIySitzNlNtOE53aDEzR0lLOTVh?=
 =?utf-8?B?Q0NaVXllV0NwbjB6QW1Ib3g5ZFZHNFJMcHpKMm1Mbjd0bHlEWFRNRGVxb2Jj?=
 =?utf-8?B?cThXN21IOWJtKy9CTmZLNHY0S3BweEtFMnpQOWw5WlV1VXJuS0dkQ0FzVWJj?=
 =?utf-8?B?WXo3NGwwcHdpemtGL3N2R0FTQUxsU0h3aHJHbnNpTWtFUUdGZzExZmVtNmx4?=
 =?utf-8?B?UGwyY1d4T3RibWNzQzZIQmhtRmZrUDZxdHNUNURNRkViQjFUM3E1aFlYNFFx?=
 =?utf-8?B?YnlUUFN6VDFJTGRlYUhITzBnbmZzMmVTVUROQU80UEFXdU9XemprOXdrdkQr?=
 =?utf-8?B?NnQ0aTNnVlNQZU5pNFZnWWZrMTNUVGJtYkJDUElHZDBkZ0FlSU1vczZjYlVI?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a620961b-e115-4725-f8eb-08dcc7320aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 07:21:32.0819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWVonpx425GiO/N+bLrmCFtrsXcvHOz2qhX2XnlouhxTUp1bCYZRr9LVVoPZ93RjW1OgtqpZti91U2Mw+wIREeb6YtKkBLXdFDUvxa0hMs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5714
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

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIEF1Z3VzdCAyNywgMjAyNCAxMToyMyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyXSBkcm06IHJjYXItZHU6IEZpeCBtZW1vcnkgbGVhayBpbiByY2FyX2R1X3ZzcHNfaW5pdCgp
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMDQ6NDM6MTJQ
TSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTGF1cmVudCBhbmQgVG9taSwNCj4gPg0K
PiA+IEdlbnRsZSBwaW5nLiBBcmUgeW91IGhhcHB5IHdpdGggdGhpcyBwYXRjaD8NCj4gDQo+IEkn
dmUgc2VudCBhIHB1bGwgcmVxdWVzdCBsYXN0IEZyaWRheSwgc2VlDQo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNDA4MjIyMzQ0NDUuR0EyMzU0MUBwZW5kcmFnb24uaWRlYXNvbmJvYXJk
LmNvbQ0KDQpJIGJlbGlldmUgdGhlIGNvbW1pdFsxXSB3b24ndCBhcHBseSBhbnkgbW9yZSBhcyB0
aGUgc291cmNlIGxvY2F0aW9uIGlzIG1vdmVkLg0KU2hhbGwgSSByZXNlbmQgdGhlIHBhdGNoIG9y
IFlvdSB3aWxsIHRha2UgY2FyZSwgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQpbMV0NCmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BpbmNoYXJ0bC9saW51eC5n
aXQvY29tbWl0Lz9oPWRybS1uZXh0LTIwMjQwODIzJmlkPTg2NmRmYmM5NTNkNDZjZjc2ODJjNmE0
MzRhNGRkNjI0OTY3N2ZkNjgNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIg
MTgsIDIwMjMgMTA6MzkgQU0NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybTogcmNh
ci1kdTogRml4IG1lbW9yeSBsZWFrIGluDQo+ID4gPiByY2FyX2R1X3ZzcHNfaW5pdCgpDQo+ID4g
Pg0KPiA+ID4gSGkgQmlqdSwNCj4gPiA+DQo+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4N
Cj4gPiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAxMjoyNDoyNFBNICswMDAwLCBC
aWp1IERhcyB3cm90ZToNCj4gPiA+ID4gVGhlIHJjYXJfZHVfdnNwc19pbml0KCkgZG9lc24ndCBm
cmVlIHRoZSBucCBhbGxvY2F0ZWQgYnkNCj4gPiA+ID4gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2Zp
eGVkX2FyZ3MoKSBmb3IgdGhlIG5vbi1lcnJvciBjYXNlLg0KPiA+ID4gPg0KPiA+ID4gPiBGaXgg
bWVtb3J5IGxlYWsgZm9yIHRoZSBub24tZXJyb3IgY2FzZS4NCj4gPiA+ID4NCj4gPiA+ID4gV2hp
bGUgYXQgaXQsIHJlcGxhY2UgdGhlIGxhYmVsICdlcnJvcictPidkb25lJyBhcyBpdCBhcHBsaWVz
IHRvDQo+ID4gPiA+IG5vbi1lcnJvciBjYXNlIGFzIHdlbGwgYW5kIHVwZGF0ZSB0aGUgZXJyb3Ig
Y2hlY2sgY29uZGl0aW9uIGZvcg0KPiA+ID4gPiByY2FyX2R1X3ZzcF9pbml0KCkgdG8gYXZvaWQg
YnJlYWthZ2UgaW4gZnV0dXJlLCBpZiBpdCByZXR1cm5zIHBvc2l0aXZlIHZhbHVlLg0KPiA+ID4g
Pg0KPiA+ID4gPiBGaXhlczogM2U4MTM3NGUyMDE0ICgiZHJtOiByY2FyLWR1OiBTdXBwb3J0IG11
bHRpcGxlIHNvdXJjZXMgZnJvbQ0KPiA+ID4gPiB0aGUgc2FtZSBWU1AiKQ0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0K
PiA+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQNCj4gPiA+IDxsYXVyZW50LnBpbmNo
YXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+DQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiB2MS0+djI6DQo+ID4gPiA+ICAqIFJlcGxhY2VkIHRoZSBsYWJlbCAnZXJyb3InLT4nZG9uZScg
YXMgaXQgYXBwbGllcyB0byBub24tZXJyb3IgY2FzZSBhcw0KPiA+ID4gPiAgICB3ZWxsLg0KPiA+
ID4gPiAgKiBVcGRhdGUgdGhlIGVycm9yIGNoZWNrIGNvbmRpdGlvbiBmb3IgcmNhcl9kdV92c3Bf
aW5pdCgpIHRvIGF2b2lkDQo+ID4gPiA+ICAgIGJyZWFrYWdlIGluIGZ1dHVyZSwgaWYgaXQgcmV0
dXJucyBwb3NpdGl2ZSB2YWx1ZS4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVfa21zLmMgfCAxMCArKysrLS0tLS0tDQo+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+ID4g
Pg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9y
Y2FyX2R1X2ttcy5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9y
Y2FyX2R1X2ttcy5jDQo+ID4gPiA+IGluZGV4IDcwZDhhZDA2NWJmYS4uNGM4ZmU4M2RkNjEwIDEw
MDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJf
ZHVfa21zLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9y
Y2FyX2R1X2ttcy5jDQo+ID4gPiA+IEBAIC03MDUsNyArNzA1LDcgQEAgc3RhdGljIGludCByY2Fy
X2R1X3ZzcHNfaW5pdChzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpDQo+ID4gPiA+ICAJCXJl
dCA9IG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9maXhlZF9hcmdzKG5wLCB2c3BzX3Byb3BfbmFtZSwN
Cj4gPiA+ID4gIAkJCQkJCSAgICAgICBjZWxscywgaSwgJmFyZ3MpOw0KPiA+ID4gPiAgCQlpZiAo
cmV0IDwgMCkNCj4gPiA+ID4gLQkJCWdvdG8gZXJyb3I7DQo+ID4gPiA+ICsJCQlnb3RvIGRvbmU7
DQo+ID4gPiA+DQo+ID4gPiA+ICAJCS8qDQo+ID4gPiA+ICAJCSAqIEFkZCB0aGUgVlNQIHRvIHRo
ZSBsaXN0IG9yIHVwZGF0ZSB0aGUgY29ycmVzcG9uZGluZyBleGlzdGluZw0KPiA+ID4gPiBAQA0K
PiA+ID4gPiAtNzQzLDEzICs3NDMsMTEgQEAgc3RhdGljIGludCByY2FyX2R1X3ZzcHNfaW5pdChz
dHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUpDQo+ID4gPiA+ICAJCXZzcC0+ZGV2ID0gcmNkdTsN
Cj4gPiA+ID4NCj4gPiA+ID4gIAkJcmV0ID0gcmNhcl9kdV92c3BfaW5pdCh2c3AsIHZzcHNbaV0u
bnAsIHZzcHNbaV0uY3J0Y3NfbWFzayk7DQo+ID4gPiA+IC0JCWlmIChyZXQgPCAwKQ0KPiA+ID4g
PiAtCQkJZ290byBlcnJvcjsNCj4gPiA+ID4gKwkJaWYgKHJldCkNCj4gPiA+ID4gKwkJCWdvdG8g
ZG9uZTsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+DQo+ID4gPiA+IC0JcmV0dXJuIDA7DQo+ID4gPiA+
IC0NCj4gPiA+ID4gLWVycm9yOg0KPiA+ID4gPiArZG9uZToNCj4gPiA+ID4gIAlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRSh2c3BzKTsgKytpKQ0KPiA+ID4gPiAgCQlvZl9ub2RlX3B1dCh2c3Bz
W2ldLm5wKTsNCj4gPiA+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBp
bmNoYXJ0DQo=
