Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5028F6CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 18:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344496ED8D;
	Thu, 15 Oct 2020 16:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633966ED88
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 16:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbuRt07AT1qcA9xfIknZ0nz8vr/3dJEi04W7hGdPnc9gRZ9yB15LWxfLFvqBZrI5bS/oaZRKYjaimVHsJXkO5DelUivhC6v42q5q5VVpWxo5K51gqBJMn85j9H4SnyLcO5Qqp3I45n2KRJc/0iT/834pCl0zFdCS8YGweS4XVJzs0N4gwqTAYt7V+deGE/wBKm8T590VKOKYj8cNDLkdPtrDfkkwsaNi1wqMyFZC7l7M+JAF4I9qvwtAanP+UhAknxQu3r7yIZ6eWANnlxQtkCu/uJ2eShbRoAyFEjEjfabANr8E5tJ04PS+ieTx8cXGgpwR8d9RULrj3adwpl4y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ktphmCmhn5MbN64FLj978WmpHUMi7g09O453FLsAs=;
 b=eY0iZ1dktlDb8FVLRc5pm7TkG0FfjNVjnxkhCVK1muWKvfqnHAXRG6uBLL3WI2IkF8uCYd+X3zXYWK79QeVXH7YXVxBi4Q5BE6AXUGFxsY4EFbN02zGH+uU16aIxQEQU8KZHmodUzHVodkUtOlROzPegjC+wFxeWCL95Z9H8K7fi89T468anGZuRTDKaNS7YdkBjq2n7v02a30caAUFKRMsEiJOy1I77OQu3ZdWX2Fa5lhy/pTUuoYcldd/f5eogmk2OJh6xr95xH6joBv97242AgC7R91D4oE0nRaPBVNnyCUWfj47xEkoOtUNYgAgByyCirrUDX5KM6Fbq5s0wZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ktphmCmhn5MbN64FLj978WmpHUMi7g09O453FLsAs=;
 b=StHOjFyTHsV2iqzMXpVNyZw8nzJyozjKWf6R8t/Vf3dUleA83GPp647QE25h0L9qZ55jJ8gDYEFu1v6aBXAu1P4TLmkIkmKAbDvL6kKGNErX1X7s0b97AZvMNm7YvaJPVJhVWemutJTyTkSsQ3JSDKEstqXh3JiX7ZRPd1kDwuU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 15 Oct
 2020 16:31:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 16:31:49 +0000
Subject: Re: [PATCH v4 5/5] dma-buf: Clarify that dma-buf sg lists are page
 aligned
To: Daniel Vetter <daniel@ffwll.ch>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <1602692161-107096-1-git-send-email-jianxin.xiong@intel.com>
 <20201015160344.GA401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5d7609d0-5548-eab7-b170-c420f6cb3de3@amd.com>
Date: Thu, 15 Oct 2020 18:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015160344.GA401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [46.114.105.76]
X-ClientProxiedBy: AM4PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:205:1::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (46.114.105.76) by
 AM4PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:205:1::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.9 via Frontend Transport; Thu, 15 Oct 2020 16:31:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a2a3b9a-98e2-4959-fe66-08d87127d088
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4797F2FBB0D9B4947B8A63D583020@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VCXjbZPPrmKsrbVgIdvDiX5hqooncuVngQi1u7NXrpSZIxpLpz3xwJiPoOX+eX/F3pwk/l+wUlYlG/hm6scOHs4/HtwS49DLWAyS+zh9g/fzMfILqhK8/BCLbzZq2BEe50etXribafM3PqpqbK9TYSTqQmKQI1VsrYr7DwGvOZQk8dnwroU0qRBq6VAKNyev13dqLB7MJ7kAY1vut3YtqD/K46UIEZQVarhukN6V9hmYRkOId8/lybZe5+3jkc86oMQRyPRbEbYCvcK436WPTUM1FEthZVh04bkRNaVwNeOf+wFyGnOsyjIhgjMQsA2rFyIQPhTCjQHVQolx+RtQJmFo5eeY+wm0F6XdnobR1n2aQ1WlMYho6fV3jGClvD7eFiASSTGrZfSYPSBnDFwy3Pc+8YgO//W6r+vQijApTKCPCP5ojldwRTZdwcSxN4qFntOW1OOkNN+fosWZQDDeng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(66574015)(31696002)(5660300002)(6486002)(83380400001)(86362001)(66556008)(66946007)(6666004)(66476007)(36756003)(26005)(54906003)(8676002)(31686004)(16526019)(45080400002)(316002)(956004)(16576012)(52116002)(186003)(110136005)(2616005)(34490700002)(2906002)(4326008)(7416002)(478600001)(966005)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rM8l8uf/Yd0cqJJo6bI4ltHpBvsW8cqk4R1HOOsr3JLc+IKtTtHZ+K/PK3XaLh9eU8+Q2dW71+G3hWvReMHLDm2epNCKLpl3TaV20CvhEBWF9juZKbtymB7XsM+/igNOPD20mtpwE15oQEXkMEOuwKFDFtVg7J6Ip9ftd59BERJgOyXkShlOGqb2w4ymIq1Ds0NtpGzB67Dt0TshJKhq7t0fBdlj1iiaJf+/Wm0rgNDTjX6jyUBKrZzAbwDe0/xQ2dCQ4YRmDyd7QdmZ+6C7S4IVXOyeAklv4gg5+MoxaT/aDSkLwEbLyGJaZEFbQFf/Z7GURXcoJNmrse1kSguD3+u5GYck6ofNYuIbgtklUEE1EeVFf8an+4+9S7F0u98FXwCn24yBXS0TuNdktzQowZrSc8FVlMp+iCAsl/0UJP6WKjJaw9ymWQvyx2i/gESDS6aSvwrb7iU6LIXgJt8Zkm4FKHnkPivN6cht0RfghYeuFbCncDbgyqfsMAoh6fzcLSxsmLxDqA2T0K1s2xbuI7ZPEO4/M+jS9W0Kwfs3mLQJGoEHnk8+COyxK3shnsCU2NNZjkRMHc0pj9rPbXbLXDoIhDuYLc9QZJ4G3G7JinHBCeKESfujs6T6FjS3UrIos3It9sgOJx6IpnCs+GFlRg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2a3b9a-98e2-4959-fe66-08d87127d088
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 16:31:49.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6v0hs5bed+SYOHAVxkakmwVOlUtEy+drvRxqlHfYNWv6zV9mExj5bnIHSD89P5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMTAuMjAgdW0gMTg6MDMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgT2N0
IDE0LCAyMDIwIGF0IDA5OjE2OjAxQU0gLTA3MDAsIEppYW54aW4gWGlvbmcgd3JvdGU6Cj4+IFRo
ZSBkbWEtYnVmIEFQSSBoYXZlIGJlZW4gdXNlZCB1bmRlciB0aGUgYXNzdW1wdGlvbiB0aGF0IHRo
ZSBzZyBsaXN0cwo+PiByZXR1cm5lZCBmcm9tIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKSBhcmUg
ZnVsbHkgcGFnZSBhbGlnbmVkLiBMb3RzIG9mCj4+IHN0dWZmIGNhbiBicmVhayBvdGhlcndpc2Ug
YWxsIG92ZXIgdGhlIHBsYWNlLiBDbGFyaWZ5IHRoaXMgaW4gdGhlCj4+IGRvY3VtZW50YXRpb24g
YW5kIGFkZCBhIGNoZWNrIHdoZW4gRE1BIEFQSSBkZWJ1ZyBpcyBlbmFibGVkLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFueGluIFhpb25nIDxqaWFueGluLnhpb25nQGludGVsLmNvbT4KClJldmll
d2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IGxn
dG0sIHRoYW5rcyBmb3IgY3JlYXRpbmcgdGhpcyBhbmQgZ2l2aW5nIGl0IGEgc3Bpbi4KPgo+IEkn
bGwgcXVldWUgdGhpcyB1cCBpbiBkcm0tbWlzYy1uZXh0IGZvciA1LjExLCBzaG91bGQgc2hvdyB1
cCBpbiBsaW51eC1uZXh0Cj4gYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdyBpcyBjbG9zZWQuCgpUaGFu
a3MsIEknbSBjdXJyZW50bHkgd2l0aG91dCBsYW5kbGluZSBpbnRlcm5ldCBhbmQgbmVlZCB0byBy
ZWx5IG9uIG15IAptb2JpbGUuCgpDaHJpc3RpYW4uCgo+Cj4gQ2hlZXJzLCBEYW5pZWwKPgo+PiAt
LS0KPj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMjEgKysrKysrKysrKysrKysrKysr
KysrCj4+ICAgaW5jbHVkZS9saW51eC9kbWEtYnVmLmggICB8ICAzICsrLQo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMK
Pj4gaW5kZXggODQ0OTY3Zi4uNzMwOWM4MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYwo+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4+IEBAIC04NTEs
NiArODUxLDkgQEAgdm9pZCBkbWFfYnVmX3VucGluKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQg
KmF0dGFjaCkKPj4gICAgKiBSZXR1cm5zIHNnX3RhYmxlIGNvbnRhaW5pbmcgdGhlIHNjYXR0ZXJs
aXN0IHRvIGJlIHJldHVybmVkOyByZXR1cm5zIEVSUl9QVFIKPj4gICAgKiBvbiBlcnJvci4gTWF5
IHJldHVybiAtRUlOVFIgaWYgaXQgaXMgaW50ZXJydXB0ZWQgYnkgYSBzaWduYWwuCj4+ICAgICoK
Pj4gKyAqIE9uIHN1Y2Nlc3MsIHRoZSBETUEgYWRkcmVzc2VzIGFuZCBsZW5ndGhzIGluIHRoZSBy
ZXR1cm5lZCBzY2F0dGVybGlzdCBhcmUKPj4gKyAqIFBBR0VfU0laRSBhbGlnbmVkLgo+PiArICoK
Pj4gICAgKiBBIG1hcHBpbmcgbXVzdCBiZSB1bm1hcHBlZCBieSB1c2luZyBkbWFfYnVmX3VubWFw
X2F0dGFjaG1lbnQoKS4gTm90ZSB0aGF0Cj4+ICAgICogdGhlIHVuZGVybHlpbmcgYmFja2luZyBz
dG9yYWdlIGlzIHBpbm5lZCBmb3IgYXMgbG9uZyBhcyBhIG1hcHBpbmcgZXhpc3RzLAo+PiAgICAq
IHRoZXJlZm9yZSB1c2Vycy9pbXBvcnRlcnMgc2hvdWxkIG5vdCBob2xkIG9udG8gYSBtYXBwaW5n
IGZvciB1bmR1ZSBhbW91bnRzIG9mCj4+IEBAIC05MDQsNiArOTA3LDI0IEBAIHN0cnVjdCBzZ190
YWJsZSAqZG1hX2J1Zl9tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICph
dHRhY2gsCj4+ICAgCQlhdHRhY2gtPmRpciA9IGRpcmVjdGlvbjsKPj4gICAJfQo+PiAgIAo+PiAr
I2lmZGVmIENPTkZJR19ETUFfQVBJX0RFQlVHCj4+ICsJewo+PiArCQlzdHJ1Y3Qgc2NhdHRlcmxp
c3QgKnNnOwo+PiArCQl1NjQgYWRkcjsKPj4gKwkJaW50IGxlbjsKPj4gKwkJaW50IGk7Cj4+ICsK
Pj4gKwkJZm9yX2VhY2hfc2d0YWJsZV9kbWFfc2coc2dfdGFibGUsIHNnLCBpKSB7Cj4+ICsJCQlh
ZGRyID0gc2dfZG1hX2FkZHJlc3Moc2cpOwo+PiArCQkJbGVuID0gc2dfZG1hX2xlbihzZyk7Cj4+
ICsJCQlpZiAoIVBBR0VfQUxJR05FRChhZGRyKSB8fCAhUEFHRV9BTElHTkVEKGxlbikpIHsKPj4g
KwkJCQlwcl9kZWJ1ZygiJXM6IGFkZHIgJWxseCBvciBsZW4gJXggaXMgbm90IHBhZ2UgYWxpZ25l
ZCFcbiIsCj4+ICsJCQkJCSBfX2Z1bmNfXywgYWRkciwgbGVuKTsKPj4gKwkJCX0KPj4gKwkJfQo+
PiArCX0KPj4gKyNlbmRpZiAvKiBDT05GSUdfRE1BX0FQSV9ERUJVRyAqLwo+PiArCj4+ICAgCXJl
dHVybiBzZ190YWJsZTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1Zl9tYXBf
YXR0YWNobWVudCk7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2lu
Y2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4+IGluZGV4IGEyY2EyOTRlLi40YTVmYTcwIDEwMDY0NAo+
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2Rt
YS1idWYuaAo+PiBAQCAtMTQ1LDcgKzE0NSw4IEBAIHN0cnVjdCBkbWFfYnVmX29wcyB7Cj4+ICAg
CSAqCj4+ICAgCSAqIEEgJnNnX3RhYmxlIHNjYXR0ZXIgbGlzdCBvZiBvciB0aGUgYmFja2luZyBz
dG9yYWdlIG9mIHRoZSBETUEgYnVmZmVyLAo+PiAgIAkgKiBhbHJlYWR5IG1hcHBlZCBpbnRvIHRo
ZSBkZXZpY2UgYWRkcmVzcyBzcGFjZSBvZiB0aGUgJmRldmljZSBhdHRhY2hlZAo+PiAtCSAqIHdp
dGggdGhlIHByb3ZpZGVkICZkbWFfYnVmX2F0dGFjaG1lbnQuCj4+ICsJICogd2l0aCB0aGUgcHJv
dmlkZWQgJmRtYV9idWZfYXR0YWNobWVudC4gVGhlIGFkZHJlc3NlcyBhbmQgbGVuZ3RocyBpbgo+
PiArCSAqIHRoZSBzY2F0dGVyIGxpc3QgYXJlIFBBR0VfU0laRSBhbGlnbmVkLgo+PiAgIAkgKgo+
PiAgIAkgKiBPbiBmYWlsdXJlLCByZXR1cm5zIGEgbmVnYXRpdmUgZXJyb3IgdmFsdWUgd3JhcHBl
ZCBpbnRvIGEgcG9pbnRlci4KPj4gICAJICogTWF5IGFsc28gcmV0dXJuIC1FSU5UUiB3aGVuIGEg
c2lnbmFsIHdhcyByZWNlaXZlZCB3aGlsZSBiZWluZwo+PiAtLSAKPj4gMS44LjMuMQo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0
cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRl
dmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzU4ZWU4
NzEyMDQxZTRlNzQyZmU0MDhkODcxMjNlOTcwJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0
ZTE4M2QlN0MwJTdDMCU3QzYzNzM4Mzc0NjM1MTM0NjYwMyU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1Fd0FFVmNKYTZnYm9ITUVRNlhVeW1DJTJCdGpG
b1dkMHdsOFlVeXpkblY1TjglM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
