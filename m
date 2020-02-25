Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3916EEB9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E6B6EB9A;
	Tue, 25 Feb 2020 19:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9B36EB9A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 19:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BatMAKBtFr4SEieHwCIo9dp1aSzKIDfPDrL8u04wRmIdGAUC/ct+s5hkox6euU/lyT6+qvuqN0aESbf/KqFZUtJN4JlqUlq+UVHJz9qX+grVBkb4ga4u6JKddlNKdGOahl3m+T2uhHjtjH8YHRnE9ZjviBTi2nk8dI+lvihzZG6EC2uMYnuiCVap3I8oJ4Lhfm2kOA9X7wrRGV4GSY+ksYyZ6VmJPmolZjGt8EK8wTU5BxmcU3hcejqiPf+e6gzZyeg7dxIhQWU8zGVYRz9l4mjxqvjgXyLxb+jl6OQImlVcYOtG6pEe7kNVoYTwcB1KUbpLzHYjFOiRc1pPDfdYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtU6v/jCEZ2hu/8tfy4y3eHBCWQByApfdOOb+N1qRA0=;
 b=U61J+t7UP/Va8W5CS5iKgzz+uV0HTs3yTGjsmkRpprl8JpAIcN82S25u9giOf3QEuy/VL3IIN3nBlTJ7ksk7H2uBnqd9o6LZZJKCq2Ez90Rk3qcpmrGZ3bNDEzdU/ImnSZkHaMN+h0TgKAOCdA0DfhG7muGdCjbUgENhbexTxplLhLlmYFORx6QUO4JccTktaxzKZe/4+DztzqCGUeZd0R9kxhj5tXWNLV8qhqoa5vHUWvXSrMJVLdA4qRdU8gRlLqDi4TcV5OlXp9YPuotO/v0T7ZCXOCC54gfbqmvSNt3tezHsUWjVM4wldaeOF7TTHNvBO9FkKWMcz9wf1vv2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtU6v/jCEZ2hu/8tfy4y3eHBCWQByApfdOOb+N1qRA0=;
 b=1PgCMWXZpbHMAscrkrML7pp7tEkap85SSbLm5SKDzIM5Ef/iEdXQ4eZgYgx1u37/NYnHcT8Lo+6Xc7jy3jrECHQHRSe6KN6kRX/Zs1V+Crr9JZPTaw1jFmTbe/wNrBcGrwj/MUWtZjuca+uzUpnmKahq+h/ReVIof4gyFWSW5O4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 19:11:58 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Tue, 25 Feb
 2020 19:11:58 +0000
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
 <20200225172355.GO2363188@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <484ce316-55f2-b85e-a1e4-730db94f3fe3@amd.com>
Date: Tue, 25 Feb 2020 20:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200225172355.GO2363188@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.13 via Frontend
 Transport; Tue, 25 Feb 2020 19:11:55 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b69dfaa3-a790-410d-e8f1-08d7ba2695bf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1593:|DM5PR12MB1593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1593ECA93D70861682F8B59D83ED0@DM5PR12MB1593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(189003)(199004)(8676002)(110136005)(316002)(16526019)(6666004)(5660300002)(186003)(478600001)(86362001)(66476007)(8936002)(2906002)(31696002)(66946007)(36756003)(52116002)(66574012)(2616005)(66556008)(81156014)(6486002)(31686004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1593;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9O7QAB7YHVvHcpHVrF2a6vknygV3eGMwFSn28taGfUGHV1v9xN6NpCahLIRO8EneE83n3sDBqaUSS0+UlyGY7p28UMpnHVuT8sODqE7IRVVYKJUdMZhLlKTB10hG+qoknMN7q0wZlYaVFpBFdQR2jj5KZl/xV3a+fHzxuQCph2C8OvOBgcza/oQ4KDNFPrflIf//6dPCcsXh1L4zwnK8Zn7684a5n4fPePgf/ChV+3xZ4og6LT2I68rBz2OHbHiKiZxlAzqpM2OyvJQctcvI24ckVb6ACnxd7F8wY+Ovfqv9M7XeCz2XwMB6z08BaiexQPNfzqAFxdKQgk84aElDAqxuy4WXev/W5ERlQII0/QP5mSqn/YPAb/K+GY9bzMFSwttofbrP1XSLy7RHNAZVkDWy+jM3xnO6Zc2fHA1juUh/3lUMmdCg5nZjUaE1La0K
X-MS-Exchange-AntiSpam-MessageData: PFZpdjxEOePgsBso5/Cf7XYTOHqn8C2JT/lHpdXLwRTVWnLTs+r2AvLzKovtRXHwjGe3m2s9CXc4abfIhc3x/LbJXU9O1Una8n6/nyC14G8+9wxUDta7fY2b3wLu3TRg+61gltTrwjusvThfF5ls/7gz7PqQH2JgYcZD4jX9k1XZMOjUtu7YG6deo9cIZ103r9917Qh3ykQuQzgaQE8UxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69dfaa3-a790-410d-e8f1-08d7ba2695bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 19:11:58.2519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j0x8XM9HYcPM6bgeimA8Q1kvFMSb7zzuaRiXLzk3Y8jDjXRL0hiWmbk2VdQLXRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDIuMjAgdW0gMTg6MjMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFN1biwgRmVi
IDIzLCAyMDIwIGF0IDAxOjA0OjE1UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDIzLjAyLjIwIHVtIDEyOjU2IHNjaHJpZWIgUGFuLCBYaW5odWk6Cj4+PiBJZiBzaGFyZWQg
ZmVuY2UgbGlzdCBpcyBub3QgZW1wdHksIGV2ZW4gd2Ugd2FudCB0byB0ZXN0IGFsbCBmZW5jZXMs
IGV4Y2wgZmVuY2UgaXMgaWdub3JlZC4KPj4+IFRoYXQgaXMgYWJ2aW91c2x5IHdyb25nLCBzbyBm
aXggaXQuCj4+IFllYWggdGhhdCBpcyBhIGtub3duIGlzc3VlIGFuZCBJIGNvbXBsZXRlbHkgYWdy
ZWUgd2l0aCB5b3UsIGJ1dCBvdGhlcgo+PiBkaXNhZ3JlZS4KPj4KPj4gU2VlIHRoZSBzaGFyZWQg
ZmVuY2VzIGFyZSBtZWFudCB0byBkZXBlbmQgb24gdGhlIGV4Y2x1c2l2ZSBmZW5jZS4gU28gYWxs
Cj4+IHNoYXJlZCBmZW5jZXMgbXVzdCBmaW5pc2ggb25seSBhZnRlciB0aGUgZXhjbHVzaXZlIG9u
ZSBoYXMgZmluaXNoZWQgYXMgd2VsbC4KPj4KPj4gVGhlIHByb2JsZW0gbm93IGlzIHRoYXQgZm9y
IGVycm9yIGhhbmRsaW5nIHRoaXMgaXNuJ3QgbmVjZXNzYXJ5IHRydWUuIEluCj4+IG90aGVyIHdv
cmRzIHdoZW4gYSBzaGFyZWQgZmVuY2UgY29tcGxldGVzIHdpdGggYW4gZXJyb3IgaXQgaXMgcGVy
ZmVjdGx5Cj4+IHBvc3NpYmxlIHRoYXQgaGUgZG9lcyB0aGlzIGJlZm9yZSB0aGUgZXhjbHVzaXZl
IGZlbmNlIGlzIGZpbmlzaGVkLgo+Pgo+PiBJJ20gdHJ5aW5nIHRvIGNvbnZpbmNlIERhbmllbCB0
aGF0IHRoaXMgaXMgYSBwcm9ibGVtIGZvciB5ZWFycyA6KQo+IEkgdGhvdWdodCB0aGUgY29uc2Vu
c3VzIGlzIHRoYXQgcmVhc29uYWJsZSBncHUgc2NoZWR1bGVycyBhbmQgZ3B1IHJlc2V0Cj4gY29k
ZSBzaG91bGQgdHJ5IHRvIG1ha2UgcmVhbGx5LCByZWFsbHkgc3VyZSBpdCBvbmx5IGNvbXBsZXRl
cyBzdHVmZiBpbgo+IHNlcXVlbmNlPyBUaGF0J3MgYXQgbGVhc3QgbXkgdGFrZSBhd2F5IGZyb20g
dGhlIHN5bmNvYmogdGltZWxpbmUKPiBkaXNjdXNzaW9uLCB3aGVyZSB5b3UgY29udmluY2VkIG1l
IHdlIHNob3VsZG4ndCBqdXN0IGNyYXNoJmJ1cm4uCj4KPiBJIHRoaW5rIGFzIGxvbmcgYXMgeW91
ciBzY2hlZHVsZXIgaXMgY29tcGV0ZW50IGFuZCB5b3VyIGdwdSByZXNldCB0cmllcyB0bwo+IGxp
bWl0IGRhbWFnZSAoaS5lLiBraWxsIG9mZmVuZGluZyBjdHggdGVybWluYWxseSwgbWFyayBldmVy
eXRoaW5nIGVsc2UKPiB0aGF0IGRpZG4ndCBjb21wbGV0ZSBmb3IgcmUtcnVubmluZykgd2Ugc2hv
dWxkIGVuZCB1cCB3aXRoIGV2ZXJ5dGhpbmcKPiBjb21wbGV0aW5nIGluIHNlcXVlbmNlLiBJIGd1
ZXNzIGlmIHlvdSBkbyBraWxsIGEgbG90IG1vcmUgc3R1ZmYsIHRoZW4KPiB5b3UnZCBoYXZlIHRv
IHB1c2ggdGhlc2UgdGhyb3VnaCB5b3VyIHNjaGVkdWxlciBhcyBkdW1teSBqb2JzLCBpLmUuIHRo
ZXkKPiBzdGlsbCB3YWl0IGZvciB0aGVpciBkZXBlbmRlbmNpZXMsIGJ1dCB0aGVuIGFsbCB0aGV5
IGRvIGlzIHNldCB0aGUKPiBkbWFfZmVuY2UgZXJyb3IgYW5kIGNvbXBsZXRlIGl0LiBNYXliZSBz
b21ldGhpbmcgdGhlIGNvbW1vbiBzY2hlZHVsZXIKPiBjb3VsZCBkby4KClllcywgdGhhdCdzIGV4
YWN0bHkgaG93IHdlIGN1cnJlbnRseSBpbXBsZW1lbnQgaXQuIEJ1dCBJIHN0aWxsIHRoaW5rIAp0
aGF0IHRoaXMgaXMgbm90IG5lY2Vzc2FyeSB0aGUgYmVzdCBhcHByb2FjaCA6KQoKQW55d2F5IFhp
bmh1aSdzIHByb2JsZW0gdHVybmVkIG91dCB0byBiZSBkZWVwZXIuIFdlIHNvbWVob3cgYWRkIGFu
IG9sZCAKc3RhbGUgZmVuY2UgdG8gdGhlIGRtYV9yZXN2IG9iamVjdCBzb21ldGltZXMgYW5kIHRo
YXQgY2FuIHJlc3VsdCBpbiAKcXVpdGUgYSBidW5jaCBvZiBwcm9ibGVtcy4KCkknbSBjdXJyZW50
bHkgdHJ5aW5nIHRvIGh1bnQgZG93biB3aGF0J3MgZ29pbmcgd3JvbmcgaGVyZSBpbiBtb3JlIGRl
dGFpbC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IFJlZ2FyZHMsCj4+IENo
cmlzdGlhbi4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1k
LmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCA5ICsrKysr
LS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9kcml2
ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+Pj4gaW5kZXggNDI2NGU2NDc4OGM0Li40NGRjNjRjNTQ3
YzYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+Pj4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPj4+IEBAIC02MzIsMTQgKzYzMiwxNCBAQCBzdGF0
aWMgaW5saW5lIGludCBkbWFfcmVzdl90ZXN0X3NpZ25hbGVkX3NpbmdsZShzdHJ1Y3QgZG1hX2Zl
bmNlICpwYXNzZWRfZmVuY2UpCj4+PiAgICAgKi8KPj4+ICAgIGJvb2wgZG1hX3Jlc3ZfdGVzdF9z
aWduYWxlZF9yY3Uoc3RydWN0IGRtYV9yZXN2ICpvYmosIGJvb2wgdGVzdF9hbGwpCj4+PiAgICB7
Cj4+PiAtCXVuc2lnbmVkIHNlcSwgc2hhcmVkX2NvdW50Owo+Pj4gKwl1bnNpZ25lZCBpbnQgc2Vx
LCBzaGFyZWRfY291bnQsIGxlZnQ7Cj4+PiAgICAJaW50IHJldDsKPj4+ICAgIAlyY3VfcmVhZF9s
b2NrKCk7Cj4+PiAgICByZXRyeToKPj4+ICAgIAlyZXQgPSB0cnVlOwo+Pj4gICAgCXNoYXJlZF9j
b3VudCA9IDA7Cj4+PiAtCXNlcSA9IHJlYWRfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsKPj4+
ICsJbGVmdCA9IHNlcSA9IHJlYWRfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsKPj4+ICAgIAlp
ZiAodGVzdF9hbGwpIHsKPj4+ICAgIAkJdW5zaWduZWQgaTsKPj4+IEBAIC02NDcsNyArNjQ3LDcg
QEAgYm9vbCBkbWFfcmVzdl90ZXN0X3NpZ25hbGVkX3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwg
Ym9vbCB0ZXN0X2FsbCkKPj4+ICAgIAkJc3RydWN0IGRtYV9yZXN2X2xpc3QgKmZvYmogPSByY3Vf
ZGVyZWZlcmVuY2Uob2JqLT5mZW5jZSk7Cj4+PiAgICAJCWlmIChmb2JqKQo+Pj4gLQkJCXNoYXJl
ZF9jb3VudCA9IGZvYmotPnNoYXJlZF9jb3VudDsKPj4+ICsJCQlsZWZ0ID0gc2hhcmVkX2NvdW50
ID0gZm9iai0+c2hhcmVkX2NvdW50Owo+Pj4gICAgCQlmb3IgKGkgPSAwOyBpIDwgc2hhcmVkX2Nv
dW50OyArK2kpIHsKPj4+ICAgIAkJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gcmN1X2RlcmVm
ZXJlbmNlKGZvYmotPnNoYXJlZFtpXSk7Cj4+PiBAQCAtNjU3LDEzICs2NTcsMTQgQEAgYm9vbCBk
bWFfcmVzdl90ZXN0X3NpZ25hbGVkX3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB0ZXN0
X2FsbCkKPj4+ICAgIAkJCQlnb3RvIHJldHJ5Owo+Pj4gICAgCQkJZWxzZSBpZiAoIXJldCkKPj4+
ICAgIAkJCQlicmVhazsKPj4+ICsJCQlsZWZ0LS07Cj4+PiAgICAJCX0KPj4+ICAgIAkJaWYgKHJl
YWRfc2VxY291bnRfcmV0cnkoJm9iai0+c2VxLCBzZXEpKQo+Pj4gICAgCQkJZ290byByZXRyeTsK
Pj4+ICAgIAl9Cj4+PiAtCWlmICghc2hhcmVkX2NvdW50KSB7Cj4+PiArCWlmICghbGVmdCkgewo+
Pj4gICAgCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZV9leGNsID0gcmN1X2RlcmVmZXJlbmNlKG9i
ai0+ZmVuY2VfZXhjbCk7Cj4+PiAgICAJCWlmIChmZW5jZV9leGNsKSB7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
