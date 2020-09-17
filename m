Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392426D558
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 09:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4716EB0C;
	Thu, 17 Sep 2020 07:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB56EB0C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCoAvw/Zbk15xRCknOjhhISQ0S4k7TEOzPaYAc0vbwvRUv4IPz0b40qjYhaIcwRVq5pnT8odM1C8o5KsHQtO9YALTLSPKjZfz91FWdz0jupDur973D8mru+koOk0gFTGhIC2J7vMoXyAE0HDslgHllBCyS3KOIy7AyzaHeZLGY6jK+uNRkg2yA/v8sMpaT+Dv1ukPkMdMxaI3IOT4q0etB0gj7QB3oY95x14kNzdDUIlbQWO5GwI9K4+bAnQpWOyusSkNxScrnvcFqn3+EpCe/f6FGcVRwEXtAbFkCzfZnSaNfDb7OGxPZVd7YtL7n+b/1/EdEcWnsU3WDZnSXv+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aflgh+qhla4P652+QBdWGTIaV4ZyHm84sxUcTv6k2Dc=;
 b=Nts8MeKRdpOV/rRIJRGwd/FUDIDBXp0wF532RRDC/QsLR/XvLMZz6P2ZPQUkFBuXY8svbCYECovjKCK3QVWzGTbuVx7eXDfroLCaTM962oB6ZPY8EAqR5MgFiBFECcab3V0pfR7mO8Rr4g+lYxV07XXBki/Nc2EM8PNoLE93V/QMurBUSXED1v2vY/3Nl4vsPpWUxGFbFenXma9ZEKisXBBqrC8hu2jmK/ezvsG492DconqBzf45HCWhWp1FaNwxABvRe4Ka48gcZ1js4NnyGqK/ZZ+yTxYzG8Z4RppxjZ7B9oj4JPviaMRIgp/xrjlGNm/LKHlZ9hDa96cK+pOr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aflgh+qhla4P652+QBdWGTIaV4ZyHm84sxUcTv6k2Dc=;
 b=peqB0cD3dXjZP6XviHDw+nP0Hqc83Tb/jtdstu5SsQN8ig6En5MJX+rb0mRVSDMM45qjye2HR1bR0v/Zmk+tDiQwa1CLiI0kQX/r0glGpEoCkNU0jtEXmvQJZI3TbDNRVPFwrUd/cYdeWR+2pikX3VGOREdKEdx6b6oyTlJHu00=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 07:55:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:55:47 +0000
Subject: Re: [PATCH 6/7] drm/ttm: move ghost object creation to a common
 function
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917043040.146575-1-airlied@gmail.com>
 <20200917043040.146575-7-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a295fdf9-d1db-d1d8-34fe-7bdfd0c3e10a@amd.com>
Date: Thu, 17 Sep 2020 09:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917043040.146575-7-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0010.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0010.eurprd09.prod.outlook.com (2603:10a6:200:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 07:55:47 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d244333c-44cf-4ed6-fc5f-08d85adf169a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB423905017435AE2C31FE9B25833E0@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwrMIKkc5Q1DVJOAJ3C0IjfojAYBUywvUh1rwwTZQrvZ7flmEMrX/1rwRLsAZLAy0HScThVrZ5hDsU+NSq6JH5DnH8+f8OhfLofULp+7hPWxQz4DO+EHhUuQAfvmy+vdWwt2cZ+/zy/Oyxz+VjlEMXUH4UxzfZCy7K/FSs+jsAsYXEBLmy57pa9LWbgrw335CrwTjqPhT21ahl3Xrbp2UG3dl5oUvcksc75dTdVu28ozY1/9s6JfJy/stvyj7pM6lSlp0ahlueDixzztCruTpKNMpjPVx9YJkT1j8pLqGkJV5pnfn0XovDki2cO1iULJvwIwY81q0YGV0Esx5qkj9h5thCrfbM0OC5Z50YU36FeIoIxOgYGT2CKY+oMyeUUB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(6666004)(2906002)(66946007)(36756003)(31686004)(2616005)(186003)(316002)(66476007)(83380400001)(66556008)(6486002)(5660300002)(16526019)(31696002)(8936002)(8676002)(52116002)(86362001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: OXKhSZvMlbXF4b8klyHxYYQT7vBUg1yAME8AfcJfjVY3Jgx1prsuXhSX2AunCnwMvHjqHiC1KER71PGiEwzhRYWY+VKMysCKmy1GTafiS8QUOigDTALcFd0Nz73wzMOCqQwN0D68KJfMBWu/BozJfUkf9Db2OiwftfCZYRnBPAzKAkZ/icic5a1DMNDS51uFRSKN+XdZqFAyigfcTQPc1nrBZXxmxgYTAWU7bUAbCQUg0PSK6oWF/DNZq20xHtZOTdhkMc5dGYJdNLS4gM3W4k4KencsYHPKXnb00IezXkxWPADeoV5G4CNy2u1E4hWF8uF0QdRt82QFdg7daO81MBPYMHhTVZ5FQDQ28PKWKoLRMChRCWtUo+mIgO3kLDMMHsGeyxjAv/BWsa33J8eDdV7QF3ey5543Wua6UYWNzve4P/OZZiCguPmpbF3trkXWUSSn+PhokEJFrvlUxcBS9pIhL2mfeHQTHh2IpvHM6gh31c3GHY9cfIc4WgHwSw5Glw9niR2GQDN9sIVj0nWLcnews33YMgEYnXEVs7vDw1PNocv4+tspmR6cnYPjoJr0nkTON1eM9W4cJTa+tndG3vkeo+NOkud7JPvVshypamFlTmhwl9eWWhJliNK4wFbscd2SXBUB4nJNKSnRNODne3DMUu2vGU1qJcsNznLs0fmLoyWkMZVSer55ZJALO2o3yU0O8os5Fo6Pz/rtiiRwxg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d244333c-44cf-4ed6-fc5f-08d85adf169a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:55:47.8046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: td5ypcYgCbIaSFLI9RD4X5Eb5K/e6/hfH7rpEFgZHqnHP8ib1G24GO0m2T8/Zm2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

QW0gMTcuMDkuMjAgdW0gMDY6MzAgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gQm90aCBhY2NlbCBjbGVhbnVwIGFuZCBwaXBl
bGluZSBtb3ZlIGhhZCB0aGUgc2FtZSBjb2RlLCBtYWtlCj4gYSBzaW5nbGUgZnVuY3Rpb24gZm9y
IGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4K
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDEwNSArKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspLCA2MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPiBpbmRl
eCA1YThkNzdlZjUwNGYuLjNjMTZlMzAzZDJlMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib191dGlsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMKPiBAQCAtNTI2LDYgKzUyNiw0NyBAQCB2b2lkIHR0bV9ib19rdW5tYXAoc3RydWN0IHR0
bV9ib19rbWFwX29iaiAqbWFwKQo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fa3VubWFw
KTsKPiAgIAo+ICtzdGF0aWMgaW50IHR0bV9ib19tb3ZlX3RvX2dob3N0KHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gKwkJCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwKPiArCQkJCWJv
b2wgZHN0X3VzZV90dCkKPiArewo+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpnaG9zdF9v
Ymo7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qKgo+ICsJICogVGhpcyBzaG91bGQgaGVscCBwaXBl
bGluZSBvcmRpbmFyeSBidWZmZXIgbW92ZXMuCj4gKwkgKgo+ICsJICogSGFuZyBvbGQgYnVmZmVy
IG1lbW9yeSBvbiBhIG5ldyBidWZmZXIgb2JqZWN0LAo+ICsJICogYW5kIGxlYXZlIGl0IHRvIGJl
IHJlbGVhc2VkIHdoZW4gdGhlIEdQVQo+ICsJICogb3BlcmF0aW9uIGhhcyBjb21wbGV0ZWQuCj4g
KwkgKi8KPiArCj4gKwlkbWFfZmVuY2VfcHV0KGJvLT5tb3ZpbmcpOwo+ICsJYm8tPm1vdmluZyA9
IGRtYV9mZW5jZV9nZXQoZmVuY2UpOwo+ICsKPiArCXJldCA9IHR0bV9idWZmZXJfb2JqZWN0X3Ry
YW5zZmVyKGJvLCAmZ2hvc3Rfb2JqKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAr
Cj4gKwlkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZSgmZ2hvc3Rfb2JqLT5iYXNlLl9yZXN2LCBmZW5j
ZSk7Cj4gKwo+ICsJLyoqCj4gKwkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9y
eSwgdGhlIFRUTSBvYmplY3QKPiArCSAqIG5lZWRzIHRvIHN0YXkgYWxpdmUuIE90aGVyd2hpc2Ug
aGFuZyBpdCBvbiB0aGUgZ2hvc3QKPiArCSAqIGJvIHRvIGJlIHVuYm91bmQgYW5kIGRlc3Ryb3ll
ZC4KPiArCSAqLwo+ICsKPiArCWlmIChkc3RfdXNlX3R0KSB7Cj4gKwkJZ2hvc3Rfb2JqLT50dG0g
PSBOVUxMOwo+ICsJfSBlbHNlIHsKPiArCQliby0+dHRtID0gTlVMTDsKPiArCX0KClRoZSB7fSBj
YW4gYmUgZHJvcHBlZCBoZXJlLCBhcGFydCBmcm9tIHRoYXQgdGhlIHBhdGNoIGlzIFJldmlld2Vk
LWJ5OiAKQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiArCj4g
KwlkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7Cj4gKwl0dG1fYm9fcHV0
KGdob3N0X29iaik7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIGludCB0dG1fYm9fbW92ZV9h
Y2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCQkgICAgICBz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwKPiAgIAkJCSAgICAgIGJvb2wgZXZpY3QsCj4gQEAgLTUz
NCw3ICs1NzUsNiBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAo+ICAgCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJk
ZXY7Cj4gICAJc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdlcl90
eXBlKGJkZXYsIG5ld19tZW0tPm1lbV90eXBlKTsKPiAgIAlpbnQgcmV0Owo+IC0Jc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpnaG9zdF9vYmo7Cj4gICAKPiAgIAlkbWFfcmVzdl9hZGRfZXhjbF9m
ZW5jZShiby0+YmFzZS5yZXN2LCBmZW5jZSk7Cj4gICAJaWYgKGV2aWN0KSB7Cj4gQEAgLTU0Niwz
NyArNTg2LDkgQEAgaW50IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPiAgIAkJCXR0bV9ib190dF9kZXN0cm95KGJvKTsKPiAgIAkJdHRtX2Jv
X2ZyZWVfb2xkX25vZGUoYm8pOwo+ICAgCX0gZWxzZSB7Cj4gLQkJLyoqCj4gLQkJICogVGhpcyBz
aG91bGQgaGVscCBwaXBlbGluZSBvcmRpbmFyeSBidWZmZXIgbW92ZXMuCj4gLQkJICoKPiAtCQkg
KiBIYW5nIG9sZCBidWZmZXIgbWVtb3J5IG9uIGEgbmV3IGJ1ZmZlciBvYmplY3QsCj4gLQkJICog
YW5kIGxlYXZlIGl0IHRvIGJlIHJlbGVhc2VkIHdoZW4gdGhlIEdQVQo+IC0JCSAqIG9wZXJhdGlv
biBoYXMgY29tcGxldGVkLgo+IC0JCSAqLwo+IC0KPiAtCQlkbWFfZmVuY2VfcHV0KGJvLT5tb3Zp
bmcpOwo+IC0JCWJvLT5tb3ZpbmcgPSBkbWFfZmVuY2VfZ2V0KGZlbmNlKTsKPiAtCj4gLQkJcmV0
ID0gdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoYm8sICZnaG9zdF9vYmopOwo+ICsJCXJldCA9
IHR0bV9ib19tb3ZlX3RvX2dob3N0KGJvLCBmZW5jZSwgbWFuLT51c2VfdHQpOwo+ICAgCQlpZiAo
cmV0KQo+ICAgCQkJcmV0dXJuIHJldDsKPiAtCj4gLQkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2Uo
Jmdob3N0X29iai0+YmFzZS5fcmVzdiwgZmVuY2UpOwo+IC0KPiAtCQkvKioKPiAtCQkgKiBJZiB3
ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3QKPiAtCQkgKiBu
ZWVkcyB0byBzdGF5IGFsaXZlLiBPdGhlcndoaXNlIGhhbmcgaXQgb24gdGhlIGdob3N0Cj4gLQkJ
ICogYm8gdG8gYmUgdW5ib3VuZCBhbmQgZGVzdHJveWVkLgo+IC0JCSAqLwo+IC0KPiAtCQlpZiAo
bWFuLT51c2VfdHQpIHsKPiAtCQkJZ2hvc3Rfb2JqLT50dG0gPSBOVUxMOwo+IC0JCX0gZWxzZSB7
Cj4gLQkJCWJvLT50dG0gPSBOVUxMOwo+IC0JCX0KPiAtCj4gLQkJZG1hX3Jlc3ZfdW5sb2NrKCZn
aG9zdF9vYmotPmJhc2UuX3Jlc3YpOwo+IC0JCXR0bV9ib19wdXQoZ2hvc3Rfb2JqKTsKPiAgIAl9
Cj4gICAKPiAgIAl0dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4gQEAgLTU5OSw0MCAr
NjExLDkgQEAgaW50IHR0bV9ib19waXBlbGluZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8sCj4gICAJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoYm8tPmJhc2UucmVzdiwgZmVuY2Up
Owo+ICAgCj4gICAJaWYgKCFldmljdCkgewo+IC0JCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Z2hvc3Rfb2JqOwo+IC0KPiAtCQkvKioKPiAtCQkgKiBUaGlzIHNob3VsZCBoZWxwIHBpcGVsaW5l
IG9yZGluYXJ5IGJ1ZmZlciBtb3Zlcy4KPiAtCQkgKgo+IC0JCSAqIEhhbmcgb2xkIGJ1ZmZlciBt
ZW1vcnkgb24gYSBuZXcgYnVmZmVyIG9iamVjdCwKPiAtCQkgKiBhbmQgbGVhdmUgaXQgdG8gYmUg
cmVsZWFzZWQgd2hlbiB0aGUgR1BVCj4gLQkJICogb3BlcmF0aW9uIGhhcyBjb21wbGV0ZWQuCj4g
LQkJICovCj4gLQo+IC0JCWRtYV9mZW5jZV9wdXQoYm8tPm1vdmluZyk7Cj4gLQkJYm8tPm1vdmlu
ZyA9IGRtYV9mZW5jZV9nZXQoZmVuY2UpOwo+IC0KPiAtCQlyZXQgPSB0dG1fYnVmZmVyX29iamVj
dF90cmFuc2ZlcihibywgJmdob3N0X29iaik7Cj4gKwkJcmV0ID0gdHRtX2JvX21vdmVfdG9fZ2hv
c3QoYm8sIGZlbmNlLCB0by0+dXNlX3R0KTsKPiAgIAkJaWYgKHJldCkKPiAgIAkJCXJldHVybiBy
ZXQ7Cj4gLQo+IC0JCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jl
c3YsIGZlbmNlKTsKPiAtCj4gLQkJLyoqCj4gLQkJICogSWYgd2UncmUgbm90IG1vdmluZyB0byBm
aXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0Cj4gLQkJICogbmVlZHMgdG8gc3RheSBhbGl2ZS4g
T3RoZXJ3aGlzZSBoYW5nIGl0IG9uIHRoZSBnaG9zdAo+IC0JCSAqIGJvIHRvIGJlIHVuYm91bmQg
YW5kIGRlc3Ryb3llZC4KPiAtCQkgKi8KPiAtCj4gLQkJaWYgKHRvLT51c2VfdHQpIHsKPiAtCQkJ
Z2hvc3Rfb2JqLT50dG0gPSBOVUxMOwo+IC0JCX0gZWxzZSB7Cj4gLQkJCWJvLT50dG0gPSBOVUxM
Owo+IC0JCX0KPiAtCj4gLQkJZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3Yp
Owo+IC0JCXR0bV9ib19wdXQoZ2hvc3Rfb2JqKTsKPiAtCj4gICAJfSBlbHNlIGlmICghZnJvbS0+
dXNlX3R0KSB7Cj4gICAKPiAgIAkJLyoqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
