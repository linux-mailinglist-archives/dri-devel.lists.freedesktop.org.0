Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F32687312
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 02:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEF910E088;
	Thu,  2 Feb 2023 01:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6FC10E088;
 Thu,  2 Feb 2023 01:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwATbTfuh0cJUL0+O6wg0I4aYOoXXWfI1lRCNwt9k2GgUg1kmDQVCkp1ZRoifD3rsfrbFWe6G/5Zw7uUZjdra2rlssTtShPQOcRYFgKZpdPDRiLxe9k3RmcbCvSfU2BuSgLwyHgt8tRjY2eIlVf+pmh/BrSTGq9fLhNrpfxHuQt9xZIVzV37aT6a/GA1TCycLL/isn+T4raNTci1BwlLQ3GnMDk18jiOdxnlDvHqf7BmGjX5hANjzmGRWPHSYAKzN+pCb7uJGZTXrFrLE0pfCnCWBckR9WPyoQx+00nhbTmS+DksbNkKoaphRzK9n0Htu+H+y8KYuaHCMdtZBhrVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3PhjAj7FzkWKPUphOxi/Hz4Yuwk0Dhr97zKAi+0lBA=;
 b=NxomUxJ8sXN5hRmM6d5XoootP8KGaOG+Zcf+qpXkIcCAYLvN9v5Lmp4lNh9N7k9NXT7QwohNtieZGeTxVP2xwOgyh1EYrBnPffVixyNY78OcN6IBq2XW+i41kf8eclvqk8LyYnF9QELVzZOVV0hg67rKCXIoUAZje4nsFDH6M5xdV222HbZbjkSBz37KlWu0YPzTNebMSyahwfO+XX+3h/5sDh6DxWUJYwbHp5RJkT50Eg/GH+FIY9n82AD0YXoHM38laqgFb16MpO7C6RDCrakCQrViGn2Olfei2wZwe2B36w+L4wxzWc0JTEpgY0KnOwdZr9wz//1wgAXTpu3g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3PhjAj7FzkWKPUphOxi/Hz4Yuwk0Dhr97zKAi+0lBA=;
 b=dp4KyqpDXKNEX02TQxOdIworrFgBT2P94cKyoktBtdyURCfaebvr7vv2/acTbJCftZlwAe4qBL+kJSmcr2I1+EwXpfSKsg1qlud8tQ/sbR9zoSA4P29eoAafrgvRZiuG6G5zl0OJZqHe6PoEfpz6BQjQ2J6/Ui9ZKO34qAdLs8c=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 01:34:43 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::d068:807d:11c:eee0]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::d068:807d:11c:eee0%5]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 01:34:43 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Thread-Topic: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Thread-Index: AQHZNl0Jp2Dqdo2P6kKxXRqI87tX0q664ANA
Date: Thu, 2 Feb 2023 01:34:43 +0000
Message-ID: <DM5PR12MB246946BB0F87F415DAACD6CBF1D69@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230201164814.1353383-1-gpiccoli@igalia.com>
In-Reply-To: <20230201164814.1353383-1-gpiccoli@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|DS0PR12MB7512:EE_
x-ms-office365-filtering-correlation-id: 0df87167-0fc7-48d1-f437-08db04bda8dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D9m4ZPwEvKWtN6qB4ktl7/c4mHKAAkSoQ4YKrrqkuWNkBxaha+nkspYieKcK2UIGQC2GjW48ytyIjgWcIOl99/ZdvUTDrbhpYDtbYqJ5wuw/MYc2tYLwOdyqaI8mD+OzmYRReDgzTZgERylDLAfie7d+7SDNq07RhqclcQqyB5/qEzpsXejPtFbAuDKrL3GeiL+ut3pVSoBla+466p1Im8rk+l9vxfNfJfPjzWaGRcer5XtgQVDjjjYLtJTXfaY25Hu2fBIiczOvEPTAVpdp4lamo5KCGjislHZCBt8TyOghXN4Eifm8ssdFv2xPs/78HDfeBGHytB5WDfaX2chF1xyEOzjlTpKO4MUBFKbQXBt0yLl4/1IGeD7Gyfz3FF+lTjusiiMPhzSRgHAwF4sHKcbBaitLUc8L1+uTVonp0aYXVFJtFrOnkOTPQTT7o33bYqQvArHeo9zYqyS9vSWDpYyRUSG0+Fw2CyHTkkihLILb2CcahfTqcSQp2qHaRW8t3FAphiZVVEXRmqwj+gaVMbyCoKRG0V1xc3a/rxukKcuQxpO8/1YiIHyYIODvVKOLI7anBGKajb30cUU6AlJ5exPrw6EedC9Mga5Fl1J2vS8Un1Wws9+2SI58o7rYbGG1/xPee9JX/a+N2r9qavQg4gLfvQv8QCDCKt/v9LrsA9shtKPj2ad+RmKXrcfHxXpZvZ3P96ybEtvi6gpn4Br54nQ8NgbnBFHzpwiVF+IBFeY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199018)(54906003)(4326008)(316002)(66446008)(76116006)(8676002)(8936002)(66946007)(41300700001)(66476007)(55016003)(110136005)(122000001)(86362001)(38070700005)(66556008)(33656002)(38100700002)(64756008)(53546011)(71200400001)(186003)(26005)(7696005)(6506007)(9686003)(66899018)(5660300002)(66574015)(52536014)(83380400001)(966005)(478600001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVRDU3UvWkdJeVBlODBkejBwUVBhaUs0RjlBQzg5WE8xaHZkcTgvVVVCdnlj?=
 =?utf-8?B?MGl0bU5hcmNBRWFLb2ZRcDN2YzRGV3BYSHNIK3d1NVQrSXpCWCt3bjUrRzY0?=
 =?utf-8?B?eGEvYlhidmZicGZIVnROSGxrekdETEFsRmcyYTZRdXEwdXV1UW5vR1FHNS83?=
 =?utf-8?B?ZStpbkNtUzB6UGtaUjc3M0hNTmRTazlyWlhJanZDZ0R0QTUya0V1N2pJWU9j?=
 =?utf-8?B?Uy9EVjgzT3duZ2FiTnprdFYzQlFlR0pJbzdSV0ZqNTNPeWNxOWE5Uk9xeVFi?=
 =?utf-8?B?SHl6ZWJXVEE2UEF3UlBSd21vR2Q5QTRCZ1ZIVlVtR0ZQZXIydkZNd0N2NnNL?=
 =?utf-8?B?QitXWGs1d2pBL0kvYmxOSzFaa2xGSkRzb1lYSmN1RHBYUXA2clFPaGtuRk42?=
 =?utf-8?B?VExvdHdRQVVJVmNkaWRKZ0VRWGJQeFlqdThZdWtqZGZQU0V3cm54TktoSDd4?=
 =?utf-8?B?bnk5ZTk3bTFGQ293aG9JNmdiQ3RqU3dnZUJ6VzJydjRxejFFVUFaNHFNTm5a?=
 =?utf-8?B?ekRJUDNyMWR2Wmkrc0pZRFVueFhIY1orU0FDa1ZJcEtOUGdBWXZEZDZYWi9w?=
 =?utf-8?B?b3VIdXFPemxjNmJXL2pWUXRmZXB5YWJaa2VpNGNZbVZaTVBRQmwraFc4SmdW?=
 =?utf-8?B?bURoMjZVSW1rOXg0ZkY0andLeFBrbzh0SURVcElmM0tHNE0yRnN3elVWVm5J?=
 =?utf-8?B?SVdQRXI4RXR5SlNqK3NFaXpDblFZbE1MMDc5TkRnVzFIUDN1TUZuRUFZcG0x?=
 =?utf-8?B?a2JiRTVEY2Z6bVk4Y25rYW1RZUQzM1VnT0dvSVphZklnaGwzekdyenc3bVpZ?=
 =?utf-8?B?RzNQWVJNUjVDcDZYc3JIMDFaOHF1YkJybkRxVlduRGtiYm8xV3FiMGdod3F2?=
 =?utf-8?B?bXlHWXRNSGc2dERlM1lGNDJ2SGpKVFFwcVBtYi9qNUtkUEozdVVkVGhsQ2Rs?=
 =?utf-8?B?VjA2MVgxam5BVzh6YmJrQ2d0WWNHc3NFblYvR2xQQmpZak53b0J1S0QvRWNT?=
 =?utf-8?B?SzdlSkxZTUNDcFdZRklOWWY4aTc0dk9EQVVYY2pmVzVwbHJsN3dyUmg0Wmoz?=
 =?utf-8?B?V1VlTDVqbkMwNVM2Lzl5UDdHT3ZxMEY2K3N5TERUU2gxUkc0Sno1UFpleXpG?=
 =?utf-8?B?aE9sUnFiL0tmT1NGcHV5V1pYN1BsbWdtOTFKR1BXNXowQjFiNVlsU1d0dEJ6?=
 =?utf-8?B?anc5TnJJWmxsbUJ5S0xSS250djZtMzZ0YjR0ZC9sanY3dTJhcjR2OEozVVBq?=
 =?utf-8?B?ZzkxUWt1SnJpOGhycmxLenBuVlJxcDlSc0V4eFZZOWlUOFVHYzhmL08yUzZ6?=
 =?utf-8?B?YjNmL0N6anlONVA3MU5TUWNSOWd3L1VTLzFIVVJLMUpRTXlvbmRpa09iSGt1?=
 =?utf-8?B?T2g5VUJxMk1jOVBOc3V5K0VldncySlRmeXpwTHpubFBDdnNIZE9XdE42cjZp?=
 =?utf-8?B?OGpvY1V2VzVQT1lBQVlJS0RqMU5VYlcycUlVK2FpQ3B3K3pVSHRsakN6VVF6?=
 =?utf-8?B?NnlzVk1pQnpXODdCdmFObGdJUlJLUXAyUExlZVo0Y0JiQXZXVXdjU0ZOK3Zu?=
 =?utf-8?B?U1FWazhOMGNrSXF6cHd3bGIzUC9iK05aOXFsZ2IyMmd4NWpmd00yaWF3T255?=
 =?utf-8?B?aE52Uk9JU0E5QldpblBZY0llcmVXZ1BEUjF0aDJ6SlRwOHF0WTBwWCtiYjJn?=
 =?utf-8?B?dFFORzkzMjNzeCtudXhMaWlnWjRBWEMzWGsyYVZJWmlaVWFKRTZ0QkdmOTlU?=
 =?utf-8?B?TjRhcFA0dFRLS09FWmVwcTRPaDVVL3hTQXBIbHJnRkRuNktQSnVUS01LVmQ1?=
 =?utf-8?B?QWFyTGFOUno1STRJQUxXSTNrR1RSemNxd0RHYU1JL2F4YUVZdVBvckZMdU5v?=
 =?utf-8?B?ZUdjNVk1d3ZYS0lDZzByOW1idFI5STBvcnd6RHBZRnZTTEtwaVBDbVcvVkdS?=
 =?utf-8?B?NjRMei9Ga053VGx1TWJuN09Dd3ExRE9RbGxKelpyVG4wclZrT2ZMRm5ZMDc0?=
 =?utf-8?B?QmhTMlFZT3ROVXNWZHAvSVNDVGxaSlhOenVlbjdPZU5UanRvd05PQWdtWGNj?=
 =?utf-8?B?NlFsK21Bbkp4eW5LT29QYVhoLzdwYmF6REhGN2s2WUJmZVArbFNOMklMdUt0?=
 =?utf-8?Q?s6/OiNVeRUey2slEI5YSi1xjv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df87167-0fc7-48d1-f437-08db04bda8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 01:34:43.1349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+y08e1owk/ykLHMu5baL7O6zBCBmK3KIZCQBmwd7hh7xSNtPE4R8cVdxFGgeZMQXSJ0z6marT7IEzbEDwvw1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0KDQpSZWdhcmRz
LA0KR3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHdWlsaGVybWUg
Ry4gUGljY29saSA8Z3BpY2NvbGlAaWdhbGlhLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMiwgMjAyMyAxMjo0OCBBTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBrZXJuZWxA
Z3BpY2NvbGkubmV0OyBrZXJuZWwtZGV2QGlnYWxpYS5jb207IEd1aWxoZXJtZSBHLiBQaWNjb2xp
IDxncGljY29saUBpZ2FsaWEuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29t
PjsgVHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+OyBMaW1vbmNpZWxsbywgTWFy
aW8gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS9h
bWRncHUvZmVuY2U6IEZpeCBvb3BzIGR1ZSB0byBub24tbWF0Y2hpbmcgZHJtX3NjaGVkIGluaXQv
ZmluaQ0KDQpDdXJyZW50bHkgYW1kZ3B1IGNhbGxzIGRybV9zY2hlZF9maW5pKCkgZnJvbSB0aGUg
ZmVuY2UgZHJpdmVyIHN3IGZpbmkgcm91dGluZSAtIHN1Y2ggZnVuY3Rpb24gaXMgZXhwZWN0ZWQg
dG8gYmUgY2FsbGVkIG9ubHkgYWZ0ZXIgdGhlIHJlc3BlY3RpdmUgaW5pdCBmdW5jdGlvbiAtIGRy
bV9zY2hlZF9pbml0KCkgLSB3YXMgZXhlY3V0ZWQgc3VjY2Vzc2Z1bGx5Lg0KDQpIYXBwZW5zIHRo
YXQgd2UgZmFjZWQgYSBkcml2ZXIgcHJvYmUgZmFpbHVyZSBpbiB0aGUgU3RlYW0gRGVjayByZWNl
bnRseSwgYW5kIHRoZSBmdW5jdGlvbiBkcm1fc2NoZWRfZmluaSgpIHdhcyBjYWxsZWQgZXZlbiB3
aXRob3V0IGl0cyBjb3VudGVyLXBhcnQgaGFkIGJlZW4gcHJldmlvdXNseSBjYWxsZWQsIGNhdXNp
bmcgdGhlIGZvbGxvd2luZyBvb3BzOg0KDQphbWRncHU6IHByb2JlIG9mIDAwMDA6MDQ6MDAuMCBm
YWlsZWQgd2l0aCBlcnJvciAtMTEwDQpCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwOTAgUEdEIDAgUDREIDANCk9vcHM6IDAwMDIgWyMx
XSBQUkVFTVBUIFNNUCBOT1BUSQ0KQ1BVOiAwIFBJRDogNjA5IENvbW06IHN5c3RlbWQtdWRldmQg
Tm90IHRhaW50ZWQgNi4yLjAtcmMzLWdwaWNjb2xpICMzMzggSGFyZHdhcmUgbmFtZTogVmFsdmUg
SnVwaXRlci9KdXBpdGVyLCBCSU9TIEY3QTAxMTMgMTEvMDQvMjAyMg0KUklQOiAwMDEwOmRybV9z
Y2hlZF9maW5pKzB4ODQvMHhhMCBbZ3B1X3NjaGVkXSBbLi4uXSBDYWxsIFRyYWNlOg0KIDxUQVNL
Pg0KIGFtZGdwdV9mZW5jZV9kcml2ZXJfc3dfZmluaSsweGM4LzB4ZDAgW2FtZGdwdV0NCiBhbWRn
cHVfZGV2aWNlX2Zpbmlfc3crMHgyYi8weDNiMCBbYW1kZ3B1XQ0KIGFtZGdwdV9kcml2ZXJfcmVs
ZWFzZV9rbXMrMHgxNi8weDMwIFthbWRncHVdDQogZGV2bV9kcm1fZGV2X2luaXRfcmVsZWFzZSsw
eDQ5LzB4NzANCiBbLi4uXQ0KDQpUbyBwcmV2ZW50IHRoYXQsIGNoZWNrIGlmIHRoZSBkcm1fc2No
ZWQgd2FzIHByb3Blcmx5IGluaXRpYWxpemVkIGZvciBhIGdpdmVuIHJpbmcgYmVmb3JlIGNhbGxp
bmcgaXRzIGZpbmkgY291bnRlci1wYXJ0Lg0KDQpOb3RpY2UgaWRlYWxseSB3ZSdkIHVzZSBzY2hl
ZC5yZWFkeSBmb3IgdGhhdDsgc3VjaCBmaWVsZCBpcyBzZXQgYXMgdGhlIGxhdGVzdCB0aGluZyBv
biBkcm1fc2NoZWRfaW5pdCgpLiBCdXQgYW1kZ3B1IHNlZW1zIHRvICJvdmVycmlkZSIgdGhlIG1l
YW5pbmcgb2Ygc3VjaCBmaWVsZCAtIGluIHRoZSBhYm92ZSBvb3BzIGZvciBleGFtcGxlLCBpdCB3
YXMgYSBHRlggcmluZyBjYXVzaW5nIHRoZSBjcmFzaCwgYW5kIHRoZSBzY2hlZC5yZWFkeSBmaWVs
ZCB3YXMgc2V0IHRvIHRydWUgaW4gdGhlIHJpbmcgaW5pdCByb3V0aW5lLCByZWdhcmRsZXNzIG9m
IHRoZSBzdGF0ZSBvZiB0aGUgRFJNIHNjaGVkdWxlci4gSGVuY2UsIHdlIGVuZGVkLXVwIHVzaW5n
IHNjaGVkLm9wcyBhcyBwZXIgQ2hyaXN0aWFuJ3Mgc3VnZ2VzdGlvbiBbMF0uDQoNClswXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbWQtZ2Z4Lzk4NGVlOTgxLTI5MDYtMGVhZi1jY2VjLTlmODA5
NzVjYjEzNkBhbWQuY29tLw0KDQpGaXhlczogMDY3ZjQ0YzhiNDU5ICgiZHJtL2FtZGdwdTogYXZv
aWQgb3Zlci1oYW5kbGUgb2YgZmVuY2UgZHJpdmVyIGZpbmkgaW4gczMgdGVzdCAodjIpIikNClN1
Z2dlc3RlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
Q2M6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0KQ2M6IEx1YmVuIFR1aWtvdiA8
bHViZW4udHVpa292QGFtZC5jb20+DQpDYzogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9u
Y2llbGxvQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBHdWlsaGVybWUgRy4gUGljY29saSA8Z3Bp
Y2NvbGlAaWdhbGlhLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9mZW5jZS5jIHwgOCArKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNl
LmMNCmluZGV4IDAwNDQ0MjAzMjIwZC4uM2I5NjJjYjY4MGE2IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jDQpAQCAtNjE4LDcgKzYxOCwxMyBAQCB2b2lkIGFt
ZGdwdV9mZW5jZV9kcml2ZXJfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJ
CWlmICghcmluZyB8fCAhcmluZy0+ZmVuY2VfZHJ2LmluaXRpYWxpemVkKQ0KIAkJCWNvbnRpbnVl
Ow0KIA0KLQkJaWYgKCFyaW5nLT5ub19zY2hlZHVsZXIpDQorCQkvKg0KKwkJICogTm90aWNlIHdl
IGNoZWNrIGZvciBzY2hlZC5vcHMgc2luY2UgdGhlcmUncyBzb21lDQorCQkgKiBvdmVycmlkZSBv
biB0aGUgbWVhbmluZyBvZiBzY2hlZC5yZWFkeSBieSBhbWRncHUuDQorCQkgKiBUaGUgbmF0dXJh
bCBjaGVjayB3b3VsZCBiZSBzY2hlZC5yZWFkeSwgd2hpY2ggaXMNCisJCSAqIHNldCBhcyBkcm1f
c2NoZWRfaW5pdCgpIGZpbmlzaGVzLi4uDQorCQkgKi8NCisJCWlmICghcmluZy0+bm9fc2NoZWR1
bGVyICYmIHJpbmctPnNjaGVkLm9wcykNCiAJCQlkcm1fc2NoZWRfZmluaSgmcmluZy0+c2NoZWQp
Ow0KIA0KIAkJZm9yIChqID0gMDsgaiA8PSByaW5nLT5mZW5jZV9kcnYubnVtX2ZlbmNlc19tYXNr
OyArK2opDQotLQ0KMi4zOS4wDQoNCg==
