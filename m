Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EF17F13E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 08:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782056E7EC;
	Tue, 10 Mar 2020 07:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CDE6E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmHoNbure8Xdb6cOL/TiLYGueRYc9sr7cG6iAs2YSuNwJ+NiOuds9gaC4hkmZIweot3pBtiTe3EjJbVoh24oOmu8ZDp8q+A1fwOlzcNC8Vq1oTa1ZRVOZYxnvNctG2p8/VBOS/H1k2DxRjHTDiAa2uJ0YS12fjJRe60mNAyocwZM7AQBCGbqz1zFUZUUaTAfDhZIt97QZcUuBksrimOwbyFXDL2SYOFadtpGSEiLXYeYBF0/UdO/yIphWFCPN8kDu5FXBWhxUVFuF/ZeQvjNT68CzHfCVIwkXc5SBd09in0EvvBTMiWawNhdb73PM+mDDeKd0TXKtVchatpw/7B9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Lky3f02INaUg7IP+MbEab/5fGIo6kazlvlJiNdBaLU=;
 b=Nj9lY4xdayd/oeKyZTYk2ZHRXuKNk3XWFcQtrbEw9HPz5lOHvI9YUWewPrGpdN02VQLR+ba4RZbqbyYvaSo3JyNcA2RQ+cAdrGlJ/HU6oxjC9ma8HyIYN+U/5KDEcbamd4EAsHnT8c+/2ba+I+GKaDAn2KyBgpZk8E+MMUHouGJvA8DT3Jt3WngggUwyK2/kLzKAYBuw8k8zcHFSKie6P/0eaQJjtatdmoUu6dtfSVlKPxRbdd0+TfhxUwOuZms4/8NiTgLfj0h19qU3zHG0YH2+T5f+to04OP9HQ0VPTMILenauNHq7ENGJzfWkJ9LmOiDiq8IB7x5NERV5Bue8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Lky3f02INaUg7IP+MbEab/5fGIo6kazlvlJiNdBaLU=;
 b=WJHIyahdTl+6qgMdTw/jsd6vCl9NarmDpjpTXJ2hALnDX+1UObyAUe76/NVbGQUEKhz4N1VDUzLrUADBx5zv9HWcYN88fkKzaH9SfklOqHDkwucCgebC+t6n1oGf1MWTBZBKCLD/YfPNimWAlKuCyb8aTLCJKjIURYkz2At/nDU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
Received: from BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 by BL0PR12MB2579.namprd12.prod.outlook.com (2603:10b6:207:4d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 07:44:43 +0000
Received: from BL0PR12MB2420.namprd12.prod.outlook.com
 ([fe80::bc14:f6fc:614f:3dc6]) by BL0PR12MB2420.namprd12.prod.outlook.com
 ([fe80::bc14:f6fc:614f:3dc6%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 07:44:43 +0000
Subject: Re: [PATCH] drm/ttm: fix false positive assert
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
References: <20200306124155.1995-1-christian.koenig@amd.com>
 <84724c95-1fdb-314e-19b2-03a6f0865f26@gmail.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <62288fb0-8453-6319-8b32-a516e17f6f9b@amd.com>
Date: Tue, 10 Mar 2020 08:44:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
In-Reply-To: <84724c95-1fdb-314e-19b2-03a6f0865f26@gmail.com>
Content-Language: fr
X-ClientProxiedBy: PR3P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::7) To BL0PR12MB2420.namprd12.prod.outlook.com
 (2603:10b6:207:4c::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.234] (109.190.135.109) by
 PR3P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Tue, 10 Mar 2020 07:44:41 +0000
X-Originating-IP: [109.190.135.109]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 152f9f1c-f6a5-4052-6e51-08d7c4c6e569
X-MS-TrafficTypeDiagnostic: BL0PR12MB2579:|BL0PR12MB2579:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB25798D55CAC2B5F6560F1FE78DFF0@BL0PR12MB2579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(199004)(189003)(31686004)(81156014)(478600001)(81166006)(2616005)(2906002)(8676002)(36756003)(26005)(966005)(16576012)(8936002)(186003)(956004)(6666004)(316002)(6486002)(66556008)(86362001)(66946007)(16526019)(110136005)(31696002)(66476007)(53546011)(6636002)(52116002)(55236004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2579;
 H:BL0PR12MB2420.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVzwDgufqv+T8EME8YDyE+/vtwfkIwrDOX1zHgc2+COWveJIRpplTTKE9F8B7AmD3XwlLP0J0PIZssZuxUYoKWFJCod8eLjcpid3ZgdWi/0ZtvAS3vW/o5EHgmx1N9wG/Sg8wzdJkLIoGthYdUuF/Bn4idmM9VkjMulHNZE2l/iy3ZpX5gvWz4vycBtPjY7IVOwCw9eHGQ1aHAbL2Tg4LDx5L1imqvwOMpxNdqODVnXm/M1BCCccwwkIeK0JWUhkBJIJJMIxoXWVacJroSOftIl0nsgnTOv7B9CT6hWcIikaTeEoyIL5iVgDaJHcyJfOZrdyU4EU7bqGGdvM7U7JjfNybs4m99fNG12BrWqcg0w/hEmCl+E43EvlsnT7avnDNv2SK22X2tq8gFiipstdwRKOojt0PvJfbbi11HJ3sG3njktbtqUBfoxN9d1qpt9RSNdxoOLJSTF7NGqiAvw7wi7RWhURnsgL+8fzLppEMNfxIRuSe2ZH/q8n6fDyoDBwoLdOCg009h8g/XSTETXrVQ==
X-MS-Exchange-AntiSpam-MessageData: 94b0omvQkLa3u4TViLKHOMuDD454jLN7JfwYM9eX9CqWdux+QSso4SuL3q0r41/DH1BVXuQknSUmuWDA9YLq2yFStAUhFY1eLrzh2NfLqHqfGpcr1PBP5vY1Q62TWA7Hz3YZn4mK7ka84W+cGNJziQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152f9f1c-f6a5-4052-6e51-08d7c4c6e569
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 07:44:42.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX0e/6199JetHX6UX3kBb+7IuTREQmR2ciI+lHw5r9d2uzfXxIvg0qLOE5beZ3QejBMWN8BGNJLpQfoXKnRDmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2579
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKU29ycnkgSSBtaXNzZWQgeW91ciBvcmlnaW5hbCBlbWFpbC4gSSBqdXN0
IHRlc3RlZCB0aGUgcGF0Y2ggYW5kIGl0IHdvcmtzIGZpbmUsCnNvIGZlZWwgZnJlZSB0byBhZGQg
bXkgVGVzdGVkLWJ5IHRhZy4KClBpZXJyZS1FcmljCgpPbiAwOS8wMy8yMDIwIDEyOjQ5LCBDaHJp
c3RpYW4gS8O2bmlnIHdyb3RlOgo+IFBpZXJyZS1lcmljLCBqdXN0IGEgZ2VudGxlIHBpbmcgb24g
dGhpcz8gQ291bGQgSSBnZXQgYSB0ZXN0ZWQtYnk/Cj4gCj4gUmF5IGNhbiB5b3UgYWNrIG9yIGV2
ZW4gcmV2aWV3IHRoaXM/Cj4gCj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPiAKPiBBbSAwNi4wMy4y
MCB1bSAxMzo0MSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IFRoZSBhc3NlcnQgc29tZXRp
bWVzIGluY29ycmVjdGx5IHRyaWdnZXJzIHdoZW4gcGlubmVkIEJPcyBhcmUgZGVzdHJveWVkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNSArKy0t
LQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggMjQ0NWUyYmQ2MjY3Li5jYTVhOGQwMWZmMWYg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtMTUxLDggKzE1MSw2IEBAIHN0YXRpYyB2
b2lkIHR0bV9ib19hZGRfbWVtX3RvX2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+
PiDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Cj4+IMKg
wqDCoMKgwqAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW47Cj4+IMKgIC3CoMKgwqAg
ZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4+IC0KPj4gwqDCoMKgwqDCoCBp
ZiAoIWxpc3RfZW1wdHkoJmJvLT5scnUpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+
PiDCoCBAQCAtNjExLDcgKzYwOSw4IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVj
dCBrcmVmICprcmVmKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGJvLT5tZW0ucGxhY2VtZW50ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpIHsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPm1lbS5wbGFjZW1lbnQgJj0gflRUTV9QTF9G
TEFHX05PX0VWSUNUOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fbW92ZV90b19s
cnVfdGFpbChibywgTlVMTCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9ib19kZWxf
ZnJvbV9scnUoYm8pOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fYWRkX21lbV90
b19scnUoYm8sICZiby0+bWVtKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKg
wqDCoMKgwqDCoMKgIGtyZWZfaW5pdCgmYm8tPmtyZWYpOwo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
