Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C2961EE7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 07:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C61010E4A8;
	Wed, 28 Aug 2024 05:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="De9Tv7So";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794B10E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzTn3HqLHl+9SxZQxpyw/gM1j5Q61Bv8rrlp4R7r27jR748rfdRQDYZwdMseSyibO5x8q/twXnMQQNk2XXw9ZP/fR1tkQjIehecd9kSsZzQ7PQLORVYRdIgxRgEFNh9xolzmjZ86fOM6/gfY9wG/w19nLUTj31FMKEg8WHy2KyeHgu1sVX2SU0KsnlKz02OdeRo7DHAAtLysN1AB1SIK95WuPjzrmnb/PlEvrqy91UC7x4/y7CqiBDqYIxpIHXO4t+P2+CIevZ+Gjbw1rFpIKRfA40BlqnA7iwPeiwKkygMIm8bDG/s0V2rzDDo50xU3gn4YvYayP4EyFWNkep6JSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5loJ1reaoB4ut8ng0KgMkQh8PQUaOam8rADSZZuhQY=;
 b=V453cobV8EkLCMlyjSC0lPUdDB3hGiIqTNjAHz3JwbvPr/tukAzppEo/I4sjKw/PgcGAJPy5jAb6qs8mKwoKJeAG03Me576vSZiGuIKW4ze3rBxUbPT/I9yHRJKFrVodBRts19ToR5F97n6R74+8jqG9OqGPSVkI8ooK1v0nC730q/Fs1ynMyx9a3cU5C0oraJCFhFdiM5O2z7G4mUr8U0Byel4izIj9Y09RhXQT6X862TwLlb88t8Yvk8UCifwLP1g1aIXLUrbZocknw6m9S0TUXEOA2GdOBhvcJsNxnGwOpLEe5O98caIOrBOvDgfrMyqSzRDw6N7BFyfI5QxDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5loJ1reaoB4ut8ng0KgMkQh8PQUaOam8rADSZZuhQY=;
 b=De9Tv7Socc1wocrSYLLAuYnnCfvMBan4752FhwR5HgL0y7roUn7nZsKWRwsH1H0/c2+8S5j4M0uCllSVXDASYUpg+/+L2UCNv52zoKbCfvvj7pxaFIQLC7gGa73sRiXIHRP5UKaXgk+z4IJ8RRnfvirZLQw3k61FK8ZeQjfxeVE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB5956.jpnprd01.prod.outlook.com (2603:1096:604:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 05:54:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:54:20 +0000
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
Thread-Index: AQHaGIfbNkLqQJf+iUioLkutiw4N1LCvC8aAgY4DQCCAAF8ogIAAfgkQ
Date: Wed, 28 Aug 2024 05:54:19 +0000
Message-ID: <TY3PR01MB11346774481409BF63AB243A986952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB5956:EE_
x-ms-office365-filtering-correlation-id: 4331a308-ba8d-40c4-b466-08dcc725dc21
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Rk41S2tKZ2FJazd2dm80VHlLYUQ0VjZFbVkrUEd4S3FSUDdITlM1bkhGRTg5?=
 =?utf-8?B?bHpYZGJMMUwxNERqVFE3UEVvRG5jT2ZRQk9oTUxyNVpwOVNRa1BJY0xDVm80?=
 =?utf-8?B?MlZNdk1hZnZwbVFPN01GMFlYWW5XZ0JNbkVlTVhpOXdMY2pDcG56eXhrTlNl?=
 =?utf-8?B?OW9Ga1lwN1lDZGN4YTBwZHFTczlDTDVkNWE2eUdJOFVId2NVY0IwNTBpeGRM?=
 =?utf-8?B?dk1mY1JxR0dqeHZ5aTBneFZnZ0NSU1ZiMW54NEVrTmxCZkIzbTVXRjF2d1JK?=
 =?utf-8?B?NWhOc3RSMkpsOWlFZUg3QmV2M1BpR1VTOGNpdG04bnpoeWFGV0o2c3ZpTXgz?=
 =?utf-8?B?M3NUUC9BMVllQ2RVOEJiQnFXTHZ5N2kzUEhscnRIYm5WMjJhamtXcDVyTnZD?=
 =?utf-8?B?TVdtV3ZMeUx3RStJUmJvVVNGcG9abnJyekhZRWE5cWdpVFQwNFJ2ZDNyNUNY?=
 =?utf-8?B?cFNVcXo5T3NyUkxBUUFFOENGSXp2QkREenFobzU2b3poanNqWnkwbmlmQ0Nr?=
 =?utf-8?B?SlRFR1FSakJqbHRUUE9qOU1CUnJsdlRKWTBpWUtHU05jM0E3eDJIWVVic3FE?=
 =?utf-8?B?c3lTeWVNR0paRXJlZVhPL1UyUUJWVjRxU2ZxZHNtREc1eWxjemwzVll3bzd0?=
 =?utf-8?B?ODVPNWs2d2liNFpaL2J0cmhMN3lPeUpBOGQ4ek9GeFFSN1lQM1lDN2F3UDR6?=
 =?utf-8?B?Qk1qRjZCZlJVK1lnZEIrckVBK2huTVprazVNdXY1dW9UclcxQlNtQW5yS1Jy?=
 =?utf-8?B?d2dVenZHNk9sUnh4WURVR05uTE1jR0pxQnZPbUg1NU9YWjZ5T2d2eGs5Ylcw?=
 =?utf-8?B?ODF6TThaSGRlNjVraE9SZjJrNFBvanNLTHJZRFJUL21mWDhJeE1nYWNqenR6?=
 =?utf-8?B?cWFGazVmKzBCdVh6eUVxdTQ4NzZsRWJCNVJRUGhLbU9NYjVoV2xXRm4zT0dL?=
 =?utf-8?B?SHdiWHhDNWNHQXlZSXpNZHUyNjk0eFF4WGwrd01udklpTGdFdVVsbDFpcUcw?=
 =?utf-8?B?QjVvaHJ3YlRnbEVEeUJCTmtjRjhmUmZYd1VKNmplVFlRM2szaUpnbjZrcUNz?=
 =?utf-8?B?M1BMMEowaU9CSXh5OWg1blhBalMwQXVTcU9vcXlmZWFTRkkycHhVanNXaEZO?=
 =?utf-8?B?b3JWOVNnWTlDb0oxa0phVFdMMU10UThKZVFjdEdmT1JYVklQMVQ5dVdTZ0Jp?=
 =?utf-8?B?eXMvQWlJOC9sM3lpSXdnZVVCQ0N3WXFvY1dWTi9mZzNLNCtmK3A2M3l5YnFp?=
 =?utf-8?B?c0lsbW9Oa09LODdoSHVtNE9BOGxxN1hBY3piaE1zMzU0NnVYdUtOOFIrdDdY?=
 =?utf-8?B?NEhEVzZwT0lpdXFuMVhUQ3hBOFBmcDR0SFZiWmNJRi8va2ZvV0c5YVY0Tndm?=
 =?utf-8?B?Q0Q1aDFaWEF2UDdSV1RmakFyRFRHckY3Rm9GeE5UWGlka09ZWHVMNy9CVk1E?=
 =?utf-8?B?K0gzWTVUQktXajU1WjVtS1p0eWR2RTl2UE55akoyZDlHWUh1VEFuekZ2K2ti?=
 =?utf-8?B?bElzd1FaNzNvRlhDNXY1bGlOZnViSVA5QjNKa1ltRmxkWnpkVEpDZ0JGaU1k?=
 =?utf-8?B?Tmdxd3NjYkdwakdNdHhGS0hiWi82dzBFajJuNVJsMDExMW1tRVAwa0xqek1D?=
 =?utf-8?B?TURheDJqTHJUMWs0UFNrL2sxN3NoWWoxRE03eEl0U0ZNcDBkZS9xbm1XdDh5?=
 =?utf-8?B?elZYMjFxSk9jazY2eW5HZEhPVTRNODc2MVF4L3V2bnFFZWdydS9GcWQweEtN?=
 =?utf-8?B?bzlYTTMwdWhBRjdCczlhTytRYzV6b21hVzRHZ3F1TmFLUWg1T0JMWmJrMHB1?=
 =?utf-8?Q?8kcfdcsI2pWcjk4nz/FOK/yBbeFNp31fomk0g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXA5d1I4YlJhYWFjcUtTRTVjNzB2UHU3WGlJMFhBbVNrQzdlbFZsVGxzaEtz?=
 =?utf-8?B?b0t3cVNIK1JlMDJrTTZvdS9QYURza3dnaGNDSnl4clgwTW1NdkZOS25yWEJJ?=
 =?utf-8?B?dkhLQ0Q3czZMUzYvY1ByZjYwdVJJTE1TbzN4cnN6aTNScGxQNFJhenVodjVR?=
 =?utf-8?B?TUJtQmR2dlVvUkdqSlhqeXI4NXlmMFlsMTFKdURQU1FIcjc3VExHZU5nNnBG?=
 =?utf-8?B?RTNiaDBRTXhzcVdLOWptWCtSTmc1M0ZJUjlQMzhyY0dyMnY3SlNkakExcE82?=
 =?utf-8?B?eVF2cUpid3g0OXZxcHhDVjhaQU9SR1JkcmFEb1BuSlU0RjBIL2xtVGhNclJ0?=
 =?utf-8?B?RkpQdCtmdkN3b21JTktSdDZlczdSNGtWUURId2gxQ3dHNmRNV2NQRWc4anBs?=
 =?utf-8?B?Q05OUXRLaGdhaXE4MWVIc25Tek1DbzdxaHZjayt1c2N3NERHZlg3SU1scXNx?=
 =?utf-8?B?NWVjSUEwOHUwYkt3TWJEc2FPaXpWMG1xTlNYMlZIcC9Oam5GNnlpS293REg3?=
 =?utf-8?B?bzVmZzVZaThCNEdaaTdJamlHenovb29KTE83Vyt6R1RBVVlYN1Zuc3NrOG5D?=
 =?utf-8?B?MUR1Qm9COXFWdjFINkNOQllSZE5EeTdDcjZudlFJaWl3amhmN0FocnVBZTFR?=
 =?utf-8?B?WUE3MzNpZE5UclVic3hka2xDYmh4R2VqV3JiZWRiTDB5SnZMUml6dEJJdHht?=
 =?utf-8?B?eENFMGlwa1JseHNNQklOcUF4SGNLOVc4aTMzcHkxYlZwbXdJQjJnY0pyRFlu?=
 =?utf-8?B?a2hHS3NqamZEMitnVWdCWGl6cWNlaWV5VVFYSWppekx2cFFvRG53cWlWQisz?=
 =?utf-8?B?Rk9BeDhyU1lPbTVGTENIVGtmb1Y0eGhMVXBPVm1Bd3V6RjZsWlJKQU5Ua3Jl?=
 =?utf-8?B?cERPNm1IRVZnODNTSGhWaHJ0VENqSUFKK2k3NktzQTVYd1o2UXhVaENTREFW?=
 =?utf-8?B?aUVHdzl5WFdwNGk5VDlKb0g0a1JrWkRKWWFZLzAvVGJoSVhhRUhLT1pXQkIr?=
 =?utf-8?B?ZVkyb2VQdzZJVTBQU0l0bVVqM1JYVXltZHNCVm9wM1l2aU1GcXRKUTY2dzIx?=
 =?utf-8?B?VEV4ZVN3MWJrQndham5ZZm9Fbk4yamRzYWR4TFFnWkVtdGJzdDEvTVRlQkJu?=
 =?utf-8?B?NWxOVGE4ZnZXYmxuOGhaZXRZN1NnMmJ0UjRBVTVEcEgyZ0ZCOUhIRFFHdmZp?=
 =?utf-8?B?NVVmeUNRNTBSL1R6OHdLZ3VheUZ5V0puQzJSNXRrOURIWXpJU2QxaG1MV2ZI?=
 =?utf-8?B?RFJPdUVHKytYdVByYUxIcVRYZzc1TUNoVzQrQnRHcWF0bjNwai8zbTFvWHRr?=
 =?utf-8?B?aUVpdFdXNlF3RVpTRXRXUEF2ZW05eWUxZWV1bHhTMWpJd1NiNW1rQi9XMVVv?=
 =?utf-8?B?WVl2M3NRT2NFejFLYjJiNWpFT0p5aFNBVWFGZnVOeUdERVVKeGozSzZNS1RQ?=
 =?utf-8?B?aFdsWUsvaEFkYUpoUU41aHREK2syVytDUlBZc2d4ZGlPZmxhMHl6c0ZhN1hD?=
 =?utf-8?B?Y0c4b1owNnp1a0tldzZ6RGdRc3dWUFVtQ01iay9qdUhPVTc1Q3FQMFkyanNt?=
 =?utf-8?B?WUxIRTJqMFVjSGdVTzJlbWZaTFhoZWtoMHdrSHJYcThhK2trN01WWm9MVGhC?=
 =?utf-8?B?dUZvQzMyZmNhMmxMeklsTlFSaUhQWDdsVVloYlkydkxsTTVra1JudHlST3FM?=
 =?utf-8?B?MHBOUTlZdXNZS3QrWTFvQ3JUemFsbEtxdTUwVWR2OW9GY2ZzQk9CQmMxUzJs?=
 =?utf-8?B?VEhZOTB5cXlDMytjMUp3NytBaFd3V3lOTVdVTnNsQjRNNmFpYmRTTDE5SzNt?=
 =?utf-8?B?aFNXQzRRNUhZNHZNYVVKck14RDQzLzdYZ0l0VHdNQTRJK0RKNUhuMm82bDBp?=
 =?utf-8?B?VTlPWHZpRzNBUkZ3U2p4LzRMMFEwOWxVRHVXSFpXWDVBaUVOVFJFZDJRY0VX?=
 =?utf-8?B?ZmxmclpFNG5YOWhnejVnT2l0b3JVakhQc2xhQ3JMd21uRHJ0SmZuWHdVRFFx?=
 =?utf-8?B?eTJYQmFsRlFxNXA5RlJvc1dOZUFEaGJNeXJ3TjRHKzlFUmpvNEplZTlvSSt0?=
 =?utf-8?B?aXh5R1dtMFo4UmFJRVBvNVdzMW03M3FveFZsYWlzSktVeTVFZWdyS1JaYUFv?=
 =?utf-8?B?eVdNTFNESE9kd01zZGhPMkp4N2x3dFBMb3BiWkVkZG9uVmxUdE9rSGJ3UVlL?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4331a308-ba8d-40c4-b466-08dcc725dc21
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:54:20.0158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Gu5F2Pmjlt45qZQ3VAroHepxU5tn32Dsd/DnBPA5GBLDRzCFUb414SEaOq3u6bvgTRTnCnH+lj8UDk2WNR6BXhMhCOFdtuTgzgKo+gJqOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5956
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBB
dWd1c3QgMjcsIDIwMjQgMTE6MjMgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtOiBy
Y2FyLWR1OiBGaXggbWVtb3J5IGxlYWsgaW4gcmNhcl9kdV92c3BzX2luaXQoKQ0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIFR1ZSwgQXVnIDI3LCAyMDI0IGF0IDA0OjQzOjEyUE0gKzAwMDAsIEJp
anUgRGFzIHdyb3RlOg0KPiA+IEhpIExhdXJlbnQgYW5kIFRvbWksDQo+ID4NCj4gPiBHZW50bGUg
cGluZy4gQXJlIHlvdSBoYXBweSB3aXRoIHRoaXMgcGF0Y2g/DQo+IA0KPiBJJ3ZlIHNlbnQgYSBw
dWxsIHJlcXVlc3QgbGFzdCBGcmlkYXksIHNlZQ0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwODIyMjM0NDQ1LkdBMjM1NDFAcGVuZHJhZ29uLmlkZWFzb25ib2FyZC5jb20NCg0KVGhh
dCBpcyBuaWNlLg0KDQpUaGFua3MsDQpCaWp1DQoNCj4gDQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAxOCwgMjAy
MyAxMDozOSBBTQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtOiByY2FyLWR1OiBG
aXggbWVtb3J5IGxlYWsgaW4NCj4gPiA+IHJjYXJfZHVfdnNwc19pbml0KCkNCj4gPiA+DQo+ID4g
PiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+ID4N
Cj4gPiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDEyOjI0OjI0UE0gKzAwMDAsIEJpanUgRGFz
IHdyb3RlOg0KPiA+ID4gPiBUaGUgcmNhcl9kdV92c3BzX2luaXQoKSBkb2Vzbid0IGZyZWUgdGhl
IG5wIGFsbG9jYXRlZCBieQ0KPiA+ID4gPiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfZml4ZWRfYXJn
cygpIGZvciB0aGUgbm9uLWVycm9yIGNhc2UuDQo+ID4gPiA+DQo+ID4gPiA+IEZpeCBtZW1vcnkg
bGVhayBmb3IgdGhlIG5vbi1lcnJvciBjYXNlLg0KPiA+ID4gPg0KPiA+ID4gPiBXaGlsZSBhdCBp
dCwgcmVwbGFjZSB0aGUgbGFiZWwgJ2Vycm9yJy0+J2RvbmUnIGFzIGl0IGFwcGxpZXMgdG8NCj4g
PiA+ID4gbm9uLWVycm9yIGNhc2UgYXMgd2VsbCBhbmQgdXBkYXRlIHRoZSBlcnJvciBjaGVjayBj
b25kaXRpb24gZm9yDQo+ID4gPiA+IHJjYXJfZHVfdnNwX2luaXQoKSB0byBhdm9pZCBicmVha2Fn
ZSBpbiBmdXR1cmUsIGlmIGl0IHJldHVybnMgcG9zaXRpdmUgdmFsdWUuDQo+ID4gPiA+DQo+ID4g
PiA+IEZpeGVzOiAzZTgxMzc0ZTIwMTQgKCJkcm06IHJjYXItZHU6IFN1cHBvcnQgbXVsdGlwbGUg
c291cmNlcyBmcm9tDQo+ID4gPiA+IHRoZSBzYW1lIFZTUCIpDQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydA0KPiA+ID4gPGxhdXJlbnQucGluY2hhcnQrcmVu
ZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IHYxLT52
MjoNCj4gPiA+ID4gICogUmVwbGFjZWQgdGhlIGxhYmVsICdlcnJvcictPidkb25lJyBhcyBpdCBh
cHBsaWVzIHRvIG5vbi1lcnJvciBjYXNlIGFzDQo+ID4gPiA+ICAgIHdlbGwuDQo+ID4gPiA+ICAq
IFVwZGF0ZSB0aGUgZXJyb3IgY2hlY2sgY29uZGl0aW9uIGZvciByY2FyX2R1X3ZzcF9pbml0KCkg
dG8gYXZvaWQNCj4gPiA+ID4gICAgYnJlYWthZ2UgaW4gZnV0dXJlLCBpZiBpdCByZXR1cm5zIHBv
c2l0aXZlIHZhbHVlLg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDEwICsrKystLS0tLS0NCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gPiA+DQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVf
a21zLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVf
a21zLmMNCj4gPiA+ID4gaW5kZXggNzBkOGFkMDY1YmZhLi40YzhmZTgzZGQ2MTAgMTAwNjQ0DQo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9rbXMu
Yw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yY2FyLWR1L3JjYXJfZHVf
a21zLmMNCj4gPiA+ID4gQEAgLTcwNSw3ICs3MDUsNyBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNw
c19pbml0KHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSkNCj4gPiA+ID4gIAkJcmV0ID0gb2Zf
cGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MobnAsIHZzcHNfcHJvcF9uYW1lLA0KPiA+ID4g
PiAgCQkJCQkJICAgICAgIGNlbGxzLCBpLCAmYXJncyk7DQo+ID4gPiA+ICAJCWlmIChyZXQgPCAw
KQ0KPiA+ID4gPiAtCQkJZ290byBlcnJvcjsNCj4gPiA+ID4gKwkJCWdvdG8gZG9uZTsNCj4gPiA+
ID4NCj4gPiA+ID4gIAkJLyoNCj4gPiA+ID4gIAkJICogQWRkIHRoZSBWU1AgdG8gdGhlIGxpc3Qg
b3IgdXBkYXRlIHRoZSBjb3JyZXNwb25kaW5nIGV4aXN0aW5nDQo+ID4gPiA+IEBADQo+ID4gPiA+
IC03NDMsMTMgKzc0MywxMSBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCBy
Y2FyX2R1X2RldmljZSAqcmNkdSkNCj4gPiA+ID4gIAkJdnNwLT5kZXYgPSByY2R1Ow0KPiA+ID4g
Pg0KPiA+ID4gPiAgCQlyZXQgPSByY2FyX2R1X3ZzcF9pbml0KHZzcCwgdnNwc1tpXS5ucCwgdnNw
c1tpXS5jcnRjc19tYXNrKTsNCj4gPiA+ID4gLQkJaWYgKHJldCA8IDApDQo+ID4gPiA+IC0JCQln
b3RvIGVycm9yOw0KPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiArCQkJZ290byBkb25lOw0K
PiA+ID4gPiAgCX0NCj4gPiA+ID4NCj4gPiA+ID4gLQlyZXR1cm4gMDsNCj4gPiA+ID4gLQ0KPiA+
ID4gPiAtZXJyb3I6DQo+ID4gPiA+ICtkb25lOg0KPiA+ID4gPiAgCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHZzcHMpOyArK2kpDQo+ID4gPiA+ICAJCW9mX25vZGVfcHV0KHZzcHNbaV0ubnAp
Ow0KPiA+ID4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQN
Cg==
