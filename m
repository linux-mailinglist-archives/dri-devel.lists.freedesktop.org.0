Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE7310C0A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04ED6F42E;
	Fri,  5 Feb 2021 13:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05C56F42A;
 Fri,  5 Feb 2021 13:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGpJMTEzhbTr/HpSlF0+l67uBpQxYDVVExMgmAEKr7W5apPfEIsyrJ029tj5Ld9OncQKpR1L3/KZqhP2rMG6fMfkuzWotI37hypx3QMNRTc6NHyeOYsdgqUEZV7z+iUvWrXQw1OnNpQ60PYmWlXyNshgdXziMgiqUtdyQtNRIJQQGob6lFyl01o1AW0iQfHyC4zQwxa6VEWuFUME8kIiY+RkIyf5jc/X/v4Vxw0wH4C/YBmLji8fIfKUiXd3lWuv9OCNXAgKJYMfFBgsoZhbrrkw00U1M0+g8CKLIfI56vjm3HOJX3m3M+LwmcnpqN5qdBDk2o5SJxXXzEFn1hXyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjVWEuEVnyOrPQWQCeMB0wiDyAzt6X7M1bsOn/SFlNs=;
 b=S80COPBLaEIDcqO9AzDJGaQ3sMLWu191VWWQmMAQGPkYcSVqvv8H3a6qogdlNwRjhndVOJ6YCRYCyTZRQsQJ8DxMFfMcEpKist7zNrOhS5JAr5PqcSaN7fHzpMB1pFls7hluuKFO8gGbsN7lWS55fHxxqDQyt704/902nbEBzCe1wgE3kq24oLMTI1tqtvo4LNRn0T/1OV3tHlTbfJ5450b3pbyhAp1IqPB4dyVpXeK7xZj7sgJQ2BNPSPBvuJApfOnusVyhufjKTrjhXhUp1ks3AuGQQ8gz6fXGMpgtvGwfqnBGlztPFtZX84e+CgFeN4wbBlCwx37HvAgRcu4YyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjVWEuEVnyOrPQWQCeMB0wiDyAzt6X7M1bsOn/SFlNs=;
 b=ij1SJubhGnAUpyHdsu2yZfUrROzCQGsWU4/OtnrjeVv8R0vXvo44S8E+WQ+kOMGG8NM5x/ui7LERVbe2I//3pVy6OxPSkWIATpHJ7lhLfppQBh9cMil2IQ4NVAEWxclL7FNF93bdRACe2f1Cebd8pud8yjg0mdS/zBNUCFLmzq4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 13:43:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 13:43:00 +0000
Subject: Re: [PATCH] RFC: dma-buf: Require VM_PFNMAP vma for mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210205134113.2834980-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <847246c4-e1e7-ad27-41b3-8a13064fbd31@amd.com>
Date: Fri, 5 Feb 2021 14:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205134113.2834980-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 13:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 400de312-0410-45ea-3985-08d8c9dbf3c0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356C58C2E663D210352021F83B29@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWU+yhuNU+He8/3s/RIm7/27ItRojnS7MwbaANlpVtiYr7Pgb6fQ723iLlDtYQ019z3GGszOsuckah/ZBisIfns7SVlnfO9oS5D90xdxSqSXoSE7HBmS6LzJkfQ8EdWFR2RvMvWbI2AZXOtAZOA07y1aIe9kC51r+8wL0PLY2f1njdsCbv2GcWzQn6lgZgasARCqeR17ouiIQee3rnvsfCDHg2Ndd7kToIJFNiqFoohoFAv2EodExoc2scy144b/W6ihfrElRDOUc+6Xuq5/ML8fcHwK16jf5gAWS3ZR3ZyIA3hE+1K/vr1SePbGdx9ng4KKJIDm7v6imsk2OT2gO+Psnszjte4KY9RDYLnDCpWfPSwLJyWs9LEsDhxGLFks2hdoVetd9Y/9bR91sDzM8MhG0zh3POGPo5F4wpOa5W+/gdTtCqueKv6eApCG71Cy1nPBcDJKpIyGsqW5qeJk2DAnrYFiKpVx1aFfYGmT7MCkGVVlOiah85MzQDZ953ch0OTe4q1QhZJRsipBh/xtCFQHOOFraaYvQa6XAcXvwAh7vsHAFDWotwLS3GW+l8KPDtg6Hbb1zvi41/9+bpJhpIRPk6HR/InXCXhJCoh7mN/FGp0YB2D3vzP5mcXFckQc2nLI7uodKIQsPqt1FcJ0f/7vV5G2vtCoZ09NewtHdJomHMsU7RKeMyDx9m9mm8eS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(966005)(66556008)(31696002)(110136005)(6666004)(5660300002)(31686004)(52116002)(83380400001)(4326008)(6486002)(8936002)(8676002)(7416002)(186003)(316002)(54906003)(45080400002)(36756003)(86362001)(2906002)(2616005)(16526019)(478600001)(66476007)(66574015)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEQyOCtXbUNpNmpOTjNnU2QvVmtqS1d1a3ZaZHUxbzc2STRLUk5UcWFkdXF1?=
 =?utf-8?B?anl6TkY5Nzl2Yk5GUStNVEUvYUFxUWtqbUpLaFcvMm9vcFdGbkJCK2s2dHVh?=
 =?utf-8?B?dTZlYmQ2cStrNzVCTTFxMC9aOXYreWpnWTE2djN5Tkk4T3BDYUlkWlJhRGto?=
 =?utf-8?B?aTFPWWQ1L1QvN3h0ei9wMHk0UnVYZTJ0U2VaWHBoQnF3czJxQyt0Y0NFTnZP?=
 =?utf-8?B?NzVpTURoQ3RlUnhia2tjT0RuZlBwZDRScGlFWlAwRDUwQWc4bzFMalFFWGpG?=
 =?utf-8?B?R2xiWUdPbGVrSUlja1dqZGwzTks5TU5NSnVBeU9MZkxZck42d1FhYTh0QW53?=
 =?utf-8?B?dlJmeGUzQkRZRzh4SHkram1MdlFscUx6WGY1dXdVeldzQkxmYlA2TFBIS25u?=
 =?utf-8?B?TDNvOUVwVDhmNjl2U1ZhM3FxL0dWU1BkSm04UVd4Skk4bW8zdEJ1SDZrKzZn?=
 =?utf-8?B?cXRxNkNNc0J0aGdFVXh3amFyUkI3clNsYlBZM2JjZkkzYXh6WlZqaVJraXB5?=
 =?utf-8?B?c0JTQzhnc1VUNlFDbkJ1YzRkc3NTV1dmMzg1TUdmQTIrd2JZaFhZVjBSVnNq?=
 =?utf-8?B?S2tReEMwY2h5dlVHUmkvUE4vdit4ZmdsbVpnenhoRklEajNnM3NuMmZ5NmtH?=
 =?utf-8?B?T1dhUEdjWlM5eG4ydDVBTzBKQ2VtbU1zNHlSZ2pjamhVUGhHMllZNFREL01Q?=
 =?utf-8?B?elAvQ2NPUld5U2lPVWNWYVRkQzdCZm9LOCttelZ2clAyaHlaTkwxTFZxU2Zw?=
 =?utf-8?B?SzV3WmxKbFhweE1zRFYzdHVVVUppU2N0a05rTkJKb3hlZ2VldStoOEt4djZm?=
 =?utf-8?B?TmpoNGQyVUR0UURSU0hSZXBhTVg2VHVJWGxBdVRET2E1OFA3NEdVc2tLZFdF?=
 =?utf-8?B?T0FTcWJ5T3k1RTlXTDRadWY4R3JIZHlQTFVFT09ZY2tpM0U0N2g0a1laazk2?=
 =?utf-8?B?NWhLNFBmb1JRdjRzTmllN29jcnM1bVlOOXRsWnBKbTFmS3dNcmdwMFZEcWNr?=
 =?utf-8?B?aFgyd2hrS0pqUkl4YkFwSk51a1dJdXRqSEU1ZXRqMzVRalVqZE5NUjdtSExt?=
 =?utf-8?B?WDNzL0piWlE3NjZKTlpEeGtXZnRGTnV4RkxYZ0xVcjYycUNzS1A2ZkhzK3NK?=
 =?utf-8?B?NDlKcFllcHI1cTZpNVAvTjZhNmk4aGxzMUVKQy9vV2pxN2NHaGZRMEljQVFP?=
 =?utf-8?B?WGZuVjY3ZFVRcWlZYnQyUjE1ejU0a0l4QUNrcnUvSW5tV2Nqck5HYWhzaFlS?=
 =?utf-8?B?aFhqaTFZOHNCUVhUZlhOa0pURkxLYS9JMkJIbUdNSGM1bVROblFCQmFzOHY1?=
 =?utf-8?B?NjJ3VVNPcVFJUWhqVklSakZ6TFVQbmNLNTg5K1Fqd2JHSm9pMGRVQ1VtRXIr?=
 =?utf-8?B?Ync4WkxsYzdIbDFpbDNEbEFiNVMvejdoQmV0TElxMk9tV0J3S3E3WDR4akZq?=
 =?utf-8?B?ZnB2bTBMYis5Ykh4TjZYMkxvNDdSZ2RiY2Nja3YydFJtd1hOVTJmTGJrK2tM?=
 =?utf-8?B?cit4VnpZdUhHL2ZVVXpFM1FCY2VKR3FYMHM4V3NISTFpL3hsTVkxTXRjNU1l?=
 =?utf-8?B?cVZZNFFqQnE3RWhrbi8yQmJERzY4dXNMZWY4cEZZOFFrZWlKWWc1OE5hL25q?=
 =?utf-8?B?L0pkOGNTTnFHbTVxNWs3S1hsSTNEZ3dzbmQ0UUxxbm9QbXRNb2puektjR2pB?=
 =?utf-8?B?bjFHZDZGVllrankxN2RWYkdKODZOVlBVVm1NeGliUnQ2NERWcjd3UDJGVExE?=
 =?utf-8?B?MVo3YUhXeVo2V2NvL1FEeE5kTlkrZGN3T291WXpMUjFLUUR2MHNKblFvSU5w?=
 =?utf-8?B?aVZlR0k1dFdlcFh4OGYzV25IbFBnaXZsRXQxT1gwekxINTI4dHZaNU9TQ3hH?=
 =?utf-8?Q?1IFX7k7IAulev?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400de312-0410-45ea-3985-08d8c9dbf3c0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:43:00.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBEh/08xcZtsyzufU3ZXpz1xZZrZjiMY0dcx5q+aLp/sKlouu67tGjqdZA6l+DWT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDIuMjEgdW0gMTQ6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IHRsZHI7IERNQSBi
dWZmZXJzIGFyZW4ndCBub3JtYWwgbWVtb3J5LCBleHBlY3RpbmcgdGhhdCB5b3UgY2FuIHVzZQo+
IHRoZW0gbGlrZSB0aGF0IChsaWtlIGNhbGxpbmcgZ2V0X3VzZXJfcGFnZXMgd29ya3MsIG9yIHRo
YXQgdGhleSdyZQo+IGFjY291bnRpbmcgbGlrZSBhbnkgb3RoZXIgbm9ybWFsIG1lbW9yeSkgY2Fu
bm90IGJlIGd1YXJhbnRlZWQuCj4KPiBTaW5jZSBzb21lIHVzZXJzcGFjZSBvbmx5IHJ1bnMgb24g
aW50ZWdyYXRlZCBkZXZpY2VzLCB3aGVyZSBhbGwKPiBidWZmZXJzIGFyZSBhY3R1YWxseSBhbGwg
cmVzaWRlbnQgc3lzdGVtIG1lbW9yeSwgdGhlcmUncyBhIGh1Z2UKPiB0ZW1wdGF0aW9uIHRvIGFz
c3VtZSB0aGF0IGEgc3RydWN0IHBhZ2UgaXMgYWx3YXlzIHByZXNlbnQgYW5kIHVzZWFibGUKPiBs
aWtlIGZvciBhbnkgbW9yZSBwYWdlY2FjaGUgYmFja2VkIG1tYXAuIFRoaXMgaGFzIHRoZSBwb3Rl
bnRpYWwgdG8KPiByZXN1bHQgaW4gYSB1YXBpIG5pZ2h0bWFyZS4KPgo+IFRvIHN0b3AgdGhpcyBn
YXAgcmVxdWlyZSB0aGF0IERNQSBidWZmZXIgbW1hcHMgYXJlIFZNX1BGTk1BUCwgd2hpY2gKPiBi
bG9ja3MgZ2V0X3VzZXJfcGFnZXMgYW5kIGFsbCB0aGUgb3RoZXIgc3RydWN0IHBhZ2UgYmFzZWQK
PiBpbmZyYXN0cnVjdHVyZSBmb3IgZXZlcnlvbmUuIEluIHNwaXJpdCB0aGlzIGlzIHRoZSB1YXBp
IGNvdW50ZXJwYXJ0IHRvCj4gdGhlIGtlcm5lbC1pbnRlcm5hbCBDT05GSUdfRE1BQlVGX0RFQlVH
Lgo+Cj4gTW90aXZhdGVkIGJ5IGEgcmVjZW50IHBhdGNoIHdoaWNoIHdhbnRlZCB0byBzd2ljaCB0
aGUgc3lzdGVtIGRtYS1idWYKPiBoZWFwIHRvIHZtX2luc2VydF9wYWdlIGluc3RlYWQgb2Ygdm1f
aW5zZXJ0X3Bmbi4KPgo+IHYyOgo+Cj4gSmFzb24gYnJvdWdodCB1cCB0aGF0IHdlIGFsc28gd2Fu
dCB0byBndWFyYW50ZWUgdGhhdCBhbGwgcHRlcyBoYXZlIHRoZQo+IHB0ZV9zcGVjaWFsIGZsYWcg
c2V0LCB0byBjYXRjaCBmYXN0IGdldF91c2VyX3BhZ2VzIChvbiBhcmNoaXRlY3R1cmVzCj4gdGhh
dCBzdXBwb3J0IHRoaXMpLiBBbGxvd2luZyBWTV9NSVhFRE1BUCAobGlrZSBWTV9TUEVDSUFMIGRv
ZXMpIHdvdWxkCj4gc3RpbGwgYWxsb3cgdm1faW5zZXJ0X3BhZ2UsIGJ1dCBsaW1pdGluZyB0byBW
TV9QRk5NQVAgd2lsbCBjYXRjaCB0aGF0Lgo+Cj4gIEZyb20gYXVkaXRpbmcgdGhlIHZhcmlvdXMg
ZnVuY3Rpb25zIHRvIGluc2VydCBwZm4gcHRlIGVudGlyZXMKPiAodm1faW5zZXJ0X3Bmbl9wcm90
LCByZW1hcF9wZm5fcmFuZ2UgYW5kIGFsbCBpdCdzIGNhbGxlcnMgbGlrZQo+IGRtYV9tbWFwX3dj
KSBpdCBsb29rcyBsaWtlIFZNX1BGTk1BUCBpcyBhbHJlYWR5IHJlcXVpcmVkIGFueXdheSwgc28K
PiB0aGlzIHNob3VsZCBiZSB0aGUgY29ycmVjdCBmbGFnIHRvIGNoZWNrIGZvci4KPgo+IFJlZmVy
ZW5jZXM6IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmxrbWwlMkZDQUtNSzd1SGklMkJtRzB6
MEhVbU50MTNRQ0N2dXR1UlZqcGNSME5qUkwxMmstV2JXemtSZyU0MG1haWwuZ21haWwuY29tJTJG
JmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2E4NjM0YmIw
YmU4ZDRiMGRlOGMxMDhkOGM5ZGJiODFjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzQ4MTI5MjgxNDk3Mjk1OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT04cnlsZ3NYaFd2UVQ1end0MVNjMk5iMklRUiUyRmtk
MTZFcklIZlo0UEVyWkklM0QmYW1wO3Jlc2VydmVkPTAKPiBDYzogSmFzb24gR3VudGhvcnBlIDxq
Z2dAemllcGUuY2E+Cj4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+
Cj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+IENjOiBKb2huIFN0
dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5h
cm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1i
dWYuYyB8IDE1ICsrKysrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiBpbmRleCBmMjY0YjcwYzM4M2Uu
LjA2Y2IxZDJlOWZkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4g
KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IEBAIC0xMjcsNiArMTI3LDcgQEAgc3Rh
dGljIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIGRtYV9idWZfZnNfdHlwZSA9IHsKPiAgIHN0YXRp
YyBpbnQgZG1hX2J1Zl9tbWFwX2ludGVybmFsKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSkKPiAgIHsKPiAgIAlzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmOwo+ICsJ
aW50IHJldDsKPiAgIAo+ICAgCWlmICghaXNfZG1hX2J1Zl9maWxlKGZpbGUpKQo+ICAgCQlyZXR1
cm4gLUVJTlZBTDsKPiBAQCAtMTQyLDcgKzE0MywxMSBAQCBzdGF0aWMgaW50IGRtYV9idWZfbW1h
cF9pbnRlcm5hbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
Cj4gICAJICAgIGRtYWJ1Zi0+c2l6ZSA+PiBQQUdFX1NISUZUKQo+ICAgCQlyZXR1cm4gLUVJTlZB
TDsKPiAgIAo+IC0JcmV0dXJuIGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKPiArCXJl
dCA9IGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKPiArCj4gKwlXQVJOX09OKCEodm1h
LT52bV9mbGFncyAmIFZNX1BGTk1BUCkpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gICB9Cj4gICAK
PiAgIHN0YXRpYyBsb2ZmX3QgZG1hX2J1Zl9sbHNlZWsoc3RydWN0IGZpbGUgKmZpbGUsIGxvZmZf
dCBvZmZzZXQsIGludCB3aGVuY2UpCj4gQEAgLTEyNDQsNiArMTI0OSw4IEBAIEVYUE9SVF9TWU1C
T0xfR1BMKGRtYV9idWZfZW5kX2NwdV9hY2Nlc3MpOwo+ICAgaW50IGRtYV9idWZfbW1hcChzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgIAkJIHVu
c2lnbmVkIGxvbmcgcGdvZmYpCj4gICB7Cj4gKwlpbnQgcmV0Owo+ICsKPiAgIAlpZiAoV0FSTl9P
TighZG1hYnVmIHx8ICF2bWEpKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+IEBAIC0xMjY0
LDcgKzEyNzEsMTEgQEAgaW50IGRtYV9idWZfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgIAl2bWFfc2V0X2ZpbGUodm1hLCBkbWFidWYt
PmZpbGUpOwo+ICAgCXZtYS0+dm1fcGdvZmYgPSBwZ29mZjsKPiAgIAo+IC0JcmV0dXJuIGRtYWJ1
Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKPiArCXJldCA9IGRtYWJ1Zi0+b3BzLT5tbWFwKGRt
YWJ1Ziwgdm1hKTsKPiArCj4gKwlXQVJOX09OKCEodm1hLT52bV9mbGFncyAmIFZNX1BGTk1BUCkp
Owo+ICsKPiArCXJldHVybiByZXQ7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVm
X21tYXApOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
