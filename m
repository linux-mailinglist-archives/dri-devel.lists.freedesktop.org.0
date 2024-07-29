Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166793F0D9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC32110E370;
	Mon, 29 Jul 2024 09:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="efIc7cd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEE110E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGPCr2yTzR5IifsYkhtXb1Jhqq+uTO22iV7B7ky49l6VLxk3YhwGxEsek/WWO7fizseJwSZxR4daPTdOLkCpPG88XoOM+V9xY38iwTyZ9MThLKuyzI0HKuf+GY38G7nWM98XWQkFNrV3pRZ7HkXC6f7P6o7GNNyCPCF3x4EPk8U91dqxdMJiV3Sy37KiV/i5n/Ky9z8gCls7sbKwWkIOh4v8LsYwB2OKlkt7uGrxV4NfmnYj41xCMt8+4NZDKDxqm4/WXvdxYlduDivbYOfWrdIo6kDu+Aws7IU340un5oOgjIBlrNx0QA2URuxDN8lee9S2M3b7kHbz1oq9dmLlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc93zYDCwkILh6+nR9XKEipV7g9fPBlW9W/wX6YS4JE=;
 b=PuWo9H/17FLfp902j3rtz4tzyaVg82X8O80kSxtxz1RqDUIV13DSOyavN09dOvpCIIS3JT118uBZ6BC8U7xvD9os3znZ3CDIeG/rQ7EPghoJmJ7ocmyKRsYkMYV15xUy6Gow0mBIApn7aZVWM8Azzqc1483cPfSYpy53BpDUiZ89UkKWzcS1glEhf8YlMEIY+OtZLvzPc9p1AAoBN0u3AFIXGe5n7vOVqkqNH4/GcrFfpNsnWsY2u0EfM2wllVtBEtom2WnsciHZz4dSSoV9eSlkvPyoymOfIXBqFkkL89U6mRdJJMkEDf15XV7ovYZsWJgU3OdMr+XU5OApfVRSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc93zYDCwkILh6+nR9XKEipV7g9fPBlW9W/wX6YS4JE=;
 b=efIc7cd0iEgrdI9aJQTFtck3wozTuc4AuDDRvEQC8mrzoD2poDZrmK36EIApatNhyCA8rIWbRj+71zOeYKN19JYp1DpQXifMdT9CFLNFVKIPD1ceKt1uZKEU3D3CWVxZtQPkcJSh6SdVRnpcG72XVtqzQ9zynZXSUVMy7dfM7PU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11848.jpnprd01.prod.outlook.com (2603:1096:400:370::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 09:21:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:21:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2 6/9] arm64: dts: renesas: r9a07g043u: Add vspd node
Thread-Topic: [PATCH v2 6/9] arm64: dts: renesas: r9a07g043u: Add vspd node
Thread-Index: AQHa0gdDtApBFuoZBkGBtZCUr6Nc4rIJ3rOAgAOuT+A=
Date: Mon, 29 Jul 2024 09:21:14 +0000
Message-ID: <TY3PR01MB1134615919E6B532C4FAE5A0986B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-7-biju.das.jz@bp.renesas.com>
 <20240727010741.GH300@pendragon.ideasonboard.com>
In-Reply-To: <20240727010741.GH300@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11848:EE_
x-ms-office365-filtering-correlation-id: 5390f6ba-3b0a-4d23-503a-08dcafafcb84
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MWFnbVM2NVhtakxEVngxNE9zaFRTTnVMUkRTNjlBQzF4MjQzaVRIaTBDSkhR?=
 =?utf-8?B?SmxubXdxTzBMVFVqZ1R5RTl5WkdOaWtyWmJuQzJGZzdRdEVtbjJ6R1JxSWFU?=
 =?utf-8?B?bGFScUlwV1lqUmIzOXBkUGxqa2xWWVNxdjkyaUc4Wm90K2RFTkVtZUsvNWl5?=
 =?utf-8?B?d3prMGJoR1RySlhxR28wUDNEVEhBUzI2TklpdWpxYzZ1WkVjZU4rWXhnamR5?=
 =?utf-8?B?ak5QVGdYY1F4NGFwY3pIYmtmWTl2VEhDWlp5MXVwMjZxUld1MUwxZndVNStW?=
 =?utf-8?B?d1RuRVZBblJ1RGZ6M3dsRnptR3ZSRGhYOXdUbDE2MXkxOHFINFFYU2JscENk?=
 =?utf-8?B?cXNPQTA4WjZUa3dMa1NKTDU0NmJGMW5jaFQzSm5NaG9IYUc2NVF2MFRVQytO?=
 =?utf-8?B?NWRrN0ZiK21zVUhUUmwyU21UVTd2Y3BKbXhzeGgvV3NCVnBYRitTZnRMbEht?=
 =?utf-8?B?OENnMG9OMHBkeFlUVEQzaWFTSDAwalZKODZ1S3JFREtLVDZXN3NWd3EyL3VL?=
 =?utf-8?B?b2ZxaUpZakFLWmxqRVB5djN4VjVRcWl2N0g3OFozcGgyYk4velNxZjJ2MmNs?=
 =?utf-8?B?VlVQQmRqMEpJTnJwaE9idDlMekxxZUlwVkpqdm1rUEdENTcyMlFhQ1l6R1JS?=
 =?utf-8?B?L0xmaGdYQ3J2RjFZeUtGMUloMHhjdHNVdVBmYVlRaGt5cmk3ZlZCMFZUS0J0?=
 =?utf-8?B?RTh5andFcTQzZnNxTnN6SFhrMWlwa00rOUhNTUxmK1U4RnQ0Uzc4TGxuekFk?=
 =?utf-8?B?Uzg4VVlRb2FOQ2pIQnU2TFhibm5PeW9SMG56YlU5SjF0TW01SmI4Zm5udFI3?=
 =?utf-8?B?cnVWWnRNLzg0ZUZMQUxOUlVFNGVaRVl3U1lpWVR0cFNGSzV6eGphbUpqMy9S?=
 =?utf-8?B?allnTUJKZ1ZYYTQvR1phb0FNQnlneWh4dERISHJ1MTNkM05hSXZyNG9MWFZW?=
 =?utf-8?B?V21ZU2xNbHNxNEhJU3Zua3hWd05TeFhrcTNXYjhZWHphVFlZSzR2aGdRTHZG?=
 =?utf-8?B?MXVlQTN0VHpYSE43NWNpSEpKMzZjRVk1RDVMd0plaVMwWWp4YVByNXZuNVRV?=
 =?utf-8?B?ZlV2UGd5SWp3bFp6eTdyT2ZLMDFpMmhvSllRcE9hTnhNb0gxM041THU5emxs?=
 =?utf-8?B?OGF6WmQ3Rmw4ZlNiSzhVTlFUeGVacE5SZEpOSW9WeHlDTjVTQlNwanRCZ3B0?=
 =?utf-8?B?Y1BBblZVTzl6N2J5aTZLTWJyVXBYYkxyRjNyczRHQjBCelU3N3ZGTmk4N3Jo?=
 =?utf-8?B?RTVVMC9MNm5JUjFvQkd2KzlTc3RsOXJJTmdiNVZDTkxEMEZTaVliWERkSFJt?=
 =?utf-8?B?UlpxK2p5Y1VMaDdIS0tCOWpQRWljQWpRYXNISmMxVWlFZXdROUw3c01VMVZ3?=
 =?utf-8?B?dXk3QnRNZG91em1TbUEvdWl0Tm9ocmpEVUt1K0lTalhzS0VINklWQUpMUTg0?=
 =?utf-8?B?MnB0THBRVEI3bEFQaGhFQ084bEhrZnBTL0QyYjZqRFowcTE3QTIyS05GN1pC?=
 =?utf-8?B?YXp3cmVrVjNQZy9aWnFzRmZmZ2Uvazg5RC84UW11Q3BpUDAvemVqYis0ZGp3?=
 =?utf-8?B?TU0wTWFiNW9aMURMa3dDbzYxdzE4YURkVENiaEhFRGVQOHpmWllNOUlrQWdj?=
 =?utf-8?B?dFozQS8xUnorN3ZZN3NsdHZ3VWdjZlVnbnp3eHZhK2srNWJCQ0lGQUlpT2V5?=
 =?utf-8?B?NGsza2pFb01lRzhtYnpWdkxtOGI3d3VQV1BZOERjLytxSytHSUQySTNEblpp?=
 =?utf-8?B?N3pFelh5eHdCUnp1MElTaWRCU0dNdTVsbVBpeHZncnd5aTdBeUlVUVV1Unpt?=
 =?utf-8?B?RjBCQVJQVFhKK3NRcmVtblU5Y2YzNnVqdkpsZEp5SUZURDZxYWZlY2V2dmhT?=
 =?utf-8?B?NmZWcWxQWDFmeGJXSld6KzRnY25mTzUzVU04UVN3M1NjRnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm52aDlVeGhoZjNHQWVxbDN4cDErbTJiZTFGRExCdHhaU0RnOElCaFFDL05Y?=
 =?utf-8?B?bGcvbHdmeFVYNmNSbUJaeFliZWpzeWJ6VUlpdkNtN1l6NlFZelRJRDFvRmth?=
 =?utf-8?B?Wk9CYVB0UTNHNVJLY0VNclIxQnFzZDFvVjBvMWo0eFlrd3A1V1Q1QXdBaWRu?=
 =?utf-8?B?OE02dnFvdHF6dDg0b3dXMDQ0Tm03L0o2N0hIVjhBK0dreTVNblVuMzA1UjhD?=
 =?utf-8?B?eEUwMEtCUCtyR0JwS2tvYU1GMkozY3FUTmtmQVRaOTdqTEdjNEhobURxVUVn?=
 =?utf-8?B?QVZSai95M01qSm05YVBjQmtHYTkwajBZUVVBY0REMlp3ZHIvMDZVZjlHcmd5?=
 =?utf-8?B?QStxcmJtVW81RmxLblZYeXY4dWdnNlpLWGZDS2tBaWFvSnF3RlVWdHJya0Q4?=
 =?utf-8?B?K21UZGJicThaZUxDMzNhcnFNdjJGN2x4VVVWRWNoYXYzT09UOUI5SUNrR2Zl?=
 =?utf-8?B?VUNtNWVudWJKbDFKQS9pSXZUQWNoTVZXRWFyUGM2UWxyTHh2a1puT0RnNExT?=
 =?utf-8?B?WU5mL0xpb1ZrUTBzOGxFczk3R2lmVUxpUHVzSzk4aHNQRklMcWJxczVxdmVz?=
 =?utf-8?B?eHdrS28yVXQ5emZGNWJqakkvS0ozZzc2NmZwa0xtV05xSGNaK1h1RzZiUVpk?=
 =?utf-8?B?aENEcGFPU0dDbC9ESWIrdmRGNEFHTkNaYVdyM0RaQUV1Yzc0SHRlVGpRYUl5?=
 =?utf-8?B?K0ZaVFYvcjF1U0UyME5Pd3BPSG5MUFk0bExsQlI0aWI4K29hOTRVa3hZOEF3?=
 =?utf-8?B?ZFExUXBKUVBaM2FGRndJLzFkUkl0QUx0Q3pTVGhoT1dNM2VQU2xaWWhybWtx?=
 =?utf-8?B?ZkpObW0xbGxyM29GMTJjdkRFRjJhNmpWRXBmTEpFSml6R2NDblJXZC9Vc1hC?=
 =?utf-8?B?VHAyZVk4alhldHVSSExXaU10WEZhdVFsdHN2NlVMNlJ0aE5Ib2N3ZzZKNnpn?=
 =?utf-8?B?cGJyZjJTTXp4VHcvWlR0aC9oNk9VV1E4WHhwMzF1cnlmdld0UnhXeW1LY2tM?=
 =?utf-8?B?TFZmMDUvQko5MmtjbXZaTEZnbHZ4aWlDOXJiY2lUU3pvK093YWtyNW01TTM1?=
 =?utf-8?B?SjBqcGd4eGlLaU1oWXlpWHhPMTZOVEJORFB2L2VNU251eWtQVGJKNXRMODMw?=
 =?utf-8?B?QjZ1TGpVcFBQY3BsT1UxTWJFTDg4SjNHRTgwMjlMV214cEloU3cvcG5XMXEw?=
 =?utf-8?B?L2dYZWczWHlObXZlRmdINFNCYWtrSDNuR2pWVEpSK2t2RFpwMHVucXlNbTgv?=
 =?utf-8?B?cmtoUXBEWHNxUUNPRG1mZDIrY29pM3VISzZHc0VYdEFmN3lWODV4UjNBREkw?=
 =?utf-8?B?cjN6ODlVM0xkb2laWkxDQTFnazkrNjJYRlVJMDh6c1JpdEczbGROUzBmdUxj?=
 =?utf-8?B?ZEU4bS9VeTR2Y01zanQ5Vm5HR2RlUTZBcDdubkZyNk5Od0M0U1NQSXVMTlBY?=
 =?utf-8?B?TGZzNG42b3JwU1Rabjh1TUsrc3luZHlqM2Ftd01wdDR1djdrRTlSdFZuTXo3?=
 =?utf-8?B?WStORjdVQlZUdEhsZTA5VnJITVRHMUFJbjRIVlR0NGxLNHgwSHJlM3E3ZFhW?=
 =?utf-8?B?cWRjZjFOdXpXSE9Nc1BwTTNrY2t0RWJZQ0ZNdlhHUVRWQzgrc1dJcUs5aU1k?=
 =?utf-8?B?S0orTU4yaTVncHpYMldBVml2Y0xTeUFYMnQxQjVDTGZNUllrQm9JYVNtS044?=
 =?utf-8?B?TUhNOXBJZTJHeUw2WmdocVFlMVZ0enR1dGxYRG1KaEVqaldvQWJoaVdDbXZ0?=
 =?utf-8?B?Smh3ck9jRlNhOUl3VnBUdGFGVlBCTElwQjhCUTNLcjRxY21memxOYmNZK2VV?=
 =?utf-8?B?d2dYdVk5N3dRSGV1amg5SFYwaG5SR0x6bzN3bDFSUDVVYjJYcnBoVTdtSmNN?=
 =?utf-8?B?WXFrSmRKMjZLYSt2WFA1VFRlNGk5a2p0S3ExYitkaGlObmRnOUU4U0J2NWRM?=
 =?utf-8?B?WUZzdGkzclRxc0hNMTdRenRzc3Z5QnpFOUZBdlBpSHFNZ1VqTzRYV1hKTER1?=
 =?utf-8?B?V1Z2SVk3c0FZZ2tQWDZ5OHl2Z1U4NE80OEVGOFRVTVk4aTY0MTl5K08rSVQz?=
 =?utf-8?B?dzY5c2JwMjQ1YVMxNHJpZzVNTVJMeHdteWZVNnorSzFXNlNhcHZac3JlNDJW?=
 =?utf-8?Q?gbIMdctm4Mo6Btn5QxbCZsit7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5390f6ba-3b0a-4d23-503a-08dcafafcb84
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 09:21:14.8131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0F7yFJc+nvG7VUivh6HR9qN0gORkee4vXSyPMpsQbji+deph/QD6aEmDaSW2y6MGpuRI/lct0RZdQt55af8QOu9zyzLtCLI3lZ54MRcW2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11848
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAyNywgMjAyNCAyOjA4
IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNi85XSBhcm02NDogZHRzOiByZW5lc2FzOiBy
OWEwN2cwNDN1OiBBZGQgdnNwZCBub2RlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAwMjo1MTo0NFBN
ICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBBZGQgdnNwZCBub2RlIHRvIFJaL0cyVUwgU29D
IERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIE5vIGNoYW5nZS4NCj4g
PiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UuZHRzaSB8
IDEzICsrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQzdS5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdS5k
dHNpDQo+ID4gaW5kZXggMThlZjI5N2RiOTMzLi4xNWU4NGE1NDI4ZWYgMTAwNjQ0DQo+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UuZHRzaQ0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1LmR0c2kNCj4gPiBAQCAtMTI5
LDYgKzEyOSwxOSBAQCBjc2kyY3J1OiBlbmRwb2ludEAwIHsNCj4gPiAgCQl9Ow0KPiA+ICAJfTsN
Cj4gPg0KPiA+ICsJdnNwZDogdnNwQDEwODcwMDAwIHsNCj4gPiArCQljb21wYXRpYmxlID0gInJl
bmVzYXMscjlhMDdnMDQzdS12c3AyIiwgInJlbmVzYXMscjlhMDdnMDQ0LXZzcDIiOw0KPiA+ICsJ
CXJlZyA9IDwwIDB4MTA4NzAwMDAgMCAweDEwMDAwPjsNCj4gPiArCQlpbnRlcnJ1cHRzID0gPFNP
Q19QRVJJUEhFUkFMX0lSUSgxNDkpIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsJCWNsb2Nr
cyA9IDwmY3BnIENQR19NT0QgUjlBMDdHMDQzX0xDRENfQ0xLX0E+LA0KPiA+ICsJCQkgPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDNfTENEQ19DTEtfUD4sDQo+ID4gKwkJCSA8JmNwZyBDUEdfTU9EIFI5
QTA3RzA0M19MQ0RDX0NMS19EPjsNCj4gPiArCQljbG9jay1uYW1lcyA9ICJhY2xrIiwgInBjbGsi
LCAidmNsayI7DQo+ID4gKwkJcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiArCQlyZXNldHMg
PSA8JmNwZyBSOUEwN0cwNDNfTENEQ19SRVNFVF9OPjsNCj4gPiArCQlyZW5lc2FzLGZjcCA9IDwm
ZmNwdmQ+Ow0KPiANCj4gVGhpcyBwYXRjaCBsb29rcyBmaW5lLCBidXQgSSB3b3VsZCBtb3ZlIGl0
IGFmdGVyIDcvOSwgYXMgaGVyZSB5b3UgcmVmZXJlbmNlIGEgbm9kZSB0aGF0IGRvZXNuJ3QgZXhp
c3QNCj4geWV0Lg0KDQpHb29kIGNhdGNoLiBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4N
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+ICsJfTsN
Cj4gPiArDQo+ID4gIAlpcnFjOiBpbnRlcnJ1cHQtY29udHJvbGxlckAxMTBhMDAwMCB7DQo+ID4g
IAkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA3ZzA0M3UtaXJxYyIsDQo+ID4gIAkJCSAgICAg
InJlbmVzYXMscnpnMmwtaXJxYyI7DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVu
dCBQaW5jaGFydA0K
