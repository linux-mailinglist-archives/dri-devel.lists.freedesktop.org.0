Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8189C0477
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E2E10E0F7;
	Thu,  7 Nov 2024 11:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WvNVP0Ya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6510E0F7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFvxJNvvXQGcoM8TCjw4x5rgKWr9+qpml0r6bZUUo9rUIfvYAMORLtOksKjB1OTIy64HZ3y3Y/gjNjJAE9o6WSYwirm7kgGpa3NAwKluxPsjxy+RUwo8wxQOTK8f+oro+WkHp0tl7HlRs73DGbDJDWYAe8u6BwlyZxojZ3kBdEjVS+NslvwnoWmNH/HcTtnQJ4fleFvVDCvv7DQEjg4o1XF0V/2UzbFY6kVSOOFatLBplNnNoU9ZlUtktxe17PENF1nR+qrfLcbvokWtGHaTt8Fax6yrIPV89kSU64t8dd5efRykAOYfgWg9fQBROCHP9SKzIF8edx7x2UdJsM2TnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMb1uFwmyT3G+RReHIN2dh17klp60Tgix42MOZjwCaU=;
 b=sEpt3b/ikAyyfMuXWOSrgn356zdhl68DKXW5JjPqTHlmkjtc4g0AoNUlhePN55oGAxAeqHoBZqptKIFESkdfKKlqCrkBXlgvBdrRJAKbiJCCjTAzcHWPPcW0ZXULq+/Se3PJ3VyciRyLSfgOTXTRcrgIls5wWDgI7GjHs84/fHXhg5GUlj2MpLzwrTdfLUyO5vbIDMBFrlqmHxZeWFx2pwKKjkO5afCSig5waUo6yJz6AWEId8hLNVX//EKPkML2Jp3DbV6V/s+JCX1lak7Ixw/Abmx/0ZLxnuf6B7sgBR1QcnAmbpYRq3FhrxfMjP34Ru2FqNtckZc7SBRKs9fCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMb1uFwmyT3G+RReHIN2dh17klp60Tgix42MOZjwCaU=;
 b=WvNVP0YaL+/eUL3Hrl+4ivuLKJkD8v9HbrA2yJj+EIdQ/S/TjREmfp0LGotQMJIET578+WbNmzjw31YAi1HcfkuhR5pb+ZLENjpJTSxIcDb8fb0TzgkF7hYdZScQMxiKz3Q+6xGFcLbx+696Glik5lrJKM4KpMu0pBhapMha6tY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9727.jpnprd01.prod.outlook.com (2603:1096:400:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 11:46:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 11:46:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
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
 <linux-renesas-soc@vger.kernel.org>, Hien Huynh <hien.huynh.px@renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] drm: adv7511: Drop dsi single lane support
Thread-Topic: [PATCH v3 3/3] drm: adv7511: Drop dsi single lane support
Thread-Index: AQHbMHyzzIiKSN3x6UyPDtl6awXRJrKqohAAgAEPBYA=
Date: Thu, 7 Nov 2024 11:46:23 +0000
Message-ID: <TY3PR01MB113460709976410C9E432D8AC865C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-4-biju.das.jz@bp.renesas.com>
 <20241106192438.GA21454@pendragon.ideasonboard.com>
In-Reply-To: <20241106192438.GA21454@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9727:EE_
x-ms-office365-filtering-correlation-id: fb1acb0f-6b6e-487c-ed72-08dcff21ce52
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z09OVngxdnJHZU9DTk1EbHRtMkRmRzhIZWJiWTNIZy9kRGhhSExkbERBcURs?=
 =?utf-8?B?Q1U3bStPS3l6QjZZQzlVZzdqUXU0c3F1aWoxTHcyNjdYa1Zod0NFcXF1ajYy?=
 =?utf-8?B?ZzZBeHlKUU83MEIydmJOUURIOXZvSzVweHdiVmFXN1FiYUdKRVN1cDU0ZVRJ?=
 =?utf-8?B?VmlZQmUxQ3FqRHlVQWdaZmFDOFc2dDgzd29YZVFWL0ZSeHp0d3JiWnBRMEhl?=
 =?utf-8?B?enRBZDJDcUhURnZacUpwSUhseWo4ZE55T3E5Nnl1Y2VLTVMvNWU0SVFTVFJn?=
 =?utf-8?B?VExyN3RvckFScSt6dWx3MTNjcnV0UzNsNzN5dVo3c3lvVmJrQmNleGF4REc5?=
 =?utf-8?B?RUl5QzV4TElXeG5WZVBDODdTNnNJZGloa2ozdTdRVVFGTW1VbWpzK1cwZkkw?=
 =?utf-8?B?dGdpcUtuU0MrbFhvSnJqUGx1bHZrYW9ET3VsYm9pYmVRT2hLSmtsckd3a3Fu?=
 =?utf-8?B?TzNENUVIdDN5V1JrNmJreXVFZWQ5OFQxSVlnWjJMUFd6cWhpVXYrZndtWElY?=
 =?utf-8?B?QS9vY0VnZFlOUkczditPamlidm9QWFk0eHNXYm5jOW9GSlV2bDYxdlhsSTVy?=
 =?utf-8?B?MkU0cmsydzNVWVdVNU55WVFlNm1zVE0zeU95SFRmdUw4Z21uV0FTWm5NS0Jw?=
 =?utf-8?B?Smo5MCtNVXJnSGtnV2E5Q0hQRVh1V2NKVDBDcitoLzJIZGcvTGRORUltM1ln?=
 =?utf-8?B?dkE1dUZHdEJrL2F2eWt0eVkrMy8xMk1YenF2UlNtUkZDL2dsQzN4STJaNE5R?=
 =?utf-8?B?RlN5QkxoT2dnY21QK2JsK1FBVjhsdTdwM1Z0eGM3aHU0Y1RyRGdZQXhaM0ZI?=
 =?utf-8?B?UlE4aS90RnlMOWNGUGpBQU43dnViMW9mbnNxSE00Q2NHWWNmMnAweDFmUzZE?=
 =?utf-8?B?aytLaXRCdk1lZUtrMm9POFQyQTEzUTA1MjFIMXJBWWx4YUdnTFo5MDNwcXQ2?=
 =?utf-8?B?R01NK0tJY3lHZ2JscDhBMWEyS0FvYW1yb3VZMTJtNEcxRzJmc3FHbEF4eVFB?=
 =?utf-8?B?M2xNczhLeld4WGxraVZneUdMV1NBZWUwT1RGaWRBZnplSjdFTis4VGdlVlFp?=
 =?utf-8?B?a1VOVTdZb21ybnpQTTRBb0NNSndlNFZuT2NzRXRSd3pieFNSNXVYbHhRZ0Jj?=
 =?utf-8?B?SEhmNkpTWVFHdWlaVWxpU0NGR2svUHRYT2ZjL0lyNklGV3RYekhDNWRTbTFL?=
 =?utf-8?B?UHJDSkg3RGI5Rk9KQ0MySEdXSXhJdVNBUlgycmVZVDFvVGsra1lDK1J6VnZ0?=
 =?utf-8?B?RHNhVFVOdmZ6eU10U2FIWDlPRGdpb1I2eWZZaEVCeDNuYUVBSWoxaFpqQ0Ix?=
 =?utf-8?B?SkFRWjljWDV6WTlwbFdJeThUYXFJTFdNV2REckIrNWY4elN4dnZ0SkVJNmlF?=
 =?utf-8?B?dGg0TVd5K01UVmpnM1hqSE1hZGIvOENibnpYWkZGZTJyZE1YbXZ4bHd2OGU5?=
 =?utf-8?B?K0VHbDNlc1VLY3FiQVZQeGN0dzh1d2xhdUluU0IvUDluandFV1dNVHppVkdQ?=
 =?utf-8?B?ZFZkN2Q4RHlicUN4eDlyUmxnM3RsQ1BXdG5ib2FKUHFXT25OdFJOcm1JZ2JZ?=
 =?utf-8?B?dzZhYTVmUloxZEs5S0VuNWJQTUN5emRUcFY4VnJGQVpOSkVvT2tydWNYWGtX?=
 =?utf-8?B?RzQ4bS9RUUhxSmltS3lobzI2RkJhSkFWS1NoMVhMdEdWM0t4KzNFVmV3dTlS?=
 =?utf-8?B?VHp3Z3ErUWNXVmpwV2kzSWMvUkNOMmVUN3lmcW5tLzZPSWtsS2s5ai9scmJq?=
 =?utf-8?B?YTFWdUNCdXFMZktpQmZxSXdlK1VuOHF3WitsTGlkZzBBQTczTTJvNzZ1Y1E2?=
 =?utf-8?B?ZFExR1VQdlBvVnpHekp4NG5wcktJdHQ2aEdwNWtnN1luZTRqL3EyUEw5VlFt?=
 =?utf-8?Q?XqVBG3cNwN0iR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2RpU2tUV1QxRjRpQi9sZ2tYbVJpYXptbFBTNlNzWDJCOHpEVS9qWStycmFq?=
 =?utf-8?B?RGhNbU5FNGFFVTJuUXhPeHpyeks0K3ZZTzM1L2NwMGl3cXRCeFltK0MzOExC?=
 =?utf-8?B?MnJEaUdWUW1ZSEZoR1ZQQVdsWFBmR1Z1ellybExXWittdjZhWjc0VWh1emw2?=
 =?utf-8?B?Q0R4S2dmQkNyT3YzNjRjRUVENzBvMFNreEw5SytPQjJkTjJxRDE1QVlJVERz?=
 =?utf-8?B?VG9HSDhoRGVJbDVXNzZ4V3duYU9SNXhYaHJCa0ZoUktpczlTZ01sQTFSaWhL?=
 =?utf-8?B?U254WGNlYWVmVmQrUzIwMWZUUTVlb3NNMTRLY1AvZHZzRU9lTzA1TjV2alNS?=
 =?utf-8?B?NVE3T2dWaGphSW1GbXEvcXlQM1dOVUkwcnZRN1VHVDllQ0gvMGVLcmlOV0hO?=
 =?utf-8?B?Wndtb0UrdDB6d09WTkIzVGJ1M3FtVXJzdU9uekJ1MytZS2ZnWURnaTNHSnpL?=
 =?utf-8?B?cjY0OGdUQjl5Y0pxdzQ0OTBhYUpuTkd1NDFmZFBkaDhiVGV1Sm5ydCtQQnZj?=
 =?utf-8?B?UEYxUTltZTJBRE9BOGVsQm5HWUcwck05aFBoY0d4Mm52L0hiek0rbnRXcWlU?=
 =?utf-8?B?aGlqRTN5eVV3cURoQ0dxZU1sNG5XRlM3QXFFWDFiL1h0ZjdvRmFDeHpYWTRo?=
 =?utf-8?B?RURlZW52V3llZnVDQ25ab0ZIZ2ZxbWlrWWdzRG9LUW1YM0JaT1dwSVBEdHhL?=
 =?utf-8?B?STJNMVFqeFNDYXpCWnZkNHIrZkV4eEpNUURqZ1NNRUtBemRRTTdtR01JeUc2?=
 =?utf-8?B?Ymp1a1VaYVVCV1UyZEtlNHlobjVNQTFDMUpBeFphYTE2Y0JvNVMrTnFDVzRN?=
 =?utf-8?B?YmMyVlFGQVRucXBHdFVxOEhqSnlMYWI5UDN0UmVqT0ZaUFBJSjFjVUpwVnUy?=
 =?utf-8?B?cnZ2SHFBWXBBWmp3MlR2MUNaOHdrSUIxdmlqSkNrL2swZlRvbHFMZWN3MEZM?=
 =?utf-8?B?Y2dUWXJmbmhMNlhlWHV1WUQ4L0lpL3N4c1NIQVFvV0praWJvd21WZmNHR1lW?=
 =?utf-8?B?cktWWkgrMzRDd0VsUGlBZmRSKytnWG5JU0NsN0pZclk4VjlSZUZ5QjRGaXJN?=
 =?utf-8?B?c2VNVkVhelF0NzNPbEljc1lNdGgrQy8zREdHY3J1R2E1Vmk4cDNQa3FQTU1I?=
 =?utf-8?B?UXJreXplRmxvME9KYi9lOFhZZTVDNTEzWTl3LzRqMEFMVy93T25RVW4yNWp5?=
 =?utf-8?B?aVMwWkhQVkloblIzSVcwQTZ5T1d3c01xL0EvWlBBTFhGK0lCUHZaTXZ3VSt5?=
 =?utf-8?B?WGVaS0E4NjF1MmRwZHN4UUNCenppRmxHTWNzKzRwazVtcklOTER0dGF2YVZL?=
 =?utf-8?B?dlNMMTFaTEhjSHdOSDdGUkE3SXNMTjgrekhuL1ozK00yRHEzcVI0U0kyb0lz?=
 =?utf-8?B?N1RhUW9xaWZuQXI1ZXk1M045emw4ajZRVGFYRGE3TjVqcXgycGVRSGRnWDRW?=
 =?utf-8?B?QmI2eDMrbmozeE5nNXp0OUwrdFMwY2lBd3RHSEhrVC9IQm5selhSQ1ZHTDF2?=
 =?utf-8?B?SjBTMnNhL0VGNjBONVJ4RUNmSjZYV3ZQdzJMU0tpd3BVdXNwc1ZXMzk1NTVM?=
 =?utf-8?B?b25VM01DQVhhOVNvMmlaZHd0RVd6Ujl4Ui93U2RQV0pHOE1JRUFKMTZFYk1G?=
 =?utf-8?B?WFQxTlVqTWdaTTdZZXZwaFhhZVB3emxwNTFiN09vWm5GYU5GalNrV1FJUktz?=
 =?utf-8?B?UVhOc2N6V2EzdVB6U2ZmQzliSlVYZFFTY2pDZ2t0SjdndjA5TmJHR0Vvd1VQ?=
 =?utf-8?B?UThPa0tPa3FRNEIxV1RmMDFJaEI3UXRKUi9jYmVvZSt3aXQ0bmZmT21KczVK?=
 =?utf-8?B?L3VQVEpDdnZEcElHZW5MQXRMakFScDF1WEV1cC9pY0o1bGZKZGFON3V2ZU1o?=
 =?utf-8?B?MjQ1eXdZdm4vdEVKTE5oNm10WDhkYnVlTVNlcG5FUTBlOXlQbUZGM1QxNGp5?=
 =?utf-8?B?M09JMWdZdFdVSm1QOTRKcUUwYXkzc0cyeDBrR3ZBUEQ4YkV4QSsrMThrQXFK?=
 =?utf-8?B?T2I0dXNLdnlCU0lCL3VPeG5uWGs1VzNlb1JSNndwb3JUbllwT3JnRUpucVBa?=
 =?utf-8?B?Q1hHU3dnVXllZFgwOEhwc1ZpRnN6azNPeWNmbUtQeXRjSzIxMXNBY1dhakNN?=
 =?utf-8?B?RlRCMlU4eHRvQmZSR1V0WHdueHRDM3Zkcjd4MVhHSTZmd0ttdHR4dUtQaW9M?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1acb0f-6b6e-487c-ed72-08dcff21ce52
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 11:46:23.9910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+GOLA06+2VVDYmN0YPAyB820qs4utKQaKna4nc2AR+1IcIrv7t3LS/Bwi9G374x9Tpzh97KSSE+FxvE3gIkkLl03QZ8ReVakr+K3P3xpDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9727
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
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNiBOb3ZlbWJlciAyMDI0IDE5OjI1DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy8zXSBkcm06IGFkdjc1MTE6IERyb3AgZHNpIHNpbmdsZSBs
YW5lIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4NCj4gDQo+IE9uIFdlZCwgTm92IDA2LCAyMDI0IGF0IDA2OjQ5OjMwUE0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEFzIHBlciBbMV0sIEFEVjc1MzUvNzUzMyBzdXBwb3J0IG9ubHkgMi0s
IDMtLCBvciA0LWxhbmUuIERyb3ANCj4gPiB1bnN1cHBvcnRlZCAxLWxhbmUuDQo+ID4NCj4gPiBb
MV0NCj4gPiBodHRwczovL3d3dy5hbmFsb2cuY29tL21lZGlhL2VuL3RlY2huaWNhbC1kb2N1bWVu
dGF0aW9uL2RhdGEtc2hlZXRzL0FEDQo+ID4gVjc1MzUucGRmDQo+IA0KPiBObyBuZWVkIGZvciBh
IGxpbmUgYnJlYWssIHRoaXMgc2hvdWxkIGJlDQo+IA0KPiBbMV0gaHR0cHM6Ly93d3cuYW5hbG9n
LmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9jdW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9BRFY3NTM1
LnBkZg0KDQpPSy4gV2lsbCBhZGQgdGhlIGxpbmsgdG8gQURWNzUzMyBhcyB3ZWxsLg0KDQo+IA0K
PiA+DQo+ID4gRml4ZXM6IDFlNGQ1OGNkN2Y4OCAoImRybS9icmlkZ2U6IGFkdjc1MzM6IENyZWF0
ZSBhIE1JUEkgRFNJIGRldmljZSIpDQo+ID4gUmVwb3J0ZWQtYnk6IEhpZW4gSHV5bmggPGhpZW4u
aHV5bmgucHhAcmVuZXNhcy5jb20+DQo+IA0KPiBSZXBvcnRlZC1ieSBpcyBzdXBwb3NlZCB0byBi
ZSBpbW1lZGlhdGVseSBmb2xsb3dlZCBieSBhIENsb3NlczogdGFnLg0KPiANCj4gV2l0aCB0aG9z
ZSBmaXhlZCwNCg0KVGhlcmUgaXMgbm8gcmVwb3J0IGF2YWlsYWJsZSBvbiB0aGUgd2VibGluay4g
SXQgaXMganVzdCBwcml2YXRlIGNoYXQgd2UgZGlzY3Vzc2VkIGFib3V0IHRoZQ0Kb3V0LW9mLWJv
dW5kcyBhcnJheSBpc3N1ZS4gQ2hlY2sgcGF0Y2ggY29tcGxhaW5lZCBhYm91dCBtaXNzaW5nIENs
b3NlcyB0YWcuDQoNCkJ1dCBhcyBwZXIgWzFdLCBDbG9zZXMgdGFnIHJlcG9ydCBpcyBub3QgcmVx
dWlyZWQgZm9yIHByaXZhdGUgYnVncz8/DQoNClsxXSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3VzaW5nLXJlcG9ydGVkLWJ5LXRlc3RlZC1i
eS1yZXZpZXdlZC1ieS1zdWdnZXN0ZWQtYnktYW5kLWZpeGVzDQoNCkkgd2lsbCBzZW5kIG5leHQg
dmVyc2lvbiBpZiBpdCBpcyBPSyBmb3IgeW91IHdpdGhvdXQgdGhlIENsb3NlcyB0YWcNCg0KT3IN
Cg0KV2lsbCBqdXN0IHJlbW92ZSBSZXBvcnRlZC1ieSB0YWcgdG8gbWFrZSBjaGVjayBwYXRjaCBo
YXBweS4NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFJl
dmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRl
YXNvbmJvYXJkLmNvbT4NCj4gDQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
LS0tDQo+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiAgLSBVcGRhdGVkIGNvbW1pdCBoZWFkZXIgYW5k
IGRlc2NyaXB0aW9uDQo+ID4gIC0gVXBkYXRlZCBmaXhlcyB0YWcNCj4gPiAgLSBEcm9wcGVkIHNp
bmdsZSBsYW5lIHN1cHBvcnQNCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+ICAtIEFkZGVkIHRoZSB0
YWcgIkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIiBpbiB0aGUgc2lnbi1vZmYgYXJlYS4NCj4g
PiAgLSBEcm9wcGVkIEFyY2hpdCBUYW5lamEgaW52YWxpZCBNYWlsIGFkZHJlc3MNCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYyB8IDIgKy0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+IGluZGV4
IGRlNTVkNjg3MjQ1YS4uZWMzNjBmOGI3NTA5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUzMy5jDQo+ID4gQEAgLTE3Myw3ICsxNzMsNyBAQCBpbnQgYWR2
NzUzM19wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+IHN0cnVjdCBhZHY3NTEx
ICphZHYpDQo+ID4NCj4gPiAgCW9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiYWRpLGRzaS1sYW5l
cyIsICZudW1fbGFuZXMpOw0KPiA+DQo+ID4gLQlpZiAobnVtX2xhbmVzIDwgMSB8fCBudW1fbGFu
ZXMgPiA0KQ0KPiA+ICsJaWYgKG51bV9sYW5lcyA8IDIgfHwgbnVtX2xhbmVzID4gNCkNCj4gPiAg
CQlyZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+ICAJYWR2LT5udW1fZHNpX2xhbmVzID0gbnVtX2xh
bmVzOw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
