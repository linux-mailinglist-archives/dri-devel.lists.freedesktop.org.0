Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC91E69BD
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 20:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABA66E1F5;
	Thu, 28 May 2020 18:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8263D6E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 18:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+sA2ODekeJY7Gs5Svnbe3qRT6D2w8lydihQfiTGuKjz49AHpivK9TRhI/+kmM41Tlt+85QORYv05+EJfYFgjn5ix2le573B9VDhs8GHq7DvVoFaHNiR199Yjiyuw+FaUHdj4f+x+PMI3FTbWc6Rg96o0byJouw2rELnV1hZ6YSynguWoV6VfjS1owC1gkUp723iGdyLs4WmwJnyOyqOlkmoI/DFDQNNXmSngX7ubYjTt9r2d1fcnRV5/gnywrDZxU3njzTHl89yo7F4QWrppL6lirp6ZKuX8hRotQ6eltBpBN6HC/tXPQph7Ixq9ZIt7TjdH2Y2iS/oxqILWmxQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7ttkiiQSZhlE7J3+OHm70DQrIQymcYdsGOtXNVilrg=;
 b=R0+j7SGwV0xkYetfD5TvWzXi+bZULpRl1KynqvhNNXLdDFRl67eLMwC2/GCqmaDl6FgRaBPhC3gn9snyjmnte5fcCTm/cgXi3fpsl//VOwcpi+Pjr5+xzVZyKQF7PqX2r3KrvTfmPjr3TPLoqw3xWTrgK1tgO7wWsf/9pT0C1AZkGmzBG911THOcaa/QjEcqSa1sd7aqo2iXWUUzX7Vt626sMHOX+xxnG/10cPZwMYRZQc+27HmZw8aJPqSWGdB8BNAKZxT5HGDiUPzmkJX03tMxhbu6y11WJa6hYrMsGwFy2TL6pntbKJALRSKDJ59BUSXbU873XFd1ZSg3GmllcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7ttkiiQSZhlE7J3+OHm70DQrIQymcYdsGOtXNVilrg=;
 b=os2ju4wqJ9BMy/JsnwhfoAs+r3SlOv9ZFQZ9bALTsCjs2hqlF/bYEHawbw1un9eeDax4GIAME+4D5/f0XDj84meTDFJ375cUWQ5XSOL8QK9wW1PkIVEIOyvSgSEcToqNy8P+QM0+qw/H3iG1RlUKOwG9/sfSZYge6+JwxPDH4oE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 18:49:35 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 18:49:35 +0000
Subject: Re: [PATCH] drm/mm: add ig_frag selftest
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200528130556.53275-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0a73e54e-10bd-d06b-d9a4-fcbf5b5571d6@amd.com>
Date: Thu, 28 May 2020 20:49:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200528130556.53275-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0067.eurprd03.prod.outlook.com
 (2603:10a6:207:5::25) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:207:5::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19 via Frontend Transport; Thu, 28 May 2020 18:49:34 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9091fdeb-67aa-4490-d544-08d80337ddd0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4201:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4201EE21A55A9ADDA1197AC3838E0@DM6PR12MB4201.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/NCG7d/6T9DVt8utooeAFadH5kvMxei72sw56avc17fOJKSYoxqwoYM/8LvbGQ7CH5xQqOSGoXXcCo1wQMG06KSvwXN7/5IG5tyL89N4cfkWYMNb8cr0W/7LifVQ8mzHE9teCPWpTP2T4jWCs2x76SAM0rBNNGf3TXhALaXjrcrvt+E0TBsfzX48iGFEt6qarVKU23BexCDvhznH8tnXFBc7Q7gngDqfcVxPQzYt+PoSlUKu48gyClY0y3xNQl7/eaXUWlmCks2rKU54zgbatoF46a7EkFFc/hG5GZCsAEdORxznL/VrMjQ5Lbzgx0uXtOBZaiawtsyWuWgOHsGO3OvOFSHCRQVMqOCPA93bog0Vxv+PCcQD4WJ7/msTQla
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(2616005)(16526019)(8676002)(8936002)(6666004)(6486002)(86362001)(31696002)(66946007)(66556008)(66476007)(31686004)(2906002)(5660300002)(36756003)(478600001)(316002)(52116002)(186003)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 93zwmJmYfIYxtQsmeNhmLGUlhO8mXUxArgLkdaGUR1aUJujMr+08mKy5178MOZyt+QnkLw3F3Ui9/M/7+Y+edD+kqHldkm+YaWGnFjwPYCLG5og0CnOanbcsI5pjb4zupoAPc7o0eXibTEdTuON5/NXBoPo5nWikpBtzB2cTasySTFKI8z9/F9kh+OJ7nJeNoaVGTx1YSnM9S6QSD7So1O5OcfXKDKdTFAFOFHV1z/L5eRYFiaccN52Yu9hvsOIFpnQ/3ZE9PR1HaYuo60tRK1Tp4qPeQqc9eiDcZej6wGenoaiUcXVwnBVtLlLHQBRNhQ+Ljbuz2bdKKBd7Fzebmas3ucdlgguqw1URBENZSRBSilZ3hQOz68rAmKCqrcqiut3BZREvCgzxQ86jmS0+s1fKdhwbAEQlAsv4HeZwqmj+rP0dK50Xnr9SPfGU4F+KmG/iph0uBSLdr+4ZiiSf/RIZxDZdRjSlLCh/w7GJOtIlnjOPc26Yyu4HIzF7VCqejSRV/pcPBM6Mv4B3a531f2rFofLPJVmEXzMK4lFXeUm4E+OeDSOrn/55IU3Wv4gD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9091fdeb-67aa-4490-d544-08d80337ddd0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 18:49:35.5039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XT/5RoI1a+7ZVIK4HzlvXhfYvMwW8oKa5vRzhLjV4kyAKo9VvqsL8Ig5erSJhi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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

QW0gMjguMDUuMjAgdW0gMTU6MDUgc2NocmllYiBOaXJtb3kgRGFzOgo+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBmcmFnbWVudGF0aW9uIGluIHRoZSBhZGRyZXNzIHJhbmdlCj4gYW5kIG1lYXN1cmVz
IHRpbWUgdGFrZW4gYnkgMTBrIGluc2VydGlvbnMgZm9yIGVhY2ggbW9kZXMuCj4KPiBpZ19mcmFn
KCkgd2lsbCBmYWlsIGlmIG9uZSBvZiB0aGUgbW9kZSB0YWtlcyBtb3JlIHRoYW4gMSBzZWMuCj4K
PiBPdXRwdXQ6Cj4gPHNuaXA+Cj4gWyAgIDM3LjMyNjcyM10gZHJtX21tOiBpZ3Rfc2FuaXR5Y2hl
Y2sgLSBvayEKPiBbICAgMzcuMzI2NzI3XSBpZ3RfZGVidWcgMHgwMDAwMDAwMDAwMDAwMDAwLTB4
MDAwMDAwMDAwMDAwMDIwMDogNTEyOiBmcmVlCj4gWyAgIDM3LjMyNjcyOF0gaWd0X2RlYnVnIDB4
MDAwMDAwMDAwMDAwMDIwMC0weDAwMDAwMDAwMDAwMDA2MDA6IDEwMjQ6IHVzZWQKPiBbICAgMzcu
MzI2NzI4XSBpZ3RfZGVidWcgMHgwMDAwMDAwMDAwMDAwNjAwLTB4MDAwMDAwMDAwMDAwMGEwMDog
MTAyNDogZnJlZQo+IFsgICAzNy4zMjY3MjldIGlndF9kZWJ1ZyAweDAwMDAwMDAwMDAwMDBhMDAt
MHgwMDAwMDAwMDAwMDAwZTAwOiAxMDI0OiB1c2VkCj4gWyAgIDM3LjMyNjczMF0gaWd0X2RlYnVn
IDB4MDAwMDAwMDAwMDAwMGUwMC0weDAwMDAwMDAwMDAwMDEwMDA6IDUxMjogZnJlZQo+IFsgICAz
Ny4zMjY3MzBdIGlndF9kZWJ1ZyB0b3RhbDogNDA5NiwgdXNlZCAyMDQ4IGZyZWUgMjA0OAo+IFsg
ICA1Ni4wNDAwNjRdIGRybV9tbTogYmVzdCBmcmFnbWVudGVkIGluc2VydCB0b29rIDUwNCBtc2Vj
cwo+IFsgICA1Ni4wODIxODRdIGRybV9tbTogYm90dG9tLXVwIGZyYWdtZW50ZWQgaW5zZXJ0IHRv
b2sgNDAgbXNlY3MKPiBbICAgNTYuMTAyMjU1XSBkcm1fbW06IHRvcC1kb3duIGZyYWdtZW50ZWQg
aW5zZXJ0IHRvb2sgMjAgbXNlY3MKPiBbICAgNTYuMTA3MTc3XSBkcm1fbW06IGV2aWN0IGZyYWdt
ZW50ZWQgaW5zZXJ0IHRvb2sgNCBtc2Vjcwo+IDxzbmlwPgo+Cj4gU2lnbmVkLW9mZi1ieTogTmly
bW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKT2ZmIGhhbmQgdGhhdCBsb29rcyBsaWtlIGl0
IHNob3VsZCB3b3JrLCBidXQgSSdtIHJlYWxseSBub3QgYW4gZXhwZXJ0IApmb3IgdGhlIGRybV9t
bSBjb2RlLgoKRmVlbCBmcmVlIHRvIGFkZCBhbiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAK
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4sIGJ1dCBJIHdvdWxkIGNvbnNpZGVyIGRvaW5nIHdo
YXQgQ2hyaXMgc2FpZCAKYXMgd2VsbC4KCkNocmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vc2VsZnRlc3RzL2RybV9tbV9zZWxmdGVzdHMuaCB8ICAxICsKPiAgIGRyaXZlcnMvZ3B1
L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fbW0uYyAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysr
KysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX21tX3NlbGZ0ZXN0cy5oIGIvZHJpdmVycy9n
cHUvZHJtL3NlbGZ0ZXN0cy9kcm1fbW1fc2VsZnRlc3RzLmgKPiBpbmRleCA2Yjk0M2VhMWM1N2Qu
LjhjODdjOTY0MTc2YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL2Ry
bV9tbV9zZWxmdGVzdHMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX21t
X3NlbGZ0ZXN0cy5oCj4gQEAgLTE0LDYgKzE0LDcgQEAgc2VsZnRlc3QoaW5zZXJ0LCBpZ3RfaW5z
ZXJ0KQo+ICAgc2VsZnRlc3QocmVwbGFjZSwgaWd0X3JlcGxhY2UpCj4gICBzZWxmdGVzdChpbnNl
cnRfcmFuZ2UsIGlndF9pbnNlcnRfcmFuZ2UpCj4gICBzZWxmdGVzdChhbGlnbiwgaWd0X2FsaWdu
KQo+ICtzZWxmdGVzdChmcmFnLCBpZ3RfZnJhZykKPiAgIHNlbGZ0ZXN0KGFsaWduMzIsIGlndF9h
bGlnbjMyKQo+ICAgc2VsZnRlc3QoYWxpZ242NCwgaWd0X2FsaWduNjQpCj4gICBzZWxmdGVzdChl
dmljdCwgaWd0X2V2aWN0KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMK
PiBpbmRleCA5YWFiZTgyZGNkM2EuLjRjMDhjYTg2YmI4NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKPiBAQCAtMTAzMyw2ICsxMDMzLDY1IEBAIHN0YXRpYyBp
bnQgaWd0X2luc2VydF9yYW5nZSh2b2lkICppZ25vcmVkKQo+ICAgCXJldHVybiAwOwo+ICAgfQo+
ICAgCj4gK3N0YXRpYyBpbnQgaWd0X2ZyYWcodm9pZCAqaWdub3JlZCkKPiArewo+ICsJY29uc3Qg
c3RydWN0IGluc2VydF9tb2RlICptb2RlOwo+ICsJc3RydWN0IGRybV9tbSBtbTsKPiArCXN0cnVj
dCBkcm1fbW1fbm9kZSAqbm9kZXMsICpub2RlLCAqbmV4dDsKPiArCXVuc2lnbmVkIGludCBzaXpl
ID0gNDA5NiwgYWxpZ24gPSA4MTkyOwo+ICsJdW5zaWduZWQgbG9uZyBzdGFydCwgdGltZW91dCA9
IDEwMDA7Cj4gKwljb25zdCB1bnNpZ25lZCBpbnQgbWF4X2NvdW50ID0gMTAwMDA7Cj4gKwl1bnNp
Z25lZCBpbnQgaTsKPiArCWludCByZXQgPSAtRUlOVkFMOwo+ICsKPiArCS8qIEZvciBlYWNoIG9m
IHRoZSBwb3NzaWJsZSBpbnNlcnRpb24gbW9kZXMsIHdlIHBhc3MgYW4gc2l6ZSwgYWxpZ25tZW50
Cj4gKwkgKiB2YWx1ZSB0aGF0IGlzIGtub3duIHRvIGludHJvZHVjZSBmcmFnbWVudGF0aW9uIGFu
ZCBjaGVjayB0aGF0IGl0Cj4gKwkgKiBkb2Vzbid0IHRha2UgbW9yZSB0aGFuIDEgc2VjLgo+ICsJ
ICovCj4gKwo+ICsJbm9kZXMgPSB2emFsbG9jKGFycmF5X3NpemUobWF4X2NvdW50LCBzaXplb2Yo
Km5vZGVzKSkpOwo+ICsJaWYgKCFub2RlcykKPiArCQlnb3RvIGVycjsKPiArCj4gKwlkcm1fbW1f
aW5pdCgmbW0sIDEsIFU2NF9NQVggLSAyKTsKPiArCj4gKwlmb3IgKG1vZGUgPSBpbnNlcnRfbW9k
ZXM7IG1vZGUtPm5hbWU7IG1vZGUrKykgewo+ICsJCXN0YXJ0ID0gamlmZmllczsKPiArCj4gKwkJ
Zm9yIChpID0gMDsgaSA8IG1heF9jb3VudDsgaSsrKSB7Cj4gKwkJCWlmIChqaWZmaWVzX3RvX21z
ZWNzKGppZmZpZXMgLSBzdGFydCkgPj0gdGltZW91dCkgewo+ICsJCQkJcHJfZXJyKCIlcyBmcmFn
bWVudGVkIGluc2VydCB0b29rIG1vcmUgdGhhbiAlbHUgbXNlY3NcbiIsCj4gKwkJCQkgICAgICAg
bW9kZS0+bmFtZSwgdGltZW91dCk7Cj4gKwkJCQlnb3RvIG91dDsKPiArCQkJfQo+ICsKPiArCQkJ
aWYgKCFleHBlY3RfaW5zZXJ0KCZtbSwgJm5vZGVzW2ldLAo+ICsJCQkJCSAgIHNpemUsIGFsaWdu
LCBpLCBtb2RlKSkgewo+ICsJCQkJcHJfZXJyKCIlcyBpbnNlcnQgZmFpbGVkIHdpdGggYWxpZ25t
ZW50PSVkIiwKPiArCQkJCSAgICAgICBtb2RlLT5uYW1lLCBhbGlnbik7Cj4gKwkJCQlnb3RvIG91
dDsKPiArCQkJfQo+ICsJCX0KPiArCj4gKwkJcHJfaW5mbygiJXMgZnJhZ21lbnRlZCBpbnNlcnQg
dG9vayAlZCBtc2Vjc1xuIiwKPiArCQkJbW9kZS0+bmFtZSwgamlmZmllc190b19tc2VjcyhqaWZm
aWVzIC0gc3RhcnQpKTsKPiArCQlkcm1fbW1fZm9yX2VhY2hfbm9kZV9zYWZlKG5vZGUsIG5leHQs
ICZtbSkKPiArCQkJZHJtX21tX3JlbW92ZV9ub2RlKG5vZGUpOwo+ICsJCURSTV9NTV9CVUdfT04o
IWRybV9tbV9jbGVhbigmbW0pKTsKPiArCj4gKwkJY29uZF9yZXNjaGVkKCk7Cj4gKwl9Cj4gKwo+
ICsJcmV0ID0gMDsKPiArb3V0Ogo+ICsJZHJtX21tX2Zvcl9lYWNoX25vZGVfc2FmZShub2RlLCBu
ZXh0LCAmbW0pCj4gKwkJZHJtX21tX3JlbW92ZV9ub2RlKG5vZGUpOwo+ICsJZHJtX21tX3Rha2Vk
b3duKCZtbSk7Cj4gKwl2ZnJlZShub2Rlcyk7Cj4gK2VycjoKPiArCXJldHVybiByZXQ7Cj4gK30K
PiArCj4gICBzdGF0aWMgaW50IGlndF9hbGlnbih2b2lkICppZ25vcmVkKQo+ICAgewo+ICAgCWNv
bnN0IHN0cnVjdCBpbnNlcnRfbW9kZSAqbW9kZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
