Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2F68A112
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF19010E82F;
	Fri,  3 Feb 2023 17:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11012003.outbound.protection.outlook.com [52.101.63.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D1710E82F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 17:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMxGl+6rexT2WKngguILCy22cBWMwuq6zAsmo1DjRjpPWRxnhI36qLt0xX7VxbErM/QN3cflYABNdHOVExT8c/eKe9Idy/H4nzBfKgxRIn898jxAy2L225hoPLOKlfJht8OwbFEQ6WH+gp0BV6KSx85kfnI5GTNE8ZHRoTy0t2ZW16Y3dHWryhl1VNRLWVF1HdxETlgIVgBGPCikMd93VwuX8bgBysQ3VeMhQnBumNYQChE/nFkieR3QnBTcHLYO3dLMEPgeIgmCPE0zuwaECMrzXJhFNcGZX9E1Y6rO6laL/QD0nWYtWa/bTAXYwo12mvBOmZe+rJ0PNZ5HaOod6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8gXUBB+1W/d/JlndUOf4HCJHAQQS6bxW4mt+oZnMsE=;
 b=Jxt0fSiY+zeDA9ItnYzalhsoWuGqVO9SjYSbh2w6Qkuf3A6Smo2iNK897tq44pkHwhpazd4ZqljYhL8TPnKNGM26xhHhgr+obeNQEiYcVEPkvWOJH/JztkF5kyTuZyv76XHHWl+xEQ8m30+eiS04EC0VNXk4h06jYPmi2APvTGHlHV5kNVLcSz787NIBUUC5yE3JOUeOZ4AcnlQGZhX50nlt2N3QAWOF5rn+e+7VxWLjVYtUbS31uhvyqoLetipkElepwl4fL3X/Eshcu5/nzWOByOJfpsjUYjlBm3EuMKUAGpJFWSPGnjPAXfv6TKoRYKAMbPSHOxMWPFCFJsxAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8gXUBB+1W/d/JlndUOf4HCJHAQQS6bxW4mt+oZnMsE=;
 b=NY/3CoErOM/XUHyu0jw+vQ1+HwIKfdSAaogRlS5CbMgUZrLRtS1gOei5zv/SdwR9c66OU5t4M5R31m9uFe13s6aEjIcT3fyM2+7iMwnDJC3JTxu5WOzbyzkF2JQTcRLlkfk991NClmAdMZ/n/7wvoLT82xNX9PU7f5/1+ofIIxM=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by BYAPR05MB4101.namprd05.prod.outlook.com
 (2603:10b6:a02:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 17:59:38 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%7]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 17:59:38 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "gustavoars@kernel.org" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/vmwgfx: Replace one-element array with
 flexible-array member
Thread-Topic: [PATCH][next] drm/vmwgfx: Replace one-element array with
 flexible-array member
Thread-Index: AQHZN26fT9/DBELmkEKq8kY5scOJ6a69g7GA
Date: Fri, 3 Feb 2023 17:59:38 +0000
Message-ID: <1fe39e552a908f09ae5341f4c4dc9419e48e619e.camel@vmware.com>
References: <Y9xi7nFWRV3S9gCg@work>
In-Reply-To: <Y9xi7nFWRV3S9gCg@work>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|BYAPR05MB4101:EE_
x-ms-office365-filtering-correlation-id: b0684e02-e566-4cc2-f8a0-08db06106ad7
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J4fCc93aU2PRCppsLXg+bcErtHKKTMxXUAYy5CpsY2LV99qMVmTZW38R3/7V58DWF1RpooiRgF6QjGqG66a19Tm5xtIMjNiHXGk+OgXvgIlBVuQgs3+/+aPpBoGDRnNLCiCBECC+G83MYVliwm9MdWQUf2jrzE3WaacWpfU3btdXRk/SEQYpbceeIqKHRytLONQ8Kwm9JBQ/lRKRBM7zM8YALIcMZTHQLzKLKvTunLfWVzh751aRkN+zjjL27LoVYW6/2I1OMHoaOjL9w9w1q/OHFoccNvoe3Hey2Uq1W4ZP5+EHMwVTlNPRu5fZnCJ/wBKQmyI9dcTVVXu/JO9yg2rcrEyPy62cye3wHgjW1ExUCfIgJ1fwkjtK/QB4eeTY4CRBekKzMTmIeFN1+KrS/seNKEgU0fwrXZotE9UZ6v1x+pbfktxoVOGSJgOqQG+9iApmRl7X8TZ+Vi+UrvW0S6iDD+MlE2h40dabVTCjWo3uQ/1ul+9ygrdLlSx+i8TMhyhKKQkfWZenJHfvZZ1f1dw7GeXmpXaZGUZwr7ZhrpSDqP5irUUvGyP4ibu+DRzTVuu0QiQkm/lehCn6EyuIAhkJlK+rxq/5gCQRcJf70gnzEqvgg943pLyg9SLTs1zUUJEFCw1YsfISU3ZwsBcodhzySvco3kwqvaBtRQpLjUgRcTGbNWjZTouKalFXDAKeQPp26+QTQj66VZw+S7E1O6TOLGQjy6xi1yoBz+SzdxbZSmy/Yedjpc3yvRdzt8ElwGWs5t4VKdFZqNlEgPzcg5ixuPbFImDGCn5Toi6C700Q0doq7n/yJQuGNIlfvHpAP+KXWTlZbfzhaxz4aWYSoC8JmQcYA4HDkJH6zUbAZ62aDwDaUaeMibjIfv5SXe7T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199018)(316002)(4326008)(66946007)(54906003)(91956017)(110136005)(8676002)(66446008)(41300700001)(8936002)(5660300002)(76116006)(66556008)(64756008)(86362001)(38070700005)(36756003)(38100700002)(122000001)(66476007)(26005)(186003)(71200400001)(6506007)(6512007)(83380400001)(2906002)(6486002)(966005)(45080400002)(478600001)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2E2MmNvODNuOWJtWHFwcjFYY0EzSm80OFgzRVdRSnNxU2llc3BaREtQMkQ2?=
 =?utf-8?B?Q2EzY2JMZDNWcUFoaWtDeVM4d2Jhb1BBaEYzR0llamY0WStzdnE3QktKd0x1?=
 =?utf-8?B?R0JOZzZ6L3BydUFxY1ZMS0pTQ0hxRnZSWW42MEJpVGlvVmNTZ0FPclV0OFZ4?=
 =?utf-8?B?MkYzVEZCSlVJSVdweWswTzYxUHkzOVB1Y05pNC91V0lCUFZpa2ZYOHdVZkpz?=
 =?utf-8?B?VjNwOWJpR0h6S1lQUWVoR1I4KythYko5ekRrNEc4bWpwaWZzaXZDc3hiWEQ4?=
 =?utf-8?B?M0s5cmJRNVVERkJObjcxWTRxK01ZbnczUDVNbDNiV2prcFRwSlRZdUJvbjR5?=
 =?utf-8?B?Q2NPWjJ5dXp3UW5jbEF1VlFkOVhLUE9sRUNIOFN3Y1Rubk9EUmNBd3RIZFA1?=
 =?utf-8?B?QS95bXArRzRWQ0Zyb0YwcnRSZTZBY1Bic25GcE5yRjltSnk2em92TEpWSzEy?=
 =?utf-8?B?ZVNYbHJkQytJMU4waEVOYU5xTHhnR3FMSzQxK3Yxb3REZy9hLzduUTVybXdZ?=
 =?utf-8?B?RnJuYzhUYUUvdHgvYTNDczhWeWU3MG0xSUNiaUFsUytqd0RtcXM3SGJvR3pt?=
 =?utf-8?B?MnpNK0pXWllsVi9DOW5JRVBrNGFwdTVpNDJmREhEaVU1M2UxU1lSKzRaaUFI?=
 =?utf-8?B?WWtybVUyUTJuWENuUU4wbEdkUURzRHNHY3ZCNmcxQlAxOE5hVXVVK1ExNEdo?=
 =?utf-8?B?VGhxUG52bVFqakZaZUw3R1BKQ0JDajh0UDdZcHRZQVh5UUVwNjk3S3FOQ3BY?=
 =?utf-8?B?M3JIV1d2ZVplTEQyS3dSMTd1SE1lQmowcFFXWnp6a2dkbzV5dm5HeE0wK09h?=
 =?utf-8?B?c0d3b1dOYUxneUtSWUlDZkVHUGdXOWwxSWJrWlU0WGhwNDJlVG83M2E5dlRk?=
 =?utf-8?B?YmxYZkFIVk5ENGxlMDI5cForREw3M0FjWFZEcnAvK1IvV3Q4VDdiRTFrVGln?=
 =?utf-8?B?YnRzTnF0U2dBRi94UERDS1hyTVE3dXZpVzhUQWxTZWJnd3Bzc1Q4K2dOQkdH?=
 =?utf-8?B?RldQdER3VGFwT3JXa3kyTVZZbytmTmQrVHY0Vlc2aTRFOVBCc2lLOXRGdXZY?=
 =?utf-8?B?R2szN2FyZTRrOUUvRnd5NTMydHZmUWhhQVA4alNxQXM0NXV4bWlZTzdmZnho?=
 =?utf-8?B?NXFYY0dXNGxObENzblJQZVFXNGRGNnVsakFZTFNXK1doMUhOOGNFeitwNlB4?=
 =?utf-8?B?SVFjZHVSeldyZ0ZVOTdnVTlUcU9FVDhsOU9jblZoWnhRc1BhK2hvcVdjbU1P?=
 =?utf-8?B?RzY5N3h5V3RtSUhrT0pOWXMrWW9BNExBU3JYT0JFQnA0eEVoWU9nTExCTTVF?=
 =?utf-8?B?aThlZEIyYlVyVHBQdkxCMXdoOGh1bHBWUkU1QXhEVWo3UHhnL3RJSm13Mk9h?=
 =?utf-8?B?alZaNWJDbjhsbjNtNnMwUmM0Yyt4OVdGRXUzQkFiZVNRVGJ2aHNGdnpoT3pu?=
 =?utf-8?B?VzRaWUdsZGFhQy9XOFhuWVhDRDZ6RjdjOEdQV1g4aDlwSHpLTUpwSzNVb0Nz?=
 =?utf-8?B?TC9qT1JVQ3N6T1JMUVkwWlhHNDNLdWVxcXE0ZkN6dnl3b3NOQ1lEZy9ibWFm?=
 =?utf-8?B?K3ZhWkczeHIzZ0dpcFZWZzNGMTVpTUJhK1BRbU5YN1I3STZSQ0hBZ2k5QkVa?=
 =?utf-8?B?RFM0RkJHS1pjd3hFc2JoTE1ucFo1S1lJRjliTkF6OUNLd0NYK3FIYnFReWY4?=
 =?utf-8?B?bWdsbXBJbXRVUWNhUmdSbEtEUUd2VUd5NEgxYUtucTVmZWRLVTFwOUt1MlVo?=
 =?utf-8?B?YVpmYkxUc0VVWTVzdm9KWDZBWWduR2tpeEV3bDRJZk1WbUFwa2JNc0t1VW1o?=
 =?utf-8?B?cWo1emk0Q3RDQTRGU3NTQVhLVlZFK0t1aGRJR1RBRDJtRkdoZS9yYVRGWld6?=
 =?utf-8?B?Rkk3Yzk1b25mdVJ0aTR0Y2djcmh0THpNUHBhVXVpb2loejBZOXIzRlQyUVNr?=
 =?utf-8?B?S3liYWJJdjNxUStVMTNkb0xVaWlyQkwxd0RGVjBOcGRaYlFxbWJlaElBWFVH?=
 =?utf-8?B?UGhSY0VDV3lsbFlRT1JEOWhDZmR1VWNUcmhtdENEMHRZb0IrL2hONkp6Rk54?=
 =?utf-8?B?dFVDME1Tdmo3TWhTejVtQTFjckE3eFBmTGxJa1FoaHJQVVpjSEluMDNobDRs?=
 =?utf-8?Q?jeirP6CyWUMV9i1mW4Qv1QXj1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B20123A505E7294485B57C86946C2E1A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0684e02-e566-4cc2-f8a0-08db06106ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 17:59:38.4370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OUjYBL1wZ83QB9RNguZTaR/qMWQ10KeIZ8bSjNnFe8RiAYlaOkc16pxGvEbWcR4R2SfSoErpsgNF8x893BJUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4101
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAyLTAyIGF0IDE5OjI3IC0wNjAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdy
b3RlOg0KPiBPbmUtZWxlbWVudCBhcnJheXMgYXJlIGRlcHJlY2F0ZWQsIGFuZCB3ZSBhcmUgcmVw
bGFjaW5nIHRoZW0gd2l0aCBmbGV4aWJsZQ0KPiBhcnJheSBtZW1iZXJzIGluc3RlYWQuIFNvLCBy
ZXBsYWNlIG9uZS1lbGVtZW50IGFycmF5IHdpdGggZmxleGlibGUtYXJyYXkNCj4gbWVtYmVyIGlu
IHN0cnVjdCB2bXdfdmlldy4NCj4gDQo+IFRoaXMgaGVscHMgd2l0aCB0aGUgb25nb2luZyBlZmZv
cnRzIHRvIHRpZ2h0ZW4gdGhlIEZPUlRJRllfU09VUkNFDQo+IHJvdXRpbmVzIG9uIG1lbWNweSgp
IGFuZCBoZWxwIHVzIG1ha2UgcHJvZ3Jlc3MgdG93YXJkcyBnbG9iYWxseQ0KPiBlbmFibGluZyAt
ZnN0cmljdC1mbGV4LWFycmF5cz0zIFsxXS4NCj4gDQo+IFRoaXMgcmVzdWx0cyBpbiBubyBkaWZm
ZXJlbmNlcyBpbiBiaW5hcnkgb3V0cHV0Lg0KPiANCj4gTGluazoNCj4gaHR0cHM6Ly9uYW0wNC5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHVi
LmNvbSUyRktTUFAlMkZsaW51eCUyRmlzc3VlcyUyRjc5JmRhdGE9MDUlN0MwMSU3Q3phY2tyJTQw
dm13YXJlLmNvbSU3Q2EzZWIwMjZhYjgyZjQ0ZTNiMWQ3MDhkYjA1ODViZDg0JTdDYjM5MTM4Y2Ez
Y2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3QzYzODEwOTg0NDI1MDYyODQyOSU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPUk3SXpa
TXU2OTJCSGk2OHNKRlRmU29uUjRPWVcxS2Q1RDZDRU5JaXpyc3clM0QmcmVzZXJ2ZWQ9MA0KPiBM
aW5rOg0KPiBodHRwczovL25hbTA0LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGS1NQUCUyRmxpbnV4JTJGaXNzdWVzJTJGMjU0
JmRhdGE9MDUlN0MwMSU3Q3phY2tyJTQwdm13YXJlLmNvbSU3Q2EzZWIwMjZhYjgyZjQ0ZTNiMWQ3
MDhkYjA1ODViZDg0JTdDYjM5MTM4Y2EzY2VlNGI0YWE0ZDZjZDgzZDlkZDYyZjAlN0MwJTdDMCU3
QzYzODEwOTg0NDI1MDYyODQyOSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mz
MDAwJTdDJTdDJTdDJnNkYXRhPUhrOTd4M2k2eEhPcnEwOWl1RFlvanlTVTlIOHVsdmxBcnpHWG9L
ckVEdFUlM0QmcmVzZXJ2ZWQ9MA0KPiBMaW5rOg0KPiBodHRwczovL25hbTA0LnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnY2MuZ251Lm9yZyUyRnBp
cGVybWFpbCUyRmdjYy1wYXRjaGVzJTJGMjAyMi1PY3RvYmVyJTJGNjAyOTAyLmh0bWwmZGF0YT0w
NSU3QzAxJTdDemFja3IlNDB2bXdhcmUuY29tJTdDYTNlYjAyNmFiODJmNDRlM2IxZDcwOGRiMDU4
NWJkODQlN0NiMzkxMzhjYTNjZWU0YjRhYTRkNmNkODNkOWRkNjJmMCU3QzAlN0MwJTdDNjM4MTA5
ODQ0MjUwNjI4NDI5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFp
TENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0Ml
N0MlN0Mmc2RhdGE9JTJCM1FSbWh1RXZFT2VtODlEbzZocFMzJTJCNXNGRGN1UyUyQldXaDl5djZ0
cmlvZyUzRCZyZXNlcnZlZD0wDQo+IMKgWzFdDQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4g
Ui4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfc28uYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zby5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
c28uYw0KPiBpbmRleCA0ZWEzMmIwMWVmYzAuLjBmNjk2Y2NhZGRjNiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc28uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zby5jDQo+IEBAIC03MCw3ICs3MCw3IEBAIHN0cnVjdCB2bXdfdmll
dyB7DQo+IMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCB2aWV3X2lkO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIEltbXV0YWJsZSAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGNtZF9zaXpl
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSW1tdXRhYmxlICovDQo+IMKg
wqDCoMKgwqDCoMKgwqBib29sIGNvbW1pdHRlZDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogUHJvdGVjdGVkIGJ5IGJpbmRpbmdfbXV0ZXggKi8NCj4gLcKgwqDCoMKgwqDCoMKgdTMy
IGNtZFsxXTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJbW11dGFi
bGUgKi8NCj4gK8KgwqDCoMKgwqDCoMKgdTMyIGNtZFtdO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogSW1tdXRhYmxlICovDQo+IMKgfTsNCj4gwqANCj4gwqBzdGF0
aWMgaW50IHZtd192aWV3X2NyZWF0ZShzdHJ1Y3Qgdm13X3Jlc291cmNlICpyZXMpOw0KDQpSZXZp
ZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCg0KV2lsbCB0aGlzIGdvIGlu
IHRocm91Z2ggbGludXgtbmV4dCBkaXJlY3RseSBvciBkbyB5b3Ugd2FudCBtZSB0byBwdXNoIGl0
IHRocm91Z2gNCmRybS1taXNjLW5leHQ/DQoNCnoNCg0KDQo=
