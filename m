Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7111E7825
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 10:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C4189EAC;
	Fri, 29 May 2020 08:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2CF89EAC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFtvy20bAQQJY+bN3xp1nAt78J193+MD+Ku6Wd3MVPD59wAx+DcnehUf66FTl6jinDe70TAIPwA0CP/zlKem3t/uv2Uqcz1SH+hgLbQ1kZ9AJuz0YKVdiQnH1eTYIvK1mvARlLAV91+X70wRT7g5p/mN9mBrT2ahCYj9zTvWn8341evZ4ysqcP8cMxVfMRM4rZ6UD4OJHXfaNtH88De0qHrgdTZrIJdjrd7h9EjlFmLYDn+wMTGc/bidvbaDJVNeJgHVCdtX0k5HDs2BD5SbLc2GofbhtVf0tzDz/RNGG6rGX4Cn+cxiQQ30psQbhazQbqmK3o+pZKn+h+T/4Rm7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlBz/+cAr3QJg6PdE9H8vXqdsqzP+2kw4KR4dJWtxvg=;
 b=Ra1zZSvQ1cx7mPDfeUNQ84mpnQ9U4if1bocBXBurSvEmyNMOddq/zduVkjou6/0IRi7DbUpaOQOs1NQ5xsqfleZdCSkYmVxVxY2fjbcp9tiCbu7DAyOi6UIw2oiHURJuz2eQ54xr3PD3kZRN7l7PC4C4VfRFQmxIzcVqRsboabxtoAhuk1Vg2rEHaO549aiWGUpjxyO5n5wGmUWcUjeaVxogPhW6jdDePlx+ooSoqEXjw8ny0N4GtHdcuyfUbTAUr2Q/J5sVh5d6DnuAX9V+zz8xjFYUZGtF9DqNv3wG1H/X0/wvRjE6LEfcsGFH1qsbcgyXTFFo6rlRgJ5hiCAxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlBz/+cAr3QJg6PdE9H8vXqdsqzP+2kw4KR4dJWtxvg=;
 b=ho3gprz+gFnlrxumOGYDZsSgy3eHCCS+H0OI1YZylaLJw+Qi1bvwHXRPWIPewpKxTIpHG3mM9ff2f0frgiaUA/S22BYtdJP9K0JI8PXKpzhHo4C7S93zBJ2tHYjglnuBz4kf+M5Ve72qgFopPLfnBdoTol5OtjrvUGEsuXNcENw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3488.namprd12.prod.outlook.com (2603:10b6:208:ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 08:21:25 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:21:25 +0000
Subject: Re: [PATCH] drm/mm: add ig_frag selftest
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200528130556.53275-1-nirmoy.das@amd.com>
 <0a73e54e-10bd-d06b-d9a4-fcbf5b5571d6@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <a2b6ada9-04f9-1dd4-141b-389ea8a8aac4@amd.com>
Date: Fri, 29 May 2020 10:21:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <0a73e54e-10bd-d06b-d9a4-fcbf5b5571d6@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0050.eurprd05.prod.outlook.com
 (2603:10a6:200:68::18) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2003:c5:8f1f:600:dbea:65ed:a38:6805) by
 AM4PR0501CA0050.eurprd05.prod.outlook.com (2603:10a6:200:68::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18 via Frontend
 Transport; Fri, 29 May 2020 08:21:24 +0000
X-Originating-IP: [2003:c5:8f1f:600:dbea:65ed:a38:6805]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c81c297-b1d0-4c76-bcc8-08d803a94733
X-MS-TrafficTypeDiagnostic: MN2PR12MB3488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB348812EF06D634369E8E36948B8F0@MN2PR12MB3488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jShyHlpHy2QD75o7/BMaq6vqpHG9IlwnrjokyJzGb2ynUfOGNGr/KIoiOmr3AiB0VHsoM5v9yzrLsUivYT/PNZN9glpSfihOtwkgFeQD9fBB+4Ci2QjhjZRlzXVEvZD4RSayw4/0EWnWKhnqYzRWeoy7qGaj5zpAmQg7RcGSBrSuaiOwpFtwECUR6pTJ2KfFoISWjVevS8NblphmkSOcGmVJH8EYICz3AvG9XPjSYwSfMq0EWucJDe5a2OSju8JakRdtLL3zIY+NoCE/JObNVgEB+ZMfiPgeJznvmHkG+inZYrveOjUm4b8gM09NlLH81BrI5UA9lzekXyJjgxabu4/AAoUho3UzJgw/s5FQGlJ+AheRLvmhfxEfpMe/xTx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(31696002)(2906002)(6666004)(6512007)(8676002)(6486002)(5660300002)(66946007)(8936002)(66556008)(66476007)(110136005)(316002)(53546011)(2616005)(36756003)(4326008)(66574014)(16526019)(52116002)(478600001)(6506007)(186003)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WElN+Q4muEe31bGnOVzL3yrTU5VRzIKVnbsBBWoQ+YzxFiLkQQ9hrHPz/0hfT+cjP7mSJCthk33TTy30EVHlvLFkNM8ZYGeWHw342c4MDkNQqRUxnxEbNhKYA0yOu0yZK+apu1b8B9lfYAbnp86Xalbyb7FN/eOJMmRY9AYwtl4rKvUj+L0l/D0j518yID4m9QzrrbXWuIC/fyNUxWnal430MvJttobfGu4pR3yVSeRCqxidNexRk5+gJatWSQvb6ImFCh6Zwx9XhrwNGd9KuPi1lOT2FfffoRw2/NsVlj2jAiki4GivgSvp+H+/N0jYsj7o7vcYe2trxP40eIbs4tDiNCMtgtkDuOTzMRgevIfd5EICgQwQ31dBrbc8HAXwHmEF9Mk/xdAcxSEZCSbjwXY2ifuWr6ZEEUyQk9eu82/P5HAY/Le/6fTJvx5VGhhGRtEzyu7NEvkCyOYq7ETbq2PKSCk05fYJseqH5gIa39WGzBv9OVqP9k0v7xjNUM1J6KenLllCkVGSiULNGqf4Um82sf0C4M12DDrURxa4Zqg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c81c297-b1d0-4c76-bcc8-08d803a94733
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:21:25.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vw3+vqu2opzRC69XfY+KZqLQCAWfpL3tOh/iB+sSZqjGL7ON4YJRQJQ0fGItXdoN0I7lLCfbv5uGpJKu724Kqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3488
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, chris@chris-wilson.co.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjgvMjAgODo0OSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyOC4wNS4y
MCB1bSAxNTowNSBzY2hyaWViIE5pcm1veSBEYXM6Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBm
cmFnbWVudGF0aW9uIGluIHRoZSBhZGRyZXNzIHJhbmdlCj4+IGFuZCBtZWFzdXJlcyB0aW1lIHRh
a2VuIGJ5IDEwayBpbnNlcnRpb25zIGZvciBlYWNoIG1vZGVzLgo+Pgo+PiBpZ19mcmFnKCkgd2ls
bCBmYWlsIGlmIG9uZSBvZiB0aGUgbW9kZSB0YWtlcyBtb3JlIHRoYW4gMSBzZWMuCj4+Cj4+IE91
dHB1dDoKPj4gPHNuaXA+Cj4+IFvCoMKgIDM3LjMyNjcyM10gZHJtX21tOiBpZ3Rfc2FuaXR5Y2hl
Y2sgLSBvayEKPj4gW8KgwqAgMzcuMzI2NzI3XSBpZ3RfZGVidWcgMHgwMDAwMDAwMDAwMDAwMDAw
LTB4MDAwMDAwMDAwMDAwMDIwMDogNTEyOiAKPj4gZnJlZQo+PiBbwqDCoCAzNy4zMjY3MjhdIGln
dF9kZWJ1ZyAweDAwMDAwMDAwMDAwMDAyMDAtMHgwMDAwMDAwMDAwMDAwNjAwOiAxMDI0OiAKPj4g
dXNlZAo+PiBbwqDCoCAzNy4zMjY3MjhdIGlndF9kZWJ1ZyAweDAwMDAwMDAwMDAwMDA2MDAtMHgw
MDAwMDAwMDAwMDAwYTAwOiAxMDI0OiAKPj4gZnJlZQo+PiBbwqDCoCAzNy4zMjY3MjldIGlndF9k
ZWJ1ZyAweDAwMDAwMDAwMDAwMDBhMDAtMHgwMDAwMDAwMDAwMDAwZTAwOiAxMDI0OiAKPj4gdXNl
ZAo+PiBbwqDCoCAzNy4zMjY3MzBdIGlndF9kZWJ1ZyAweDAwMDAwMDAwMDAwMDBlMDAtMHgwMDAw
MDAwMDAwMDAxMDAwOiA1MTI6IAo+PiBmcmVlCj4+IFvCoMKgIDM3LjMyNjczMF0gaWd0X2RlYnVn
IHRvdGFsOiA0MDk2LCB1c2VkIDIwNDggZnJlZSAyMDQ4Cj4+IFvCoMKgIDU2LjA0MDA2NF0gZHJt
X21tOiBiZXN0IGZyYWdtZW50ZWQgaW5zZXJ0IHRvb2sgNTA0IG1zZWNzCj4+IFvCoMKgIDU2LjA4
MjE4NF0gZHJtX21tOiBib3R0b20tdXAgZnJhZ21lbnRlZCBpbnNlcnQgdG9vayA0MCBtc2Vjcwo+
PiBbwqDCoCA1Ni4xMDIyNTVdIGRybV9tbTogdG9wLWRvd24gZnJhZ21lbnRlZCBpbnNlcnQgdG9v
ayAyMCBtc2Vjcwo+PiBbwqDCoCA1Ni4xMDcxNzddIGRybV9tbTogZXZpY3QgZnJhZ21lbnRlZCBp
bnNlcnQgdG9vayA0IG1zZWNzCj4+IDxzbmlwPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kg
RGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4KPiBPZmYgaGFuZCB0aGF0IGxvb2tzIGxpa2UgaXQg
c2hvdWxkIHdvcmssIGJ1dCBJJ20gcmVhbGx5IG5vdCBhbiBleHBlcnQgCj4gZm9yIHRoZSBkcm1f
bW0gY29kZS4KPgo+IEZlZWwgZnJlZSB0byBhZGQgYW4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4sIGJ1dCBJIHdvdWxkIGNvbnNpZGVyIGRv
aW5nIHdoYXQgQ2hyaXMgc2FpZCAKPiBhcyB3ZWxsLgoKClRoYW5rcyBDaHJpc3RpYW4sLiBZZXMg
SSB3aWxsIHNlbmQgYSB2MiB3aXRoIENocmlzJ3Mgc3VnZ2VzdGlvbnMuCgoKTmlybW95Cgo+Cj4g
Q2hyaXN0aWFuLgo+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9t
bV9zZWxmdGVzdHMuaCB8wqAgMSArCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fbW0uY8KgwqDCoMKgwqAgfCA1OSArKysrKysrKysrKysrKysrKysrKwo+PiDCoCAyIGZp
bGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zZWxmdGVzdHMvZHJtX21tX3NlbGZ0ZXN0cy5oIAo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvZHJtX21tX3NlbGZ0ZXN0cy5oCj4+IGluZGV4IDZiOTQzZWExYzU3ZC4uOGM4
N2M5NjQxNzZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9t
bV9zZWxmdGVzdHMuaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9tbV9z
ZWxmdGVzdHMuaAo+PiBAQCAtMTQsNiArMTQsNyBAQCBzZWxmdGVzdChpbnNlcnQsIGlndF9pbnNl
cnQpCj4+IMKgIHNlbGZ0ZXN0KHJlcGxhY2UsIGlndF9yZXBsYWNlKQo+PiDCoCBzZWxmdGVzdChp
bnNlcnRfcmFuZ2UsIGlndF9pbnNlcnRfcmFuZ2UpCj4+IMKgIHNlbGZ0ZXN0KGFsaWduLCBpZ3Rf
YWxpZ24pCj4+ICtzZWxmdGVzdChmcmFnLCBpZ3RfZnJhZykKPj4gwqAgc2VsZnRlc3QoYWxpZ24z
MiwgaWd0X2FsaWduMzIpCj4+IMKgIHNlbGZ0ZXN0KGFsaWduNjQsIGlndF9hbGlnbjY0KQo+PiDC
oCBzZWxmdGVzdChldmljdCwgaWd0X2V2aWN0KQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fbW0uYwo+PiBpbmRleCA5YWFiZTgyZGNkM2EuLjRjMDhjYTg2YmI4NiAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fbW0uYwo+PiBAQCAtMTAzMyw2
ICsxMDMzLDY1IEBAIHN0YXRpYyBpbnQgaWd0X2luc2VydF9yYW5nZSh2b2lkICppZ25vcmVkKQo+
PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IGlndF9mcmFn
KHZvaWQgKmlnbm9yZWQpCj4+ICt7Cj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IGluc2VydF9tb2Rl
ICptb2RlOwo+PiArwqDCoMKgIHN0cnVjdCBkcm1fbW0gbW07Cj4+ICvCoMKgwqAgc3RydWN0IGRy
bV9tbV9ub2RlICpub2RlcywgKm5vZGUsICpuZXh0Owo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBz
aXplID0gNDA5NiwgYWxpZ24gPSA4MTkyOwo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgc3RhcnQs
IHRpbWVvdXQgPSAxMDAwOwo+PiArwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGludCBtYXhfY291bnQg
PSAxMDAwMDsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4gK8KgwqDCoCBpbnQgcmV0ID0g
LUVJTlZBTDsKPj4gKwo+PiArwqDCoMKgIC8qIEZvciBlYWNoIG9mIHRoZSBwb3NzaWJsZSBpbnNl
cnRpb24gbW9kZXMsIHdlIHBhc3MgYW4gc2l6ZSwgCj4+IGFsaWdubWVudAo+PiArwqDCoMKgwqAg
KiB2YWx1ZSB0aGF0IGlzIGtub3duIHRvIGludHJvZHVjZSBmcmFnbWVudGF0aW9uIGFuZCBjaGVj
ayB0aGF0IGl0Cj4+ICvCoMKgwqDCoCAqIGRvZXNuJ3QgdGFrZSBtb3JlIHRoYW4gMSBzZWMuCj4+
ICvCoMKgwqDCoCAqLwo+PiArCj4+ICvCoMKgwqAgbm9kZXMgPSB2emFsbG9jKGFycmF5X3NpemUo
bWF4X2NvdW50LCBzaXplb2YoKm5vZGVzKSkpOwo+PiArwqDCoMKgIGlmICghbm9kZXMpCj4+ICvC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4gKwo+PiArwqDCoMKgIGRybV9tbV9pbml0KCZtbSwg
MSwgVTY0X01BWCAtIDIpOwo+PiArCj4+ICvCoMKgwqAgZm9yIChtb2RlID0gaW5zZXJ0X21vZGVz
OyBtb2RlLT5uYW1lOyBtb2RlKyspIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0YXJ0ID0gamlmZmll
czsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG1heF9jb3VudDsgaSsr
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChqaWZmaWVzX3RvX21zZWNzKGppZmZp
ZXMgLSBzdGFydCkgPj0gdGltZW91dCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHByX2VycigiJXMgZnJhZ21lbnRlZCBpbnNlcnQgdG9vayBtb3JlIHRoYW4gJWx1IAo+PiBt
c2Vjc1xuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1vZGUtPm5hbWUsIHRpbWVvdXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gb3V0Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCFleHBlY3RfaW5zZXJ0KCZtbSwgJm5vZGVzW2ldLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSwgYWxpZ24sIGks
IG1vZGUpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCIlcyBp
bnNlcnQgZmFpbGVkIHdpdGggYWxpZ25tZW50PSVkIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUtPm5hbWUsIGFsaWduKTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBwcl9pbmZv
KCIlcyBmcmFnbWVudGVkIGluc2VydCB0b29rICVkIG1zZWNzXG4iLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtb2RlLT5uYW1lLCBqaWZmaWVzX3RvX21zZWNzKGppZmZpZXMgLSBzdGFydCkp
Owo+PiArwqDCoMKgwqDCoMKgwqAgZHJtX21tX2Zvcl9lYWNoX25vZGVfc2FmZShub2RlLCBuZXh0
LCAmbW0pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9tbV9yZW1vdmVfbm9kZShub2Rl
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIERSTV9NTV9CVUdfT04oIWRybV9tbV9jbGVhbigmbW0pKTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgY29uZF9yZXNjaGVkKCk7Cj4+ICvCoMKgwqAgfQo+PiAr
Cj4+ICvCoMKgwqAgcmV0ID0gMDsKPj4gK291dDoKPj4gK8KgwqDCoCBkcm1fbW1fZm9yX2VhY2hf
bm9kZV9zYWZlKG5vZGUsIG5leHQsICZtbSkKPj4gK8KgwqDCoMKgwqDCoMKgIGRybV9tbV9yZW1v
dmVfbm9kZShub2RlKTsKPj4gK8KgwqDCoCBkcm1fbW1fdGFrZWRvd24oJm1tKTsKPj4gK8KgwqDC
oCB2ZnJlZShub2Rlcyk7Cj4+ICtlcnI6Cj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4gK30KPj4g
Kwo+PiDCoCBzdGF0aWMgaW50IGlndF9hbGlnbih2b2lkICppZ25vcmVkKQo+PiDCoCB7Cj4+IMKg
wqDCoMKgwqAgY29uc3Qgc3RydWN0IGluc2VydF9tb2RlICptb2RlOwo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
