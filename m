Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E79EFCE8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 21:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1010310EE81;
	Thu, 12 Dec 2024 20:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="YFTSixaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A470310EE81
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 20:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajqNrzZhPKs6PAhUsx6sGe1qUKOohpPdfvd8vXWhRM8vYp8IlmzPoH6cOPJKkmbFHQ8hVSPzy8/4A3RHLizhxYOR8rUwe/ISdp40I/4JFKq52bDQUzYk2NLR2OszwodLxXJEgyVqQVWDpL3j2xxpgSvlniXBFEUdKu1WBt7214uMA3kErhWocFt5cTj7Gdt8qeCuxXefJHvbTXfHA2zdpPJubsUaftMi82iBf1qthkpUXPdRsCEZ27VOXyZBlgxSfm/Gsuoc0ja1eLwST3O9Qsqrmv056gjqkXr1WRgpeQa4z/DxYm7v6eKuOm18yzERpEdKYHpSIttPI3wL1bArGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bx91CZwwu+l2uGmziqbeMIyzQYkOYFMdx8qn9OLcNLY=;
 b=TMICt3C6K0gonLaZygWVa7szNHH754qwqEocs6HwP/ydE39Jy2UBZo/3achtzZ4EGbmugrrfbTVWWFNuDOiQcJaVMLndZGZRODuCjZ48OHXda0yulD//ZIrnAeLMia85K1CcgnpjkEG378th/AuVLLPtAiyYBt8jUuiqboy6uKX/nI4wpZGrEnpHlk5njqDpi9XAKnFalkKLLatXFVGxk3VTO47SB2PDG738OXrvlWZg3+S76VfCAJ4a8V8FUU58ZhDdpdFwBLtcIlwDEl3aOHqjic4MQzi1XhiWLEf2GkvWF6Vp7hhoyZNSrvC2iQrs5GBEMnUnTI4x97UY3XUpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bx91CZwwu+l2uGmziqbeMIyzQYkOYFMdx8qn9OLcNLY=;
 b=YFTSixaHhETmtaDKHDOlVSy3qVvF3S/JK7YkAp/VACHCG1zIPQvb76i34YLqOOLjtEbPAl43zvvvcGHVIy+M6ZSeDfjW6JhcCemPraEMWJ5PWz+iBn69tjl/fOn49RO1mCO8jZ8s1BYWvlrdYOs93L+ne6EHuwSqy1WaKghxvzv1Mub8E+GV+OmA2L6tlui9jViAcPBOoMfp8Hokm0gr30QDaxFRDavRSmr2QcTQZz4NBCat3/vsbRBXzgYKX8Ikkvp4s0+rM56RMeCZ1AMyYFWoq3G/WdFIiU5B7aQjxfcKvaBwRtAd2Yg32+tbH2ZW7J3HYy9BsWle18Bfrilsdw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.5; Thu, 12 Dec
 2024 20:01:42 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 20:01:42 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "lee@kernel.org" <lee@kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "afd@ti.com" <afd@ti.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "danielt@kernel.org" <danielt@kernel.org>, "linux-leds@vger.kernel.org"
 <linux-leds@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] leds: lp8864: New driver
Thread-Topic: [PATCH v3 2/2] leds: lp8864: New driver
Thread-Index: AQHbShcAcvb8Dq8RaE+PBajSN4N+UbLi+78AgAARZYA=
Date: Thu, 12 Dec 2024 20:01:42 +0000
Message-ID: <1099b6964d39ceaea04719b32b366e4bf3d7b30a.camel@siemens.com>
References: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
 <20241209084602.1199936-3-alexander.sverdlin@siemens.com>
 <20241212185926.GL7139@google.com>
In-Reply-To: <20241212185926.GL7139@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8746:EE_
x-ms-office365-filtering-correlation-id: ef1a9b20-bc0e-4aa6-9641-08dd1ae7cc5c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UUVFbUVBZEs0MGJiSERIcC9TeW4vV0wyMm5jbUhLRTU3elp2SkpudU0wV0Zq?=
 =?utf-8?B?WnZQdVU1Nm43TjVpeVR5cnpmVytiTXErZUMxam9lOEpPYU5zZzEvMkN6VGUr?=
 =?utf-8?B?Y1BBb1dvWUxPZFpsWm1EVzRZOHc1QldYNzNOYTFHYmk2SnF6YzZSRWxOaWl4?=
 =?utf-8?B?UDlIN2ZJdGwzMCsvRnhqMXZsTTJkVGVWUlhLNjlPb0h1UEpPbzBaTjhYaGUw?=
 =?utf-8?B?dFcxT2paV0JscndMRkZBN25WNUZQbWpuMWhIbzk3MjFPSlFXMDhrWUE2SU8z?=
 =?utf-8?B?K0prZnJ0TkwyWFdGbXlVRkdjMWNQdU1QTTJ0aStsSElVOFI3cW0vQjZIc21S?=
 =?utf-8?B?UFBIcnBzeUVmaTE4Q1pIaWVJWjZ2TDZsVFBnSGlJd0R2MmthUlFYc044VlNU?=
 =?utf-8?B?WWNCbDVMbUhBRGllT0xtTDIraEZiNFQ3STBJUndmejRvMFhpM0VpeFJPMENG?=
 =?utf-8?B?RG4xemkrWmZBZ2VSTjVMUkZ5eDBYZC8yb25UWnJBOHpJUk1qbXIwcm8ycnNq?=
 =?utf-8?B?d0VBQmtaSHVMSzB5bjlJZ1puQ0lWbkw1STV3UzNjUWV1ZlJhUllCQUFwMy9B?=
 =?utf-8?B?RFJkVm5NZm1TK2EyUi83TmptdTlrR28wMS9WL0IwVkFmWDlPcnpCVXlybW92?=
 =?utf-8?B?dlpWeW9tUitLMEhlYVN3eWtXMy9TU1hhY0wyOHl2Q3R3U1E5WEkyRm5aWGI3?=
 =?utf-8?B?RU9OenBFbEpaelZnMjNZWTNna21EMEpoblhia3RrcENXcStWaTUvNmU5MVJ3?=
 =?utf-8?B?QmIrM0NXWTNRN0lvWUdSOUYrM1hOQmJFOWJXR01sUkh4OWh4MElmU1N2MU5o?=
 =?utf-8?B?RHJjdnRQcDVLTkdHOTF6bE45eVppTG5NZW9yUEYzMVdtTVVYUUZJT1ZFT3pQ?=
 =?utf-8?B?VUdnV003N05MandIb0RKVVFpTzVOTDhKQlVVMGNuYVNBN09xdTdRd0sxMVl0?=
 =?utf-8?B?bEptNXZTamR4K3h2aGppanpsTEN5dkdsR0lmL0FQSDZUNW9TZm4xU3NBcFRV?=
 =?utf-8?B?YnZyeXFkVW5CL0RBSU1zRkdNNTNteHRSV212QWVMN0EwaUJ1cUlwOGc3djVv?=
 =?utf-8?B?b2xGUUFacUpqT2xDUTRON1VOYmZmUmd6TG9lN3hUQ1U2ZEE2N0FScnFCUlpE?=
 =?utf-8?B?VXVGS2lOdzFmQjRzM3pEMXVacjdiR20rZjJSbWJNQTk4S3A1UDB6VEJiMzB1?=
 =?utf-8?B?cFVwZWdvTkVRV1g4Q2dXcFovMFFqUjY1RzFvc2Fkek1EUzE4bm0xeEFRWjF4?=
 =?utf-8?B?SHZvV1NLNXh4V3ZMTTNiZEc5NTU1ZXoxRlpuVkNENitRY1AyczN3WEcybDNz?=
 =?utf-8?B?Y2QwejV5QkhUalJGakZmRlBDSDd0YWVBdDlOVk9SRGovQ2k1eVo2RTB4RERB?=
 =?utf-8?B?bldiaEtIZ245cForaXp6YUhuTWN1aHhtNFpRRG9MVHQrVFFlenZOZzNyOENF?=
 =?utf-8?B?ZUhUWm02TlA3cU5LcEhuUWx3d1gwWFVBQmdSMFVmVlhJQ0RvT20zTSs2azN1?=
 =?utf-8?B?V2RrVmYxYkZMd2lhUEloSHFyaTZKRWtVellGN1kvdjAwcFNIWW16cWx5N3J2?=
 =?utf-8?B?SGxrQjFIbW1CY0hBQi96MG40UEgvV0gwWWlRTnNWVGRQNG5PeFVXZkdJNmV0?=
 =?utf-8?B?YU45Rzh3WXpFQ1p5c3l5NStZczZoWktlY3BZYy9ROGQwY3RCVVFJTmxGU3FP?=
 =?utf-8?B?V0h2TDU2MTVVM2wwd0pudG82QmhWTDZFaEpKVXJwTmJCc2pCY1FqU1hDQXh5?=
 =?utf-8?B?NnN3UEFxVTFWdHczMCt2YzVnRkpOaU9zZmhQS0V4c2pnaUtJbWZWNVFuSXAw?=
 =?utf-8?Q?PnqvTjv6uhr5D2C+nzIc0wEujzZiMMIgudptU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU5Cak03bnMwVGhmQlo3Sll6dGNrbEFLY3lkM3VvOHhVa3VxZkdEYlZqNVMv?=
 =?utf-8?B?ZFlpeDZzSjN2VmdEN1FhQWRsK0FJeEx2V3Z0Wk1WTFU0OW9OekY4YTB5c3c0?=
 =?utf-8?B?QjJUQ0Rta2ZzVEpBSy9tQyt0enBkRFNkZmhMam5tWlRBQlZzMzhzT3A3RXNZ?=
 =?utf-8?B?aERCNTExME9uYXVxNGdtall0ZkQzTjZtQzBOcFJzV3Y1cjl4cndScFpVUkh5?=
 =?utf-8?B?QW53OG45cm1oM0RtQ0pWdEpZdHpRbFJHR2R5a0Z5ODYxSklYeUczUmRrSEVv?=
 =?utf-8?B?ZWY4emZSd1ZwQ0svUi84MEFBelEvZFRZSHNUWDEweXdlZnNJai9qOVhmL0tW?=
 =?utf-8?B?cW1yRHptMFZUdHJaa2d1ZzNlYjhMaStnRGVVVlY0ZDZVeGM0Zmxsb0JTSUJD?=
 =?utf-8?B?UHpZOGV3VnJVdEhhcGlmSlVYcGoyOVNZNFI2L21DQlpXQ0dEakNEZjhoYkkw?=
 =?utf-8?B?c2pCeG15NTRQY2VqZmhyTUhaRWVYSFNGbjdjQnQ4U05zaWUyYU1xaGtTU0pE?=
 =?utf-8?B?Mi9pM1k3Rk9xWDRFZlpzbUlHWW1rWDFrdzNsSWFoT0dCdnVVaDRnZVpPdnV0?=
 =?utf-8?B?SGNHZSsrdWJGdExxZ3BOQ2pMdlJlUFJ6VDVkOFN0S0w5QkxEMFRZY2tzYzE3?=
 =?utf-8?B?MHVTZTFuQ1VoQSs1VERnVFJzRnljdVEwUFBZWk1Dc1JqZVdYRG1lY3FrOEYv?=
 =?utf-8?B?UmRrQkptMm9KenROV0thMmovZjI5N2E2bUx5K05sczI1bWwxRWVuN24xaHhu?=
 =?utf-8?B?SkEvZ1VDQU1WNXF2Z3pMak5uR3ZwU2NZbW1KeStyRzhFNTM3Z0M1RmlkQnNL?=
 =?utf-8?B?YVdIazhxUmVwZjV3cVpZUUVUMzJzeHA4Nzh0Z0hKVzUvR014aElDT3laRVIv?=
 =?utf-8?B?ZmNnSFh0Ynp2NmxhazBsckF6NDhZTmVObmVlMTlRVVpOVFpMVGN5UDZhYUdM?=
 =?utf-8?B?em9lbGdQQWx2S1VqQ0FTYmlHYTdGOU5sUm5wZTB2d3M0ZnloZWlZNDR6V3JT?=
 =?utf-8?B?S0tYeEVRTGt6ZHJZdzV1OEdlQlhaaHlseEluSWtMdWpkZDAxOFN5QXBQd2tE?=
 =?utf-8?B?WmtnMWhtOVF2eDlnaXNZako4cGx5WHEwTE1SQUtPUG5HeUpmV1lmalkwdUJj?=
 =?utf-8?B?TlJVaWVzTU0yTEdCVzRZYS92V0RnME01RXJkY1JGZXYxU215RGZOTUNMakxK?=
 =?utf-8?B?VnZSMDY4NW4xVEZEK1dmbGV0b2lMbzJKb1F3MUhIanRFQUdkaGpOQnN5YVhr?=
 =?utf-8?B?ZmdTdzBSNEdmQVBtUW1QS1huMFhCQjMvYWZqQ0VVNHk3QnlSWDlMWnBydnVJ?=
 =?utf-8?B?cWtmdXFOcll4UnlVUTA0SW93SDgyZG9YUW53QS9ZSVg5NkdDekw2QVFQU3VV?=
 =?utf-8?B?K3ZSSThqNUo1NzRpdlRnYlZvd0NycEN4MjZ1aEJuNC9WbEFBSDZzcWthRVFs?=
 =?utf-8?B?SkYrZ0RZVEovbTNsenYvcVNmdExZZFBjTldMMktwVFBhbjUvNXBEWlE1U0F0?=
 =?utf-8?B?MXdvc212eXA2UEE0QzlhcjhnUVBabk4xT3RhTHhKNFB5YWt1RitxLzhaanpq?=
 =?utf-8?B?cVJtSE1Ec3grbnJzSTNWVUZ5dmpSZjdNQ1RjaE1kNExNOWYwYVpJdXMyNWk4?=
 =?utf-8?B?SjkwK3JMamNBTjlUQktJcVBLU0lXRStmYVBuNUlkTmo3YmJZSXBzSXJlWUh5?=
 =?utf-8?B?c1JTNTJZdkZjTXJsS0NsS2FLcCtaYnAyMmFOTDJ4aEJUMm8vNk5zalJKbW1j?=
 =?utf-8?B?a2tJVStoMDV4Q001d0dldlRNMzB1VGEzbFBTTlY4OHFESldXdHB6eWFtam5w?=
 =?utf-8?B?ck9LMGd1OWxnRGUvNzg4MWNYeHNQaXNYWmZjbUxlVmc3b3NYbC94OCtHYTI3?=
 =?utf-8?B?d2tqWnFlcUhkbWNTN1VpY3daVld1TkpyY0Q0cVNQRmRQY3RUbUZuNURyWWly?=
 =?utf-8?B?aVlDdVR5RUQvSUx2dFhLZ0wzekY4SmFYUjg0VE03MGl0VEt0N1VaenJ5U0ZM?=
 =?utf-8?B?SUVOdmltdlhEdmNNNURLVkRFOGlVRTZZblkzak51T21jNTh0bG1LNDFBc3Jo?=
 =?utf-8?B?MytjYnNPRnNNZ2kvRS9wUm05VytMOXhQblk0M2cxM0RjTDlhY3M1bXhqaUxw?=
 =?utf-8?B?NWlhaG1KUlBLS2YrdWtJcWVtYmdQaTNMVktWZFZucjBYWHlhZ2ZCc3hsVjA4?=
 =?utf-8?Q?dddEXlamxVKlw+/DdulJMrE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <315C8F3702E92845AFEAD890D1B85FD5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1a9b20-bc0e-4aa6-9641-08dd1ae7cc5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 20:01:42.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiR7dhVUSwBKYww2eOysxnlBjtwdSCHUwkfzeZyNBPuLdYoJJFPLZ3R4DyGF5679d7lrK6zbQidh0DzFrWohmD6zigmk5d9wMEUMOgTiheQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8746
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

SGkgTGVlIQ0KDQpPbiBUaHUsIDIwMjQtMTItMTIgYXQgMTg6NTkgKzAwMDAsIExlZSBKb25lcyB3
cm90ZToNCj4gT24gTW9uLCAwOSBEZWMgMjAyNCwgQS4gU3ZlcmRsaW4gd3JvdGU6DQo+IA0KPiA+
IEZyb206IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29t
Pg0KPiA+IA0KPiA+IEFkZCBkcml2ZXIgZm9yIFRJIExQODg2NCwgTFA4ODY0UywgTFA4ODY2IDQv
NiBjaGFubmVsIExFRC1iYWNrbGlnaHQgZHJpdmVycw0KPiA+IHdpdGggSTJDIGludGVyZmFjZS4N
Cj4gPiANCj4gPiBMaW5rOiBodHRwczovL3d3dy50aS5jb20vbGl0L2dwbi9scDg4NjQtcTENCj4g
PiBMaW5rOiBodHRwczovL3d3dy50aS5jb20vbGl0L2dwbi9scDg4NjRzLXExDQo+ID4gTGluazog
aHR0cHM6Ly93d3cudGkuY29tL2xpdC9ncG4vbHA4ODY2LXExDQo+ID4gTGluazogaHR0cHM6Ly93
d3cudGkuY29tL2xpdC9ncG4vbHA4ODY2cy1xMQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+
IENoYW5nZWxvZzoNCj4gPiB2MzoNCj4gPiAtIGRyb3BwZWQgbHA4ODY0X2luaXQoKSwgUkVHQ0FD
SEVfTk9ORSwgJXBlIGluIGRldl9lcnJfcHJvYmUoKSwNCj4gPiDCoMKgIGkyY19zZXRfY2xpZW50
ZGF0YSgpDQo+ID4gLSBhZGRlZCBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSByZXR1cm4gdmFs
dWUgY2hlY2ssIGRldl9lcnJfcHJvYmUoKSBhZnRlcg0KPiA+IMKgwqAgZGV2bV9yZWdtYXBfaW5p
dF9pMmMoKQ0KPiA+IHYyOiBubyBjaGFuZ2VzDQo+ID4gDQo+ID4gwqAgTUFJTlRBSU5FUlPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArDQo+ID4gwqAgZHJpdmVycy9sZWRz
L0tjb25maWfCoMKgwqDCoMKgwqAgfMKgIDEyICsrDQo+ID4gwqAgZHJpdmVycy9sZWRzL01ha2Vm
aWxlwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoCBkcml2ZXJzL2xlZHMvbGVkcy1scDg4NjQu
YyB8IDMwOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgNCBm
aWxlcyBjaGFuZ2VkLCAzMjggaW5zZXJ0aW9ucygrKQ0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2xlZHMvbGVkcy1scDg4NjQuYw0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTDQo+ID4gaW5kZXggMjFmODU1ZmU0NjhiYy4uYTg5ZjBiOWQ5
OTFmYiAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJT
DQo+ID4gQEAgLTIzMjYyLDYgKzIzMjYyLDEzIEBAIFM6CVN1cHBvcnRlZA0KPiA+IMKgIEY6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFjL3RpLGRhYzc2MTIueWFtbA0K
PiA+IMKgIEY6CWRyaXZlcnMvaWlvL2RhYy90aS1kYWM3NjEyLmMNCj4gPiDCoCANCj4gPiArVEVY
QVMgSU5TVFJVTUVOVFMnIExCODg2NCBMRUQgQkFDS0xJR0hUIERSSVZFUg0KPiA+ICtNOglBbGV4
YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4NCj4gPiArTDoJ
bGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiArUzoJTWFpbnRhaW5lZA0KPiA+ICtGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvdGksbHA4ODY0
LnlhbWwNCj4gPiArRjoJZHJpdmVycy9sZWRzL2xlZHMtbHA4ODY0LmMNCj4gPiArDQo+ID4gwqAg
VEVYQVMgSU5TVFJVTUVOVFMnIFNZU1RFTSBDT05UUk9MIElOVEVSRkFDRSAoVElTQ0kpIFBST1RP
Q09MIERSSVZFUg0KPiA+IMKgIE06CU5pc2hhbnRoIE1lbm9uIDxubUB0aS5jb20+DQo+ID4gwqAg
TToJVGVybyBLcmlzdG8gPGtyaXN0b0BrZXJuZWwub3JnPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2xlZHMvS2NvbmZpZyBiL2RyaXZlcnMvbGVkcy9LY29uZmlnDQo+ID4gaW5kZXggYjc4NGJi
NzRhODM3OC4uNmQwZTg4ZTUwMTYxNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2xlZHMvS2Nv
bmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvbGVkcy9LY29uZmlnDQo+ID4gQEAgLTUxMSw2ICs1MTEs
MTggQEAgY29uZmlnIExFRFNfTFA4ODYwDQo+ID4gwqDCoAnCoCBvbiB0aGUgTFA4ODYwIDQgY2hh
bm5lbCBMRUQgZHJpdmVyIHVzaW5nIHRoZSBJMkMgY29tbXVuaWNhdGlvbg0KPiA+IMKgwqAJwqAg
YnVzLg0KPiA+IMKgIA0KPiA+ICtjb25maWcgTEVEU19MUDg4NjQNCj4gPiArCXRyaXN0YXRlICJM
RUQgc3VwcG9ydCBmb3IgdGhlIFRJIExQODg2NC9MUDg4NjYgNC82IGNoYW5uZWwgTEVEIGRyaXZl
cnMiDQo+ID4gKwlkZXBlbmRzIG9uIExFRFNfQ0xBU1MgJiYgSTJDICYmIE9GDQo+ID4gKwlzZWxl
Y3QgUkVHTUFQX0kyQw0KPiA+ICsJaGVscA0KPiA+ICsJwqAgSWYgeW91IHNheSB5ZXMgaGVyZSB5
b3UgZ2V0IHN1cHBvcnQgZm9yIHRoZSBUSSBMUDg4NjQtUTEsDQo+ID4gKwnCoCBMUDg4NjRTLVEx
LCBMUDg4NjYtUTEsIExQODg2NlMtUTEgNC82IGNoYW5uZWwgTEVEIGJhY2tsaWdodA0KPiA+ICsJ
wqAgZHJpdmVycyB3aXRoIEkyQyBpbnRlcmZhY2UuDQo+ID4gKw0KPiA+ICsJwqAgVG8gY29tcGls
ZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlDQo+ID4gKwnCoCBt
b2R1bGUgd2lsbCBiZSBjYWxsZWQgbGVkcy1scDg4NjQuDQo+ID4gKw0KPiA+IMKgIGNvbmZpZyBM
RURTX0NMRVZPX01BSUwNCj4gPiDCoMKgCXRyaXN0YXRlICJNYWlsIExFRCBvbiBDbGV2byBub3Rl
Ym9vayINCj4gPiDCoMKgCWRlcGVuZHMgb24gTEVEU19DTEFTUyAmJiBCUk9LRU4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9sZWRzL01ha2VmaWxlIGIvZHJpdmVycy9sZWRzL01ha2VmaWxlDQo+
ID4gaW5kZXggMThhZmJiNWEyM2VlNS4uZjY2YmYyZTEzNjY1ZiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2xlZHMvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2xlZHMvTWFrZWZpbGUNCj4g
PiBAQCAtNTcsNiArNTcsNyBAQCBvYmotJChDT05GSUdfTEVEU19MUDU1WFhfQ09NTU9OKQkrPSBs
ZWRzLWxwNTV4eC1jb21tb24ubw0KPiA+IMKgIG9iai0kKENPTkZJR19MRURTX0xQODUwMSkJCSs9
IGxlZHMtbHA4NTAxLm8NCj4gPiDCoCBvYmotJChDT05GSUdfTEVEU19MUDg3ODgpCQkrPSBsZWRz
LWxwODc4OC5vDQo+IA0KPiA+IMKgIG9iai0kKENPTkZJR19MRURTX0xQODg2MCkJCSs9IGxlZHMt
bHA4ODYwLm8NCj4gPiArb2JqLSQoQ09ORklHX0xFRFNfTFA4ODY0KQkJKz0gbGVkcy1scDg4NjQu
bw0KPiANCj4gSG93IGRpZmZlcmVudCBhcmUgdGhlc2UgdHdvIGRldmljZXM/wqAgRG8geW91IG5l
ZWQgYSBuZXcgZHJpdmVyPw0KDQpGcm9tIHRoZSBtYXJrZXRpbmcgcGVyc3BlY3RpdmUgdGhlc2Ug
YXJlIHNpbWlsYXIgZGV2aWNlcywgYnV0IGl0IHR1cm5zIG91dCB0aGUNCmltcGxlbWVudGF0aW9u
IGlzIHZlcnkgZGlmZmVyZW50LCBuZXcgZGV2aWNlcyBhcmUgbXVjaCBzaW1wbGVyLCB0aGV5DQpk
b24ndCBoYXZlICJjbHVzdGVyIG1vZGUiLCBvbmx5IG9uZSBnbG9iYWwgYnJpZ2h0bmVzcy4gTm8g
dXNlci1hY2Nlc3NpYmxlIEVFUFJPTQ0KKGhhbmRsaW5nIG9mIHdoaWNoIGZlZWxzIGxpa2UgNjAl
IG9mIHRoZSA4ODYwIGRyaXZlcikuDQpUaGUgb25seSBzaW1pbGFyIHRoaW5nIGlzIHRoZSByZWdp
c3RlciBuYW1lIHRvIGNvbnRyb2wgYnJpZ2h0bmVzcywgYnV0IHJlZ2lzdGVyDQptYXAgaXMgY29t
cGxldGVseSBkaWZmZXJlbnQsIHdpdGggMTYtYml0IHdpZGUgcmVnaXN0ZXJzIGluc3RlYWQgb2Yg
OCBpbiB0aGUNCmxlZ2FjeSBkZXZpY2VzLiBJIGFjdHVhbGx5IG1hZGUgYSBkaWZmIGJldHdlZW4g
dGhlbSwgb25seSBjb3VwbGUgb2YgYm9pbGVycGxhdGUNCmxpbmVzIHJlbWFpbiBmcm9tIHRoZSBv
cmlnaW5hbCBvbmUuIFRoZXJlIHdvdWxkIGJlIG5vIGNvZGUgcmV1c2UgZnJvbSB0aGUgb3JpZ2lu
YWwNCmRyaXZlciBpZiBJJ2QgYWRkIHRoZSBzdXBwb3J0IGludG8gODg2MC4NCg0KVGhhbmsgeW91
IGZvciB5b3VyIHJldmlldywgSSdsbCBpbmNvcnBvcmF0ZSB5b3VyIGNvbW1lbnRzIGludG8gdjQh
DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20N
Cg==
