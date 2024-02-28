Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3643386AC5B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37B210E2B3;
	Wed, 28 Feb 2024 10:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="c/nsmmhy";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="d5vttwxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CAB10E2B3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:48:02 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41S7P2Kd015748; Wed, 28 Feb 2024 10:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=MdFX8XhnXos9OhTMG57yG
 JNuTqUM5bGfSCwK+XAMFPM=; b=c/nsmmhy29Bg4/lVRW9QcUoue/FioffGpOP63
 to+sItEdEArnePCcsbRU65UaIA68+Qs0TpY04japOFV/sS4p6AsRFRfEmFLsHKEz
 o7aQuj6MsacTT+J6MTP7qraQqsfcqZJQqHI8Ma95MYbfsALDZLACDb+Uamp4QJjW
 629AJk2xn2BH8quFcsDincLiiSB5vQPVZt4TEVThkhMjnIAIetZ6Su+yyt8rfMs8
 CoyLUAZQyL+7426YCJDPG7fwd+nsM6I20KmyVcZ3I6KMcR35gQogy4VJ5vRDSDzj
 CBqVGDhRih2E8MInlPjIL3e25lW9HekucojDRpWomPJZuSB/Q==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wf9dwbjpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Feb 2024 10:47:32 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 10:47:32 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 10:47:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIIrpy1IKwgOdxaZa/rCuu62oTWnWCLXm0HhgWc5XHS+qBgrORq8p12eXGCgkPuALSepT+/fePDkt0EqFdokSx866QDgw3PHA5NPkNG3EerZylajsplkT2B9pm7v70pwHYMBil8JyCtkiJ42o3/ne9Itwjj1701ke4pYhb7XDk1i95KE4E7rA/Ong+rZMGmQaPaHf1UmZPSz0zqNz6ExQTow6x0IUh9Pt106p3lE0VPfkEAmX8oxAMIxrVFw76LlP5lBFNZ6CaeyX4tY3UuNwm33NP/sJuOMSE9W9vyVcgfhCryAGrAdm6Y+w+0tDvGyjH5UsPxJNmRXj9bId08izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdFX8XhnXos9OhTMG57yGJNuTqUM5bGfSCwK+XAMFPM=;
 b=K0suV6HaY1cCT0Iq7P4hvFbjqb792iLPgPblQxAg7A4BeZfdoD9NWaf3d1GOpMrVZ0JzqwmKNh/Mn4Puz5RjX9KoTlGnRNqDs6Ph8UZASDyfH7W5KEK/FfkxNA77yFgtTMk4n7IMYlxRlVuS4wW7YcWGaws+Grwy02dASLfAdd9PIEVgTPt36kvTMupVWdMNTm/sz3sFGXslOR+QJUye4vx7OR9dozlDm/aDSlJumqqDz2kV2jJHYa4nmIysuG4XPSxQZZEAW1y5WogujCOUPq0Z5404kfAGGPqeR8YkJMBKybCxQXFzuYHF0WiQCPiBFWPWnQ+o3l3YneLqnepCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdFX8XhnXos9OhTMG57yGJNuTqUM5bGfSCwK+XAMFPM=;
 b=d5vttwxQqfJyTiKoD6CKnWs5GaiqnUe1sl/p0BnaD0QTAzYn49etxKlu5u8IHv8K1UNCtGGyDl1aQqbC26r5ryXNlRBZpRsf9R/gVZgJFsEYBASC6w332j1h/ZR7+p4usbMq0nOWg0IQJsVIyw65OlFVRubdEFYWFjTGaXedpvs=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWLP265MB2340.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 10:47:30 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4b5c:d51f:da10:2626%5]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 10:47:30 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Lu Yao <yaolu@kylinos.cn>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Kconfig: add 'PAGE_SIZE=4K' dependency
Thread-Topic: [PATCH] drm/imagination: Kconfig: add 'PAGE_SIZE=4K' dependency
Thread-Index: AQHaaeV54b+iImOcgUevYh//vZMVK7Efk0GA
Date: Wed, 28 Feb 2024 10:47:30 +0000
Message-ID: <676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com>
References: <20240228012313.5934-1-yaolu@kylinos.cn>
In-Reply-To: <20240228012313.5934-1-yaolu@kylinos.cn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWLP265MB2340:EE_
x-ms-office365-filtering-correlation-id: ccd74097-ffd7-41db-541f-08dc384aa993
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KM/VHcS/+ttcMZl4LMleT8G7ePYfBDjBbLbueLxcIr4DbdOnZ7EhjRUPx/Bhuds/TByxMvvdCYXCM6OyIosiL0IE8ttNEuERJQI80K4ZD38ncB8wRo1mRQ8VFO84GYZnkCsdKHsqrjAy+7KYKjWqk06nbwlztkFVVl+hSjqbKo3sPEwTYNVAWsJybiWATPxtVDF0ovpcjZXh7DaWRJ9+8V2/x2m+8iySfSo1IgdliF+pY5T+3APrqJyMxG/JOFqlm0f7PWGmLU8epHjbWWIlNyXaZ8iwzgdfaQySycgUXtGPViU7VaOQJy1dTC5MNPZXdIdHeBRemvRjpHiOArVw3qZJnpyG0EmOyiVfL8PHoVTYS2b8VNtSZUBrlM4tLGsS1XkonAveSF6mo1ssBoRq0k4Km3c1lqjv4uvCX5IV/WCU0zahnicocqUcMntPwhI+pJY1sYIKXrfW3YAGp5Ksp/HPfSRcg/7XCa4wyM479b8yqlrabfFo0pYoW9X2Mzm1PA+O56FxGW+bVCIisZMFXzUvLX8kuopKyjbPVCtEsO8fmCnn2VM7mOjnMlG6nGWjsjYhCVTiklYyxdIndjHXVyZRlwLsJjO5PMi77IlAjU1m/d6COxhq+3q3GQn8cg643l0O2Z04jZi+Sze6qtAFsTzPLy0XlAD6xoDWrZ4cmEoS9o+wRQ+MZIHMy+ZagOgK+hJoDewoAW2hcyBPCmdxQyWM+w4xwE9k3QxBy/cJMpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXVQakFWd09XWXV1WlZkTC9wZFdSeFhVbWhBbUVJTy85RG1qUlo1dWxtdzFy?=
 =?utf-8?B?QkpCVnNNMG5STENlMmJ2RzBHeW14OTdKMDJSaXJUeU1wcFo0Q3dHV0RTdUNo?=
 =?utf-8?B?Y05rZ1ZaSjBLY3hKUUhsdk9qekhzbTlKWlIxQWRkUDJZWnNkZktIcVpnWjVm?=
 =?utf-8?B?UkF5L2pFSlFMMVlLR1hwMGpGVVVXRHlzYXVwaHZvNXdkbFFVcENWT2hyMVRP?=
 =?utf-8?B?OGpPMm9hOUtmL1A4TVJ2eXB6K1dpTlgycXh2UWFEcXdhVVdOQVJhcitPQkx4?=
 =?utf-8?B?WEVZQUl6SmxMTncxSTdoeG1QLzg5Yll6NmxLb0Z5YmVIbGRKWUxvR0N1b0pt?=
 =?utf-8?B?R1d3eldaakprNWVqbFVjUGpxWHhReVV4OER6dUdReFBzcTJ2ZU16QjAwTlVD?=
 =?utf-8?B?ZjhHckoxdHFKZWI1ZDJhR1FOQ2VaT2NDbnRPOVdmZW5lVHpLTmR2aVFXYVgr?=
 =?utf-8?B?clFuU29QcHVSQittenRNZUxBcVBmS2VsMzAyVjlNUlRkSnB2VXp3Ynl3WlVK?=
 =?utf-8?B?d3Fvdk1yV2U1bmszYzJIRHgyTTQ3WXl1VjJoK1hwSlJLV2JaSGV4aHlUeFk5?=
 =?utf-8?B?SmV4VGhTUWQyN3ZVNlIxNXl5emlpa3ozQXJBSlZlV0x4NUxFZ1hhb2k5bWNW?=
 =?utf-8?B?dnpoRWFNamQwVGgwbG5yc3MvbzVGK1YxVUNGVXdFZ2YyaENLL3d5UjBadGpN?=
 =?utf-8?B?RmhGMk9BazhUT2tPOUJLcUR6Q05FS05wSmhycURxMEJUSlB0RGFBWHJ5aWdT?=
 =?utf-8?B?b1lTRkxqYlFmczc0UUVCNE11YUxoZmxSOXBYM2l2TTBjZUdqUmY0TjV3eDVV?=
 =?utf-8?B?anZuOTllZW94NERFbUN0akJUMGNMeWtOSUVBNXZUci85T3hmaTJhSytlNWJu?=
 =?utf-8?B?UVN0V0ttWjFYenhCdnIwN1M5MDJ3dVpnYXZ5THZJNEJRSUNONzk5R1JZUXIx?=
 =?utf-8?B?WDZ2aVZpZVpKRGdzQmlmU0NlZ09TV0JPNllUUW01UXEvTGVYTlpLYWdDUTVq?=
 =?utf-8?B?Nlp4V3ZLb1B2b3RXYm5iTTU0T3k4SVNXNHprOFVtNEk1MXgxZ2lIcU5jNVYz?=
 =?utf-8?B?RE1HQlZUZFFKSVoyNzdxOTVTMVBBNUZscXJDeVlRZnFaK1hzRDhTcDBOQVpD?=
 =?utf-8?B?a1BDb2ljZXcwbXZKeHgzUFpCdGFwTkVydldXRlRNRjh4NEZteXBIZXRXdDV6?=
 =?utf-8?B?aFdYUjJPOTFCYWtRNTFwdEd0U3NEOEttazFzSTc0ZmhmSUVHMDV0bWRtV0Z6?=
 =?utf-8?B?MmhjN1RUN0tTcVh3M3R2QURaTklNdFh3YXBxRGNHSG5Dd2xQY0E3VTd0a0t3?=
 =?utf-8?B?emQxc0w4VDRNc2NVNlFJVXhUTFBYTXh5NnR5d2dmbHFTdHRBdzRiSmdBRFl2?=
 =?utf-8?B?SnV6MGRrQzZPVWx3VkVuNDBtTmJnVnVobGhjdDFEclpEa0gzSXU0MHFMajVU?=
 =?utf-8?B?WllMcWNMa2dERDllREtSQlNFZ2JpeWpEQnBFdHppR3o0cFhmMGtHdGJod3Mz?=
 =?utf-8?B?aS9VTXh4a1NsYkgrTG5Nb0o4Z0g2OEJmSk5Za0R0eGUvcTlJUEdrMHZxdXp0?=
 =?utf-8?B?RTB4cGI0WU5OMUFMOWkxSHBWZ3Yyd0Y4ZHAzb1QwM3RrQ0ZzNTlQNW9BaEh4?=
 =?utf-8?B?QW1rWlMvWFZsSTV1TE5QNEFyRVJuUGhwUkpEdVBIb0E1R0RBUEFJSWNnOG1w?=
 =?utf-8?B?dDZxcjVXeld2MXlkVGxaSHliYnNBcS9pbHlKVWZlWTAzQkwxNXJEL3RSZ3Ry?=
 =?utf-8?B?RjZyL20zd2pIZjhVSlVCa2kyYlNHalZEd29pS0hCcHNpWDZWaUd3Z2VkRnlj?=
 =?utf-8?B?ZVR6aW1KSkpGdlNtOGZrYXNnTkx6VXhUck9pZktwRkJNSXNzMnl1S0E5NC84?=
 =?utf-8?B?QXJKL2s1dUpxQmlQeGdvdFR2RGNpQm14Ulc0M3BYSitRdEgwUXFyaXlCZWtZ?=
 =?utf-8?B?TER4TkxMOG5acHZ2SWhNVHRHcHhjaUh1aGdkRzBpTlk1N2JNVjV5dWsydXRi?=
 =?utf-8?B?MStWSThtR3NGeGo4NHNxTnpUV2ttRlNsWjR0dGFBeEVJOWdzTXN3Y3dZRkZq?=
 =?utf-8?B?Y21BZnIzeXZPSkRhcXRybDQxSGFKTGVOcHIwTEFtdFpaUFhlZjZqQjlPd1lF?=
 =?utf-8?B?QXVQNjZadUlOQ0tWTzdZVU1xSDNjV0IrblJKVS9BbGVaVk1uNk5JQ2U0QWUr?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zMLr3PtRjRvKy8lizTyf0ft2"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd74097-ffd7-41db-541f-08dc384aa993
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 10:47:30.3246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4HYOk3cpYmqUsg4pIU4pIdAL1vum49oqGvmfM3MRpVTQnhaXlRvPhVba7XS1Ykv4oaMynnmnuifky9dXDh00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2340
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: IorjjvJ6jecNVzWKVP-EH8Mw7CmBsvWj
X-Proofpoint-GUID: IorjjvJ6jecNVzWKVP-EH8Mw7CmBsvWj
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

--------------zMLr3PtRjRvKy8lizTyf0ft2
Content-Type: multipart/mixed; boundary="------------9mriRyeh50Xu4mnub0VW0iGz";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Lu Yao <yaolu@kylinos.cn>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Kconfig: add 'PAGE_SIZE=4K' dependency
References: <20240228012313.5934-1-yaolu@kylinos.cn>
In-Reply-To: <20240228012313.5934-1-yaolu@kylinos.cn>

--------------9mriRyeh50Xu4mnub0VW0iGz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, thanks for the patch!

On 28/02/2024 01:23, Lu Yao wrote:
> When 'PAGE_SIZE=3D64K',the following compilation error occurs:
> "
>   ../drivers/gpu/drm/imagination/pvr_fw_mips.c: In function
> =E2=80=98pvr_mips_fw_process=E2=80=99:
>   ../drivers/gpu/drm/imagination/pvr_fw_mips.c:140:60: error: array
> subscript 0 is outside the bounds of an interior zero-length array
> =E2=80=98dma_addr_t[0]=E2=80=99 {aka =E2=80=98long long unsigned int[]=E2=
=80=99}
> [-Werror=3Dzero-length-bounds]
>   140 |   boot_data->pt_phys_addr[page_nr] =3D
> mips_data->pt_dma_addr[src_page_nr] +
> ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>   In file included from ../drivers/gpu/drm/imagination/pvr_fw_mips.c:6:=

>   ../drivers/gpu/drm/imagination/pvr_fw_mips.h:30:13: note: while
> referencing =E2=80=98pt_dma_addr=E2=80=99
>    30 |  dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
> "
>=20
> This is because 'PVR_MIPS_PT_PAGE_COUNT' is defined as
> '(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
>>> PAGE_SHIFT', and under the above conditions, 'PAGE_SHIFT' is '16',
> 'ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES' is '4','ROGUE_MIPSFW_PAGE_SIZE_4=
K'
> is '4096',so 'PVR_MIPS_PT_PAGE_COUNT' is '0' causing the member
> 'pt_dma_addr' to be incorrectly defined.

The whole MIPS page table system is supposed to be host page-size
agnostic. In practice, we don=E2=80=99t regularly test on non-4K platform=
s so
this may well be broken in subtle or not-so-subtle (as in this instance)
ways. There has been at least some testing with 64K host pages =E2=80=93 =
the
configs from TI for the AM62-SK dev boards have that as the default (or
at least they did when we started working with them).

I=E2=80=99m loathed to accept this patch without at least investigating h=
ow deep
the problems go; the true fix here should be to fix the problems causing
this build error rather than just gating off non-4K hosts.

I=E2=80=99ll have a dig this afternoon to see what I can find. Did you tr=
y
anything to fix this yourself? It would be nice to not duplicate effort
on this if you have.

Cheers,
Matt

> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 3bfa2ac212dc..e585922f634d 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,7 +3,7 @@
> =20
>  config DRM_POWERVR
>  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG=
 Graphics"
> -	depends on ARM64
> +	depends on (ARM64 && ARM64_PAGE_SHIFT=3D12)
>  	depends on DRM
>  	depends on PM
>  	select DRM_EXEC

--------------9mriRyeh50Xu4mnub0VW0iGz--

--------------zMLr3PtRjRvKy8lizTyf0ft2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZd8PQgUDAAAAAAAKCRB5vBnz2d5qsP06
AQCVqg5IgOA+sV1sXAu4pkPEmtIbjP1ciW4wYwXvdXvRugD/XLJ/Myz6iVhgxGa9eAyZ7OWMEsbw
AoWvU22DdiL4ZAc=
=b76D
-----END PGP SIGNATURE-----

--------------zMLr3PtRjRvKy8lizTyf0ft2--
