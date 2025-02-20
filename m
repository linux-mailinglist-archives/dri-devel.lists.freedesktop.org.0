Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB8A3E249
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 18:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B156C10E9C0;
	Thu, 20 Feb 2025 17:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="GQa+zkQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011029.outbound.protection.outlook.com
 [52.103.67.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CA110E9C0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 17:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObtEztJcokjuL+JOrvgw+bF8Lvj/l5KyYN1BnrZ0F7bRinkVsgXwcKpy5rkELXA03d8E5OTAQ1dare4YHrBvMm2QvL2YDn8Sv/zfHS1Ms4mg2ZpaEx2S1IpoIZ7gkMOEvx1h3swQNYDyzWF1JvHtO68X+wk5E5+IXoCoAvhC5jGBz4+zD19GjkosVIAVgy/hPPDOGIYFrWOmtzEZCAQbc8VMNZ7OibSQ0oQojzZnenFZpkdSOi3ZX9839JsDLw9zE0aTH5w++E3+LVfUa43BiFWEgfixX9d9gJ6JLkTmSb+WP/FWYrot45/Uk++jFe9xeW1nikOUucUBNKwEXi9pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh66DsIT+EpXly5YI7gI1CqyUe8LjTrORj/j2kFXR6Y=;
 b=jRSlUcd66Va41XJF8TI43fH1Y3kLwfqBdkzf+2PLBgEW8bOYpkvVUc/ceVHOgddo5QQFTO+SuWoj8XCG7/NqkXNnCtR/fwB+9Yt6bobPxsRVHcp76DmK0UNL4OdV2iCc4F/6kX/ftZA/STswsElZ+N1GmbvImH/JfPmWeztTpkgDdViN0sEzTuCb9MPf3lv5bq5+oe/DOMt5JFt3gV9GMNp5unEx8BHZigUPYtum3B0l5BG6LEGw6Fc6IopCX/ChKwVzl+mb0iqYa2cjo89L+otQQNjjb1P9iv7nBJ76K1RDWZe2PQ2Mu1Xd3M1CEKMuswP2R5/5GWZ9/0FVg1w6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh66DsIT+EpXly5YI7gI1CqyUe8LjTrORj/j2kFXR6Y=;
 b=GQa+zkQslH8+gZsxFDJMZnb+9v722uWKJC/TGVFsy+KhjAvL+5bDN/URJt9llP+3yWOAplSQzUbhf2IyoHrG1Y8c+JsStbSZmfo6HPEwQ5RaCALzqRlQsAIfsrhQzZcG49WZTtiVQBhSzqRxpTPG1blPAAlYCGdw6720YMilowqW8SOS4aEEfA9MvIIB0DNN79M709KUxGpgqtu35iEMaDTEY6KuTf6XHqxxJtTcMI046L104wrgDcr8DXBiMXPKTHCzkRfdBHIqYofK2aC6NU5dDo9uvpAz4AV4d+MC1Oz9koxW34KsYsyU6Aths3yD0J58fIvuewRd5GFEzVLdrQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MAZPR01MB5640.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:63::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 17:23:53 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 17:23:52 +0000
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
Thread-Index: AQHbgW0jg2AkJlVClEWW91xnm1SunLNM14qAgACoYwCAAMUBAIACMJSA
Date: Thu, 20 Feb 2025 17:23:51 +0000
Message-ID: <2FCD4AA0-9376-4238-995C-9C287A3FDF8D@live.com>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
 <BC25CBDD-D101-49DA-B10B-F47F1CAE2A6F@live.com>
 <81826e1b-1ec8-4665-9682-2a57c95f06d3@suse.de>
In-Reply-To: <81826e1b-1ec8-4665-9682-2a57c95f06d3@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MAZPR01MB5640:EE_
x-ms-office365-filtering-correlation-id: bc999e56-16d3-4d4d-2e0b-08dd51d35816
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|8062599003|461199028|7092599003|15080799006|3412199025|4302099013|10035399004|440099028|41001999003|12091999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?U0EwQjdYREUyYlZUVjhqcEs3aXQrQ2lIMlBINDdDVmhKQ1dOa25CNkdIVXp1?=
 =?utf-8?B?SkJkY2N6RWJDTVV2U25WQktLZVg0clFsbDJQMGF0bktQNERHbTdyWXdyRG9a?=
 =?utf-8?B?aDFYbUZhc25tRnppei9Id0JVWTFMTzBocDZKS2R3eGRGNTlNU0tMRVlZR3dp?=
 =?utf-8?B?TmthaGhKaU1sOVUzdXkxWGhTbGhIbEVGNEhwYlUyQmo0blh3Kyt6OUMybmlz?=
 =?utf-8?B?UmhhQjlNK2VkUUNXZndCRzNKV1BTMitJZVlRaHM0WXMxRGl5QlkrUGg2OHUx?=
 =?utf-8?B?LzFmZC93ckxqNjhKbi9VZ1lPYjFuVE12aFNKKzVHRHBNZkNBOTNqSldOUHJI?=
 =?utf-8?B?OGF2K3NWZzNsTGJTUWFESkFSd2JDSUtGV010RzByek5ieWlDd0gvaGM1aVpy?=
 =?utf-8?B?MmNBVGdhcU1yaWpyQUx1VmRIV2RWZ2krVDNETWd0L21zNlFjQkFNTnFHMThx?=
 =?utf-8?B?UUtpYXp3ZTlWdUlLdVM2NTM3NC9JZmI0M3ZmdWpmbG9tb0Jmak81ZzJ4Ylhi?=
 =?utf-8?B?UGpwWVNVYzg3QXlPdXY3NnAzLzgzTXBnLy9IMDJ0a0RmSTBOcWRodzdtei8x?=
 =?utf-8?B?ZWR4RFVkSnAvTEs5VUpJOWNBRVlHeDNGeXZ0MitiWCs3WFFTMjF0TXc2ZzNs?=
 =?utf-8?B?cXdhMHV2QzN1YmdDYVpCTU5wTDNVWFp0M3YzZ0ZXUGtWRjlia0pBb1dqTDZo?=
 =?utf-8?B?ZGt6VXZxZ1dqZExXb3JVM0psRzVSa3Uyb0NFbk5OeWExdTUxTHAyWHRVVTJ4?=
 =?utf-8?B?VkxMVDBSbXo3ak5tYTFQbDJOcHFrK1c5NVdUbXcwSHQ1Ylkzd2o5Sm51THJu?=
 =?utf-8?B?U1N0R29xV1JhTnhhUkc0V3N0S0JaSElSVWMxUHB3eFpjMkMxSW5xeWlYQU5N?=
 =?utf-8?B?VTJIVSttb2htTU14WTI0bm5IZENFV1d5NDRlVXFkTGFoSi95b0tFbnZUWjNi?=
 =?utf-8?B?NVAyNXpORjlSb3h6d3RPazI4bjljM05kM1B6c1FYNWNkNDVYUWV3TkVrSGRx?=
 =?utf-8?B?WERNUVl2Y20xQTFnMG5ZMlFZMFZVU3lrbXZQWHl6RWZwM1BjVFEybkN4d2Fi?=
 =?utf-8?B?NVYvV0dJcHJaZSt2bDJhekMxZWQwOTl0Q2hLMGY4UXBPVGtFQnh0bXVWcGpX?=
 =?utf-8?B?eEl1d08rczFyM0I2di9hcngwdDFKME1RVDhZaVRGNzZvY3E1aDZ1WXlqckVI?=
 =?utf-8?B?am00RjZaNG8rYkwzSnhhVUQ4M0xZNklCeUNlOTQ3anFBSllJVUZaOXFEcTlI?=
 =?utf-8?B?WHhpc1RxcTZBY1pXdjhnZjFOR0NFTzV6clJyUjVYbEpzYVQ1eVRxMHRySFVq?=
 =?utf-8?B?N2hPOTlNSGttMDZFaFRRRGtIWXAwaEFNYkxPZ2EzNTBCTTJBVHZtYmdQOTdy?=
 =?utf-8?B?blJGUlhRcXl4Y2d3Y21maUtQWTdPTVhTYmFTZmFTeVByNC9PS3loSlJsenNo?=
 =?utf-8?B?V0p5b1pGUzBsTWlHMmxWb2hhYjBrZHNxdmx3ODVBQS9RVVNUNHhpaEFuTmFy?=
 =?utf-8?B?Y0RZc0o5UC9Eb1RoYVBBZVhOK2ZNbVU2Vnc4YXBUZXhqejJmaWxnQXhLdHpU?=
 =?utf-8?B?R0lmTzhJdzNQVHBNdmtuSFhoc3FCczVCNkdVWi92M1NWZEJLUlEyR0FST0c4?=
 =?utf-8?B?ZE1ZUjRHV010UUZQZmhabjBRdE95V1BjMnAramF3QVRJRCtsOElpaXBpZUNL?=
 =?utf-8?Q?3hoUdEU9PJuvS65M3HBH?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NklPTUJXcHkzR2F1aFhGUmxRNy84M0dodEJXL25zRFlNUmRwMSt2RlZrSG55?=
 =?utf-8?B?M0MydzlJaUxmbWgwdkx3YTFMaVZ6SmQ3dDVjTmlGNy9UbmtrdVZnZWtIbDdM?=
 =?utf-8?B?SmV1NUlCVzFodzJZVjdwbUxEVit1TXRCRDF0ZjJXcE5sTjhiRVJVbGpPTzNH?=
 =?utf-8?B?dk8vUGhHZnFycldQejhzOVQ1OWt1bVRXQ3JLak1yZFJvYURpYlFtR21ZQ3Mv?=
 =?utf-8?B?TWVCRGNhVW1jQUtSWjZiK2lxaEJ0ZVVadEJ1MGNXMkM0UDdoL1BSN0xrUGRl?=
 =?utf-8?B?aXV4d3hTK1owSmF4Qmh3VUpOQ0NNL2V3dFJzbkdFcy83ZmplUUt1dVUzVHAx?=
 =?utf-8?B?Ulh3UDcxUHRVUjVveWFpNVg4LzkxY2NxSHRmd1hpaDg4S213MDNNbGNaYmY5?=
 =?utf-8?B?N1lhMklaVWx5cXlVUXE2MFNzYy9QNE1rMTBOaElTZ00vSkFUMEFUWlQydzVW?=
 =?utf-8?B?WVFocjIrVFcrUjV6TTEyMHBpaFVFZ0Vod2FvOGdYNGc2Q2lIYk5aK2ZzWm1N?=
 =?utf-8?B?Zitic3l0VHgzNzA5WXpDOG5Dcy9hempTK016VzFnZ2tZQWw1MDlNdW5WbHF6?=
 =?utf-8?B?bVE2NHFoK1RaZ3JsTURiUGpWQldFOHFWbXlxS1JTWGpYczN4Zk5sVS94cjhk?=
 =?utf-8?B?cERLWTFEMmgwNzV6aVA2aTJ3ZElrZ3Y0UVMxUS9UVzA0SHdGRzFIa1ZXZHBS?=
 =?utf-8?B?YVV5cGxxRlRWVUcvMXdoS05BR01KemNzQmNDS1VPOXI5WWtrb25pbWVoTU5O?=
 =?utf-8?B?UmpNYjJYRDJoSTNaSTdYbFJtWlRQSWp3RDhzN2xsTVBIV3VodzIrMHdla0xm?=
 =?utf-8?B?ZlQ3azFWQzB4NGVweHFvRzB3cnAvQ2N5b2RyTUFPNXAxV2VsdU0zaXdHbndC?=
 =?utf-8?B?bTdjQ2VJcEZNWFN5NGxOLzdORmJ6bWIraUxMWUw2YnpJRzFtQnFpQWF4T1hw?=
 =?utf-8?B?YnhiNnNxTU1MSXpQYzRtdmZpUFZtTFl2QUI0MkU0WU9Ja3hnTzZxY0dTUEVI?=
 =?utf-8?B?Tlc4VGdKbk1jZ3NuY1JxbG5PYzVMSHR0bCtya0hpdE0yQi80S01LTTdaTTM4?=
 =?utf-8?B?bFlmZnMyS0ZNK3VMYmVOWGkyMG8yN2tjbFRiRU9GWTRUSEs2bVJMV0k0V25I?=
 =?utf-8?B?c2VqOWU3TEsvMVIwS21CUGwrZWd0cE1UODU5N0x5aU8vZGNIYWx4dUVpZ1Vx?=
 =?utf-8?B?blg1bjV2dWcrUmFsQ2tHK1dsOW9RT0ZTbWdtQlpTN29UVUhLK3NzeEkwNkhn?=
 =?utf-8?B?WjhWK1RlZnlwNDZ3UGhjRHV5V1FjUmxaMXYrY1k4TmZoNG80OUF0V0dkc1JF?=
 =?utf-8?B?Qm0yODB3Uy9qaVRqbnFBWGFsaGdLOGVZZkVUS00rY1ZPcnBCZ01CZFBzTDgx?=
 =?utf-8?B?REZrSENQbTg5bmJzdlkvbjdCbTh5elc0WGtRSUFIeWY2VC9Ec0RzTUhyYVo2?=
 =?utf-8?B?UlJQZnFYOUl0SmQ4YVcrRnZEREZqWjZxYTlCa3RoMnBZNUhOamZCOEtwM0Jr?=
 =?utf-8?B?MWJYRm1McnVlZ0NhaC9hR0V2NDlSb3VwY2l1bTAxZTdyaC9TOWdSOWRRSTh5?=
 =?utf-8?B?SDU1TWluKzQ2OWNhQVJPQ3ZuM0duUzRERTNwTG9Fc2hPaTdtK1ZkUHBXRjYy?=
 =?utf-8?B?OTl0VVNuLy9qUU5WMCtIWXAwTk5HeEw3VkVNTmFvVUtIOTdLQUhjWHVBMEdt?=
 =?utf-8?B?dE45ekRtbGNvejJXamtWYzJPbmV2SHpmQVB2MEJMc1hXbkVBcjJZOGJtblhG?=
 =?utf-8?Q?6iynpJmaFqMxeEDgFoGS3eXLIDQprdG8ctJn1d/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FED8B0F2D98D245A4F5BC2DA74B93DB@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bc999e56-16d3-4d4d-2e0b-08dd51d35816
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 17:23:51.4204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5640
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

SGkNCg0KPiBPbiAxOSBGZWIgMjAyNSwgYXQgMToyN+KAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaQ0KPiANCj4gQW0gMTguMDIuMjUg
dW0gMjE6MTIgc2NocmllYiBBZGl0eWEgR2FyZzoNCj4+IEhpDQo+PiANCj4+IEluIGNvbnRpbnVh
dGlvbiB0byBteSBwcmV2aW91cyBtYWlsLg0KPj4gDQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyBpbnQg
YXBwbGV0YmRybV9zZW5kX21zZyhzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UgKmFkZXYsIHUzMiBt
c2cpDQo+Pj4+ICt7DQo+Pj4+ICsgc3RydWN0IGFwcGxldGJkcm1fbXNnX3NpbXBsZV9yZXF1ZXN0
ICpyZXF1ZXN0Ow0KPj4+PiArIGludCByZXQ7DQo+Pj4+ICsNCj4+Pj4gKyByZXF1ZXN0ID0ga3ph
bGxvYyhzaXplb2YoKnJlcXVlc3QpLCBHRlBfS0VSTkVMKTsNCj4+Pj4gKyBpZiAoIXJlcXVlc3Qp
DQo+Pj4+ICsgcmV0dXJuIC1FTk9NRU07DQo+Pj4+ICsNCj4+Pj4gKyByZXF1ZXN0LT5oZWFkZXIu
dW5rXzAwID0gY3B1X3RvX2xlMTYoMik7DQo+Pj4+ICsgcmVxdWVzdC0+aGVhZGVyLnVua18wMiA9
IGNwdV90b19sZTE2KDB4MTUxMik7DQo+Pj4+ICsgcmVxdWVzdC0+aGVhZGVyLnNpemUgPSBjcHVf
dG9fbGUzMihzaXplb2YoKnJlcXVlc3QpIC0gc2l6ZW9mKHJlcXVlc3QtPmhlYWRlcikpOw0KPj4+
PiArIHJlcXVlc3QtPm1zZyA9IG1zZzsNCj4+Pj4gKyByZXF1ZXN0LT5zaXplID0gcmVxdWVzdC0+
aGVhZGVyLnNpemU7DQo+Pj4+ICsNCj4+Pj4gKyByZXQgPSBhcHBsZXRiZHJtX3NlbmRfcmVxdWVz
dChhZGV2LCAmcmVxdWVzdC0+aGVhZGVyLCBzaXplb2YoKnJlcXVlc3QpKTsNCj4+Pj4gKw0KPj4+
PiArIGtmcmVlKHJlcXVlc3QpOw0KPj4+IFRoaXMgaXMgdGVtcG9yYXJ5IGRhdGEgZm9yIHRoZSBz
ZW5kIG9wZXJhdGlvbiBhbmQgc2F2ZSB0byBmcmVlIGhlcmU/DQo+PiBQcm9iYWJseSB5ZXMuIElm
IEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGl04oCZcyBuZWVkZWQgdG8gbWFrZSB0aGUgdG91Y2hi
YXIgZ28gaW50byB0aGUgZGlzcGxheSBtb2RlLCBmcm9tIHRoZSBoaWQga2V5Ym9hcmQgbW9kZS4N
Cj4+IA0KPj4gV2UgaGVyZSBhcmUgZG9pbmcgdGhlIHNhbWUgYXMgdGhlIFdpbmRvd3MgZHJpdmVy
IFsxXSBmb3IgdGhpcyBkb2VzLg0KPj4gDQo+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2ltYnVz
aHVvL0RGUkRpc3BsYXlLbS9ibG9iL21hc3Rlci9zcmMvREZSRGlzcGxheUttL2luY2x1ZGUvRGZy
LmgjTDMNCj4gDQo+IFllYWguIE15IGNvbmNlcm4gd2FzIHRoYXQgcmVxdWVzdCBpcyBiZWluZyBm
cmVlZCB3aGlsZSB0aGUgVVNCIHNlbmQgb3BlcmF0aW9uIGlzIHN0aWxsIHVzaW5nIGl0LiBCdXQg
aW4gdGhlIFVTQiBjb2RlLCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0aGF0Lg0KPiANCg0KRm9yIHRo
aXMsIHdlIGFyZSB1c2luZyB1c2JfYnVsa19tc2cgWzFdIHdoaWNoIGlzIGEgc3luY2hyb25vdXMg
ZnVuY3Rpb24sIHNvIGl0IG9ubHkgcmV0dXJucyBvbmNlIHRoZSBkYXRhIGlzIGNvbXBsZXRlbHkg
c2VudC4NCg0KU28gSU1PIGl0cyBzYWZlIHRvIGtmcmVlKHJlcXVlc3QpOyBoZXJlLg0KDQpbMV0g
aHR0cHM6Ly9tYW5wYWdlcy5kZWJpYW4ub3JnL2plc3NpZS1iYWNrcG9ydHMvbGludXgtbWFudWFs
LTQuOC91c2JfYnVsa19tc2cuOQ0KDQo=
