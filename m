Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43B4ADEDC5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44F10E1D9;
	Wed, 18 Jun 2025 13:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Oy6ENT3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2710E1D9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW8zSClKOMS252Mwa/nAciHx1bMwtfRDyI90HQXH4z1oJInGGIS7i2MDya2WqOrc4DJV7Ia4g5+AiMItgc/MRUY7dxxr21IlaVoKDIVdT5vHOySIPpoEVtfYPX/Y6FF/wXrZ7xdiZ4uYpYZbQsZ0XVvkqu9QbJS9NqIOEQ/QZ00Y48ZK6LN36J58XWhU7HoEm9h/E69sbJ4oii95rqjC/nkoBvTcg8qv5YgQauL+Z0n9Wm+GpKIE10yj9YXO4m0oVPUZjJvIXofeG7cD3DrCRxZwrguNGfoDIy+fn0dIoIDCDYd0LE0HWgFEuQHSC847EwPb7DixTCqzlLA/IyuMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGPPmjI5VTQN9QJRbmgmrGLFzABPPABIMvbDJpWppho=;
 b=AmmDTdWIhzA4q2sMy6/H0TgmjZOXdbGliSdVwNeuKzH4UdTYWvtXxGU/YPFqu80Y3FxLBUBTQ82LiTYWOHYlsxHHixblTst52RfCwzfdlGD+b5YRFevTQTnJP6BioQRte3snzPOtFuyyNKcZGZcad2C8ygwbxW8EWr8+4kloU4Txu15mA49gOwpI1iaW847MhOZ0mc3IUqYXdcllmLsSFgj5cCrnnQaS9ZQUTaerK23Bn3fC3KPRkPvii6AppOPV4l2wIrM4FRnoRxSvj2oAe7kIL+tw1fcGSziDaFr2vLzrzve/CeA/LLr/3P7cam24mw6bn2WUaBvODPn5wbI7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGPPmjI5VTQN9QJRbmgmrGLFzABPPABIMvbDJpWppho=;
 b=Oy6ENT3uhBHdcO4mBhGNugtNvU6nnvMN4aG8XLHqmlkseq+UlQH5gGKU4sUXWhunex7CwiO/Bs49KMtb+DHbDzBpyTYwcO1pT9kypWf7opIwukOvq6n6mbIVedkwy0oDSeoBZmNvH4wEGdlpJkccxcK4ssYFcWcsGztrJUCDUgg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB15130.jpnprd01.prod.outlook.com (2603:1096:604:370::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 13:25:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 13:25:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHb0YbvZKdKpGoLPEeGBmVqxN0ROrQAp8mggAUMkQCAA1B+sA==
Date: Wed, 18 Jun 2025 13:25:54 +0000
Message-ID: <TY3PR01MB1134671558883AAE2C3E0A2C78672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
In-Reply-To: <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB15130:EE_
x-ms-office365-filtering-correlation-id: 70e8a881-3e00-4c28-c16d-08ddae6ba756
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MU5NVGQwVU01SzFkby9xL1hZMTFaV0ZUb2pMN2UyaXJuOG8zNERUMkpXYkt5?=
 =?utf-8?B?c1RNUWRTb2JlZDZvaVNtZ0tnNGtuUXhIVFBiZ2NjNENZWnlRTnZRRkd0UWpC?=
 =?utf-8?B?bXNkMWt3alRLc0lmdG50VVJQZHVHem1pNnpsZWMvZjRVdFpYTnJaeE1Qb0Qv?=
 =?utf-8?B?Ty9KYVNod2VkUHFFMDYyb0ZPYTJUdC9SWEU0RWM0TUM5N0hqVVpZa2J5WnZV?=
 =?utf-8?B?TzI1RndvaDFUdGJrWWZMLzRTb0VSN0F1YXUrM2NrM0podUpneVpFak54WVU1?=
 =?utf-8?B?ZXFQeWVqK0hXOXpRMHN3NmE0UC9RTjlCUVVhSFExOGlYbUh1WlVQcm9YZGJG?=
 =?utf-8?B?cThKWU5zeVVsQ0R2ZG5DNjhOREF6aU1jaTBEa01FdDY0QjYyU1QwVXhOMkN0?=
 =?utf-8?B?c3RzdUVDUmJvSWRpRnZ5c090TVlqbk1CTlVJVzJBcW5JVjJXSjdPUURBNWdY?=
 =?utf-8?B?VkFqWjAvK3d4RW1HUHVVWEsxWVBvQklUVVlSWlltSXY1UUtqcDlrZ3lmN0t5?=
 =?utf-8?B?UXU5Y0J0SzhKTWpBbUFPZC9YVER5aEtJVzJGZlE2RWZRclpYdnpZYS9nZlo5?=
 =?utf-8?B?U24zWWJHa3RSelJLMW1lZ1hKTllKSzNGWjJPVHo1ZzhkMnVZTzg3Skh0QS9n?=
 =?utf-8?B?U2VKSEFwODlVeFJSb2NPYThVcGY5dEE3Y01ZL2hJcGhkNy9CUTVINmp3L3BN?=
 =?utf-8?B?QkJtaXBtajBoTVovUlJCTUZwSmJSdUZVRlY4TWk0L2tjbFREQ2dtbm5keHFK?=
 =?utf-8?B?VUZlMVByUFN2cys2NFdLSlNjQnVmZ2NXYWdhNm5jQ21tUVM2SnlseElZSno2?=
 =?utf-8?B?eFQ5Wkk5Q3F3Qm1abUFKTVdVZWI1Vmo3UXRHdnhXSDliMndONkpIcGpwYThS?=
 =?utf-8?B?b09lWjRObDBnOEJMaENlUUhES2ZSSVVPME4vQmdIL2M5SWx0dGZzOEZGb1ZT?=
 =?utf-8?B?cmYvVHJmaXRuaWxVWHVqdHlrSDF3N3BsODlQY0xrWU9oa01SaFR4Sy9RMDJl?=
 =?utf-8?B?VDFxQzVVUEs4dlk3SmhQTVdPVEFvTXhPY3IwbDRpK2pQczh0TzVlMGlQTDBZ?=
 =?utf-8?B?OCtOZW5FWnk0NldPMTJsbm1WeDhEYnZUSmFFVzlxRCtkK1V2YTdqeURFWEM1?=
 =?utf-8?B?cE82SStOcVpGNkpvVURZbkpyUDdMdVVja21NTHJMMVVaM2xYcStoTmxsUzd3?=
 =?utf-8?B?WXdpTWU2SUc3TUR1YzNXaGthNGNpenFPc0kvemdnVjdoT1Nzay9Qcm8zMTdl?=
 =?utf-8?B?aFNLcURiMGxWd3FMQUtReHpUM0k5Z2NZNk41WllvTnZ4ZzczQktrSGdRT0ZC?=
 =?utf-8?B?RHlDcnZIK2ZwUmdJQkNBL3dTSmsyQnhDejNIekw2TEt0Y1h1d3k0M2pwVSts?=
 =?utf-8?B?cXZlMVVvT2hOVnlHU1gxOXB5REFjWlhYRjczVEpmV2IrUUVUYnBsKzBjZjJS?=
 =?utf-8?B?TnlUSGZoTnJ1czVraXRkTC9ZYUlraGg4MDJxZnpCMTdTZlJjTUdBT1hqcW1l?=
 =?utf-8?B?SlBkUFVoeG9rVTVWa1pjU05UVWMxbGlqZCtmNEFyWUJHMDRFR3Rlc3ZVZnpG?=
 =?utf-8?B?WjlWL2JYSmVqd2YzNlRpeHJxNHdPQjdyZkZQc09OaFRVc0gxOGVDMURLdkFZ?=
 =?utf-8?B?ck5OYkRIZWhWSlJvMisvOEd6SmQ0dGZZZytlWDdEVGFnWGNrOHlGSDJJVkdZ?=
 =?utf-8?B?K1dQWjlaUklLeFQrWklRYmxaMTFSTytVeHd5UVlNa3gwcXZEWjlSQy9wa3V6?=
 =?utf-8?B?ckoxMUR5Q2YvWFJnSStHSm9aczZVcytPZ3FiRU83a2V4YThRaHJSb3pXNnBI?=
 =?utf-8?B?REJWYmNXYituWDdSY2EycXJSS2daUGlrY3JPUFlwZTFmRzJjM3d4TkUwK0kr?=
 =?utf-8?B?eXRUeTVNTkpwbnFNTlpHekF3dVFhMVRwbExkb0RIeDc5MytBZjJOMzJ1dXY3?=
 =?utf-8?B?UlI1Nk80UUlNc1l5cE5lSzl2MUoxUHNCQ3k3UUo5WW1QOTZTMFphMG91cncw?=
 =?utf-8?B?YStvLytFR1F3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0ZyNWxNc3hGRExyV0RNTXI3UExWS2J2WEpkYnlQaXd0M0x1U0JIWXgyd3g1?=
 =?utf-8?B?SklZY1BPRStaaHk5clJMaDZoVjF2bXRqM2pHeFpteG54Q2I1L1diNFE5d1Nx?=
 =?utf-8?B?V084SDNjRkRFN1l4MzRqQkgrMFZEV1huNnhpZmFTVVdWNHhJaWZGbWFGcWdO?=
 =?utf-8?B?MjZKNmVYYmlqZXNHRnd2ZkQ0WG4zMDN1ZUU4b3hJTWgvTjhldlRVRUNOdmM5?=
 =?utf-8?B?TDdzNUJVQzVlTC9vQjdkUHhsTUZPV0Q4a0IzQU5rYmxyUDJ3bjVLWGxlY3VT?=
 =?utf-8?B?NDVoNmNRLzFvVldpMUI3NEVpdXZlRXlCUTdPc1J3WlJOdWdkNFpQWUozSzJS?=
 =?utf-8?B?c05Ra2piUDJqdkp1K0ZmcEVFZkVVUk9kVW1pR3F2TE4zczdDMlY4RDFHYjZ0?=
 =?utf-8?B?Tis0SmhQdERxNW95VktGeU9NNEUveXNaMm5xVXViNFIvZFpMZHRBQ1FYQUpw?=
 =?utf-8?B?WWU4Q2dFaHU5RnNyd0VEVTc1a2poYSt6UTFSL1o3Yy8rWUFKWmRqa005Qnpl?=
 =?utf-8?B?Y3pkZHVmT2djVXVOQVZybWFMakh5aVRnRldpR0RIV2NxdlAzbUZ4RE1uakdt?=
 =?utf-8?B?b21QOUJhT2RTRURKVnhabTVTdmRPMm1CK2hGUXNFUlNMQ01NbEh2TGg4ZTBT?=
 =?utf-8?B?czJQdXFHMURMK015RzdVM1RPQTZKZW8rQmg2ZXpTSVpoRW5QbHdvd3d4Nng3?=
 =?utf-8?B?OXpkb3hIeFI3K2R6TjBWMW83NE0rVm85b0xlenlVWWcwUzZhU1VqMFRETzdO?=
 =?utf-8?B?MERvQkQ1bTh0Q3BnSjZzOW5KQzl0dWpoSlRHQUxqYmRlSERNODJjcGk4cFdU?=
 =?utf-8?B?VEcvNEt4VTBWelNaVzFOVWkxRndQdjlnaHlvSzBNazFCSHgyVWNWNTMwS3lL?=
 =?utf-8?B?Z2xXaXZRdlRvaUlER3RCeVg1emFZYnNmc05ab0VyNjd3SEh0TW9KdjhkeEUy?=
 =?utf-8?B?bWhERmxuY09DSmNKYlEvdU1wQ08waU41bjR5blhyUU1PMEQwRjExamxKTFox?=
 =?utf-8?B?b24zSFBPZDN0dG9RMC8yUElUUlFydHhPcEd0UWRHNi9SYWtDRnZFcSs0NWFo?=
 =?utf-8?B?QnZEWjA3SWhhUmtmRWVsdXhhUzJrMmdWR3NPQVQzZzhTd3htMUZVN29ldmds?=
 =?utf-8?B?a2toRitIaTB3cDdrbzZBSnVJOUFoRUYycUsweUlzYlZ6L1E1T0N6dDhmeGpy?=
 =?utf-8?B?M0s5L0dvQm13dG5WcWlHMnlOdW5SbnpVdVhjN0ZyUlRJTXd2ZldaRXFaQjZY?=
 =?utf-8?B?SFJvclM1MXBXVzR0L1hGOTVZZDU4VEVsSDF2Z2NUU0lQaU52Tmk1WnZ5SHFN?=
 =?utf-8?B?cVdFSWdFYUZPVFBWOXNBU1hXSXF4SGRrNkZrb08xYmhjQlQzZXIrVjBEalV0?=
 =?utf-8?B?VGpXV1c5N1krUDlIZkp6MG1KWWpaYTZ2bGd2dTRnUmFVcDZSc3NONncxTXQ4?=
 =?utf-8?B?U1l3ckdvbVQzcEVPazU3Z2ZSSEZKcU5vUVFrS1F0RE9ycldxY1paYjNxaUZ4?=
 =?utf-8?B?aXhjUnVOMFA5c2p4dVFVemVYQkFhTDFEZnh5dGc2Nk1QcDV3cGlzV0VHNEV1?=
 =?utf-8?B?TlJWc2RXYW4rZWpTenAvc3Mzb2dYcHB4amlPYzRqTGd2amxKeExBTVVWLzNp?=
 =?utf-8?B?MzBiaW9jYXRmWU10NHdLRUowWnlSTCswZlVXamtPL0MrL0ZiNWFCa09GTWdN?=
 =?utf-8?B?b1ZWMUMrTGxzQnorYlJ5Lzdaa1dRbHBBV2ZpQ21zRk9INXVWQ3h4NGhaTmx1?=
 =?utf-8?B?dXhOellWR1VPT0NMSXA5QlgvWDZnWG4yQ3dHdGgvRW5uOGZISUNjYzFQNkpK?=
 =?utf-8?B?bFZ0bE41SkpUQ2pXU09lTFIvTEFWb0FWcXRvYkpIaVdVTHI1MTRQREhIMmIr?=
 =?utf-8?B?OXd3SUNVRTVVUkJ1a0RFYWZWb0F6UDdkaDRCbnRKQjdNV3JFTFpzRkZpQ1Fq?=
 =?utf-8?B?UGpJeHNIaGhhbFcwbzd0YkpFSm1lc2ZsL29NWVlRekNEUFVMVkVYS0F5UDhW?=
 =?utf-8?B?L1hNT1A1Mi9FaDBaTHlscXJic1VDQkd4d2RiVDl6VkRMN0ZKYnZCT3dEOUgy?=
 =?utf-8?B?UXdFdFhmcEFIV1Y3U2NubVhjTXFOZzk4WXNicVRVbFpIV0FXajl3R0JhVStW?=
 =?utf-8?Q?s0YX5JkPTbL4oPigtLEyTF1oQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e8a881-3e00-4c28-c16d-08ddae6ba756
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 13:25:54.8069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/Qv0R7yP+61GHVDkzNfkWgUoumHGesKhPQEDXMqzqtgHyTiZ+pTaTYF9HMEwYGeCEXXUR3lk4jZADvaPDVZDTqa0yT6bGssRW6RXFr+aIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15130
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

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgTGFkLCBQcmFiaGFrYXINCj4gU2VudDogMTYgSnVuZSAyMDI1IDExOjQ1DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMS80XSBjbGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBv
cnQgZm9yIERTSSBjbG9ja3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXcuDQo+IA0KPiBPbiBGcmksIEp1biAxMywgMjAyNSBhdCA2OjU34oCvQU0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFByYWJo
YWthciwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiBTZW50OiAzMCBN
YXkgMjAyNSAxODoxOQ0KPiA+IC5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFo
YWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LQ0KPiA+ID4gbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHY2IDEvNF0gY2xrOiByZW5lc2FzOiByenYyaC1jcGc6
IEFkZCBzdXBwb3J0IGZvciBEU0kNCj4gPiA+IGNsb2Nrcw0KPiA+ID4NCj4gPiA+IEZyb206IExh
ZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+DQo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgUExMRFNJIGFuZCBQTExEU0kgZGl2aWRlciBjbG9j
a3MuDQo+ID4gPg0KPiA+ID4gSW50cm9kdWNlIHRoZSBgcmVuZXNhcy1yenYyaC1kc2kuaGAgaGVh
ZGVyIHRvIGNlbnRyYWxpemUgYW5kIHNoYXJlDQo+ID4gPiBQTExEU0ktcmVsYXRlZCBkYXRhIHN0
cnVjdHVyZXMsIGxpbWl0cywgYW5kIGFsZ29yaXRobXMgYmV0d2VlbiB0aGUgUlovVjJIIENQRyBh
bmQgRFNJIGRyaXZlcnMuDQo+ID4gPg0KPiA+ID4gVGhlIERTSSBQTEwgaXMgZnVuY3Rpb25hbGx5
IHNpbWlsYXIgdG8gdGhlIENQRydzIFBMTERTSSwgYnV0IGhhcw0KPiA+ID4gc2xpZ2h0bHkgZGlm
ZmVyZW50IHBhcmFtZXRlciBsaW1pdHMgYW5kIG9taXRzIHRoZSBwcm9ncmFtbWFibGUNCj4gPiA+
IGRpdmlkZXIgcHJlc2VudCBpbiBDUEcuIFRvIGVuc3VyZSBwcmVjaXNlIGZyZXF1ZW5jeQ0KPiA+
ID4gY2FsY3VsYXRpb25zLWVzcGVjaWFsbHkgZm9yIG1pbGxpSHotbGV2ZWwgYWNjdXJhY3kgbmVl
ZGVkIGJ5IHRoZSBEU0kgZHJpdmVyLXRoZSBzaGFyZWQgYWxnb3JpdGhtDQo+IGFsbG93cyBib3Ro
IGRyaXZlcnMgdG8gY29tcHV0ZSBQTEwgcGFyYW1ldGVycyBjb25zaXN0ZW50bHkgdXNpbmcgdGhl
IHNhbWUgbG9naWMgYW5kIGlucHV0IGNsb2NrLg0KPiA+ID4NCj4gPiA+IENvLWRldmVsb3BlZC1i
eTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5l
c2FzLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+IDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHY1
LT52NjoNCj4gPiA+IC0gUmVuYW1lZCBDUEdfUExMX1NUQllfU1NDR0VOX1dFTiB0byBDUEdfUExM
X1NUQllfU1NDX0VOX1dFTg0KPiA+ID4gLSBVcGRhdGVkIENQR19QTExfQ0xLMV9ESVZfSywgQ1BH
X1BMTF9DTEsxX0RJVl9NLCBhbmQNCj4gPiA+ICAgQ1BHX1BMTF9DTEsxX0RJVl9QIG1hY3JvcyB0
byB1c2UgR0VOTUFTSw0KPiA+ID4gLSBVcGRhdGVkIHJlcS0+cmF0ZSBpbiByenYyaF9jcGdfcGxs
ZHNpX2Rpdl9kZXRlcm1pbmVfcmF0ZSgpDQo+ID4gPiAtIERyb3BwZWQgdGhlIGNhc3QgaW4gcnp2
MmhfY3BnX3BsbGRzaV9kaXZfc2V0X3JhdGUoKQ0KPiA+ID4gLSBEcm9wcGVkIHJ6djJoX2NwZ19w
bGxkc2lfcm91bmRfcmF0ZSgpIGFuZCBpbXBsZW1lbnRlZA0KPiA+ID4gICByenYyaF9jcGdfcGxs
ZHNpX2RldGVybWluZV9yYXRlKCkgaW5zdGVhZA0KPiA+ID4gLSBNYWRlIHVzZSBvZiBGSUVMRF9Q
UkVQKCkNCj4gPiA+IC0gTW92ZWQgQ1BHX0NTRElWMSBtYWNybyBpbiBwYXRjaCAyLzQNCj4gPiA+
IC0gRHJvcHBlZCB0d29fcG93X3MgaW4gcnp2MmhfZHNpX2dldF9wbGxfcGFyYW1ldGVyc192YWx1
ZXMoKQ0KPiA+ID4gLSBVc2VkIG11bF91MzJfdTMyKCkgd2hpbGUgY2FsY3VsYXRpbmcgb3V0cHV0
X20gYW5kIG91dHB1dF9rX3JhbmdlDQo+ID4gPiAtIFVzZWQgZGl2X3M2NCgpIGluc3RlYWQgb2Yg
ZGl2NjRfczY0KCkgd2hpbGUgY2FsY3VsYXRpbmcNCj4gPiA+ICAgcGxsX2sNCj4gPiA+IC0gVXNl
ZCBtdWxfdTMyX3UzMigpIHdoaWxlIGNhbGN1bGF0aW5nIGZ2Y28gYW5kIGZ2Y28gY2hlY2tzDQo+
ID4gPiAtIFJvdW5kZWQgdGhlIGZpbmFsIG91dHB1dCB1c2luZyBESVZfVTY0X1JPVU5EX0NMT1NF
U1QoKQ0KPiA+ID4NCj4gPiA+IHY0LT52NToNCj4gPiA+IC0gTm8gY2hhbmdlcw0KPiA+ID4NCj4g
PiA+IHYzLT52NDoNCj4gPiA+IC0gQ29ycmVjdGVkIHBhcmFtZXRlciBuYW1lIGluIHJ6djJoX2Rz
aV9nZXRfcGxsX3BhcmFtZXRlcnNfdmFsdWVzKCkNCj4gPiA+ICAgZGVzY3JpcHRpb24gZnJlcV9t
aWxsaWh6DQo+ID4gPg0KPiA+ID4gdjItPnYzOg0KPiA+ID4gLSBVcGRhdGUgdGhlIGNvbW1pdCBt
ZXNzYWdlIHRvIGNsYXJpZnkgdGhlIHB1cnBvc2Ugb2YgYHJlbmVzYXMtcnp2MmgtZHNpLmhgDQo+
ID4gPiAgIGhlYWRlcg0KPiA+ID4gLSBVc2VkIG11bF91MzJfdTMyKCkgaW4gcnp2MmhfY3BnX3Bs
bGRzaV9kaXZfZGV0ZXJtaW5lX3JhdGUoKQ0KPiA+ID4gLSBSZXBsYWNlZCAqX21oeiB0byAqX21p
bGxpaHogZm9yIGNsYXJpdHkNCj4gPiA+IC0gVXBkYXRlZCB1NjQtPnUzMiBmb3IgZnZjbyBsaW1p
dHMNCj4gPiA+IC0gSW5pdGlhbGl6ZWQgdGhlIG1lbWJlcnMgaW4gZGVjbGFyYXRpb24gb3JkZXIg
Zm9yDQo+ID4gPiAgIFJaVjJIX0NQR19QTExfRFNJX0xJTUlUUygpIG1hY3JvDQo+ID4gPiAtIFVz
ZWQgY2xrX2Rpdl9tYXNrKCkgaW4gcnp2MmhfY3BnX3BsbGRzaV9kaXZfcmVjYWxjX3JhdGUoKQ0K
PiA+ID4gLSBSZXBsYWNlZCBgdW5zaWduZWQgbG9uZyBsb25nYCB3aXRoIHU2NA0KPiA+ID4gLSBE
cm9wcGVkIHJ6djJoX2NwZ19wbGxkc2lfY2xrX3JlY2FsY19yYXRlKCkgYW5kIHJldXNlZA0KPiA+
ID4gICByenYyaF9jcGdfcGxsX2Nsa19yZWNhbGNfcmF0ZSgpIGluc3RlYWQNCj4gPiA+IC0gSW4g
cnp2MmhfY3BnX3BsbGRzaV9kaXZfc2V0X3JhdGUoKSBmb2xsb3dlZCB0aGUgc2FtZSBzdHlsZQ0K
PiA+ID4gICBvZiBSTVctb3BlcmF0aW9uIGFzIGRvbmUgaW4gdGhlIG90aGVyIGZ1bmN0aW9ucw0K
PiA+ID4gLSBSZW5hbWVkIHJ6djJoX2NwZ19wbGxkc2lfc2V0X3JhdGUoKSB0byByenYyaF9jcGdf
cGxsX3NldF9yYXRlKCkNCj4gPiA+IC0gRHJvcHBlZCByenYyaF9jcGdfcGxsZHNpX2Nsa19yZWdp
c3RlcigpIGFuZCByZXVzZWQNCj4gPiA+ICAgcnp2MmhfY3BnX3BsbF9jbGtfcmVnaXN0ZXIoKSBp
bnN0ZWFkDQo+ID4gPiAtIEFkZGVkIGEgZ2F1cmQgaW4gcmVuZXNhcy1yenYyaC1kc2kuaCBoZWFk
ZXINCj4gPiA+DQo+ID4gPiB2MS0+djI6DQo+ID4gPiAtIE5vIGNoYW5nZXMNCj4gPiA+IC0tLQ0K
PiA+ID4gIGRyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMgICAgICAgfCAyNzggKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6djJoLWNw
Zy5oICAgICAgIHwgIDEzICsrDQo+ID4gPiAgaW5jbHVkZS9saW51eC9jbGsvcmVuZXNhcy1yenYy
aC1kc2kuaCB8IDIxMCArKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0OTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4gPiAx
MDA2NDQgaW5jbHVkZS9saW51eC9jbGsvcmVuZXNhcy0gcnp2MmgtZHNpLmgNCj4gPiA+DQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuYw0KPiA+ID4gYi9k
cml2ZXJzL2Nsay9yZW5lc2FzL3J6djJoLWNwZy5jIGluZGV4DQo+ID4gPiA3NjFkYTNiZjc3Y2Uu
LmQ1OTBmOWY0NzM3MSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnp2
MmgtY3BnLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnp2MmgtY3BnLmMNCj4g
PiA+IEBAIC0xNCw5ICsxNCwxMyBAQA0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5o
Pg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgv
Y2xrLXByb3ZpZGVyLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay9yZW5lc2FzLXJ6djJo
LWRzaS5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiA+ID4g
KyNpbmNsdWRlIDxsaW51eC9tYXRoLmg+DQo+ID4NCj4gPg0KPiA+DQo+ID4gPiArICAgICByZXEt
PnJhdGUgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwoZHNpX2RpdmlkZXJzLT5mcmVxX21pbGxpaHos
DQo+ID4gPiArIE1JTExJKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ID4g
K307DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCByenYyaF9jcGdfcGxsZHNpX2Rpdl9zZXRf
cmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmF0ZSwNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpIHsNCj4gPiA+
ICsgICAgIHN0cnVjdCByenYyaF9wbGxkc2lfZGl2X2NsayAqZHNpX2RpdiA9IHRvX3BsbGRzaV9k
aXZfY2xrKGh3KTsNCj4gPiA+ICsgICAgIHN0cnVjdCByenYyaF9jcGdfcHJpdiAqcHJpdiA9IGRz
aV9kaXYtPnByaXY7DQo+ID4gPiArICAgICBzdHJ1Y3Qgcnp2MmhfcGxsZHNpX3BhcmFtZXRlcnMg
KmRzaV9kaXZpZGVycyA9ICZwcml2LT5wbGxkc2lfZGl2X3BhcmFtZXRlcnM7DQo+ID4gPiArICAg
ICBzdHJ1Y3QgZGRpdiBkZGl2ID0gZHNpX2Rpdi0+ZGRpdjsNCj4gPiA+ICsgICAgIGNvbnN0IHN0
cnVjdCBjbGtfZGl2X3RhYmxlICpjbGt0Ow0KPiA+ID4gKyAgICAgYm9vbCBkaXZfZm91bmQgPSBm
YWxzZTsNCj4gPiA+ICsgICAgIHUzMiB2YWwsIHNoaWZ0LCBkaXY7DQo+ID4gPiArDQo+ID4gPiAr
ICAgICBkaXYgPSBkc2lfZGl2aWRlcnMtPmNzZGl2Ow0KPiA+ID4gKyAgICAgZm9yIChjbGt0ID0g
ZHNpX2Rpdi0+ZHRhYmxlOyBjbGt0LT5kaXY7IGNsa3QrKykgew0KPiA+ID4gKyAgICAgICAgICAg
ICBpZiAoY2xrdC0+ZGl2ID09IGRpdikgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRp
dl9mb3VuZCA9IHRydWU7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4g
PiArICAgICAgICAgICAgIH0NCj4gPiA+ICsgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsgICAgIGlm
ICghZGl2X2ZvdW5kKQ0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPg0K
PiA+IFRoaXMgY2hlY2sgY2FuIGJlIGRvbmUgaW4gZGV0ZXJtaW5lIHJhdGUgYW5kIGNhY2hlIHRo
ZSBkaXZpZGVyPz8NCj4gPg0KPiBPaywgSSdsbCBkcm9wIHRoaXMgY2hlY2sgYXMgdGhlIGRpdmlk
ZXIgaXMgYWxyZWFkeSBjYWNoZWQuIFRoZSBmb3IgbG9vcCBhYm92ZSBpcyB0byBkZXRlcm1pbmUg
dGhlIHZhbA0KPiB3aGljaCBpcyB1c2VkIGJlbG93IHRvIHByb2dyYW0gdGhlIHJlZ2lzdGVycy4N
Cg0KSWYgeW91IGFyZSBjYWNoaW5nIGFjdHVhbCBkaXZpZGVyIHZhbHVlLCB0aGVuIHRoZSBjaGVj
ayBpcyBub3QgcmVxdWlyZWQgaGVyZS4NCk90aGVyd2lzZSB0aGUgYWJvdmUgY29kZSBpcyBmaW5l
Lg0KDQpBc3N1bWUgdGhlIGNzZGl2IHlvdSBmb3VuZCwgaGF2ZSBubyBjb3JyZXNwb25kaW5nIG1h
dGNoIGluIHRoZSB0YWJsZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
