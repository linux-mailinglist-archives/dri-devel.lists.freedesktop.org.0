Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4272AF553
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 16:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B786E077;
	Wed, 11 Nov 2020 15:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAC36E06B;
 Wed, 11 Nov 2020 15:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POk0g5PbcAowophlM0oxhXOBp/FYFGv7laxZ18Fm8OVT/J82dSickaKFWQUUSzqcAnHXQ7+IqZHh9r8NWSPxvT8ZKjWnZ11tzBqSc3jXwH6fbIi/ntHvVHBj7/3oP3p6NslAeaSxDpnzoFFdYDoLPi+dwb22V7crhDOA0W08LcJOQW9GY6Pzmnwnuhh4G1UcgPNVhzqUjQwSLN9jkvbv8ajTM1lY3BqwyttyLkj1ui+6dS1tUb+W5nt44s+zTYfWLecesi4gU0moAyOqbYjIVGPdPiZooP83iJuGkbMkVOMDvt6v0tQ2aOZwlX8N/HcJEz3OmVaFhR5iFjdOqFXppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Igox5tioXOB5NxU8v8Lf7nzFUQOk7+Lesj8jzFj+bQ=;
 b=HJlwsSP02v7XK5/DQs9yrCI3aPekFcB8rn1F7L7UB1YcGvS9QLGH3ydsZefNka3KA4elue3RfFyp6cWKeMLLgWzkkfbWwhkOgmF31hP3kYvYgiLmOvMqh8wjt0V07AS7Sx6ZBKMCxjltXWHuPUFoQlCl17QdBhlpZad1PERjozpN9L3yKfNeyH83BjFXYcKulFNOyZ35bzjVp8ZQ0bT2dq20VqA0ggm459w9jXlZB2lWmJ8cRd+Jiw7lAdQxB9iHsbt4EKfvYYUnjZ2KO1FjLPj7wWwh40likZSs1GYcEIeV/d43gE+CSrFLXa25xAZ9eWpSlWGgNrh53eoow8R30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Igox5tioXOB5NxU8v8Lf7nzFUQOk7+Lesj8jzFj+bQ=;
 b=GTrOF4W2uZ1nUttHW29dP3Pt70VMnjo4I/9UyosOSsUpeZabMPt8eEXjf/OOGPrIQ2xAVGUKvWc29CP+0rFzJH6WTcVQxzUZJeYratbS8HuKLFPT8IxLiVnSK1/u8GUHvjfMkepf2zl5pEDO1j6l6QhjxF2GNBwM4nFifcIyq7c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1658.namprd12.prod.outlook.com (2603:10b6:4:5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Wed, 11 Nov 2020 15:45:56 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Wed, 11 Nov 2020
 15:45:56 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com> <X6wEbtSDm69gzFbR@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <dc348560-907c-1b7e-a836-7dea4017d4e4@amd.com>
Date: Wed, 11 Nov 2020 10:45:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X6wEbtSDm69gzFbR@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
X-ClientProxiedBy: BN8PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:408:c0::27) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
 (2607:fea8:3edf:49b0:7416:506d:efb6:9c79) by
 BN8PR15CA0014.namprd15.prod.outlook.com (2603:10b6:408:c0::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 15:45:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1f1895a-56df-4383-a3b7-08d88658e0ea
X-MS-TrafficTypeDiagnostic: DM5PR12MB1658:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1658F562D1FC34164B75A965EAE80@DM5PR12MB1658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vvi+ClhcAmpzMUAyBFKP43edD3BBmzy9hwpx3cmrySSqD8VvIE3VUwNs+NQ0hK1XkGif4sSUUDEMfTz+t/eaXKxFkprZCuOcZo/O0NDrl2DSfcoQZZnfLIDPLfHdP/7HBcn7jD0I5UGagYjolL1mgsf2k5/MyvyR1CsG0BPDU4yo0ptCrvqvfLpmPjAIzTZogBgIQEEFDhuSdhlbBajYJQgDhvjjE1UpZ5hOx/J2NpMjcL4wx6Oxrw0StmrLScRhxn8cRHdQnDV3hjBvIYFaSnVQec0OsSnVCUFSuuJsgsijgGqb/8tUU3eayx8Q83QSPOQEkHjn30b/YWXgLlrCZzPX/3o1bA7hq24vc63xnToNAUJCLT8C2Wq6EAGLMV6LuIrgiuu77c7BTJ29t2QBpbSoZM9fkt5eOs+qgBOL4zdGrMmJm1LUpoKfH6KjldZOMjjEcmjaVQuEcbh73EuuWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(36756003)(2616005)(2906002)(8676002)(8936002)(478600001)(53546011)(186003)(16526019)(6916009)(52116002)(31696002)(66556008)(31686004)(5660300002)(66476007)(45080400002)(6486002)(316002)(66946007)(86362001)(4326008)(83380400001)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFBSTGhvZW9YeVBLKzFTb2JPcWxmZlhkc0hqNDkvTDJ6ZXg3YkJoN0FGdVNW?=
 =?utf-8?B?VnJ4c0NMREFUbTl2ekp0TUF3c0RDYVNtTTJrOWh0U2ZUVSswNDZPODE0ZCt1?=
 =?utf-8?B?Yk9GUDFpSEZYejZwZnZvaGxQNFFMelBxcVloOU9ZSmJQVGc1ZEtUcXJmWnpZ?=
 =?utf-8?B?ZGhPekpqK2xPTWR2L1pNM0FXaGtsNnU1Ri9ERzRkWVgvcVdrUms2VmZnUDlp?=
 =?utf-8?B?aXFoK2dSUU13WTZmcFd2Y3psbmVRRWNwVjNaQ2M0TjNoQ2Vab3ZSUW8rMktI?=
 =?utf-8?B?M2RlZ2IxczFaV0VWRjFRME8yTks0cjFrTjhwcEdLWmkya25UOUhiQTc2V200?=
 =?utf-8?B?cFhKNjQ2eXl4OTZiRlVQakdRTWZHcmhaOTV4Nk50ckxJSDhXRW4wYUlIVDNY?=
 =?utf-8?B?d25PQ2kvbFhqb3YySEduMHZCeVJoMWt0eElwd1UyZ3RUakhIQmg1K1ZuSnRQ?=
 =?utf-8?B?ZGs3UjZySlFoUVlYMjU4VFlrNVJTTnE3ZkRjd0ZCLzNZUEtBejNrc1VTZlNv?=
 =?utf-8?B?bWx0NmlOLzFJZ2Y3dGs4d1JhT0ZLOXVvcmw1bXBZOHA4ckx5YVY3YUg0aXJu?=
 =?utf-8?B?WExEWUFWSGFLWUNxNFR2MmFWT3dmbkNjVG40VEtRdUwxa0IxNy9kMDFzbXNr?=
 =?utf-8?B?MWxiZ1VUN0JnNjFhUk5KRHZPVDBkT0pzNE9qWjVRUUtRRlIvTFhXNElzR242?=
 =?utf-8?B?ajNQeVhxcm9RWHVoZ2UwczRlT1ViUTV2MEVnQ1hBQVhuR1NXLy9pUUVORUZG?=
 =?utf-8?B?blQ1blh0Q1VrdWREVlgwQmlNNHJQKzk5Z29nbzUyLzlSYlh0N3c0S3ZJaGlC?=
 =?utf-8?B?M2UxZUpPVUsxNm0yUEdQWmlvdVh5RlNyVG1teTZYU0hsOTBqVzJJMzBQLzRl?=
 =?utf-8?B?Q09rU2p4SDdPR1Y2cU5paTFleDFHbWZrM0lNZmtGTjZ2NUlsN3A0cFkzZm1a?=
 =?utf-8?B?aTVSczBKbE0xdzZzRFhsczRPVzE4R3IxZEp0M0lHQVB5RzVpZ05aR3NKT2NU?=
 =?utf-8?B?dzllWktkMnlOZHJzckR1dW92cjdNSDg3SmdheWFNajR4SFVJU2V1cTF5dmVN?=
 =?utf-8?B?WjV3aG5Yc1lPWE5vNjBVb05CeStYREhESUtMODNLTVZDSS8yNGJKdG5JSXlZ?=
 =?utf-8?B?a0ViUVVqOXhadVh6bjVuMjlTb0haMjV3cThkK0tXZ2N1K3Z1cUJVNnlNcG1T?=
 =?utf-8?B?ZlpmMmlrTGYxU1dRczJyN0w5U20vWnpldzZ3d1VTNnlPT3dWRGpHeEdmREVS?=
 =?utf-8?B?cWcyZGNvZ3JmeHA1QzFTZGc3MTY4NFdycWF5ZngwcytoYmZpZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f1895a-56df-4383-a3b7-08d88658e0ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 15:45:56.3006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/buMgDhRswgIOEHehIlKnMlB8pDNdzM2RGLNn5A4ruYswfPwO3s41d+XzA2B3VvJZID5C83mX0vZexCT/d7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1658
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzExLzIwIDEwOjM0IEFNLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFdlZCwgTm92IDExLCAy
MDIwIGF0IDEwOjEzOjEzQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+PiBPbiAx
MS8xMC8yMCAxMjo1OSBQTSwgR3JlZyBLSCB3cm90ZToKPj4+IE9uIFR1ZSwgTm92IDEwLCAyMDIw
IGF0IDEyOjU0OjIxUE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IEhpLCBi
YWNrIHRvIHRoaXMgYWZ0ZXIgYSBsb25nIGNvbnRleHQgc3dpdGNoIGZvciBzb21lIGhpZ2hlciBw
cmlvcml0eSBzdHVmZi4KPj4+Pgo+Pj4+IFNvIGhlcmUgSSB3YXMgYWJsZSBldmVudHVhbGx5IHRv
IGRyb3AgYWxsIHRoaXMgY29kZSBhbmQgdGhpcyBjaGFuZ2UgaGVyZSBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHM6JTJGJTJGY2dpdC5mcmVl
ZGVza3RvcC5vcmclMkZ+YWdyb2R6b3YlMkZsaW51eCUyRmNvbW1pdCUyRiUzRmglM0RhbWQtc3Rh
Z2luZy1kcm0tbmV4dC1kZXZpY2UtdW5wbHVnJTI2aWQlM0Q2MTg1MmM4YTU5YjRkZDg5ZDYzNzY5
MzU1MmM3MzE3NWI5ZjJjY2Q2JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0
MGFtZC5jb20lN0M5ZmJmZWNhYzk0YTM0MGRmYjY4NDA4ZDg4NjU3MTYwOSU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MDcwNTU4OTY2NTEwNTglN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9WWU4SEpSMXZpZHBw
Y09CbmxPZ1Z1NUd3S0QyJTJCYjV6dEhiaUklMkJ1YktLVDAlM0QmYW1wO3Jlc2VydmVkPTAKPj4+
PiB3YXMgZW5vdWdoIGZvciBtZS4gU2VlbXMgbGlrZSB3aGlsZSBkZXZpY2VfcmVtb3ZlX2ZpbGUg
Y2FuIGhhbmRsZSB0aGUgdXNlCj4+Pj4gY2FzZSB3aGVyZSB0aGUgZmlsZSBhbmQgdGhlIHBhcmVu
dCBkaXJlY3RvcnkgYWxyZWFkeSBnb25lLAo+Pj4+IHN5c2ZzX3JlbW92ZV9ncm91cCBnb2VzIGRv
d24gaW4gZmxhbWVzIGluIHRoYXQgY2FzZQo+Pj4+IGR1ZSB0byBrb2JqLT5zZCBiZWluZyB1bnNl
dCBvbiBkZXZpY2UgcmVtb3ZhbC4KPj4+IEEgZHJpdmVyIHNob3VsZG4ndCBldmVyIGhhdmUgdG8g
cmVtb3ZlIGluZGl2aWR1YWwgc3lzZnMgZ3JvdXBzLCB0aGUKPj4+IGRyaXZlciBjb3JlL2J1cyBs
b2dpYyBzaG91bGQgZG8gaXQgZm9yIHRoZW0gYXV0b21hdGljYWxseS4KPj4+Cj4+PiBBbmQgd2hl
bmV2ZXIgYSBkcml2ZXIgY2FsbHMgYSBzeXNmc18qIGNhbGwsIHRoYXQncyBhIGhpbnQgdGhhdCBz
b21ldGhpbmcKPj4+IGlzIG5vdCB3b3JraW5nIHByb3Blcmx5Lgo+Pgo+Pgo+PiBEbyB5b3UgbWVh
biB0aGF0IHdoaWxlIHRoZSBkcml2ZXIgY3JlYXRlcyB0aGUgZ3JvdXBzIGFuZCBmaWxlcyBleHBs
aWNpdGx5Cj4+IGZyb20gaXQncyBkaWZmZXJlbnQgc3Vic3lzdGVtcyBpdCBzaG91bGQgbm90IGV4
cGxpY2l0bHkgcmVtb3ZlIGVhY2gKPj4gb25lIG9mIHRoZW0gYmVjYXVzZSBhbGwgb2YgdGhlbSBz
aG91bGQgYmUgcmVtb3ZlZCBhdCBvbmNlIChhbmQKPj4gcmVjdXJzaXZlbHkpIHdoZW4gdGhlIGRl
dmljZSBpcyBiZWluZyByZW1vdmVkID8KPiBJbmRpdmlkdWFsIGRyaXZlcnMgc2hvdWxkIG5ldmVy
IGFkZCBncm91cHMvZmlsZXMgaW4gc3lzZnMsIHRoZSBkcml2ZXIKPiBjb3JlIHNob3VsZCBkbyBp
dCBwcm9wZXJseSBmb3IgeW91IGlmIHlvdSBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwCj4gcHJvcGVy
bHkuICBBbmQgeWVzLCB0aGUgZHJpdmVyIGNvcmUgd2lsbCBhdXRvbWF0aWNhbGx5IHJlbW92ZSB0
aGVtIGFzCj4gd2VsbC4KPgo+IFBsZWFzZSB1c2UgdGhlIGRlZmF1bHQgZ3JvdXBzIGF0dHJpYnV0
ZSBmb3IgeW91ciBidXMvc3Vic3lzdGVtIGFuZCB0aGlzCj4gd2lsbCBoYXBwZW4gYXV0b21hZ2lj
YWxseS4KCkdvb2dsaW5nIGZvciBkZWZhdWx0IGdyb3VwcyBhdHRyaWJ1dGVzIGkgZm91bmQgdGhp
cyAtIApodHRwczovL3d3dy5saW51eGZvdW5kYXRpb24ub3JnL2Jsb2cvMjAxMy8wNi9ob3ctdG8t
Y3JlYXRlLWEtc3lzZnMtZmlsZS1jb3JyZWN0bHkvCldvdWxkIHRoaXMgYmUgd2hhdCB5b3Ugc3Vn
Z2VzdCBmb3IgdXMgPyBTcGVjaWZpY2FsbHkgZm9yIG91ciBjYXNlIHRoZSBzdHJ1Y3QgCmRldmlj
ZSdzwqAgZ3JvdXBzwqAgc2VlbXMgdGhlIHJpZ2h0IHNvbHV0aW9uIGFzIGRpZmZlcmVudCBkZXZp
Y2VzCm1pZ2h0IGhhdmUgc2xpZ2h0bHkgZGlmZnJlZW50IHN5c2ZzIGF0dHJpYnV0ZXMuCgpBbmRy
ZXkKCgo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
