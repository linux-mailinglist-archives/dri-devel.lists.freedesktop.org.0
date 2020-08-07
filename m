Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F7F23E9F8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C884E6E992;
	Fri,  7 Aug 2020 09:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097776E990
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9LfQP7rz/aBSAf1UNvRwgdpR8+SOnxDNDzygouwe3h2AOEGzI5ab54gD2FFRB7IqjSFlG7nBOyEMzVYMiDp5UQjp5AVC1VOLBdrfS5GhVadtE1Gl8cvwO9sPGAslVg2IFmGNj1wOY/H1/NX+bP/AW6bBjtvj6ttPG6YIF8pMw7d631lf1ZouJkHp2+EeLTb4Xq45rImvkdy5k4cRCU5TKKdA2mHXL0BRyenoQ2vQ6kZVvAx0/f6Mul1B0uoYZZcmCa8Rjmzr3RkQDUJJUXCFdgUAxQvIu5h4dWZp4l63vnvhm+cgL3lZb+BbmdKLmp3Vl3pscc/+s1ue1Vzp41ZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFJ5GOO24vakOiWcwhX7/pzU3M3x2jcST7wxc5vVm7s=;
 b=jnBVDn5edPARE/egQpMx4Lh/VEO4GIOxSce7H6EuVbMW8LPL/9OtFDQIjQI00oK3bBvWjOXmruqEY2+g55ll1QmE3q5+GEGlBykO8eG7EaYuFvTxKUAhgXysoymS/lw2loPlHtCUnUauDf3qxZzigjY674vKtY2RveR+rvP5kDquYdVkEZrcp1OlWPrm5/rCEXkTHr9/+YhYaDTM9L4p+O9M/PHiuDvpk0dWwS70eikYmnA1UpwclqbdZhOOcbuO6aLfyclnT5cF71jBOk25LTRxUBayfr6LeZkDephsiXrDWe/w5fySwwY2SCqkWrjxu9qT1tmbrU97uJRB5IjJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFJ5GOO24vakOiWcwhX7/pzU3M3x2jcST7wxc5vVm7s=;
 b=nDMA97ioklamm/v0dlv0BpGuRiDyJdcgrvgNMHQWUkZ9SrjbMcHvye+5yBOL5wxx5zau5LkmPlbnC3RDDwGwvQ8V2m97Y+WeY96GhuGJPq8EjYpdcr71Aq3uA9PHmkdnzFpIQmukUkOkTY9zoxHYfO1w14dhNcVPfBmr3vDLaUM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 7 Aug
 2020 09:18:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 09:18:27 +0000
Subject: Re: [PATCH 2/4] drm/amdgpu/ttm: drop the adev link from vram mgr
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200806233459.4057784-1-airlied@gmail.com>
 <20200806233459.4057784-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c003b3a8-3d32-1309-b5c4-2515670edfdd@amd.com>
Date: Fri, 7 Aug 2020 11:18:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200806233459.4057784-3-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0080.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0080.eurprd06.prod.outlook.com (2603:10a6:208:fa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Fri, 7 Aug 2020 09:18:27 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b65c42d7-1240-4e7f-1d6e-08d83ab2d808
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4221C1E1478B913C958AAA2083490@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwQcUJx0/XtQ4n99eGt1D2tOYqgfX8r82HNgdCvdDUGKMvBHGEru/ppn0jCvSwEZ7teYvxN3i98eF19SitPIdVImHNB33dRHdghLRql38pkVrxN5ARIYmZcuo0JAzzmakBZapP3HbKWiX+1Iu/jEFdM3ZXgX03gJC34n3cho4div57iOBhTmfG2fQADAUMJ6c2pfWmvntvtwf1YjNzOeDA8ot0Hwky5+ms9GH4HQdqp+o9PXZ+hdqdyXuVdJemLRuNYv9R+qOvjXzHV4HXiEHG/sam06U5A9yGZA5Un5eHxcn99lo3XI3ZSzEjPd4iUlHG+4dRCplFT8TvUXARnitHi0vWowysypCwv56Ii8j2o0TdB6E/7cEiOCMr+3+z15
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(36756003)(66556008)(6666004)(478600001)(66476007)(4326008)(31686004)(5660300002)(52116002)(6486002)(31696002)(316002)(66946007)(8936002)(186003)(16526019)(66574015)(86362001)(83380400001)(2906002)(8676002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GzlAO03OL3NZn0Bk2bHgOtrc/HGKcSoSUvkNnCetfV+/Dni1F/LgUhlKjc5uV1dm7AEGOUnOF1dXLF24llbbRmGi+vZqLZoYHvxG2tm6fnB/z/PyO3/4b1y5CISrSyRE/EsSyh29Y41R4oK1Ve/Dq/kb0cAJimDuz1czkerim7XMU2tWWSh+hyMa9uJ0Jy7/KEJGDfN4dzgj/9AYXLObxgYPNEl4vpdaf/pz0krKVYcE/maIl5CSQcQIhxYOQf+3UhdP5mIMlGyVcvMqgHp6HCXlIgc2xu6/B0IF3hvn9MVw4tE3d7rPFdou2wknbMXMYXv+FiX2HF2rZ9lm7nddxcZpTTO6rvkNo3ZXSzkvLsbH1rPvpz8KnTBp8+B7OjZndAE4bcWxzSF5rRp95Sb2uBi6sHX88IEMw1L9hWoZ92LqmC2pWOxLFNL/K+tqQk/YoM2aPo2oqb/AFnZ19UkkToxIMHiovqGFMWbYgZ5qiYMUFO7okDhv592Rjy4+m5gAwpxVTECnvfQHRz/k71J8uHFRk8WhsvQm5B6fYWAjOWpEdG0fXcLY3tuMLsLqICcEUQuqSxaNA0AHqXrzHmvFLk66nnRB5TWUuuXq8KJIemdxubV9TfWmSd1Xbyws2DbfwBk2Tho8m+eSLKU7B24wAMJb5afEhl9egYTTOL6F2gCIVWMj8VupxgtaijOSbiE3XyjnO2lj//3NsboLihi83w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65c42d7-1240-4e7f-1d6e-08d83ab2d808
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:18:27.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vR2zgQgQ3in1GtgXq2B/MPgW6dngSpE4txen/J0wQ8eNgvjixPqXFxN1dzn1SAHR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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

QW0gMDcuMDguMjAgdW0gMDE6MzQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhhdCBu
b3cgc2luY2UgaXQncyBlbWJlZGRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxh
aXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uaCAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZyYW1fbWdyLmMgfCAxMSArKysrKysrLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5oCj4gaW5kZXggMTY4Mjk0YmUyNzZkLi40YTZkOTJmMjdiNmUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oCj4gQEAgLTQ3LDcgKzQ3LDYg
QEAgc3RydWN0IGFtZGdwdV92cmFtX21nciB7Cj4gICAJc3BpbmxvY2tfdCBsb2NrOwo+ICAgCWF0
b21pYzY0X3QgdXNhZ2U7Cj4gICAJYXRvbWljNjRfdCB2aXNfdXNhZ2U7Cj4gLQlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldjsKPiAgIH07Cj4gICAKPiAgIHN0cnVjdCBhbWRncHVfZ3R0X21nciB7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21n
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBpbmRl
eCBhNDFhOGFiYzk5MjcuLjc4ODJlZmQyNzVkMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gQEAgLTMzLDYgKzMzLDExIEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGFtZGdwdV92cmFtX21nciAqdG9fdnJhbV9tZ3Ioc3RydWN0IHR0bV9yZXNv
dXJjZV9tYW5hZ2VyICptCj4gICAJcmV0dXJuIGNvbnRhaW5lcl9vZihtYW4sIHN0cnVjdCBhbWRn
cHVfdnJhbV9tZ3IsIG1hbmFnZXIpOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0
IGFtZGdwdV9kZXZpY2UgKnRvX2FtZGdwdV9kZXZpY2Uoc3RydWN0IGFtZGdwdV92cmFtX21nciAq
bWdyKQo+ICt7Cj4gKwlyZXR1cm4gY29udGFpbmVyX29mKG1nciwgc3RydWN0IGFtZGdwdV9kZXZp
Y2UsIG1tYW4udnJhbV9tZ3IpOwo+ICt9Cj4gKwo+ICAgLyoqCj4gICAgKiBET0M6IG1lbV9pbmZv
X3ZyYW1fdG90YWwKPiAgICAqCj4gQEAgLTE4Miw4ICsxODcsNiBAQCBpbnQgYW1kZ3B1X3ZyYW1f
bWdyX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJZHJtX21tX2luaXQoJm1n
ci0+bW0sIDAsIG1hbi0+c2l6ZSk7Cj4gICAJc3Bpbl9sb2NrX2luaXQoJm1nci0+bG9jayk7Cj4g
ICAKPiAtCW1nci0+YWRldiA9IGFkZXY7Cj4gLQo+ICAgCS8qIEFkZCB0aGUgdHdvIFZSQU0tcmVs
YXRlZCBzeXNmcyBmaWxlcyAqLwo+ICAgCXJldCA9IHN5c2ZzX2NyZWF0ZV9maWxlcygmYWRldi0+
ZGV2LT5rb2JqLCBhbWRncHVfdnJhbV9tZ3JfYXR0cmlidXRlcyk7Cj4gICAJaWYgKHJldCkKPiBA
QCAtMzExLDcgKzMxNCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3Qg
dHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiAgIAkJCSAgICAgICBzdHJ1Y3QgdHRtX3Jlc291
cmNlICptZW0pCj4gICB7Cj4gICAJc3RydWN0IGFtZGdwdV92cmFtX21nciAqbWdyID0gdG9fdnJh
bV9tZ3IobWFuKTsKPiAtCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gbWdyLT5hZGV2Owo+
ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKG1ncik7Cj4g
ICAJc3RydWN0IGRybV9tbSAqbW0gPSAmbWdyLT5tbTsKPiAgIAlzdHJ1Y3QgZHJtX21tX25vZGUg
Km5vZGVzOwo+ICAgCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7Cj4gQEAgLTQyOSw3ICs0
MzIsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdnJhbV9tZ3JfZGVsKHN0cnVjdCB0dG1fcmVzb3Vy
Y2VfbWFuYWdlciAqbWFuLAo+ICAgCQkJCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPiAgIHsK
PiAgIAlzdHJ1Y3QgYW1kZ3B1X3ZyYW1fbWdyICptZ3IgPSB0b192cmFtX21ncihtYW4pOwo+IC0J
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBtZ3ItPmFkZXY7Cj4gKwlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UobWdyKTsKPiAgIAlzdHJ1Y3QgZHJtX21t
X25vZGUgKm5vZGVzID0gbWVtLT5tbV9ub2RlOwo+ICAgCXVpbnQ2NF90IHVzYWdlID0gMCwgdmlz
X3VzYWdlID0gMDsKPiAgIAl1bnNpZ25lZCBwYWdlcyA9IG1lbS0+bnVtX3BhZ2VzOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
