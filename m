Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31748A3B9ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C6C10E7A6;
	Wed, 19 Feb 2025 09:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="VvmmoHWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010014.outbound.protection.outlook.com
 [52.103.68.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B56D10E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvHw4eVazZrQISWoaALvb7bjejqKoee/1Oe+pKj+Z8Fw3qRi0yWofiAHYjl8LF/7c1G1fVpmdEBEkWyi5A0gyyQYqpC5g4a9NQS1Q8XOLqVtAozQsVsntQhtKyN57pYqjlN8vF/3+Y7lDpSNguNRyq9fr7JrKCwZRVd5gx1hzwDKIOfAU9wjz/sYtQl9EMnS5zqz0T4RFP6XrGJIo0d/EZCPxqLRimR27QjF8WMTuHLI+a/zAzZsLGJourvKiUvrODwVCGDMI7J0wVnpicCR4M/dTzB5cd0WytIGnDzKqjy+v03/3p2NuI+6blxJLJK3dUgWyWBcFvfq8zVYq2uyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RFZlvv6wslF3Sz/z3dWGxoGXj7jR18ofG2dLX67LZ8=;
 b=A+rQ2eXN9M+uPRFpzqlgfj29irbEsTo8wVXUREZaRIqb0hHplRJ6rLWVPHJ2Hj4sZcOjxs2m9IxMatPvp08EXvJxHvy0WAJenw9CpDoXTYCsy2Nx5PWlWOYe2ygaQvNHi2jJbJ31Tz7omX0/aCeB36/CbxTsg182ESa0HPqG+ciTUHx+KFe/Q4jCFEuqpwhIz+exKG3w1sa6u/Ozru1dsFhmhYaUJO3Ezc4PsDlnfwxHnK2cdYmF+pjPCYK6MWniQWs4Na93EJ787qKDlvwd3FnpX2/6OcLhhBu1aAiwZ4tBYcWIM8qYyE8e9PO2l2U+i+6jh/xvPKGcCftr0XNS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RFZlvv6wslF3Sz/z3dWGxoGXj7jR18ofG2dLX67LZ8=;
 b=VvmmoHWNEyzXuwSqCSQmFOSA/7R+lZcth3jvlqG1EzBZJ8Q9jJnZxiA2AzCHratp2mHfoPRhT4vhsRe3nKMxocn2feCeG5oV+zDosa9ZlosZBBgG4KW5raB1gNh3RfirA4obAGAWT3uueNos+EnwTFA+wEFn8nQtf4CurfrZuS7cVlPvnR23AmCBoEhq8vgIst5defQ7MOHVy6KYMNsxLsTCa34zSaYAfuxcoPmxbvhWI7YKHR7KeSUQKwKkAWPQ1hW0NugDS1r9QtP0WzfjpYerwEe2GIbj+mAiZbMUdv/X0hRb7jrd932ZPPwUpDRAqqVEiUVVEp1comrxnLQSaA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB9950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 09:37:34 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 09:37:34 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Index: AQHbgW0jg2AkJlVClEWW91xnm1SunLNM14qAgAA9boCAAS6yAIAAHTcA
Date: Wed, 19 Feb 2025 09:37:34 +0000
Message-ID: <858CA9AF-6128-4974-9C98-9EC01FF4FDB1@live.com>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
 <8051F1F7-C1B0-428E-BE12-353C242EA650@live.com>
 <a88a6e48-8c55-410b-b553-8942dac3608a@suse.de>
In-Reply-To: <a88a6e48-8c55-410b-b553-8942dac3608a@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB9950:EE_
x-ms-office365-filtering-correlation-id: ec85ed1f-badc-4787-73ed-08dd50c90a3d
x-microsoft-antispam: BCL:0;
 ARA:14566002|8022599003|19110799003|461199028|15080799006|7092599003|8060799006|8062599003|102099032|3412199025|440099028|12091999003|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?Yit3TXVsOTMyMlJ2VGw5NHlTanFzMTFreWw0dWpVMzlWUitiSlBHR3RTMmp3?=
 =?utf-8?B?Z1ZOdXRnTDR5Snd5bFdaeHZwQXhIUFN2ck52MVFYVzJIQ1JiNVJ3MElXM21m?=
 =?utf-8?B?L2JsS0lpVy9HQkhhRUxBY0Jtb0p2VTZoNjRVWHNoMVUrZUIwbXh4cnFOaWpk?=
 =?utf-8?B?REY5elo1SVVuZEpCd2JyNTdJaGpjOGdkMllFS0djQWxQdXI1OUFIREc2cVV4?=
 =?utf-8?B?SmdDeEk0S1NWY3BoZXEzQSszUHJCYmRDWnhESVE4d2Fyc1plOW1kK3V4NVQv?=
 =?utf-8?B?RUJENm5sOU1OL0dwUno4eExqL2t6TjVTVUZabTlwWUJqb3dTekF0V09xbG5X?=
 =?utf-8?B?bXZBVnRmbnpIdzY0eXRtbmVuSC85VVFXV1FBMXREUFdqMXo3eXdERm1TMGVB?=
 =?utf-8?B?MURJZGlxakxEdFRrRS84UjNTZmQzNkRTWEVlZ3VOM25iN1psOFlaaEtMZWdh?=
 =?utf-8?B?WnFHeUF0M21NckxEZDlvQVFEbStjS2ZxTm1sQW5CMWJVUFNwYy93K1JDTEJG?=
 =?utf-8?B?UFpSdHh3K2lETnhlb1dtcHl1RXZwTCsrTzJlMXNOVmFqbnd1YkV1NjJVMTdB?=
 =?utf-8?B?ZE52Q2hlRUt1WXcyWXdnV2Fad3VIRUdOSlpRSkpDK0JLYmMxR29ieXVaczE5?=
 =?utf-8?B?MDY5Nm94dllHY3M4anJYNkozUkVEOWhBb2N0cUJ5aHlpUEloV3g3MFJ3NW9Q?=
 =?utf-8?B?RmZHWjZ2OTJGaklWZktRNTJPSG9ON0RnVmEzU2RTZXdzZlhqSkE3Qk5GWi9Y?=
 =?utf-8?B?b2FOZGdIY0V6RkZHM3RUY04xLzBrb2h5OGt6bCtHcExiZEJXNThxOXZaUWx1?=
 =?utf-8?B?d09hQzJobEg5YVRQMjNyVzVIWTBSVTJkY0FBRU9lOVpuM0lHWWVBOW52SGtj?=
 =?utf-8?B?MVhrdkxLTmE4NGxxUzJuLzFnaW1sR1dyT2x6U2pJa0ROTHp4SVpBTktEZmZa?=
 =?utf-8?B?LzcvSS9MbDFkc1V4bUNGZzc2dnpLNDMzUk5WT1R5WGxPQjBKRlZUcitIWllr?=
 =?utf-8?B?eUozdDNXWjNabFNPRlppRkNxY00rZHhYYzBpZ0swNFZxM1V2eE9ZWXZRQ3FH?=
 =?utf-8?B?ZG82SkZkcjM0UWJzMVFIRy9ieU4zUVpVa3JYeWpjU0FTQVVQZ1RMYjhuVi9P?=
 =?utf-8?B?TGZZKzlTNEZwdlZvWlJpdjRQSnR6a05NWk9aV083RnJheE93cTNBZCtiNUVi?=
 =?utf-8?B?b1F1S3l4Z212VnNHUCtvbVFCMDFGT09CUFNNbVpwRkhYelR6WHRKV2RBSnZO?=
 =?utf-8?B?RVZEQmhjL2V3SVk4WSt0clc0OUZ6RUtsS1V0eEowT0FZemRLTFRqR0JVMTBX?=
 =?utf-8?B?cVVXcEdDcm1FT3dXZWFaQ1FCb1lpWStxZUNuaFBxS0owcXgwVWY5c08wVVYx?=
 =?utf-8?B?Qi9WVWpWMFlua2FkUUtUUzcxUGpBakt0WDNqUkZla1N5WW1DaWgzNlVMMkR0?=
 =?utf-8?B?c3FtTGVVOUdOMUhqTzA1ZVM3bGs3NDhDQTRyYjQwUWVEb1gyL0FWZ21jRjQz?=
 =?utf-8?B?a1dNbDZmMUpsWlFOUE8rZlIwelluMmJqSzd0dEMvdnlCaWFuOFpybzBDa1ky?=
 =?utf-8?Q?Ot7GaREs3fMlcTxOPzYvJF+i0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1NNZDhpTWlnM1dhbWZBS0o0NGRnS0RZaXU2Z0Zsb2dVTGtOY0dMcHZqQXhW?=
 =?utf-8?B?UlJIRHhmTHFCMDZTQzVEUUxEeWNsN3BHYi85Qk9Rc21uRXduNGZpL2g0aGxv?=
 =?utf-8?B?MXlNbVZaS2Q5akJaVmxWTXZ3VHdnY3pkdFBmU3dONVc5T0F5bm1MRVNxaXZ1?=
 =?utf-8?B?SEdST3JaZ1FWL3RsR2xzaEdtbWE5MStzTUpPaFFxeFFhWjhZMmRjZ2R0THZK?=
 =?utf-8?B?c3ZSRStBZXNYaW1leVc1VWJUVjloaHRzSU1PVzV6WCtxbzM3MFhmK1BuNWN6?=
 =?utf-8?B?S2M5eksza0RIQUhyWHNybE1NblBpaG94N1Vsd0hzNTZWM0czaitQR1lIK1pI?=
 =?utf-8?B?STNSREwzWHJIeWFJd3l5cXk0T0ljODhmNHlyU25pb3BNaHgyKzN5K1lyalYr?=
 =?utf-8?B?bmQ3YU8xdTBpMHlIZG5lak4xSDJaTi9CUkIrcnVFdEhPa05vQkZDVmhkTHJq?=
 =?utf-8?B?cFAwdkRRM2FUbG5BK2xqRDA4Z1BPTXNsWWIvMVJWdElzU1BCMTE4UThCR1g4?=
 =?utf-8?B?RU83M3NBTkIyWlBLc1EvNmM5dDZva24zR2FFWXBhbkNaZzg1Nzcvc1FzRjJR?=
 =?utf-8?B?cVhJNUhBRXJCaVBXd3VBdmlNM1I1UmtWQkptZy9WOTNXaEVWdmR3Wkh0ZWp2?=
 =?utf-8?B?YjhHaE1QT282NWl2a0dGa0x5MEZCaEhSV3FZeVZHUVdzTy84aVM2UmV1UVEx?=
 =?utf-8?B?VnIrWXMvUnhRZ1BrRWJtK1VNeW93YUx5UWJlTUU5V3Yzd214UTVTd2NVbWJC?=
 =?utf-8?B?Nks3bGJ0UE8rclZ5ZzM0dW1TUU9LbUovY3RBMGFVdkV3ZzE4Q0laM01mUEMy?=
 =?utf-8?B?Q3pkSndXbzhLb0VkSnVodDJ6aUlYaCtNQXhQZnNuc21ycXJNSVBWV1BVaFd2?=
 =?utf-8?B?ZUpSSXc4a21vYUMzdStYVVFlUm8vbWkrMy9uck4wWlViQWZMamVWcXdId3Br?=
 =?utf-8?B?NThFMm5LSDBwcnFLVWlBOXM2d1RKdy8yNm14WS8za2dWNGR0MU1oNUFDeEYv?=
 =?utf-8?B?NmtJS0YrNnBwa0JQbmFkNWZnaXlrYXFZMEI0YTg1Zy81SzRUSW1xWXNuNzRJ?=
 =?utf-8?B?dlhYZ3NLVFpGU1EyVkpWT3loUUZaVHZFMFhuZWdPQzZhMElSSFh0STh1QlFQ?=
 =?utf-8?B?dGNuVkFsMGw2azBzR2EzYStQbjhkTGN6YUVJbzdwMFF5c2lrYWtML0lCamZS?=
 =?utf-8?B?dGdvWjJOdmdHZzBFQkVoZU5PS0Z2enVTQXlPUjQ4djJDV0l3R05QVnlKU2lE?=
 =?utf-8?B?RzRJY3Qrb0tvbDN4dk0vVXkrSWVMcmFSTmo5S1kzcGsya2ZwR1I3U2Q0bnEr?=
 =?utf-8?B?eHhYTzJGRUZSSlZRWE1tVFJja3NHbnVXZ1BHL1VDeUgydldxSmJQWlhISGVS?=
 =?utf-8?B?Z3QxOGhwcUNNK3dQYXo1TFY3TmpNT0o0TXVjclRvaWw3alRxVWovMW0zdDNw?=
 =?utf-8?B?aDAzQWZOdVRCaTdoVDlqeExZV0hkR002cFVGYzZQV2RDQ0Z2SGZJS0xnUll2?=
 =?utf-8?B?NVAwczZUZzVFSng2bzgzU2wxNFZSOVcrWjBELzZWM3laU2tQelAxVjhkUXpF?=
 =?utf-8?B?U3FRNDRNSEJKNkRvbFdVcDJ1UzVURVpJM2thbzNKU0V3YTNzY0NmWEEvcFJr?=
 =?utf-8?B?bXhIQ3FRdUhuUGsybVlvVVptajBNRkJTRHFUblkwR2lBdlJIdHRYZE5lcHl0?=
 =?utf-8?B?dVZVcDZ5cDdnSEJ6czc1anM3V3NLNlNLNWwrRXhwZGR2Sk9yalhlUWlJT2Zh?=
 =?utf-8?Q?CaK5Sir5ZkDIH4cdGBh/KKhbpmAYfvlasTWklZO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E03C8F04CA02B439F02CE08FDB4AFD3@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ec85ed1f-badc-4787-73ed-08dd50c90a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 09:37:34.6778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9950
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

SGkNCg0KPj4gSeKAmXZlIHRyaWVkIHRoZXNlIGNoYW5nZXMsIHNlZW0gdG8gYmUgYnJlYWtpbmcg
dGhlIGRyaXZlcjoNCj4+IA0KPj4g4oCUPjjigJQNCj4+IEZyb20gMTZjOTIwY2FiZjY1ZWM2NjQ2
NjNlYmUxNjExYzBjY2Y2ZTgxZGU0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206
IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQo+PiBEYXRlOiBUdWUsIDE4IEZl
YiAyMDI1IDE4OjU0OjEwICswNTMwDQo+PiBTdWJqZWN0OiBbUEFUQ0hdIGJldHRlciBlcnJvciBo
YW5kbGluZw0KPj4gDQo+PiAtLS0NCj4+ICAuLi4vYXBwbGUtdG91Y2hiYXItYWR2YW5jZWQtMC4x
L2FwcGxldGJkcm0uYyAgfCA2OCArKysrKysrKysrKysrLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEvdXNyL3NyYy9hcHBsZS10b3VjaGJhci1hZHZhbmNlZC0wLjEvYXBwbGV0YmRybS5jIGIvdXNy
L3NyYy9hcHBsZS10b3VjaGJhci1hZHZhbmNlZC0wLjEvYXBwbGV0YmRybS5jDQo+PiBpbmRleCBm
MmQ5MTEzLi5jYjEzYjM2IDEwMDY0NA0KPj4gLS0tIGEvdXNyL3NyYy9hcHBsZS10b3VjaGJhci1h
ZHZhbmNlZC0wLjEvYXBwbGV0YmRybS5jDQo+PiArKysgYi91c3Ivc3JjL2FwcGxlLXRvdWNoYmFy
LWFkdmFuY2VkLTAuMS9hcHBsZXRiZHJtLmMNCj4+IEBAIC0xMzMsNiArMTMzLDE3IEBAIHN0cnVj
dCBhcHBsZXRiZHJtX2RldmljZSB7DQo+PiAgIHN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOw0K
Pj4gIH07DQo+PiAgK3N0cnVjdCBhcHBsZXRiZHJtX3BsYW5lX3N0YXRlIHsNCj4+ICsgc3RydWN0
IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgYmFzZTsNCj4+ICsgdTggKnJlcXVlc3RfYnVmZmVyOw0K
Pj4gKyB1OCAqcmVzcG9uc2VfYnVmZmVyOw0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgYXBwbGV0YmRybV9wbGFuZV9zdGF0ZSAqdG9fYXBwbGV0YmRybV9wbGFuZV9zdGF0
ZShzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4+ICt7DQo+PiArIHJldHVybiBjb250
YWluZXJfb2Yoc3RhdGUsIHN0cnVjdCBhcHBsZXRiZHJtX3BsYW5lX3N0YXRlLCBiYXNlLmJhc2Up
Ow0KPj4gK30NCj4+ICsNCj4+ICBzdGF0aWMgaW50IGFwcGxldGJkcm1fc2VuZF9yZXF1ZXN0KHN0
cnVjdCBhcHBsZXRiZHJtX2RldmljZSAqYWRldiwNCj4+ICAgICBzdHJ1Y3QgYXBwbGV0YmRybV9t
c2dfcmVxdWVzdF9oZWFkZXIgKnJlcXVlc3QsIHNpemVfdCBzaXplKQ0KPj4gIHsNCj4+IEBAIC0z
MTEsMjQgKzMyMiw2IEBAIHN0YXRpYyBpbnQgYXBwbGV0YmRybV9mbHVzaF9kYW1hZ2Uoc3RydWN0
IGFwcGxldGJkcm1fZGV2aWNlICphZGV2LA0KPj4gICBpZiAoIWZyYW1lc19zaXplKQ0KPj4gICBy
ZXR1cm4gMDsNCj4+ICAtIHJlcXVlc3Rfc2l6ZSA9IEFMSUdOKHNpemVvZigqcmVxdWVzdCkgKyBm
cmFtZXNfc2l6ZSArIHNpemVvZigqZm9vdGVyKSwgMTYpOw0KPj4gLQ0KPj4gLSByZXF1ZXN0ID0g
a3phbGxvYyhyZXF1ZXN0X3NpemUsIEdGUF9LRVJORUwpOw0KPj4gLSBpZiAoIXJlcXVlc3QpDQo+
PiAtIHJldHVybiAtRU5PTUVNOw0KPj4gLQ0KPj4gLSByZXNwb25zZSA9IGt6YWxsb2Moc2l6ZW9m
KCpyZXNwb25zZSksIEdGUF9LRVJORUwpOw0KPj4gLSBpZiAoIXJlc3BvbnNlKSB7DQo+PiAtIHJl
dCA9IC1FTk9NRU07DQo+PiAtIGdvdG8gZnJlZV9yZXF1ZXN0Ow0KPj4gLSB9DQo+PiAtDQo+PiAt
IHJldCA9IGRybV9nZW1fZmJfYmVnaW5fY3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsN
Cj4+IC0gaWYgKHJldCkgew0KPj4gLSBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBzdGFydCBDUFUg
ZnJhbWVidWZmZXIgYWNjZXNzICglZClcbiIsIHJldCk7DQo+PiAtIGdvdG8gZnJlZV9yZXNwb25z
ZTsNCj4+IC0gfQ0KPj4gLQ0KPj4gICByZXF1ZXN0LT5oZWFkZXIudW5rXzAwID0gY3B1X3RvX2xl
MTYoMik7DQo+PiAgIHJlcXVlc3QtPmhlYWRlci51bmtfMDIgPSBjcHVfdG9fbGUxNigweDEyKTsN
Cj4+ICAgcmVxdWVzdC0+aGVhZGVyLnVua18wNCA9IGNwdV90b19sZTMyKDkpOw0KPj4gQEAgLTM4
OSwxMCArMzgyLDYgQEAgc3RhdGljIGludCBhcHBsZXRiZHJtX2ZsdXNoX2RhbWFnZShzdHJ1Y3Qg
YXBwbGV0YmRybV9kZXZpY2UgKmFkZXYsDQo+PiAgICBlbmRfZmJfY3B1X2FjY2VzczoNCj4+ICAg
ZHJtX2dlbV9mYl9lbmRfY3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsNCj4+IC1mcmVl
X3Jlc3BvbnNlOg0KPj4gLSBrZnJlZShyZXNwb25zZSk7DQo+PiAtZnJlZV9yZXF1ZXN0Og0KPj4g
LSBrZnJlZShyZXF1ZXN0KTsNCj4+ICAgICByZXR1cm4gcmV0Ow0KPj4gIH0NCj4+IEBAIC00MTUs
NiArNDA0LDE1IEBAIHN0YXRpYyBpbnQgYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIHN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0
ZShzdGF0ZSwgcGxhbmUpOw0KPj4gICBzdHJ1Y3QgZHJtX2NydGMgKm5ld19jcnRjID0gbmV3X3Bs
YW5lX3N0YXRlLT5jcnRjOw0KPj4gICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0
YXRlID0gTlVMTDsNCj4+ICsgc3RydWN0IGFwcGxldGJkcm1fcGxhbmVfc3RhdGUgKmFwcGxldGJk
cm1fc3RhdGUgPSB0b19hcHBsZXRiZHJtX3BsYW5lX3N0YXRlKG5ld19wbGFuZV9zdGF0ZSk7DQo+
PiArIHN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwbGFuZS0+ZGV2Ow0KPj4gKyBzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSA9IHBsYW5lLT5zdGF0ZTsNCj4+ICsgc3RydWN0IGFw
cGxldGJkcm1fZmJfcmVxdWVzdF9yZXNwb25zZSAqcmVzcG9uc2U7DQo+PiArIHN0cnVjdCBhcHBs
ZXRiZHJtX2ZiX3JlcXVlc3RfZm9vdGVyICpmb290ZXI7DQo+PiArIHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOw0KPj4gKyBzdHJ1Y3QgYXBwbGV0YmRybV9mYl9y
ZXF1ZXN0ICpyZXF1ZXN0Ow0KPj4gKyBzaXplX3QgZnJhbWVzX3NpemUgPSAwOw0KPj4gKyBzaXpl
X3QgcmVxdWVzdF9zaXplOw0KPj4gICBpbnQgcmV0Ow0KPj4gICAgIGlmIChuZXdfY3J0YykNCj4+
IEBAIC00MjksNiArNDI3LDIyIEBAIHN0YXRpYyBpbnQgYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5l
X2hlbHBlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIGVsc2Ug
aWYgKCFuZXdfcGxhbmVfc3RhdGUtPnZpc2libGUpDQo+PiAgIHJldHVybiAwOw0KPj4gICsgcmVx
dWVzdF9zaXplID0gQUxJR04oc2l6ZW9mKCpyZXF1ZXN0KSArIGZyYW1lc19zaXplICsgc2l6ZW9m
KCpmb290ZXIpLCAxNik7DQo+PiArDQo+PiArIGFwcGxldGJkcm1fc3RhdGUtPnJlcXVlc3RfYnVm
ZmVyID0ga3phbGxvYyhyZXF1ZXN0X3NpemUsIEdGUF9LRVJORUwpOw0KPj4gKyBpZiAoIXJlcXVl
c3QpDQo+PiArIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyBhcHBsZXRiZHJtX3N0YXRlLT5y
ZXNwb25zZV9idWZmZXIgPSBremFsbG9jKHNpemVvZigqcmVzcG9uc2UpLCBHRlBfS0VSTkVMKTsN
Cj4+ICsgaWYgKCFyZXNwb25zZSkgew0KPj4gKyByZXQgPSAtRU5PTUVNOw0KPj4gKyB9DQo+PiAr
DQo+PiArIHJldCA9IGRybV9nZW1fZmJfYmVnaW5fY3B1X2FjY2VzcyhmYiwgRE1BX0ZST01fREVW
SUNFKTsNCj4+ICsgaWYgKHJldCkgew0KPj4gKyBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBzdGFy
dCBDUFUgZnJhbWVidWZmZXIgYWNjZXNzICglZClcbiIsIHJldCk7DQo+PiArIH0NCj4+ICsNCj4+
ICAgcmV0dXJuIDA7DQo+PiAgfQ0KPj4gIEBAIC00NjQsNiArNDc4LDE1IEBAIHN0YXRpYyB2b2lk
IGFwcGxldGJkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRy
bV9wbGFuZSAqcGxhDQo+PiAgIGRybV9kZXZfZXhpdChpZHgpOw0KPj4gIH0NCj4+ICArc3RhdGlj
IHZvaWQgYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5lX2Rlc3Ryb3lfc3RhdGUoc3RydWN0IGRybV9w
bGFuZSAqcGxhbmUsDQo+PiArIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlKQ0KPj4gK3sN
Cj4+ICsgc3RydWN0IGFwcGxldGJkcm1fcGxhbmVfc3RhdGUgKmFwcGxldGJkcm1fc3RhdGUgPSB0
b19hcHBsZXRiZHJtX3BsYW5lX3N0YXRlKHN0YXRlKTsNCj4+ICsNCj4+ICsga2ZyZWUoYXBwbGV0
YmRybV9zdGF0ZS0+cmVxdWVzdF9idWZmZXIpOw0KPj4gKyBrZnJlZShhcHBsZXRiZHJtX3N0YXRl
LT5yZXNwb25zZV9idWZmZXIpOw0KPj4gK30NCj4+ICsNCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9m
dW5jcyA9IHsNCj4+ICAgRFJNX0dFTV9TSEFET1dfUExBTkVfSEVMUEVSX0ZVTkNTLA0KPj4gICAu
YXRvbWljX2NoZWNrID0gYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfY2hl
Y2ssDQo+PiBAQCAtNDc0LDYgKzQ5Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5l
X2hlbHBlcl9mdW5jcyBhcHBsZXRiZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2Z1bmNzDQo+PiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgYXBwbGV0YmRybV9wcmltYXJ5X3Bs
YW5lX2Z1bmNzID0gew0KPj4gICAudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBk
YXRlX3BsYW5lLA0KPj4gICAuZGlzYWJsZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2Fi
bGVfcGxhbmUsDQo+PiArIC5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGFwcGxldGJkcm1fcHJpbWFy
eV9wbGFuZV9kZXN0cm95X3N0YXRlLA0KPj4gICAuZGVzdHJveSA9IGRybV9wbGFuZV9jbGVhbnVw
LA0KPj4gICBEUk1fR0VNX1NIQURPV19QTEFORV9GVU5DUywNCj4gDQo+IFlvdSBkb24ndCBhbGxv
Y2F0ZSBzdHJ1Y3QgYXBwbGV0YmRybV9wbGFuZV9zdGF0ZS4gSW5zdGVhZCBvZiB0aGlzIG1hY3Jv
LCB5b3UgYWxzbyBoYXZlIHRvIHNldCB5b3VyIG93biBoZWxwZXJzIGZvciB0aGUgcGxhbmUncyAu
cmVzZXQgYW5kIC5hdG9taWNfZHVwbGljYXRlX3N0YXRlIFRoZXJlJ3MgYWdhaW4gZXhhbXBsZSBj
b2RlIGluIHRoZSBzc2QxMzB4IGRyaXZlci4NCg0KQW55IGF0dGVtcHQgbWFrZSB0byBhbGxvY2F0
ZSByZXF1ZXN0IGFuZCByZXNwb25zZSBvdXRzaWRlIGFwcGxldGRybV9mbHVzaF9kYW1hZ2Ugc2Vl
bXMgdG8gYmUgYnJlYWtpbmcgdGhlIGRyaXZlci4NCg0KSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3Rs
eSwgeW91IHdhbnQgbWUgdG8gYWxsb2NhdGUgdGhlbSBvdXRzaWRlIGFwcGxldGRybV9mbHVzaF9k
YW1hZ2UsIGluIGFwcGxldGJkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrLCBy
ZXR1cm4gLUVOT01FTSBpZiB0aGV5IGZhaWwuIEFmdGVyIHRoYXQgYWRkIGtmcmVlKHJldHVybikg
YW5kIGtmcmVlKHJlc3BvbnNlKSBpbiBhcHBsZXRiZHJtX3ByaW1hcnlfcGxhbmVfZGVzdHJveV9z
dGF0ZS4NCg0KVGhlIHNzZDEzMHggZHJpdmVyIGV4YW1wbGUgaXNu4oCZdCByZWFsbHkgaGVscGlu
ZyBtZS4gQ291bGQgeW91IHBsZWFzZSBoZWxwIG1lIG91dCBoZXJlPw==
