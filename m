Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791A31EB3B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1556EA33;
	Thu, 18 Feb 2021 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14AF6E842;
 Thu, 18 Feb 2021 15:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATPDCp9/lLuocXyWta1tHC5rdwVzF+hRU3LPgcosdG7lrlldG3AyRzyIzJCfE8mjivhkJ9otWIvEkE3IFp9BlygBCx0ajugK/XZc3nfh16F0C1oNC3/eMgI2WSc7r13x+S4pn32cf6bD4STSmSg3xEmeTxuYVHgHjwuoFJ9vR70ij+yKk0npyP6YAKd36zn2FJ/1jz4K1Nol4BSu52bqPWOuPZtzrn9YGr/kqrQHWIo/5LckkylWnN/xTd9bFl1Z+y+UuBYhmrRI2eJPY1t6ouAamup/ZQ4JFxlQ/er/WkXyuLnVD6ppqrHaQwiF4y5VFUF3JcWEhc2ZpkAX7ZLSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuDj1b1mwT58iGcBuT7D1i1JqdE5OJ00siiZWnOQb4=;
 b=jPPgfVLEcffbGvP2Na3Ncqq1YfzCPQ5skxk8IvKENAs0TAGXzp/ChrJ5LneA5fED/j9eMGrx87pheIHtvbcQPB7VzXrYBaSpp98hwHzeotPZoSl5mkF3wWqFRav7zdV7a4q7IE64Yw2eAvAqz31kMvqqg2z17C8XJvedznYj3Knoya6p1VVOwNv6gR1/tNhJnNKbnYbRQuxw50DQdvyvvEGdjCexPxAWnYbgoRwovFp6Kg70cGIvNY/c/DLVqhZKWz0aqIN8CL1qhp/Jh7eGkLAy7VayB4r7Cr9JwYlSqZqL5w9u4BVxUWHrBJAHyn63HrxN2CGhkm2fyAPykaOAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuDj1b1mwT58iGcBuT7D1i1JqdE5OJ00siiZWnOQb4=;
 b=IYMW5P170Tik/LBvQpMrSU6yQuKoHQFeMu3s1oqYtSF5vKwjgt8QD2EY2ybzi3jvh6hNYXvAhlCHBCxwFAKth7Z0xipNnIpvSHjEdV7BDgXFH1A3WTjO3M4kxLwIIvKojrSUNYjn4Nm1qvXokaGJTfp05/heC2ysFWCYgmlpEjA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 18 Feb
 2021 15:05:34 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Thu, 18 Feb 2021
 15:05:34 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
Date: Thu, 18 Feb 2021 10:05:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
X-ClientProxiedBy: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
 (2607:fea8:3edf:49b0:1c58:abdf:5837:609f) by
 YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend
 Transport; Thu, 18 Feb 2021 15:05:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84705aeb-1428-4cd4-83be-08d8d41ea42b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27524A77C442DFDB6FC5BB48EA859@SN6PR12MB2752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ENs2N9w4GEs3dkBy1THTh8DAiKBCtf9BwcNaAm4o7KL+uaQCyR89cbLQ6gjfXKuRx4yMryzKwFQdu3/4G9fvz7f4i5AGjXE5OQOYM9J8NVQAq0RCxoNQ1mT0HB504CZ/Hp8isYgfoXCrnDrm22eX47lkF0a+S/pJRejwDr8U9W5YngKpfcJPZiTmvjtwFT+PtiITJQFupNZ8V5qXuxgNSarKUWmJ+ePJKUttktrWZ7VUMiuHOHez247qlkesk6RWDAHFp8DsxJ3zgnYS3g1EdIIubcqWz9Zv6w5/imwvKoNiREIkbHpdQGb55AYKI/tZh3AjdMRNwcogdTfziz9P4/yXbx2yoCi3r1XqC3EmrlVranW4QesMJH0oUrFAFxGORC8P3T+g5eFm5HSOvgTircIZ2KNc8ElKJYSsBprKJclhGJG4JKo6PXSzDGWZvcxUqtohNYemWh2oPkv5NTRAtfCJoZ4hsEeb+UXDuCHXw2Hi4Ovo2/1YlNff0SprHJDCnMa4p9/HpA80tikgHIgncZpWw1CNY7eJeLy9f+LZo9tbiMl53eODIBlv4f47ffe5sf1ZtDl2mnmb6qamIJmSuZ3HmpvGjxDqlh9jRu66ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(86362001)(2906002)(31686004)(52116002)(53546011)(66556008)(66476007)(2616005)(5660300002)(66946007)(66574015)(478600001)(8676002)(186003)(16526019)(83380400001)(36756003)(8936002)(31696002)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlhtNk9xNE9MZDRRekpZQmpya2lrSkNCS2VoU3Q2VHdVSitORHlvcWpxSkJM?=
 =?utf-8?B?ZDhVR0VrUDRyNUV1RU9ncXZRRE1vR3AxN2NWT3h4VUVRUStpN28zdWRHLzZR?=
 =?utf-8?B?cDduQi9nSFF1THI5bmFzdWE3MzNMd0s1TXJRMXRIUS9oVVl4Y0trMk9mZFZq?=
 =?utf-8?B?NXhlb1J6MUtISllmNDlmSCt1QzF5allId0U4SEgzeU00RUtidVl1T3ljenY5?=
 =?utf-8?B?WlkzT29wekJQQ3YvOHcydEgzN3NVYWhad2ZwUFRjbGF1NE9TY1Vid2pHNm0z?=
 =?utf-8?B?cElpdE1qcTFyZ1BaNEI3R1ZWQlNCZXlaZE9HM2tyWW01bkR2blFTOW5xYXc4?=
 =?utf-8?B?RmVxOFNFRlRUWVc4Mkhqd0d1VjZYMEVOZS9vU01XM0lXejBjNnJWQ3hwV2FF?=
 =?utf-8?B?dk9LZytzYXR1VWpwVm0xTndhUzc4QmZTQmVXSnZmTUdFNDNpd1pmMDM2ZnNt?=
 =?utf-8?B?b2xtanF0emt0QnhSQ2tuNEVOOG5ZVTN0WDdtTnZYVEtIL0RLNW9wNmcwTU8r?=
 =?utf-8?B?enhoVEpobG9CZGtKRHdZdmw5UytJVWVDVTVQbWJ0YTZmOTgwWUxnVExUcVZy?=
 =?utf-8?B?bUN5WlRGV3dnWE9weEdBVnA5N0tPNSt6MlQ2YVNBVER3alBYa1hkaUhRU0J4?=
 =?utf-8?B?YkEvMnFFeEVmaG9ZVlozeGlPNVlkR3ZEUjc3OWFKSkJRZ3lJY25DenhSUFVy?=
 =?utf-8?B?ZnNYR3hYd0RWK0pNck5CZFd6ZTlHTTNyRlRVejQwRWhkYkNWdm5tMEppbFF3?=
 =?utf-8?B?TmFWNHBWRFFHdWt5N2ZuVVY0eTlYUDFnVGxaeEZCWFluZmtMcG1GSWNVaG1r?=
 =?utf-8?B?OWZkaU1kUUl1dzBHRy9pYzhWOUN5WUowSVdQdnlEYmlxTjJTOE9Kd3ZVU01G?=
 =?utf-8?B?c0hYVlcwUkV1a1dLd2MvZ1ArTnpudkN0MnV1bStzbnptaDR5RmZ2WXlkMnBH?=
 =?utf-8?B?RDY0cjVDb094RTZwditWN2JhY3BWVUh4aE5xYnZLUkw0UTNNQmgzQmFOUkxG?=
 =?utf-8?B?L3poNnJHYy9JRGxCTWRGeFZSbS9FSmU3ZjRFMzFpVGVFNy9jUHZkd1NrazVj?=
 =?utf-8?B?UHJjejNkbEVlTzJ0WHlLWXBVOHRCRlByd3Vsc1doSzZJSURVWUlSM0ZGRTN4?=
 =?utf-8?B?eWtIdTV4Skt0RCttRHVtMlFFTjBPZXNsNzdUZ1pwR0k5VUM4WkU0Vzd0dy9E?=
 =?utf-8?B?cTBPMGEyZDFVU1NTWDdiSnpsaEVMRWJBbTlBR0wweUZwbTZJdE54Ui9ESjM1?=
 =?utf-8?B?RVM2c2UrRWttcDBLYkttejlZdklPcW56TmI2cnVlbzRna0tSSEZlNnJOQ0VQ?=
 =?utf-8?B?UDBKSENzR1l0ZmFpRU1ORUd1WWs2WmZITGh3MjhtbnRNeFk3S3dsamZGNlRo?=
 =?utf-8?B?bDNEMmN0VDVZRnluNVdoZit4dlRVQzc5UkVVeXk0OHZSY0k1OG9XQ25BMmJB?=
 =?utf-8?B?allkeUJhRzV3empZQUdUMFcwMG5kczV5MlR2ZFJGOUF4QWw2dGxDNDNqcVZI?=
 =?utf-8?B?ZlIwaC9ueGxmUHlsRGdWZlNhZ3lYbVlNZ0RxbVZuak45RWtLb2Y5T3FLUm0v?=
 =?utf-8?B?ZXhCajM4QTlnbzJCTURqdjJINFpyMEVSOWhOeGdCMCswaDBDMXRmYjhXZHJE?=
 =?utf-8?B?M3BKNW9VVXIwZDFMSGJrdC9qbG81OEZCOWNwT1NXYXNDL0NMVFBaeTZLcGdn?=
 =?utf-8?B?bk9ZOTFrMEY3b3l2cEhLNnplNENNNXV3ZG8xZnFaei9wcWY1b1VDZVdTM1pk?=
 =?utf-8?B?cDg0bnc4alV1dXlOYjF1WFNadjMvZDc5YTQ1UFV4OFRDL1B6SlVrMCtYMXdP?=
 =?utf-8?B?R1dPOUxrdVpxazNTcDA3L3FIaTEya21pS0JJRTVXN2wxK0dtYzR0T0xHMjMx?=
 =?utf-8?Q?GENE9b71RVWy3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84705aeb-1428-4cd4-83be-08d8d41ea42b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 15:05:34.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XQ14XPBAa14bOqCsJH0ydQX9D76v/5fcZ1hTUVbRIuHx8Lceukt/U9+Nsu1aUqywPcc7rmWE/3fmHLiH8xTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
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

Ck9uIDIvMTgvMjEgMzowNyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPgo+Cj4gQW0gMTcu
MDIuMjEgdW0gMjI6NTkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gUHJvYmxlbTogSWYg
c2NoZWR1bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUgdGltZSBzY2hlZF9lbnRpdHkKPj4g
aXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNvdW50cmVk
Cj4+IGEgaGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgZHJt
X3NjaGVkX2VudGl0eV9pc19pZGxlCj4+IG5ldmVyIGJlY29tZXMgZmFsc2UuCj4+Cj4+IEZpeDog
SW4gZHJtX3NjaGVkX2ZpbmkgZGV0YWNoIGFsbCBzY2hlZF9lbnRpdGllcyBmcm9tIHRoZQo+PiBz
Y2hlZHVsZXIncyBydW4gcXVldWVzLiBUaGlzIHdpbGwgc2F0aXNmeSBkcm1fc2NoZWRfZW50aXR5
X2lzX2lkbGUuCj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2No
ZWRfZW50aXR5IGZsdXNoaW5nCj4+IGFzIHRoZSBzY2hlZHVsZXIgbWFpbiB0aHJlYWQgd2hpY2gg
d2FrZXMgdGhlbSB1cCBpcyBzdG9wcGVkIGJ5IG5vdy4KPj4KPj4gdjI6Cj4+IFJldmVyc2Ugb3Jk
ZXIgb2YgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkgYW5kIG1hcmtpbmcKPj4gc19lbnRpdHkg
YXMgc3RvcHBlZCB0byBwcmV2ZW50IHJlaW5zZXJpb24gYmFjayB0byBycSBkdWUKPj4gdG8gcmFj
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCj4+IGluZGV4IDkwOGIwYjUuLmM2Yjc5NDcgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+IEBAIC04OTcsOSArODk3LDQwIEBAIEVY
UE9SVF9TWU1CT0woZHJtX3NjaGVkX2luaXQpOwo+PiDCoMKgICovCj4+IMKgIHZvaWQgZHJtX3Nj
aGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPj4gwqAgewo+PiArwqDC
oMKgIGludCBpOwo+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpzX2VudGl0eTsK
Pgo+IEJUVzogUGxlYXNlIG9yZGVyIHRoYXQgc28gdGhhdCBpIGlzIGRlY2xhcmVkIGxhc3QuCj4K
Pj4gwqDCoMKgwqDCoCBpZiAoc2NoZWQtPnRocmVhZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGt0
aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFkKTsKPj4gwqAgK8KgwqDCoCAvKiBEZXRhY2ggYWxsIHNj
aGVkX2VudGl0ZXMgZnJvbSB0aGlzIHNjaGVkdWxlciBvbmNlIGl0J3Mgc3RvcHBlZCAqLwo+PiAr
wqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gRFJNX1ND
SEVEX1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3Nj
aGVkX3JxICpycSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
IGlmICghcnEpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiArCj4+ICvC
oMKgwqDCoMKgwqDCoCAvKiBMb29wIHRoaXMgd2F5IGJlY2F1c2UgcnEtPmxvY2sgaXMgdGFrZW4g
aW4gCj4+IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5ICovCj4+ICvCoMKgwqDCoMKgwqDCoCBz
cGluX2xvY2soJnJxLT5sb2NrKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICgoc19lbnRpdHkg
PSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnJxLT5lbnRpdGllcywKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fc2NoZWRfZW50aXR5LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLyogUHJldmVudCByZWluc2VydGlvbiBhbmQgcmVtb3ZlICovCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZzX2VudGl0eS0+cnFfbG9jayk7
Cj4KPiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJlIGRvZXNuJ3QgbG9vayBj
b3JyZWN0IGF0IGFsbCBub3cuCj4KPiBDaHJpc3RpYW4uCgoKSW4gd2hhdCB3YXkgPyBJdCdzIGlu
IHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIgY2FsbCBzaXRlcyAoc2VlIApkcm1fc2No
ZWRfZW50aXR5X3B1c2hfam9iIGFuZCBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoKS4KSWYgaSBqdXN0
IGxvY2tlZCBycS0+bG9jayBhbmQgZGlkIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSB3aGlsZSBt
YW51YWxseSAKZGVsZXRpbmcgZW50aXR5LT5saXN0IGluc3RlYWQgb2YgY2FsbGluZwpkcm1fc2No
ZWRfcnFfcmVtb3ZlX2VudGl0eSB0aGlzIHN0aWxsIHdvdWxkIG5vdCBiZSBwb3NzaWJsZSBhcyB0
aGUgb3JkZXIgb2YgbG9jayAKYWNxdWlzaXRpb24gYmV0d2VlbsKgIHNfZW50aXR5LT5ycV9sb2Nr
CmFuZCBycS0+bG9jayB3b3VsZCBiZSByZXZlcnNlIGNvbXBhcmVkIHRvIHRoZSBjYWxsIHNpdGVz
IG1lbnRpb25lZCBhYm92ZS4KCkFuZHJleQoKCgo+Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKg
wqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+PiArCj4+ICvCoMKgwqAgfQo+PiAr
Cj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlf
Zmx1c2ggZm9yIHRoaXMgc2NoZWR1bGVyICovCj4+ICvCoMKgwqAgd2FrZV91cF9hbGwoJnNjaGVk
LT5qb2Jfc2NoZWR1bGVkKTsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIENvbmZpcm0gbm8gd29yayBs
ZWZ0IGJlaGluZCBhY2Nlc3NpbmcgZGV2aWNlIHN0cnVjdHVyZXMgKi8KPj4gwqDCoMKgwqDCoCBj
YW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
