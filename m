Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ECD6A08EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E959810E202;
	Thu, 23 Feb 2023 12:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA210E202
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAKXN+SzXxgtuaabeAxi3JSOz6SPdffTAQRl2BqJAFOyvy9fljcGBmpeiZwc6kCiMKntlc3oF1bMvfV5x7H26V2Nod4coSL+pFIylVFFLKoDGWMh4bku79EHIx3+YjHC4pP4C3+XOzZ76qp1SCZtVnAaqzsb5rwZEUSeAILGxNJdTEcrwCRI07gOgZRC5FSUrF6ICMVVPMWbMPNZ6dTjnGhdLwEpcoBSBUI9RQgmZJciv4JZjVNcphqz9OlaDzqzPB7wLbr43kna9DRM6T0vBExeLZ2jjjXK9Eypj1kV5Y55kj8mDkupIKEG3BIrWkdtWstwDdrlXRClN+hNkcFxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsPzAL1zcUIWw122ZkVrzeZ1jOj8zPepyBkKLHhJw64=;
 b=eZMFadcq3RiGtJUh0F0cL1XTtx1wax65M2sF356If21sgk5tMbk6SxX6BifXKt0gg3GycMbTF1o4L2PQXLnZV4tKa/P/ixOt1tJJr8eadJ/U6e5fSdoT455jre2EE4rjF8Ufkot9HBNePM4fl/Q0v4Z2/H1t8J7CL9uSBtfodEOa9QJQaHCsbFezIkHA25F6K+RFyWryDIN+L1PtQ71K8MejR9c8CZj3cioAVKFZ2+Y+I6SPKMotsPrMshk5uwx7iQwiTbQFR92BFjYfVPqYoJvGXhnL0nSo5TqNdGtu2J8457yvZSSfVXlv613qk7mzHRLlgKqXTvP2cno2w2/kEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsPzAL1zcUIWw122ZkVrzeZ1jOj8zPepyBkKLHhJw64=;
 b=ZaZgXEE29ZGgBUm5oXVo7Bl8Ztdt4tcwlx16DkWi9GiEwb0mk/jgzpPBT3J4MbYGGYAqbQh2L8b5eQ4M/NYhtPSImMLX4QvsnAe70BXwrBu8jM1bJxsRjAfFJLa5I6clkCor03HvV1FhyZ5CLyvkXzW3m1FBcH7YrQ9PUKPEL7Y=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by SA1PR05MB8327.namprd05.prod.outlook.com
 (2603:10b6:806:1d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 12:50:24 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6111.021; Thu, 23 Feb 2023
 12:50:24 +0000
From: Zack Rusin <zackr@vmware.com>
To: "tangmeng@uniontech.com" <tangmeng@uniontech.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Topic: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Index: AQHZR1Unjoj41030h0yn+mDWgyFFg67cfB+A
Date: Thu, 23 Feb 2023 12:50:24 +0000
Message-ID: <c5ba07a5ad3c6b101126a97eb094c51013ee83c0.camel@vmware.com>
References: <20230223070405.20228-1-tangmeng@uniontech.com>
In-Reply-To: <20230223070405.20228-1-tangmeng@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|SA1PR05MB8327:EE_
x-ms-office365-filtering-correlation-id: 82ab2df5-01d1-47a9-4c26-08db159c87d2
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VgZ5YizddEhBweN9Kpppoo3jKXc9FHTn3pD0vYuBGTjVoG3bbmzBJSlVRo8EzpDW4Rh00VAX+i+/hJef9qcCMFlL8HXnG5ySAcIaW1eOtNACPojzDhIoqeA6SUPjMudxPshulOIUe4Rw9iAepYLTDjo5te5v0aycHPqGY4E0B3i6OnpT+GdIUbSFFKEX80bp0kTSQ5WbS1jMvnxkAWmOtJ4v/sxQdRnz6UcU6SdOtCe/OP6Q3X8bPrLnVCy5rO4WycUTQ8uL5qy1IsYucG9cC+OD+i7Pdoi1oCZ9YAYukt55Vif9xwhAfAVwFVNTfscc/rQLNl+6LCvh2XtWXpbsa8i12ORgV5Tr/dg14pwsf3vI20OSi+USWe7n9eiiYGdqdjBrZLU3PVuHpifuH1FDxa1ThYw1z9wry42oSbL7n56Of5H6dTB6E/miJ2IBj2OJkPW2Tor7wW90pUjfiZTcJNBZXJsTVx7SskrONWnTi1sccXl7b9LoVD/4ANZQjaofixX5DA+OgLucN8krUkRthvBFyA+nOFKfxNiTCQjG2d3HfhQY9njDPUNlDyNLUCwZbyYmIla3fW7W7bXljCSULpt4PkiOoeHJKv8a6aC+aLs1U1ncirRsRA/p9gA09iRdEuDPiTYBuU1AZDWtakaNUKIAPBW9x7xuSKlit7ybY1EOafCkCmZ22Sam9bFsjwOw1gT+7TT2jlu1noCZgQJWyoIgIvZAYgrf985PkeodMiH1+gkiITvlLtaX98YX1uSY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199018)(26005)(186003)(38070700005)(316002)(41300700001)(76116006)(91956017)(64756008)(66446008)(66476007)(66556008)(8676002)(66946007)(71200400001)(6486002)(110136005)(6512007)(6506007)(478600001)(86362001)(36756003)(2906002)(83380400001)(38100700002)(8936002)(2616005)(122000001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG8vdUhRTVN6b1N4OXdZb2pVS0ZEcnFGRDFaaFBrTUFURFNIeHgra3dSd0Ur?=
 =?utf-8?B?akJvdTZQcHUrMkU5UlhkODZqTlNoWlE5bzdkSWFSVi9kMGVEMXNHY0xtcXM4?=
 =?utf-8?B?T2V1R2I0U21UQnlVdTJmY1pyV1IxZTBoMTkvdWwzZG1tS0ZwcmUyVndvUWZF?=
 =?utf-8?B?M0ZhTEY2QVNXeVYyR0RLMWZNNSt1NWNvK1p5c0NHdk9nTHNjRWxqUXNPa2Fy?=
 =?utf-8?B?Mmd5b3YvZ01kd0hMYkdOZ3ZBSndLeTI4OEV6NU9lRHVMb1MrTFV2WXZDTVhD?=
 =?utf-8?B?aUpFeVo3dDY5dERSa015SjJ1NnJqTjhDQnNFQm9nSEFzZDJpTExESDUxYVda?=
 =?utf-8?B?NDBWbWhQb0pNakNCajFJRnBsSEJpUFVVd1k1WDlmUSttVFprMTdZd1dTN2N1?=
 =?utf-8?B?TmRZZnpzRXVXZzZXSy9lRmJ3bnh1aU5TWTd5RXRCbjdCMHNSNXVHVkVoU1FH?=
 =?utf-8?B?Uk8wNGd0SXV2d3hVQ2tzZ0RlVGFULzhnN05RVnlkUERINUlQdVpwcU80TDJS?=
 =?utf-8?B?RUUySGFtMElZczV6eUs0NUIvTzBaazUzbFRSQXNaK1VNcm12Mmh2dmNpbFk5?=
 =?utf-8?B?WmpZVzJJS2p6TXd0UXFXK0h3dnB4blpRNjgwVlZxSTREdGljU3JlYnRkbTUx?=
 =?utf-8?B?TGEzSEZ5VFN1K2xob0FUUmNXVHFwZ2xWUk53aXdmKzFncEhKbXdsSk54a0FB?=
 =?utf-8?B?Vm1IdXJWSCtjUlhKb1pwcURxcVd6Z2c3WkZHeTgwNDN0NDN3QkJmeU9yNThx?=
 =?utf-8?B?WDVZTzhFN3EwbEx1dVpOeXhSbG5qMFdyeEJkRnF4NkM1V1RzRG5Pak1vUnZB?=
 =?utf-8?B?QjVIRzdoMjVmU2l0dWYvZlVIWTJsTFVOSWpEUlI1SE1BRXF4ZjFjS3JxMTEx?=
 =?utf-8?B?MExDNG1nZU5ydTlnTTFjcS9vR09NZlNPRDdTSmUzQnpveTQ0MExWUDVqcTZD?=
 =?utf-8?B?eFdFcEFrdmtqcXJsdURhN0duSnpHc0NQY3pMc1dvay9hc1d0Y3IyRmxGNlVp?=
 =?utf-8?B?Zk11eWxLUllWcmJEYnhNUjRSZWdDdEtuUm0wbWZ3VlRWRzJlaS9pUkdva3d5?=
 =?utf-8?B?KzJMdldNV1dJdlhNeENtQmdxdGljL1ZWNlhMYlVyWTZFV292ZWxSWks0Z1hi?=
 =?utf-8?B?L3JPck5sMG5UbFZsNlFsaWdrUUNPUTdFdXRtQ2tPaVkySGlRVmpaZGJpcGdN?=
 =?utf-8?B?MUpGZURRa1pQSktHWVcrN3ppNmNEWFJjalFaTmFCZjJEYXRUa0ZnQk1YUnlx?=
 =?utf-8?B?a0lPZnBQMktRUUdzbkRCYWFtM05tUTJlbWIvdDVsZjRyRXhXN2ttTFZMKzNk?=
 =?utf-8?B?T2ZBZHRrb1pJOXZaSllzRnEvWHJVbDE1Y21kMFB2QXR3RzZRTjVSR1M1QmxQ?=
 =?utf-8?B?MzFCbkZvTGpKZlVXRzJhNnFKNU5CYVIvR0thSDlmTFZ4VjdhK0YvWHpOK1Fk?=
 =?utf-8?B?NnJjb1NhdHluOC9DZHYrOHNERWJSaVlTYzBSOVVIVjJMZEQxeGY2cHVaaWYv?=
 =?utf-8?B?TytXVjVGN1lsaC95TFMxWXFiSDRZTGdrQjRyMUZKSmhaT1M1OTRVaFgyd3Iv?=
 =?utf-8?B?cVpzS2U3RG13S0J2cU44Z09DWDRVbXFFUW51REN4OFM3cXcrQ2VDR2JHNVU5?=
 =?utf-8?B?MklLbWxqeUVpdnNQbTEva1dpSWFHRnRaemtXZVRZQ2lCMnVZTzViZ2VYZGlZ?=
 =?utf-8?B?U3lLelBXVGpVUmdGVlIzN1hqMk5DQnpkV1BJY2plM0syNWpuUXk1bzZ3MHdL?=
 =?utf-8?B?VjBLTlJNemNML09VVEtnN2s3ZjEvV0Y4NEloSldTU2lsOGoyMGp4MThUQ1k5?=
 =?utf-8?B?WHRZVzJwSXgwck1abWxnU3NydUVPWTVlMjZzNXJNbk4vOTlYVmwrMG1lb0xX?=
 =?utf-8?B?bmJKNmg3M2ZlM1ovR0hUdjNQempLNkJWWFNHS24yZFNxWHBxeDRsdERBNmRZ?=
 =?utf-8?B?Qm5RMnNuVUYwZ09TSjFyQ0FxOWZ0VlhxMzZzcWZJYW9YVHhmYnUrNU8vS09r?=
 =?utf-8?B?K0hPQktOY0htWC9IbzIrZ0dwSDBGcmg3eUdNcGxPQnJkN2lwTjZwc3Fhakpo?=
 =?utf-8?B?N1BLYWd3dTgzMjJEVElRem1udE8rbGY1TlpEK3VNbDEyNzZ2MEM0QjBjeVA4?=
 =?utf-8?Q?Rb/51UKSTNXPFi4TlEhDlSCmO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18637A409CC30B499C6ABC3534F11CB4@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ab2df5-01d1-47a9-4c26-08db159c87d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 12:50:24.0532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I8DumwAWFx0uVoTqDw1Ypifys0dbujvXKk+aZ/xWPWERRWK0MydSzhs3np0wi8wTKuQJkBORwvWiuy094PJgWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB8327
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

T24gVGh1LCAyMDIzLTAyLTIzIGF0IDE1OjA0ICswODAwLCBNZW5nIFRhbmcgd3JvdGU6DQo+IEEg
cHJpdmlsZWdlIGVzY2FsYXRpb24gdnVsbmVyYWJpbGl0eSB3YXMgZm91bmQgaW4gdm13Z2Z4IGRy
aXZlcg0KPiBpbiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBpbiBHUFUgY29t
cG9uZW50IG9mIExpbnV4DQo+IGtlcm5lbCB3aXRoIGRldmljZSBmaWxlICcvZGV2L2RyaS9yZW5k
ZXJEMTI4IChvciBEeHh4KScuIFRoaXMgZmxhdw0KPiBhbGxvd3MgYSBsb2NhbCBhdHRhY2tlciB3
aXRoIGEgdXNlciBhY2NvdW50IG9uIHRoZSBzeXN0ZW0gdG8gZ2Fpbg0KPiBwcml2aWxlZ2UsIGNh
dXNpbmcgYSBkZW5pYWwgb2Ygc2VydmljZShEb1MpLg0KPiANCj4gVGhpcyB2dWxuZXJhYmlsaXR5
IGNhbiBiZSBxdWlja2x5IHZlcmlmaWVkIGJ5IHRoZSBmb2xsb3dpbmcgY29kZQ0KPiBsb2dpYzoN
Cj4gLi4uDQo+IGRyaV9mZCA9IG9wZW4oIi9kZXYvZHJpL3JlbmRlckQxMjgiLCBPX1JEV1IpOw0K
PiByZXQgPSBpb2N0bChkcmlfZmQsIDB4QzAxODY0NDEsICZhcmcpOw0KPiBpZiAocmV0ID09IDAp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoHByaW50ZigiWypdIFZNV19BTExPQ19ETUFCVUYgU3VjY2Vz
cyFcbiIpOw0KPiB9DQo+IC4uLg0KDQpUaGlzIGlzIGp1c3QgcmVndWxhciB1c2FnZSBvZiB0aGF0
IGlvY3RsLiBXaGF0J3MgdGhlIHZ1bG5lcmFiaWxpdHk/DQoNCj4gDQo+IFN1Ym1pdCB0aGlzIGNv
bW1pdCB0byBmaXggaXQuDQoNCk5vLCB0aGlzIGlzIGluY29ycmVjdC4gWW91J3JlIGVmZmVjdGl2
ZWx5IGp1c3QgZGlzYWJsaW5nIHRoZSBkcml2ZXIgZm9yIG5vcm1hbA0KYXBwcy91c2VycyB1c2lu
ZyBPcGVuR0wgb3IgYW55IGFjY2VsZXJhdGVkIGNvbnRleHRzLCB3aGljaCBpcyBnb2luZyB0byBj
b21wbGV0ZWx5DQpicmVhaywgd2VsbCwgZXNzZW50aWFsbHkgZXZlcnl0aGluZyB0aGlzIGRyaXZl
ciBpcyBmb3IuIEJlaW5nIGFibGUgdG8gdXNlIGlvY3RsJ3MNCnRoYXQgd2VyZSBtZWFudCB0byBi
ZSB1c2VkIGlzIG5vdCBhIGJ1Zy4NCg0KSWYgeW91IGhhdmUgYSBwcm9vZiBvZiBjb25jZXB0IG9y
IGF0IGxlYXN0IGEgZGVzY3JpcHRpb24gb2YgdGhlIHZ1bG5lcmFiaWxpdHkgdGhhdA0KeW91J3Zl
IGZvdW5kIEknZCBiZSBoYXBweSB0byB0YWtlIGEgbG9vayBhdCBpdC4NCg0Keg0KDQo=
