Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155C10AD2B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5541189B46;
	Wed, 27 Nov 2019 10:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2656389B46
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFeRAoz9CmVkT7E1kKUyesq9fFTMODW5+errN6n7wSSMQdw5/8DBF6V5sBsp/kixp86bvOJbjVCftVDWApJPQcjTYVUTFnha0+llcVT9QZnvFgiyhtDQDeWmGwzoWf+EVg70aq+pmsB/ro0qHesw6f0zFN9PakCic/JBG7kq3oEl+VaKwHh66k+Eod6k2dNABTLdB3Kk/hVl8tmVy7RcHaBXtghptMytD/VyAadVg81n4q9iujX8wvRFVHgGh34yC6rU8+wyDxuuo0IsyrslfyjmTJ66ZcVFFmXZzpUeenhqBCApfRRVg0dy1bcJ+/vKAXZJs+uBy5MKREImuSXzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nGH0I1hFT2Gt9NUfDAnLyV5MNlTHpPaHNKR7xWqbJE=;
 b=M86yPYFjb8sYBJm42E6AlOTmBv65ADEOiYnf4S0u3RpPWyAtq6WfE34bJT+5kEXVSr6n2tNQLBoQgHRDy27z2++QceA3owrDhfPYrmODatwl3eh7gefl+8SZOWvE2n7CC+qi4ZhwcEmQIrlcycbXfD2bErJrLZv5CQo5DJKKAxXKZCgVManm/mp69V3nrGXaoQy2eEjaY42rYM85uvRjbKEnqw8As25vCqJGTgbHYh2q9UJqczBU3ovASMvTEhqX6FmLdK2m5uvK3J/gwMIrKc+Tb6mlCBzYcvThXAblsVUYiFsostrmyQW08evGpVWrQXpVOB7yrKUQE7teC5YKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1692.namprd12.prod.outlook.com (10.172.34.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 10:05:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 10:05:45 +0000
Subject: Re: [RFC PATCH 6/7] drm/ttm: Introduce a huge page aligning TTM range
 manager.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
References: <20191127083120.34611-1-thomas_os@shipmail.org>
 <20191127083120.34611-7-thomas_os@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c43b3dc8-7ec2-542b-a767-a725cf9c442b@amd.com>
Date: Wed, 27 Nov 2019 11:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191127083120.34611-7-thomas_os@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0082.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::23) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 622272b5-7a2e-4b18-ed85-08d773215eb1
X-MS-TrafficTypeDiagnostic: DM5PR12MB1692:
X-Microsoft-Antispam-PRVS: <DM5PR12MB16920CEBB6EABE2BF8B2E2B983440@DM5PR12MB1692.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(189003)(199004)(66476007)(66556008)(66946007)(31686004)(2906002)(2870700001)(6666004)(478600001)(6436002)(6486002)(4326008)(6512007)(6246003)(65806001)(47776003)(65956001)(5660300002)(66574012)(6116002)(7736002)(386003)(58126008)(305945005)(229853002)(25786009)(46003)(50466002)(6506007)(2486003)(186003)(8936002)(86362001)(23676004)(14444005)(76176011)(316002)(81156014)(14454004)(31696002)(8676002)(81166006)(2616005)(52116002)(54906003)(7416002)(36756003)(446003)(11346002)(99286004)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1692;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Q/7j9XWC+t/gv/wx1/6Ub/ScbbQgFV3j3ZL7IEKYJIb/mmJ77eqmlYfee3xBlWhQKozyZn3Ncdtoy/yrAEgKaEcOrRnzAUc0Q0nXUOBVc+BhEu9q4DahYExP1LPtU6o8x/Y9cpBPWrMQaMNvzLu0Xt+nkZryTLC332+2uHPsI2JwIzJb1ukpuzTP9hHfnPmtq/YsB5kLHu+hmLvkM+9QUgOwwtWVRbgvJu8omcztqIA093qw7mqdTL8JHljHhc46aO5OvGFERYSYNX10rZRbeMsaHoP5qZi7AV2wghV3OO2Uhc7sFjVpaYw1b9HKexShV/0FxotIRVyddLsPw1KLt2WMyolrXGy/dQkaXUI1MOu5gyh58U/FStWbCLRCxnygMD+nW/kA15hrnResIaZVZ8tSBN/dEy7FZc/tRCpE0OI0SgWJFAFzKMgR36zVe3f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622272b5-7a2e-4b18-ed85-08d773215eb1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 10:05:45.8667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plg25KJFKz0YDjeEYDChzSbpPh+pXt997UJ/0gEF6Vp9bSGh1RzH2zNa1ay2gP1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1692
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nGH0I1hFT2Gt9NUfDAnLyV5MNlTHpPaHNKR7xWqbJE=;
 b=aoJu8fh25mqzehb76RSrZM/+Zs/zpaDMW/qTv6jfBFrTNkkTjbhsjFKPPRE3zesM5JIfEAw/3SOuhCeaEMeHXh2Sha5PZzEL7McNGpNwcyVIIUD5I5YOnOxNK8fk2DVXdKRkVMZ9Bp8cx2XwpTawuoS6DTJvcykPkW5lZDsO+2U=
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
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBkb24ndCBzZWUgdGhlIGFkdmFudGFnZSBvdmVyIGp1c3QgaW5jcmVhc2luZyB0aGUgYWxpZ25t
ZW50IApyZXF1aXJlbWVudHMgaW4gdGhlIGRyaXZlciBzaWRlPwoKVGhhdCB3b3VsZCBiZSBhIG9u
ZSBsaW5lciBpZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlzdGFrZW4uCgpSZWdhcmRzLApDaHJpc3Rp
YW4uCgpBbSAyNy4xMS4xOSB1bSAwOTozMSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdh
cmUpOgo+IEZyb206IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPgo+
IFVzaW5nIGh1Z2UgcGFnZS10YWJsZSBlbnRyaWVzIHJlcXVpcmUgdGhhdCB0aGUgc3RhcnQgb2Yg
YSBidWZmZXIgb2JqZWN0Cj4gaXMgaHVnZSBwYWdlIHNpemUgYWxpZ25lZC4gU28gaW50cm9kdWNl
IGEgdHRtX2JvX21hbl9nZXRfbm9kZV9odWdlKCkKPiBmdW5jdGlvbiB0aGF0IGF0dGVtcHRzIHRv
IGFjY29tcGxpc2ggdGhpcyBmb3IgYWxsb2NhdGlvbnMgdGhhdCBhcmUgbGFyZ2VyCj4gdGhhbiB0
aGUgaHVnZSBwYWdlIHNpemUsIGFuZCBwcm92aWRlIGEgbmV3IHJhbmdlLW1hbmFnZXIgaW5zdGFu
Y2UgdGhhdAo+IHVzZXMgdGhhdCBmdW5jdGlvbi4KPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNv
bT4KPiBDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4K
PiBDYzogIktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5j
b20+Cj4gQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogIkrD
qXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhl
bGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fbWFuYWdlci5jIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAgICAgIHwgIDEgKwo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFu
YWdlci5jCj4gaW5kZXggMThkM2RlYmNjOTQ5Li4yNmFhMWEyYWU3ZjEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fbWFuYWdlci5jCj4gQEAgLTg5LDYgKzg5LDg5IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX21hbl9nZXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAg
IAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICsjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQ
QUdFCj4gK3N0YXRpYyBpbnQgdHRtX2JvX2luc2VydF9hbGlnbmVkKHN0cnVjdCBkcm1fbW0gKm1t
LCBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsCj4gKwkJCQkgdW5zaWduZWQgbG9uZyBhbGlnbl9w
YWdlcywKPiArCQkJCSBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKPiArCQkJCSBzdHJ1
Y3QgdHRtX21lbV9yZWcgKm1lbSwKPiArCQkJCSB1bnNpZ25lZCBsb25nIGxwZm4sCj4gKwkJCQkg
ZW51bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9kZSkKPiArewo+ICsJaWYgKGFsaWduX3BhZ2VzID49
IG1lbS0+cGFnZV9hbGlnbm1lbnQgJiYKPiArCSAgICAoIW1lbS0+cGFnZV9hbGlnbm1lbnQgfHwg
YWxpZ25fcGFnZXMgJSBtZW0tPnBhZ2VfYWxpZ25tZW50ID09IDApKSB7Cj4gKwkJcmV0dXJuIGRy
bV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShtbSwgbm9kZSwKPiArCQkJCQkJICAgbWVtLT5udW1f
cGFnZXMsCj4gKwkJCQkJCSAgIGFsaWduX3BhZ2VzLCAwLAo+ICsJCQkJCQkgICBwbGFjZS0+ZnBm
biwgbHBmbiwgbW9kZSk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIC1FTk9TUEM7Cj4gK30KPiArCj4g
K3N0YXRpYyBpbnQgdHRtX2JvX21hbl9nZXRfbm9kZV9odWdlKHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciAqbWFuLAo+ICsJCQkJICAgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4g
KwkJCQkgICAgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCj4gKwkJCQkgICAgc3RydWN0
IHR0bV9tZW1fcmVnICptZW0pCj4gK3sKPiArCXN0cnVjdCB0dG1fcmFuZ2VfbWFuYWdlciAqcm1h
biA9IChzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKikgbWFuLT5wcml2Owo+ICsJc3RydWN0IGRy
bV9tbSAqbW0gPSAmcm1hbi0+bW07Cj4gKwlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGU7Cj4gKwl1
bnNpZ25lZCBsb25nIGFsaWduX3BhZ2VzOwo+ICsJdW5zaWduZWQgbG9uZyBscGZuOwo+ICsJZW51
bSBkcm1fbW1faW5zZXJ0X21vZGUgbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVTVDsKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJbm9kZSA9IGt6YWxsb2Moc2l6ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7Cj4g
KwlpZiAoIW5vZGUpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJbHBmbiA9IHBsYWNlLT5s
cGZuOwo+ICsJaWYgKCFscGZuKQo+ICsJCWxwZm4gPSBtYW4tPnNpemU7Cj4gKwo+ICsJbW9kZSA9
IERSTV9NTV9JTlNFUlRfQkVTVDsKPiArCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19U
T1BET1dOKQo+ICsJCW1vZGUgPSBEUk1fTU1fSU5TRVJUX0hJR0g7Cj4gKwo+ICsJc3Bpbl9sb2Nr
KCZybWFuLT5sb2NrKTsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQ
QVJFTlRfSFVHRVBBR0VfUFVEKSkgewo+ICsJCWFsaWduX3BhZ2VzID0gKEhQQUdFX1BVRF9TSVpF
ID4+IFBBR0VfU0hJRlQpOwo+ICsJCWlmIChtZW0tPm51bV9wYWdlcyA+PSBhbGlnbl9wYWdlcykg
ewo+ICsJCQlyZXQgPSB0dG1fYm9faW5zZXJ0X2FsaWduZWQobW0sIG5vZGUsIGFsaWduX3BhZ2Vz
LAo+ICsJCQkJCQkgICAgcGxhY2UsIG1lbSwgbHBmbiwgbW9kZSk7Cj4gKwkJCWlmICghcmV0KQo+
ICsJCQkJZ290byBmb3VuZF91bmxvY2s7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWFsaWduX3BhZ2Vz
ID0gKEhQQUdFX1BNRF9TSVpFID4+IFBBR0VfU0hJRlQpOwo+ICsJaWYgKG1lbS0+bnVtX3BhZ2Vz
ID49IGFsaWduX3BhZ2VzKSB7Cj4gKwkJcmV0ID0gdHRtX2JvX2luc2VydF9hbGlnbmVkKG1tLCBu
b2RlLCBhbGlnbl9wYWdlcywgcGxhY2UsIG1lbSwKPiArCQkJCQkgICAgbHBmbiwgbW9kZSk7Cj4g
KwkJaWYgKCFyZXQpCj4gKwkJCWdvdG8gZm91bmRfdW5sb2NrOwo+ICsJfQo+ICsKPiArCXJldCA9
IGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShtbSwgbm9kZSwgbWVtLT5udW1fcGFnZXMsCj4g
KwkJCQkJICBtZW0tPnBhZ2VfYWxpZ25tZW50LCAwLAo+ICsJCQkJCSAgcGxhY2UtPmZwZm4sIGxw
Zm4sIG1vZGUpOwo+ICtmb3VuZF91bmxvY2s6Cj4gKwlzcGluX3VubG9jaygmcm1hbi0+bG9jayk7
Cj4gKwo+ICsJaWYgKHVubGlrZWx5KHJldCkpIHsKPiArCQlrZnJlZShub2RlKTsKPiArCX0gZWxz
ZSB7Cj4gKwkJbWVtLT5tbV9ub2RlID0gbm9kZTsKPiArCQltZW0tPnN0YXJ0ID0gbm9kZS0+c3Rh
cnQ7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArI2Vsc2UKPiArI2RlZmluZSB0dG1f
Ym9fbWFuX2dldF9ub2RlX2h1Z2UgdHRtX2JvX21hbl9nZXRfbm9kZQo+ICsjZW5kaWYKPiArCj4g
Kwo+ICAgc3RhdGljIHZvaWQgdHRtX2JvX21hbl9wdXRfbm9kZShzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiwKPiAgIAkJCQlzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKPiAgIHsKPiBA
QCAtMTU0LDMgKzIzNywxMiBAQCBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVu
YyB0dG1fYm9fbWFuYWdlcl9mdW5jID0gewo+ICAgCS5kZWJ1ZyA9IHR0bV9ib19tYW5fZGVidWcK
PiAgIH07Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19tYW5hZ2VyX2Z1bmMpOwo+ICsKPiArY29u
c3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Z1bmMgdHRtX2JvX21hbmFnZXJfaHVnZV9m
dW5jID0gewo+ICsJLmluaXQgPSB0dG1fYm9fbWFuX2luaXQsCj4gKwkudGFrZWRvd24gPSB0dG1f
Ym9fbWFuX3Rha2Vkb3duLAo+ICsJLmdldF9ub2RlID0gdHRtX2JvX21hbl9nZXRfbm9kZV9odWdl
LAo+ICsJLnB1dF9ub2RlID0gdHRtX2JvX21hbl9wdXRfbm9kZSwKPiArCS5kZWJ1ZyA9IHR0bV9i
b19tYW5fZGVidWcKPiArfTsKPiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fbWFuYWdlcl9odWdlX2Z1
bmMpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGluZGV4IGNhYzdhOGEwODI1YS4uODY4YmQw
ZDRiZTZhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiAr
KysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTg4OCw1ICs4ODgsNiBA
QCBpbnQgdHRtX2JvX3BpcGVsaW5lX2d1dHRpbmcoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
byk7Cj4gICBwZ3Byb3RfdCB0dG1faW9fcHJvdCh1aW50MzJfdCBjYWNoaW5nX2ZsYWdzLCBwZ3By
b3RfdCB0bXApOwo+ICAgCj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5h
Z2VyX2Z1bmMgdHRtX2JvX21hbmFnZXJfZnVuYzsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1f
bWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5hZ2VyX2h1Z2VfZnVuYzsKPiAgIAo+ICAg
I2VuZGlmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
