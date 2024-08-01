Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D59449BC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEACC10E901;
	Thu,  1 Aug 2024 10:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hof8fSbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C206810E901
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHHatGjqf7SYEA3RjPYd9huJSpIjnis4zosfmdieGDDCRvmH9kggeacCwTkOnsGK3PhXbyb6xmGUlDdiZn6/vrs0mY/8/wM09gGzQKReDcAtUeLNvP8vb1FAkLzjshXYbZJOabGWsicLycGE0vBhC4glw814b1WQ57MDswmPCccprdt22xQ4ffaC2Coj/4gu7CzkEKPCNlXSjwf24n4WvmbxnsWqCIn+so1rpdO5MnODlmhAdyhIeopDx2bv6CfNvtC6bLcgcW4HhEpHHMk/pGOOIVi7IDGS6o4HNpe6K02TCMrhxliOkBDdkeE02bZip8D5FVmRXnVNTk3fDAZJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDUUGbIjsuoZF0YllB/O5xt25Y/TTAh8FXRIIXFXsMo=;
 b=n6+X8ovqj5wJBZc+icP6+UOsa/Tt1ub6CQG5mIDKyLTtCsezRVVbGhnMUM3ai92LdmMtkEi3nV0tAUbxkjk9+cdPUo7tNepNDXpFpUc9yg4aGNmvclP1aZ/Y5Q7iDNCk3njwmqkQH0cq7eeTkY1E/kvsV5sN1EAP3PZJMI/WY1Gu2zZxpil4Y+pLp0HQ42U8p+BKkmn4tVbtbu+h6TvCX91tdQBofElBQTHNaNf6LDxjRjnVnfHL97vcqLdwKFhg844NEI+5QTJDr1FfS4vDOa9O84ButmOkT12ALnslnlqnV9kWlokPxiT8wtFwhUJ9WXK+y9cO4dIg6EvpW93Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDUUGbIjsuoZF0YllB/O5xt25Y/TTAh8FXRIIXFXsMo=;
 b=hof8fSbKu3MVPDY9QlLmYEmCGZ54d0GDLAMYbjWhuuD0ia9mMdSY5/UpuuaebB+E/kSdNFn35xKuQtfrP85n+YfULDQ0omz0QqJraz6o0Nw2NbVlWTsscV9OiwgudW7r2yRV4Nrje38gbeXI7gOZxblArH2tkEJvFbweWvYfJYE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5673.jpnprd01.prod.outlook.com (2603:1096:404:8052::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 10:53:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:53:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH v2 3/9] dt-bindings: display: renesas, rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHa0gc3Rxf0mOYA4EWS/UT7ybmnsLIJ2cAAgAOqhhCAA3ftgIABUT+g
Date: Thu, 1 Aug 2024 10:53:26 +0000
Message-ID: <TY3PR01MB113465B73427023AB9DFC45DC86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
 <20240727004958.GF300@pendragon.ideasonboard.com>
 <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240731134705.GD12477@pendragon.ideasonboard.com>
In-Reply-To: <20240731134705.GD12477@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5673:EE_
x-ms-office365-filtering-correlation-id: 0028ec8f-b707-4cc7-2154-08dcb2182c14
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Mm93bVRXNWVJZ2JQeXBaUW5YK2lUSG9QL1pIdHNxUFBZZzlHT0sxYkFJMFNM?=
 =?utf-8?B?MVdxV2xiZFhjK2hDQzJQakw0SGk1TVR0NzgyM1ZybWY3U0M2SkJISkpLM2xL?=
 =?utf-8?B?WXdCemk4dlQ5eEg4a1J6YllyM005SWlFUUNDc21uQUpsUkJNdUl1L1JBSkFN?=
 =?utf-8?B?SW5xNHpBdGxhSmZmSTRiODk3ODltR1J2L3ljejl2bDdxU1BHcCt4N3d0dXhM?=
 =?utf-8?B?Ymp0ajlDb0NtYW05MFNLUzQrR2JzNXdDbXdld0NaaDlPRWFBWFFlU1JzOFFq?=
 =?utf-8?B?WHJTdVNqa1VhR3ZaRGMraTdVWmFhaWZoYlVpTjJGM2hOVnJBYk1JaXNUcUlw?=
 =?utf-8?B?d0pGSm8rTStSV0tzbDY4a2pvUGxYdWZPeElnK093bmxadFAwWXdPdC9XbVo0?=
 =?utf-8?B?SXFwT3ZNNm9WY0VreDdMNU9rQVQvN2JDT2phV3o3M3VLOUFiVGxjUnA1enVC?=
 =?utf-8?B?T2xEUi9rQlV2bVlBZkVYRllNK3JIcFRFYXpMcTNjUTNJN3FzRTJqZVlqa2FY?=
 =?utf-8?B?Nk1mNVV4N3dpSjkvREpicXk2NUVDQWRNR0o4V1RpM2ZIeE04amdKRjdOczZT?=
 =?utf-8?B?dlFWZ2J5akx1RzhFZDZFblcrOE5xS1hOd2tSL3diQnV5OVVGM2x0eXE2alZI?=
 =?utf-8?B?dmRCNFAzUTBHcXd3cnhZV1VBUHNTOXdHUkdseTBzOW4rM0k2MWpsSUVucFo3?=
 =?utf-8?B?b1M0SnZIemlDM3hKYzRvYU14alQyM1dWbUhsTTRKaXV5MExqVm00TmlpTS8x?=
 =?utf-8?B?MkEvZzBvdGxtdFpWdVZiMjAycnZ5WDNrRVlBUGtIc1ZVc0xURVFMVFVMTmRT?=
 =?utf-8?B?cVUvOUdoZEkvWE5aNndxcjd3clMyVmh1ampoTmFJUXVjSForS2FYMkJuRjF3?=
 =?utf-8?B?dVg3NDhhRzBDemh0dFpSN2lUVVZBbWxmcDJPODNhd3hEVVI0WHVROW1OdSts?=
 =?utf-8?B?WUsxMjliSWZQQmhFVmV0b0llRUlEdHFKb29YcGFFY0RRcDRZT1pseXRyNjBz?=
 =?utf-8?B?Qkt1dUoxQUVQaUsrQmx5WDFhK0pBdmVpL3ZLTXI5WmpsNmJXdzh5bGZFSXZ4?=
 =?utf-8?B?Z2xwb2hraEoyK2U4ak1KRzNzVFdYVzg1WHI1WE1XY2NzQVZ5c2pqZHRzUVJr?=
 =?utf-8?B?ZUplVnFsUi9XaE1pWkFuQXVPWnZrSjNHODNKa2ZSRHJVek1VdTVSdHFoY3ZV?=
 =?utf-8?B?d1JOaDF0U1FoYUNZZ3NIekpSUGtYa0M1TXM5dnVhV1M5aDE2RTJsSFY5ZGFQ?=
 =?utf-8?B?Mm9zWmlCcE1DK0FBNVJpM21Ib1RudDA3UHEyZnNQVS9DL3FObGNCamg5bjNw?=
 =?utf-8?B?ZDJBYng4aFd1bHk1SlNDU2NFdFM2d1RMYUxodWVzTHo4cWExRGhXVW9acXoy?=
 =?utf-8?B?Yzh2NlpMVjY5bWhpWFpNMGxtSWczb0g4cFd6VnZaQkpyMkh3YXJUU1ZsanEy?=
 =?utf-8?B?V0lIRzl5aHAwdCtJaW9PUDdwT3dTak5UbmI5dGpBREhramM5TXVJT2piRDM0?=
 =?utf-8?B?UFJEaFhaZ0l4cGxMWFR2V0Z5YWRHZlF3cSthaEFsZ2VuckJEL2xQTk5Oc0hi?=
 =?utf-8?B?WndBTkhTZmtuMWgvMzQzVjVrQnJpMkdvZ1czcTZuOWlEaGl0R3p3Q2lGZWxi?=
 =?utf-8?B?a21udmxHMGZoa0Y0cHkvNW1Pc3lYN1NKb0JQVTU0WlhaeFRJaEZNSGtjeXFM?=
 =?utf-8?B?aHluaXhpdUZHZXB2ODRHaGtoRVlWbURpcm1JT1k5K3VEY1RFTHAxSWlHelc2?=
 =?utf-8?B?SjJDVUJsWDNiRG96MWtvcmRPRlN4V3h6MHo1STVPeWhMSm95NFMxSWpyelR1?=
 =?utf-8?Q?IbSCeRALDyRyuK5wQ4fyL1YnZD29/NnPlriKs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWRXaEs4M2RvNSs0MnNFUmdPTlZRREpoVHBhb2tRK2dXSUFjVUpUOHhoWjZa?=
 =?utf-8?B?RDlDc3pKaUlhNzVWTGZjZFlNWjdtaysrdlcrNEx3YXBSSCtoRXpwckRLei9n?=
 =?utf-8?B?ZWtKbndBeWV1VkE0cVVZV1RGY0RjYnczYXpBei9JWlVnQy9WZ1k1cFA5dHo4?=
 =?utf-8?B?WlZZa0xZcnlvNnlmdllKMUZSeWhqZUFQMVE2cGdUbkVIUUZwY2ZBN0JOeHJS?=
 =?utf-8?B?UUF5bmFQUHFNcmJZUGM3djlvd3NuY0luUE5WNnhVb0l2ejYwOWVlVHJSazdI?=
 =?utf-8?B?dUhyRDF4SkFWaHBxdTVEeUhzTE4yWnBEU2NSaVA3ajlOcEVOZUliRGxja09i?=
 =?utf-8?B?bGM1RXZQZnF5ZHBkdFYyeGtEM3N5cDZwVmVyWmtNMklKZWFpbWN4WTNFWDNT?=
 =?utf-8?B?TW81ekRubldiUUpORzZ5UjZHaU95enlJTjRkRE5CdEd6T0NLb2Y0bVFENkxq?=
 =?utf-8?B?ZC9Kb3N1VUlMTXJ3Nm5jZmRjL09jWmllb0dWUWJBUDdza3k5aG1WOXJXTnJD?=
 =?utf-8?B?d1pNQXU0MjR6T2E2bmxpdkZQV29QMmRzekdCRkJSc3kyOENmWk1wZWFBSmJW?=
 =?utf-8?B?dlRHdmRnQXFYV1BjTHRERlVYelYyOVU0S0N0TURKY25lVFhUOEVjMUgwU2o2?=
 =?utf-8?B?SmhLZU9DVEdNZFNXbnF5eFhjYjBPcENMMFZsZ2phWWNPUm1qanFJQTVhaWRr?=
 =?utf-8?B?WHpKeGNFbCtRNTJxRHBhU0ZkSmlJNVQxNysvRUVla2R5clNSNWVwa2kvTDFH?=
 =?utf-8?B?aHJVZ0RWN2xoQVVSVkVFMTErTDBqaXl2MDZtOFJkOHNQOFF3czRhRWpwVDFw?=
 =?utf-8?B?YldqV24zMVoydUN6ckVOQnIyNDVTdC82TUQxZE1VdDd1R3hmMHRRWVo2aHQ4?=
 =?utf-8?B?YkMxUWZTNEpkeHhjRHovQzhaNzFpcWhGVmdJRFZsUzU0Qk5lV0diQjh2eGZl?=
 =?utf-8?B?SlNyRU9JUnJBVTYyUzZ2eGFLbEx0Q1ByaUtHaTdaTFVOTndFSGVheitaUWJo?=
 =?utf-8?B?bTZIem5JYTlOQ3RyWkpQNmtZSzZSQTluMW16cDNPeTBRUFNWVFVrWkU2Y0d5?=
 =?utf-8?B?bHgxNlFJV2FZcmg1blNuRGFlK01DalduYUg4ZnZQZ3VyaFZYV29RZzlrYnJH?=
 =?utf-8?B?WXU1czU0VEVpUmg5Uk5mMEpNbTFaNXpWaGU4TlZKN25sMlhBVnk1ckpPMDBm?=
 =?utf-8?B?Y2I3bW5CN3o0Rzc1TktBN2JUdjdKaXN4blFxbXZkcDdsV2k3QXhPWkFOM1dV?=
 =?utf-8?B?azROem9jeFdrd0J4THA4a1VDWHdjRWsvY1BpVGh4akVtNTlqdWZnL0t5eEdN?=
 =?utf-8?B?VnA3VFBSSng4RlZWNGt1RHUySUswbXNhR0NYejh3K2l4YzBFWlFCTlhwWkpX?=
 =?utf-8?B?Q2tJZTU3Nld0cE5yUUhHS2hRL1E2dERoVU01cnlYbU9obFJMRDB5NU42Wmp6?=
 =?utf-8?B?aDc3WGdXVkxBdmhsQXlwM0dxZnhZWmN4UE54VzhHNmp1SmNCbHVLZEdyYVd2?=
 =?utf-8?B?ZjlwMXR0WVIvWGVzOVY2aHBuVVl3ZXpaVnowNmd3MWdaZnk2WW5pMEsyVkZv?=
 =?utf-8?B?Q2k4TmNSL25ESE5CZ3dQSFZpZWpMRml2anhXckk0b2tTb0N0RSsrQlc1NUpB?=
 =?utf-8?B?Y3JjZnNTaVRLcU50QkdXekcrb2JpVjhDVktxVWk2ZEZSN3JDV3ZrTEVrYk1o?=
 =?utf-8?B?SGFQd0p6RHp0VllnM1FIQnQ5NWRCMnorZGtwTkFvRFFERWx4R05HNWxzNEVa?=
 =?utf-8?B?NG42Zk9MRUdqN3RIUkxqUmNQOUZmRzhmT0o0eC8rdG03RytWVmlVMlNUMUFI?=
 =?utf-8?B?TTVaeUVoUDNlUGQrTUZYODN6b1kxK3VRdFhUL2RkRzNXVmJycDlIcU1Ydkhv?=
 =?utf-8?B?YU5VMDJZbWJVTW1uVzRCZ1pibjdkMVZXamhRcjhKeU1SRHA2aVBORHl3ei9i?=
 =?utf-8?B?Z1EyUmhEQ3RwUlhEU3JGeEJrNFdsNXJsNDhuRkRQV01hVi8rSFhtb2RONTMw?=
 =?utf-8?B?VVJSZ2dVaG9NTmNNMmlVTXFYVHZaelRvYkRST2FCWndYNjlJL3E2STV0MUU0?=
 =?utf-8?B?aldnQjhoYiszZFUvQzZwdDdiWVJDQWd2Ym55c0pXTTVtekVlc3hTckJXREVD?=
 =?utf-8?Q?HU+g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0028ec8f-b707-4cc7-2154-08dcb2182c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 10:53:26.7956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32Wp9yH0T/jLAN0AWmQMYPQss08Pt/3JRi73Noz08DVpZBLNCUa1PQ0ZFVtq9wnNSCIGbsckIO5RKh3mbH8u+15YV3jb7QqRm4Bn+WhQqEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5673
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

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMzEs
IDIwMjQgMjo0NyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvOV0gZHQtYmluZGluZ3M6
IGRpc3BsYXk6IHJlbmVzYXMscnpnMmwtZHU6IERvY3VtZW50IFJaL0cyVUwgRFUgYmluZGluZ3MN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEp1bCAyOSwgMjAyNCBhdCAwOTowNTo1OUFN
ICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBPbiBTYXR1cmRheSwgSnVseSAyNywgMjAyNCAx
OjUwIEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gT24gVHVlLCBKdWwgMDksIDIw
MjQgYXQgMDI6NTE6NDFQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+IERvY3VtZW50
IERVIGZvdW5kIGluIFJaL0cyVUwgU29DLiBUaGUgRFUgYmxvY2sgaXMgaWRlbnRpY2FsIHRvDQo+
ID4gPiA+IFJaL0cyTCBTb0MsIGJ1dCBoYXMgb25seSBEUEkgaW50ZXJmYWNlLg0KPiA+ID4gPg0K
PiA+ID4gPiBXaGlsZSBhdCBpdCwgYWRkIG1pc3NpbmcgcmVxdWlyZWQgcHJvcGVydHkgcG9ydEAx
IGZvciBSWi9HMkwgYW5kDQo+ID4gPiA+IFJaL1YyTCBTb0NzLiBDdXJyZW50bHkgdGhlcmUgaXMg
bm8gdXNlciBmb3IgdGhlIERQSSBpbnRlcmZhY2UgYW5kDQo+ID4gPiA+IGhlbmNlIHRoZXJlIHdv
bid0IGJlIGFueSBBQkkgYnJlYWthZ2UgZm9yIGFkZGluZyBwb3J0QDEgYXMNCj4gPiA+ID4gcmVx
dWlyZWQgcHJvcGVydHkgZm9yIFJaL0cyTCBhbmQgUlovVjJMIFNvQ3MuDQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4N
Cj4gPiA+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2MS0+djI6DQo+ID4gPiA+ICAqIFVwZGF0ZWQgY29t
bWl0IGRlc2NyaXB0aW9uIHJlbGF0ZWQgdG8gbm9uIEFCSSBicmVha2FnZS4NCj4gPiA+ID4gICog
QWRkZWQgQWNrIGZyb20gQ29ub3IuDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sICAgIHwgMzIgKysrKysrKysrKysrKysrKyst
LQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwNCj4gPiA+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6
ZzJsLWR1LnlhbWwNCj4gPiA+ID4gaW5kZXggMDhlNWI5NDc4MDUxLi5jMGZlYzI4MmZhNDUgMTAw
NjQ0DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnkNCj4g
PiA+ID4gKysrIGFtbA0KPiA+ID4gPiBAQCAtMTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+
ID4gPiAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiAgICAgIG9uZU9mOg0KPiA+ID4gPiAgICAgICAg
LSBlbnVtOg0KPiA+ID4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDN1LWR1ICMgUlov
RzJVTA0KPiA+ID4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtZHUgIyBSWi9HMntM
LExDfQ0KPiA+ID4gPiAgICAgICAgLSBpdGVtczoNCj4gPiA+ID4gICAgICAgICAgICAtIGVudW06
DQo+ID4gPiA+IEBAIC02MCw5ICs2MSw2IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgICAg
ICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiA+ID4gPiAgICAg
ICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPiA+DQo+ID4gPiA+IC0gICAg
cmVxdWlyZWQ6DQo+ID4gPiA+IC0gICAgICAtIHBvcnRAMA0KPiA+ID4gPiAtDQo+ID4gPiA+ICAg
ICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPg0KPiA+ID4gPiAgICByZW5l
c2FzLHZzcHM6DQo+ID4gPiA+IEBAIC04OCw2ICs4NiwzNCBAQCByZXF1aXJlZDoNCj4gPiA+ID4N
Cj4gPiA+ID4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ID4gPg0KPiA+ID4gPiAr
YWxsT2Y6DQo+ID4gPiA+ICsgIC0gaWY6DQo+ID4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+
ID4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiArICAgICAgICAgIGNvbnRhaW5zOg0K
PiA+ID4gPiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQzdS1kdQ0KPiA+ID4g
PiArICAgIHRoZW46DQo+ID4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAg
ICBwb3J0czoNCj4gPiA+ID4gKyAgICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAg
ICAgICAgcG9ydEAwOiBmYWxzZQ0KPiA+ID4gPiArICAgICAgICAgICAgcG9ydEAxOg0KPiA+ID4g
PiArICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFBJDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
ICAgICAgICByZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAgICAgICAgIC0gcG9ydEAxDQo+ID4gPg0K
PiA+ID4gV2h5IGRvIHlvdSB1c2UgcG9ydEAxIGZvciB0aGUgRFBJIG91dHB1dCBoZXJlLCBhbmQg
bm90IHBvcnRAMCA/DQo+ID4NCj4gPiBDdXJyZW50bHkgdGhlIG91dHB1dCBpcyBiYXNlZCBvbiBw
b3J0IG51bWJlciBhbmQgcG9ydCA9IDEgY29ycmVzcG9uZHMgdG8gRFBJLiBTZWUgWzFdLg0KPiA+
DQo+ID4gRm9yIGNvbnNpc3RlbmN5LCBJIGRvY3VtZW50ZWQgYmluZGluZ3MgZm9yIFJaL0cyTCBm
YW1pbHkgRFUncyBzaW1pbGFyIHRvIFJaL0cye0gsTSxOLEV9IERVIFsyXS4NCj4gPg0KPiA+IFNv
IHBsZWFzZSBsZXQgbWUga25vdywgYXJlIHlvdSBvayB3aXRoIHRoaXM/DQo+IA0KPiBJIHdvbid0
IGluc2lzdCBzdHJvbmdseSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCB1c2luZyB0aGUgcG9ydCBu
dW1iZXIgdG8gaW5kaWNhdGUgdGhlIG91dHB1dCB0eXBlIGlzDQo+IHRoZSBiZXN0IGlkZWEuIElu
IHRoZSBSLUNhciBEVSBkcml2ZXIgYXQgbGVhc3QsIHRoYXQgd291bGRuJ3QgaGF2ZSBzY2FsZWQu
IFdlIGhhdmUgbXVsdGlwbGUgb3V0cHV0cyBvZg0KPiB0aGUgc2FtZSB0eXBlIG9uIHNvbWUgU29D
cy4gRnVydGhlbW9yZSwgdGhlIHNhbWUgRFUgaGFyZHdhcmUgY2hhbm5lbCBudW1iZXIgKGkuZS4N
Cj4gdGhlIG9mZnNldCBvZiB0aGUgcmVnaXN0ZXJzIHNwZWNpZmljIHRvIHRoYXQgY2hhbm5lbCBp
biB0aGUgRFUgcmVnaXN0ZXINCj4gc3BhY2UpIGlzIG5vdCB0aGUgc2FtZSBhY3Jvc3MgU29DcyBm
b3IgdGhlIHNhbWUgb3V0cHV0IHR5cGUuIEkgcmVjb21tZW5kIG51bWJlcmluZyB0aGUgcG9ydHMg
YmFzZWQgb24NCj4gdGhlIGhhcmR3YXJlIG51bWJlciBvZiB0aGUgb3V0cHV0ICh0aGUgZXhhY3Qg
bWVhbmluZyBvZiB0aGlzIGlzIHNwZWNpZmljIHRvIHlvdXIgZGV2aWNlLCBJIGhhdmVuJ3QNCj4g
Y2hlY2tlZCB3aGF0IGl0IG1lYW5zIGZvciBSWi9HMkwpLCBub3Qgb24gdGhlIG91dHB1dCB0eXBl
Lg0KDQpPSywgd2lsbCB1cGRhdGUgdGhlIGJpbmRpbmdzIHRvIHVzZSBwb3J0IGZvciBSWi9HMlVM
IGFuZCBQb3J0cyBmb3IgUlove0cyTCwgVjJMfSBhcyBpdCBoYXMgbXVsdGlwbGUgRFUgb3V0cHV0
cy4NCkZyb20gdGhlIGRyaXZlciB3aWxsIHJlbW92ZSB1c2luZyBwb3J0IG51bWJlciB0byBpbmRp
Y2F0ZSB0aGUgb3V0cHV0IHR5cGUuDQoNCi0gICAgICAgICAgICAgICAgICAgICAgIGlmIChyY2R1
LT5pbmZvLT5yb3V0ZXNbaV0ucG9ydCA9PSBlcC5wb3J0KSB7DQotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG91dHB1dCA9IGk7DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAoaSA9
PSByY2R1LT5pbmZvLT5yb3V0ZXNbaV0uZHVfb3V0cHV0KSB7DQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG91dHB1dCA9IHJjZHUtPmluZm8tPnJvdXRlc1tpXS5kdV9vdXRwdXQ7DQpD
aGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuMTAuMi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL3JlbmVzYQ0KPiA+IHMvcnot
ZHUvcnpnMmxfZHVfa21zLmMjTDE4Nw0KPiA+DQo+ID4gWzJdDQo+ID4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cg0K
PiA+IGVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
ZHUueWFtbD9oPW5leHQtMjANCj4gPiAyNDA3MjkjbjU0Ng0KPiA+DQo+ID4gPiA+ICsgICAgZWxz
ZToNCj4gPiA+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsgICAgICAgIHBvcnRzOg0K
PiA+ID4gPiArICAgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gPiA+ICsgICAgICAgICAgICBwb3J0
QDA6DQo+ID4gPiA+ICsgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBEU0kNCj4gPiA+ID4gKyAg
ICAgICAgICAgIHBvcnRAMToNCj4gPiA+ID4gKyAgICAgICAgICAgICAgZGVzY3JpcHRpb246IERQ
SQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgcmVxdWlyZWQ6DQo+ID4gPiA+ICsgICAg
ICAgICAgICAtIHBvcnRAMA0KPiA+ID4gPiArICAgICAgICAgICAgLSBwb3J0QDENCj4gPiA+DQo+
ID4gPiBZb3UncmUgbWlzc2luZyBhIGJsYW5rIGxpbmUgaGVyZS4NCj4gPg0KPiA+IE9LLCB3aWxs
IGZpeCB0aGlzJw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQN
Cg==
