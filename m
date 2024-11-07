Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473BE9C0411
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4B310E805;
	Thu,  7 Nov 2024 11:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o0BrgB6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278BE10E80C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgnAQxOdCS509txOYM4/77pYHEepXL5LwcsImXtg0vzaPtG6ai6u0PO0oaC208z8x4D2rvcIa4go0cK6h/AdRuOeOksMdaXYSAxOi4z3xpI+zzzgMqhjgfYJjussXFBN2eufP+rTJz/+vMjomLsyXjXcp5EhXJsiQI1x2BqvV1c8IT/uuhZMqsPf7MD+YPWQmOrh0dU9I53roROaTBB1okFweVDXIfz9KTzS8NEaXBJvyY4jixt0hIedjjTEy37ggm8prtuBCN4F9Rqm9lolN9+9M7Cs8ESrOthilOEBfa27RqD/9+njXW1AgRome6ErdSZ0BfMkIOv3InZuMq3MbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDKcY2vKAGdi+6Iotvv5CVAlVThfYpCOCKM/WuvfHpE=;
 b=XtYWvYEKy+pMsHF/NSYCsWZ7Hy0qiDZbLxYY9vZzZAQtjwVB+NTk/j7AYNEHbmtcOTyEFe22cHz220rK66mTgH9GePEMo3/PihMbtS31MsHCud6Enev4xMTfn1Rwnhwfio1U3ad31M+JjaE7FubiROyPeHuWmIMCEicROqFGBiky3DLwuo3JajhCs/d7QgnBdQwlmOlpHddzKPfX4wlFSsHfuy343eMIGKTzR3QHatU55nl1NBzwtTL+cwYW6+Tq7Pbj7/ofXOZa0MwZzBMBvkp7QkJlyK3XwgzuQxJ2kaNmDG6Y4QE6mX2Zy4/C1Jdwd2aYxzOfa9TEpYusTTHVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDKcY2vKAGdi+6Iotvv5CVAlVThfYpCOCKM/WuvfHpE=;
 b=o0BrgB6JRorMruX05Ii+EaISwP+tuJFTpk4Ep+eZujlRFkajxyEs+ObcwSbsWn+ut4TRhQ21BdUCdpHo3CSIjDpsIE83by7JE6h+D4whbqMfjgkBZMX2eM35L9hzE6EXnnAZ48OS2ZYTo2zZi0Z5ntC6Ef32qBvRh4svDo5yBtc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8161.jpnprd01.prod.outlook.com (2603:1096:604:173::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 11:32:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 11:32:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Topic: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Thread-Index: AQHbMHyp+U93ujOooUq+fr6JALHav7KqnGAAgAAIEwCAAQra0A==
Date: Thu, 7 Nov 2024 11:32:25 +0000
Message-ID: <TY3PR01MB113461A685E4F7E4B3FD7369B865C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
 <20241106193310.GC21454@pendragon.ideasonboard.com>
In-Reply-To: <20241106193310.GC21454@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8161:EE_
x-ms-office365-filtering-correlation-id: 25b91059-34f5-423c-5d63-08dcff1fda5d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Mkdma0J6WnAvZWlQRXpiQjIrRStPVUZkYUlScnVwR1BNblBGRmswSjg4NXc1?=
 =?utf-8?B?VDJLVGRlMjY4MWJkQm91WG5RQ1hMN3czWTc5QVVXajY2ak5qaTd5QlpXTzZk?=
 =?utf-8?B?b2lRVXdaR09udS9PRTIrbGlrSnRsaVA5ZnRiR3hwVE85d3NVbVA0STJ3OVFi?=
 =?utf-8?B?SnlHSldWVlNFUE1iVFc0cC9tU0pOTWtrWDRsdHF3cVBPNnoySkVZUFpQeGo4?=
 =?utf-8?B?d00xT1Fsb1V4RGs0NXNiQjZhZUVKd0x1K1MrbnNTSmRXcXI2RUM5SkY5c3M4?=
 =?utf-8?B?QUFGUDVWSjBBdHk1dUFwbDdWWVpiR2p2TTdCc1lxb1FaZmNLdzF2OFdJRC9J?=
 =?utf-8?B?RDQzSFBKOHlvYm1OdzR0L0ZZeWhydmV2cE1xb2FqQTN6Q05vZkJwaFVDd0VY?=
 =?utf-8?B?dkJiTmVGS1BsR3N6STU4b0ZpYXNDbVlicTZweDZrRHpBb0RVclQyRW5VLyt5?=
 =?utf-8?B?ZTFvVHFRaE1yRGVUdE5YTlovY0h5d3V0Nm1MRmFGYmMvY21qNW9GLys5VkNQ?=
 =?utf-8?B?eDZoaHhtZU96MlZUN2g2NER6bC93ODhNbUFOZnl1UVNsMDlGL1Z2ZlZOeHE2?=
 =?utf-8?B?MUg5SHBOMGw5NE1EK2twRDZ3T0pRMVBzRXpIZm9IN25tK3NMc3JrK1FEdnBB?=
 =?utf-8?B?VDYrYVJGeVdZQXkwUzVKcFlpV1NHaVJxU1FzeFQ3Uk94R3lid3ZnT05uNjV0?=
 =?utf-8?B?MVM0aSsraE1PWmlEM0tQN1lKYTBubitwM2NFa2hQMmt6aEJMbWRTZkZzQWc3?=
 =?utf-8?B?VGtSSXdzeGpxMTA4by9JQ3pTbC8zSkpocU1Fc2dFSlpFRlRUby9POTR3dFVH?=
 =?utf-8?B?QXhzTGhoaklpRHNIYzJETm5pd0dZbCtXYnRacXJxeGRXL2J5djk4VEphN0ov?=
 =?utf-8?B?c1lGakpYUFpQSFdINFpaVG50R3lqZkJiWkdvNGFBZkhNc1c5Q01pS3lEbjRw?=
 =?utf-8?B?UTlMY0krS05GOGRWZzE0bmJHa3pMdW1YM2VDZnoxUkVlbW1MVkRDZ1BXajY4?=
 =?utf-8?B?TitBYWs0UGJxNm5LWDk0bDR5YjJhRjBRMWFWVWtWNm9FZHN3TUlUS24rM1J0?=
 =?utf-8?B?T1RyQWExeDR1NFdsbi8xZEE4cVBxUVVMWXg0c0c1cGY3dGFyaHZKMjFZZjNq?=
 =?utf-8?B?d0NOaW9lSk5qMXdmRmhPTUhXaFpIODE2cHJqdU1wOWhJWnZmQ2U4Z1l4Zkcw?=
 =?utf-8?B?emg3RG9ReTA5ejdFNGxJTDFJSzhVc2liQUF5ZFZHNWQxYTVWa1NoTGNhTEhX?=
 =?utf-8?B?UktrVnhOUmtFZHpEZzRoQm5aNmlDOGhYeXNYdHJ0aUNyMXhsTG1nWllOMENv?=
 =?utf-8?B?M2JsL0Z6NkVnY0tmU0tmSlQzanBtUFZBUWFDbG0rK21QNnIvYktyZ0xENWVZ?=
 =?utf-8?B?bEdSVENveUJ3TVovVU8rZDFRRytXVGVmbXpBcVV5OW45V0R3VkUvaFlpekNS?=
 =?utf-8?B?cnEwOUhGYnk2cHM0TkxzTnM4WDcvcFpCbWdoTlpLOUl5Snp1VTdXd25KV2hQ?=
 =?utf-8?B?MitUaWVmaXRFU1lZekhpSWVSR1M1bHpqaDhNdjhma0VGT25kVmljYnJFVUYv?=
 =?utf-8?B?SjRMNXBURW54c1VZWUVQMEIrZFBQWTgwMkFxT2hzQzBQcVRkVWV6QVNSdUdq?=
 =?utf-8?B?eE1OMi9NVG94alBBdHJvZWlrbGo0TW1NTEtBQURwbTRnd2pHdGxNREQ2T2Z3?=
 =?utf-8?B?N1VRTW1IbmhlMnphVFQzRTlhNmIrNklXMlE1a2tXYnZYTFk2eW01UzJ2SjAy?=
 =?utf-8?B?dktBR0FuZUo4OEU5cXVVUjA2K1h0WjJCSzI3eWNpL0JCcnE3T2dETit1K3Ja?=
 =?utf-8?Q?UQ3/UEFa7YVewbRtQc7vSK2d3O1xlOVT1z+O0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVQwRUlHQUVOUkZrWGhBRDlZbVlTemFFbnR5UDQzL3hvNkEzNkM0SytISGox?=
 =?utf-8?B?YjVhT1dpalVtOFBxb2lxR1lHL3JCY2l2blRoVVY5ajltSHltSFVaeUdZOHIz?=
 =?utf-8?B?K3pvSmpvaml0NHBXNjQzKzFXR29RdHRncjNoaGoyZzVEdGZ3Vng0Qk9HUWFq?=
 =?utf-8?B?bk5idDllMlVCMGFTamx2T1dtemxZM29yTnFLMHEvVW5FWXVYUWhzVm5VSnNk?=
 =?utf-8?B?YnA5UkppVjQ1Q1VIMkdheDBLUTI0T1c4eTVSZE5sOXRPdTZOQjBoRDY1Y1hp?=
 =?utf-8?B?enQ2ZG5LU3pRYzZnMVR1WG00bTk3VjBieVN6ZXRVL3lyaUUrYXFXaytNM3Js?=
 =?utf-8?B?UDhBUnBQU2tLRGZ0UHJJbWZvM3MvVXdOUks1ZHV5VHRxOW9SKzVzRi85MWlP?=
 =?utf-8?B?aGltSjJxZlg3NGd0RlBoeG9EWmN3cTZuWndEbUdObS8waVNZeHhvQXNIQTdz?=
 =?utf-8?B?SDZwT25EQjVOS245QlRsaGVEMVNBTUIzNmNRLzk1Rm1sVWVRZmpkWUxmN0Vv?=
 =?utf-8?B?NkdEb1NWU0xZRWZURVVQTExMd2Frc2dHdEdsSEt6V25hNExQK1UwTTBhVkhP?=
 =?utf-8?B?N2YwMnYyQU52a1RlMnZFWkgzSk5EaVA5TW1JaTVITkNVN0NSbUhJdjkwUW85?=
 =?utf-8?B?U0YrNDdSUjczL3poU0h5RmYxd0JmUmxEaFY0TVFPNXJKWVVRYmpadktkK2JS?=
 =?utf-8?B?S1ZERzlMbkFqL2psdE9rZzdVdWdpNnNMV2N0TUYyY2h6Vyt1OW5EMVk3M2lu?=
 =?utf-8?B?ckdBaGRxdTN2b0RFS3RITmtSOVJ4N0VCNUh6RzlaV2VoY2JJRWpRYUVia3gw?=
 =?utf-8?B?SEttSGtHN3hvSE5XaEFSTVVtbkhFVTFiWGMraWt1ODhNcmJRMHdDVUMxY0lO?=
 =?utf-8?B?cko1QmU1WlNYTHhVMFVYRWFwODNmNUREbjEzSWpGTlFEMWRzMmdDblA0UVM3?=
 =?utf-8?B?dDNZK1M3NCs1ZEY4V3g1KzNxOVRPRjQySTY0VHZ6VURWYnE0b04rbDhhbjBG?=
 =?utf-8?B?a2Yrd1MzTlc1czFYMkJ2R0h2b0NwL0VKT3hSL2UwTk4wMTkwNEdqblBDSFBT?=
 =?utf-8?B?WHhDclhhRFkrcWJ4aURzYlJmVXlzL2tFNVRrQTR2dGdtenlEUkZvZXVhVHU2?=
 =?utf-8?B?MjA1dFJxa0F6eVNJOWNrMW96RzJLd28zbGpseHllVXFDVHp2SGdvQmxuRWRP?=
 =?utf-8?B?MzlSRGVNZ0dOWWV6bDRvYXNxT1ZhQXdLQjdLZHhjLzJOZXZ5ZHlUekZUMDdW?=
 =?utf-8?B?QUFyV3lRWWRRS2s1KzUzREtzcUJWN1Iyc0wzWVBia2NEOWlrSDE1SjViUlJ2?=
 =?utf-8?B?dkF0VTh0NmthZXdkMlpwUXJSclNCVWRndXpaV2dOejlRTVM2eHhLN2dhWU0z?=
 =?utf-8?B?WTNEazBBTkFRblcwYnFjc0VTYklQc01wSDlabHkwdytPeFN4NlhRZStxb09V?=
 =?utf-8?B?VkgrcjYxdFI2dHRTalJJR0dsS0cvQTZDVTZrSEt5RkxlZ3Qyc1kwUnBxMFZt?=
 =?utf-8?B?MDdSRkR2cmJMQ1FtdUllWkFYdWZ1b1g2K2IzUjY4OEtZZlB6azhoWVdxKzJ1?=
 =?utf-8?B?UHg5dkhnZmtQR2g1bFdGYWNkRTZHL1ZMcFFrMkRoVjlBWGlBNUxEZ1ZzeE5J?=
 =?utf-8?B?QkF0YS9iM1RWcW5DVVF3bS9FSGJOMkFkRFNqRm5pZ0ZFK3dPcVB0d2txOVBH?=
 =?utf-8?B?UHhvRmVaSUlFRDlJOFhTV3Z2bDM4Si9uajBUZ0Y4WXU3OGw1RVBiaFY2SHZM?=
 =?utf-8?B?YzliL2NtZksrNnV5OGxNam81MDRoQVZSL3VDRUUvOCtqaXV2U3lBdG9RYm9S?=
 =?utf-8?B?US9FVmdKbHU3cVBJZXJHUGdCMVlFQXJNdzNRd2ZCZ0NQOGF5WDdCUDM3WTNX?=
 =?utf-8?B?c1RTV3VYdUhrTjFrU0RuVExWQStpZGx1YXZTeWNHUnR0M2RGMlVlbnVMVEhD?=
 =?utf-8?B?TFFJWm43ajRZSklkNnZxbklGRURTWjY2Rm1VM01kZlBwT2tnWEUxN1QxTEZH?=
 =?utf-8?B?RlBxR1h1NFRPcXJvS05XZWljcDQ5SlJHcmU2T0V0ZWloRWpaU0JRWlYzTVo2?=
 =?utf-8?B?NXo2L0ZFQUZWd0Y1R1o2K2lyemdzUUJwNXN3RzBzaS9oK0JVMDFIdjUxNkVF?=
 =?utf-8?B?R0pWMFJQd1FDbTlkQWl1TmxnOEpxcnIyMDdIM0llSzlZUlRMd2kyaFh3NVNF?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b91059-34f5-423c-5d63-08dcff1fda5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 11:32:25.2132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYnHQSfhh59GOrA9oQRiRwM7WF4TZB4ZLc/LIYtrTkNv9g7GdQRhVTp11rZPtCKXhJOhBTEfQzqxt0nvfjxZBx557EVLc1ej+QumzimaHps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8161
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
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNiBOb3ZlbWJlciAyMDI0IDE5OjMzDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSBkcm06IGFkdjc1MTE6IEZpeCB1c2UtYWZ0ZXItZnJl
ZSBpbiBhZHY3NTMzX2F0dGFjaF9kc2koKQ0KPiANCj4gT24gV2VkLCBOb3YgMDYsIDIwMjQgYXQg
MDg6MDQ6MTZQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IEhpIEJpanUs
DQo+ID4NCj4gPiBPbiBXZWQsIE5vdiA2LCAyMDI0IGF0IDc6NDnigK9QTSBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gVGhlIGhvc3Rfbm9kZSBwb2lu
dGVyIGFzc2lnbmVkIGFuZCBmcmVlZCBpbiBhZHY3NTMzX3BhcnNlX2R0KCkgYW5kDQo+ID4gPiBs
YXRlciBhZHY3NTMzX2F0dGFjaF9kc2koKSB1c2VzIHRoZSBzYW1lLiBGaXggdGhpcyBpc3N1ZSBi
eSBmcmVlaW5nDQo+ID4gPiB0aGUgaG9zdF9ub2RlIGluIGFkdjc1MzNfYXR0YWNoX2RzaSgpIGlu
c3RlYWQgb2YgYWR2NzUzM19wYXJzZV9kdCgpLg0KPiA+ID4NCj4gPiA+IEZpeGVzOiAxZTRkNThj
ZDdmODggKCJkcm0vYnJpZGdlOiBhZHY3NTMzOiBDcmVhdGUgYSBNSVBJIERTSQ0KPiA+ID4gZGV2
aWNlIikNCj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gPiAgLSBSZXBsYWNlIF9fZnJlZSBjb25zdHJ1Y3Qgd2l0
aCByZWFkYWJsZSBvZl9ub2RlX3B1dCgpLg0KPiA+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiA+ICAt
IEFkZGVkIHRoZSB0YWcgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIiBpbiB0aGUgc2lnbi1v
ZmYgYXJlYS4NCj4gPiA+ICAtIERyb3BwZWQgQXJjaGl0IFRhbmVqYSBpbnZhbGlkIE1haWwgYWRk
cmVzcw0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiA+DQo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gPiBAQCAtMTQzLDYgKzE0
Myw3IEBAIGludCBhZHY3NTMzX2F0dGFjaF9kc2koc3RydWN0IGFkdjc1MTEgKmFkdikNCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+
ID4NCj4gPiA+ICAgICAgICAgaG9zdCA9IG9mX2ZpbmRfbWlwaV9kc2lfaG9zdF9ieV9ub2RlKGFk
di0+aG9zdF9ub2RlKTsNCj4gPiA+ICsgICAgICAgb2Zfbm9kZV9wdXQoYWR2LT5ob3N0X25vZGUp
Ow0KPiA+DQo+ID4gVGhpcyBzdGlsbCBsb29rcyBmcmFnaWxlIHRvIG1lLCBhcyBhZnRlcndhcmRz
IGEgcG9pbnRlciB0byBhIGZyZWVkDQo+ID4gbm9kZSBpcyBsZWZ0IGluIHN0cnVjdCBhZHY3NTEx
Lmhvc3Rfbm9kZS4gSXQgd291bGQgYmUgc2FmZXIgdG8gYWxzbw0KPiA+IGNsZWFyIGFkdi0+aG9z
dF9ub2RlIGhlcmUuDQo+ID4NCj4gPiBIb3dldmVyLCB0YWtpbmcgYSBsb29rIGZyb20gYSBkaXN0
YW5jZSwgdGhlIGNvZGUgbG9va3MgbGlrZToNCj4gPg0KPiA+ICAgICBzdGF0aWMgaW50IGFkdjc1
MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykNCj4gPiAgICAgew0KPiA+ICAgICAgICAg
ICAgIC4uLg0KPiA+ICAgICAgICAgICAgIGFkdjc1MzNfcGFyc2VfZHQoZGV2LT5vZl9ub2RlLCBh
ZHY3NTExKTsNCj4gPiAgICAgICAgICAgICAuLi4NCj4gPiAgICAgICAgICAgICBpZiAoYWR2NzUx
MS0+aW5mby0+aGFzX2RzaSkNCj4gPiAgICAgICAgICAgICAgICAgICAgIHJldCA9IGFkdjc1MzNf
YXR0YWNoX2RzaShhZHY3NTExKTsNCj4gPiAgICAgICAgICAgICAuLi4NCj4gPiAgICAgfQ0KPiA+
DQo+ID4gVGhlIG9ubHkgcmVhc29uIGFkdjc1MTEuaG9zdF9ub2RlIGV4aXN0cyBpcyB0byBwYXNz
IGl0IGZyb20NCj4gPiBhZHY3NTMzX3BhcnNlX2R0KCkgdG8gYWR2NzUzM19hdHRhY2hfZHNpKCku
DQo+ID4gU28gd2hhdCBhYm91dCBtYWtpbmcgdGhpcyBleHBsaWNpdD8NCj4gPiAgIDEuIExldCBh
ZHY3NTMzX3BhcnNlX2R0KCkgcmV0dXJuIHRoZSBob3N0X25vZGUgb3IgYW4gZXJyb3IgcG9pbnRl
ciwNCj4gPiAgIDIuIFBhc3MgdGhlIGhvc3Rfbm9kZSBhcyBhIHBhcmFtZXRlciB0byBhZHY3NTMz
X2F0dGFjaF9kc2koKSwNCj4gPiAgIDMuIENhbGwgb2Zfbm9kZV9wdXQoKSBpbiBhZHY3NTExX3By
b2JlKCkgYWZ0ZXIgdXNlLg0KPiANCj4gT3IsIGFsdGVybmF0aXZlbHksIGlmIGtlZXBpbmcgdGhl
IG5vZGUgcG9pbnRlciBpbiB0aGUgYWR2NzUxMSBzdHJ1Y3R1cmUgaXMgcHJlZmVycmVkLCBjYWxs
DQo+IG9mX25vZGVfcHV0KCkgYXQgLnJlbW92ZSgpIHRpbWUuDQoNCldlIGRvbid0IG5lZWQgdG8g
c3RvcmUgdW5uZWNlc3NhcnkgcG9pbnRlciBpZiB3ZSBoYW5kbGUgdGhlIGhvc3Rfbm9kZSBwb2lu
dGVyIGluIHRoZSBwcm9iZSgpLg0KSSB3aWxsIGdvIHdpdGggR2VlcnQncyBzdWdnZXN0aW9uLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gPiAgICAgICAgIGlmICghaG9zdCkNCj4gPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FUFJPQkVfREVGRVIsDQo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxlZCB0byBmaW5k
IGRzaSBob3N0XG4iKTsNCj4gPiA+IEBAIC0xODEsOCArMTgyLDYgQEAgaW50IGFkdjc1MzNfcGFy
c2VfZHQoc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IGFkdjc1MTEgKmFkdikNCj4gPiA+
ICAgICAgICAgaWYgKCFhZHYtPmhvc3Rfbm9kZSkNCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT0RFVjsNCj4gPiA+DQo+ID4gPiAtICAgICAgIG9mX25vZGVfcHV0KGFkdi0+aG9zdF9u
b2RlKTsNCj4gPiA+IC0NCj4gPiA+ICAgICAgICAgYWR2LT51c2VfdGltaW5nX2dlbiA9ICFvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2wobnAsDQo+ID4gPg0KPiA+ID4gImFkaSxkaXNhYmxlLXRpbWluZy1n
ZW5lcmF0b3IiKTsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQo=
