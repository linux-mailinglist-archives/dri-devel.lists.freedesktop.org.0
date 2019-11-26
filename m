Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3610A150
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D6A6E42C;
	Tue, 26 Nov 2019 15:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2CD6E42A;
 Tue, 26 Nov 2019 15:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8swd6dl0BJfo3gCjkbpeUCZol0hSdKOea0KkCK0HDeO/BjRnd3RUcg9dpzrjf5NjN0TPiStT5nnv4ywOggdDi0TxrkYOtRy7dvyDwegVHW3IJVN63WslXj5GAX2pArrLnyXI55T82OJe5fTomEmxIVfWwv8F+pjMLhg5dKY+Yw1jZXE+f4izEbDuqG/rFgLR85np3LElzQqDxifus6G7LvP44LJZkneN8q1r4C17pwRN8c2QRBmqoU6wNHDb7uFB89dLCr/qWizcPX2IPY5Vt7ZBkZ+vDR2VPq3LM5YWouykj2TMbTR3wTLtfVI9Ph49sn8jF93tAvWi7TjSQSgBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho4yEpU9TqLokgCAhgam7Yw3ahRq2EKonbceY5FMHRU=;
 b=TXXEK1yuLcuF2KVfbK+5ocF4bWyBV9XMjsOP0FVWzG6W1bC179qX3lO5HlPOrP6PiaxxpMgKdyJw149mdBFVRZzg5Z/TbNzd6XH4I4vBe4R7OELbHfFn9G7hdjrFJTp3TJiIHxYNSyef3rR2rGqeQTiJLpsORZPDlG0ZvyzqzaykKeUsBNdXMstF2TZjz22BspjKqTH32O/r24GAx/cGfCBRkDLCCo0LSvdBS7bAT1l5B2QTbEVgJIX3jfk3vjRqy+TRz9UakQXykbcRWD/vAp8tME/ukURGLGVLGnUceNLOhNfICF/v8YorpxtGP5N7GIBm/SP/y3P/xXT0uCqVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1421.namprd12.prod.outlook.com (10.169.206.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 26 Nov 2019 15:37:13 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:37:13 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
Date: Tue, 26 Nov 2019 10:37:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20092a7d-1faf-4c31-454d-08d77286824a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1421:|MWHPR12MB1421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB14214BB1230C40F8F158B36CEA450@MWHPR12MB1421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(305945005)(6486002)(2906002)(31696002)(186003)(8676002)(6512007)(58126008)(81166006)(81156014)(14454004)(86362001)(25786009)(316002)(478600001)(26005)(6436002)(4326008)(31686004)(2870700001)(6246003)(109986005)(7736002)(53546011)(36756003)(66476007)(386003)(65806001)(2486003)(66574012)(52116002)(6506007)(1671002)(229853002)(99286004)(66556008)(8936002)(23676004)(76176011)(66946007)(65956001)(47776003)(11346002)(2616005)(5660300002)(3846002)(50466002)(14444005)(446003)(66066001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1421;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNaRBtfKfQbU8aLsDxC8How/Qktd54URE1OPb/9JrtadIuBfab63r4qBoDWaC1YfNhPUxtJs4k82A5zXmd9RKYLYAUHuZiFHMQnSfwDajGAv7GzuUQz2TuAGM4k6cRkCKc5fdhqG+mtktcLlym9lqVC7DVabn0w0pPa6Q1vn+xUVB8ladScEBHAaWkBVURoUPML5ZPjRYubX6wf91IpZCVk6Lcz0N4NoT6q7X0dQydpPAT3jcSZU29Jhh1mQc1rTKGaBS0iGRpzc6bzfVm0IkD7t7J3o9CrfR8sJF57qGlIZLRnnsX91eTXlkMmQKkmIvlkHhtghBEVeCWG956t5RsP44VrUcMqZSZzJnZomrCnVjSMwgkHhnFZL7g0vQZWewDBU7nbzNmzKQLJA90NSgJ/K6tfwLLMgF6yd2DgUpRX86HlfxeJw+yQ/FzEhl/+S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20092a7d-1faf-4c31-454d-08d77286824a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:37:13.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 336QOynJpjWXvaJBlpIcxrFh4vZFD8pMb6dn2abZsjCV+Px3sSAATqAOg2yiXZDuo4ejfp9+cYv5XrReJ7RApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho4yEpU9TqLokgCAhgam7Yw3ahRq2EKonbceY5FMHRU=;
 b=tWD5RRkvnAA20vLNIgS4b0kG5wFoRiqI6WUDzn2CP5f9TqpGyy8/jQmsV45+ZNhoD7VERrFfXBFk6E7fQmMBawXbnuP5XDNnyizFPiJwA1UXuDE3GCO4BRKwTuW6hUtclTkOzLlBDyL+h6kchjSW4nSG9j7uAwBwtA02MmAcWr0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: Emily.Deng@amd.com, steven.price@arm.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZwoKQW5kcmV5CgpPbiAxMS8yNS8xOSAzOjUxIFBNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90
ZToKPiBQcm9ibGVtOgo+IER1ZSB0byBhIHJhY2UgYmV0d2VlbiBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzIGluIHNjaGVkIHRocmVhZCBhbmQKPiBkcm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVv
dXQgd29yayB0aGVyZSBpcyBhIHBvc3NpYmxpdHkgdGhhdAo+IGJhZCBqb2Igd2FzIGFscmVhZHkg
ZnJlZWQgd2hpbGUgc3RpbGwgYmVpbmcgYWNjZXNzZWQgZnJvbSB0aGUKPiB0aW1lb3V0IHRocmVh
ZC4KPgo+IEZpeDoKPiBJbnN0ZWFkIG9mIGp1c3QgcGVla2luZyBhdCB0aGUgYmFkIGpvYiBpbiB0
aGUgbWlycm9yIGxpc3QKPiByZW1vdmUgaXQgZnJvbSB0aGUgbGlzdCB1bmRlciBsb2NrIGFuZCB0
aGVuIHB1dCBpdCBiYWNrIGxhdGVyIHdoZW4KPiB3ZSBhcmUgZ2FyYW50ZWVkIG5vIHJhY2Ugd2l0
aCBtYWluIHNjaGVkIHRocmVhZCBpcyBwb3NzaWJsZSB3aGljaAo+IGlzIGFmdGVyIHRoZSB0aHJl
YWQgaXMgcGFya2VkLgo+Cj4gdjI6IExvY2sgYXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJyb3Jf
bGlzdCBpbiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzLgo+Cj4gdjM6IFJlYmFzZSBvbiB0b3Agb2Yg
ZHJtLW1pc2MtbmV4dC4gdjIgaXMgbm90IG5lZWRlZCBhbnltb3JlIGFzCj4gZHJtX3NjaGVkX2dl
dF9jbGVhbnVwX2pvYiBhbHJlYWR5IGhhcyBhIGxvY2sgdGhlcmUuCj4KPiB2NDogRml4IGNvbW1l
bnRzIHRvIHJlbGZlY3QgbGF0ZXN0IGNvZGUgaW4gZHJtLW1pc2MuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFRlc3Rl
ZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IEBAIC0yODQsMTAgKzI4NCwy
MSBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCj4gICAJc2NoZWQgPSBjb250
YWluZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsK
PiArCj4gKwkvKiBQcm90ZWN0cyBhZ2FpbnN0IGNvbmN1cnJlbnQgZGVsZXRpb24gaW4gZHJtX3Nj
aGVkX2dldF9jbGVhbnVwX2pvYiAqLwo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2Jf
bGlzdF9sb2NrLCBmbGFncyk7Cj4gICAJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZz
Y2hlZC0+cmluZ19taXJyb3JfbGlzdCwKPiAgIAkJCQkgICAgICAgc3RydWN0IGRybV9zY2hlZF9q
b2IsIG5vZGUpOwo+ICAgCj4gICAJaWYgKGpvYikgewo+ICsJCS8qCj4gKwkJICogUmVtb3ZlIHRo
ZSBiYWQgam9iIHNvIGl0IGNhbm5vdCBiZSBmcmVlZCBieSBjb25jdXJyZW50Cj4gKwkJICogZHJt
X3NjaGVkX2NsZWFudXBfam9icy4gSXQgd2lsbCBiZSByZWluc2VydGVkIGJhY2sgYWZ0ZXIgc2No
ZWQtPnRocmVhZAo+ICsJCSAqIGlzIHBhcmtlZCBhdCB3aGljaCBwb2ludCBpdCdzIHNhZmUuCj4g
KwkJICovCj4gKwkJbGlzdF9kZWxfaW5pdCgmam9iLT5ub2RlKTsKPiArCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+ICsKPiAgIAkJam9iLT5z
Y2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9iKTsKPiAgIAo+ICAgCQkvKgo+IEBAIC0yOTgsNiAr
MzA5LDggQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90aW1lZG91dChzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspCj4gICAJCQlqb2ItPnNjaGVkLT5vcHMtPmZyZWVfam9iKGpvYik7Cj4gICAJ
CQlzY2hlZC0+ZnJlZV9ndWlsdHkgPSBmYWxzZTsKPiAgIAkJfQo+ICsJfSBlbHNlIHsKPiArCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOwo+ICAg
CX0KPiAgIAo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxh
Z3MpOwo+IEBAIC0zNzAsNiArMzgzLDIwIEBAIHZvaWQgZHJtX3NjaGVkX3N0b3Aoc3RydWN0IGRy
bV9ncHVfc2NoZWR1bGVyICpzY2hlZCwgc3RydWN0IGRybV9zY2hlZF9qb2IgKmJhZCkKPiAgIAlr
dGhyZWFkX3Bhcmsoc2NoZWQtPnRocmVhZCk7Cj4gICAKPiAgIAkvKgo+ICsJICogUmVpbnNlcnQg
YmFjayB0aGUgYmFkIGpvYiBoZXJlIC0gbm93IGl0J3Mgc2FmZSBhcwo+ICsJICogZHJtX3NjaGVk
X2dldF9jbGVhbnVwX2pvYiBjYW5ub3QgcmFjZSBhZ2FpbnN0IHVzIGFuZCByZWxlYXNlIHRoZQo+
ICsJICogYmFkIGpvYiBhdCB0aGlzIHBvaW50IC0gd2UgcGFya2VkICh3YWl0ZWQgZm9yKSBhbnkg
aW4gcHJvZ3Jlc3MKPiArCSAqIChlYXJsaWVyKSBjbGVhbnVwcyBhbmQgZHJtX3NjaGVkX2dldF9j
bGVhbnVwX2pvYiB3aWxsIG5vdCBiZSBjYWxsZWQKPiArCSAqIG5vdyB1bnRpbCB0aGUgc2NoZWR1
bGVyIHRocmVhZCBpcyB1bnBhcmtlZC4KPiArCSAqLwo+ICsJaWYgKGJhZCAmJiBiYWQtPnNjaGVk
ID09IHNjaGVkKQo+ICsJCS8qCj4gKwkJICogQWRkIGF0IHRoZSBoZWFkIG9mIHRoZSBxdWV1ZSB0
byByZWZsZWN0IGl0IHdhcyB0aGUgZWFybGllc3QKPiArCQkgKiBqb2IgZXh0cmFjdGVkLgo+ICsJ
CSAqLwo+ICsJCWxpc3RfYWRkKCZiYWQtPm5vZGUsICZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCk7
Cj4gKwo+ICsJLyoKPiAgIAkgKiBJdGVyYXRlIHRoZSBqb2IgbGlzdCBmcm9tIGxhdGVyIHRvICBl
YXJsaWVyIG9uZSBhbmQgZWl0aGVyIGRlYWN0aXZlCj4gICAJICogdGhlaXIgSFcgY2FsbGJhY2tz
IG9yIHJlbW92ZSB0aGVtIGZyb20gbWlycm9yIGxpc3QgaWYgdGhleSBhbHJlYWR5Cj4gICAJICog
c2lnbmFsZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
