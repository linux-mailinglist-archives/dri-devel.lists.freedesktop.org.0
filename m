Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2942DC3CB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 17:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CAC6E0F0;
	Wed, 16 Dec 2020 16:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A36E0F0;
 Wed, 16 Dec 2020 16:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvC0D7NjDxf9IodXb8QFgDexQ2Gq+PRZOs02t89u11qYlI7qHFPcSQ7hbZVOnn5ztKLjcuEXraYgkBXElZrh6EjQnnjZMP1PUOaRDbSAts01AxaC+5qkH5DDExi2C7B7TKNVubKfXUwjUFFMSVb1YtQ6lAqkCoWOvqee5SzGvu1adHXQ86c21w2nKbYFMH5NeJfit2Jsg8Kle6F/2iwS+Rl3NOc5K0xLI6Sryc3fQwMUgbGzKZkPYde3LXc/cDIZ0A4HHYGtHqaM2wFa7RsX36l5vOe6aJ3byPi8QEnNjrpnJiRYvQDv3t7RBobyNMV3OUQ2plFiJ03H7Cyv+z4i+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL5PtDwYmBH0cDPjfuBbYFTnfjNaISsVwIJkVS3BOmU=;
 b=kcTRAIN/Q+kLLkUCPtFRBVcTrV4VfFSjC+BVRERuMQ9hfxiCFLw8okSs9oE7xNsZu+kTi8/RmS/trufvWsqSdFyNzLX7KXnVifDtLqp8WHGp8s014dnuq3u878JwOco2m+kfAQYVCB/ePp4jhsdzIKPCyx0v6MWfAODuWyQPw1AwML+cpgzBgHleZOdGXXCfI4rdcSe0g8uRuO+zKNWDe7+FVhvMFDmdC4thzf1t7Su3KKUvGPWBX6UPFVgejOz4p87JqzcxbbloUrHk5my3PkrEQq12FWYnF9Wv0tGepZZMYILKUN/OBonviqSKd1tB29yk0SLxc6iFOCX0KUxs/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL5PtDwYmBH0cDPjfuBbYFTnfjNaISsVwIJkVS3BOmU=;
 b=REVxSNYTJyyWwAyQYNQ0XNKrRXErZQOlAEF7Y003EwS7xLooo4PiAX89Mh3Zmlg0O3y1DRgB04PBNmU/zt08r+KFntK8wpcvQ7TJAPOBMd+0c6x5rTTH9WlQYUZT0l5wlnbzSXNCyWIEi2ngdlE0+0v/DpxdRSkBa1gHBfmnWqM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1664.namprd12.prod.outlook.com (2603:10b6:301:b::15)
 by MWHPR1201MB0174.namprd12.prod.outlook.com (2603:10b6:301:55::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 16:13:53 +0000
Received: from MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb]) by MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb%4]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 16:13:53 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
Date: Wed, 16 Dec 2020 11:13:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
X-ClientProxiedBy: BN8PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:408:4c::46) To MWHPR12MB1664.namprd12.prod.outlook.com
 (2603:10b6:301:b::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
 (2607:fea8:3edf:49b0:1a8:981c:b82c:9d66) by
 BN8PR16CA0033.namprd16.prod.outlook.com (2603:10b6:408:4c::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 16:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c83dd161-6aa4-4216-1d76-08d8a1dd951f
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0174:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0174C88F2A5CD769CEB54FDFEAC50@MWHPR1201MB0174.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zQgDA8c0nwwyyzRaz+kXfYO7ohb7mb8QrecsRA0kswKR5PZHklJV4FfkcpMMU4iClfwo8HKTL4eiYHPRaYwNvlV1UtuOBzL+/qLJtmmH0GKAMeo/ekrwCpthSR2moRg26p5dZYL0vxHOJCA4Oy+SYICOc7x3Wi6a8WJo1tk6p3QFVDVjap4w0ueRBOJFIGjrQJv0hwBLV71j2Ap+QvjwFvT/zdIOt+IwB9GjcoIIf/SBwBLU/9ni4azuFYKGYx1Hg9V27j+AOZUCRhEfzDHdzffTgfdIdnNnen0E9GvSSE+qHRBSp2or5FC0lt5we5u3F8gvuA20Z9as6q/LbLIhCeG4lfQy1Iys1z1QqVpz+fJTv27D4XcG4XFhCFfRAv99goK9BJqimjLXAc6mnzj+NCnwf3rfXfnOmcJ3KyCyR7EuhU8WixO/1c1oLCCgqRtdbIC7xaQncmnWX7+QhEZDiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1664.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(316002)(52116002)(8936002)(31696002)(36756003)(83380400001)(110136005)(8676002)(54906003)(2906002)(5660300002)(6636002)(31686004)(86362001)(966005)(6486002)(16526019)(66946007)(45080400002)(66574015)(186003)(53546011)(66556008)(4326008)(2616005)(478600001)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bExlcTZwWmM4NEdMajRmS1FCQUY3cmJLcEVmS1dQT0w5RXZLUWR0VTNyZzlL?=
 =?utf-8?B?UDkwZS8ybEVrOXBLOERlN0kwakM0VWlqTHRnbU0xdGZzbTNRT2crblhVMUps?=
 =?utf-8?B?S1IvWTkxczJYMnM3OFkvWHVxajFpcmZjczVPTmsxV3dOVDlHeVY3NGZJajE5?=
 =?utf-8?B?TkJGbzk1MkRVVDI3RlBVS242MDVKQWR3RXRqL2JrZU9nKzlubDJ2TE5LVm1L?=
 =?utf-8?B?ZEFyWjN4SmJVdTFSNEtEL3BWRlZxK21JQmgrUUxuT2pMa3NmaFlSYkpkU2ZT?=
 =?utf-8?B?dXNwQld0VHVsUU5qWTVHMHAyUlZXbi9MakwzakZNN0s3TUhRdit2M1gvZnh0?=
 =?utf-8?B?ek9wL053Rk14NEswaExwSDZkS3gzVExBWnRnYkZaKzVpd3RhQm1Odlpvc3hp?=
 =?utf-8?B?aVZHM3gwQk1uWXJueXIxM3JsZVIwQ2VUWWgwRVl6Z3NVbnpsVlRqbWp0YzJU?=
 =?utf-8?B?ZnRXRjdBUlRObXpRSFRYV3cwTDZKUkRyWVhIbldoMW9hT052QzNZS0g3Q2Nn?=
 =?utf-8?B?Z3M1WVZDM0xpZXVQMDRjUzFEdW1PVXpDRlBzdWpLNTJ0Qk1NRkpmNVh0OURL?=
 =?utf-8?B?RlZ5WlJGOWxUZ1ArZXhKR1BQVnZVcEhkVnQ0N0JERU1SWGdOajFBektyT2Fz?=
 =?utf-8?B?RWl1Z2FMZ09nMWhnMVI0aHVJbXJNazliZVEvNXphcTZGN0JCRnpJYVhsU1pW?=
 =?utf-8?B?U1FWa1hMOWtMZUd0bzZpNHdyRXNTWi9kZ3VwNE90WGlmL0NFWWhoZUVXekp6?=
 =?utf-8?B?QnNPYmtkdmwxK1hCSnl4VDhFL3cxMjZhTnZnTXc3dmtNcS9XeU1OdVNGNXZh?=
 =?utf-8?B?bno4My9EYkduVi80eGRya1h3UVRIem56RnZwOW5mRitCZUl6S0VWQS9nM3RB?=
 =?utf-8?B?Zmw5TW9PQndCcGtYSlBxalBmYjNQbW11WmRLRXEyUU1McnJjOXkzMkd1d0NY?=
 =?utf-8?B?c2QrU1hQaUYxeFIzOUhIYklKajh6dHNpd3NaNDUwbWZKUDMyWkhLKzJUNis3?=
 =?utf-8?B?d1dURjBsemNJclEvSG16TzlRdDBOUG1TMkRXdU55R2xJTnZhS29rV2RCY2hD?=
 =?utf-8?B?WG1ocHZLa3JZR01wblR1eDE3Q3FhMWxMZ29jcERUd0RSWWFJczhXeXFibGN1?=
 =?utf-8?B?NTI0WDZBMFpMaTU2bzY5K2Nkajk3UHVTRVVoczJzVXdJM0VpQStkWDF2MW1H?=
 =?utf-8?B?K29kcDRWaEFxbG8rbmNic1p6MVV3dUo1Ti92azVleEo2ancxc0FncmVjbzcr?=
 =?utf-8?B?TGswZ2hvTVRvbHVxMlBXNlZCem53Vjc5RXZxOUJjYlpVZE8rbERRMm41SENX?=
 =?utf-8?B?S3ZGa05UcDdTeS9RRW1EYTRVK0p0ME5wME8vR0hPZjd4VUhNdVhBMlBYQkJE?=
 =?utf-8?B?U2dKeHE5RmMrVkQ0c3p1cVV6aEQvNkh4QlI3QTNZZlU0bHdCcmdhdDkybDh4?=
 =?utf-8?Q?8toQDUMF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1664.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 16:13:53.2374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c83dd161-6aa4-4216-1d76-08d8a1dd951f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGp0WKgvXZiWAp9nXXPTwvbi/6iU2KrqoxnBKiRlFepmhJCKIECTbZH3lXdbqPLyz1wvDwS8CPL2+DlCPrWBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0174
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE2LzIwIDk6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTYsIDIwMjAgYXQgOTowNCBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gQW0gMTUuMTIuMjAgdW0gMjE6MTggc2NocmllYiBB
bmRyZXkgR3JvZHpvdnNreToKPj4+IFtTTklQXQo+Pj4+PiBXaGlsZSB3ZSBjYW4ndCBjb250cm9s
IHVzZXIgYXBwbGljYXRpb24gYWNjZXNzZXMgdG8gdGhlIG1hcHBlZAo+Pj4+PiBidWZmZXJzIGV4
cGxpY2l0bHkgYW5kIGhlbmNlIHdlIHVzZSBwYWdlIGZhdWx0IHJlcm91dGluZwo+Pj4+PiBJIGFt
IHRoaW5raW5nIHRoYXQgaW4gdGhpcyAgY2FzZSB3ZSBtYXkgYmUgYWJsZSB0byBzcHJpbmtsZQo+
Pj4+PiBkcm1fZGV2X2VudGVyL2V4aXQgaW4gYW55IHN1Y2ggc2Vuc2l0aXZlIHBsYWNlIHdlcmUg
d2UgbWlnaHQKPj4+Pj4gQ1BVIGFjY2VzcyBhIERNQSBidWZmZXIgZnJvbSB0aGUga2VybmVsID8K
Pj4+PiBZZXMsIEkgZmVhciB3ZSBhcmUgZ29pbmcgdG8gbmVlZCB0aGF0Lgo+Pj4+Cj4+Pj4+IFRo
aW5ncyBsaWtlIENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMsIHJpbmcgYnVmZmVyIGFjY2Vzc2VzIGFu
ZCBGVwo+Pj4+PiBtZW1jcHkgPyBJcyB0aGVyZSBvdGhlciBwbGFjZXMgPwo+Pj4+IFB1aCwgZ29v
ZCBxdWVzdGlvbi4gSSBoYXZlIG5vIGlkZWEuCj4+Pj4KPj4+Pj4gQW5vdGhlciBwb2ludCBpcyB0
aGF0IGF0IHRoaXMgcG9pbnQgdGhlIGRyaXZlciBzaG91bGRuJ3QgYWNjZXNzIGFueQo+Pj4+PiBz
dWNoIGJ1ZmZlcnMgYXMgd2UgYXJlIGF0IHRoZSBwcm9jZXNzIGZpbmlzaGluZyB0aGUgZGV2aWNl
Lgo+Pj4+PiBBRkFJSyB0aGVyZSBpcyBubyBwYWdlIGZhdWx0IG1lY2hhbmlzbSBmb3Iga2VybmVs
IG1hcHBpbmdzIHNvIEkKPj4+Pj4gZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgZWxzZSB0
byBkbyA/Cj4+Pj4gV2VsbCB0aGVyZSBpcyBhIHBhZ2UgZmF1bHQgaGFuZGxlciBmb3Iga2VybmVs
IG1hcHBpbmdzLCBidXQgdGhhdCBvbmUKPj4+PiBqdXN0IHByaW50cyB0aGUgc3RhY2sgdHJhY2Ug
aW50byB0aGUgc3lzdGVtIGxvZyBhbmQgY2FsbHMgQlVHKCk7IDopCj4+Pj4KPj4+PiBMb25nIHN0
b3J5IHNob3J0IHdlIG5lZWQgdG8gYXZvaWQgYW55IGFjY2VzcyB0byByZWxlYXNlZCBwYWdlcyBh
ZnRlcgo+Pj4+IHVucGx1Zy4gTm8gbWF0dGVyIGlmIGl0J3MgZnJvbSB0aGUga2VybmVsIG9yIHVz
ZXJzcGFjZS4KPj4+Cj4+PiBJIHdhcyBqdXN0IGFib3V0IHRvIHN0YXJ0IGd1YXJkaW5nIHdpdGgg
ZHJtX2Rldl9lbnRlci9leGl0IENQVQo+Pj4gYWNjZXNzZXMgZnJvbSBrZXJuZWwgdG8gR1RUIG90
IFZSQU0gYnVmZmVycyBidXQgdGhlbiBpIGxvb2tlZCBtb3JlIGluCj4+PiB0aGUgY29kZQo+Pj4g
YW5kIHNlZW1zIGxpa2UgdHRtX3R0X3VucG9wdWxhdGUganVzdCBkZWxldGVzIERNQSBtYXBwaW5n
cyAoZm9yIHRoZQo+Pj4gc2FrZSBvZiBkZXZpY2UgdG8gbWFpbiBtZW1vcnkgYWNjZXNzKS4gS2Vy
bmVsIHBhZ2UgdGFibGUgaXMgbm90IHRvdWNoZWQKPj4+IHVudGlsIGxhc3QgYm8gcmVmY291bnQg
aXMgZHJvcHBlZCBhbmQgdGhlIGJvIGlzIHJlbGVhc2VkCj4+PiAodHRtX2JvX3JlbGVhc2UtPmRl
c3Ryb3ktPmFtZGdwdV9ib19kZXN0cm95LT5hbWRncHVfYm9fa3VubWFwKS4gVGhpcwo+Pj4gaXMg
Ym90aAo+Pj4gZm9yIEdUVCBCT3MgbWFwZWQgdG8ga2VybmVsIGJ5IGttYXAgKG9yIHZtYXApIGFu
ZCBmb3IgVlJBTSBCT3MgbWFwcGVkCj4+PiBieSBpb3JlbWFwLiBTbyBhcyBpIHNlZSBpdCwgbm90
aGluZyB3aWxsIGJhZCB3aWxsIGhhcHBlbiBhZnRlciB3ZQo+Pj4gdW5wb3B1bGF0ZSBhIEJPIHdo
aWxlIHdlIHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQsCj4+PiBzeXN0
ZW0gbWVtb3J5IHBhZ2VzIGJhY2tpbmcgR1RUIEJPcyBhcmUgc3RpbGwgbWFwcGVkIGFuZCBub3Qg
ZnJlZWQgYW5kCj4+PiBmb3IKPj4+IFZSQU0gQk9zIHNhbWUgaXMgZm9yIHRoZSBJTyBwaHlzaWNh
bCByYW5nZXMgbWFwcGVkIGludG8gdGhlIGtlcm5lbAo+Pj4gcGFnZSB0YWJsZSBzaW5jZSBpb3Vu
bWFwIHdhc24ndCBjYWxsZWQgeWV0Lgo+PiBUaGUgcHJvYmxlbSBpcyB0aGUgc3lzdGVtIHBhZ2Vz
IHdvdWxkIGJlIGZyZWVkIGFuZCBpZiB3ZSBrZXJuZWwgZHJpdmVyCj4+IHN0aWxsIGhhcHBpbHkg
d3JpdGUgdG8gdGhlbSB3ZSBhcmUgcHJldHR5IG11Y2ggYnVzdGVkIGJlY2F1c2Ugd2Ugd3JpdGUK
Pj4gdG8gZnJlZWQgdXAgbWVtb3J5LgoKCk9LLCBpIHNlZSBpIG1pc3NlZCB0dG1fdHRfdW5wb3B1
bGF0ZS0+Li4tPnR0bV9wb29sX2ZyZWUgd2hpY2ggd2lsbCByZWxlYXNlCnRoZSBHVFQgQk8gcGFn
ZXMuIEJ1dCB0aGVuIGlzbid0IHRoZXJlIGEgcHJvYmxlbSBpbiB0dG1fYm9fcmVsZWFzZSBzaW5j
ZQp0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSB3aGljaCBhbHNvIGxlYWRzIHRvIHBhZ2VzIHJl
bGVhc2UgY29tZXMKYmVmb3JlIGJvLT5kZXN0cm95IHdoaWNoIHVubWFwcyB0aGUgcGFnZXMgZnJv
bSBrZXJuZWwgcGFnZSB0YWJsZSA/IFdvbid0CndlIGhhdmUgZW5kIHVwIHdyaXRpbmcgdG8gZnJl
ZWQgbWVtb3J5IGluIHRoaXMgdGltZSBpbnRlcnZhbCA/IERvbid0IHdlCm5lZWQgdG8gcG9zdHBv
bmUgcGFnZXMgZnJlZWluZyB0byBhZnRlciBrZXJuZWwgcGFnZSB0YWJsZSB1bm1hcHBpbmcgPwoK
Cj4gU2ltaWxhciBmb3IgdnJhbSwgaWYgdGhpcyBpcyBhY3R1YWwgaG90dW5wbHVnIGFuZCB0aGVu
IHJlcGx1ZywgdGhlcmUncwo+IGdvaW5nIHRvIGJlIGEgZGlmZmVyZW50IGRldmljZSBiZWhpbmQg
dGhlIHNhbWUgbW1pbyBiYXIgcmFuZ2UgbW9zdAo+IGxpa2VseSAodGhlIGhpZ2hlciBicmlkZ2Vz
IGFsbCB0aGlzIGhhdmUgdGhlIHNhbWUgd2luZG93cyBhc3NpZ25lZCksCgoKTm8gaWRlYSBob3cg
dGhpcyBhY3R1YWxseSB3b3JrcyBidXQgaWYgd2UgaGF2ZW4ndCBjYWxsZWQgaW91bm1hcCB5ZXQK
ZG9lc24ndCBpdCBtZWFuIHRoYXQgdGhvc2UgcGh5c2ljYWwgcmFuZ2VzIHRoYXQgYXJlIHN0aWxs
IG1hcHBlZCBpbnRvIHBhZ2UKdGFibGUgc2hvdWxkIGJlIHJlc2VydmVkIGFuZCBjYW5ub3QgYmUg
cmV1c2VkIGZvciBhbm90aGVyCmRldmljZSA/IEFzIGEgZ3Vlc3MsIG1heWJlIGFub3RoZXIgc3Vi
cmFuZ2UgZnJvbSB0aGUgaGlnaGVyIGJyaWRnZSdzIHRvdGFsCnJhbmdlIHdpbGwgYmUgYWxsb2Nh
dGVkLgoKPiBhbmQgdGhhdCdzIGJhZCBuZXdzIGlmIHdlIGtlZXAgdXNpbmcgaXQgZm9yIGN1cnJl
bnQgZHJpdmVycy4gU28gd2UKPiByZWFsbHkgaGF2ZSB0byBwb2ludCBhbGwgdGhlc2UgY3B1IHB0
ZXMgdG8gc29tZSBvdGhlciBwbGFjZS4KCgpXZSBjYW4ndCBqdXN0IHVubWFwIGl0IHdpdGhvdXQg
c3luY2luZyBhZ2FpbnN0IGFueSBpbiBrZXJuZWwgYWNjZXNzZXMgdG8gdGhvc2UgCmJ1ZmZlcnMK
YW5kIHNpbmNlIHBhZ2UgZmF1bHRpbmcgdGVjaG5pcXVlIHdlIHVzZSBmb3IgdXNlciBtYXBwZWQg
YnVmZmVycyBzZWVtcyB0byBub3QgYmUgCnBvc3NpYmxlCmZvciBrZXJuZWwgbWFwcGVkIGJ1ZmZl
cnMgSSBhbSBub3Qgc3VyZSBob3cgdG8gZG8gaXQgZ3JhY2VmdWxseS4uLgoKQW5kcmV5CgoKPiAt
RGFuaWVsCj4KPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gSSBsb2FkZWQgdGhlIGRyaXZlciB3aXRoIHZt
X3VwZGF0ZV9tb2RlPTMKPj4+IG1lYW5pbmcgYWxsIFZNIHVwZGF0ZXMgZG9uZSB1c2luZyBDUFUg
YW5kIGhhc24ndCBzZWVuIGFueSBPT1BzIGFmdGVyCj4+PiByZW1vdmluZyB0aGUgZGV2aWNlLiBJ
IGd1ZXNzIGkgY2FuIHRlc3QgaXQgbW9yZSBieSBhbGxvY2F0aW5nIEdUVCBhbmQKPj4+IFZSQU0g
Qk9zCj4+PiBhbmQgdHJ5aW5nIHRvIHJlYWQvd3JpdGUgdG8gdGhlbSBhZnRlciBkZXZpY2UgaXMg
cmVtb3ZlZC4KPj4+Cj4+PiBBbmRyZXkKPj4+Cj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0
aWFuLgo+Pj4+Cj4+Pj4+IEFuZHJleQo+Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5v
cmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRy
ZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M2ZWUyYTQyOGQ4OGE0NzQyZjQ1YTA4ZDhhMWNkZTlj
NyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MzcyNTMw
Njc2NTQ1MDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pR
SWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2Rh
dGE9V1JMMnNtWTdpZW1nWmRsSDN0YVVaQ29hOGglMkJ1YUtEMUh2MHRiSFVjbEFRJTNEJmFtcDty
ZXNlcnZlZD0wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
