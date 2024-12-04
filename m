Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450E9E33A3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 07:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7015B10EC01;
	Wed,  4 Dec 2024 06:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kP/QFa4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483B10EC01
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 06:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDp9Aw09UkKzYanalFIIoEb2P+l+q4bbVxWBNE4HJvjC0JGm9TScfD7g0P/E5zRFxJco65bMg4BGlvne9rjFmk4e7h7RZ7iNg/ESs+Y7xZ5P0rHX3EibTJ0UeMNMwa07M2qN0cA6eqAKiucGMQFo+mR+Q9+31K+9NjD78xee492mhuEgX2UF5oyREMKeX4MiHZj7mD2BMYB400HN+dFOCzcF16x5n1J3LlQIaAV2gTun+EufhiG2iL/mshUKbcsnqnUBqwTNtbgc8g1fXCJSA2w+OnJFh5/8WlwJf6YShKDej00GMkgGq9jKO3RbgrmhrLjFtL5wz1D0Ad1FyjWIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vg67g2YXVF/bhiiOAKkJaso1G6DoofIFabHpISKcdM=;
 b=YHMRFlnnNO6+dpEW8x7wmoIPbgtLbv6ctewUY3D8yWyw3uqmVUCzivIPZth2EQHpLg8kJOcEdOFCqOS/CLnYrt+Py2j5b4OQf64H+Rber8nMAjHWY5MwtBYkA4WrsaYmVtyZZuDtENR603HKHjAkoVdfsKFRuq9WOB3EEKGC1/ETK7FZRyEOJVLnNlsv0WaNFqZhWvX4fTV1DenQY/lsf4K9TbG+UX107QzyGh7u0WlybmAna9iemcy7hxEbjnyzmo8fDVKklYQXpHwj2CV6UkZZzDVdLVdVzWIrwAhbUmbEgcmHmsR5O2RqB0Q41P1pbPesIBz6xOCC7C/p4nZiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vg67g2YXVF/bhiiOAKkJaso1G6DoofIFabHpISKcdM=;
 b=kP/QFa4LEWM7KXl1Wg/bSyRfhNo9qVgA1sEAtXi1H5y3i2AHB4+K3ns6idk7kpI5yuLrAj3AWKvsLPXwN0T/AxNfgOgK4OmmmPiU2BBNcZGCp31mAY/w3dskQciZBlU4MJbtUDcI2wAc+51LVCGrWaIN9rrnCB2CNeBTF3pZVhQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13697.jpnprd01.prod.outlook.com (2603:1096:604:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Wed, 4 Dec
 2024 06:45:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Wed, 4 Dec 2024
 06:45:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, "tomm.merciai@gmail.com"
 <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Index: AQHbRafhYhDs5vdfJ0a+HUDeBItd1LLUyJ2AgACpQ4CAADJI0A==
Date: Wed, 4 Dec 2024 06:45:37 +0000
Message-ID: <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
 <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
In-Reply-To: <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13697:EE_
x-ms-office365-filtering-correlation-id: 89c44f4f-b305-4353-215f-08dd142f4313
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aERZaUc2OTQyUjQ1NjJiOXYvNDZGUjk5TWl3eTdnRzB6LzMxUytEN3JUYVkw?=
 =?utf-8?B?bFV5RVdlYmZ1L2ttZ2paT05EN3R3M1BNZlJLcjNocTRINTdEcWxxUGlSOFBM?=
 =?utf-8?B?VWZ4aXRKeW9zejUxcitCZmlDUmowZU9XeDVQREZsdjEvVEh4TW5vQzNOSFZi?=
 =?utf-8?B?Y1JXTmtVbE1mWHVEZWFUTVI1eFFodTFDd3FxUXF4ZnFKdkcwMDdBMFg0RVBO?=
 =?utf-8?B?WUpzVHpOQ1lxMnNCUlJMNEZRYmpMRUt6N1E0UlRCbXg0YzVReVJEWUc5VVhG?=
 =?utf-8?B?VlZXMzFoWWhmaS9UUDc5eXZUcmsrei9MbG1ObmdsNDAwSHoyQzN5VHJ5ZTht?=
 =?utf-8?B?QmFHaU4vakFiajk5dy9DbHdicHlGQmlaQnNCMUZqTzUrWUlzSUo0ak4wUmY2?=
 =?utf-8?B?R3dNVStLMTNSbzBZZ0JWNTlacmpQVzlxYS81TkFnWCtvQ0tLOUc1SUplQTFH?=
 =?utf-8?B?STlKODBZOHB2QUdxUjRoVU81ZWFmK1daQ1pZNVg4ek02S3JLZHJtYkhXYU92?=
 =?utf-8?B?VzMzWm1YWDZjL3NsL25FY2laSXRNZUpDS2RsMWQ0SzVJVTJETDRrR2lURlRO?=
 =?utf-8?B?TTh2c001c1VnRGdDcWZZY0RmdmlSM2hjTkxHM0JhbHR4dFNENmdmeXd2WTB6?=
 =?utf-8?B?aVMzeVFFRU5kZW9adDJKNWhQaHdpa3BOMGRVZmhZUjhGSW1zR1lmQWZKMURB?=
 =?utf-8?B?RTRKWlNIWDV2NGZ5a2Nwa293RWhKWkNSYnRHLzBRYmdPRG5JWndHbzJmSUZi?=
 =?utf-8?B?cE9EbHJCalZzLzNHRm1oZlpHQStsekxmU3Z2QnBpV3dKd2VRSitWak9CdlZH?=
 =?utf-8?B?VExaVWNLWC80M3BKVUpWdjZWSW9NVHFIaTREREw2YWR2NXQzVXJaUkdoQ3Bv?=
 =?utf-8?B?SzNKQUZBYXpPTExxYkNIZThPYUtlRTl1Q0hwalAxRTE5Y3JiZSsvTFhtdFR4?=
 =?utf-8?B?ZW1jdTBTUFgxalJ0cmFCdUFLMXZmR0hBQ1F4dDNaN09PaTkrRjhEVVMwRGpN?=
 =?utf-8?B?WHBHNThFVTErZnBIQzJJZjdyY1l4bjFWRlgwN1VaSU8xQllWWWozUU11b28x?=
 =?utf-8?B?R1JEUEl0c21oeHRJOUVnQ01pUnpWdnhGL0d4Nk9naEJ2TEduM3h5amluNnli?=
 =?utf-8?B?OEszRDlZMWs4UU9wTkhOT0NhRDJpODROTjlBTEpFU2luQTVhWmNLQmZzOEFN?=
 =?utf-8?B?ajk4UUJIeEprbnpHK2wvcVRMZmlMdXovcC83Z1pQZGlGWmtIQVZHYS80UGhl?=
 =?utf-8?B?MGhtMkdxTFB6Y2dUMi85SFNYZG5zRzlmbTR0QXhDaVc1dXB4eDlmaFBKRjBV?=
 =?utf-8?B?N2xiSTZ3NlpZaDVtMjNlaEpFQk5aUnVrRVV1bG9KeXNKU1RpVzA4Vkh3Mm1w?=
 =?utf-8?B?ZXF3Tm9RUUhLMS9xODZmZnJJcjczb085eG9vVTl2TDRTYjNldFNlUEhNc3Fx?=
 =?utf-8?B?N1A4R3lKblRaK3BMRFRQc1lPbDBReUdrcHAyZ2w1eXBGY05xYjFmNTJXV3Nu?=
 =?utf-8?B?TmdHNWptZ0lvTWM3dVFlczl1RG9IMU0wVWVhbDhLYlF2d2lZbThpK2tORlo2?=
 =?utf-8?B?dGRTOVRndTQzSjRjUXU3bUxQQXN4M0R2QnI5RWFtaE93T21XWWlUdzBvTmxT?=
 =?utf-8?B?cXpRNEhyU0lWQVJwelh5Rlo1aEx5QXJkWHU5Um56UDJSVXk5L2IrMXg2QXZD?=
 =?utf-8?B?TFlha01XTkdzeS8xbjQ0a3NZcFpScGluQStXWm8rK3g2cEVVb1VXSExxeUdx?=
 =?utf-8?B?RjJTMkNxbkpoWHFEMVYvYlM4c3FaRCtrY3FOUFhDcEJ3R0VMb1JoaW9RQm50?=
 =?utf-8?B?dGt4S2x4ei9oUFlTMWRaSGJVLzkzajZRNll3aTJRSHI5K3c1azN4ZXFGMUxh?=
 =?utf-8?B?QkExYlYwZkhESW5SNzJJQm12Mjh1UUgrQVNxS3BHbXMzcHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmV0ZjkvR0NPRFY3OEdhMk9KYk1tZXdodDR2VGZwaW8rVS9kSnVTcU9laUVB?=
 =?utf-8?B?NnpML1NqK1NEL0phVlhNSWVrc01vWHRvd01ZWGkxTEozbHdlbTB5UDRXMUFB?=
 =?utf-8?B?UExxOFljZDd2aVhiV0ozck84NnZMWkY1dFkrWGZKQjMvQkR2aWVTMmFCVmtD?=
 =?utf-8?B?V000emRMVk1ycm01RW1wM0Rna01uRkZtZUdJdXVSUFVwUUNLNFA5V1Z4QlB2?=
 =?utf-8?B?ZVJEc1BJbTBzUU9BcXNianhCbG15VDdSbzFiNEhjaUVacG0yU2tFS000TmJI?=
 =?utf-8?B?L0IvZ3BsTXFialFpUytqWG5NcEFoSHo3cDlMVE4zelptZWl5YkRxRnd2Vi9h?=
 =?utf-8?B?dm9Tbmd5MUFSRC9NOHVpVTVCRUhSalRlVEduYmlFRjV2a2I5MlUyMkZ4ejhS?=
 =?utf-8?B?YUhSamFXQVV4NmF6Q09vTGhIWnVnaWUyN0FJTTZHaEtsNWR6VmxtNitTdmFO?=
 =?utf-8?B?VFM1V3JKNWhPUU5zRC9sUmRJRk9CUGZ0UzZ4dm5EbUE4cUw0Zjc3TUtnMTd5?=
 =?utf-8?B?MTdDWnZuUzlCQXQ4ZXF6RVRwTmg2VDFlMlhpWWdXL2ZsUVg3Szh0NGVHRFhC?=
 =?utf-8?B?MFpXeHlrTVlIWWVGVTZRaDNXemNkSWUyZitPemFqMjFCN2tEQTJCYytOZ2dF?=
 =?utf-8?B?eEJVb29qWnRkZ09tcW1xRWxCK3cwT1Avdm8ramVIVW1YVGJub1drUkE0OFUw?=
 =?utf-8?B?bFZBRDY3U1pQYjJQQUZ1NGhJNGtPdUFWNjZ0bHNJa2M4UW5qYVVDb1BMREVX?=
 =?utf-8?B?Z2hZZlVHU2tNWTA0V1pkcEZyN1FIbmxNSGh4SzdlaU1pWXZjNmxvZjFtT2pL?=
 =?utf-8?B?djBvcjUyalhKYnRNbXJIMU5RYjNxMzJTSGJKcnlCdzNWM1JldVk0THRwSTQv?=
 =?utf-8?B?VXdiazFiZ1lqdHVMRkdna25qS05pK1NJSXRNblJrVE9NUUlmYi92MVcvTDA2?=
 =?utf-8?B?YkU1ZDBSZFpVNksra0VCYVlYY3NNL1FkcllSb2dBVDZPaUNGRkFDVnJPQVVH?=
 =?utf-8?B?NEZvNXJGMXFDWVRkcFNCSnl2bEkxUHBiM09PTEFaaUo1aEhqdEtXdG1kQ0JG?=
 =?utf-8?B?ZXpneU1BQnFIdGhPaTRmZUlrNkxCc1RjWHZPS0UvQW5wYUxYQnF4ZXpQRDg4?=
 =?utf-8?B?bTN5S2xMdW5lWEpPOU0rWFpHN1VlK2dnTVh6SldVeHJ2Q1ZzSGdIOWEvbWky?=
 =?utf-8?B?NnNNS1Qvbzd1YVZRdW12VUxZNjZabTZvZ3FsdWtHbVdEWkdpR1ppUWRmN3pP?=
 =?utf-8?B?aWRuUk9sUnhNYXJ4QzA4Y09BbndmeWRZU0pVMjZ3bHBzT0d4eURqTkNKbU9O?=
 =?utf-8?B?NWhIUHI3cXUvOHIvMDJ6UEw1anNkcGdRT0lkK0F0MUNaUUNmSXE0WUFSMVVC?=
 =?utf-8?B?OVpYTjF4enN6YVp2L1hGZGZIc095Nmd5Sm9IQ1FLV3Z3QjB5QlNmL2RmaFBU?=
 =?utf-8?B?UVJKMWkvdFhNYzdiSHZoc3BsaFZqVnZqYi9rT1BBOC9QdTZuUmpyWVBsM0xC?=
 =?utf-8?B?aHFzSVVQR201ZnFNS2xjUlVMKy9RbXQwdVp2dGRXQzZQSE1PaE1EeTBESU9Q?=
 =?utf-8?B?MDRONG9rTEZMQk13ckhrZS9jSHRUNkVrdHBQbkh0TGRsdUh0N0EvV1hlaHVW?=
 =?utf-8?B?QWxpSFBhOWwyUnZ2ZXFVdVZwMWF0WFM4TC9FWCtUUXpuYjZPVjdJZmdnQWtP?=
 =?utf-8?B?WnVnd2dWdThZOUZWcUhubCtOMmZ3c1B2TFZPMlcrY2NsdWp2c0JJS3JoSmI0?=
 =?utf-8?B?QzB2V3VvM04vdEgvTkhhdGlST2pSM0svSW14NEZ5ZWczV3lBNGVwSjRtV0Uy?=
 =?utf-8?B?UU5tL3B5NTUrcjN4Z2xJQ0VyV0hCdlZjd3lXKytLZXVYL0pjU1FpN0ZROEpk?=
 =?utf-8?B?MlNocTZpZ1BBVXQwcFhqZ0hGV1Y1TWptUEJ1QWo2V2NNRVd3MmRrdG1jcjIr?=
 =?utf-8?B?c0FGSXdJemF5aUxIMG4xZWx2SVZ0bzJndXp4ODk4cXUwMndRQmNiSFRnRzZl?=
 =?utf-8?B?NWZNNGdpVDFEbHBudWNUbUUxaTlKb1Z4QXNKMUpaeE5uNUtKSURkaXNpTk9P?=
 =?utf-8?B?UTdsS3VPK1UycUdpaDdZTzdpMHMvUFFRVHJodWVhbjdwTmUwUHVZdnRiRlVC?=
 =?utf-8?B?eEJ0NmRGN1dXMm1rOGVmSS9lNndicndLb0tWS0dYN0hVUWZ4UkdhQVdyeW94?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c44f4f-b305-4353-215f-08dd142f4313
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 06:45:37.7215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HgOe8FvvwJSkzu5Wa4aR3RQqQYEdnWD1o+LNY4ekOqGsbySc8SFmKTOBdwN8A1sHpjfj9RRxPaiDkneta7ZI5Y8Dmo5Qb1p8wdBrdK+au6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13697
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMDQgRGVjZW1iZXIgMjAyNCAwMzo0
Mw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYnJpZGdlOiBpdGUtaXQ2MjYzOiBTdXBwb3J0
IFZFU0EgaW5wdXQgZm9ybWF0DQo+IA0KPiBPbiAxMi8wNC8yMDI0LCBEbWl0cnkgQmFyeXNoa292
IHdyb3RlOg0KPiA+IE9uIFR1ZSwgRGVjIDAzLCAyMDI0IGF0IDA2OjIxOjI5UE0gKzAxMDAsIHRv
bW0ubWVyY2lhaUBnbWFpbC5jb20gd3JvdGU6DQo+ID4+IEZyb206IFRvbW1hc28gTWVyY2lhaSA8
dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+Pg0KPiA+PiBJbnRyb2R1Y2Ug
aXQ2MjYzX2lzX2lucHV0X2J1c19mbXRfdmFsaWQoKSBhbmQgcmVmYWN0b3IgdGhlDQo+ID4+IGl0
NjI2M19icmlkZ2VfYXRvbWljX2dldF9pbnB1dF9idXNfZm10cygpIGZ1bmN0aW9uIHRvIHN1cHBv
cnQgVkVTQQ0KPiA+PiBmb3JtYXQgYnkgc2VsZWN0aW5nIHRoZSBMVkRTIGlucHV0IGZvcm1hdCBi
YXNlZCBvbiB0aGUgTFZEUyBkYXRhDQo+ID4+IG1hcHBpbmcgYW5kIHRoZXJlYnkgc3VwcG9ydCBi
b3RoIEpFSURBIGFuZCBWRVNBIGlucHV0IGZvcm1hdHMuDQo+ID4NCj4gPiBGb3IgdGhlIHBhdGNo
IGl0c2VsZiwNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnku
YmFyeXNoa292QGxpbmFyby5vcmc+DQo+ID4NCj4gPiBBIG1vcmUgZ2VuZXJpYyBxdWVzdGlvbjog
aXMgdGhlIGJyaWRnZSBsaW1pdGVkIHRvIDQgbGFuZXMgb3IgZG9lcyBpdA0KPiA+IHN1cHBvcnQg
My1sYW5lIG9yIDUtbGFuZSBjb25maWd1cmF0aW9ucz8NCj4gDQo+IEFjY29yZGluZyB0byBpdGUs
aXQ2MjYzLnlhbWwsIHRoZSBicmlkZ2Ugc3VwcG9ydHMgYWxsIHRoZSBkYXRhIG1hcHBpbmdzKGpl
aWRhLXsxOCwyNCwzMH0gYW5kIHZlc2EtDQo+IHsyNCwzMH0pIGxpc3RlZCBpbiBsdmRzLWRhdGEt
bWFwcGluZy55YW1sLiAgbHZkcy1kYXRhLW1hcHBpbmcueWFtbCBzcGVjaWZpZXMgdGhlIGRhdGEg
bGFuZXMoMy80LzUpDQo+IHVzZWQgYnkgZWFjaCBvZiB0aGUgZGF0YSBtYXBwaW5ncy4gIFNvLCB0
aGUgYnJpZGdlIHN1cHBvcnRzIDMsIDQgb3IgNSBkYXRhIGxhbmVzLg0KDQpJbiBSZW5lc2FzIFNN
QVJDIFJaL0czRSBMVkRTIGFkZCBvbiBib2FyZCwgb25seSA0IExWRFMgUnggbGFuZXMgY29ubmVj
dGVkLiBUaGUgNXRoIG9uZSBpcyB1bmNvbm5lY3RlZC4NCldoYXQgaXMgdGhlIHNpdHVhdGlvbiBp
biB5b3VyIGJvYXJkIExpdSBZaW5nPw0KDQpDaGVlcnMsDQpCaWp1DQo=
