Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C359D275A4F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94D86E9C0;
	Wed, 23 Sep 2020 14:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133F16E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdUYKQ3nHkgHNtnQmjh/b+5OpRfVGZ/yvYyaTPXitCDkTgr/gqpz2rz1wpCkXjqwqN3zyaQNKQJI8uHBm1Wa1hEc94RFuQxcbP6tkAfH5O5YYVOiV/Nqo6C92UEXkPXvqCDVnwQGpT4WDCiZ8MDXN2DS69eRWY3aCAbJqV+4r4MzMa/6sgKywTzwqFxUR+ecq35uGckTrm3nrFb5FGbqDaUAru2l5c9beZ2WBvi3/klROnjuPmqiQszLwfUHeHuLMQZ9e5k0uo4oQluZfHKnEJrQx26Fdu+hBZnEFm9mCfRH9UHu6mkvmBkGtOunbJpOKz1rykjNop9pIV99aQGD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53+ppEku/COwgqauWSTUYiiFn0kO32k8rxEaSB3Bcmc=;
 b=WToVdUTCN5CiPfG6q2TmBELs7IsigEUlE1GzGdQtmeab++OK+yfggrZAFZQ48ym422BN66/4lyxV5InaZyujuNCZRI4MZP6haKMqsIPozbKwTNrbaFJ5/GiCb1RrwfkRBzfpaSCUtrR7B24ccJr2eSOcjiDZ2JDT/ofoNAwv7KsHdzHxCFWNwRCR/Qe585po/VPqptYa92K3l8IZeX0ZH2zddLMuNXjNtZoLaNGRoTsx6YlA8l39Z62b5R0gCSo0ADLh+DVtwCHqvVDB86WQV2e3vrcHE+Ot/3jotpGGJU2rWoBzmjdMcG0TvJwUwVb33SOMEJFYXcF8XwCkFhhB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53+ppEku/COwgqauWSTUYiiFn0kO32k8rxEaSB3Bcmc=;
 b=D6KSQffVzd+k/i1tM7rWccvB+6tZsQVWeZHuSRzMdSf23hQvAtY1fMdC6GfWzgh+b2cgROA/2doOojxd3I5xjAmgbfMibb7GVrOzAs3Ly/a/sW2LgddVfKAw7+tHhX+T9Z54jbwPqlGNJ0NkfJOC8reXBdljb1jFhqqcwsb3nlI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:38:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:38:32 +0000
Subject: Re: [PATCH 03/10] drm/radeon: cleanup ttm operation ctx usage.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f1dc3fc9-6be1-5959-7ce3-6dc9b134b117@amd.com>
Date: Wed, 23 Sep 2020 16:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-4-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:205:1::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:205:1::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.9 via Frontend Transport; Wed, 23 Sep 2020 14:38:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05b35a4b-2189-462d-d4c0-08d85fce5817
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB423979898D5E77D1F2C8594183380@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnya8KkBJp6H6PcABtiw64p1NMiRFgJmjMkZl3uwNFa0UIIiG0aUjrzoPqha7ifMDWvrclheabGlpC0YC34K6KK6R4IleK/KfHQPYLoAsFOqOjncsdTv/jgk9+F6QWoA9WvBA5LXf2K4eLxuTgl+9kQbB2o8AUmu1gBCILopnq93cbHA820zPaRN6bHQkViaG1XFujCORpnIGhJj3oS7MV0bjufDA1+FpMKzRCsBcbAfYfaSanKeTl1hHizHNgKu5KQFvurVbQKmoA9XHiZ/vYbkZN+4mz57r9oh4ykZFgd6OPaHbYh7KBlod7gmBUx7bdndRYNqoqk1QMX7q8KDxtMXSh0S+Z3dFAOfFkmFiEN6l5FxC2AhI7QXzECCJPac
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(5660300002)(2616005)(86362001)(31686004)(16526019)(186003)(66476007)(83380400001)(66556008)(8676002)(8936002)(66574015)(4326008)(31696002)(478600001)(66946007)(52116002)(6486002)(316002)(6666004)(2906002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 79Nu6C72Petf7ip/VBW/r/3UewMyOnqdjOCYQFQIHPgnUxtqm/U8aiCK/cEqVaAhlH9oWN1TK/P78GsRgPBzME4o/8iFNq2jgV/d2XAA8FxH9GXRr5zLuY/z2Jy/mXeaREOuv1wb6YgWCPWq36TzbZ888JkRHoGRi4wdY3WKnFY7m7niYh/4rRXaSTi8CT7LuSchZhv6KDXajGAixq9rJDRTEB49dHXTLE0wxV3RBXD0DVWxEEjPQWbC5o+CF2sDjE7L8LjWtLX0nC4VW5jbFhrx2zBMzxG15lJhBbhCrJ5qm4gbxkxvhJb/vDcpC625EShcMIxO/mOdN1smUdSZcKpEAguLHjLYtFu83Sofs8hEGKwk1ke0dprl+FMPbl7Z41doamuMOaSKfba5Nsx/QF2ESpFKw5g6wxWOMgdcgyQBjZvV40nmHFLJ+bJana1Pe4uNA29XWlXOC/s2LtkjMnn4TttNfsrCoWSVN7vIki5Yo+cWlXet2IYgPzxE0kGjFJD7w1efX0E9FCvHM/F1jiurMYqFpdoYbVqbuPyz4YUp0OpKZ3lc0m7c0vUirs4u6/jOR4yXb4Q9khwdNnypK9CKcnInXtzNzoCM9U3VqnbfAm5EzC8BPtV4QbDKijZSZ+lH3Kr+8MHo4U3SnrXA4aTyQKb07N3kR0Ju+8bxSnHr8YmFqRHbFe2TcI9lBuIwHl5QX7WpHebawgJjDuC/1g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b35a4b-2189-462d-d4c0-08d85fce5817
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:38:31.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqw7rZ9FpjTe4ZxyBG/7VhTvOrI64lyXgSQQ3KacVpR0itmBE0MZuDQk7bYRxJzG
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDkuMjAgdW0gMDU6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSnVzdCBwYXNzIGl0IGFyb3VuZCBtb3ZlLCBh
bmQgcmVtb3ZlIHVudXNlZCBwaWVjZXMKPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxh
aXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jIHwgMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3R0bS5jCj4gaW5kZXggMDg1ZjU4ZTgzM2Q4Li45ZmY4YzgxZDc3ODQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IEBAIC0xNTEsNyArMTUxLDcgQEAg
c3RhdGljIGludCByYWRlb25fdmVyaWZ5X2FjY2VzcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLCBzdHJ1Y3QgZmlsZSAqZmlscCkKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCByYWRlb25f
bW92ZV9ibGl0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gLQkJCWJvb2wgZXZpY3Qs
IGJvb2wgbm9fd2FpdF9ncHUsCj4gKwkJCWJvb2wgZXZpY3QsCj4gICAJCQlzdHJ1Y3QgdHRtX3Jl
c291cmNlICpuZXdfbWVtLAo+ICAgCQkJc3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSkKPiAg
IHsKPiBAQCAtMjA2LDExICsyMDYsMTAgQEAgc3RhdGljIGludCByYWRlb25fbW92ZV9ibGl0KHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgcmFk
ZW9uX21vdmVfdnJhbV9yYW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAtCQkJCWJv
b2wgZXZpY3QsIGJvb2wgaW50ZXJydXB0aWJsZSwKPiAtCQkJCWJvb2wgbm9fd2FpdF9ncHUsCj4g
KwkJCQlib29sIGV2aWN0LAo+ICsJCQkJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgsCj4g
ICAJCQkJc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKPiAgIHsKPiAtCXN0cnVjdCB0dG1f
b3BlcmF0aW9uX2N0eCBjdHggPSB7IGludGVycnVwdGlibGUsIG5vX3dhaXRfZ3B1IH07Cj4gICAJ
c3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9ICZiby0+bWVtOwo+ICAgCXN0cnVjdCB0dG1f
cmVzb3VyY2UgdG1wX21lbTsKPiAgIAlzdHJ1Y3QgdHRtX3BsYWNlIHBsYWNlbWVudHM7Cj4gQEAg
LTIyNyw3ICsyMjYsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9tb3ZlX3ZyYW1fcmFtKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJcGxhY2VtZW50cy5scGZuID0gMDsKPiAgIAlwbGFj
ZW1lbnRzLm1lbV90eXBlID0gVFRNX1BMX1RUOwo+ICAgCXBsYWNlbWVudHMuZmxhZ3MgPSBUVE1f
UExfTUFTS19DQUNISU5HOwo+IC0JciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQs
ICZ0bXBfbWVtLCAmY3R4KTsKPiArCXIgPSB0dG1fYm9fbWVtX3NwYWNlKGJvLCAmcGxhY2VtZW50
LCAmdG1wX21lbSwgY3R4KTsKPiAgIAlpZiAodW5saWtlbHkocikpIHsKPiAgIAkJcmV0dXJuIHI7
Cj4gICAJfQo+IEBAIC0yMzcsNyArMjM2LDcgQEAgc3RhdGljIGludCByYWRlb25fbW92ZV92cmFt
X3JhbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQlnb3RvIG91dF9jbGVhbnVw
Owo+ICAgCX0KPiAgIAo+IC0JciA9IHR0bV90dF9wb3B1bGF0ZShiby0+YmRldiwgYm8tPnR0bSwg
JmN0eCk7Cj4gKwlyID0gdHRtX3R0X3BvcHVsYXRlKGJvLT5iZGV2LCBiby0+dHRtLCBjdHgpOwo+
ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQlnb3RvIG91dF9jbGVhbnVwOwo+ICAgCX0KPiBA
QCAtMjQ2LDIyICsyNDUsMjEgQEAgc3RhdGljIGludCByYWRlb25fbW92ZV92cmFtX3JhbShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCWlmICh1bmxpa2VseShyKSkgewo+ICAgCQln
b3RvIG91dF9jbGVhbnVwOwo+ICAgCX0KPiAtCXIgPSByYWRlb25fbW92ZV9ibGl0KGJvLCB0cnVl
LCBub193YWl0X2dwdSwgJnRtcF9tZW0sIG9sZF9tZW0pOwo+ICsJciA9IHJhZGVvbl9tb3ZlX2Js
aXQoYm8sIHRydWUsICZ0bXBfbWVtLCBvbGRfbWVtKTsKPiAgIAlpZiAodW5saWtlbHkocikpIHsK
PiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAl9Cj4gLQlyID0gdHRtX2JvX21vdmVfdHRtKGJv
LCAmY3R4LCBuZXdfbWVtKTsKPiArCXIgPSB0dG1fYm9fbW92ZV90dG0oYm8sIGN0eCwgbmV3X21l
bSk7Cj4gICBvdXRfY2xlYW51cDoKPiAgIAl0dG1fcmVzb3VyY2VfZnJlZShibywgJnRtcF9tZW0p
Owo+ICAgCXJldHVybiByOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IHJhZGVvbl9tb3ZlX3Jh
bV92cmFtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gLQkJCQlib29sIGV2aWN0LCBi
b29sIGludGVycnVwdGlibGUsCj4gLQkJCQlib29sIG5vX3dhaXRfZ3B1LAo+ICsJCQkJYm9vbCBl
dmljdCwKPiArCQkJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICAgCQkJCXN0cnVj
dCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4gICB7Cj4gLQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggY3R4ID0geyBpbnRlcnJ1cHRpYmxlLCBub193YWl0X2dwdSB9Owo+ICAgCXN0cnVjdCB0dG1f
cmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKPiAgIAlzdHJ1Y3QgdHRtX3Jlc291cmNlIHRt
cF9tZW07Cj4gICAJc3RydWN0IHR0bV9wbGFjZW1lbnQgcGxhY2VtZW50Owo+IEBAIC0yNzgsMTUg
KzI3NiwxNSBAQCBzdGF0aWMgaW50IHJhZGVvbl9tb3ZlX3JhbV92cmFtKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gICAJcGxhY2VtZW50cy5scGZuID0gMDsKPiAgIAlwbGFjZW1lbnRz
Lm1lbV90eXBlID0gVFRNX1BMX1RUOwo+ICAgCXBsYWNlbWVudHMuZmxhZ3MgPSBUVE1fUExfTUFT
S19DQUNISU5HOwo+IC0JciA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZwbGFjZW1lbnQsICZ0bXBf
bWVtLCAmY3R4KTsKPiArCXIgPSB0dG1fYm9fbWVtX3NwYWNlKGJvLCAmcGxhY2VtZW50LCAmdG1w
X21lbSwgY3R4KTsKPiAgIAlpZiAodW5saWtlbHkocikpIHsKPiAgIAkJcmV0dXJuIHI7Cj4gICAJ
fQo+IC0JciA9IHR0bV9ib19tb3ZlX3R0bShibywgJmN0eCwgJnRtcF9tZW0pOwo+ICsJciA9IHR0
bV9ib19tb3ZlX3R0bShibywgY3R4LCAmdG1wX21lbSk7Cj4gICAJaWYgKHVubGlrZWx5KHIpKSB7
Cj4gICAJCWdvdG8gb3V0X2NsZWFudXA7Cj4gICAJfQo+IC0JciA9IHJhZGVvbl9tb3ZlX2JsaXQo
Ym8sIHRydWUsIG5vX3dhaXRfZ3B1LCBuZXdfbWVtLCBvbGRfbWVtKTsKPiArCXIgPSByYWRlb25f
bW92ZV9ibGl0KGJvLCB0cnVlLCBuZXdfbWVtLCBvbGRfbWVtKTsKPiAgIAlpZiAodW5saWtlbHko
cikpIHsKPiAgIAkJZ290byBvdXRfY2xlYW51cDsKPiAgIAl9Cj4gQEAgLTMzNCwxNCArMzMyLDEy
IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywgYm9vbCBldmljdCwKPiAgIAo+ICAgCWlmIChvbGRfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExf
VlJBTSAmJgo+ICAgCSAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7Cj4g
LQkJciA9IHJhZGVvbl9tb3ZlX3ZyYW1fcmFtKGJvLCBldmljdCwgY3R4LT5pbnRlcnJ1cHRpYmxl
LAo+IC0JCQkJCWN0eC0+bm9fd2FpdF9ncHUsIG5ld19tZW0pOwo+ICsJCXIgPSByYWRlb25fbW92
ZV92cmFtX3JhbShibywgZXZpY3QsIGN0eCwgbmV3X21lbSk7Cj4gICAJfSBlbHNlIGlmIChvbGRf
bWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmCj4gICAJCSAgIG5ld19tZW0tPm1lbV90
eXBlID09IFRUTV9QTF9WUkFNKSB7Cj4gLQkJciA9IHJhZGVvbl9tb3ZlX3JhbV92cmFtKGJvLCBl
dmljdCwgY3R4LT5pbnRlcnJ1cHRpYmxlLAo+IC0JCQkJCSAgICBjdHgtPm5vX3dhaXRfZ3B1LCBu
ZXdfbWVtKTsKPiArCQlyID0gcmFkZW9uX21vdmVfcmFtX3ZyYW0oYm8sIGV2aWN0LCBjdHgsIG5l
d19tZW0pOwo+ICAgCX0gZWxzZSB7Cj4gLQkJciA9IHJhZGVvbl9tb3ZlX2JsaXQoYm8sIGV2aWN0
LCBjdHgtPm5vX3dhaXRfZ3B1LAo+ICsJCXIgPSByYWRlb25fbW92ZV9ibGl0KGJvLCBldmljdCwK
PiAgIAkJCQkgICAgIG5ld19tZW0sIG9sZF9tZW0pOwo+ICAgCX0KPiAgIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
