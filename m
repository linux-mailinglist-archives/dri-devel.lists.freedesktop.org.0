Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20536DB21
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEE76EB5F;
	Wed, 28 Apr 2021 15:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8036EB84;
 Wed, 28 Apr 2021 15:19:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgIXcrPGx2F5dzmRII5K5iCEpANrTIRQJbeizvxXcBAhbgffuCvOOsiQOdzhoyU+bCB5eDPuzU371JqYtHpO5UD6nWSJkaE/AJZA33iCwy4KiwRcWcnqQECwhM8FQelS3rnTnX31I1vR9B3GgP89iairDUOSDVcakFLXx7kiJ57YPkjg8xyqJpg5X5Bp5xLBAF+QhpNd6gLlyFtvJq3iHHt1qAcF4SNm0zaIz7O7nVGXSZkpMVJPA5NUj6V8YKH7T28Bqr+HWqFa5+QWEy21n1GIjBd12VOOlVVBuxt4LNGd1jttnyfc9IyvUXir07VYg4xKthxdNa0Va0V75NG8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxmTXrw+cj5yes/CtWd5MUaWb9oWpVkmxAi9QX0ZpmY=;
 b=ZjlBoKD6ORq1qmDywyCANI2H3Hm26qinZSe6FzW0rYQT+YUcDrcFZ2ObKQj3dHLlr4SqKFtpEX4EQNUR+f4t8NmDXGiVVD8TBTV62BdTtjX5EYd6gYIwvauI/fHyjMCtG+XFS+KBhbE7c2rgdUKmKrK1sq7hshqv+AhF5lDBtnOaaWrfPmrvZ/+J3iK+eEy/8K16ul6dHShIyKRVMMwi8Mwr9SZO7wmr5ERQ9wXIuy6Zpckcc/8pQJrG0i/XOtoTW3HvV3RODPbCsmgpGRizIDGY2QsCWX8DMhcy/X0SaGQdq9ael39+hafoH+iR9iOIHKI+Lep5ZnlL3SyyEWLEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxmTXrw+cj5yes/CtWd5MUaWb9oWpVkmxAi9QX0ZpmY=;
 b=jaPHDEzPxjrLRG5oyoyumdb0ZUJuNrktLwkkzLPKECOhfLukQceXTUsj9CbdZ9iGLa5ozKPQNZklsLNnTDFCpB6eovHHDJfxAogCQkh6A/53V/dTl2PY7CwrfIaL07D0F9X8RqTJHMls9D+AWYHQrXaWnlIb+pj9LZWs2QBrGF0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2388.namprd12.prod.outlook.com (2603:10b6:207:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 28 Apr
 2021 15:19:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 15:19:42 +0000
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
 <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
Date: Wed, 28 Apr 2021 11:19:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::45) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Wed, 28 Apr 2021 15:19:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b662418-c946-4232-6fee-08d90a590be0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2388:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2388D004129B29C9DF3876A992409@BL0PR12MB2388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09Qb7f8OtIROMiwdVfpwKOL3KH8bYYel1gCAsci//jedZQJuLG2+srmW8KpMr+qtYapNxJtZy+fI6Kb1W95qj59HwJ17jLRtifR+5pBdBp06aQlK1J8Vzd2mtUO22zJGPuzmjrLw3JjsJIoBgYOH+Pl2QI2KmwgU0BoNN0m9YrlN/Pq1/aT1XxU584VlZxwEtv5pOaTM0iqj1+0zc6cOomvdgGTdO1IUn1f7FcV/p/3iuc6sPvRWLIpPiwksv10VOZfhrCjBI5Dng5LqcQRfr1VBvR77/jiPsGQ+IHDxit85EgRp3GdBM+Ds1JTxgrEf+Bk6RLiYczbNWom+w7E0fCysIbFnKwLX9Bu83IKuAD8me+qvAlYTG+HU3HkFQcUGUftsVDy3aKpfftLFgo5XA/UOy/KNzaxfXfeo+qfU7DwC0A+o5A5jp9p5NPJ52Agepqp/dUqXtEHlpvD/RcWKfqZ2VyUsAj20G4tvnBzmFyHT1QhGXVqE5b4f+o/rIuHDUYGmjnyYd3fOMsMnlCb7fYa1gBUn4SklowVwUJlZgdIQypwQsPTLuP620rxfMc5oii39VyWw/eDq76Lg//VU3Kaf1oVNqEdYNya22bUM+9C5W5+3DA1J4CL32gW0LJX1yEHdhW7XCfz+gFizNsZVHMEhCaGuLvtqKQ3farLOLYpDJDy9wfNPHovMaiUEyjQl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(956004)(2616005)(2906002)(44832011)(86362001)(66574015)(36756003)(316002)(26005)(8936002)(16526019)(5660300002)(66556008)(8676002)(66476007)(31686004)(6486002)(66946007)(38100700002)(83380400001)(16576012)(186003)(478600001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aURFczZZcTdCUUdzQ3BvWHVTVVFKT2FtaUMveFhYYW11NFpBbDdrZGx2WVk3?=
 =?utf-8?B?MkVLY1lUQWVpTDV4VGZ5bklTZ0MvZzFXOFRpTjdJVEd6WFpYMDdqRTVaRzFi?=
 =?utf-8?B?OGlHMmxiNFVQN2ZrR3g4bjEvM2MwT0l5N0psQzhqNmQ3NWtVNWg2cUdvaFhW?=
 =?utf-8?B?NTFVRVFwV2QvampZZEwySlg4blZHOENoN21PWVNaRWZ3dDh1YlRPSjRVNjlm?=
 =?utf-8?B?bEFHbzNuME93dUlXN3NrV2llRXhnWDZ4Z1lQS2NqM1VtL0laOFlaYkZRMWJt?=
 =?utf-8?B?RWRUN2Y3alA4MnowMGRwY0hBSURVMmd0ZEFYTTN4OWhqdzBvL1V0ZnpyWmFj?=
 =?utf-8?B?RDFEbXczbzJoZDRiODF6R0I1Z2VQZDhVTlBDdU1HWXRXcVIxbzlMaFJwaktF?=
 =?utf-8?B?TGR3Yk5kMnlsZzFETUFyYXk2eXJvUkR6c05Fb0FXclpxRkE5WmpTWGNMSnVV?=
 =?utf-8?B?MXArVGNnUWQzOTcwRmNZWUo4ejE3c1dHdnFGcHVlZ2VMb2QreWZNQm5ZUDFV?=
 =?utf-8?B?dWFydC80MFR6cXpWN3NQOGxFMmRBbmVOZTRGckhoblY4d01DOVVQRDdocDNY?=
 =?utf-8?B?N1ZHS0I2YXgyTGtBS1Nxa2JNTlZpcFQyZnkyL3Bmcmd3S2Z2b2pEV2FPekdI?=
 =?utf-8?B?RGg1WDB5TWJqWTE3UlB3Y1hMbHBSdDNxdzArRlVoOTVVMW5JMXZVSmsvdTdu?=
 =?utf-8?B?cUo3NHdrenQxZUZKd1lpZ0pETWljaUhYdDc2T2o2ZkV6RVlCMlY2OHhnTExJ?=
 =?utf-8?B?MHVheUtDN0MrWHd4SFpSYm9OWFc4d2w4TjJ2Z2h2a2wwS0k5TWJHV0dYeGJw?=
 =?utf-8?B?SW1hRE5lZTNhbnpnbG9CMitWaTRhQjUza3FJTGhsYm1xYUU1eGhuc09IaTBi?=
 =?utf-8?B?dlYrbitrUDBJTGEwSjI0UzNVWEpDK0RwWmM4U05qT1VHZDBiZkRwR0tVM0Rv?=
 =?utf-8?B?akVTcmZqTGpUcG5OeUE5K3JBdndHcndCcXprcW5kUGM4Y0hmdGIyTnVPOVBy?=
 =?utf-8?B?SkNlYWZKbElHM21sNHhBbGNMWXJ0TlBjRGU2aElRWE9hV2RkblJmdTRLRFJx?=
 =?utf-8?B?Q1VDYkExTDQzRDBzTnZOSkFXZG1mVlJtK1daNCs2Tmg4YVVjQTlXcVVsNmZG?=
 =?utf-8?B?TGZTUEZHMUhONitUdi9GdW9QampiU004UnBWaGdyUGdkQXo4emVRdHFzZUM1?=
 =?utf-8?B?TXc3ckxDYm1WQ2g0RE1mSXBwNmlqMlJCanVPdTF6aDBkbjQxTmFMUXJadkJW?=
 =?utf-8?B?bzRyL0ZyeTU3THFsREdxZmRLbzA2WmNqZXlTalZOdk1BRHFHNmw5Y0V1U29O?=
 =?utf-8?B?aUJIUTlZNFltbUpjcWdySUtPUENiRDJyZFU5QUNXM0ZYWnNBTnRtLzZhUndX?=
 =?utf-8?B?VzhxKzYxT0laS2Z6cllUaDlWTEdGNTNFNFFHMW8wYi9zcVkvcWVnWGJSUWJB?=
 =?utf-8?B?T2VBN3oxT0l1cVpIVVo0eVhDL0dhNXl4bW9ma0RVaHpZTHF2dkFsN3ZpUnpx?=
 =?utf-8?B?b1ZHdkpka0IxWml5bVcranYvNnZZZWU1ZWxNVHpnOTVUZmVtR1U5TXd1aE1s?=
 =?utf-8?B?MHZtWk9LRDdxdDZkcm4xNUFaNjVKSE5IMnJCRDhheE9PNGQ1SFVyYXk3ZnNV?=
 =?utf-8?B?RWdDWHZsWnZUM1ZmYVRUbEQzWlQwWklNZ201UkR0OS9WV0xNUDZGcFM0Rm1Z?=
 =?utf-8?B?Q3FmNGg2bXV4eE5uUCs0MDJ3YUxOcVFSR2dRcjZ3dk9Pa2ZnWXVkYzBJOUJ1?=
 =?utf-8?Q?eGlW5mwRT2mpZVlYc/TM9qied94NNGievmnuJ4Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b662418-c946-4232-6fee-08d90a590be0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:19:41.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKIh6FM0ttnxQIEU2PhkGWxXy0OhC2K2nrW1QQLcpIE8sAkvpjjcZg9Q2UFCfdSDkl7RN4iSFnK/UYeBEQX8dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2388
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yOCB1bSA1OjA1IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDI4LjA0LjIxIHVtIDA5OjQ5IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+IEFtIDIwMjEtMDQt
MjggdW0gMzowNCBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IEFtIDI4LjA0LjIx
IHVtIDA3OjMzIHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+Pj4gU0cgQk9zIGRvIG5vdCBvY2N1
cHkgc3BhY2UgdGhhdCBpcyBtYW5hZ2VkIGJ5IFRUTS4gU28gZG8gbm90IGV2aWN0Cj4+Pj4gdGhl
bS4KPj4+Pgo+Pj4+IFRoaXMgZml4ZXMgdW5leHBlY3RlZCBldmljdGlvbnMgb2YgS0ZEJ3MgdXNl
cnB0ciBCT3MuIEtGRCBvbmx5IGV4cGVjdHMKPj4+PiB1c2VycHRyICJldmljdGlvbnMiIGluIHRo
ZSBmb3JtIG9mIE1NVSBub3RpZmllcnMuCj4+PiBOQUssIFNHIEJPcyBhbHNvIGFjY291bnQgZm9y
IHRoZSBtZW1vcnkgdGhlIEdQVSBjYW4gY3VycmVudGx5IGFjY2Vzcy4KPj4+Cj4+PiBXZSBjYW4g
aWdub3JlIHRoZW0gZm9yIHRoZSBhbGxvY2F0ZWQgbWVtb3J5LCBidXQgbm90IGZvciB0aGUgR1RU
Cj4+PiBkb21haW4uCj4+IEhtbSwgdGhlIG9ubHkgcmVhc29uIEkgZm91bmQgdGhpcyBwcm9ibGVt
IGlzLCB0aGF0IEkgYW0gbm93IHRlc3Rpbmcgd2l0aAo+PiBJT01NVSBlbmFibGVkLiBFdmljdGlu
ZyB0aGUgdXNlcnB0ciBCTyBkZXN0cm95cyB0aGUgRE1BIG1hcHBpbmcuIFdpdGhvdXQKPj4gSU9N
TVUtZW5mb3JjZWQgZGV2aWNlIGlzb2xhdGlvbiBJIHdhcyBibGlzc2Z1bGx5IHVuYXdhcmUgdGhh
dCB0aGUKPj4gdXNlcnB0ciBCT3Mgd2VyZSBiZWluZyBldmljdGVkLiBUaGUgR1BVVk0gbWFwcGlu
Z3Mgd2VyZSB1bmFmZmVjdGVkIGFuZAo+PiBqdXN0IHdvcmtlZCB3aXRob3V0IHByb2JsZW1zLiBI
YXZpbmcgdG8gZXZpY3QgdGhlc2UgQk9zIGlzIGNyaXBwbGluZwo+PiBLRkQncyBhYmlsaXR5IHRv
IG1hcCBzeXN0ZW0gbWVtb3J5IGZvciBHUFUgYWNjZXNzLCBvbmNlIGFnYWluLgo+Pgo+PiBJIHRo
aW5rIHRoaXMgYWZmZWN0cyBub3Qgb25seSB1c2VycHRyIEJPcyBidXQgYWxzbyBETUFCdWYgaW1w
b3J0cyBmb3IKPj4gQk9zIHNoYXJlZCBiZXR3ZWVuIG11bHRpcGxlIEdQVXMuCj4KPiBDb3JyZWN0
LCB5ZXMuCj4KPj4gVGhlIEdUVCBzaXplIGxpbWl0YXRpb24gaXMgZW50aXJlbHkgYXJ0aWZpY2lh
bC4gQW5kIHRoZSBvbmx5IHJlYXNvbiBJCj4+IGtub3cgb2YgZm9yIGtlZXBpbmcgaXQgbGltaXRl
ZCB0byB0aGUgVlJBTSBzaXplIGlzIHRvIHdvcmsgYXJvdW5kIHNvbWUKPj4gT09NIGlzc3VlcyB3
aXRoIEdUVCBCT3MuIEFwcGx5aW5nIHRoaXMgdG8gdXNlcnB0cnMgYW5kIERNQUJ1ZiBpbXBvcnRz
Cj4+IG1ha2VzIG5vIHNlbnNlLiBCdXQgSSB1bmRlcnN0YW5kIHRoYXQgdGhlIHdheSBUVE0gbWFu
YWdlcyB0aGUgR1RUIGRvbWFpbgo+PiB0aGVyZSBpcyBubyBlYXN5IGZpeCBmb3IgdGhpcy4gTWF5
YmUgd2UnZCBoYXZlIHRvIGNyZWF0ZSBhIG5ldyBkb21haW4KPj4gZm9yIHZhbGlkYXRpbmcgU0cg
Qk9zIHRoYXQncyBzZXBhcmF0ZSBmcm9tIEdUVCwgc28gdGhhdCBUVE0gd291bGQgbm90Cj4+IHRy
eSB0byBhbGxvY2F0ZSBHVFQgc3BhY2UgZm9yIHRoZW0uCj4KPiBXZWxsIHRoYXQgaXMgY29udHJh
ZGljdCB0byB3aGF0IHRoZSBHVFQgZG9tYWluIGlzIGFsbCBhYm91dC4KPgo+IEl0IHNob3VsZCBs
aW1pdCB0aGUgYW1vdW50IG9mIHN5c3RlbSBtZW1vcnkgdGhlIEdQVSBjYW4gYWNjZXNzIGF0IHRo
ZQo+IHNhbWUgdGltZS4gVGhpcyBpbmNsdWRlcyBpbXBvcnRlZCBETUEtYnVzIGFzIHdlbGwgYXMg
dXNlcnB0cnMuCgpIbW0sIEkgd2FzIG1pc3Npbmcgc29tZXRoaW5nLiBUaGUgYW1kZ3B1X2d0dF9t
Z3IgZG9lc24ndCBhY3R1YWxseQphbGxvY2F0ZSBzcGFjZSBmb3IgbWFueSBCT3M6CgogICAgICAg
IGlmICghcGxhY2UtPmxwZm4pIHsKICAgICAgICAgICAgICAgIG1lbS0+bW1fbm9kZSA9IE5VTEw7
CiAgICAgICAgICAgICAgICBtZW0tPnN0YXJ0ID0gQU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VUOwog
ICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgfQoKSSB0aGluayBvdXIgdXNlcnB0ciBC
T3MgZG9uJ3QgaGF2ZSBtbV9ub2RlcyBhbmQgZG9uJ3QgdXNlIEdUVCBzcGFjZS4gU28KSSBjb3Vs
ZCBhZGQgYSBjaGVjayBmb3IgdGhhdCB0byBhbWRncHVfdHRtX2JvX2V2aWN0aW9uX3ZhbHVhYmxl
LgpFdmljdGluZyBhIEJPIHRoYXQgZG9lc24ndCBoYXZlIGFuIG1tX25vZGUgaXMgbm90IHZhbHVh
YmxlIGJlY2F1c2UgaXQKY2Fubm90IGZyZWUgdXAgYW55IHNwYWNlLgoKCj4KPiBUaGF0IHRoZSBH
UFVWTSBtYXBwaW5ncyBhcmUgc3RpbGwgdGhlcmUgaXMgY2VydGFpbmx5IGEgYnVnIHdlIHNob3Vs
ZAo+IGxvb2sgaW50bywgYnV0IGluIGdlbmVyYWwgaWYgd2UgZG9uJ3Qgd2FudCB0aGF0IGxpbWl0
YXRpb24gd2UgbmVlZCB0bwo+IGluY3JlYXNlIHRoZSBHVFQgc2l6ZSBhbmQgbm90IHdvcmsgYXJv
dW5kIGl0LgoKSSBjYW4gZml4IHRoYXQgYnkgYWRkaW5nIHRoZSBLRkQgZXZpY3Rpb24gZmVuY2Ug
dG8gdXNlcnB0ciBCT3MuIEJ1dApnaXZlbiB0aGUgYWJvdmUgc3VnZ2VzdGlvbiwgSSB0aGluayB0
aGlzIHdvdWxkIG5ldmVyIGJlIHRyaWdnZXJlZCBieQp0dG1fbWVtX2V2aWN0X2ZpcnN0LiBBbHNv
IG5vdCBieSB0dG1fYm9fc3dhcG91dCwgYmVjYXVzZSBTRyBCT3MgYXJlCm5ldmVyIGFkZGVkIHRv
IHRoZSBzd2FwX2xydSAoZm9yIGdvb2QgcmVhc29uKS4KCgo+Cj4gQnV0IGluY3JlYXNpbmcgdGhl
IEdUVCBzaXplIGluIHR1cm4gYXMgaGFzIGEgaHVnZSBuZWdhdGl2ZSBpbXBhY3Qgb24KPiBPT00g
c2l0dWF0aW9ucyB1cCB0byB0aGUgcG9pbnQgdGhhdCB0aGUgT09NIGtpbGxlciBjYW4ndCB3b3Jr
IGFueSBtb3JlLgo+Cj4+IEZhaWxpbmcgdGhhdCwgSSdkIHByb2JhYmx5IGhhdmUgdG8gYWJhbmRv
biB1c2VycHRyIEJPcyBhbHRvZ2V0aGVyIGFuZAo+PiBzd2l0Y2ggc3lzdGVtIG1lbW9yeSBtYXBw
aW5ncyBvdmVyIHRvIHVzaW5nIHRoZSBuZXcgU1ZNIEFQSSBvbiBzeXN0ZW1zCj4+IHdoZXJlIGl0
IGlzIGF2YWxpYWJsZS4KPgo+IFdlbGwgYXMgbG9uZyBhcyB0aGF0IHByb3ZpZGVzIHRoZSBuZWNl
c3NhcnkgZnVuY3Rpb25hbGl0eSB0aHJvdWdoIEhNTQo+IGl0IHdvdWxkIGJlIGFuIG9wdGlvbi4K
SnVzdCBhbm90aGVyIHdheSBvZiBjaXJjdW12ZW50aW5nICJJdCBzaG91bGQgbGltaXQgdGhlIGFt
b3VudCBvZiBzeXN0ZW0KbWVtb3J5IHRoZSBHUFUgY2FuIGFjY2VzcyBhdCB0aGUgc2FtZSB0aW1l
LCIgYSBwcmVtaXNlIEkgZGlzYWdyZWUgd2l0aAppbiBjYXNlIG9mIHVzZXJwdHJzIGFuZCBITU0u
IEJvdGggdXNlIHBhZ2VhYmxlLCB1bnBpbm5lZCBtZW1vcnkuIEJvdGgKY2FuIGNhdXNlIHRoZSBH
UFUgdG8gYmUgcHJlZW1wdGVkIGluIGNhc2Ugb2YgTU1VIGludGVydmFsIG5vdGlmaWVycy4KU3Rh
dGljYWxseSBsaW1pdGluZyB0aGUgYW1vdW50IG9mIHBhZ2VhYmxlIG1lbW9yeSBhY2Nlc3NpYmxl
IHRvIEdUVCBpcwpyZWR1bmRhbnQgYW5kIG92ZXJseSBsaW1pdGluZy4KClJlZ2FyZHMsCsKgIEZl
bGl4CgoKPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+IMKgwqAg
RmVsaXgKPj4KPj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNCArKysrCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+IGlu
ZGV4IGRlMWVjODM4Y2Y4Yi4uMGI5NTM2NTRmZGJmIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jCj4+Pj4gQEAgLTY1NSw2ICs2NTUsMTAgQEAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3Ry
dWN0IHR0bV9kZXZpY2UgKmJkZXYsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3Jf
ZWFjaF9lbnRyeShibywgJm1hbi0+bHJ1W2ldLCBscnUpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJvb2wgYnVzeTsKPj4+PiDCoMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qIERvbid0IGV2aWN0IFNHIEJPcyAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChiby0+dHRtICYmIGJvLT50dG0tPnNnKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4+Pj4gKwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCF0dG1fYm9fZXZpY3Rfc3dhcG91dF9hbGxvd2FibGUoYm8sIGN0eCwgJmxvY2tlZCwKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAmYnVzeSkpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGJ1c3kgJiYgIWJ1c3lfYm8gJiYgdGlja2V0ICE9Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
