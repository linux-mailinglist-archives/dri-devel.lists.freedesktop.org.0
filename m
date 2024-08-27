Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0967961471
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AD510E3A2;
	Tue, 27 Aug 2024 16:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SGuneokl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707B410E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtcV9J1PNIUqGdyaUwdIYrGs1nGGjEirgstKroW/7WrNTeUFBXAm3thrxEn9HXaRy4qgGZThcPLXRXn3PzSPlTJqYVZLGu5Sb73vz/hz6aZ5HyCXskXY/A40FNywxbooDmz9CQRoZE+Diz7GOtd52tSr2K5fmOOhWginkLiLEs1oRlnSKJUolI1190U2rA40wUV3m+Vt0ylOH5tktJB7IbzE3XmmspHw+Ql33p/vblUikMAnr4Ge8qu/bUP18lM3RlvP8oaC4UK4HbyGn9rF/DHcLI6pLhL5azc05eIDV9mjC76nbSbVduMzYZIc1gkFyNFHAhKRpo8eIRWSZNbk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f645ruIGVDNHRRcFHpGNwtC9pgUo4g0Vurgj+Ox8A08=;
 b=llzCPq2cwc7BSxVR2tjGOjkEshfF8FWMZHYsZTPLfJbyDBktBSi5HPtT/xfw/ZV4f+TTlFdtw/vuBoWd1t0ike44XkpYt/BnQAuAvDkAYirRk3w/DDSNT6gkFTYcdkakzVgTCkByfZHLldhGAYmR9xIYU0R3fc/IOq4IF+n2dCBCtO0lIkSArw50ZLFZT5wnHYaobTB1wsrkgBRkrN+QS4BuuAlp0Lwg7F3IjczQ6O177uMW4dVafVB2AtKNhcS2fWgPig6a5u+MTSObhTlLBgz8UoQ0OfIS70U21ZTEiwn/9a5tSJNOwO/3AUkDiwSqt2GFj9K/V59NhVSkugYj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f645ruIGVDNHRRcFHpGNwtC9pgUo4g0Vurgj+Ox8A08=;
 b=SGuneoklh8mFTQb/aIyrpGGLrw7hVI4BKcuNdEL+a/b8iAvOzPYetgDJVDbuJ6Acy9BQnAdyYFVq/7i/pc2wuCfcC+OS62GErQtrtk3Jeuye5rp6ZobYf+CKtunzDHpAx9DMVVvVeGCtXH/rrpsVp8FQT/AL21EGYgIiK9XioCI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10659.jpnprd01.prod.outlook.com (2603:1096:400:326::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 16:43:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 16:43:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Topic: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Index: AQHaGIfbNkLqQJf+iUioLkutiw4N1LCvC8aAgY4DQCA=
Date: Tue, 27 Aug 2024 16:43:12 +0000
Message-ID: <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
In-Reply-To: <20231218103903.GP5290@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10659:EE_
x-ms-office365-filtering-correlation-id: ba6e0544-1b95-4179-97c7-08dcc6b75760
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QkxkcUdNVzdLNXV6dy9sbEd1Y09DR1B5RE9FQUVFRThoODBtdy9WZzhEK1Av?=
 =?utf-8?B?QkRWbEhsbXBtcWJZemx4Z1pUSHI2UnJzOWZyYWNsa3NKSTlNcnhEaUdYSExG?=
 =?utf-8?B?ZXc4V201elFHeTlkeXErQk1jMlRZVytxTXpwWjhGK2VITWhCdkdjRHhXcFJj?=
 =?utf-8?B?aHVsZmNCWWMvaHFHRzFLQ2Q3K0hRRjhvdUFLQW5XWmdUUUVuMWg3anlpYU1l?=
 =?utf-8?B?SmhZTlBadXphR2hxajFuWHgwS0puUTdpenZQZE9pL1VCT2JNSmhZMU5obkpD?=
 =?utf-8?B?ZFVnZE5oNHNJM1NMQU0zZCtHQ01TTldPRG55QnJvcHNxelNLZWdBbkxFRVA3?=
 =?utf-8?B?TmowNWhaa0JoaXR3ZFdGd1VOMHFidFFlZHRrcW9LTGpVRnA2a3BSSHlqNTZC?=
 =?utf-8?B?Rjcxd2xmRzlQTmtid3pzS0RkYzZBR20wMVRhQU02Z1NKdlJxblV2MlNwSU9n?=
 =?utf-8?B?Nk8zTG0xM3Z5RDJwdGZuNWNMazY1MWZkRytZeUJNcHpBS1RsdUxSVU40Mm9t?=
 =?utf-8?B?cER2bXl0VUpSLzVCeDZGNGRjTlkrQUFadHpBZVh6ckpZcHloNnhCdjQ2b1hj?=
 =?utf-8?B?dCtNMHVUNHhIa205YXpDaXlOcG5OTUdXWmFsKzBOMUhKZXVNbzlDNHpURERm?=
 =?utf-8?B?MVVpdVk0WEFGSU5KMkdGMFUvazUrckxOYkFsZnpyeXQ0aUNxSWc0UUtmZjZC?=
 =?utf-8?B?THE5RGtTM3I3a3kwYmxmd0J5YU8raGhUdVZBUitWajZkRlJEcEhjM3UxZ3FH?=
 =?utf-8?B?a3Qra3U1MHNHcFpnOG5ZdkQwdHhCbDduNFp2UU1RMmorekRQRE9SR0JTdEd2?=
 =?utf-8?B?MjRnUUozSVZEeEV1VjZBakNZVVZaQUI3SW9OMDF6QTR6NUhORE0rMm1GQ0lo?=
 =?utf-8?B?YmJjejJzQUo4S09CSjFNZ3hhS3ViazVsUVk3dmdxUkFzQ1ljZ3FHT0dBcW5n?=
 =?utf-8?B?OGZhNUZRMW9IMUhZQVZVNytjaENpU2t0NDZLOUdMOU0ycUhWVjRUc1FySDly?=
 =?utf-8?B?Tm0rR0lxekZkZ05lM09RWXg3TmIzV3hBS3dmb0hDOFU3eXhMNkQ1eGkydkl0?=
 =?utf-8?B?V2NrbVhjc2cxc3ZpWW9XaWNna2lYbGczcEQ3SElyRkZ2d0FSakJoM2UxMUFq?=
 =?utf-8?B?cEJIeG11UmFQdXFqS0I0YTMwUVYwQXovUi9ycnVQZXpQcXNyMUJsU2pldDZk?=
 =?utf-8?B?ck4wbmlWNjRQNkdXWU5MMm1YRzFVL2pXcHc4SUtyaGFSdzdaWjc2bTJQMGJE?=
 =?utf-8?B?UVNBekhuWXB6VFZDT0lNNDhKOVRuaWpSR2VIbUNWM2xFSmRhWFE5ZWNkb2Q3?=
 =?utf-8?B?ampNNWFGNUUvT2ZlbTBEd3lBWVJkc2ZBUkI3eXlyb0M5Y3QzVlRIS0xjNlc1?=
 =?utf-8?B?aXpCcndhc2dHSit3NXVGaW9pYVlZOVRBc2JCRG12RzhlVHdlRW12Y2ZNeUVr?=
 =?utf-8?B?VDhQb2NjQ1NUaTRMakVMeUx3Y3htY2cxeFF6Z09sTjZXRCtCdG1BOTJoS3JW?=
 =?utf-8?B?STNSVjRYUE5wQ3VmUlM5YmdiTGhCTWY0VWtBeEx6ei9WOFVOcjMrZllRa1BN?=
 =?utf-8?B?dEkrLzNPbTdxNDViQmtZdEJXTzZ5SVVYQXB3cEcySm1EcHZXZFQveTh6TWNn?=
 =?utf-8?B?ODdwVndQMURvSVVIdkpmTUxrVGM5L2JPNDA3KzQ4M0ViOXZ4K2xiL0Nqb0FM?=
 =?utf-8?B?Y1NjS1lMQm1OUk5GRTRsaVVQZFpjckQvMlExMW8vbWNlVGNYcTlnWHA4bFV0?=
 =?utf-8?B?a3Rpb1J2cVZ0NXl0YTRTZnFLU3RQVzE4MENYSDVocXI3NDMxVWludU1tRTBv?=
 =?utf-8?B?SEpITlJPQzJqWDdXbUN3REZJZlpCNmNiK0VOSW1yVkR5R3BDL1IxUjJ1UkRJ?=
 =?utf-8?B?dDc4WStob01VUHRNZHJPQ0crUUVXbGNJVi9WM3VNd2Z5QXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2g1TXpvWW1od2o2clV2ZlJBd0FDd3o2Slo0TSs2TFlmcUlJSlNLWjNKd0w4?=
 =?utf-8?B?RjVLNElsYmwvUWFmeWxIdmExM2R6UVJzSnVqUis4RUhBalBIcDhNeEZ2WXR3?=
 =?utf-8?B?OHF3MjgrM1huTk41NW5LSS83enNyVUp3VmlPSXA1L0J6WnVCMmEyei9vU2Ri?=
 =?utf-8?B?M29UdGpVSTlaZzgxdVo1NmtTeXRMM1E3RVlhK3B6eHNlckY0M3ArT0VtTEdQ?=
 =?utf-8?B?a2tIRDk1T1lQa3MyZXBaNE1yRitYZ1dEQ2MxMmxrK3FFN1NlZWZqajVQWStC?=
 =?utf-8?B?bWc5VVhYV2hORmR3WVF3L3dVN09mbUtlR0xiYTJrWUwzclFXVjN1OUZGN1V5?=
 =?utf-8?B?NW5Gd1owMWhyNmxvOVBzczRyYWVMUmRCVU1odDRtQUFweGJEWlVDSXpwY2xM?=
 =?utf-8?B?S2x3cGlLUzNFakFxTnFlMW4yRi8rdWg4WDVNcDhTQWFBLzlyVHNseGxjNWZa?=
 =?utf-8?B?cG9VazVVbUYxVTExaDlGSWl2QzhKb0pVdS9IdmVwWTZhaC9GSmV5VHVXV1ZN?=
 =?utf-8?B?SGlheUVwdE9zcXlMYnBHVnlNWnZwd28rKzBuR29SZ0dyL0tCMnVwQ1VPeDZ5?=
 =?utf-8?B?TGdYS1htaTJFWEJ3RzdORGw3VDNHb2F2cnlDZFArZkV0dTR4RDh2SExTNitV?=
 =?utf-8?B?WUNwb2FOSTNlMUIwWDdKMlVyWVV2SW1SYkRQZW9BdHJTT2xKYmI1SVl2dWFo?=
 =?utf-8?B?Ynl2Q0pqTVN4aFBkUytvb2lMeXRKb21vNk1CcDFRQlJSV01vR1hzUlZlSnh1?=
 =?utf-8?B?bnl2aVovVWtjRVVxS2lnazZyZGsvN3NOTVNnOCtXTkJHK2ZmQ3dFYU0rQ1F0?=
 =?utf-8?B?M2k1aW9ObVRwcC8vcUU3NlFmQVhVTFpDZCsyS0RReTFJa2FzYjhpcVc0WHkw?=
 =?utf-8?B?VHNBaXRVQzcyQ3VnYXErM3RPRDdNK2hqMy8zRm91bWNvM3R6K09NUzA1S2R3?=
 =?utf-8?B?V0JRR1dUaWlyQmVmdXJtalBkdEM4R3BzalFUSkJxSzh5NEoyMEQ2ZHNDQjU3?=
 =?utf-8?B?aXU0V25WejhYOVBzaEJ0c2xYa0NTTG16RG4vUzNubzNGODZWQ1hrNitZSTM1?=
 =?utf-8?B?NEVYbEVCdjFodHhiYUcrM082Wm9URGhNNkQ5NmJsZXdtWlcyNkJNcTZJdG1U?=
 =?utf-8?B?QjV3QVpRODhETnFtb2dhaEZ3eWt0REt4cjhKekZyeFdxanZRendoNDlzM2Iw?=
 =?utf-8?B?bzlvSVBNdHduRFBIc0dxdTc3aTYxd25neVE2a1ZjdFJ3QWE3TFQxM0p0QjJO?=
 =?utf-8?B?RzBaaVFITTdCc0pKUHRRY01YcktndGhHa01hdE02eE9lb2h0K1IyV0NiMWZw?=
 =?utf-8?B?VFR5TXU4MXBVTVdINTUySSt4Rk95a0R2T25SOTZ2d0dGUGZpcHpzLy9CZlND?=
 =?utf-8?B?Vzh5ZW53a1RXRm9qRG1VSVFmSURWR2RLZG4xN2lwYXBNVkxGbE1jc05NTXVQ?=
 =?utf-8?B?MkpvcURiL2ZOU2gzN24xWWZuRDRlQ0JrVmRIbGNud1ltWUxuKzUxYU8ybHJT?=
 =?utf-8?B?ZG5OUVZPU3JvenF6UHBIcmNaSVV6SElsT2NyKzdJdE5Ka1ZSUk96Si94aGNk?=
 =?utf-8?B?TTE3aVFSakd5V2FNbWUrRFAxM0R5QkVtTExhajVEYVFEUEhpOGUyN0w4b01F?=
 =?utf-8?B?Q1poU0pNdzJKTXdvRnB1cGwxVGJFWlFkQjZTaEQ5YkJoZlRzdG5nWm04T2V5?=
 =?utf-8?B?dU1lR1RWb3R1dGtVaTVmQXRPdFdmTENCUW45ajVKQTZGTzY2VnJ6Z0ticEkz?=
 =?utf-8?B?NkJmeHR1OHBpV2dibHdLMzdYWS9CWDQ1MXoydzExLzhuTnNNeU5FSk5PWDVz?=
 =?utf-8?B?VDhLRnpCK1Z2QTdmeHVOYWJjdlY3ZVZlQ0ljUjV0Ym9wUXFyMzBzVWVpZ3FU?=
 =?utf-8?B?Y25QakVDS3VrRkVnMXZ0eStMbFFUZDJsb3FtclQ2OWs1SFdkVU9vU2hJYlFs?=
 =?utf-8?B?eUJSUCtWbEx6R1dFV3ozM3BxQ1d0VEtMaDZBMDdKK2hLcXdxTk5CVFJXSGV3?=
 =?utf-8?B?QWFOeWRQYVV5MFRudFROdmZoSStWR3Eyb0IxN0dqN0IwcnJyZlh6SWdtalpS?=
 =?utf-8?B?NUg2ZytKRFJqRlVsTkl0NVcxYldnUTQxOXFxL1dPS1p5Z1BoTy93Vy9JYVJH?=
 =?utf-8?B?RDVTd3lUUXdZTWZPV09oam5CTWZJM1NKb0JvdXEvbDViUmFSRDJzSkh2czVN?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e0544-1b95-4179-97c7-08dcc6b75760
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 16:43:12.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDAQeaAZ3H8y8CgSbLhTNBpZx3798cHDmalpT5mQulYgUOl7Hsi6r9OxLCi65usTCDdIRqo7EZzMasUxaZo1BEPwWP4ZnCrMlo2z3BxcM+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10659
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

SGkgTGF1cmVudCBhbmQgVG9taSwNCg0KR2VudGxlIHBpbmcuIEFyZSB5b3UgaGFwcHkgd2l0aCB0
aGlzIHBhdGNoPw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDE4LCAyMDIzIDEwOjM5IEFNDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybTogcmNhci1kdTogRml4IG1lbW9yeSBsZWFrIGluIHJj
YXJfZHVfdnNwc19pbml0KCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaC4NCj4gDQo+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDEyOjI0OjI0UE0gKzAwMDAs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoZSByY2FyX2R1X3ZzcHNfaW5pdCgpIGRvZXNuJ3QgZnJl
ZSB0aGUgbnAgYWxsb2NhdGVkIGJ5DQo+ID4gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2Fy
Z3MoKSBmb3IgdGhlIG5vbi1lcnJvciBjYXNlLg0KPiA+DQo+ID4gRml4IG1lbW9yeSBsZWFrIGZv
ciB0aGUgbm9uLWVycm9yIGNhc2UuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgcmVwbGFjZSB0aGUg
bGFiZWwgJ2Vycm9yJy0+J2RvbmUnIGFzIGl0IGFwcGxpZXMgdG8NCj4gPiBub24tZXJyb3IgY2Fz
ZSBhcyB3ZWxsIGFuZCB1cGRhdGUgdGhlIGVycm9yIGNoZWNrIGNvbmRpdGlvbiBmb3INCj4gPiBy
Y2FyX2R1X3ZzcF9pbml0KCkgdG8gYXZvaWQgYnJlYWthZ2UgaW4gZnV0dXJlLCBpZiBpdCByZXR1
cm5zIHBvc2l0aXZlIHZhbHVlLg0KPiA+DQo+ID4gRml4ZXM6IDNlODEzNzRlMjAxNCAoImRybTog
cmNhci1kdTogU3VwcG9ydCBtdWx0aXBsZSBzb3VyY2VzIGZyb20gdGhlDQo+ID4gc2FtZSBWU1Ai
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+
ICAqIFJlcGxhY2VkIHRoZSBsYWJlbCAnZXJyb3InLT4nZG9uZScgYXMgaXQgYXBwbGllcyB0byBu
b24tZXJyb3IgY2FzZSBhcw0KPiA+ICAgIHdlbGwuDQo+ID4gICogVXBkYXRlIHRoZSBlcnJvciBj
aGVjayBjb25kaXRpb24gZm9yIHJjYXJfZHVfdnNwX2luaXQoKSB0byBhdm9pZA0KPiA+ICAgIGJy
ZWFrYWdlIGluIGZ1dHVyZSwgaWYgaXQgcmV0dXJucyBwb3NpdGl2ZSB2YWx1ZS4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgMTAg
KysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3Jj
YXItZHUvcmNhcl9kdV9rbXMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1k
dS9yY2FyX2R1X2ttcy5jDQo+ID4gaW5kZXggNzBkOGFkMDY1YmZhLi40YzhmZTgzZGQ2MTAgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2tt
cy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcmNhci1kdS9yY2FyX2R1X2tt
cy5jDQo+ID4gQEAgLTcwNSw3ICs3MDUsNyBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0
KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkNCj4gPiAgCQlyZXQgPSBvZl9wYXJzZV9waGFu
ZGxlX3dpdGhfZml4ZWRfYXJncyhucCwgdnNwc19wcm9wX25hbWUsDQo+ID4gIAkJCQkJCSAgICAg
ICBjZWxscywgaSwgJmFyZ3MpOw0KPiA+ICAJCWlmIChyZXQgPCAwKQ0KPiA+IC0JCQlnb3RvIGVy
cm9yOw0KPiA+ICsJCQlnb3RvIGRvbmU7DQo+ID4NCj4gPiAgCQkvKg0KPiA+ICAJCSAqIEFkZCB0
aGUgVlNQIHRvIHRoZSBsaXN0IG9yIHVwZGF0ZSB0aGUgY29ycmVzcG9uZGluZyBleGlzdGluZyBA
QA0KPiA+IC03NDMsMTMgKzc0MywxMSBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0
cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkNCj4gPiAgCQl2c3AtPmRldiA9IHJjZHU7DQo+ID4N
Cj4gPiAgCQlyZXQgPSByY2FyX2R1X3ZzcF9pbml0KHZzcCwgdnNwc1tpXS5ucCwgdnNwc1tpXS5j
cnRjc19tYXNrKTsNCj4gPiAtCQlpZiAocmV0IDwgMCkNCj4gPiAtCQkJZ290byBlcnJvcjsNCj4g
PiArCQlpZiAocmV0KQ0KPiA+ICsJCQlnb3RvIGRvbmU7DQo+ID4gIAl9DQo+ID4NCj4gPiAtCXJl
dHVybiAwOw0KPiA+IC0NCj4gPiAtZXJyb3I6DQo+ID4gK2RvbmU6DQo+ID4gIAlmb3IgKGkgPSAw
OyBpIDwgQVJSQVlfU0laRSh2c3BzKTsgKytpKQ0KPiA+ICAJCW9mX25vZGVfcHV0KHZzcHNbaV0u
bnApOw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
