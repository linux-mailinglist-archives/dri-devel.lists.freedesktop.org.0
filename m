Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E953C1EFFF3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 20:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B11C6E965;
	Fri,  5 Jun 2020 18:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2D6E965;
 Fri,  5 Jun 2020 18:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJJ17bM+d3bUf/hvUKVloA7yocGHvo3akgd5seqDZUuQnPjtuEVsx9bI4Yappex1AiyaMPwIvapqKyJYNKXsEMrl8xg7gAOwWCjCms9Sm4yFw5ZAYaEuBwyhT55v/9dgZevu0x22kfx59qyIPn+hTH16PnFYZ9l2eSOzuOyS/LfJCfoPc/lW8gfne7BIiFA4nqbKZyLHetrlIecyNtgVQoDL5D8jdrxthDQxNAPC3kun+7nO53+8x4CVXN7RFtea5NxEq4JoXcVgyegTvQomNPKO9r7RRQ5b+G0vBouJnTKVKw6aqhk8r62rh7ErZNj5zk6xf2xhvSWKjAPX5fxFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoEklmHrR/8gX351DgUT6fY/oJQruuQot1Sh9KSJitQ=;
 b=iAYRLGCZO4eh2hHiqsZQqavxoEEOE9LUsI67HJsLcQ7wO4ntcQZ/OvTmz+VeYlvgvhhimKn+Lkm6XGqqPCzjswrGCv8UKLcz2Nz/u0ozQnzDu3z9hRarBZ8oIyOp7O7sYpEtid4tyxRWbFj5pwyNyHO7ECCx7DA2ERBSLQ6tQ6yWBOZUldjMbpJMv+reYpz6j/1IMRMha3itTezNihJyxR9M04iXVtK4EfxXBMgPRMrArIYY+2Adb9LoP4H9lpbx06x1wdqtUmJ0S5hmIFwFkV152Tu+fO2o6zZedNlaocC4bQJ7UvalVhV3wyRCQyYvivarYIcOVZ4zGwkaVnTwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoEklmHrR/8gX351DgUT6fY/oJQruuQot1Sh9KSJitQ=;
 b=tIMr+mSUI3JvH7/N7eEg5rWFzsJVVF/3UxbwugNlbT5uSthV0WmYroQbV16KXY1qLblxgaPyNz3Zk1Zjk687dyEw1MO4PVt1Z8I3N7mTI1Oek1TqbzkxA9aYbNgMgkeXcIkoFRBDqLSTo4/LZXGqEoVCvFgZyRTtxsSPE0rhtDk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3242.namprd12.prod.outlook.com (2603:10b6:5:189::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Fri, 5 Jun
 2020 18:40:51 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%5]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 18:40:51 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-2-git-send-email-andrey.grodzovsky@amd.com>
 <e293af59-99df-c147-68d6-8fa3ade38829@gmail.com>
 <3758b335-25b5-403c-5936-25d5fe714842@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d297514f-a1c9-3bd3-a1e2-6921019a5d31@amd.com>
Date: Fri, 5 Jun 2020 20:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <3758b335-25b5-403c-5936-25d5fe714842@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0095.eurprd07.prod.outlook.com
 (2603:10a6:207:6::29) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0095.eurprd07.prod.outlook.com (2603:10a6:207:6::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.10 via Frontend Transport; Fri, 5 Jun 2020 18:40:50 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa7f1b7f-d94d-4058-ce19-08d8097ff916
X-MS-TrafficTypeDiagnostic: DM6PR12MB3242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3242950572256AA71B95657F83860@DM6PR12MB3242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxZWq4TGppEJKDjR+/Tss5ZiL2itE/57TV2w4lfq2wjYk2gY5JLML3jAlKHrFfDnQ+/J2sFI5xplDDo3PvwZEwXcLgZD6bZefm5mduRi4SPn72iJjJn1E4ls1gwUSJM8RLjWnGWOrOQMbM/h+kBi9FrjZcIoeILVKFImhJUQbOUU5Su9MKSqEm2OBhdbE9FkFhLcMDQQwB1WZi/tcqyNdPFDtmRqab6iqjY/gtTWTzoo3BYgYNrrWrBv8VQi43GJrwJjQX7ZH4LJRYDTGpzdHK09D1e5EVrj/NDPuDAxPNdDvn8lIlNdY/YUSQLv1zyfYvEe4aXCS5ssqj6Zw9gDmIJ5BNR+FmWECb3tVnq9yR9llJc4e0bIyoUFyOmud4Cf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(6666004)(6486002)(2616005)(5660300002)(31686004)(53546011)(16526019)(478600001)(186003)(2906002)(8676002)(8936002)(36756003)(66476007)(66946007)(4326008)(86362001)(52116002)(66556008)(66574014)(31696002)(83380400001)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wPy42ORR6fozCZN9CHnyTnwiNYN5cwJ4alxBrzFLGukmw3h4i1LfkPwAcEnRZ3BGfS2Mk2C7KtPLrcYJn/IZJmdXiI/Zczdbvzk4a1L6ZBeQmkRY5+kYbE8mVxxkZ0abLOhNxEVzS8aEv11EiJg51KYq+dmj8hCJikGzuQTm6VA0Pe9ADwih2XB7c/2Lyrxnd+NH8RpdOWBwNBwBXp3povSdsrZfUfkjVP+NCD16ggaKSSibWkhuQioEtPK4Svet6C6eqsvJ10Vqm4cBdL7NJ/5wF8lwa96pmOwpkSycGM708xD1aWRA8rK88i1nEAwNcoDfzr6tmiZq/5YDHD0meIVFGdrXbN7CkpPJFmxpGjaBKm8CbnwGFpzEKXxkMzm3DKX+6CMNdfpnukXhyw9ywCutkvt5MuFD4ESjm0miO0VZFvPjyxnGp2DnVdw+06Y4E2G99q2xTUUpV9tVPBLKrKYBYtCvnGNLEcIbMNUx8Xg0S26zGgUS24qEL2jRJDtdfH6FuN7CvnLHvciHg8YQ8Hbjij+mSKFZNhIORFJhHsBJUpMawFkaR7IhBWPDR1bb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7f1b7f-d94d-4058-ce19-08d8097ff916
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 18:40:51.9075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9zF831P3dy48lgpq1QBUsaWv8mMJaGJy7MzpXojFXYqwbOtpW3G/oPL0iqngc5x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3242
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDYuMjAgdW0gMTY6Mjkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDUv
MTEvMjAgMjo0NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMDkuMDUuMjAgdW0g
MjA6NTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jwqDCoMKgIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrLQo+Pj4gwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8wqAgMiArKwo+Pj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgCj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+IGluZGV4IGM1YjUxNmYuLmVhZTYxY2MgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtMTc1MCw5ICsxNzUwLDI5IEBAIHZvaWQgdHRt
X2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0IAo+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4g
wqDCoMKgwqDCoCB0dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQoYm8pOwo+Pj4gwqDCoMKgwqDC
oCB0dG1fbWVtX2lvX3VubG9jayhtYW4pOwo+Pj4gwqAgfQo+Pj4gK0VYUE9SVF9TWU1CT0wodHRt
X2JvX3VubWFwX3ZpcnR1YWwpOwo+Pj4gwqAgK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRk
cmVzc19zcGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPj4+ICt7Cj4+PiArwqDCoMKg
IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+
IMKgIC1FWFBPUlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4KPj4+ICvCoMKgwqAg
Zm9yIChpID0gMDsgaSA8IFRUTV9OVU1fTUVNX1RZUEVTOyBpKyspIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBtYW4gPSAmYmRldi0+bWFuW2ldOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChtYW4tPmhh
c190eXBlICYmIG1hbi0+dXNlX3R5cGUpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1f
bWVtX2lvX2xvY2sobWFuLCBmYWxzZSk7Cj4+PiArwqDCoMKgIH0KPj4KPj4gWW91IHNob3VsZCBk
cm9wIHRoYXQgaXQgd2lsbCBqdXN0IHJlc3VsdCBpbiBhIGRlYWRsb2NrIHdhcm5pbmcgZm9yIAo+
PiBOb3V2ZWF1IGFuZCBoYXMgbm8gZWZmZWN0IGF0IGFsbC4KPj4KPj4gQXBhcnQgZnJvbSB0aGF0
IGxvb2tzIGdvb2QgdG8gbWUsCj4+IENocmlzdGlhbi4KPgo+Cj4gQXMgSSBhbSBjb25zaWRlcmlu
ZyB0byByZS1pbmNsdWRlIHRoaXMgaW4gVjIgb2YgdGhlIHBhdGNoc2V0cywgY2FuIHlvdSAKPiBj
bGFyaWZ5IHBsZWFzZSB3aHkgdGhpcyB3aWxsIGhhdmUgbm8gZWZmZWN0IGF0IGFsbCA/CgpUaGUg
bG9ja3MgYXJlIGV4Y2x1c2l2ZSBmb3IgTm91dmVhdSB0byBhbGxvY2F0ZS9mcmVlIHRoZSBpbyBh
ZGRyZXNzIHNwYWNlLgoKU2luY2Ugd2UgZG9uJ3QgZG8gdGhpcyBoZXJlIHdlIGRvbid0IG5lZWQg
dGhlIGxvY2tzLgoKQ2hyaXN0aWFuLgoKPgo+IEFuZHJleQo+Cj4KPj4KPj4+ICsKPj4+ICvCoMKg
wqAgdW5tYXBfbWFwcGluZ19yYW5nZShiZGV2LT5kZXZfbWFwcGluZywgMCwgMCAsIDEpOwo+Pj4g
K8KgwqDCoCAvKlRPRE8gV2hhdCBhYm91dCB0dG1fbWVtX2lvX2ZyZWVfdm0oYm8pID8gKi8KPj4+
ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gVFRNX05VTV9NRU1fVFlQRVMgLSAxOyBpID49IDA7IGkt
LSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1hbiA9ICZiZGV2LT5tYW5baV07Cj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKG1hbi0+aGFzX3R5cGUgJiYgbWFuLT51c2VfdHlwZSkKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHR0bV9tZW1faW9fdW5sb2NrKG1hbik7Cj4+PiArwqDCoMKgIH0KPj4+
ICt9Cj4+PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fdW5tYXBfdmlydHVhbF9hZGRyZXNzX3NwYWNl
KTsKPj4+IMKgIMKgIGludCB0dG1fYm9fd2FpdChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgaW50ZXJydXB0aWJsZSwgYm9vbCBub193YWl0
KQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggCj4+PiBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4+IGluZGV4IGM5ZTBmZDAuLjMxMzM0
NjMgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+PiAr
KysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+PiBAQCAtNjAwLDYgKzYwMCw4
IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+
PiDCoMKgICovCj4+PiDCoCB2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pOwo+Pj4gwqAgK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVz
c19zcGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4+PiArCj4+PiDCoCAvKioKPj4+
IMKgwqAgKiB0dG1fYm9fdW5tYXBfdmlydHVhbAo+Pj4gwqDCoCAqCj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
