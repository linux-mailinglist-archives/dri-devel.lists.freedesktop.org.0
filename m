Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1DA439B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FB810E185;
	Tue, 25 Feb 2025 09:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="D5us9oTW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.67.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8945B10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmMQXURsXi7AGpd8j4LWHXDxMGeg8ZxhqkN5s+WOK9H3/1wdCxR17P3ZT7qPVMwZObqtePEY3D69R9fG591/0Y4UJ3XWL2JU2sqKV2bk0AbKkd7s61QmK9r2SXartUWKLMK6sHOYkNPRwjirRkOokCM/BjR5/KgSX3EokxweEP0XyC3CzLKjsK7Xgt4P9AFDtB9nm4YzqqyBZxcaYOPeGsdWPtt2JnCwjl7iSDSM7gfGFwPgIt17XzbgH30C5honPC/L4est1rvsPHC3rZiz66iSS8X7phCUKT/4m07KzaO1L0B/bx5Im8wv7lLC5Hx7O0vq297RXv1MXd425kE1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txhvf9tIX/eGufgkA/Hi1wikxh7y0CK5imLbFg52UBE=;
 b=EUldxVYNTKxupBUzv/OpVS7tA9ZfQF5ha+q35i3iMKOFZXRllekD/irwLwbm/ka7R4ADjV3O+JpZkMjp98u5rb9jtowfPDVU5gOw1bilVQ5U3W6yZifBdrQbyan/G8Vn1J32Ns4rIecTdzn2fKKJoQFR1NsPKiJSzHxhbCj5JVeblFz6u7NB34VlAi18tRT1dj0g1+o6irp2uXXu+L1hYp39IklmeAhL+IfdumovCaT8+QYp98l8ObL3hmRhZiqPD+ibTSKFEb5hexaGkoxXh++1eucea9mPHxgy4k5P6N40l3OH5Soa39bRik0Y4jgcR+GIBrOnUu37xtuWZqX5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txhvf9tIX/eGufgkA/Hi1wikxh7y0CK5imLbFg52UBE=;
 b=D5us9oTWTpm5RPHhrZu0w/NhWH/zEZrCvqGxZNGHEgS4n5sDHqpgj+8ZrCURRWGwTTzTBYs93rNmGpp/RqqGKsB6R1R/XWCD2gmkpG+he8ZZL5OuupT7LYPW53OXNPaWvjTDlEuQxM0WMBRnJGCQAf7LR5JiCSHu/jxgC31CKIRnJdIxGWXQFyL08bAY6oYsIJt+uBR79ybjLDTrGTptdq0PK2F90ZzCyouCmW7BKGP4MgMpUmYIugb5HMjafvJgG5QTOJfac36lZpcZg/42/0Gp8bU/IrJOoobXF21YO5HoKlqp/E2tQljfMCmwyT3SeaEKRV1LtXcSekF61mDzGA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB5803.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:66::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 09:37:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 09:37:04 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuIgAD67QCAABL7QIAAANpQgAAHqwCAAAB7rA==
Date: Tue, 25 Feb 2025 09:37:04 +0000
Message-ID: <PN3PR01MB95976ED2D5FDC48C5F9E6EF7B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
 <PN3PR01MB95979D1B21250604F834357FB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959719792308EBB9370993DFB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <a4bc0440-5451-49e7-b7a3-9299c5200a2e@suse.de>
In-Reply-To: <a4bc0440-5451-49e7-b7a3-9299c5200a2e@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB5803:EE_
x-ms-office365-filtering-correlation-id: b3cd1422-9399-4ef8-4f0f-08dd557ff6e1
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|461199028|8062599003|6072599003|8060799006|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?TjJHTmtVTytjOXdRdmJFTC9BQktQMlNWakp5SVo0ZEZZTW41K25TdndoaUFS?=
 =?utf-8?B?NDQraWZvclJOTGVQSitSZDVZUjBKNHJtVGVTQXRiRlhUMUhMQ3pZelNYYTZU?=
 =?utf-8?B?Z1RicWpJdXdqNlI0eTc5U2tSclkzMUR3QzdpNUhhSG9uY3l5SXRWUU1wMGtZ?=
 =?utf-8?B?RDVkSE9ucXA4TDhURy9VQlBYbWRYTEpRT0RNOHUzWFBhTW4yU09sckhXUzg0?=
 =?utf-8?B?MWU2V2RLa2RHdjk3NVBGcUVLL2hXWnJLUUttNlowcGhIV05GZHFOT3RLMHdp?=
 =?utf-8?B?M3JBZkt3Uzk0ZEtmc1AycjJXdmhzSUtFdlJEbFI5aEpnbkE2ZXRzeFpYM202?=
 =?utf-8?B?M05FQmFXR2Y3bCtNZ0t4VUs5RFB3WUIxRW9yQ0R0TWIwUkRiaW0zSnBrTFJE?=
 =?utf-8?B?YnVLMzg5SHo0REtkb2VaOVJvYzZsOXI2dTVZSHRsaHZtdDBIbSt4S3pvRlp6?=
 =?utf-8?B?dnJLWFkxU0JWQUh4UXdVWS9Bc1haMmZZU3BPMm4rVkcrRE5aQ3BwaGFFRnFX?=
 =?utf-8?B?Tm8ySUVUVmhONUhMZ3JiYk40bkVxQ2VoY3VoUi9Jd29KS2hwU0h3U0JHVGJP?=
 =?utf-8?B?UVF4RzZ3R0w3eGFDaElZK0V2UUs5MDFqbzFSUXpxT3dycUlXaVZ1NFcwbjlJ?=
 =?utf-8?B?dlFEWVBHQU81Y3ppbEQrd1NHSU80eUFiNXV3R25SZGJnQ0FvVURvQVFpaC9L?=
 =?utf-8?B?SXFFWmZRT0FvRVZyUHFTZGw0K1ZkNHJGZHpQSmIrZ3BvVWdiM0NyaXBRK3Yx?=
 =?utf-8?B?ZEc3UGcwTUxtYVJNY0xqZllTRUtKODlmRVZBNjlnYUptUG5BMkZ6U1B0OVZE?=
 =?utf-8?B?NWNaaDhoWUo3Qm5kS1Fjd0ZYb2ZCaGIvL3IyMm5XS2trK3RhVHdTS0lEN0JT?=
 =?utf-8?B?UEY5VEI4bXYxY1ZEdFY0RkF1dGQ2TEpvOXlIeng1R3BZZG11NVlTSDdMUSs4?=
 =?utf-8?B?aTErSnRzdURiaHhEbGYxL0hndHRjUjRPRU5XQjBYdEtJWGRhU00rOVJ0SEQ5?=
 =?utf-8?B?S3pVcloxM3BKallxelFtOURmVmZLeFhFYjJTeDN2Y3AvNVhPcWFlVkpONEsr?=
 =?utf-8?B?dk9IRXFHay9LWVMrQnJRZHB4cGFxeXpvSTQxVzZaeVJJVnIyRThPT1VTTUsw?=
 =?utf-8?B?ZnV1R3JFbThGVFpUY3IwMzIwYU41NWRvaDI4Wlk1dTZ1TkpHVTZ4bHFjazFY?=
 =?utf-8?B?LytMVlNEZW5UWEhjOHBWVlIrdEI5NkdmZ0NPbDRmamRGYjdMY1hEcHFBWm9s?=
 =?utf-8?B?aGxwbnpzWTMzRXFYSVFheStUNllhZER5ci9aaGkvRjVuSHlNM3RnNVZzYlIw?=
 =?utf-8?B?dUsyd1llTW1NWHpGYjlRVGtVYlZPWTUrcUpSalQ2VURoZ2doWjhTVi8wVHlJ?=
 =?utf-8?B?OUtMNkhVSEplNnVhaWlEbURiYmpHa2lYYkZuamovRDk0YkpxbHpObFNtSDBk?=
 =?utf-8?B?b0wrUVk4TGNOL2EzVElNZmZjc0ZkRGp3dGc0S3BjdGpaVFVObVM4SUxNRnNB?=
 =?utf-8?Q?nvL2xQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0FyTVpkSExoaDE5eUpZcld2Lzd5M2VZbG0rc0JHUi9DK250VDdONmM2WlEr?=
 =?utf-8?B?YTJrOU1qSjRKMWs2Wk44QnFFRWczaytSN25rdUQybm5YdkpkenBhc3cxTFFa?=
 =?utf-8?B?S2RGcjNTMGtPZm1wRGNiUVF2aHZGdVRnYitBUU4vTk1zVEZNZ0FJRVRvZ2ZM?=
 =?utf-8?B?cmdPMWswUHlMQkFraHhVaFlDSUh5NlJoV1pHWStsaWV5R2g0WTE4L0F6TWZQ?=
 =?utf-8?B?N2ZTdmk3c0IvQi82T3FvL0o0alJMeGVxcUNwVE00TFJRbWZ4aGxMdkluSnF2?=
 =?utf-8?B?czhCdlhqOUkwdzFCVTA1K0J1d1ZydVVvaW5TSXZnY044ZC94d2xXdGhoQlpH?=
 =?utf-8?B?cXdld3ZnZEVoVllhTTg3Um11bCtZYldUcExiNTBMSDVaZGU2UDZYbUxHdG1J?=
 =?utf-8?B?dWN2Qm9NbmV4Z3oxMkhXUTdOdWFCOGo4cHdEYVdlS1ZrcnJtbG1mS1dyMDRN?=
 =?utf-8?B?c3kvUksrM3c4c2lRM0VyNms1Rm1qN3FvQXZXVkQ1eHNjRUJ6cjIvbTNKVWtx?=
 =?utf-8?B?Q1lBTkg5cmxTYlVrZk5aVU5VSmdvOVpEcGs3TXdML0JwTVlDcDBYcWNGUkZU?=
 =?utf-8?B?dU16KzdpQi96bUppYkUxZzdvb2swL29SV2NWWGhhQVB2VjJ1ZXp5VUJyL25S?=
 =?utf-8?B?OS9WUVNRTnpSMUxXV0piNE9qMk1ONnEyVUEyNWF5QmUvdWZYU2tpQzBTdEFn?=
 =?utf-8?B?M2ZLUXBvV1FITDNrUGFmL3V3TG5CTXNYbm44VDVzbUZrTEdBNGI3dWo4RVM5?=
 =?utf-8?B?VnBLd0N2akRVbTVDUTQ1Y0gwcTg1bTJMQkg0dGJkRlIxdkE5MDg2UHh6SFNX?=
 =?utf-8?B?MDJ2UFNFTFRjdm5hY2RGT3cxQlRNWVE1bEY5UWZsNmdxaFZhdVVNQlEyZlJ0?=
 =?utf-8?B?a3huMkJWRzVYZmdQS0wyZHpIT2lCYUNkRG1qaEl0OUEvM3hOWC9DeFZoZkgv?=
 =?utf-8?B?TmZ5V2NDWVplOWV4NEFqQ3NlV2g3MUJqVytVclpzQzRZMmcyTjZGMGNaMlNx?=
 =?utf-8?B?anJEcDZBS1pzUkVCQzFtdHdCMThJcTNtUTlRWDNyNkJNTHBxbHdEWGVFZVhr?=
 =?utf-8?B?d1dOQkhLSU9FTmdlS0NGU3lWeTB3aytjQVJUN0liemtyMUxJK01zekRwdlNo?=
 =?utf-8?B?Vm5EVEtOby90KzZjOGJpckJQQVBTNzVzRkNmeWFlWmlTaFVoNWlNa0p3N1Vi?=
 =?utf-8?B?U1dyenNuVUV2bjVjZU5GWVpXS3ZrZ2E2RXRGbVZKNTk4UmxrVE9nT0VHMzZD?=
 =?utf-8?B?RTJwY1hVQkxHWHRDa0thZ2pCb0MybmMrZ2RhVkZNYmZtZmZmNjZFelYrS25K?=
 =?utf-8?B?b0N6R2ZEYkZHZWM2alhsQnhIQjFwaUV0dUJiN0ladlBBKzBtOWVrVG9taDRJ?=
 =?utf-8?B?a1NFSUJHSTVaU0pyaU04YWwrQlB1cVBDa3oxbHlTTGYweVkzQkFING84US8y?=
 =?utf-8?B?OGxMWFYyU2ZQV2ZVZmdxOUtZdDhwVkRKRlVXQURtM1pTMEtFcThqdG0wNS91?=
 =?utf-8?B?OWlDQ0pTQjZmVFo3SzRhSXVaTjFoakc0aEhFWVlSWXFCZzlrUVNMRFJhM1RV?=
 =?utf-8?B?T2NCWmdWR2RtRDBnZUFjbG5STnI5YUd3YUNnOXNOOERpdE82bHd0cmJ3NHND?=
 =?utf-8?Q?c4bBX/G9iiV2eZUOS8lJfsyvHjtt0PGk/j+E/1Q/Ix4M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cd1422-9399-4ef8-4f0f-08dd557ff6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 09:37:04.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5803
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDM6MDXigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+PiBBbSAyNS4wMi4y
NSB1bSAxMDowNyBzY2hyaWViIEFkaXR5YSBHYXJnOg0KPj4gDQo+Pj4+IE9uIDI1IEZlYiAyMDI1
LCBhdCAyOjM04oCvUE0sIEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+IHdyb3Rl
Og0KPj4+IA0KPj4+IO+7vw0KPj4+IA0KPj4+PiBPbiAyNSBGZWIgMjAyNSwgYXQgMToyN+KAr1BN
LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4+IA0K
Pj4+PiDvu79IaQ0KPj4+PiANCj4+Pj4gQW0gMjQuMDIuMjUgdW0gMTc6NTggc2NocmllYiBBZGl0
eWEgR2FyZzoNCj4+Pj4gWy4uLl0NCj4+Pj4+PiArY29uZmlnIERSTV9BUFBMRVRCRFJNDQo+Pj4+
Pj4gKyAgICB0cmlzdGF0ZSAiRFJNIHN1cHBvcnQgZm9yIEFwcGxlIFRvdWNoIEJhcnMiDQo+Pj4+
Pj4gKyAgICBkZXBlbmRzIG9uIERSTSAmJiBVU0IgJiYgTU1VDQo+Pj4+Pj4gKyAgICBzZWxlY3Qg
RFJNX0dFTV9TSE1FTV9IRUxQRVINCj4+Pj4+PiArICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUg0K
Pj4+Pj4+ICsgICAgc2VsZWN0IEhJRF9BUFBMRVRCX0JMDQo+Pj4+PiBCdHcgSSBoYXZlIGEgZG91
YnQgcmVnYXJkaW5nIHRoaXMgZGVwZW5kZW5jeS4gV2hpbGUgaGlkLWFwcGxldGItYmwgaGFzIG1h
ZGUgaW50byB0aGUgbGludXgtbmV4dCB0cmVlLCBpdCBoYXMgc3RpbGwgbm90IGJlZW4gbWVyZ2Vk
IGludG8gTGludXMnIHRyZWUsIGFuZCBuZWl0aGVyIHRoZSBkcm0gdHJlZSBJIGFzc3VtZS4gSXQg
cG90ZW50aWFsbHkgY291bGQgY2F1c2UgaXNzdWVzPw0KPj4+PiBZZXMuIFdlIGNhbm5vdCBtZXJn
ZSB0aGlzIGRyaXZlciB1bnRpbCB3ZSBoYXZlIHRoaXMgc3ltYm9sIGluIG91ciB0cmVlLiBCdXQg
dGhhdCB3aWxsIGhhcHBlbiBzb29uZXIgb3IgbGF0ZXIuDQo+Pj4+IA0KPj4+PiBNb3JlIHByb2Js
ZW1hdGljIGlzIHRoYXQgeW91ciBkcml2ZXIgc2VsZWN0cyBISURfQVBQTEVUQl9CTC4gRnJvbSB3
aGF0IEkndmUgc2VlbiwgdGhpcyBzeW1ib2wgaXMgdXNlciBjb25maWd1cmFibGUsIHNvIHRoZSBk
cml2ZXIgc2hvdWxkbid0IHNlbGVjdCBpdC4gWW91IG5lZWQgdG8gdXNlICdkZXBlbmRzIG9uJyBp
bnN0ZWFkIG9mICdzZWxlY3QnIGhlcmUuDQo+Pj4gTG9va2luZyBhdCB0aGlzIGFnYWluLCBtYXli
ZSBpdCBzaG91bGQgYmUgc2VsZWN0ZWQuIElmIHlvdSBzZWUgdGhlIGtlcm5lbCBjb25maWcgb2Yg
VElOWURSTV9IWDgzNTdELCB3aGljaCBpcyBhbHNvIGluIGRybS90aW55LCBpdCBpcyBzZWxlY3Rp
bmcgQkFDS0xJR0hUX0NMQVNTX0RFVklDRS4NCj4gDQo+IFRoaXMgZHJpdmVyIGRvZXMgaXQgd3Jv
bmcuDQo+IA0KPj4gVG8gbWFrZSB0aGluZ3MgbW9yZSBjbGVhciwNCj4+IA0KPj4gMS4gaGlkLWFw
cGxldGItYmwgaXMgZm9yIHRoZSBiYWNrbGlnaHQgb2YgdGhlIHRvdWNoYmFyLiBUaGUgRFJNIGNv
ZGUgcmVtYWlucyBzZXBhcmF0ZS4NCj4+IDIuIGhpZC1tdWx0aXRvdWNoIGlzIHRvIG1ha2UgdGhl
IHRvdWNoYmFyIGEgdG91Y2ggc2NyZWVuLiBZb3UgY2FuIHN0aWxsIHVzZSB0aGUgZHJpdmVyIHdp
dGhvdXQgdGhlIHRvdWNoIGZ1bmN0aW9uYWxpdHkuDQo+IA0KPiBJZiB5b3VyIGRyaXZlciBkb2Vz
IG5vdCByZXF1aXJlIHRoaXMsIGl0IHNob3VsZG4ndCBzZWxlY3Qgb3IgZGVwZW5kIG9uIGl0Lg0K
DQpDb3VsZCB5b3UgZXhwbGFpbiBtZSBpbiB3aGF0IHNpdHVhdGlvbnMgd291bGQgc2VsZWN0IGJl
IHVzZWQ/
