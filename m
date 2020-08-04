Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0323BADF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 15:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2246E2B4;
	Tue,  4 Aug 2020 13:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F336E2B4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 13:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auQ3mZ2vRILtn1G+YexZW6OeQeAq5IHcBLnm+aeZ9ksog4kkOGh8zgzI7oHLz4CNxFwJSu1sFR8ED0oXUAoSOHGthyosMO8Vr+3+CAAl1IRZQbezQ3OKmAn6eoSkbuc5LpJmo3tUsc7jv/u183gvt3KAFliTw0KlsGUyGE7UUaMg3teRdLMIc8OpTjJ36GTZrJiZJR2QZb6mbr13OkfFexZLQjru4R6ObBZ018RzIOJwWcTfLGkaz7X0rkc8mUK4D2wiHU+0WkRO7jZRp6UUWDaI1wmaawm/yGwEk8Chck09t04GLChgM63kVHHSwUMcwrxXFuv7F95ssG39pAS/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGQgR04ORhFcjTX83dEETfFgr/CBAjhFF0Y1y76DpXg=;
 b=AkdSzaxx33ssigejdr14+yMXBnF+cQ3ZlCAwHer8bWIlND+Vwa6yC3oEhD+E9zosmfv7/vD+W8sPfRq8tPAgsRF/DHH1nwdedpv48kJZnxEnJg1azRbjoMDxzqbEDf0a69WUEBzbAd2EfNzm8r1wLhL0Bdjjj+vcuzbRzIKIewMV3og//iD++AkNElkGRjgipxlvG6u+X1kIz4RLhiM8JM6OSK2BNuplOWbbnfJaCR1i8I+oaOiDDguKzhO20AJ7EqW95z55A0KG8PjawpOMR7+ICuy0Y6eC7FHaF5j42yHzQdBK0VlxlBIrzhPzZSrvz/+j2KlpKHSjlCfiQ6jEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGQgR04ORhFcjTX83dEETfFgr/CBAjhFF0Y1y76DpXg=;
 b=JjB0k/wC3uxDlWsqUR5BYpEHZVn5mlSc/RsBhdnp40nws5peitwCi5Tvgvxf3A6xirL4HXYCZmGR+CQMga5+XBHpH9uZ9TuDtuqloCrUGrKLG1wRu7HB+FJ6kILd5PzJs8bOiHwJkE4XOEogjaNakjODFIiDeEG5Z9IRsHiZHk4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 13:08:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 13:08:26 +0000
Subject: Re: [PATCH 13/59] drm/ttm: split the mm manager init code (v2)
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-14-airlied@gmail.com>
 <fd000454-d526-d604-9597-c1132d5a7d3b@amd.com>
Message-ID: <c43b31c2-65b2-7754-d703-c72dc7bac5ea@amd.com>
Date: Tue, 4 Aug 2020 15:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fd000454-d526-d604-9597-c1132d5a7d3b@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18 via Frontend Transport; Tue, 4 Aug 2020 13:08:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fdcf1d0-5873-4497-7eef-08d8387778fe
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42540B29D3AC9EE4C035A933834A0@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U08yiwTq3uGCCMP6P+pza+73NjKLPmrU2ONaMsQTP9ZuPU6c+GgMa7VRKAC/6BYH7dHum0Cz5c2bP3YPcuqkEC+7nzwvq/9/4c47FqAima9dnToKUT1B1l5dOZsOVpr5FwGMxTDT7iDii3bI1zD1NcHWLyoIOObLHjOPbTqXSlcjewJciXN8CXbvB+JQddj5AV+IqO8yT3JBpmi0B6abfTEjxiAK2nBL2zYEdih44BiCyYan9SY/i+LLh17+ZaWb3/Xfom7QiArbQna2GgRKa3rSH96TvZKDODrub73qi7RWOu5m42bRXQFUKUeUg37YXGc1jn912ocDSxCLfBjDTzsWZ/aqdTl4ypzNE8PLDoC04+B+WkjyKdG2Avhw5cRXKl4SYP49xphz06Ca1IWfJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(6666004)(2616005)(5660300002)(8676002)(478600001)(86362001)(316002)(2906002)(66476007)(16526019)(31686004)(8936002)(36756003)(66946007)(186003)(66556008)(52116002)(83380400001)(31696002)(66574015)(4326008)(6486002)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: myjwVhOByAkwO4O/TNYplklH9nXBPZ+HwCUVDXBy2qBS1am/wYq3XP+j07uiZp+vK+cJ6+99w2Kr7Ag1Jw4NXaBk41GAZgAIH7LVkScUD5WxRMdl0uzWq1n/JsXNe9ImeYhs6+01QFG9CbVpvV5TfCIY+jFznBAuX1egj9WhEAWMbx2/gU4qG/9N8v1jPncNkw6XUarnq9dgySGSby/n2lMzZj7dww8lnw0j52rZGrBVWR+HyhavQgg5DxP5XvhuEmWhqYdNMACMhOO40+lZOmk/dKNCSGsENvWKzN/zZbXhAK8X4ZSiy+G7JkHqygyfMsYgmraAmL71AtIkU8NWAG3yCXOCbqqLvhtPlVf2WoAxC33Rk488r2ah8cbt1XSnuYK0uP46do5/xd7cz5EZe8cCpivMP6jQaqS09JY5FLLIY1jPp1/xhB4qPmKtU6BGNu9ySIibcKPGBYBhXXZFpHBdUTjUFneVhhe966shDEXiwGCwBC1dnz72XckXVrOL5e8VyO9UsPVbLVmGY6034BBPSYHtu8ookyh4r9XnahhVdjJuOxZgN0YKODmtlPgi1K+rljMaU1yWe411R61nsfcYOKHN3VrkHbqHlGt9VqEm7/m5iPHkcyD+3M9WakrlmHxG18ROWGCdPl2DkbEVSmRjZ6Ftg0R0CHOzLP6Q1KDlf4G9neMD0sDWRn0DpUn7s1SINPpnkpMUUaHNi+2zog==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdcf1d0-5873-4497-7eef-08d8387778fe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 13:08:26.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J87xntn+HRTkeB/iPUOFCC7KZaDuOyE8Yp5R+BU7qp1/2uGxb9PwVg+cqkDv36tE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMTM6MDcgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDA0LjA4
LjIwIHVtIDA0OjU1IHNjaHJpZWIgRGF2ZSBBaXJsaWU6Cj4+IEZyb206IERhdmUgQWlybGllIDxh
aXJsaWVkQHJlZGhhdC5jb20+Cj4+Cj4+IFRoaXMgd2lsbCBhbGxvdyB0aGUgZHJpdmVyIHRvIGNv
bnRyb2wgdGhlIG9yZGVyaW5nIGhlcmUgYmV0dGVyLgo+Pgo+PiBFdmVudHVhbGx5IHRoZSBvbGQg
cGF0aCB3aWxsIGJlIHJlbW92ZWQuCj4+Cj4+IHYyOiBhZGQgZG9jcyBmb3IgbmV3IEFQSXMuCj4+
IHJlbmFtZSBuZXcgcGF0aCB0byB0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0L3NldF91c2VkKGZv
ciBub3cpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgoKCkJUVzogSSd2ZSBqdXN0IG5vdGljZWQgdGhhdCB5b3UgKG1vc3QgbGlrZWx5KSBh
Y2NpZGVudGFsbHkgYWRkZWQgYSB0YWIgCmFmdGVyIGV2ZXJ5IHVzZSBvZiB0dG1fbWVtX3R5cGVf
bWFuYWdlcl9zZXRfdXNlZCgpIGluIHRoZSBmb2xsb3cgdXAgcGF0Y2hlcy4KCk5vdCBzdXJlIHdo
ZXJlIHRoaXMgaXMgY29taW5nIGZyb20sIGJ1dCBpdCBhbm5veXMgY2hlY2twYXRjaCBxdWl0ZSBh
IGJpdCA6KQoKQ2hyaXN0aWFuLgoKCj4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmPCoMKgwqAgfCAzNCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4g
wqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaMKgwqDCoCB8IDE1ICsrKysrKysrKysrKysr
Kwo+PiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgMTUgKysrKysrKysrKysr
KysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCAyYWM3MGVjMWYzN2QuLjMwMGJjYzEw
Njk2YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IEBAIC0xNTA5LDM1ICsxNTA5LDQxIEBA
IGludCB0dG1fYm9fZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgCj4+ICpiZGV2LCB1bnNp
Z25lZCBtZW1fdHlwZSkKPj4gwqAgfQo+PiDCoCBFWFBPUlRfU1lNQk9MKHR0bV9ib19ldmljdF9t
bSk7Cj4+IMKgIC1pbnQgdHRtX2JvX2luaXRfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHVuc2lnbmVkIHR5cGUsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
cF9zaXplKQo+PiArdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcF9zaXplKQo+PiDCoCB7Cj4+IC3CoMKgwqAg
aW50IHJldDsKPj4gLcKgwqDCoCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbjsKPj4g
wqDCoMKgwqDCoCB1bnNpZ25lZCBpOwo+PiDCoCAtwqDCoMKgIEJVR19PTih0eXBlID49IFRUTV9O
VU1fTUVNX1RZUEVTKTsKPj4gLcKgwqDCoCBtYW4gPSAmYmRldi0+bWFuW3R5cGVdOwo+PiDCoMKg
wqDCoMKgIEJVR19PTihtYW4tPmhhc190eXBlKTsKPj4gwqDCoMKgwqDCoCBtYW4tPnVzZV9pb19y
ZXNlcnZlX2xydSA9IGZhbHNlOwo+PiDCoMKgwqDCoMKgIG11dGV4X2luaXQoJm1hbi0+aW9fcmVz
ZXJ2ZV9tdXRleCk7Cj4+IMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJm1hbi0+bW92ZV9sb2Nr
KTsKPj4gwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmbWFuLT5pb19yZXNlcnZlX2xydSk7Cj4+
IMKgwqDCoMKgwqAgbWFuLT5iZGV2ID0gYmRldjsKPj4gLQo+PiAtwqDCoMKgIGlmICh0eXBlICE9
IFRUTV9QTF9TWVNURU0pIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9ICgqbWFuLT5mdW5jLT5p
bml0KShtYW4sIHBfc2l6ZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiAtwqDCoMKgIH0KPj4gLcKgwqDCoCBtYW4t
Pmhhc190eXBlID0gdHJ1ZTsKPj4gLcKgwqDCoCBtYW4tPnVzZV90eXBlID0gdHJ1ZTsKPj4gwqDC
oMKgwqDCoCBtYW4tPnNpemUgPSBwX3NpemU7Cj4+IMKgIMKgwqDCoMKgwqAgZm9yIChpID0gMDsg
aSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIElOSVRf
TElTVF9IRUFEKCZtYW4tPmxydVtpXSk7Cj4+IMKgwqDCoMKgwqAgbWFuLT5tb3ZlID0gTlVMTDsK
Pj4gK30KPj4gK0VYUE9SVF9TWU1CT0wodHRtX21lbV90eXBlX21hbmFnZXJfaW5pdCk7Cj4+IMKg
ICtpbnQgdHRtX2JvX2luaXRfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVk
IHR5cGUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcF9zaXplKQo+
PiArewo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICvCoMKgwqAgc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW47Cj4+ICsKPj4gK8KgwqDCoCBCVUdfT04odHlwZSA+PSBUVE1fTlVNX01FTV9U
WVBFUyk7Cj4+ICvCoMKgwqAgdHRtX21lbV90eXBlX21hbmFnZXJfaW5pdChiZGV2LCAmYmRldi0+
bWFuW3R5cGVdLCBwX3NpemUpOwo+PiArCj4+ICvCoMKgwqAgaWYgKHR5cGUgIT0gVFRNX1BMX1NZ
U1RFTSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gKCptYW4tPmZ1bmMtPmluaXQpKG1hbiwg
cF9zaXplKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqAgfQo+PiArwqDCoMKgIHR0bV9tZW1fdHlwZV9t
YW5hZ2VyX3NldF91c2VkKG1hbiwgdHJ1ZSk7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKg
IH0KPj4gwqAgRVhQT1JUX1NZTUJPTCh0dG1fYm9faW5pdF9tbSk7Cj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGku
aAo+PiBpbmRleCBhOWUxM2IyNTI4MjAuLjg5MDUzZTc2MWE2OSAxMDA2NDQKPj4gLS0tIGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2FwaS5oCj4+IEBAIC01NCw2ICs1NCw4IEBAIHN0cnVjdCB0dG1fcGxhY2U7Cj4+IMKgIMKgIHN0
cnVjdCB0dG1fbHJ1X2J1bGtfbW92ZTsKPj4gwqAgK3N0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
cjsKPj4gKwo+PiDCoCAvKioKPj4gwqDCoCAqIHN0cnVjdCB0dG1fYnVzX3BsYWNlbWVudAo+PiDC
oMKgICoKPj4gQEAgLTUzMSw2ICs1MzMsMTkgQEAgaW50IHR0bV9ib19jcmVhdGUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsIAo+PiB1bnNpZ25lZCBsb25nIHNpemUsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdWludDMyX3QgcGFnZV9hbGlnbm1lbnQsIGJvb2wgaW50ZXJydXB0aWJsZSwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKipwX2Jv
KTsKPj4gwqAgKy8qKgo+PiArICogdHRtX21lbV90eXBlX21hbmFnZXJfaW5pdAo+PiArICoKPj4g
KyAqIEBiZGV2OiBQb2ludGVyIHRvIGEgdHRtX2JvX2RldmljZSBzdHJ1Y3QuCj4+ICsgKiBAbWFu
OiBtZW1vcnkgbWFuYWdlciBvYmplY3QgdG8gaW5pdAo+PiArICogQHBfc2l6ZTogc2l6ZSBtYW5h
Z2VkIGFyZWEgaW4gcGFnZXMuCj4+ICsgKgo+PiArICogSW5pdGlhbGlzZSBjb3JlIHBhcnRzIG9m
IGEgYSBtYW5hZ2VyIG9iamVjdC4KPj4gKyAqLwo+PiArdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdl
cl9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcF9zaXpl
KTsKPj4gKwo+PiDCoCAvKioKPj4gwqDCoCAqIHR0bV9ib19pbml0X21tCj4+IMKgwqAgKgo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCAKPj4gYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+IGluZGV4IDczZjVkOWM3NjZjYy4uNmI0OWMwMzU2
MzQzIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+ICsr
KyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4gQEAgLTY3OCw2ICs2NzgsMjEg
QEAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib191bnJlc2VydmUoc3RydWN0IAo+PiB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pCj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJl
c3YpOwo+PiDCoCB9Cj4+IMKgICsvKioKPj4gKyAqIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91
c2VkCj4+ICsgKgo+PiArICogQG1hbjogQSBtZW1vcnkgbWFuYWdlciBvYmplY3QuCj4+ICsgKiBA
dXNlZDogdXNhZ2Ugc3RhdGUgdG8gc2V0Lgo+PiArICoKPj4gKyAqIFNldCB0aGUgbWFuYWdlciBp
biB1c2UgZmxhZy4gSWYgZGlzYWJsZWQgdGhlIG1hbmFnZXIgaXMgbm8gbG9uZ2VyCj4+ICsgKiB1
c2VkIGZvciBvYmplY3QgcGxhY2VtZW50Lgo+PiArICovCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQg
dHRtX21lbV90eXBlX21hbmFnZXJfc2V0X3VzZWQoc3RydWN0IAo+PiB0dG1fbWVtX3R5cGVfbWFu
YWdlciAqbWFuLCBib29sIHVzZWQpCj4+ICt7Cj4+ICvCoMKgwqAgbWFuLT5oYXNfdHlwZSA9IHRy
dWU7Cj4+ICvCoMKgwqAgbWFuLT51c2VfdHlwZSA9IHVzZWQ7Cj4+ICt9Cj4+ICsKPj4gwqAgLyoK
Pj4gwqDCoCAqIHR0bV9ib191dGlsLmMKPj4gwqDCoCAqLwo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
