Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716A2346F7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAAA6EAB6;
	Fri, 31 Jul 2020 13:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8D46EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:33:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWaGFN2zxCRSa5/6rMtJbL4AtiN0re3dvAQo/EbreyTKeDgYbxL5jxn6quXtK9hqc2FaXlHlUNcJA2xerkO9JUweWWh8mswOG/xAQgWiU23C7OnlZOADP5umYn+/3DQQVMpvbDDWP/cPS7yDuBLdyAXcZR+icIXVxTPqq7/qLlBxIesanJ2xk5RR2P/eLCiC/lVKgbf7nkzv8aIrUoNVJBYvaYDKBQNsHDGgnQVoLTY6HIV2lqBsr9S1L+6qWGzGl8oFF589AhC1Xbvz7PQe7bn2TtTiXKdVJz7EBX56BthonNyHpilFrapCCcX3XEFLIGwpF1Wo06kCEZCHeR42fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ejadcYR674mFT0mAiHaM5pLs6nM7q1yFWHA1QxZVbA=;
 b=NMkDhKYElyv5DEl+pAtHSqrrz4SJP3f665EP5F3DbY2SyhIeCrzjB9R634PqA3KdrMlfaSqONDNAcgHqy9CJIY9/Ak0TYHW4B1COLWj9euIiCAOCJH2cbOhdee4H5CbkZVsImGalFXZ0lwD3VuER86XQ7ybrbVEYQ8nDBT7nVfBcpeSDYzdiEO8vaKZ4lIrwdU5Shfn6C0yVqAqdRGUjao6FzcDdgaZKrQ0BudJ/pB7c3xNpbqVwZ4KCELYRxvElaqwBvnIRoKl2mvtis3yM3cVDkbVzGtzxGd4RIHGxbjHUv97e15ezhIdivRXw7Y2/RwjfoJHKg+E2arCQu7F6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ejadcYR674mFT0mAiHaM5pLs6nM7q1yFWHA1QxZVbA=;
 b=HUr2mrlc3iLJwQus7e+kDdrQqhaDi5WOfrQXPUbjTrI7FuMBQDgYhdk7h5qPYIqJuEpa1NMxV1m6lD+CoYtbo0VEdkpVSrHcx2eRvwPEDgbGD5tnqRcR3R/BBP5V/qUqhf3+gOZW/B7G6ThMYWgUuPLuFy0i5kt3ATBWO/Iq/ew=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:33:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:33:11 +0000
Subject: Re: [PATCH 40/49] drm/ttm: move range manager to subclassed driver
 allocation
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-41-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a3cbe4a-7c24-2a2c-91af-334050331725@amd.com>
Date: Fri, 31 Jul 2020 15:33:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-41-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0016.eurprd02.prod.outlook.com
 (2603:10a6:200:89::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0016.eurprd02.prod.outlook.com (2603:10a6:200:89::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:33:10 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4d44452-2760-4ea0-e633-08d8355644a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43425C7149C55662A25E0DAA834E0@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0HXGMRe7R3WT/zPRJaxLLfRg8YKP721HpClhebrs6xAv/netp51wHLzDfdRakYEM5ueKukqiGU2+IIGYu3jCRvzV59JyKsprastacb2wa45kHABV0QhwdDnSQFG3Wb+FYpnXjRv3VDao0037yiYHC9pDU6gUoRKyZDbEdsQBstGlWMrg7Al8Ohs8YmCzoCsO5ior5K6UhTmtyCT33XimbS9HK9hfSX9ctmosPCBxfhGlvFAC7iQ1NLg7YTZA5/QAPkZSdbcpdQsb3nhQbZGkXTIvbZRujZ70vku4fnH0rEzOQXUpLFydNbuZHOfh1qGF8ScTf9Pog63FXjnUTsLvSnQJiFF95+INHz4pQcecC/O4p+7Q5jdw/ZWuiZuO2q/b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(66476007)(66556008)(2906002)(66946007)(8936002)(316002)(6666004)(4326008)(6486002)(8676002)(478600001)(5660300002)(52116002)(36756003)(2616005)(186003)(16526019)(31696002)(83380400001)(86362001)(31686004)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8DT+AJVbhJoIEeoHaUe5HQjCgpKwcxN0qdm+JSIy8qPlbUmTtRCIHl2VK1Zk3L7y3xqVumI/rjaDGOV5is8RkVXMbvhQpxWnbQnWJt+IOcpJxv612DqVKOA4GtNPliixUCnChrxT3JAEDJtH/CcyS6UUxfbiHYbOfjfRl3FXzlhxiQo1iuLcsCNFsm3na/cwLN0Jp5EhxqgfG5GfYS3PCWI1cRUVLmq+hx4Kv7MOtAvHS8UHCXfIqLWhygVSYDWmRurDXuRTdyvs3HCkt47znCJZOtewE/YytBq/hsvrFgiBhP/pqm9LxVfeJnaQ0Mf/PhfDUy+c2YPxt69dDPAOjd37Lm4sUdCY76anyBGxZ8GkJPSOyj/g92WHqgJ1iROrRDzGjSoMc3IR61VnVP0fiGcr7HiJja2kcEv5s6G/sGdwzlT1EYdWVbFXVaElb/JUJZHoLFtqU+Kmt9EOfl1j9hcDWsAZUsKmU/5WweOIV8k++h4eadS+PBVOjXW3OwSf4GStV9M6IgfK5cr4oBjxqS9+NnQjG4gCoaeJeAjQ0G18xm0SCFZZCvj0s1Ci5NDynlQCrrPZLYbZWkK4N30MPQ0Hi69GM0jf+VsBVvLo30qYhCedSDNmGiLpS/S1u/12OaL/7SvvdW1zegPZZdn6kMD9qZtPILHelSP6DENjcLUewklQ3Q/UOflJEs+ZMyzhzpDbzlFgfaBRE8WEWz3R2w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d44452-2760-4ea0-e633-08d8355644a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:33:11.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyz4pUHl8Zmis+9niOwjhO9e8i6IWiMNoLgE0D73XjadGQuEHz22vqvnHzlGrBlK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fbWFuYWdlci5jIHwgMzIgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX21hbmFnZXIuYwo+IGluZGV4IDJmNWZhNDRiNjQ3NC4uMjc4MmNjZmY5YjY2
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX21hbmFnZXIuYwo+IEBAIC00NCwxNiArNDQs
MjIgQEAKPiAgICAqLwo+ICAgCj4gICBzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgewo+ICsJc3Ry
dWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyIG1hbmFnZXI7Cj4gICAJc3RydWN0IGRybV9tbSBtbTsK
PiAgIAlzcGlubG9ja190IGxvY2s7Cj4gICB9Owo+ICAgCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0
IHR0bV9yYW5nZV9tYW5hZ2VyICp0b19yYW5nZV9tYW5hZ2VyKHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuKQo+ICt7Cj4gKwlyZXR1cm4gY29udGFpbmVyX29mKG1hbiwgc3RydWN0IHR0
bV9yYW5nZV9tYW5hZ2VyLCBtYW5hZ2VyKTsKPiArfQo+ICsKPiAgIHN0YXRpYyBpbnQgdHRtX2Jv
X21hbl9nZXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAkJCSAg
ICAgICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCQkJICAgICAgIGNvbnN0IHN0
cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+ICAgCQkJICAgICAgIHN0cnVjdCB0dG1fbWVtX3JlZyAq
bWVtKQo+ICAgewo+IC0Jc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gKHN0cnVjdCB0
dG1fcmFuZ2VfbWFuYWdlciAqKSBtYW4tPnByaXY7Cj4gKwlzdHJ1Y3QgdHRtX3JhbmdlX21hbmFn
ZXIgKnJtYW4gPSB0b19yYW5nZV9tYW5hZ2VyKG1hbik7Cj4gICAJc3RydWN0IGRybV9tbSAqbW0g
PSAmcm1hbi0+bW07Cj4gICAJc3RydWN0IGRybV9tbV9ub2RlICpub2RlOwo+ICAgCWVudW0gZHJt
X21tX2luc2VydF9tb2RlIG1vZGU7Cj4gQEAgLTkyLDcgKzk4LDcgQEAgc3RhdGljIGludCB0dG1f
Ym9fbWFuX2dldF9ub2RlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgc3Rh
dGljIHZvaWQgdHRtX2JvX21hbl9wdXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiwKPiAgIAkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiAgIHsKPiAtCXN0cnVjdCB0
dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IChzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFu
LT5wcml2Owo+ICsJc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gdG9fcmFuZ2VfbWFu
YWdlcihtYW4pOwo+ICAgCj4gICAJaWYgKG1lbS0+bW1fbm9kZSkgewo+ICAgCQlzcGluX2xvY2so
JnJtYW4tPmxvY2spOwo+IEBAIC0xMTMsMjUgKzExOSwyNiBAQCBpbnQgdHRtX2JvX21hbl9pbml0
KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgCQkgICAgYm9vbCB1c2VfdHQsCj4gICAJ
CSAgICB1bnNpZ25lZCBsb25nIHBfc2l6ZSkKPiAgIHsKPiAtCXN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCB0eXBlKTsKPiArCXN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+ICAgCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAq
cm1hbjsKPiAgIAo+IC0JbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IGF2YWlsYWJsZV9jYWNoaW5n
Owo+IC0JbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBkZWZhdWx0X2NhY2hpbmc7Cj4gLQltYW4tPnVz
ZV90dCA9IHVzZV90dDsKPiAtCj4gICAJcm1hbiA9IGt6YWxsb2Moc2l6ZW9mKCpybWFuKSwgR0ZQ
X0tFUk5FTCk7Cj4gICAJaWYgKCFybWFuKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+ICsJ
bWFuID0gJnJtYW4tPm1hbmFnZXI7Cj4gKwltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gYXZhaWxh
YmxlX2NhY2hpbmc7Cj4gKwltYW4tPmRlZmF1bHRfY2FjaGluZyA9IGRlZmF1bHRfY2FjaGluZzsK
PiArCW1hbi0+dXNlX3R0ID0gdXNlX3R0Owo+ICsKPiAgIAltYW4tPmZ1bmMgPSAmdHRtX2JvX21h
bmFnZXJfZnVuYzsKPiAgIAo+ICAgCXR0bV9ib19pbml0X21tX2Jhc2UoYmRldiwgbWFuLCBwX3Np
emUpOwo+ICAgCj4gICAJZHJtX21tX2luaXQoJnJtYW4tPm1tLCAwLCBwX3NpemUpOwo+ICAgCXNw
aW5fbG9ja19pbml0KCZybWFuLT5sb2NrKTsKPiAtCW1hbi0+cHJpdiA9IHJtYW47Cj4gICAKPiAr
CXR0bV9zZXRfZHJpdmVyX21hbmFnZXIoYmRldiwgdHlwZSwgJnJtYW4tPm1hbmFnZXIpOwo+ICAg
CXR0bV9ib191c2VfbW0obWFuKTsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBAQCAtMTQxLDcgKzE0
OCw3IEBAIGludCB0dG1fYm9fbWFuX3Rha2Vkb3duKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LAo+ICAgCQkJdW5zaWduZWQgdHlwZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIgKm1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgdHlwZSk7Cj4gLQlzdHJ1Y3QgdHRt
X3JhbmdlX21hbmFnZXIgKnJtYW4gPSAoc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICopIG1hbi0+
cHJpdjsKPiArCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IHRvX3JhbmdlX21hbmFn
ZXIobWFuKTsKPiAgIAlzdHJ1Y3QgZHJtX21tICptbSA9ICZybWFuLT5tbTsKPiAgIAlpbnQgcmV0
Owo+ICAgCj4gQEAgLTE1NSwxMCArMTYyLDExIEBAIGludCB0dG1fYm9fbWFuX3Rha2Vkb3duKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgCWRybV9tbV9jbGVhbihtbSk7Cj4gICAJZHJt
X21tX3Rha2Vkb3duKG1tKTsKPiAgIAlzcGluX3VubG9jaygmcm1hbi0+bG9jayk7Cj4gLQlrZnJl
ZShybWFuKTsKPiAtCW1hbi0+cHJpdiA9IE5VTEw7Cj4gICAKPiAgIAl0dG1fYm9fbWFuX2NsZWFu
dXAobWFuKTsKPiArCXR0bV9zZXRfZHJpdmVyX21hbmFnZXIoYmRldiwgdHlwZSwgTlVMTCk7Cj4g
KwlrZnJlZShybWFuKTsKPiArCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9M
KHR0bV9ib19tYW5fdGFrZWRvd24pOwo+IEBAIC0xNjYsNyArMTc0LDcgQEAgRVhQT1JUX1NZTUJP
TCh0dG1fYm9fbWFuX3Rha2Vkb3duKTsKPiAgIHN0YXRpYyB2b2lkIHR0bV9ib19tYW5fZGVidWco
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICAJCQkgICAgIHN0cnVjdCBkcm1f
cHJpbnRlciAqcHJpbnRlcikKPiAgIHsKPiAtCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1h
biA9IChzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFuLT5wcml2Owo+ICsJc3RydWN0IHR0
bV9yYW5nZV9tYW5hZ2VyICpybWFuID0gdG9fcmFuZ2VfbWFuYWdlcihtYW4pOwo+ICAgCj4gICAJ
c3Bpbl9sb2NrKCZybWFuLT5sb2NrKTsKPiAgIAlkcm1fbW1fcHJpbnQoJnJtYW4tPm1tLCBwcmlu
dGVyKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
