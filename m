Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F308726BB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3410F3CF;
	Tue,  5 Mar 2024 18:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="intW3G7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0F910F3CF;
 Tue,  5 Mar 2024 18:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbeD+d0bxXesHChETdrJFyyv8XZe8g+addV4WFb+Nl9OOEJq9NCSsA7DoKUHmM5fgLmfgl5256Mry86Qb8n3QGrU2YxEV/elvq9XaeAYzNQcAi5kXEaKp6msKLH9yDM7tcX6BLi++JAtfxEpcZxiMnpbmFiXWLkLZLoZOr63Ms2VN5zZLo1PRtlx9VFf2Wajy15+loumYOcYIEIu8a/zPWN6UCHRP2sM3yN2wTfeHIRAzH2MaCJHbjzq6vhvg3eN4nro7WeoKJpZljvucoiXyL9Ao5q4JRVmbBjPWRWjtVf7SSV8yZxjrk8pd3Ti0bygwKIp7J07ZsgntWfNRvfo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCiWSFDfv24dXyyUJUUM+lL+IuXu7upiYEPmP5PHpa8=;
 b=ci2F1g3N/kIg+MMeO6TWBO/kAhydyesxW3IezlzfSoCLl6eG3wYpwvn0ZmBK+SuIKOfZgOa7eX6XKzw/m2CBJW7JTcIb0gDSFYfSemDOjeNIb95/wacUgjPKSy3CwflllOruPedc8hJ2ZfQIlzMvmRWjVWG01QV7DsSX9b3fHk3A5oZiUaSfH5zKTySbqygqB9ds8E1o71vPLsgmfMcvs3yUiVhWqeoOFipQ26aG4ipD9Xmj3K4UhclbRoJbcetkQDOoreZobrXQ9UbSvjlJgsbZiUouC1frEO/o32XXTwDLtfJUUxVZtuodMXjroUsOswSzXfB5Ihyc4vMHjuoznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCiWSFDfv24dXyyUJUUM+lL+IuXu7upiYEPmP5PHpa8=;
 b=intW3G7NzWr1Y3Nk46QjHaw7qEFueq0T8KWygOsT/gRx2ju55wcaOc3y6cMawHHNWFP6yNWWmsDpvXt8bE9zzMOIU6mItrv5cozDQzE+HSDGBCeoBvE8mBx6D2urEyV9F1/cVOozzUKnFo/GJlt0GgnkgBrVSgEQrQljaF+dLyBiGtA1gIwe42kswt2RLAkL7XZdajMBPwyWFpPoZAC1g+uCssHz6WXwfIJkkT1SbH52BljXU+4ZjMTgW1xUD9CDxyszcP6Ukdx8fMEMivN2aXSdE2Yfrlbh7Sim8/aJ7mtmyOPqYFnXHMTJT8aj8LIwMaWCQz/iG/qO2GBQXoWlXQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 18:39:49 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 18:39:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 11afac187274a6177a7ac82997f8691c0f469e41
Thread-Topic: [linux-next:master] BUILD REGRESSION
 11afac187274a6177a7ac82997f8691c0f469e41
Thread-Index: AQHabykUrJG0RYvtDUCmXGbXfSqBmbEpeq+A
Date: Tue, 5 Mar 2024 18:39:49 +0000
Message-ID: <99f96c0399b473efe5f0c1c2cf4064ccc09870a4.camel@nvidia.com>
References: <202403060216.deurYF3s-lkp@intel.com>
In-Reply-To: <202403060216.deurYF3s-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SA3PR12MB9091:EE_
x-ms-office365-filtering-correlation-id: b9881b02-9523-448c-1306-08dc3d43a3a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5KTKiB3Tes22q/ZY/JmKGLXLIKzqIu5B0O9Jm7RKQ4AFtOpsxMTK6gslXJ8epO0+SJzvBzDKDu9et9FF7tH9mzLGg0HU6gWhATo9N8qtmq2ZQcd6ONIF4zi53e3zUDU+J0Gk16YGmCqmZiOXuP6xpEsO69JDCs8xsrNVQ4vkzpWZxkY2zP8nEhRmliHcOC555MbXrmsCAcneMwxUVP7dCtaA8sputlHaU2jtzUsx7AfbY0gsIhh2o/4FN/BaI9ZSe+dUDOw1pfIF3Iq79agyYZkD6XTJQMVQ9MIAaZAEYyfI2+XoigegN9i7TJoOZjDv8Q+PEFWLxT4B+s4Y846BGdTEejoGXCkizv8TTUM83wn8rEJfMdm+7X8ymA82E207DnS2A260j+rsbeh2kznliZwpftoJyPBF+JdlQJriD796qSO20KPshVM5HlIKHT6jgiiBqkhjIWBZdL+A0hjRbtK36WpAKQL3bwgl3iy2fofi2UQjcZzvhvE9IzoWMolrRSG7JOvWjHi7ZGTPGUH5uP8XYl6g0DmwJ6Yib1PbhPIxoRghxO9hgQZRyhYl8OmUpoIljJup5tw+Hhjqj8OMPsi6swWKIzXXPFz/aWM8XXh7xGxtyg4Z/Zs2LUD82H9DHUVVyTlY3mbKqCF3wVeZrCRWeGXxHIWTRHk+B2u4CJWOEiGRoIUMsJIYKCkwcKL4ColvwclgLrn3sevVdvGSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmZ6ZTMyaE5MUVZQL0Y1RXZ5eFEwWGR6dFpMYnlCYkt4UEFJWFhqUjRxMDRM?=
 =?utf-8?B?S0hTd3RkOXR4VUJydSt5RUFCRllzakVDS20rWEdJNXprN291Q1hpNDRKSXBa?=
 =?utf-8?B?ZTNtemVsMS9LM3R4WUtFSlZWcEhsbFJRS3ZleTVnZ0c5M1FmYllUUjltSjZS?=
 =?utf-8?B?OE56RUp1ZmhCMklXeHJONnR0b0xiNVU5c0xXOXFCSXUrVnl5RUZHSGM0NTJY?=
 =?utf-8?B?SWI2OFpNY2FDNTdlSzREMHhPbTdHd1NGdlpHR2xmdllkR1FrZFpTdUdldWdW?=
 =?utf-8?B?T3NwbUNmc2VQZFFwcHBHK2M0by94VDJjUkdrVVZSQXUzWExFdG15ZWVwNyto?=
 =?utf-8?B?U0ZSSEFuWUl1Q3pvSUlvSTNIQ0puVGVQNXJ4L3A2T3RjMFFUcExIYWZjNHRm?=
 =?utf-8?B?MDNyTktQWlVRTDlIbSs0b2o1QktXYjJLeTFkUW1tLzd2UTRnc1RoWkk1TjRv?=
 =?utf-8?B?b3U1NXlEdnlYNXkxck1Td2xSeXM1emRQYlQrdGZndzM1czlPYi9uenhyNnBq?=
 =?utf-8?B?SjhaSzB4WnhBUDBVL0FkRDR3LzVLRmoxQWlDTE16VGxYRW1LNmpvdjd2K1NS?=
 =?utf-8?B?SlVzRk03V3dCc1VmRVhpL0owKzlSYllIY3NHWUtIUDQ0Tyt6aXlLdGF5allM?=
 =?utf-8?B?b2xCSXk1YWZraVo2UE91d004N0czY2FGRlhDWmFvT2JnemhoRHk3ZkJTQyt2?=
 =?utf-8?B?T3NRcVgrZ3VJRU80c2lFbVFNRG5JYjRnckhjd2xONXJCVmZPWWlvWUhkZTEr?=
 =?utf-8?B?UGtISGRuY25udXlQN0d2L1ozRWVvUGNJQTRTNEYxSXFqdzI4QndtbVByS3ZP?=
 =?utf-8?B?c25rVDZEa0tpTjVXV2paZE9rZkdnbFFTcE4rTUUrZlo4eUpiU2h4dytjWm5t?=
 =?utf-8?B?RmIrT0FYOCtFU2E3bHgxZzVjdXpPWFNyWnVvSnlzQ1MyMUtDelNDcXFMcy82?=
 =?utf-8?B?OWQvWUJ0c2d5OGVkdEFhMjcvaFhVNzV5K3ZkekNPNitINWVCR2l5WGZEQjFq?=
 =?utf-8?B?Z0k0eXJ2NHVUZ1QwOWNkUTJPTmFOZFhVR2hNeU42SGJGNEFIcVMwOGNaTXZ3?=
 =?utf-8?B?cXN6YVJhSjNVblRHSW1yN01mV1MxczNlRjNtc1VHN3A2VzVRMkptRFdVa2xN?=
 =?utf-8?B?RytoN1JZRDN4KzY4cWVEKzNHeFZEQkxOem5mRkRWUEdlRUt5NGZQN2xMcHl4?=
 =?utf-8?B?bWRmZk43aEtHeFFjVE1nMlNoM1NNbThFQTFGYTJOMlU0SHBXNyt0azRDNTZm?=
 =?utf-8?B?NHBxRm5OVHZ1bUZOQ3F1WFRsaExwS3ZhSTJWakVuYUJycll6dVJ1Mm92eTF2?=
 =?utf-8?B?aUhuTEhwcFo1VU5FSjVlWlV0UnJPWlE1OXBuOWFLQlBLMFNsZDhJQVQ2SkdI?=
 =?utf-8?B?ZHBTZ1c2alRXb29jNk9RKytXVWUxSUlLKzZsa1NHbGVaUi9QTVZjclRNYWEy?=
 =?utf-8?B?a3gvYUg4ZklnZ0VLQUFLM2FTWEN2Tk90ZjhCaVNTdFZJdEErRi9QR25rZDVH?=
 =?utf-8?B?bnA1aDdQTnF6anl4THFBVHgydXZBZHl4YXVDN3Fhb3N1L25GNThSRVFIMGhE?=
 =?utf-8?B?TFBJb0tRZW90WWY5SUExVnAvR3dqMEhwWkZsMVhhNzR6MnVSYk1GWW44NlBj?=
 =?utf-8?B?emFrTDlKdGR4QmRuSFBnTkRoVWk0ZjE2T01lK0RCTE01NnoxTG1iWkdRTlZ4?=
 =?utf-8?B?WFQ4eCtVeC9kSFd5Y2RRRFhSNnFDaTc3UTBCTmlnV0FRbTZDTVlNNjc3RWpi?=
 =?utf-8?B?QlZQVlk5d0RJRDhVVnRWWHRwR1d6VnNqc0NoSTZXSVFKY1BpSHdzM0FhRjhq?=
 =?utf-8?B?dm5NS2JScXRXY0svYzBLbjdWdlE5dlE1WmJBbzRkVFFoTjRXbStvSDJpR3Nm?=
 =?utf-8?B?bG9iamFuTyt3U1UzdWN4amhvN25jUGc0R3ROM1ZpazNjL0hQM2FqSVJlNVRZ?=
 =?utf-8?B?SGUyNUNSVG91THA3L0NGc3pZREFrMkdPa29iczVYZW5zY2ZPeksxeEVsdU52?=
 =?utf-8?B?ZVllM1lFV2ZXcy9JWkkyM1BzZVVlbTZrakx0QytoMlRzejZXL3hLWEtWVThk?=
 =?utf-8?B?dFZseTd1SllsSXVRV3pmeExKbHRPaDlHS0ZpTklRRE1pT1lZVTlzdUZwVXBk?=
 =?utf-8?Q?l9eTPFTDkFS2S6qTurLeMRuqI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F29E4776D2DC164DBE1569C5680575FF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9881b02-9523-448c-1306-08dc3d43a3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 18:39:49.7506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaLxSpJkUetHw9NYzqcekP5Fsr1IpdMUu2RrfBWW4iipleyRWaRY1Eag3NlihohQWTFh9YUInvIQGFZDqOSWFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
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

T24gV2VkLCAyMDI0LTAzLTA2IGF0IDAyOjE0ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gPiDCoMKgIHwtLSBkcml2ZXJzLWdwdS1kcm0tbm91dmVhdS1udmttLXN1YmRldi1nc3At
cjUzNS5jOndhcm5pbmc6RnVuY3Rpb24tDQo+ID4gcGFyYW1ldGVyLW9yLXN0cnVjdC1tZW1iZXIt
Z3NwLW5vdC1kZXNjcmliZWQtaW4tbnZrbV9nc3BfcmFkaXgzX3NnDQoNCkNvdWxkIHNvbWVvbmUg
cGxlYXNlIGFwcGx5DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9ub3V2ZWF1LzIwMjQwMjEwMDAy
OTAwLjE0ODk4Mi0xLXR0YWJpQG52aWRpYS5jb20vVC8NCnRvIGZpbmFsbHkgc3RvcCB0aGVzZSB3
YXJuaW5ncz8gIFRoYW5rcw0KDQo=
