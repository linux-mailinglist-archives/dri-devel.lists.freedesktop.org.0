Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DA205F7C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 22:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E96E446;
	Tue, 23 Jun 2020 20:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E536E198;
 Tue, 23 Jun 2020 20:40:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSb50AcM+VMJWs8bBxSPU62fbc6P4n6DbmTHidOeDiUapzV6i42a1KSx3SO01MtqPjnqlG8hk7vGO3yY7da587knZZerkWAJRdT7KYTt+WxMUtj1KFUfMksHDX3/nXx0Ip+3D9R4k2/hFzY52/gGv+ojPvF+cAmcmIiIQzRY1EQOpYB9xh3rfVYwOaCLyDYhDgoYrOlN+uX4v277LJ2fWZSHjQZG8wRDcBO72JCmDyYhJp5Se+oVF8fz9qXQM7IXhYWo3NWqd6vnPHBu8COZhO83exB0Vs/eqVnwBEDke1h9tjj0BUp3Z+13cOEqvA8Pj5l5HGgnyqIyLbmimewUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1nbJ2IyEeTDOYfPR3PSP4zkaz7uaxyFk3aPsK3t/Gs=;
 b=KC5lGDHF+8BGWDvuszVoUZ8Q616uOhuKSQOLlX+PaZ/rtWFaA3c1BzybBQHotwUHzvOy+QPXOzPWqhY1/l6lmWwepsOZ9tdwnatzk9KHUjF+WCivuTpzDScrno16QBHeE875+l9vfWq/oUbnzKd7jyzx8hsbcJDRnnNUjxBWn+Rtvxak1C0Wqg8U3ET/mBP7Ry7DZw3vCOg6bCmYLhmKp2rEY1s71ANDUOS9EHvPhcNbYRmA/FWIsw83rLR4oUq39g1e+qWp3Qp1fp6it1JUcSlNVzfjF6gtktIGRSyiWJqqSI5OhwGW0ID2eT4Qp9NYpWjLTYOaWqy2VCNIzNokuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1nbJ2IyEeTDOYfPR3PSP4zkaz7uaxyFk3aPsK3t/Gs=;
 b=X85CBh4lTkoJQfESJ2/v3bXi98IJscvUAUIBXVtVTYakMrIqe32xr8C2xVJHceNJtnUtezKIkG/914qvo63v1oaFQNNxkiZ+t3vNn11+uRNPZghuvTW+h+Foyo1RDRNYHKM9Ouu1ZdXSOcVYEP8A1ZyWvboyMs0nE/nob3msEtA=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 20:40:06 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Tue, 23 Jun 2020
 20:40:06 +0000
Subject: Re: [PATCH v2] drm/amd: fix potential memleak in err branch
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200620085407.21922-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <44839e7c-2b97-a06f-b1c8-af3fa3d52e13@amd.com>
Date: Tue, 23 Jun 2020 16:40:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200620085407.21922-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::20) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YQXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:14::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Tue, 23 Jun 2020 20:40:05 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f314ea3-10f6-4950-fded-08d817b59caf
X-MS-TrafficTypeDiagnostic: SA0PR12MB4525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4525440A80C6C5F88A0B900D92940@SA0PR12MB4525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kd3QFKOIEN9imQwaa58gHZ0AfjaL3URfb6zwv3m01ZQaAlhc/z+5bhdEx33rpDW8aIxDOVDKJj6XsJ2LYq0PUWhzI/JRc84CSXKCjAiG2mOjHzoxWjbswYtUh8TgDucdBFI5XolYkQROEDz+DGd3IshK9cbSeNLNVW4/+8dvHlDC1r2PjNeKW/jZI7ryle5qhUucVGCGWGwB3SIEhyx2MRHJq2W1dHS0E1Tuwyx2eQkKn9Dw8hmVTpurC7558EtUk97pWZWssahK5GFQZDS6+JkjVdd/vk6QeVcdOVvtaeAqLKzIx8DfLVtBYznpg2z2uu8p1jS4sME0tbkYjVS963MLvj+RjASdRJB0KWFN6w+UvBH/RCfgQyaAa9kANJPJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(8936002)(498600001)(5660300002)(2906002)(6666004)(66946007)(66476007)(66556008)(8676002)(52116002)(44832011)(6486002)(31686004)(2616005)(956004)(36756003)(4326008)(31696002)(16526019)(186003)(16576012)(110136005)(86362001)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sjraJlb8BXBWHSqEl3PnOsYt8Dt/lO2sjSONTjZjshcgSS4tmjQKRY4PUUNXoM5WGANw9M/0fkvGGQF9bxtRh5v+hGH0k8XU2ZWpZb9kjit/F17B6tRvFs/Ema+F+T56SCa3iRIBCqCQJSEb7xVq0S5/TJj8gcFMRF1fOH4/pFG32q5ZehYNPtWQVia+/FWdTaR1ko6fiE6GwypD2myTtnWgArDSVos4Ha8r60Rfpmf1FXUjZYepeRWy+9eMYVT+2K5aU79PzWTeXfymSkOPmaLkVRqdx3LBZqBrzG4UHXZDursKyOD7jwdBobKiS6VF6ZkIBYe8B2XDJ3rT6lZNqY+dc2bwtHQaX0PycP1ItxfNSE/xfROsgye5aLLzd+51mWYi3SDOO86WlnxyZ0sqOejV0J9RZxeffJVjjsXmd8Pu8fB3ZC1MXRiWjyQVRxMaq8IxZq4EUPuaHDy918y3mrTyq8nArFyt08RXBTjreGJtd4fCqn3PKb79jereBUM5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f314ea3-10f6-4950-fded-08d817b59caf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 20:40:06.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rykK2pa1oy7Bz0dGSdQew4DTENaDcyMgo4Y6RRloiFPcuZ/dNmFyYYPoJYEKzglqdir11eLLZMdfUHJz5yejdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjAtMDYtMjAgdW0gNDo1NCBhLm0uIHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+IFRoZSBm
dW5jdGlvbiBrb2JqZWN0X2luaXRfYW5kX2FkZCBhbGxvYyBtZW1vcnkgbGlrZToKPiBrb2JqZWN0
X2luaXRfYW5kX2FkZC0+a29iamVjdF9hZGRfdmFyZy0+a29iamVjdF9zZXRfbmFtZV92YXJncwo+
IC0+a3Zhc3ByaW50Zl9jb25zdC0+a3N0cmR1cF9jb25zdC0+a3N0cmR1cC0+a21hbGxvY190cmFj
a19jYWxsZXIKPiAtPmttYWxsb2Nfc2xhYiwgaW4gZXJyIGJyYW5jaCB0aGlzIG1lbW9yeSBub3Qg
ZnJlZS4gSWYgdXNlCj4ga21lbWxlYWssIHRoaXMgcGF0aCBtYXliZSBjYXRjaGVkLgo+IFRoZXNl
IGNoYW5nZXMgYXJlIHRvIGFkZCBrb2JqZWN0X3B1dCBpbiBrb2JqZWN0X2luaXRfYW5kX2FkZAo+
IGZhaWxlZCBicmFuY2gsIGZpeCBwb3RlbnRpYWwgbWVtbGVhay4KPgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KClRoZSBwYXRjaCBpcwoKUmV2aWV3ZWQt
Ynk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgoKSSdsbCBhcHBseSBp
dCB0byBhbWQtc3RhZ2luZy1kcm0tbmV4dC4KClRoYW5rcywKwqAgRmVsaXgKCj4gLS0tCj4gQ2hh
bmdlcyBzaW5jZSBWMToKPiAqUmVtb3ZlIGR1cGxpY2F0ZSBjaGFuZ2VkIGZpbGUga2ZkX3RvcG9s
b2d5LmMsIHRoaXMgZmlsZWBzIGZpeAo+IGFscmVhZHkgYXBwbGllZCB0byB0aGUgbWFpbiBsaW5l
Lgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgMiAr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBpbmRleCBkMjcyMjFkZGNkZWIuLjVlZTRkNmNmYjE2
ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IEBAIC0x
MjQsNiArMTI0LDcgQEAgdm9pZCBrZmRfcHJvY2ZzX2luaXQodm9pZCkKPiAgCWlmIChyZXQpIHsK
PiAgCQlwcl93YXJuKCJDb3VsZCBub3QgY3JlYXRlIHByb2NmcyBwcm9jIGZvbGRlciIpOwo+ICAJ
CS8qIElmIHdlIGZhaWwgdG8gY3JlYXRlIHRoZSBwcm9jZnMsIGNsZWFuIHVwICovCj4gKwkJa29i
amVjdF9wdXQocHJvY2ZzLmtvYmopOwo+ICAJCWtmZF9wcm9jZnNfc2h1dGRvd24oKTsKPiAgCX0K
PiAgfQo+IEBAIC00MjgsNiArNDI5LDcgQEAgc3RydWN0IGtmZF9wcm9jZXNzICprZmRfY3JlYXRl
X3Byb2Nlc3Moc3RydWN0IGZpbGUgKmZpbGVwKQo+ICAJCQkJCSAgIChpbnQpcHJvY2Vzcy0+bGVh
ZF90aHJlYWQtPnBpZCk7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlwcl93YXJuKCJDcmVhdGluZyBw
cm9jZnMgcGlkIGRpcmVjdG9yeSBmYWlsZWQiKTsKPiArCQkJa29iamVjdF9wdXQocHJvY2Vzcy0+
a29iaik7Cj4gIAkJCWdvdG8gb3V0Owo+ICAJCX0KPiAgCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
