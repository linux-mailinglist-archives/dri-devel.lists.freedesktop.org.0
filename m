Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE41A4267F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B1E10E3DE;
	Mon, 24 Feb 2025 15:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="TZrPr9oS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.68.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C45A10E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flpq+Y5c5mH4PbsqNq8qA5BdsSQs9LHyyaCMrFI09dLrNGzuQjOQeZZ52YdFP9Joh4A/HvC0ylkQRzP/RuW7Am9gerda7rkTiIvCzFHtCrQHY5t0Ssb2DtkL3pK0dgs2UO51gh4yXsF11gxQAKZd9xmky54kr/uu0vnNLeMl+b2dbIcKRlF6KUAuzd0ihWmXml9/Uakcqz+/ZI5pqnvSc1ibBAqjgcaf10qT/Xo0dmQ96GiVLBPqmOiJsjsFn+31ZXA1qsV+8cHxgO20LKWOk3hR0iLlYzR5jjdQSZDHzhKhfVH9riCK8mOmpiaUX2UoCAdkoMdInxIy4eafdiBBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxC0I7KXRCNDQ6v7gfWHys9NBRYhdNLf0ck22GxGFUc=;
 b=XjMw/5KbplXa9xiLwkcBpSTLTQlX0jsJLYitxZKerFunE0s3JtLQG617ERYM9PwLBBGdSdrqjXSQGKlLhX8t4KfwwcLlrned/6Xjy49ACoYnGrHmHHMAbmQz7CeCO0LCEOoTXD2ghoTc+9UWqtWSn9V3BdPcJJrDLm1PGKgLb/324qCyymqmPyqqlTHkYb0ZwFtYfOrAxBFwePd7ycrssA4cyUCvV1R5oelX9PILyQUnbkIpl4YV0X0JIjx3kRuz/Pf70ksVARDJRX1gC+h/rguQdQsnfzPnj6KrTkKSX9pOha0BgFHIaK9zNT7+Kzkj89DtitGCRWceA4kab+EqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxC0I7KXRCNDQ6v7gfWHys9NBRYhdNLf0ck22GxGFUc=;
 b=TZrPr9oSgh3pVFp2BKzoKwacCgO8n7Vh/OfJdV+ilLzC6fE5DIIFVS5fT8W/appKko+Pal8krv+A7fuvFB2QynmQLS68wL+qjiyCRg1cQ80wkj8Q/s73xspk4MfU+cpmz6W3wO4ZNELz4ltIYOgyXppPwzrh9HfF8Jw8Mrhqe3PlQZJBPCmJowl1BEfK0uqk4YmbLGBA7IeTiYBxCUhnUpwnsPxiS1c2BJJLyIMGsXrRXdcIU9vjxPk0T2AP5mM6XKjMO4e79A6ZebUALqjT8DbrXVLvs49cjrKeLdWfyD1Wf2SOkoBAzGczO5O/yA7U5Qfs/EHGqqBhIK+8n5xsvg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9765.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:14c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:39:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:39:56 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAIAABK8AgAAA9gw=
Date: Mon, 24 Feb 2025 15:39:56 +0000
Message-ID: <PN3PR01MB959735D463E60E2952EC0986B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yR_u6ISEQFAwsI@smile.fi.intel.com>
In-Reply-To: <Z7yR_u6ISEQFAwsI@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9765:EE_
x-ms-office365-filtering-correlation-id: 0f4c9290-60df-480e-9acf-08dd54e97d48
x-microsoft-antispam: BCL:0;
 ARA:14566002|6072599003|19110799003|8062599003|8060799006|7092599003|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?WmE5STQyajFrQmFJK010L3AzQ0MyR29lYWM4Q2xuR1BzZkdpYnhzVXZ2Y3BE?=
 =?utf-8?B?TzZTWUF4dUIyRUJYUG9KSHdXUWM0TzRQTG9iaEFucjlZQWhvRjJ4amxyeEhz?=
 =?utf-8?B?aGR2WW56cThvc0pqUHVSb1JmUkk3NWJIRGJGUjVMblhIOXEwQmd4REMwMVlu?=
 =?utf-8?B?bFNHeHN2U2drV3VmaWo3U3ZaRlpLTTdGTVR1R0MvWEZsRExOS1dsa28vRFE2?=
 =?utf-8?B?dWkvQkdRZnpTSVU4K1Z6RnBad1VGbWM4RXpxMEg5NUpUU0JmUFI2UGR3UnE4?=
 =?utf-8?B?WTZxY2dDZWwvREZvMU9LSkRPOGZwQ2t5elppK1JvUFpaWjlpM1IzdmM4SzZn?=
 =?utf-8?B?V3VHdGxPelkyRkpDaXNxamdWM1NVRHA2cDJjVGVUcDZ2VHFGSkpmM3RjZCtK?=
 =?utf-8?B?TlhRU1JRVG9DNmFPYjNBUEF1TUV4YnozOWZYejJaMkVaY1VNbW9rRGRGOGhL?=
 =?utf-8?B?WjRZeldTY3Y4TWdNYUZjbVVqbEEzdHFLa2Q3SGZDRlRiUXlWZnBEMHAxSGtm?=
 =?utf-8?B?b2lOcWNCbXNFUXRoSWNuVm1CYkgxbnNzSk92TFdpVWNURjJMZS82WjlzSmZl?=
 =?utf-8?B?VndlOUFmRkUwMEtFVUpobW1wTGFuNWtwODJ4YzJwTzdlQ1hqNFRwVTR4a2Ur?=
 =?utf-8?B?M2xLMWorelE0UnVnY2R3VURyRUVtUHF2U2xPVllTV0oydVBVNVV4UXUxZWpa?=
 =?utf-8?B?eXZqN00yN2wvcStFZ0pMYktabWZaQVpyQi82enlpREZKK3I1MFRyWC96TElO?=
 =?utf-8?B?Mm5VOElwYkFocXJGU1p2eUJsSmlWcU5RaWlxL1pnd3ZIQ3o5bDdlRStsZ1Iv?=
 =?utf-8?B?c1lESEw2NUZxOUV0blIrc0M3NGtjRmVkdkg0R0ZFZVloZmlLdzJ1cE8rS0JI?=
 =?utf-8?B?di8yb1Nzc0pMbU1aa1hVeDI0K0lNdHlCQ2RiWVZtRS9JODJrUWNUSm9jbDdU?=
 =?utf-8?B?UmlON2dvSTNra3hkMG44MUVGdGpVSGF1eGxiNnI2RlBQRDF2ai8rSGltU2VW?=
 =?utf-8?B?VktNSXUxbm1sMzBKa1JQS1ZqLzBYcVRuRzVlYWhiLzY4WDRTOTdwMEc5SlVY?=
 =?utf-8?B?cUoxSGkreHZPckxaU0JsM3lsTnUrWjVMeHRFM1EvUWhwVVk3eGdTNGJxNDEr?=
 =?utf-8?B?cFlBL29HTTQxV0tWQkpMK2ZoSjg0ekkwMHY0Y1FjaWZPRk5MSEJuejE2MmpM?=
 =?utf-8?B?L0ZRMy9XSmhrbWNHdEN2QXoyVzN2eHpRUkxkTi9CRU8za3BRajJXN1VaVWJa?=
 =?utf-8?B?ckdneUZIemNNVmUxbHVEL2ZDb3RCYnRGSTFrbS8yWTJrV1dGSGs2aUJRTXR3?=
 =?utf-8?B?Zjk1a0Ruamp6V2RweXEwWUV5U1FJYmdISHlRUUllWGx1Nkd0T2JSSGFxc3NJ?=
 =?utf-8?B?dGxGMjZEVm1SQzBZbGFERm5qTStpcDErMXZnZC9WNmxKMFpPWHU5ZGtJK2Fx?=
 =?utf-8?B?eGpZWDBHZFVoUFBuNEhDekNaNm1adzJ5M1lHSTh4VVJDUW1qMWhVRVJNTjN5?=
 =?utf-8?Q?tWZX0E=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnpLTlQ2MWZnSHBVTU5TRWpNRFdsWFExTHhvR2RBcHJTem5rdjFmQXVTNDdF?=
 =?utf-8?B?M1ZXS29RcHREa1BMMDZ3WTZKTUZGZmZQUWRNZldLWmJWRDB4ZGV0MW1TZStP?=
 =?utf-8?B?Nm0yT0FWTTNqcW9WY2xtVWVqcmdGVVJDUzlSTnEzbzdMMnZLV3hiWDQxcld3?=
 =?utf-8?B?Z1F3OE9mY0JRc1FlYXUvaVpmcXY1YXRVaTFpU3BZc0ZxZlpITkNXMTFBQkZB?=
 =?utf-8?B?VWdSYS93SWE4ZW1yZWdTNk5NYWtibnBhamhYK0xONm5qSGU2ckRObEV5K2VX?=
 =?utf-8?B?WWlGUk9OUkY0MTdRN1RMTFFqcGY2K3NDbkFuenErSndwK21FdCs5b3NCaDUx?=
 =?utf-8?B?OUt1Njd2Y1dnQzRtNFRwemwzcjdQdXUrWTlkZGRZQ2c4RHNvbmlWbmdEbnB6?=
 =?utf-8?B?aHlwZU1vdndVUXdiMDY5cWFxYkkxQUptOXJyZURTMGlBNmN0ekRtVnFDei9I?=
 =?utf-8?B?anBmdExzcHJCVWVBV3pzcWdlemVNekJTLzlWV2xhZVF2M1NDTWRMbVdXb1Iz?=
 =?utf-8?B?eFo3YnR2RWJ5VisxTEVTTWtUNjNOQXhsclV2SmZmVWFQUEhoNjlvQnNQVWZX?=
 =?utf-8?B?STJkUnVvYWY2T2ZWL3ZMME1zcExwKzhPRFdTd2ZyeXdnQVp2bXR3NlNiek1l?=
 =?utf-8?B?cVJDVVQrSktkV0M1ZUUwbFVyN0wzbWlXbjRtRU5VUFF4aEY2MjZXV2VCNzFB?=
 =?utf-8?B?bzhnQXd6U0ptUU5oanplNHFJT2E2STF4TWlRQ09jQy8vTDc5K0F0dzdvMkdx?=
 =?utf-8?B?MkFIYm9LRlVRdVdmSHlkUVRjWlM1Q1BsSjhMOFZOUzY0OGFNS1BycDZKY1hn?=
 =?utf-8?B?UUF5RDBFMkNnMGIxN2VNb0xNYW9VOHBCdlhZejRGUXBvMjg0Q1JKTkR5M3FW?=
 =?utf-8?B?SE95dXRpaExGTUN5U3FwWUNIcVlKNVAyMzhIekd3Y25jZ2p6TGN0WE9OUmU5?=
 =?utf-8?B?VEtqWXBkbWREK0FIeUdEMzlCN1kvOFBjTmdZU3Y1cjluZTRWTS94bTUvdDUv?=
 =?utf-8?B?Rm85UHB6YmFrbVJudlFBekNkcVZBVDRPTy9PeTZ6MkU2amt2dUFwRURaemVH?=
 =?utf-8?B?Z3NUMlRkakJzNFJRcFdreTFzTHcxc1MyWERRWExlb2ZnRGhhbnQwalpLRkN3?=
 =?utf-8?B?eU1oUU5FVjZOUEY5V3F3Z0JMWXZwWWh0MzdNY3loN09hRGVZWDJPSVp2TjlT?=
 =?utf-8?B?di9Ua3k5dGFkYmkvd0tEdXJoVFNFMjFUek5WMTd4V0hPY3FjRVJvRXZZSGUx?=
 =?utf-8?B?TFJnRGRVd29XWnBuaHNXQW9NTEoxT2ZHWGtsaDJCcnNTajBHalMzOUh0ays3?=
 =?utf-8?B?QWlpaG04WE1VWTBtcjNBaWdUU2ZHVVRNQlVySE5BejA2cHBLRVh2QS9FcU51?=
 =?utf-8?B?eHYzb1VsL0Q3VXdqakZXVTdyL3k4MG5nbGJ3QXNxektQcWZnT0kzSFJRWkJs?=
 =?utf-8?B?QXo3WW5HNXh4eXRTTlpSQjNubEJpTnRieVFSMTl4YkJmYmVJbFNpaGg2ODdh?=
 =?utf-8?B?UlZsN1N6aGhpZjk3YnpFakpKM0ozVFc4dWVHNVZ3RE9kd1JNN0dkSlJJVTE1?=
 =?utf-8?B?NzY2Z1RSNUViZUZBWEpORUFZRnBTdGNNYzRPNlFOMzdLSnBRbWFPK3lhNk44?=
 =?utf-8?B?TVo1bU9WVGdTWWFvZUpuRG5WRkFxRUNsalNybUlCeU1zRmNjcTNoVlZGeGxm?=
 =?utf-8?B?NGJGUkVRbmpNdjdXcGlpVU1vUWlJb004MmF1K1MzU05OT1daSlROY1d3cUZm?=
 =?utf-8?Q?fKrzzsdnt/RqtB5lkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4c9290-60df-480e-9acf-08dd54e97d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:39:56.2056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9765
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6MDfigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
MjA6MTNQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA4OjQx4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMzowMzo0MFBNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgODoyN+KAr1BNLCBhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBh
dCAwMjozMjozN1BNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4gT24gMjQgRmVi
IDIwMjUsIGF0IDc6MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdy
b3RlOg0KPj4+Pj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMTo0MDoyMFBNICswMDAwLCBB
ZGl0eWEgR2FyZyB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+Pj4+Pj4+ICsjZGVmaW5lIF9fQVBQ
TEVUQkRSTV9NU0dfU1RSNChzdHI0KSAoKF9fbGUzMiBfX2ZvcmNlKSgoc3RyNFswXSA8PCAyNCkg
fCAoc3RyNFsxXSA8PCAxNikgfCAoc3RyNFsyXSA8PCA4KSB8IHN0cjRbM10pKQ0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gQXMgY29tbWVudGVkIHByZXZpb3VzbHkgdGhpcyBpcyBxdWl0ZSBzdHJhbmdlIHdo
YXQncyBnb2luZyBvbiB3aXRoIGVuZGlhbmVzcyBpbg0KPj4+Pj4+PiB0aGlzIGRyaXZlci4gRXNw
ZWNpYWxseSB0aGUgYWJvdmUgd2VpcmRuZXNzIHdoZW4gZ2V0X3VuYWxpZ25lZF9iZTMyKCkgaXMg
YmVpbmcNCj4+Pj4+Pj4gb3BlbiBjb2RlZCBhbmQgZm9yY2UtY2FzdCB0byBfX2xlMzIuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gSSB3b3VsZCBhc3N1bWUgaXQgd2FzIGFsc28gbWltaWNrZWQgZnJvbSB0aGUg
V2luZG93cyBkcml2ZXIsIHRob3VnaCBJIGhhdmVuJ3QNCj4+Pj4+PiByZWFsbHkgdHJpZWQgZXhw
bG9yaW5nIHRoaXMgdGhlcmUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSeKAmWQgcmF0aGVyIGJlIGhhcHB5
IGlmIHlvdSBnaXZlIG1lIGNvZGUgY2hhbmdlIHN1Z2dlc3Rpb25zIGFuZCBsZXQgbWUgcmV2aWV3
DQo+Pj4+Pj4gYW5kIHRlc3QgdGhlbQ0KPj4+Pj4gDQo+Pj4+PiBGb3IgdGhlIHN0YXJ0ZXIgSSB3
b3VsZCBkbyB0aGUgZm9sbG93aW5nIGZvciBhbGwgcmVsYXRlZCBjb25zdGFudHMgYW5kDQo+Pj4+
PiBkcm9wIHRoYXQgd2VpcmQgYW5kIHVnbHkgbWFjcm9zIGF0IHRoZSB0b3AgKGl0IGFsc28gaGFz
IGFuIGlzc3VlIHdpdGgNCj4+Pj4+IHRoZSBzdHI0IGxlbmd0aCBhcyBpdCBpcyA1IGJ5dGVzIGxv
bmcsIG5vdCA0LCBidHcpOg0KPj4+Pj4gDQo+Pj4+PiAjZGVmaW5lIEFQUExFVEJEUk1fTVNHX0NM
RUFSX0RJU1BMQVkgY3B1X3RvX2xlMzIoMHg0MzRjNTI0NCkgLyogQ0xSRCAqLw0KPj4+PiANCj4+
Pj4gTGVtbWUgdGVzdCB0aGlzLg0KPj4+IA0KPj4+IEp1c3QgaW4gY2FzZSBpdCB3b24ndCB3b3Jr
LCByZXZlcnNlIGJ5dGVzIGluIHRoZSBpbnRlZ2VyLiBCZWNhdXNlIEkgd2FzIGxvc3QgaW4NCj4+
PiB0aGlzIGNvbnZlcnNpb24uDQo+PiANCj4+IEl0IHdvcmtzLiBXaGF0IEkgdW5kZXJzdGFuZCBp
cyB0aGF0IHlvdSB1c2VkIHRoZSBtYWNybyB0byBnZXQgdGhlIGZpbmFsIGhleA0KPj4gYW5kIGNv
bnZlcnRlZCBpdCBpbnRvIGxpdHRsZSBlbmRpYW4sIHdoaWNoIG9uIHRoZSB4ODYgbWFjcyB3b3Vs
ZCB0ZWNobmljYWxseQ0KPj4gcmVtYWluIHRoZSBzYW1lLg0KPiANCg0KVGhlIE1hY3JvIGlzIGp1
c3QgY29udmVydGluZyB0aGUgbGV0dGVycyBpbnRvIHRoZWlyIGhleCBmb3JtLCBidXQgc2ltcGx5
IGNhbGN1bGF0aW5nIHRoZW0gYW5kIHB1dHRpbmcgdGhlIGxldHRlcnMgaW4gY29tbWVudHMgaXMg
ZXF1YWxseSBnb29kLg0KDQo+IFJpZ2h0LCB0aGUgcHJvYmxlbSBpcyB0aGUgbWFjcm8gaXRzZWxm
IHdoaWNoIGRvZXMgcmVhbGx5IHdlaXJkIHRoaW5ncyBhbHRvZ2V0aGVyLg0KPiBVc2luZyBpbnRl
Z2VyICsgY29tbWVudCBtdWNoIGNsZWFyZXIgaW4gbXkgb3Bpbmlvbi4NCj4gDQo+Pj4+PiAoYXNz
dW1pbmcgd2Ugc3RpY2sgd2l0aCBfX2xlWFggZm9yIG5vdykuIFRoaXMgd2lsbCBiZSBtdWNoIGxl
c3MgY29uZnVzaW5nLg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hl
dmNoZW5rbw0KPiANCj4gDQo=
