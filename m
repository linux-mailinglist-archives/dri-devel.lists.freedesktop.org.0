Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668F31E17F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9BD6E9E9;
	Wed, 17 Feb 2021 21:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78F76E9E9;
 Wed, 17 Feb 2021 21:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuNB3rKjnxSw09s5zw4FUqC/cVTl+A6Jw0iOCisHvT6w1VQoDX0VnPrwquPVzy2tfsWJdGYZ8Cf64+9qo5g/VckKTH9CqpkQziWmZwmeEO6I/q+rPwvJ55x75DKppGLcYIzprTiui/xdGf+buN4qlRcT92uVtU4uMInWVNVeznpU9UYwQ1CU9NVaBtWmYtPWKhxcIwEb8HXXXsCd9D4HIFDMrUH9AxXmx4HAzp7QWdxjoiDkw/K6aP32ahDd+9oxdeFfRZXr6JTiFNSKdmm7LYtfqqRWVcbtAJefl5130YU8M0Eqy8om/Ql9ofGy/iwe5YXO/3yTrMdkvNbkpWJ36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTptGoLnMXecwnHfmeqAneTEC3h6QPhseAGSHUDQ5mg=;
 b=njTgNT1ucQjcYY8F7mPWFIbOVrdeqVr3vN+UiYQGnLphuwFwRChYE697nYOu6BWYCo7KPWjKu7ILsbAJpyiyfz3gGA6YhX3kCSyUXqVmIJnJ2UsRw1v1ltUf4PcB+FnTyAJdjuBXxaiijSi1lKeDPjdZDqBFAMxWM8IpMdHhS9B0jkbL/NbDn+0j5spMemfgYL94SX+KKxfAKoF16lJmfXeb19WSvMdSVo3mmYFaiwzuiCbffB63BmD90k6DwLO481yY+hLuLbVPavkD66QjPv2mCHlwbrIpC2TgWBNEV3WAF/FCGo3j6eYQbLli/OvGoz/SBun9qeJJ9GBpfX/Ebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTptGoLnMXecwnHfmeqAneTEC3h6QPhseAGSHUDQ5mg=;
 b=JYiVERulzDT5Pv9scUzLAZdGXLGLl2tA81pYvh0VfaWcS7YKcWL1ffszKV5/IIxw2lngf6cP9CX9jojhKMoXk+JOJ96me0ZxKp6HPcKOcie9ZENPKz7MxfvFg0lAZJEbFY6EMB1u+26VwQ9npVK1zKPIaoz/ebfAHDjqr2NU8V0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Wed, 17 Feb
 2021 21:36:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Wed, 17 Feb 2021
 21:36:22 +0000
Subject: Re: [PATCH] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
 <5d8f4e4f-fa2f-037b-d288-b4286e23e77a@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <ddd98d12-4675-b861-f03c-6b87a34713a8@amd.com>
Date: Wed, 17 Feb 2021 16:36:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5d8f4e4f-fa2f-037b-d288-b4286e23e77a@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
X-ClientProxiedBy: YT2PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::26) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
 (2607:fea8:3edf:49b0:1c58:abdf:5837:609f) by
 YT2PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Wed, 17 Feb 2021 21:36:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0a7baff-9ea2-4440-e5eb-08d8d38c1226
X-MS-TrafficTypeDiagnostic: SA0PR12MB4461:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4461F4900AE09D24EF3FF46DEA869@SA0PR12MB4461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqNTDoX3TghYzY0Gq06crqbOTmSNzmVd8qEXjfbB5nKVFGZCU1hm3HgHEND/eSPZRLOePHcvOyGSxe1Owyx1iYAhgG3pVr3pZJNaQhXNvdv2j9eKLortBWYim1FmedEqLwPeYOd3hhdqBsKqUOqWnl1R3WkXyVnTcRHyD+XnlTkClrtNQLZs3p4tcBbicQan+tefegbiQlaMereP8v51AU8M8tZ4qqJWC3NShzMM6yO9F3VOBd8G6obYBJqZKKkn4jOs4KlaY/juYe+4Vu3YRvBT3IAZxM9xWEf0zdJ4Z43b5Q5MxJTqa/1VTYs5eWNXM/MSIjGOo7QwwdZl40Kw+kpVNWyQTrgqj01eDjglXmGHJSmNEfPdQIrKqtDvh4TYQdtE9vUXajdIhkxuRVRXBO25IVGurcWWNnih/0Jw7Q/bsoBeci0IQLW1yPWiC4ZTB80ReplZZzRhaAfU5OvIk94jv5UFKfX+wSXeZyAeWyp14lFo+IPuJrVb1l0RIv/qTEZKsgsYbO82D6+vQPsxpavUBtRWP7Bnbi9qkcwfO2yotVKk6cr0WKUs6eTpioZ95We9MgR4xBewkw5dYvCtgF6nM2O8t/vWJ5z80TmnG+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(66574015)(66946007)(478600001)(83380400001)(31696002)(16526019)(53546011)(66476007)(36756003)(186003)(86362001)(66556008)(52116002)(2906002)(6486002)(316002)(2616005)(31686004)(8676002)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWhMMys2WGtlZ2VEd1RkNnF0Y2dEeVo5RThwTG1RWWxjT3NhZSs0dDZYeFhq?=
 =?utf-8?B?VTlFSnNGUER2RmN0emlVMVp3Z0pxNFMwUTkvcmhia1JhTDR6b3N1TDVNZFRq?=
 =?utf-8?B?OEJQQVgrTEJpSWZ5cGZaSnFjU09MWFR2eUUzRWdxRkhIMjFHWVNHTkYvMDF2?=
 =?utf-8?B?YnR4OFRGcW9ENTkrNUZCSVdtcXBQZmhNUmkyYjRVdS82UmloVkdUdndrOWM1?=
 =?utf-8?B?SzV2MTkvSWlGZ1JhaFBVc1V5SjE2M3ZWUitjNVZTRTRCWlBxZktySWpYcEpV?=
 =?utf-8?B?dmkvNk9SS2tWZ241SVRxRk0yRnE4OERuNXNpUnU3ck1YUkVteEw4TWlCanA1?=
 =?utf-8?B?U1V0NzJ5Y3BqdjVNRE9LdVdMZm83YlkvNWJvaXh2Wm9rc1dYdE9GcGF6c3RV?=
 =?utf-8?B?bDZzK3dYUXl4TmEzYUJKK0NtKzlSVFF1WGplbDhDL3IzZm9LL01CSDNkU21r?=
 =?utf-8?B?NFU4ZXpRZ3RXQWdvKzBldE15NDJrbHJZajB0V3d4cm9FSkF6QTI2NVJWdGhI?=
 =?utf-8?B?VXBBTW5qOGdZaE5ETWVoNGdsa2N2L1R0YTVMdW45amZWV1hwL0g4VTFDYnZP?=
 =?utf-8?B?SUp4Z0ZObEJueUtuV1hvMVpBNFBUOSt4TjhkTjc5c2Z2VGQvaDVHNWZadkRp?=
 =?utf-8?B?WUNZc09vK1BKOGlCUy9GRkpXcm9aTWVpSFlCRUVRQUxZeE1lNEU1YXBibWJ5?=
 =?utf-8?B?OVBhWWgyNVN1QitsZDliMmpvdjdGaEtjRnVhMmpJaXJVR09mTk9UbEUzaktu?=
 =?utf-8?B?YmNxM1YwSnlaUk9BTm53NW1oK2JrOGxaK2FyZEhMRkYzWSsxNG1UU3hsczN3?=
 =?utf-8?B?M2tEMG1HTVFMMHRsWGIxaTRCU2JvbTZsYVZ4RGRvanREREI0NUFHcFFmZ1pi?=
 =?utf-8?B?ZytCWUZQajYzMzJtM204K093VW1FVkRLK01WWGdHRnczcnNYK0J3MnowTFhL?=
 =?utf-8?B?Sk5aYVpKMkhOZ2VLb3NGUjQ4aTV1dVFvWE95OGlVaHRMRUkzNS81Y1MzWW5r?=
 =?utf-8?B?Yy94QnEvU3duVDNHME9kRkF5OUlzWldEZGJhZENkeDR6QXowZVR4cFlDVlVP?=
 =?utf-8?B?V0JNRG84M05MUStia0ViSG9NcGd0UzJNazV3NzVQaEd1ak0zMER2dW9CdDNN?=
 =?utf-8?B?NmpEYzFRWUhOZ08rRGxBWXMrbXNsOWw2SGpyT1FibUp5RUFpdytBeUhJR21X?=
 =?utf-8?B?VHpkRHRiN3d4NC9nd0Z2Q0xNajBwV0xzTkZmWXBmVEorcGpDOVYwMDlqT3lM?=
 =?utf-8?B?Unp0T3NXa1BaOUVDWEk2MmxQM25sa2hKS3kvN2VMd1YxNW9QdTJyQUd0SmNH?=
 =?utf-8?B?RmUwRm1PN1JydEprM3BDWXdvU3kzUWErY0REY3lFWFIwUGVBK3J5Q1JXT1Uy?=
 =?utf-8?B?WmZXNmpvdVlJanR6RldwUnNjbVBLejJMR0ltbVlrcysxbzV2c3ErcURlTDRU?=
 =?utf-8?B?Wkg2V0FPSG4xejhJTzZtNGlFY2xsVjR6U2tuZktxZjAzNnNsSUF3bStyR2po?=
 =?utf-8?B?NjMvNDRjdDNpUDdnNnpmQU1ISGJkQ3lsMEtXZWVFL1ZoNDJtNzAyY2ROY2pj?=
 =?utf-8?B?b0x3djNYaTYxM1pZUzcyRjFqWXVuVVM3dEgvSUtyaUVQS1ZMRStLWXV3QXJE?=
 =?utf-8?B?SmZvWUNhNnFsOTFQK3B6OUEyRjBNbXNVUXp2RnkzaTAzSHQ5WCtHdmUrNkR0?=
 =?utf-8?B?ejdFT1dBQUQ2OGpBWFVoVUdMcXRHSWduVzliaXhJTmZpWkxna2FUMjlPMEgr?=
 =?utf-8?B?cTR3c2J5citlVVNxOTVHeWpnMTlYc0oxd2Z4NjhlcFV6RkRTdzd1VmJnNmJx?=
 =?utf-8?B?WHQzMmpKTkxBM09KM1NJNnpvOHViTEhBd3RIbm40NVMwVTA3ODRzcXpqb0hX?=
 =?utf-8?Q?OdTllNZQLougv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a7baff-9ea2-4440-e5eb-08d8d38c1226
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:36:22.7305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiP1SbGDNLB/5hUrhNNabyAncTOvh+H87FszChGsBF1W7YXYIIkJqBY8oOXEIjV0k9EM+NuOMRa4ujgWAO+plA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTcvMjEgNDozMiBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxNi4wMi4y
MSB1bSAxODowNyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBQcm9ibGVtOiBJZiBzY2hl
ZHVsZXIgaXMgYWxyZWFkeSBzdG9wcGVkIGJ5IHRoZSB0aW1lIHNjaGVkX2VudGl0eQo+PiBpcyBy
ZWxlYXNlZCBhbmQgZW50aXR5J3Mgam9iX3F1ZXVlIG5vdCBlbXB0eSBJIGVuY291bnRyZWQKPj4g
YSBoYW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMgYmVjYXVzZSBkcm1fc2No
ZWRfZW50aXR5X2lzX2lkbGUKPj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4KPj4KPj4gRml4OiBJbiBk
cm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhlCj4+IHNjaGVk
dWxlcidzIHJ1biBxdWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNf
aWRsZS4KPj4gQWxzbyB3YWtldXAgYWxsIHRob3NlIHByb2Nlc3NlcyBzdHVjayBpbiBzY2hlZF9l
bnRpdHkgZmx1c2hpbmcKPj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRocmVhZCB3aGljaCB3YWtl
cyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMzEgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgCj4+
IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4gaW5kZXggOTA4YjBi
NS4uMTFhYmY1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+
IMKgwqAgKi8KPj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVs
ZXIgKnNjaGVkKQo+PiDCoCB7Cj4+ICvCoMKgwqAgaW50IGk7Cj4+ICvCoMKgwqAgc3RydWN0IGRy
bV9zY2hlZF9lbnRpdHkgKnNfZW50aXR5Owo+PiDCoMKgwqDCoMKgIGlmIChzY2hlZC0+dGhyZWFk
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAga3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+PiDC
oCArwqDCoMKgIC8qIERldGFjaCBhbGwgc2NoZWRfZW50aXRlcyBmcm9tIHRoaXMgc2NoZWR1bGVy
IG9uY2UgaXQncyBzdG9wcGVkICovCj4+ICvCoMKgwqAgZm9yIChpID0gRFJNX1NDSEVEX1BSSU9S
SVRZX0NPVU5UIC0gMTsgaSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxID0gJnNjaGVkLT5zY2hlZF9ycVtp
XTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFycSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIExvb3AgdGhpcyB3YXkg
YmVjYXVzZSBycS0+bG9jayBpcyB0YWtlbiBpbiAKPj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRp
dHkgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmcnEtPmxvY2spOwo+PiArwqDCoMKg
wqDCoMKgwqAgd2hpbGUgKChzX2VudGl0eSA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEt
PmVudGl0aWVzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
aXN0KSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2Nr
KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHko
cnEsIHNfZW50aXR5KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNYXJrIGFz
IHN0b3BwZWQgdG8gcmVqZWN0IGFkZGluZyB0byBhbnkgbmV3IHJxICovCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4KPiBXaHkgbm90IG1hcmtp
bmcgaXQgYXMgc3RvcHBlZCBhbmQgdGhlbiByZW1vdmluZyBpdD8KPgo+IFJlZ2FyZHMsCj4gQ2hy
aXN0aWFuLgoKCllvdSBtZWFuIGp1c3QgcmV2ZXJzZSB0aGUgb3JkZXIgb2Ygb3BlcmF0aW9ucyBo
ZXJlIHRvIHByZXZlbnQgYSByYWNlIHdoZXJlIApzb21lb25lIGFkZGluZyBpdCBhZ2FpbiB0byBy
cSBiZWZvcmUgbWFya2luZyBpdCBhcyBzdG9wcGVkID8KCkFuZHJleQoKCj4KPj4gKyBzcGluX3Vu
bG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNwaW5fbG9jaygmcnEtPmxvY2spOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDC
oMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4gKwo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIC8qIFdha2V1cCBldmVyeW9uZSBzdHVjayBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNo
IGZvciB0aGlzIHNjaGVkdWxlciAqLwo+PiArwqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9i
X3NjaGVkdWxlZCk7Cj4+ICsKPj4gwqDCoMKgwqDCoCAvKiBDb25maXJtIG5vIHdvcmsgbGVmdCBi
ZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICovCj4+IMKgwqDCoMKgwqAgY2FuY2Vs
X2RlbGF5ZWRfd29ya19zeW5jKCZzY2hlZC0+d29ya190ZHIpOwo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
