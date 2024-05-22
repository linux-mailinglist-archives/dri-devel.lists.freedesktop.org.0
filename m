Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03418CC5E9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 19:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480D310E09D;
	Wed, 22 May 2024 17:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4/KJLpyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1310E44A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 17:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6qGbZagjDusRSoZv8jwGjOYYY/WO397virmMOcGNoBYD7rThh9E7fqzmeMXbLmvQbGJs//+AhoaqWfOnQ7eWoE0/rEXPCm8LyGmdhNdNIYGgAjKg2n41YCUw+T9BzclfzJJBcGxmbzE2uqFo1h4gjfLdKuuexCFOAfDoRDWZO2L0lx1pCGl8D2I5dTxOvkQfcrjA/yTxua0NoIUeBDzwY7F7eSNR9f6QUtRDDr4PlX32C/bdwtXA/kpb99T5S3a/kRQ+kf7M/BVG9FR2TwVtJ7QrSHDCIxBQCZ742/tKq/VXpyOBmF7lit2TYSTH4xsYaIMlBZZgIJ2iOJEx1kHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RNvxll0HNdjBSZ3tbvOulXLt8SSDK9LIlgJUUO/1o8=;
 b=EeWgl9c9UV8d/IQI80KHrPsEsG08DsKVEocBo+oA8PmoDK764lwm+3RNJ6G6hZcsLJjYTmEM2HaFzy4sbXrqFKb2vOs/FCzBVuVxGTt1v1oi0J9xdfGdcBBGzUsQvPDSve8dnTVUpMIf/YqI3wCgC9bFjQhKQ9aDLzif1AZdNrDeVjDSQpzxmQG5JPflGkl/mDJbboaok+vpFPl6uoVugM93syzm8xMIV0cHyj94NN6FW69ezC67TQG0GkOZIERJqDz3+MPzB+8nTZlyuqfGzSJx/a0eynoLRUbovUZ2agWjWPFY5K62AGcCfer43+Ii9/Lyt5adV2yuhIHgxM/Guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RNvxll0HNdjBSZ3tbvOulXLt8SSDK9LIlgJUUO/1o8=;
 b=4/KJLpyqowMYlEuv/xk/bXm6DdTrXsB5nv8WR4MnKLha09ijtulEtGzUrhSSFg0NKSLp738yx1QaYWDy2tOBxU0JlYQKP04o2NKvShWWO/rdh2nbjOHD4s18Ty8bskPzFZaVRw9L+Aa1hNmSa4Ap4WgavHkK7f7ph7ITNAYx1lA=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 17:52:57 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::710d:5ae8:24f4:58dc%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:52:57 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Topic: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Index: AQHaqy46wofSkZ5xCUSkInz8cBYk47GjY/mAgAAhnFA=
Date: Wed, 22 May 2024 17:52:56 +0000
Message-ID: <MW4PR12MB71654EE394DFEBE7325E6DC1E6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240520-dp-layer-enable-v1-1-c9b481209115@amd.com>
 <20240522153151.GB9789@pendragon.ideasonboard.com>
In-Reply-To: <20240522153151.GB9789@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|SN7PR12MB8060:EE_
x-ms-office365-filtering-correlation-id: 0c8d43ee-f84e-43cc-ac7c-08dc7a88035a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?cHd0dmorc0xNa043QWNHWmx0TUY5TGovTDhUQlc2TTZVb0RCTGR6UlNHKzl1?=
 =?utf-8?B?a2xZRC9ydXlGZElOMzB5VXA1ZWlZbjZlS0tyVlJtWWZuWHBSaVAxK0pScEtU?=
 =?utf-8?B?WElXYnk1a0FOcWMxc2UwVVI5MUZNMmZ3RFkxNm9yVWUyUVJiNkdVcE54WGtx?=
 =?utf-8?B?dnplV2E5bUFoSGcwczhzMjI2ZC9EbTlGNXJ4OVpLMjRLWk1TdmFMTXZ3N3lP?=
 =?utf-8?B?a1RsRVhsU2lLRmh0dVBjdG8vS2pTMUV0b0lwUFEvMnhWS3BvbUIzb29remw0?=
 =?utf-8?B?MnZFbVpwQTk5RmprcUlkT3RYcFNaNHhwUGZndlAwUlQvVUFGK0Z6bExDcHlj?=
 =?utf-8?B?OUREV0Rtb2Z2M0JUVEh3bllBaCttVGl3VGpUeTNKZUprRHBOTFpoQ0VGdkU1?=
 =?utf-8?B?NXlGa3lSM3A2QmlRUmp2M0RDNHQxMWpNVDRheXBHbm1pc3pRQlc4bENQVmw5?=
 =?utf-8?B?S0Fkcy8rRTlPU2t2ZmhnVHZRNWY5YTBNY3liYzRKVk9QdXZuVkR4NEpvR1N3?=
 =?utf-8?B?RUhZdTZZTG1Ga3hPRnU2aE9wRjRtZnp1d09WYnd1bENIY2ZUQ3dEYkJmMzli?=
 =?utf-8?B?UmZkWDFXMWpudUZpTzV0TERLMGxJdGVnR3o5M0g0LzVOcDArcWZGL3k2dmNl?=
 =?utf-8?B?SEJNd3B2YnQ4azFieWxkZTdDd1ZMTnJKVWs1L1FVNFFxdnJlZlpHY0lDNGEr?=
 =?utf-8?B?L3MvZlcyZUtsL3VjZXdGMHBIUjRGN3JCVllIN1p4RktBYUJBQlhFN29ZdXJp?=
 =?utf-8?B?MmFiaDRpYlhJN1Qrb015VTJzdGtsNmZlRjIxNUdjcU1FR0NxVVZDOUtpM0pU?=
 =?utf-8?B?V1dGd2RGOUhVRW5xbm5iZVY0TGpQWVc3M2dZcWZJbm16R3lFQXdJMmFlRjY5?=
 =?utf-8?B?NGZ6R0c4aXI1OTdhemQvbnJtL1d0QnE4RjY1eHJWZ2FnYUJDemM0Tm10UEcv?=
 =?utf-8?B?YTdjcWNPS2c2TGt5bCszSThWRlNoWUhBd3l0Y1JnS0pMU1JpUFBQUVN3QXFT?=
 =?utf-8?B?bDlPcm5YeENSU0ZFaU5aOEdKczlqQkpHT3RtMTY0ZVhzaW5tL0lxcGhQd1VF?=
 =?utf-8?B?WWVrY0Q5b3lFY0lobC9uL3lnSWxSSU9OZmZ4NWxJcTFWa1BlM2NTOFJTZVow?=
 =?utf-8?B?bm9aaVVUMXFLVkVYUXFhT0NyS3Q1RVVhdkFGZWpKdEhybmJybHlnZ0RUT0dy?=
 =?utf-8?B?WHpaVTFPNHNZOXNGRHdaaDlOMzBBYTVWVWVuRDM1K2xYeDlEQ0ZQL0wyS1Zl?=
 =?utf-8?B?WlVVYTBPelBJanJtRllnNjZTbDgrYk5aeU9FaWNqdURDSFVodjJpMWFTaXZ0?=
 =?utf-8?B?blU0TzNUdHR1OXVnSFMyUHRuM3dqOVVpUlEyQUFWK200eUVEMW5VeXVWd054?=
 =?utf-8?B?cEVjS3cydE10bk5WblA5VWUwUVVQUnFqbUZoTWpxTlIwYXJJeHdER2ZjMXZh?=
 =?utf-8?B?WXJvN0FRMVpjQmd0UFVVaGFtcTFRcS9nSUNmMXZxeFp0MkplYnlCNWxpM2M3?=
 =?utf-8?B?WjFtOEEzOXIrRHBOcWNNZGRlalhHK2FFL1BpZlZEMEJ2aEpOam5Jc2FTS3Bo?=
 =?utf-8?B?U1lXczRKQmJZSUNmNTVrbjRRdE1yeDg5eWNhNkNQSW5QZFVxRXltVngza00y?=
 =?utf-8?B?bTRlZjhRTlBnZG03TSs3dnFaMThGMGNRM0F2b0V1cXFPYWI2UjhTbUpmdzNW?=
 =?utf-8?B?MkUwRTMxSnAvRkZrbzZqL2N0amR2anFoM1dVUlV0SmZXd1lCa2VkME91OEln?=
 =?utf-8?B?SmZhQkJ0SDgrVnpVNHVPcE4zZTlpWERET21BcGJJSm8xNnZIVkk2VXdYWDRQ?=
 =?utf-8?B?QkJpaS9kb25FZDlOR3U4QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3RFbWE1bkcwaDhELzBhTSs1cjFvR205dGZGZXcvQmo2RzdYK1c5ZW4zeFBk?=
 =?utf-8?B?VUpZK3N2eXg1NUZHNE5Nd2ZYM3ROdFlOQ1dJMlA1Q3pFUCtjM1NPci9wdWVS?=
 =?utf-8?B?Qm1iekwwTVVtckRiSWpIUEMrVW1OR0dTNkVneUxaSUtoK0NRNjZnZDBXOHB5?=
 =?utf-8?B?RjNwZk5rRzRJOVNIaUFrNTNHWlNnTkdQS2RPZVo3eWdpM2YzTjMxTkRpNDZy?=
 =?utf-8?B?VTJXTUJ5VTNXWEdTMFBzaW9HRDZLeTlCNDFQT2ZGUk5FQlhabHdyeHBSSEd2?=
 =?utf-8?B?eHlHZjBhZHRlTnpxcnhZdDFGKzdmS0Qxc0xDaWllY3FudkhEekZZWWhKQjB2?=
 =?utf-8?B?VXJLNm54UWdjb2dhREF3M29YRE9YOE9MNEltK2NXOEtFNzVIWHZJNUt1eEw2?=
 =?utf-8?B?L3JBcThWc1c3Y3gyL1NHbndHNktVZWJHaU1teEFEUlpEazFKRnhpa1hLZVlJ?=
 =?utf-8?B?Y00vSmk0bjVONzcxMXVhY1BvQ2FtMGRyazRGQnAyZUVOSms1cVdZSkE1TVpj?=
 =?utf-8?B?REZxRnBETWsxS2d3VThBVzdrY3BKdmFTMy80blI3WmNWTU1NdlpleU9PS0Ev?=
 =?utf-8?B?dWRReXR3Uk1tQkZTSld2bXZKR1VVeC8wMWc4eWlxbmdPTjJibWRuSFlhMko0?=
 =?utf-8?B?VHowS1JJZTZueFgzbUF0ays1TnA1R25TWm1TQVVEM244MDBVMVdYMTVlS2pJ?=
 =?utf-8?B?RU5FTzhsZG05NTFaUU83UjkreXc3SlYxemhwNytkTWJpTzdpWlIyTGJxdHV0?=
 =?utf-8?B?MVR6bEo1SkJsbzlUVlplOHM0cVZ3NTFkcGpPNnJpb2pMN1RJOThkQ2NHQTVm?=
 =?utf-8?B?dGdUZkk0SUJwNXdITzQ4MkpIRGk1MFoydTJIUGRqcnJGRDJDdTZTNGhFSXhs?=
 =?utf-8?B?V3pZSTAxTTBQUzZhbTdpbzJ1RGhOVXl4NmFXd09qRnJCOXdMbDM5d3ZCNHY1?=
 =?utf-8?B?c25Dc0o1MTJHSTFkeHlhd2VRS1pwSnJ1Z1BoazhHN2FJd3N3bVNVb3lQMjlO?=
 =?utf-8?B?ak1qZW1WZzV5bFkrTTNrYW5DeFlkQ2NoMzVXdXZGOTIrcGxYWm9UQkJyQ3FI?=
 =?utf-8?B?ejJtWlRySHJpeEs0ZTVVZ3pKQ0hUSkU3Wllwb1JyeUJaaXBaZEdFRmtZRTl2?=
 =?utf-8?B?elgxN2VYaWRzV3JkL1hUUTFIMFRpY2U5Q2E0TVZEbXhpUFpmMjhuZUhNRm9R?=
 =?utf-8?B?NUZUeUJwT0djYmo4bENxOXFMd0NEZE1WK2l3Z2JxVXJZV0c1UUY1Nk10a0h6?=
 =?utf-8?B?Qm0xVW14TlhJYlZhajJGb3VBMDlmZEFzd25LU2xTenRKWThteU5tUVp3Z3A5?=
 =?utf-8?B?MEhha1BhMHNmc1RPQVUyY0tiUHNkQjNJNVUyZDg3T1JPMkNKSmpzaUIxalpu?=
 =?utf-8?B?SXpSNXV4ZUZmUFVmZC9qdUZJSHk5Z3d4eGtGQnZxSlBNNVV0M1Y4SzZRNUxs?=
 =?utf-8?B?WCs3SzUyTGc2a2lXUElEQUQ5UjhmZ05YenlsbjFsUzBBUW4rb3JHVTRwbW9i?=
 =?utf-8?B?STRzMnNoTzBic2ZsTzc0cE1Gb1RheUFWRGJzbWkvUUphWHBxdkhnWWRiTy9m?=
 =?utf-8?B?bGVUeVFMNFR1VGVhUjhMUGZNZVlRbG1kUld2VlllQ3lqUGpqNUp1K0o1V2VG?=
 =?utf-8?B?Sm5MWjg2bk1QTFRUd1ZwQlNPQWRZNldGY0ttUnRVenpJMy9uY2hsTGd3OVho?=
 =?utf-8?B?YU5PR21oTTY2R1JoVnFxR0ZXejJHNHlmSXVacUk0em5xQjlBQkNGa094dGFY?=
 =?utf-8?B?ekZtczFSYXVmbFRGOTg1cGZzOG53YjJoSnVHeUdsTTRvUUszNnhWVjdRZEg2?=
 =?utf-8?B?cnI4RHhSU2d3bkN0a2t2SkpvSmw5UVNxcW9KaW5xUkN1VFQvY1k3NFMwTEUr?=
 =?utf-8?B?MUF5Qkt3QWhDQnJyS1ZEZHJsQjYyd3g4TGIvODN0akFNc281NHUwNFFDK1I1?=
 =?utf-8?B?c09YSmxCaGVWcWVtTGVtQkhPcEdsL2RvYVpIZnRzQ1hNNktRQytzeHRhNUFm?=
 =?utf-8?B?b0F6R2pzMXo3M0NxSTNVWGZiRm9la08zNzJob2dMd014Z3NnYzBLWEJNd0I4?=
 =?utf-8?B?OGVxSGprNzhhL1VscWlmWkVlanhKNGt1NnN4bTJJY0F2dnEyRDN3bXhhOER6?=
 =?utf-8?Q?YBCM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8d43ee-f84e-43cc-ac7c-08dc7a88035a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 17:52:56.9546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6E5Crhn/4lJhpc6emQT1Y5Z/8pK1RGraVBrBBXxe27mKlAy2Ovfg3k+3/afLlgvMptD2nmsr3/HvglG0N8wYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMjIsIDIwMjQg
ODozMiBBTQ0KPiBUbzogS2x5bWVua28sIEFuYXRvbGl5IDxBbmF0b2xpeS5LbHltZW5rb0BhbWQu
Y29tPg0KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5j
b20+OyBNYWFydGVuDQo+IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsNCj4gU2ltZWssIE1pY2hh
bCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm06IHhsbng6IHp5
bnFtcF9kcHN1YjogRW5hYmxlIHBsYW5lIGluIGF0b21pYw0KPiB1cGRhdGUNCj4gDQo+IENhdXRp
b246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2Ug
cHJvcGVyDQo+IGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5r
cywgb3IgcmVzcG9uZGluZy4NCj4gDQo+IA0KPiBIaSBBbmF0b2xpeSwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gTW9uLCBNYXkgMjAsIDIwMjQgYXQgMDg6MjI6MzFQ
TSAtMDcwMCwgQW5hdG9saXkgS2x5bWVua28gd3JvdGU6DQo+ID4gVW5jb25kaXRpb25hbGx5IGVu
YWJsZSB0aGUgRFBTVUIgbGF5ZXIgaW4gdGhlIGNvcnJlc3BvbmRpbmcgYXRvbWljDQo+IHBsYW5l
DQo+ID4gdXBkYXRlIGNhbGxiYWNrLiBTZXR0aW5nIHRoZSBuZXcgZGlzcGxheSBtb2RlIG1heSBy
ZXF1aXJlIGRpc2FibGluZw0KPiBhbmQNCj4gPiByZS1lbmFibGluZyB0aGUgQ1JUQy4gVGhpcyBl
ZmZlY3RpdmVseSByZXNldHMgRFBTVUIgdG8gdGhlIGRlZmF1bHQgc3RhdGUNCj4gPiB3aXRoIGFs
bCBsYXllcnMgZGlzYWJsZWQuDQo+IA0KPiBBaCwgSSB3ZW50IHRocm91Z2ggdGhlIGNvZGUgYW5k
IEkgc2VlIHRoYXQuIE9vcHMuDQo+IA0KPiA+IFRoZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgcGxhbmUgYXRvbWljDQo+ID4gdXBkYXRlIGVuYWJsZXMgdGhlIGNvcnJlc3BvbmRpbmcg
RFBTVUIgbGF5ZXIgb25seSBpZiB0aGUgZnJhbWVidWZmZXINCj4gPiBmb3JtYXQgaGFzIGNoYW5n
ZWQuIFRoaXMgd291bGQgbGVhdmUgdGhlIGxheWVyIGRpc2FibGVkIGFmdGVyIHN3aXRjaGluZw0K
PiB0bw0KPiA+IGEgZGlmZmVyZW50IGRpc3BsYXkgbW9kZSB3aXRoIHRoZSBzYW1lIGZyYW1lYnVm
ZmVyIGZvcm1hdC4NCj4gDQo+IERvIHdlIG5lZWQgYSBGaXhlczogdGFnIG9yIGhhcyB0aGlzIGlz
c3VlIGJlZW4gdGhlcmUgc2luY2UgdGhlIGJlZ2lubmluZw0KPiA/DQoNClllcywgdGhpcyB3YXMg
aW50cm9kdWNlZCBpbiB0aGUgaW5pdGlhbCBkcml2ZXIgY29tbWl0Lg0KDQo+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuYXRvbGl5IEtseW1lbmtvIDxhbmF0b2xpeS5rbHltZW5rb0BhbWQuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMgfCA1ICsrLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4gaW5kZXggNDNiZjQxNmIz
M2Q1Li5jNGYwMzhlMzQ4MTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2ttcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5j
DQo+ID4gQEAgLTEyMCw5ICsxMjAsOCBAQCBzdGF0aWMgdm9pZA0KPiB6eW5xbXBfZHBzdWJfcGxh
bmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4gPiAgICAgICAgICAg
ICAgIHp5bnFtcF9kaXNwX2JsZW5kX3NldF9nbG9iYWxfYWxwaGEoZHBzdWItPmRpc3AsIHRydWUs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBs
YW5lLT5zdGF0ZS0+YWxwaGEgPj4gOCk7DQo+ID4NCj4gPiAtICAgICAvKiBFbmFibGUgb3IgcmUt
ZW5hYmxlIHRoZSBwbGFuZSBpZiB0aGUgZm9ybWF0IGhhcyBjaGFuZ2VkLiAqLw0KPiA+IC0gICAg
IGlmIChmb3JtYXRfY2hhbmdlZCkNCj4gPiAtICAgICAgICAgICAgIHp5bnFtcF9kaXNwX2xheWVy
X2VuYWJsZShsYXllcik7DQo+ID4gKyAgICAgLyogRW5hYmxlIG9yIHJlLWVuYWJsZSB0aGUgcGxh
bmUuICovDQo+ID4gKyAgICAgenlucW1wX2Rpc3BfbGF5ZXJfZW5hYmxlKGxheWVyKTsNCj4gDQo+
IFRoaXMgc2hvdWxkIGJlIHNhZmUgZm9yIG5vdywgYXMgdGhlIGZ1bmN0aW9uIHdpbGwganVzdCB3
cml0ZSB0aGUgcGxhbmUNCj4gcmVnaXN0ZXJzIHdpdGggaWRlbnRpY2FsIHZhbHVlcy4gVGhlIHdh
c3RlIG9mIENQVSBjeWNsZXMgbWF5IG5vdCBiZSBhDQo+IGJpZyBpc3N1ZSwgZXZlbiBpZiBpdCB3
b3VsZCBiZSBiZXN0IHRvIGF2b2lkIGl0Lg0KPiANCg0KVGhlIENQVSB0aW1lIHdhc3RlZCBvbiBk
b3VibGluZyBkb3duIGxheWVyIGVuYWJsZW1lbnQgaXMgbmVnbGVjdGFibGUNCmNvbXBhcmVkIHRv
IERQIGxpbmsgdHJhaW5pbmcgdGltZS4NCg0KPiBXaGF0IGJvdGhlcnMgbWUgbW9yZSBpcyB0aGF0
IHdlIG1heSBiZSB3b3JraW5nIGFyb3VuZCBhIGxhcmdlcg0KPiBwcm9ibGVtLg0KPiBSZXNldHRp
bmcgdGhlIENSVEMgd2hlbiBkaXNhYmxpbmcgaXQgYWZmZWN0cyB0aGUgaGFyZHdhcmUgc3RhdGUg
b2YgdGhlDQo+IHdob2xlIGRldmljZSwgYW5kIHRodXMgdGhlIHN0YXRlIG9mIGFsbCBzb2Z0d2Fy
ZSBEUk0gb2JqZWN0cy4gVGhlDQo+IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdGF0ZXMgbG9zZSBz
eW5jLiBNYXliZSB0aGlzIHBhdGNoIGlzIGFsbCB0aGF0IGlzDQo+IG5lZWRlZCBmb3Igbm93LCBi
dXQgb3RoZXIgc2ltaWxhciBpc3N1ZXMgY291bGQgcG9wIHVwIGluIHRoZSBmdXR1cmUuDQo+IA0K
DQpJIGhhZCBzaW1pbGFyIHRob3VnaHRzIGFib3V0IHByb3BlciBIVyBzdGF0ZSB0cmFja2luZywg
YnV0IHRoYXQgd291bGQgYmUNCnJhdGhlciBsYXJnZSByZXdvcmsuDQoNCj4gV291bGQgaXQgYmUg
cG9zc2libGUsIGF0IGF0b21pYyBjaGVjayB0aW1lLCB0byBkZXRlY3QgdGhlIG9iamVjdHMgd2hv
c2UNCj4gaGFyZHdhcmUgc3RhdGUgd2lsbCBuZWVkIHRvIGJlIHN5bmNlZCwgYW5kIG1hcmtlZCB0
aGF0IGluIHRoZWlyIHN0YXRlID8NCj4gVGhlbiBpbiB6eW5xbXBfZHBzdWJfcGxhbmVfYXRvbWlj
X3VwZGF0ZSgpIHlvdSBjb3VsZCByZS1lbmFibGUgdGhlDQo+IGxheWVyDQo+IGJhc2VkIG9uIHRo
YXQuIFlvdSBtYXkgbmVlZCB0byBzdWJjbGFzcyB0aGUgZHJtX3BsYW5lX3N0YXRlIGlmIHRoZXJl
J3MNCj4gbm8gZmllbGQgaW4gdGhhdCBzdHJ1Y3R1cmUgdGhhdCBpcyBzdWl0YWJsZSB0byBzdG9y
ZSB0aGUgaW5mb3JtYXRpb24uDQo+IFRoZSBmb3JtYXRfY2hhbmdlZCBsb2NhbCB2YXJpYWJsZSB3
b3VsZCBtb3ZlIHRoZXJlLg0KPiANCg0KVGhhbmsgeW91IGZvciB0aGUgaWRlYSEgSSdsbCBjaGVj
ayBpdCBvdXQuDQoNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Bs
YW5lX2hlbHBlcl9mdW5jcw0KPiB6eW5xbXBfZHBzdWJfcGxhbmVfaGVscGVyX2Z1bmNzID0gew0K
PiA+DQo+ID4gLS0tDQo+ID4gYmFzZS1jb21taXQ6IDY3MzA4N2Q4YjAyM2ZhZjM0Yjg0ZThmYWY2
M2JiZWVhM2RhODdiYWINCj4gPiBjaGFuZ2UtaWQ6IDIwMjQwNTIwLWRwLWxheWVyLWVuYWJsZS03
YjU2MWFmMjljYTgNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQotLQ0KVGhhbmsgeW91LA0KQW5hdG9saXkNCg==
