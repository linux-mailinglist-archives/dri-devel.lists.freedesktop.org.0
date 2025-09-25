Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B58B9FABE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8E410E931;
	Thu, 25 Sep 2025 13:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="b4ZNiQwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021125.outbound.protection.outlook.com
 [52.101.65.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0AA10E938
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMdndKhbQt6V7HTS+32OW1HjeLFIbmZnAtksvouuA1Nbqa8al5xc0GPYyDGDCHLEwVqVNBUgI+3Cqb6vFmfrWih590KEEEJxUU8YuDTF6UyBHqnXO5y8V3qALJtrMiUiLHANs5HQAtr7u3/9/qe0UlEykhD/W7OLeUQtjRmVDPHz8ZGZwq6nGg3Ms6GV76O6CY6NNLUU5be+/oC7qcShpzHy/7PGV8NKCDI8VS4sbiFKHXsXcPr9qLPAfGJ5lEfQ0E6wchsaMgr4VeTJZ1M9xFaz0LOCM5LCkNpgfa9uMsaWBiQRHFIllwRAiJ0QkGj5Dn6QRRvb5G4P/r8km5ez0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkjXsWDAxqROYHO+f1Nvbw+VW3VerNBkn4vb3hU/v0M=;
 b=JxiK9NJTVpgyAIRzfsRY0P45pN4Wg3jPK7yQgGuEof4zb+d5n6LnZ4vVFq8Zrm8ZLPp0enHiOX68SZzis8MNzGlS+JWEil5AgkoSpK/jP6zrxsRn03GYYslfGx00Bj9Jw3knsj3o+/XDIYNIXWzFSwcwrBPitkDj7r+aYw9vy2gWQNSHjQKH7W2fjrTc+VKHQEVKBEPw6XMCyEr+KfOzHUkLgp0LORfBstW1v4b88NogySmz/Hhae3tuyku3dal2KMFi5aKBv9gIVrh02JMZ/pm3zuHhdMeJ1Ose2ymbvGJoP184Sm0odb2Qosg+Zzk2gNlNt2QC9Z9SNRL1Mhp4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkjXsWDAxqROYHO+f1Nvbw+VW3VerNBkn4vb3hU/v0M=;
 b=b4ZNiQwzLWvuiNeYQs97f9h3Ibe8QhWQWh6ISdgxvrWNtSykw1lLiN/LJnh8EuigfaFePYiwehaUcm8SljGVRueOZ5+VJtoC8mFVn3VTkboeUPuWsDejEoOZ1qqXXg7CxLTrZet8dRC2M8YT2W7Ur8C31NPK6srUqCsW0KPTX8qLzcN8r6aHVa7L9Ujx4NujDGD3SKsPh7uNv3R/duwrhNKydZudFejWrqVJoGfTdKgUOfa/oCSgdCsyTfU5Wgp1mts6J1ZFBbDqwcaOm5UoZJkem9iKkLko5+OBZqxWI5ZE06fj0RxhGoJJggubkcAfjmFLz5smxUtv9j7QeE6IMg==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by DU7PPF2CD800A78.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bcd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 13:53:17 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::ce58:6abc:a395:f7c4%7]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 13:53:16 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Inki Dae
 <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry
 Baryshkov <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hiago De
 Franco <hiagofranco@gmail.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Thread-Topic: [PATCH] drm/bridge: samsung-dsim: Fix init order
Thread-Index: AQHcLiO9rhNJiAMWkkSyYdD1EHlGaQ==
Date: Thu, 25 Sep 2025 13:53:16 +0000
Message-ID: <50d8590c-108e-4576-904c-138b6403ac92@phytec.de>
References: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
In-Reply-To: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|DU7PPF2CD800A78:EE_
x-ms-office365-filtering-correlation-id: e321b674-e3eb-4fb3-5e1f-08ddfc3ae0ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RHk2QTFNSVUwU1k2cXh0Wmc2OS9McDNuT01QS2xBS3dmVFBXL2hUUThSVVpo?=
 =?utf-8?B?akdLNXZKeENJRjJBQ2ZpTGZrVFAzQnVraFk0bXlVZlUrVDhOZGlFc2xWeEM0?=
 =?utf-8?B?Ukp1Vy9hUmcyTFA0RnBWc3NZM09xS2x3MmJmTmFHaytMeDV1bEFpR1hxMm1p?=
 =?utf-8?B?V1JkUVl2OXg4dWNZT2dyVkptN2FEcnB4RVFhRmVnMkhRdUR2bVJPaExOYXBj?=
 =?utf-8?B?V2M0K1VkZnhreFN6NkZBNzk3R1l2WndpMFVqc2ZiK0J2ZjBrcGpRMkMyeEJX?=
 =?utf-8?B?MXFVYTZybW9MOG55N0NhREJuYTNjTUdyOHk0N1liU3pxQ2llTi8ySnFTTTlH?=
 =?utf-8?B?TXl0QXVNTWtyS1FiVE1YaGtjL2ZVODlvTC9XYkpHcGFHWk5lSVg5SzJpekJE?=
 =?utf-8?B?bnJHSStFRWdaQnpFSk9wSEV0V3lMb2xqSkIvWmJNbFgrZEJPRHlsWVlVOUdr?=
 =?utf-8?B?dnBCQ1k0MTlRUG8zKy94OTVRMVU0bm8wejVCMUNrWDdkK1JWTVJnaVNnZ3BZ?=
 =?utf-8?B?V0hDcUNTZzZ0ajdmQnpLVnJYQXJQR1Nmd1VuRi9OMExmRFNZMkJlT1kxNnc3?=
 =?utf-8?B?SkhOcVNFZ0U0WHRPdlNKUTY1RVBZb1U2dzAxeFN5b21kekFkQ2lNQkJITXdR?=
 =?utf-8?B?SkEvZkVhNlFtZVNaTm5kZjQyVGx1anlQRndKaDNoSkIyb2t1R2dxK0poZFFF?=
 =?utf-8?B?Mk1ReWUveDRDYmRDSnlCWHYrREpYbDVPTzNNemtDakg4YkV4dCtuanRxRWFT?=
 =?utf-8?B?aERmamp6M01jbDl1WXRoT1pKbldpRGtpS3Bsai9xWUZCNThtTll3TjN5Sm1x?=
 =?utf-8?B?WXdpN2I0RjJaZDEzVys1R3ZoTDVha3lNYjBrLzJ4R2Z5eHdlWWl5cTBHTlJm?=
 =?utf-8?B?T2htWHR6SHpkb2ZVMExSTll1OHRrUWxtUElOS0kyeU5xcTFKUDdmVlUvRU9o?=
 =?utf-8?B?dDVhc0hzd1kydC9raTJhaVRuQlZ4NlUzTDVjTDVXK1VEcEYyUmhrZkVJanUz?=
 =?utf-8?B?VGdLY2tVczk1QzcveGZhZFBMTFRNdzhHelZpZm9YUkVIS25GRG1jeDdvemJm?=
 =?utf-8?B?ZFg1RUp3Q292dTN6anM0Rm1vYlpXWUR6MU5DL2R1emRJM2dCeEZWMHVJRHpH?=
 =?utf-8?B?akFyOVFWM2c0MHdLSGRDYWgvZjVQd2FqblBsNVNOQ1F2UGZLaGFkT2R1MG1J?=
 =?utf-8?B?Z1VMSnJiVUxPZm1yY0w2TzF1UGxMTmNUejZaNUkxWmozNGlnWVZISU5ENGdz?=
 =?utf-8?B?akl0aG1NeXIxdkRRUHJWdFZ0RzhzUE55ZDFvZ2QvbzlwUkFKU3FkNEpabXg0?=
 =?utf-8?B?UjBJeVZaU3RxQUlTWnN1U3Z6RzlwaGhLR1g4Q2g5ZXJkTUErbGlIaldZaUNN?=
 =?utf-8?B?Z3hhOFBvQ3VBbkcyNCt3NkVnQ2tnYTBPek1zekFMMk9PemZMT1Y4NVdvTEwx?=
 =?utf-8?B?eEJZdmhneS9MaXJUN3BXamtJOC9VYzVmUjA5VGhmbDNGbkhHZ1RrQmdEUWwy?=
 =?utf-8?B?aldmd0ZrczlCU0Q5TWM4bVlPZmViQklUaEdCTTRLUzl6amc5VitvcllOeGgx?=
 =?utf-8?B?SWwrQmcvSGhHenpldzlWWWhjKzhOQ2pZQ0J1UG1XMGJIV1VYSGNGSXAzeW1p?=
 =?utf-8?B?VUF3b2RZazRDdFlpdTQ3bUJIU0dxQUloSHBDM3phbFVMWnFqOHFYM0tEVWNx?=
 =?utf-8?B?Ymh3YW1JbEpxbGdkaWdmaDZBK04yNW1qQmhZVmsvdGJsdGNQSzhRcHgxZUpv?=
 =?utf-8?B?T09wN1pFejVEWjdYUCs2QlZyUXRqUFZtU1hMUlh0VERQTjEyOVFORmhkS3lr?=
 =?utf-8?B?V2V4V05yU2hGM01SSUdVU0ZyQVFROXh5czBoUFJia1NHSXVKME9URzA3a3JT?=
 =?utf-8?B?TVVRZlJ3YjdSMXRMblVJUXplbFZ0Tld3S0o4YXhhLy85ZTd5ZFBZTVo5OXVt?=
 =?utf-8?Q?5AAyuroXsW3OwaDx9sC19Z+hP2hCfAwy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2k4SlZYUCtaU3B0VmRtalRxN29nQUVKK3ZQQlgxemZRcTlXZGhYZGk4b2dY?=
 =?utf-8?B?eSs3aXlSaXl2eDJjYXRrRThGTkNsK0gyaC9qRDVCaXYrTVBjWVA2Z0NGTUph?=
 =?utf-8?B?SCt0MTd5SVhqVE9scy9UOUNSNmthTEZDcitmSWV2YnBBakdLbTg1Q2VMTnUx?=
 =?utf-8?B?ZGg4L0xhZVpIc0dVdlV6Yk5sL2NGM2t3Rkx0SThGMmhnQVkzU0Q3bFpMVm04?=
 =?utf-8?B?bnVXNGNRc3RMSzFiWFhjcmYwVHVzbUpHQ1loejVBZG9YOE15L3d6d0ZxNlZV?=
 =?utf-8?B?eWhwWGZ6SjZkM0dQQUZtY0syVzF4cWk3R00zQjhrQWRXSG5CRUZjWmFrMXlH?=
 =?utf-8?B?STFIT3Y2dS9oSW9TdWVKOVVnemxMUE9icVpJUUVlN0s3Zm9SczZ6T01hZFBp?=
 =?utf-8?B?NXM2U0dvSHFZa0F4ek9yZUxSd3MvbWUzZmYxNkVTWlIxN25teDNnVUNmR2x4?=
 =?utf-8?B?aHhMeVNUWVArWTlWOG5iMGNoWkhmdkFTTll2M3BZc2tVVUpnSVRGdVkxWkxo?=
 =?utf-8?B?aDRXNkxrYnRqY0IxSHRUZ0Z6QlJnU2FiU0dZYUUvY1BRZ0NaOXZWM1lJb0J3?=
 =?utf-8?B?djBabWJ3NUJEaWcwaGQ1UUl4R3dzM3lBUjEyVXB1cnFzWkpKZVd0Q21PenFB?=
 =?utf-8?B?c2wvMXVOZ3NpellBemNrK01Fd0VkaU81M0d3Y3pZVC9NTW9ZU3Q1MzBNOHJV?=
 =?utf-8?B?TUFmSCtJaTErMmJMTmNLbWpXTnNyNDU0TGFzblc2anpaSkxjVUdJVTk5YmRN?=
 =?utf-8?B?a1R4RDMwSDJ0UzBCVFRRM3Y4aUxzUldwNmIrd1M0YWFHQXJMZFdtSnFvanBD?=
 =?utf-8?B?dkROa25zcVhoMkRUQ2FXYk1BZFgzWjJsQjFNejNWbDJXaUc5V1k0aDBFd3da?=
 =?utf-8?B?QlZuN2VVM3c1NXpkNCsrV0VUbm9ZMkY1THRlSmV6QnpLYWw5dGlyMEtZNCs2?=
 =?utf-8?B?ZXE1QWx5MnZyYUl1dEs1ZEFlMlVFVE0rS2tGODRybllXUWxvL1J4QjZldWpv?=
 =?utf-8?B?VGlCN1I5Yi9SOXBSWlFiVVUzZ0xXbm04MDdiaDh5M3A1UWhiR2dweWEwRzJH?=
 =?utf-8?B?MUF3blJQakpJV3Vmd3BkUDlsNWdKRGp4UkFjT1hLT0x4dnF0emcyRDI4MGFM?=
 =?utf-8?B?OStHMDk5TGVFVFFsb25tVnJZd283SkE2WnhzQWM3UnBhcUE4QWdYdEFmbEpi?=
 =?utf-8?B?bThNOGRpQkRTM2lDWXplZFQyeWIvRXA1bGFTQTlUMXl0R1A4My9QbnVMUits?=
 =?utf-8?B?ZHI4L0NaSzYrTVE0YmJjV25mOVgrNjJXZzI4enUzVmZIVUFzL1hSY0xRWHNJ?=
 =?utf-8?B?cXhNOUVTV1JJenRZYkZUV0VGL3dBWXNtRllnbldTS05kZzkyV2o0OWVoYmI0?=
 =?utf-8?B?cU5JQVVieFloeDF6M01NSmdTWTVSWnlIVm5ZM1M1L1dnUFRPSVBlSlRsY3BX?=
 =?utf-8?B?ZUtSNmo5eU9USVpDTDZuc2lRRkRHazlOYncxT1l5R3d2eVpBOUovVVZRaE9F?=
 =?utf-8?B?dEFlNmtpNnVhbmgyUFNLemg3NDVnUFdoTis2K1o1SmpvZjYwSlJxM014U1A1?=
 =?utf-8?B?VVBKdG4vZzZmeUx4dCtWbFhuL3ptbFNNY1E1bVNjaEhOTWR5VGlCRzh3N0d3?=
 =?utf-8?B?dGdiTWp2ekd6OEEvb3hYMTJXZ0lGeEpnTHZBRWdqT3gzTHVSZ0VOS2ZCdjAy?=
 =?utf-8?B?L0lEanJsdHRSc1hVTzdwWGcybWtKQ2dwejdHeC9NWFFrRHNTTkdJZ2RiVTln?=
 =?utf-8?B?Sm5oWGJ5WTlpOGxZdUdTMWc4VUp5OVZPNTUxQ0h3dTdRZUJJQng1aDkwZWV3?=
 =?utf-8?B?b01mZXJCRFFmbWtCVmx4SlkwWEozRk1XUVZMaG9Cd09qZ2xLdkpJdTg4M3p1?=
 =?utf-8?B?UWo1VUt6WFFxZm4yc2dEYll2cVYrS1JBc09Tc1g0d3VKQXNRb2VMbUs4Y0V1?=
 =?utf-8?B?cTZMK2VHMit5QkJGL3BzK3k2YWs3WlF4cFpqRFdZSmVhcVNVK3Fpc3M2QVQ1?=
 =?utf-8?B?N3dFUU83N1d4clJVc3J6MUxQSkxjcFQ4a2hTNTBMUGRidkxjdTVaR2t5blRm?=
 =?utf-8?B?M3gzWm5NQVpWb2lNUE1WMGliUXoyTy9lZlFRQ1dPRFlMTGQ1UHdHcWxyNVhR?=
 =?utf-8?Q?W0qZzRh87HXtEiO+erRWC7dwl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA72784B2A72D4BB2D5D8D6D2F679A1@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e321b674-e3eb-4fb3-5e1f-08ddfc3ae0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 13:53:16.8222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSiKnv3CWewgnkj8UcRNdG3ZsBVmowKkEbl1vf2akVEGuxD9DsPJpb8TutrNWGC9gPhuG24VhJpbXg9v/ibnHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF2CD800A78
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

QW0gMTkuMDYuMjUgdW0gMTQ6Mjcgc2NocmllYiBUb21pIFZhbGtlaW5lbjoNCj4gVGhlIGNvbW1p
dCBjOWIxMTUwYTY4ZDkgKCJkcm0vYXRvbWljLWhlbHBlcjogUmUtb3JkZXIgYnJpZGdlIGNoYWlu
DQo+IHByZS1lbmFibGUgYW5kIHBvc3QtZGlzYWJsZSIpIGNoYW5nZWQgdGhlIG9yZGVyIG9mIGVu
YWJsZS9kaXNhYmxlIGNhbGxzLg0KPiBQcmV2aW91c2x5IHRoZSBjYWxscyAob24gaW14OG1tKSB3
ZXJlOg0KPiANCj4gbXhzZmJfY3J0Y19hdG9taWNfZW5hYmxlKCkNCj4gc2Ftc3VuZ19kc2ltX2F0
b21pY19wcmVfZW5hYmxlKCkNCj4gc2Ftc3VuZ19kc2ltX2F0b21pY19lbmFibGUoKQ0KPiANCj4g
bm93IHRoZSBvcmRlciBpczoNCj4gDQo+IHNhbXN1bmdfZHNpbV9hdG9taWNfcHJlX2VuYWJsZSgp
DQo+IG14c2ZiX2NydGNfYXRvbWljX2VuYWJsZSgpDQo+IHNhbXN1bmdfZHNpbV9hdG9taWNfZW5h
YmxlKCkNCj4gDQo+IE9uIGlteDhtbSAocG9zc2libHkgb24gaW14OG1wLCBhbmQgb3RoZXIgcGxh
dGZvcm1zIHRvbykgdGhpcyBjYXVzZXMgdHdvDQo+IGlzc3VlczoNCj4gDQo+IDEuIFRoZSBEU0kg
UExMIHNldHVwIGRlcGVuZHMgb24gYSByZWZjbGssIGJ1dCB0aGUgRFNJIGRyaXZlciBkb2VzIG5v
dA0KPiBzZXQgdGhlIHJhdGUsIGp1c3QgdXNlcyBpdCB3aXRoIHRoZSByYXRlIGl0IGhhcy4gT24g
aW14OG1tIHRoaXMgcmVmY2xrDQo+IHNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gdGhlIExDRCBjb250
cm9sbGVyJ3MgdmlkZW8gY2xvY2suIFNvLCB3aGVuIHRoZQ0KPiBteHNmYiBkcml2ZXIgc2V0cyBp
dHMgdmlkZW8gY2xvY2ssIERTSSdzIHJlZmNsayByYXRlIGNoYW5nZXMuDQo+IA0KPiBFYXJsaWVy
IHRoaXMgbXhzZmJfY3J0Y19hdG9taWNfZW5hYmxlKCkgc2V0IHRoZSB2aWRlbyBjbG9jaywgc28g
dGhlIFBMTA0KPiByZWZjbGsgcmF0ZSB3YXMgc2V0IChhbmQgZGlkbid0IGNoYW5nZSkgaW4gdGhl
IERTSSBlbmFibGUgY2FsbHMuIE5vdyB0aGUNCj4gcmF0ZSBjaGFuZ2VzIGJldHdlZW4gRFNJJ3Mg
cHJlX2VuYWJsZSgpIGFuZCBlbmFibGUoKSwgYnV0IHRoZSBkcml2ZXINCj4gY29uZmlndXJlcyB0
aGUgUExMIGluIHRoZSBwcmVfZW5hYmxlKCkuDQo+IA0KPiBUaHVzIHlvdSBnZXQgYSBibGFjayBz
Y3JlZW4gb24gYSBtb2Rlc2V0LiBEb2luZyB0aGUgbW9kZXNldCBhZ2FpbiB3b3JrcywNCj4gYXMg
dGhlIHZpZGVvIGNsb2NrIHJhdGUgc3RheXMgdGhlIHNhbWUuDQo+IA0KPiAyLiBUaGUgaW1hZ2Ug
b24gdGhlIHNjcmVlbiBpcyBzaGlmdGVkL3dyYXBwZWQgaG9yaXpvbnRhbGx5LiBJIGhhdmUgbm90
DQo+IGZvdW5kIHRoZSBleGFjdCByZWFzb24gZm9yIHRoaXMsIGJ1dCB0aGUgZG9jdW1lbnRhdGlv
biBzZWVtcyB0byBoaW50DQo+IHRoYXQgdGhlIExDRCBjb250cm9sbGVyJ3MgcGl4ZWwgc3RyZWFt
IHNob3VsZCBiZSBlbmFibGVkIGZpcnN0LCBiZWZvcmUNCj4gc2V0dGluZyB1cCB0aGUgRFNJLiBU
aGlzIHdvdWxkIG1hdGNoIHRoZSBjaGFuZ2UsIGFzIG5vdyB0aGUgcGl4ZWwgc3RyZWFtDQo+IHN0
YXJ0cyBvbmx5IGFmdGVyIERTSSBkcml2ZXIncyBwcmVfZW5hYmxlKCkuDQo+IA0KPiBUaGUgbWFp
biBmdW5jdGlvbiByZWxhdGVkIHRvIHRoaXMgaXNzdWUgaXMgc2Ftc3VuZ19kc2ltX2luaXQoKSB3
aGljaA0KPiB3aWxsIGRvIHRoZSBjbG9jayBhbmQgbGluayBjb25maWd1cmF0aW9uLiBzYW1zdW5n
X2RzaW1faW5pdCgpIGlzDQo+IGN1cnJlbnRseSBjYWxsZWQgZnJvbSBwcmVfZW5hYmxlKCksIGJ1
dCBpdCBpcyBhbHNvIGNhbGxlZCBmcm9tDQo+IHNhbXN1bmdfZHNpbV9ob3N0X3RyYW5zZmVyKCkg
dG8gc2V0IHVwIHRoZSBsaW5rIGlmIHRoZSBwZXJpcGhlcmFsIGRyaXZlcg0KPiB3YW50cyB0byBz
ZW5kIGEgRFNJIGNvbW1hbmQuDQo+IA0KPiBUaGlzIHBhdGNoIGZpeGVzIGJvdGggaXNzdWVzIGJ5
IG1vdmluZyB0aGUgc2Ftc3VuZ19kc2ltX2luaXQoKSBjYWxsIGZyb20NCj4gcHJlX2VuYWJsZSgp
IHRvIGVuYWJsZSgpLg0KPiANCj4gSG93ZXZlciwgdG8gZGVhbCB3aXRoIHRoZSBjYXNlIHdoZXJl
IHRoZSBzYW1zdW5nX2RzaW1faW5pdCgpIGhhcyBhbHJlYWR5DQo+IGJlZW4gY2FsbGVkIGZyb20g
c2Ftc3VuZ19kc2ltX2hvc3RfdHJhbnNmZXIoKSBhbmQgdGhlIHJlZmNsayByYXRlIGhhcw0KPiBj
aGFuZ2VkLCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSByZS1pbml0aWFsaXplIHRoZSBEU0kgd2l0
aCB0aGUgbmV3IHJhdGUNCj4gaW4gZW5hYmxlKCkuIFRoaXMgaXMgYWNoaWV2ZWQgYnkgY2xlYXJp
bmcgdGhlIERTSU1fU1RBVEVfSU5JVElBTElaRUQNCj4gZmxhZyBhbmQgdW5pbml0aWFsaXppbmcg
dGhlIGNsb2NrcyBhbmQgaXJxcyBiZWZvcmUgY2FsbGluZw0KPiBzYW1zdW5nX2RzaW1faW5pdCgp
Lg0KPiANCj4gRml4ZXM6IGM5YjExNTBhNjhkOSAoImRybS9hdG9taWMtaGVscGVyOiBSZS1vcmRl
ciBicmlkZ2UgY2hhaW4gcHJlLWVuYWJsZSBhbmQgcG9zdC1kaXNhYmxlIikNCj4gUmVwb3J0ZWQt
Ynk6IEhpYWdvIERlIEZyYW5jbyA8aGlhZ29mcmFuY29AZ21haWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCg0K
SSBydW4gYWxzbyBpbiB0aGlzIGlzc3VlIGFuZCB0cmllZCBhcyBzaW1pbGFyIHNvbHV0aW9uLg0K
VGVzdGVkIG9uIGlteDhtbS1waHlib2FyZC1wb2xpcyB3aXRoIGEgc242NWRzaTgzIE1JUEkgdG8g
TFZEUyBjb252ZXJ0ZXIgWzFdDQoNClRlc3RlZC1ieTogSmFuIFJlbW1ldCA8ai5yZW1tZXRAcGh5
dGVjLmRlPg0KDQpUaGlzIGlzc3VlIHN0aWxsIHBlcnNpc3RzIG9uIGN1cnJlbnQgbWFzdGVyLg0K
DQoNCkJlc3QgcmVnYXJkcyBKYW4NCg0KWzFdIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwOTI1LXdpcC1qLXJlbW1ldC1waHl0ZWMtZGUtYnNwaW14OG0tMzgwMV9wZWItYXYtMTBf
d2l0aF9hYzIwOS12MS0wLTk0ZjlmNzc1ZWU2MkBwaHl0ZWMuZGUvDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgfCAyOSArKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1
bmctZHNpbS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uYw0KPiBpbmRl
eCBmMmY2NjZiMjdkMmQuLmNlYzM4M2Q4OTQ2ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zYW1zdW5nLWRzaW0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NhbXN1bmctZHNpbS5jDQo+IEBAIC0xNDczLDIyICsxNDczLDMxIEBAIHN0YXRpYyB2b2lkIHNh
bXN1bmdfZHNpbV9hdG9taWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0K
PiAgIAl9DQo+ICAgDQo+ICAgCWRzaS0+c3RhdGUgfD0gRFNJTV9TVEFURV9FTkFCTEVEOw0KPiAt
DQo+IC0JLyoNCj4gLQkgKiBGb3IgRXh5bm9zLURTSU0gdGhlIGRvd25zdHJlYW0gYnJpZGdlLCBv
ciBwYW5lbCBhcmUgZXhwZWN0aW5nDQo+IC0JICogdGhlIGhvc3QgaW5pdGlhbGl6YXRpb24gZHVy
aW5nIERTSSB0cmFuc2Zlci4NCj4gLQkgKi8NCj4gLQlpZiAoIXNhbXN1bmdfZHNpbV9od19pc19l
eHlub3MoZHNpLT5wbGF0X2RhdGEtPmh3X3R5cGUpKSB7DQo+IC0JCXJldCA9IHNhbXN1bmdfZHNp
bV9pbml0KGRzaSk7DQo+IC0JCWlmIChyZXQpDQo+IC0JCQlyZXR1cm47DQo+IC0JfQ0KPiAgIH0N
Cj4gICANCj4gICBzdGF0aWMgdm9pZCBzYW1zdW5nX2RzaW1fYXRvbWljX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgIAkJCQkgICAgICAgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKQ0KPiAgIHsNCj4gICAJc3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpID0gYnJpZGdl
X3RvX2RzaShicmlkZ2UpOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBE
U0kgYnJpZGdlIG1heSBoYXZlIGFscmVhZHkgYmVlbiBpbml0aWFsaXplZCBpbg0KPiArCSAqIHNh
bXN1bmdfZHNpbV9ob3N0X3RyYW5zZmVyKCkuIEl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIHJlZmNs
ayByYXRlIGhhcw0KPiArCSAqIGNoYW5nZWQgYWZ0ZXIgdGhhdCBkdWUgdG8gdGhlIGRpc3BsYXkg
Y29udHJvbGxlciBjb25maWd1cmF0aW9uLCBhbmQNCj4gKwkgKiB0aHVzIHdlIG5lZWQgdG8gcmVp
bml0aWFsaXplIHRoZSBEU0kgYnJpZGdlIHRvIGVuc3VyZSB0aGUgY29ycmVjdA0KPiArCSAqIGNs
b2NrIHNldHRpbmdzLg0KPiArCSAqLw0KPiArDQo+ICsJaWYgKGRzaS0+c3RhdGUgJiBEU0lNX1NU
QVRFX0lOSVRJQUxJWkVEKSB7DQo+ICsJCWRzaS0+c3RhdGUgJj0gfkRTSU1fU1RBVEVfSU5JVElB
TElaRUQ7DQo+ICsJCXNhbXN1bmdfZHNpbV9kaXNhYmxlX2Nsb2NrKGRzaSk7DQo+ICsJCXNhbXN1
bmdfZHNpbV9kaXNhYmxlX2lycShkc2kpOw0KPiArCX0NCj4gKw0KPiArCXJldCA9IHNhbXN1bmdf
ZHNpbV9pbml0KGRzaSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuOw0KPiAgIA0KPiAgIAlz
YW1zdW5nX2RzaW1fc2V0X2Rpc3BsYXlfbW9kZShkc2kpOw0KPiAgIAlzYW1zdW5nX2RzaW1fc2V0
X2Rpc3BsYXlfZW5hYmxlKGRzaSwgdHJ1ZSk7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDc4
NzI5OTdjMDQ4ZTk4OWM3Njg5YzI5OTVkMjMwZmRjYTc3OTgwMDANCj4gY2hhbmdlLWlkOiAyMDI1
MDYxOS1zYW1zdW5nLWRzaW0tZml4LTU4YzhlYzgxOTNlOQ0KPiANCj4gQmVzdCByZWdhcmRzLA0K
DQo=
