Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA5308B9B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 18:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F8D6EB97;
	Fri, 29 Jan 2021 17:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8176EB97;
 Fri, 29 Jan 2021 17:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8prwhmJqPwDpAaPJ4/uNhWCWTYCgEEhJ0rgr4SKzORSoC14LZrgMA0inUxp1uNxxlvzv0tFQoNrUuw9WmInytnnxVwSGoxjFDBD35TJCH2ivIl4wS43SMfynQMA9XtCm8trfYpyfPrWIRgYfm4+CwQDwCu4h2l0IVJDLcfE2i23JObAl8YMGoLPWncHGUbvFyN4EB4ycZU8yENQPmGcHS0/aWEUS/x485fYUwMdVnJ4y13DrYaJAiRMApfPrnKw2YZJv+5nFJMTavx0tGgUt/5npVgs4qTTgfh2V8k8MN1KcSAcDfLF2PbbtBrylrAX0xw+CA1A5FOtA5ehsjKyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDi4R93SMTQ+cIqjKaMz5C/uywys7eP6MKL6RT/Z20U=;
 b=Um78veA7L1rt9A4u4rMp5AM9YQqI7AG6kSzP3dwZtkBesxODKlm5ep9PeDkhWLsEXVPOjMPt8YPncSq0UZCmRWE3HkXsSaIE/lowdED2WdV+RX2bx8m7tX8TSULqv22QjD6F98q0+xtmTbr7xg+w4tFatZhxbuVa5SJabP5qMC8L/kijUr+p9m320jekOPYn8Faa4uF5+HdUqoFaAG2+0ORwlqW5E5K6XSiyhih4OV9Qh2+KTc39tJCdLE3XlD47UjH4nlXgz2bR74/UV5T1Y94RfrX80ZHdA7NYFpBY0QBENz8cGE+y7xKnYG8rK3Qbe1kSX+yIK0SjXV3GOc3bUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDi4R93SMTQ+cIqjKaMz5C/uywys7eP6MKL6RT/Z20U=;
 b=D6KjTtohFNj5Dx/zbi+iz94DI59DfEouwHiLp5v6aCwkE0jpVRymkJBybJ7cpad+FSfy0WuaGLSC+xwGF22Kclra/4W/Y/oRrzu6PnUYPEdQOW+6oE8nmFw1i4Rhjz4aRneYCyTSZXV2D05U8l4z/X30NgIpGKMbdoFiY4kiGsY=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 29 Jan
 2021 17:36:02 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3784.017; Fri, 29 Jan 2021
 17:36:02 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
Date: Fri, 29 Jan 2021 12:35:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9dce:d93c:fef8:674]
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9dce:d93c:fef8:674]
 (2607:fea8:3edf:49b0:9dce:d93c:fef8:674) by
 YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 17:36:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65b8ef6b-4219-4ebc-c0e8-08d8c47c5928
X-MS-TrafficTypeDiagnostic: SN1PR12MB2480:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB248074582A3FFB01E7FA19FCEAB99@SN1PR12MB2480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wv4KB/qcUmY8m7rDrGL8tR+b3kr1j350sxMHUCGNqkkxbAaQ1QYzeJvMrFiv6sxTNvxe6I5X3bPsPE3UTjz72aIL5/kIXktiGMi/IVFbEtXuhtRHiw1fDHwAruh+JIMj1AutIM4SZ5NVCdHVHB7OYUY7JTubJsUrn9vED5kj66hUkjBOzZTG8nNqSduVySP3xBqNiQuo/XSjjRBUYho76pPGrZfSP6X8MCVR4YUUOCxu0/rXQjnrd/Jx8BVp8aOx6T36ZpVPx4Atk9w4KanUeZuiw0TH4VjfQXmd9ynfiXdrVqjDjbaxKm3ZIgVUEphl4EK+HhAQwy86OEnxK4VOw9DVMDVcrYgn/t/Pv0/45r8Zl0EgHY3Mw6Mw8TgDzhSNgPrbN78jfybw9j2GEDulB/rJDYaKacqKh9Q+WIAFVQPiM9CndX4VUAx/GK16yLXh5W2gpWF1ZqhDW2JwQucaOXNSThvf5PY4CPLi+dIhGC2KDaxUbmXsHmBuS0DtO1jgE8CD8KFE5gI564cSpFjzT2BuGB0O5NyosjHQM306LbSkibTtPfDTAW5oAWdUwxuy0QJqXfb+RfvOyWr1q9u6ZoVkn7EBAIvJ2iCt7ul7WKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(478600001)(4326008)(66476007)(36756003)(66946007)(31686004)(186003)(5660300002)(66556008)(31696002)(16526019)(110136005)(2616005)(83380400001)(66574015)(52116002)(316002)(8936002)(53546011)(54906003)(2906002)(6486002)(8676002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UURBRUphbGFrK1hERDlscWU0RnJNT3J0RHJLOXFZMG52VUlxUlZxZ2dNQjFU?=
 =?utf-8?B?cy95cHhuY2ZPdlRpSEVKMEgwSHhYbVJFNWR3OFBHOCt4MjRuNHo2R28yMldM?=
 =?utf-8?B?RnRic0R1cmRlcjJtQkJjUkQrQnNSdk9pZ01lR0RFV2RYTnUzc3R2cGVaSGFM?=
 =?utf-8?B?SEZ4Q2E4ejVjeWRwOUhIbUNlZVpyelZ4OGdmWEY2dHN2bTNJbEhUNHJmWm9o?=
 =?utf-8?B?Y2R0NWlIMjZCaG5TNkNkQkZwcS9aanMxOFNXY3I3TGNXMTY5SC9CSDNUdmQx?=
 =?utf-8?B?TEZ5YzFQWTZTMlBKVW84RDd5Z1JrMjBMS2pQcm42SmJDT2EwRU9EcXFoWnZq?=
 =?utf-8?B?a3lxYjFDb1RxV3FXMEoxYTVMWE1vT1h1SVgraDJOcjdQdGVmSFIyWU9FUGpw?=
 =?utf-8?B?WHN6cmNCSUx3MXFhWU1NR3pKU09UcWh3OFFPRnNVVkZZMUJBMFc0YWZFWmly?=
 =?utf-8?B?L3FqVzZxQ2JFY1ZmMzRHTzltcFlyVUlxcVB0TzlvbEVQeTRRejExS0g3Tkpl?=
 =?utf-8?B?SytxTU96K1lZSmszZG1tbmFzMHhodmk3elhHaWM0T2QzZmRpdTVVQ2RQd1Br?=
 =?utf-8?B?S2ZhUGRnVEc2MnVlTU1rZWducWg2OWp4SzNuZ1J1ZW9ncTBrL3RiakJsZWhz?=
 =?utf-8?B?SG1Kb2tsMlFmRm52a0F1VjVsLzhNOHBMeFZqSTMyRWZ4NS9RV1pMYTdVUVNI?=
 =?utf-8?B?SEEwdFdjVWVTOHBaREI0TDV6bEMyalVsekhSWXpuY3lhZVR3T0ZxZGN2czhE?=
 =?utf-8?B?TnZpeTMyQ3V2Rk12YUcrRjREcFYyZUVzRmlqdmxaNlB3NURsbEc0dDZoUWVs?=
 =?utf-8?B?S2NXYlhEeTU1K2VvUTROZG5WZDJGUDhrZEtKditLSUt0SkI0YjZTaGJyY2Jn?=
 =?utf-8?B?RWhvUktXbDJBbHNTazZ4VUhtSVVWOTR3ZEZqMFdaOVhWK3QxZXlZejd0YXQ2?=
 =?utf-8?B?TTROY2ZzZ2FCT09TekhWWVBJRlEyT2FNd2JvSmhCeEUramsvNm03ZTd0eVZl?=
 =?utf-8?B?NDBQbVYzQlFkZ0dVWHJKb1Bod1FmeUI1YzNSS1ZCOWh4TzB4MDhWUjRGWXJu?=
 =?utf-8?B?c3RwV2lSVnc1N1RVcExFYitRN2gzekt1dmlaeW1CVXhmZ0R0QVdYekZqd1Rv?=
 =?utf-8?B?c2pOZk54Sk9BKzg1Q1YvM2NQZUdmTkpmWVMzU2VZdFdJVlhOeHUwaC9zR2Qy?=
 =?utf-8?B?UXBsZkpSaVRqMTl5UmtlcVF5TUpZQk1Rb083dVc4QTRiT2xLeFRvSkdSOGNn?=
 =?utf-8?B?QVV3enFoVENEaTF2a0VmWk9kR3BQOGZoQkYwbUM4YU1oRFBzMjBxMFp3dmZT?=
 =?utf-8?B?dHJKUVFXeVpSRXZuQmVkamlyZlZsaGROQWZCTHFtWmEwSlNlY3RmQm9WMHIr?=
 =?utf-8?B?YTJzWFIxMjN4S2djY2tBaktOakxQamd1dmZ3ZnRSalUwSStKSEtmbU14aGVG?=
 =?utf-8?B?VUxIU0VBSEJZYjBrcC9RYURtZVBibnI2a2o4TmpReDNSaVNGajg4cGQ3emdn?=
 =?utf-8?B?Q3B5SWxjbDNFbEFhY0tmS3liTitBbElvREppNGhrNXlsOXZTSnBlZ2NJalB2?=
 =?utf-8?B?SVZNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b8ef6b-4219-4ebc-c0e8-08d8c47c5928
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 17:36:02.6075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h0ICVHh7H+MRf+Xf7S9thWSDuC6tbiSU4L1hmJ43ibift1XH61FO/sNW2S7d6g8/WAFvgr2uRgDxO0dzgvDRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2480
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMjkvMjEgMTA6MTYgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjguMDEu
MjEgdW0gMTg6MjMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMS8xOS8yMSAx
OjU5IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMTkuMDEuMjEgdW0gMTk6MjIg
c2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pgo+Pj4+IE9uIDEvMTkvMjEgMTowNSBQTSwg
RGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4gW1NOSVBdCj4+Pj4gU28gc2F5IHdyaXRpbmcgaW4g
YSBsb29wIHRvIHNvbWUgaGFybWxlc3Mgc2NyYXRjaCByZWdpc3RlciBmb3IgbWFueSB0aW1lcyAK
Pj4+PiBib3RoIGZvciBwbHVnZ2VkCj4+Pj4gYW5kIHVucGx1Z2dlZCBjYXNlIGFuZCBtZWFzdXJl
IHRvdGFsIHRpbWUgZGVsdGEgPwo+Pj4KPj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGF0IGxlYXN0IG1l
YXN1cmUgdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiAxLiBXcml0aW5nIFggdGltZXMgdG8gYSBzY3Jh
dGNoIHJlZyB3aXRob3V0IHlvdXIgcGF0Y2guCj4+PiAyLiBXcml0aW5nIFggdGltZXMgdG8gYSBz
Y3JhdGNoIHJlZyB3aXRoIHlvdXIgcGF0Y2guCj4+PiAzLiBXcml0aW5nIFggdGltZXMgdG8gYSBz
Y3JhdGNoIHJlZyB3aXRoIHRoZSBoYXJkd2FyZSBwaHlzaWNhbGx5IGRpc2Nvbm5lY3RlZC4KPj4+
Cj4+PiBJIHN1Z2dlc3QgdG8gcmVwZWF0IHRoYXQgb25jZSBmb3IgUG9sYXJpcyAob3Igb2xkZXIp
IGFuZCBvbmNlIGZvciBWZWdhIG9yIE5hdmkuCj4+Pgo+Pj4gVGhlIFNSQk0gb24gUG9sYXJpcyBp
cyBtZWFudCB0byBpbnRyb2R1Y2Ugc29tZSBkZWxheSBpbiBlYWNoIGFjY2Vzcywgc28gaXQgCj4+
PiBtaWdodCByZWFjdCBkaWZmZXJlbnRseSB0aGVuIHRoZSBuZXdlciBoYXJkd2FyZS4KPj4+Cj4+
PiBDaHJpc3RpYW4uCj4+Cj4+Cj4+IFNlZSBhdHRhY2hlZCByZXN1bHRzIGFuZCB0aGUgdGVzdGlu
ZyBjb2RlLiBSYW4gb24gUG9sYXJpcyAoZ2Z4OCkgYW5kIAo+PiBWZWdhMTAoZ2Z4OSkKPj4KPj4g
SW4gc3VtbWFyeSwgb3ZlciAxIG1pbGxpb24gV1dSRUczMiBpbiBsb29wIHdpdGggYW5kIHdpdGhv
dXQgdGhpcyBwYXRjaCB5b3UgCj4+IGdldCBhcm91bmQgMTBtcyBvZiBhY2N1bXVsYXRlZCBvdmVy
aGVhZCAoIHNvIDAuMDAwMDEgbWlsbGlzZWNvbmQgcGVuYWx0eSBmb3IgCj4+IGVhY2ggV1dSRUcz
MikgZm9yIHVzaW5nIGRybV9kZXZfZW50ZXIgY2hlY2sgd2hlbiB3cml0aW5nIHJlZ2lzdGVycy4K
Pj4KPj4gUC5TIEJ1bGxldCAzIEkgY2Fubm90IHRlc3QgYXMgSSBuZWVkIGVHUFUgYW5kIGN1cnJl
bnRseSBJIGRvbid0IGhhdmUgb25lLgo+Cj4gV2VsbCBpZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlz
dGFrZW4gdGhhdCBhcmUgMTAwbXMgb2YgYWNjdW11bGF0ZWQgb3ZlcmhlYWQuIFNvIAo+IGFyb3Vu
ZCAxMDBucyBwZXIgd3JpdGUuIEFuZCBldmVuIGJpZ2dlciBwcm9ibGVtIGlzIHRoYXQgdGhpcyBp
cyBhIH42NyUgaW5jcmVhc2UuCgoKTXkgYmFkLCBhbmQgNjclIGZyb20gd2hhdCA/IEhvdyB1IGNh
bGN1bGF0ZSA/CgoKPgo+IEknbSBub3Qgc3VyZSBob3cgbWFueSB3cml0ZSB3ZSBkbyBkdXJpbmcg
bm9ybWFsIG9wZXJhdGlvbiwgYnV0IHRoYXQgc291bmRzIAo+IGxpa2UgYSBiaXQgbXVjaC4gSWRl
YXM/CgoKV2VsbCwgdSBzdWdnZXN0ZWQgdG8gbW92ZSB0aGUgZHJtX2Rldl9lbnRlciB3YXkgdXAg
YnV0IGFzIGkgc2VlIGl0IHRoZSBwcm9ibGVtIAp3aXRoIHRoaXMgaXMgdGhhdCBpdCBpbmNyZWFz
ZSB0aGUgY2hhbmNlIG9mIHJhY2Ugd2hlcmUgdGhlCmRldmljZSBpcyBleHRyYWN0ZWQgYWZ0ZXIg
d2UgY2hlY2sgZm9yIGRybV9kZXZfZW50ZXIgKHRoZXJlIGlzIGFsc28gc3VjaCBjaGFuY2UgCmV2
ZW4gd2hlbiBpdCdzIHBsYWNlZCBpbnNpZGUgV1dSRUcgYnV0IGl0J3MgbG93ZXIpLgpFYXJsaWVy
IEkgcHJvcHNlZCB0aGF0IGluc3RlYWQgb2YgZG9pbmcgYWxsIHRob3NlIGd1YXJkcyBzY2F0dGVy
ZWQgYWxsIG92ZXIgdGhlIApjb2RlIHNpbXBseSBkZWxheSByZWxlYXNlIG9mIHN5c3RlbSBtZW1v
cnkgcGFnZXMgYW5kIHVucmVzZXJ2ZSBvZgpNTUlPIHJhbmdlcyB0byB1bnRpbCBhZnRlciB0aGUg
ZGV2aWNlIGl0c2VsZiBpcyBnb25lIGFmdGVyIGxhc3QgZHJtIGRldmljZSAKcmVmZXJlbmNlIGlz
IGRyb3BwZWQuIEJ1dCBEYW5pZWwgb3Bwb3NlcyBkZWxheWluZyBNTUlPIHJhbmdlcyB1bnJlc2Vy
dmUgdG8gYWZ0ZXIKUENJIHJlbW92ZSBjb2RlIGJlY2F1c2UgYWNjb3JkaW5nIHRvIGhpbSBpdCB3
aWxsIHVwc2V0IHRoZSBQQ0kgc3Vic3l0ZW0uCgpBbmRyZXkKCj4KPiBDaHJpc3RpYW4uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
