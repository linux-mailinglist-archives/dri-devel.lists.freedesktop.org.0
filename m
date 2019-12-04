Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED271129E6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF86E0F9;
	Wed,  4 Dec 2019 11:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9B36E0F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC+DkWJM5DsGI788QqKWzaOAX61tmJ4nD5AJeMBtv+GAkeT7blryCbAJPCifPHXFlzjuGNr3pgT6JZXaK7WLCMNfHxtKLTvRtg1GndY0KStUk9nx5ErbAoIUi5Y59Y9g2kfH1kaWslcwZ8jc3S5VSHfCRSpF+OuVSx4CBdT7cPtCMjcLftGiWaEmDAITIlVsX2oycMGILo+msU69Na6NGRWzlj5u4V+0LeVmECSWwSJfMZuAcGiin5KNhMg46eW/1xiWJAq5igGvUQ1+59RrNswXl/640HFrjNrW7W2rUzIl86ZGE8htTAZv2+ECMe6YZJunwqzWi/VqCsdypp27bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI+SQr1I75+EWSiNTlzsSzWJtxQAWHytHBZP8wHRE0s=;
 b=joFcb0O4lfA8bFfbzXWTLRvrdKnCKIHt6k4VDtbp46ZWBT1dT6tEsMBw+4dOYoSxDJTVndv48TJxlstc73fSrmGLGbDIaAYeQSJTvnBkHNG0JA6Qj5xzbmN7IM7uql0stikzlYkQvQ9DZpsK7O6MUfszgn1taOkk3Zk/zTgNEOGyVkKbT0Un7mhGVWeNJrk1gYUJwXVq6I+aVCs4JOKYIxa9a4lw4PRnFeV3OWiH7qOmDzAmY+aF9pe7vmFr9AvxkawQ23p8112kbFNo2mikjK1tn3pVsf2D4UocuRLPAYSwXkmXQafZb/DHQcIiOZsASIUdhbMaJOQo8Y/E7IqaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1579.namprd12.prod.outlook.com (10.172.38.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Wed, 4 Dec 2019 11:13:40 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:13:40 +0000
Subject: Re: [PATCH 7/8] drm/ttm: Introduce a huge page aligning TTM range
 manager.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-8-thomas_os@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <39b9d651-6afd-1926-7302-aa2a8d4ca626@amd.com>
Date: Wed, 4 Dec 2019 12:13:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191203132239.5910-8-thomas_os@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::33) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84404af2-d807-41cf-5873-08d778ab0426
X-MS-TrafficTypeDiagnostic: DM5PR12MB1579:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1579E9B571AF56A1E347B592835D0@DM5PR12MB1579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0241D5F98C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(199004)(189003)(229853002)(7416002)(31686004)(316002)(6512007)(36756003)(305945005)(2906002)(31696002)(6486002)(2870700001)(52116002)(6436002)(6666004)(76176011)(7736002)(14444005)(58126008)(23676004)(6116002)(478600001)(6506007)(25786009)(99286004)(14454004)(66574012)(186003)(50466002)(81156014)(81166006)(2616005)(11346002)(8936002)(65956001)(8676002)(5660300002)(4326008)(66556008)(66476007)(6246003)(66946007)(86362001)(54906003)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnsMKwcNeHemgmc4Nx8VwPcKn+K5hmqmr4TDv44Kz04B3uSh3DAnQs9JR8vtrIrEKkTV6BzjkCo9SMfJaNcI+BjgPHJ3x8IdxfmlA9EKib8zkfQGXhjHjfSRuq4AacwCVxGAtsC1ee5d9l05xw9KQW+ezxzxQ66KHgQXS7TVb6g4/5eDYl/IDrOXm5TeWwv+HPpMMPJcjOlivKzeIvd8G572e97eAflGx60F9vpzkMFFVCihLd0Bt7WS8gHhFoM5e/e4pk6KF5A3UC3kl9V4rQBRrVbFVN+PWd2+Fk5cniYy4XxsVR1HAmLSwFs0ZVHsEacjx+LhDon1AfcWBREk0rsh/lQOH6WuGMsdn1wjcJ3UjxgG1RJP+omBFyl0ojwKc8Fd5kduQGRCSafh/2l8GKWK7DwZUvXUd8QOhLROWtcxRSPwSWNTYwAuceg51bkpk3ShaKFiWYx80KpNwAGR9psToIE8+mBoGnOO0BhkerJAexmVSjGr9IniNLQlSTZZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84404af2-d807-41cf-5873-08d778ab0426
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:13:40.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrlEtBROiD/bihZ56UqXLpozZjX5E8vJ1tFHNvRP3LQiK8bHUUF0xak8/GSqvKfp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI+SQr1I75+EWSiNTlzsSzWJtxQAWHytHBZP8wHRE0s=;
 b=OC/ZhxT8kw8kKxoQ1+a6Z/LPrlhki7qmznsi8TAHuq0GZmop5BQzxcQIAJ+e1hH++j4XWCwqFH+WDk15SzYh7Tp1plKbqMH89hwBglY7SAIqmW8M8855ubKg9a3bRUwrG8wBwyAZ7n4xLImqT7kDA4B7XrR4XJQamKttKVqeuwM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDMuMTIuMTkgdW0gMTQ6MjIgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4KPiBVc2lu
ZyBodWdlIHBhZ2UtdGFibGUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhlIHN0YXJ0IG9mIGEgYnVm
ZmVyIG9iamVjdAo+IGlzIGh1Z2UgcGFnZSBzaXplIGFsaWduZWQuIFNvIGludHJvZHVjZSBhIHR0
bV9ib19tYW5fZ2V0X25vZGVfaHVnZSgpCj4gZnVuY3Rpb24gdGhhdCBhdHRlbXB0cyB0byBhY2Nv
bXBsaXNoIHRoaXMgZm9yIGFsbG9jYXRpb25zIHRoYXQgYXJlIGxhcmdlcgo+IHRoYW4gdGhlIGh1
Z2UgcGFnZSBzaXplLCBhbmQgcHJvdmlkZSBhIG5ldyByYW5nZS1tYW5hZ2VyIGluc3RhbmNlIHRo
YXQKPiB1c2VzIHRoYXQgZnVuY3Rpb24uCgpJIHN0aWxsIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBp
cyBhIGdvb2QgaWRlYS4KClRoZSBkcml2ZXIvdXNlcnNwYWNlIHNob3VsZCBqdXN0IHVzZSBhIHBy
b3BlciBhbGlnbm1lbnQgaWYgaXQgd2FudHMgdG8gCnVzZSBodWdlIHBhZ2VzLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBDYzogIk1hdHRoZXcg
V2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBDYzogIktpcmlsbCBBLiBT
aHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJhbHBoIENh
bXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpn
bGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdl
ci5jIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19kcml2ZXIuaCAgICAgIHwgIDEgKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCj4gaW5kZXggMThk
M2RlYmNjOTQ5Li4yNmFhMWEyYWU3ZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fbWFuYWdlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFu
YWdlci5jCj4gQEAgLTg5LDYgKzg5LDg5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX21hbl9nZXRfbm9k
ZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAlyZXR1cm4gMDsKPiAgIH0K
PiAgIAo+ICsjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gK3N0YXRpYyBpbnQg
dHRtX2JvX2luc2VydF9hbGlnbmVkKHN0cnVjdCBkcm1fbW0gKm1tLCBzdHJ1Y3QgZHJtX21tX25v
ZGUgKm5vZGUsCj4gKwkJCQkgdW5zaWduZWQgbG9uZyBhbGlnbl9wYWdlcywKPiArCQkJCSBjb25z
dCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKPiArCQkJCSBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1l
bSwKPiArCQkJCSB1bnNpZ25lZCBsb25nIGxwZm4sCj4gKwkJCQkgZW51bSBkcm1fbW1faW5zZXJ0
X21vZGUgbW9kZSkKPiArewo+ICsJaWYgKGFsaWduX3BhZ2VzID49IG1lbS0+cGFnZV9hbGlnbm1l
bnQgJiYKPiArCSAgICAoIW1lbS0+cGFnZV9hbGlnbm1lbnQgfHwgYWxpZ25fcGFnZXMgJSBtZW0t
PnBhZ2VfYWxpZ25tZW50ID09IDApKSB7Cj4gKwkJcmV0dXJuIGRybV9tbV9pbnNlcnRfbm9kZV9p
bl9yYW5nZShtbSwgbm9kZSwKPiArCQkJCQkJICAgbWVtLT5udW1fcGFnZXMsCj4gKwkJCQkJCSAg
IGFsaWduX3BhZ2VzLCAwLAo+ICsJCQkJCQkgICBwbGFjZS0+ZnBmbiwgbHBmbiwgbW9kZSk7Cj4g
Kwl9Cj4gKwo+ICsJcmV0dXJuIC1FTk9TUEM7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgdHRtX2Jv
X21hbl9nZXRfbm9kZV9odWdlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICsJ
CQkJICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gKwkJCQkgICAgY29uc3Qgc3Ry
dWN0IHR0bV9wbGFjZSAqcGxhY2UsCj4gKwkJCQkgICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0p
Cj4gK3sKPiArCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1hbiA9IChzdHJ1Y3QgdHRtX3Jh
bmdlX21hbmFnZXIgKikgbWFuLT5wcml2Owo+ICsJc3RydWN0IGRybV9tbSAqbW0gPSAmcm1hbi0+
bW07Cj4gKwlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGU7Cj4gKwl1bnNpZ25lZCBsb25nIGFsaWdu
X3BhZ2VzOwo+ICsJdW5zaWduZWQgbG9uZyBscGZuOwo+ICsJZW51bSBkcm1fbW1faW5zZXJ0X21v
ZGUgbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVTVDsKPiArCWludCByZXQ7Cj4gKwo+ICsJbm9kZSA9
IGt6YWxsb2Moc2l6ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIW5vZGUpCj4gKwkJ
cmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJbHBmbiA9IHBsYWNlLT5scGZuOwo+ICsJaWYgKCFscGZu
KQo+ICsJCWxwZm4gPSBtYW4tPnNpemU7Cj4gKwo+ICsJbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVT
VDsKPiArCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19UT1BET1dOKQo+ICsJCW1vZGUg
PSBEUk1fTU1fSU5TRVJUX0hJR0g7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZybWFuLT5sb2NrKTsKPiAr
CWlmIChJU19FTkFCTEVEKENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVE
KSkgewo+ICsJCWFsaWduX3BhZ2VzID0gKEhQQUdFX1BVRF9TSVpFID4+IFBBR0VfU0hJRlQpOwo+
ICsJCWlmIChtZW0tPm51bV9wYWdlcyA+PSBhbGlnbl9wYWdlcykgewo+ICsJCQlyZXQgPSB0dG1f
Ym9faW5zZXJ0X2FsaWduZWQobW0sIG5vZGUsIGFsaWduX3BhZ2VzLAo+ICsJCQkJCQkgICAgcGxh
Y2UsIG1lbSwgbHBmbiwgbW9kZSk7Cj4gKwkJCWlmICghcmV0KQo+ICsJCQkJZ290byBmb3VuZF91
bmxvY2s7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWFsaWduX3BhZ2VzID0gKEhQQUdFX1BNRF9TSVpF
ID4+IFBBR0VfU0hJRlQpOwo+ICsJaWYgKG1lbS0+bnVtX3BhZ2VzID49IGFsaWduX3BhZ2VzKSB7
Cj4gKwkJcmV0ID0gdHRtX2JvX2luc2VydF9hbGlnbmVkKG1tLCBub2RlLCBhbGlnbl9wYWdlcywg
cGxhY2UsIG1lbSwKPiArCQkJCQkgICAgbHBmbiwgbW9kZSk7Cj4gKwkJaWYgKCFyZXQpCj4gKwkJ
CWdvdG8gZm91bmRfdW5sb2NrOwo+ICsJfQo+ICsKPiArCXJldCA9IGRybV9tbV9pbnNlcnRfbm9k
ZV9pbl9yYW5nZShtbSwgbm9kZSwgbWVtLT5udW1fcGFnZXMsCj4gKwkJCQkJICBtZW0tPnBhZ2Vf
YWxpZ25tZW50LCAwLAo+ICsJCQkJCSAgcGxhY2UtPmZwZm4sIGxwZm4sIG1vZGUpOwo+ICtmb3Vu
ZF91bmxvY2s6Cj4gKwlzcGluX3VubG9jaygmcm1hbi0+bG9jayk7Cj4gKwo+ICsJaWYgKHVubGlr
ZWx5KHJldCkpIHsKPiArCQlrZnJlZShub2RlKTsKPiArCX0gZWxzZSB7Cj4gKwkJbWVtLT5tbV9u
b2RlID0gbm9kZTsKPiArCQltZW0tPnN0YXJ0ID0gbm9kZS0+c3RhcnQ7Cj4gKwl9Cj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiArI2Vsc2UKPiArI2RlZmluZSB0dG1fYm9fbWFuX2dldF9ub2RlX2h1
Z2UgdHRtX2JvX21hbl9nZXRfbm9kZQo+ICsjZW5kaWYKPiArCj4gKwo+ICAgc3RhdGljIHZvaWQg
dHRtX2JvX21hbl9wdXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAg
IAkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiAgIHsKPiBAQCAtMTU0LDMgKzIzNywxMiBA
QCBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyB0dG1fYm9fbWFuYWdlcl9m
dW5jID0gewo+ICAgCS5kZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcKPiAgIH07Cj4gICBFWFBPUlRf
U1lNQk9MKHR0bV9ib19tYW5hZ2VyX2Z1bmMpOwo+ICsKPiArY29uc3Qgc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyX2Z1bmMgdHRtX2JvX21hbmFnZXJfaHVnZV9mdW5jID0gewo+ICsJLmluaXQg
PSB0dG1fYm9fbWFuX2luaXQsCj4gKwkudGFrZWRvd24gPSB0dG1fYm9fbWFuX3Rha2Vkb3duLAo+
ICsJLmdldF9ub2RlID0gdHRtX2JvX21hbl9nZXRfbm9kZV9odWdlLAo+ICsJLnB1dF9ub2RlID0g
dHRtX2JvX21hbl9wdXRfbm9kZSwKPiArCS5kZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcKPiArfTsK
PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fbWFuYWdlcl9odWdlX2Z1bmMpOwo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaAo+IGluZGV4IGNhYzdhOGEwODI1YS4uODY4YmQwZDRiZTZhIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTg4OCw1ICs4ODgsNiBAQCBpbnQgdHRtX2JvX3BpcGVs
aW5lX2d1dHRpbmcoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4gICBwZ3Byb3RfdCB0
dG1faW9fcHJvdCh1aW50MzJfdCBjYWNoaW5nX2ZsYWdzLCBwZ3Byb3RfdCB0bXApOwo+ICAgCj4g
ICBleHRlcm4gY29uc3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1bmMgdHRtX2JvX21h
bmFnZXJfZnVuYzsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9m
dW5jIHR0bV9ib19tYW5hZ2VyX2h1Z2VfZnVuYzsKPiAgIAo+ICAgI2VuZGlmCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
