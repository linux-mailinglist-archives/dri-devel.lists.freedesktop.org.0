Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C9C886AC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 08:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9BE10E0FA;
	Wed, 26 Nov 2025 07:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="I+xnn898";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F0910E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 07:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os/Cqac+xbDoBHzHWzFrN/PU4idDr2zXLq7B1RKjOjNpKlwH4FqVDK8ZWbKONTGW1cfNT17fT54YZ44DunZ65QYGIeKoiTSWT6JD27QC1jJ512VR/zWIroINtzvJG0U7NMt6t8Wx7lbDkLsLLA+QAKiO1WTyRWhcXaEYzYL26BMAd+uZFRNdBqkK4qxoXuZurUOk8A7VHmwXnrHTm8cAcDDQAi48iyw43tdcrer0GXZM+4O0aKmaCe2M0a6QKKNLyCD9xAKrjvp7kNV+jLvgXTSLK1zKNTnSfN1GfH21YL+wpyNvVvGqtWH573IUKLrGEFyWaZ5oWz2oMUMImlztSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55bVrV35YDRQ3e47gol2zf1d1NAA+sGVf1Ze4yLWBOM=;
 b=hrqKfty44d1Bqai2BcNnfYO9eGevYDs5KgF4USc4bgs365JPbUpTHpXZYeJw/gP7oDLRycO5uDNoB2Xkgeduo0LPf98A9BcuklNjY9n/adUkaDmJrejgY0wGT03Ifk/ZKn8vlswYtiRArkYINB065852nPmWrRAb6uYz7dZVsnWbsKcxt0F+ii4n/neRNu54OrWJBojFiiPCDlC82Rewe2lojtScewMBa+/GIwoysmak3nRJbfNUifTNPEHFoh1AUpTqwlGFWeHhHyh/ZRXW0bUHD9QIZDdJ7/xGuHDFanLEUf2XqqteECNCP0bbpeVtt2ZzNS2P0cDgKim4P/fp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55bVrV35YDRQ3e47gol2zf1d1NAA+sGVf1Ze4yLWBOM=;
 b=I+xnn898n96cki5bG7IFQNUUhi6vF7ymhOB2UtRIDQuh42QLN83I1oziJlTNQ2abj/VJS4dpq+wYkH/nueDNdha6vrOPEz6HdxoLEY29RamlKD2/V/PrmI6M7UPAnfrf/hmsra2GQ6BM0ePDZZ3c74QB2YkkSFULmmIDzBF3vB1XmkCUBUyErOEebUX6bBEzD6eWXW41om8bmSdYd7kDxUl6GQQHpdOXNlMdJwGRCzlZTg1N2gz4eTNYdJ3fO7HyPl9LSV4TS7nXV8/HZvDTVscrXK09NGuvre8JBvNxDt6A/ufdfTdH3AStOZS5K6YqDMWtckaYP4nxa09okLoJEQ==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 07:27:17 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 07:27:17 +0000
From: <Ludovic.Desroches@microchip.com>
To: <dmitry.baryshkov@oss.qualcomm.com>
CC: <neil.armstrong@linaro.org>, <jesszhan0024@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <asrivats@redhat.com>, <luca.ceresoli@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
Thread-Topic: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
Thread-Index: AQHcWum2DSf3TE7cx0+PFtJJqLfeFrT9vUcAgAbZFgA=
Date: Wed, 26 Nov 2025 07:27:17 +0000
Message-ID: <3fc2574a-be4c-4273-82b5-317d822b3767@microchip.com>
References: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
 <4am5nvb4ldzvvaavkdu2o36viltoxxyxwybrmj3h35wtdhfcpa@53t4zahc3y6c>
In-Reply-To: <4am5nvb4ldzvvaavkdu2o36viltoxxyxwybrmj3h35wtdhfcpa@53t4zahc3y6c>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|LV1PR11MB8851:EE_
x-ms-office365-filtering-correlation-id: d09c46ee-edc7-4c28-15df-08de2cbd3a4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UmJYQi9Ea0VhZHZnZjlzRWJDd3RtOXFzeHBXUXpPdjdDYXk2UkhXbTBTVW9X?=
 =?utf-8?B?Si8zK0VCSkR0N1c4MmlMZERiYisvT1p6amxVRFFSek5ma3d2d2tiS2k0ekdT?=
 =?utf-8?B?b2ptaDNtbGR0Rk5HMjVyb0ZTcGtFRzZzdG9wVElTZldlUVo3cFVBTXZSNjNI?=
 =?utf-8?B?MjhUOGZYTENpSGlKUGJvZDMvSHU1SmV4ZkpIa2xvQjRHNU5XK1AvNzRGbFRJ?=
 =?utf-8?B?SVBjUld4UzN5ZHhOeGdxRzgzb3RWVlVkNGlJTllzQ0pHT2RNNUwvdHBVQStG?=
 =?utf-8?B?V0JyejJLcU5pWU9BV1FkSWJGU0loSW1Cb2g1SGxHREIzRzhNbVFRMkdUZ2hK?=
 =?utf-8?B?Uk44NkxQVHVFUGcxcEJJaTZlOGRHUnMxQlpaREpiWW01dWo5VGwwVkNxWDFl?=
 =?utf-8?B?aStsVlB2OHVLTTYwbkMweXJweUpleU9QdFI5UlVXcm1DY2N6QUJCcEVubVl0?=
 =?utf-8?B?QnptK05xQkJtQ015SEpRbi9QeXdpemlZM2xHYlFPUTV2M1JyekdLZzRTeEZP?=
 =?utf-8?B?YktmMWxVNmVvdjMwdnFnWmVGeHJNNUZrSkU4TjdYQ1NMbENkN3dCUEQxdUZ2?=
 =?utf-8?B?L09VY2drOEhQNFE5QlRONFVkaXhvWlJPZ2tUcTlhdi9pa01Icm00eTFhNG9I?=
 =?utf-8?B?RlRwZU1wZUR5eTZzVEhFRHU3QUEzYk96R3UwOWtycit1d00xYkRBUTBmVHZF?=
 =?utf-8?B?a2wxTE9WVXBFcGxuZlhIYW1wOFVWbW5sYkRTN1N2MnNTbVBSYUVXQlZhUTZI?=
 =?utf-8?B?UzBnUklvMHBXMWRWeDc3TGNmeFljeDdHN3JhWjF1Mi9YOGpSZndRUWZkM2Vv?=
 =?utf-8?B?d1lLdC9aMmE4dEZMbjhDTEdWNmFJenJxTkNDMXYzRGFtVjB5WTRUQm5BemlS?=
 =?utf-8?B?WDVPSnJHT1dVeWFCa3drbHJlVitPbHJEQ1JIN1BoVWhCRWZGT2Y0ODBmNDRN?=
 =?utf-8?B?MDV1dnQ1VzZYek1ObUVHSEdCZ2dqdFgweHNFUm9MNm4xZjdTZm1yRjVEK2pk?=
 =?utf-8?B?aEQ2aDJwaDdxRGlCTGdiU1Y1ZFNBOXRFN281SElpdnUvWDlFTXB2d3RyMjRH?=
 =?utf-8?B?cFdoNDhjTnJsQ2toN3l6SlMxU3ZJbjg4VE80MkRra1JjWURQTEFlTGdCY2tF?=
 =?utf-8?B?aUgyNGc1dlFhdFJKUCsyOExHdkNVeC9SQU1YTVJraTlmWWhkVXpnOHRySllT?=
 =?utf-8?B?V3lHM3FWNzlidnE2QmNxTHNQS0NiMVk1bzFVU3hQLzhoUTZHaFp3Nk9OaTM5?=
 =?utf-8?B?Zms5Tm9CdHhkcVc3d1RabU1BVlRrTzI4aUM1RTlHNFk1TzBZbDh6TVJrYjI2?=
 =?utf-8?B?VE4xbWl2Q25FaVFqOERkSElJQ3hDdUs4TDRYL1QrRkJkcmp2TWRpNit4cHVt?=
 =?utf-8?B?MjgvYXhqYnJXU3NhdXBNZ2d5Z3VBeW16TktmbHdoNDdqdDhzUERTZkNPQzZD?=
 =?utf-8?B?VnhoQ1JEclJ6K21iRFRKYk1LaEJsbkFiZUxXYkxrNm5hZmU5K0RTdnh3eDM1?=
 =?utf-8?B?dFFXN0luMjVJMlExbmdGTWpxZHJqNXlENkIwaGVHWHNSMFF1V2MvWStJMVcx?=
 =?utf-8?B?TVJiNkpmUERxcUM2SnF3UjNqL25PRHlGYko5cjZYeVBJdjhYYjQ4bTI2bWpT?=
 =?utf-8?B?NERVTGIraUZHeEtwcTVRVnk4L1NwTFJRUVpTNUU2YituWXl1U3Erc3M1L2d5?=
 =?utf-8?B?NDdyNE91TjNhb2lYR25iTVBMcXo4akNZTmZlbVJmdkdTWmIrWDZuUTF1dS9O?=
 =?utf-8?B?ZzhRSHEvbWFjOEp5YmRVYnlKSzd5b2NseVRsUThUTFVGMTRPaHE5NFRHUjVM?=
 =?utf-8?B?Znh5blNqYmZLbDBocDFYeWNOMEF4WDREOXY5bHBMMXNJSk9BT1ZnSDYxTXlZ?=
 =?utf-8?B?Z2tsMk5mTEhsZ2pTM3ZNWlhXL2RrQVhKVFBlOGRWUFJXMDVNM1RQbHdCSnVU?=
 =?utf-8?B?K2hXbEd6QmtCQmJkbzlOKzNKSUFHWitQYml1a2VGUXRTYTNpR21uOVhwRkk4?=
 =?utf-8?B?S0FZemdva2Y0OWM3VmFiWEphcmg0VDY3Y09WT1pQV2dSdHkvQVNHMU5qazBC?=
 =?utf-8?Q?YnVRNA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG9Kek5OUFhONUJTT2tOdGxnc3BHK3orZjB4bmJqaWp0V3FxdnJOeGoxVnZH?=
 =?utf-8?B?YWNuMlQ0enpUTHhJdE12eGRFVFJ1cFNOR09CRWY2YXZHRExZN281TDdrQVhR?=
 =?utf-8?B?TXZQMHJNS1R0bTE0TmJyYk5KSnNGNWJvTTYxcHYzK3ViVUQxVEEvb0JsZkN6?=
 =?utf-8?B?dFM5emdsNHkvalpZWnAvN1EwTjdFNDdDc29lWTJJdWs5RXJyUXg2L25Rc3FU?=
 =?utf-8?B?TUpLVUtPbk4yTWNudTRXZk1BczhPSjdpK2tYRG12LytGYU1tK1lTaC9jNDJW?=
 =?utf-8?B?VC80ZUEyczVMZGxVbFlvc2t6SVU0ZHhmaGJkUUdIdGt2ZzlKTC96SjlKb3o3?=
 =?utf-8?B?aVNCdUtFQ1BRTXdLUnBTaTAxQkRpMG1UQUMwbE5hdzZ0SEd6cE1PQlA5NnBX?=
 =?utf-8?B?UDVQYzZGSldBejc2bStrVnZYcGtZaFNtcjVMb0JTS1dKT21JMUNFa2NWQnZL?=
 =?utf-8?B?d05MUkJNQ0VMVXQ2dDVub0hKRG9JbnFZeGpndFhnSStvS2VvL0JTSUgyeE9B?=
 =?utf-8?B?S05TT2pQWnhQYmIwbzRJS1ppc0plYjFMdXhSRFNCZFlSVG9FM2NlaHVvNWpM?=
 =?utf-8?B?M28zK2d3c0hNUGxNWWJEWmZ3bzA1K2YxYjIzMXN0K1QydmpuQ2JaamdIeGNE?=
 =?utf-8?B?U1VCSGVyamlpU3ozQWVTZllhUEdjTXFTSXNpM1hWMzZwWjdzNUZ4dC92Lytt?=
 =?utf-8?B?a0RML0RVSTZFbTZVMW9zQ0NwVDB3RXdzZVhyRCtUK0x4Szh3ZWhRYnMwd1B2?=
 =?utf-8?B?YnQxd25MS1U4eWpUdUpZZ2MxT004bXczRUpJQWhJOHRpYVVEcjBFM0dkVHdN?=
 =?utf-8?B?cmVtZDhPNU1xekZZRjNEc3RqZFNwT0EwRi9TWXk4ektJcmlUcUtXL1dIV0Na?=
 =?utf-8?B?aXhSRlNwRm1sUk93SERVRUNSSW1GdkFPTHFGa0Jyd0hZUGlaYlhjMjZjWXZO?=
 =?utf-8?B?TS80K3NhYit3OGtoeCs1c21kNmVSamdTNGJmQkhuWElMekM0TWJKOGxrTkdK?=
 =?utf-8?B?NDBVTXdrOEJ1TEN0SmVEcXE2K0kzM3FGdnJMN3FxcW9tKzFWejlVWEt4L29n?=
 =?utf-8?B?S3h6emRCVzFQNjE1bXg1ZC9DM3g2bVp4VThhTEhxWUUrZHl0YVBKcDB1V2d6?=
 =?utf-8?B?bDMyd0JzUE50S3Y2YVlIekNJRXFEaEd0TzVJZklrVGxhTTZIalFneWt4U2h3?=
 =?utf-8?B?TVdhRUVnckdNK2lHMWw3NW9LWnZmbThselNUbkhlajhnQzdQbTdsOHBBbXFu?=
 =?utf-8?B?eFAzVlIvS2loMU95YnZUdTFFUWxXcVhOV2hGanNvS2VoWjVrUVlNTEN3UURn?=
 =?utf-8?B?ZkV6U0lPeGZwV2FaMGdjU0hTYmh3YnhsOTF6RGxOVm5lM0pTMzQ3RnB3Q09t?=
 =?utf-8?B?TE1MajgzVFhtT0lWU0FLa0l5Q0hGd1lsMGpKNTFqM2JlWjRHcG1JRDVRTjZF?=
 =?utf-8?B?WlprZXBiQ29TRXAvcDM3UERjelVJMVVGN3R4cUV2QmloT2RhQTk3K2J1TkJK?=
 =?utf-8?B?N2xpYWN4djhZbzhDUVl5VzV2YTN3UlNJTVFWWnpLNEFWZjdRT0pxdXlGamla?=
 =?utf-8?B?TjNueENWMWxqOHVuMW1xZUVsejZqZFNKSUM4QkN0NTNNdGFqMUJMTFkxa1du?=
 =?utf-8?B?RUs5SVFDcnMrM2wyZ1lUWjVXRVZxSmc3b1QydHRYL0tNY3VFS2YyVDVSRjU5?=
 =?utf-8?B?clNydEk5KzhqSjRRU1J5a2FaWXdyRnBwZi9mOTR1ZWowREpGVk9VTksza29J?=
 =?utf-8?B?bCs4aGM3bG5zaDRjQmdlVGV4d1Q1cnhWNlJtODdZQ0VDNThWSDhvTS96OTNh?=
 =?utf-8?B?SzlMNW8zckZqVGs0SFBxalNQaTE3aElrd1p3eEhqanlLYmpwTVN3bW9TV2ZK?=
 =?utf-8?B?NzhMN1lCVVVvdU9HZG9qMEc3clBiMkZadXVqZnV2dWtJVXRpQXNXVUVoWHpo?=
 =?utf-8?B?RUJVQnQ0WjJHK2tVeUpSaTYwWXpPRG4vcHEwc0hMaFFsVSs2d1pPNHJEZzh1?=
 =?utf-8?B?RnQ4YkY0YWhmNDhKdS91eitnaCszMWZSU24yc1l6VkhIUC8xVDB1L2VsSnFu?=
 =?utf-8?B?MCs2Unp3T00yWjk1bTBRcWxha0RKQlpEYk5nekppZUdFM2JWMEp1OU8xZjdM?=
 =?utf-8?B?SDN6ejhLbmZLanlOZ1Z1RWc4ek9XNjYreEgyeUNGa1ZNZTRYOWR5NjZ0a0wx?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEF2C62FBAF4BA44AA2D059F289FFF89@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09c46ee-edc7-4c28-15df-08de2cbd3a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 07:27:17.1630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/CDX/AJNhxHh1DNLjCsvrSqYZqPn7hJ7+3F4L7rVwEv216SzwQh5pzWSMiNVkamDlbsPJixkHdZeJm6iY+qYBf0XXYU6Y2j2wWaa2aN7sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
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

T24gMTEvMjEvMjUgMjM6NTIsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgMDI6
MjA6NDhQTSArMDEwMCwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+PiBUaGUgc3dpdGNoIGZy
b20gZGV2bV9remFsbG9jKCkgKyBkcm1fcGFuZWxfaW5pdCgpIHRvDQo+PiBkZXZtX2RybV9wYW5l
bF9hbGxvYygpIGludHJvZHVjZWQgYSByZWdyZXNzaW9uLg0KPj4NCj4+IFNldmVyYWwgcGFuZWwg
ZGVzY3JpcHRvcnMgZG8gbm90IHNldCBjb25uZWN0b3JfdHlwZS4gRm9yIHRob3NlIHBhbmVscywN
Cj4+IHBhbmVsX3NpbXBsZV9wcm9iZSgpIHVzZWQgdG8gY29tcHV0ZSBhIGNvbm5lY3RvciB0eXBl
IChjdXJyZW50bHkgRFBJIGFzIGENCj4+IGZhbGxiYWNrKSBhbmQgcGFzcyB0aGF0IHZhbHVlIHRv
IGRybV9wYW5lbF9pbml0KCkuIEFmdGVyIHRoZSBjb252ZXJzaW9uDQo+PiB0byBkZXZtX2RybV9w
YW5lbF9hbGxvYygpLCB0aGUgY2FsbCB1bmNvbmRpdGlvbmFsbHkgdXNlZA0KPj4gZGVzYy0+Y29u
bmVjdG9yX3R5cGUgaW5zdGVhZCwgaWdub3JpbmcgdGhlIGNvbXB1dGVkIGZhbGxiYWNrIGFuZA0K
Pj4gcG90ZW50aWFsbHkgcGFzc2luZyBEUk1fTU9ERV9DT05ORUNUT1JfVW5rbm93biwgd2hpY2gN
Cj4+IGRybV9wYW5lbF9icmlkZ2VfYWRkKCkgZG9lcyBub3QgYWxsb3cuDQo+Pg0KPj4gTW92ZSB0
aGUgY29ubmVjdG9yX3R5cGUgdmFsaWRhdGlvbiAvIGZhbGxiYWNrIGxvZ2ljIGJlZm9yZSB0aGUN
Cj4+IGRldm1fZHJtX3BhbmVsX2FsbG9jKCkgY2FsbCBhbmQgcGFzcyB0aGUgY29tcHV0ZWQgY29u
bmVjdG9yX3R5cGUgdG8NCj4+IGRldm1fZHJtX3BhbmVsX2FsbG9jKCksIHNvIHBhbmVscyB3aXRo
b3V0IGFuIGV4cGxpY2l0IGNvbm5lY3Rvcl90eXBlDQo+PiBvbmNlIGFnYWluIGdldCB0aGUgRFBJ
IGRlZmF1bHQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92
aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20+DQo+PiBGaXhlczogZGUwNGJiMDA4OWE5ICgiZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZTogVXNlIHRoZSBuZXcgYWxsb2NhdGlvbiBpbiBwbGFjZSBvZiBk
ZXZtX2t6YWxsb2MoKSIpDQo+PiAtLS0NCj4+IEhpLA0KPj4NCj4+IEkgYW0gbm90IHN1cmUgd2hl
dGhlciB0aGlzIHJlZ3Jlc3Npb24gaGFzIGFscmVhZHkgYmVlbiByZXBvcnRlZCBvcg0KPj4gYWRk
cmVzc2VkLiBJZiBpdCBoYXMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gZHJvcCB0aGlzIHBhdGNoLg0K
PiANCj4gV291bGQgaXQgYmUgYmV0dGVyIHRvIGZpeCB0aG9zZSBwYW5lbHMgaW5zdGVhZD8gSW4g
dGhlIGVuZCwgdGhlIHBhbmVsDQo+IHVzdWFsbHkgaGFzIG9ubHkgb25lIGJ1cy4NCg0KSSBkb27i
gJl0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGlzIHBvaW50LiBJIGRvbuKAmXQga25vdyBp
ZiB0aGVyZSBhcmUgDQphbnkgaGlzdG9yaWNhbCByZWFzb25zIGJlaGluZCBhbGwgdGhpcy4NCg0K
UmVnYXJkcywNCkx1ZG92aWMNCg0KPiANCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtc2ltcGxlLmMgfCA4NiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygt
KQ0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0K
