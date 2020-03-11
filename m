Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21B181B95
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73EA89E19;
	Wed, 11 Mar 2020 14:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441CD89E19;
 Wed, 11 Mar 2020 14:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzLI/y4qpvQo8/rC+hQFtqK4hAllEMPWiTfoUs8rPZyhgGmXppPVn86VYht2X/wbMS+8CrsXsrq5lf7lXpAQ4GB3eWVgsdf3xMljpOV1YBsZOJZEK1Pa1f0vlpsgTjhErmA/pGoOXkcPmzBTuYszdEl2ujTKdADJROznR/o6hgfTStG1efoNQm03lfVptOwRTmrrm6Ijc1izDwtNJ0TSNppgmCqGvoH6nMkAgw/fjpZpJraSkdFyMDFDD57DlBoZRpSAVQ8hrmfP1RkpwmQok/63/4v/+hTuq64Xsy1amu5Ib/Tr9IWKZvkJC2h+4szKoi7eKQUuq9o/fkDI2FLm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+wrH1NLJu2jZOInMMcl9PEa7iEn6Na6frkVaicUDWg=;
 b=WOre0dwdKq1KeGy9u3hrMWHrtAlD0HVrPKc0OEU+PUWXXLvC7IvRpRPrQAIDVJg2ToMP7o926bjDyZtUp5VmYqBrSaLf2a77RC6nenloJxq6kTy/Nhs5C5I7Wc319T+3veA8Jb9OpgM6liY0694ZkKugy5RmTbMFgdi6KCUQmlSiGxiYz1bYhj+KbHk/2ceF+RPy9f8PlHcbERjtcKK0BT+DFXCEcqhNaUTFZMB+RaG15rOOIDhN/8OZDZPePxKu1TD4LrLhRZrB0l7xFgViF9VpcvOrr4k/sgWe8Bbrb37akVTubHR99E7tWWlwRtvfwcCaJtBWEZ/Qw1y+uy5cdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+wrH1NLJu2jZOInMMcl9PEa7iEn6Na6frkVaicUDWg=;
 b=zfG5JnNcvrhtSbW81/h2HnfSRwfejsM6POgfyQYpRqUPGmB3yawPkE4D5YJ5TG+cxPH7WnOF8JOZW04q6A0zmbd1pSN3gvkV2DQlEaLgHuGedgcBKZWbdxwLFYAdm98h52wdAVSYolNtjunj/IK4F6y0MGuoejWdexnlvx1J9KU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2470.namprd12.prod.outlook.com (2603:10b6:4:b4::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 14:43:10 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.018; Wed, 11 Mar
 2020 14:43:10 +0000
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
 <20200311143835.GD31668@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <58916fcc-6d5e-4f6a-3de3-7bc90a4a5145@amd.com>
Date: Wed, 11 Mar 2020 15:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200311143835.GD31668@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0049.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0049.eurprd02.prod.outlook.com (2603:10a6:208:d2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18 via Frontend Transport; Wed, 11 Mar 2020 14:43:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d1c42f4-00fd-4292-0d55-08d7c5ca84e0
X-MS-TrafficTypeDiagnostic: DM5PR12MB2470:|DM5PR12MB2470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2470F92C1B8D4EAAA6A2EE2583FC0@DM5PR12MB2470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(199004)(4326008)(186003)(2906002)(6916009)(52116002)(8936002)(36756003)(8676002)(16526019)(81156014)(81166006)(31686004)(6486002)(66574012)(66476007)(86362001)(478600001)(316002)(5660300002)(66946007)(31696002)(66556008)(2616005)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2470;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5YFpL5Yxqyc0qea6fknjZqUS3wQu02gtnWiYu67lXasaRm99jiZnUQoBQibkd0/hagLdoJiG6xU1xuzk7SZ95HagUAN4nzJVF+gGVhlB49Z2Ip6t6RmxJleC1SeAdntthdtSciDzolDLvUDi/B0pf0Eua/z4wJhD0yq/T4V37zmbvStrZ0e5UnyqfaAR5xChh3/HH1tPqIdYOJk+ovzHDVwFf4VEI2sm3L9/bDRQ9FdQT9Al6lMz10rz5cQp5t2p4d/sng0JQY8ZhJrSnNvOqS0A0KAQuGoLXKYyJmaD/WGuuJDI3Hxp5Gnecb34x2CGtJSK1UrYrtjFnCUsOAL+M1ySbquzfKy2y3wyaxdgLE6vPoNduSEZdC7lF+nCgamZSR355AUeV2ckW3++8a81bPafv6QoDTjRemI++9HUHWqab2kvZiSUJgAq4+K6LIH
X-MS-Exchange-AntiSpam-MessageData: 4sG9lxBnxEVJQ9CX5TmSZG3SldzMnGUJKhxJc8VVSAEJX4uYrNNlUj/04paPX1m+01UyWlNvQhj6RVGxIKK35PX7ZPQFHTe1oGU9YKNjkF79IhDh2jyG6hGqTETGzZuWgT/ndqieyI0mYUNzRGlUQ1N9M5FC1+WFN52Pp/OfttbErRb0gdG5uu/udqo6ei1AtNp9dnvfCk+HLflJs1F4JQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1c42f4-00fd-4292-0d55-08d7c5ca84e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 14:43:10.5053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrE184/TbtJcY+I8XbxfX5cwwN/VDcEv2kthOaDErptpLO+kUHd8GMq6mXESvwfJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2470
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDMuMjAgdW0gMTU6Mzggc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gV2VkLCBN
YXIgMTEsIDIwMjAgYXQgMDM6MzM6MDFQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTEuMDMuMjAgdW0gMTU6MDQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBX
ZWQsIE1hciAxMSwgMjAyMCBhdCAwMjo1MTo1NlBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IENoZWNrIGlmIHdlIGNhbiBkbyBwZWVyMnBlZXIgb24gdGhlIFBDSWUgYnVzLgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFf
YnVmLmMgfCA0ICsrKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rt
YV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4+
PiBpbmRleCBhZWYxMmVlMmYxZTMuLmJiZjY3ODAwYzhhNiAxMDA2NDQKPj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCj4+Pj4gQEAgLTM4LDYgKzM4
LDcgQEAKPj4+PiAgICAjaW5jbHVkZSA8ZHJtL2FtZGdwdV9kcm0uaD4KPj4+PiAgICAjaW5jbHVk
ZSA8bGludXgvZG1hLWJ1Zi5oPgo+Pj4+ICAgICNpbmNsdWRlIDxsaW51eC9kbWEtZmVuY2UtYXJy
YXkuaD4KPj4+PiArI2luY2x1ZGUgPGxpbnV4L3BjaS1wMnBkbWEuaD4KPj4+PiAgICAvKioKPj4+
PiAgICAgKiBhbWRncHVfZ2VtX3ByaW1lX3ZtYXAgLSAmZG1hX2J1Zl9vcHMudm1hcCBpbXBsZW1l
bnRhdGlvbgo+Pj4+IEBAIC0xNzksNiArMTgwLDkgQEAgc3RhdGljIGludCBhbWRncHVfZG1hX2J1
Zl9hdHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPj4+PiAgICAJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKPj4+PiAgICAJaW50
IHI7Cj4+Pj4gKwlpZiAocGNpX3AycGRtYV9kaXN0YW5jZV9tYW55KGFkZXYtPnBkZXYsICZhdHRh
Y2gtPmRldiwgMSwgdHJ1ZSkgPCAwKQo+Pj4+ICsJCWF0dGFjaC0+cGVlcjJwZWVyID0gZmFsc2U7
Cj4+Pj4gKwo+Pj4gQXJlIHRoZXJlIG90aGVyIHJlbGF0ZWQgcGF0Y2hlcyB0aGFuIHRoaXMgc2Vy
aWVzPwo+Pj4KPj4+IHAycCBkbWEgbWFwcGluZyBuZWVkcyB0byBiZSBkb25lIGluIGNvbW1vbiBj
b2RlLCBpbiBwMnBkbWEuYyAtIGllIHRoaXMKPj4+IG9wZW4gY29kaW5nIGlzIG1pc3NpbmcgdGhl
IGJ1c19vZmZzZXQgc3R1ZmYsIGF0IGxlYXN0Lgo+PiBZZWFoLCBJJ20gYXdhcmUgb2YgdGhpcy4g
QnV0IEkgY291bGRuJ3QgZmluZCBhIGJldHRlciB3YXkgZm9yIG5vdy4KPiBXZWxsLCBpdCBpc24n
dCBvcHRpb25hbCA6KQo+ICAgCj4+PiBJIHJlYWxseSBkbyBub3Qgd2FudCB0byBzZWUgZHJpdmVy
cyBvcGVuIGNvZGUgdGhpcyBzdHVmZi4KPj4+Cj4+PiBXZSBhbHJlYWR5IGhhdmUgYSBwMnBkbWEg
QVBJIGZvciBoYW5kbGluZyB0aGUgc3RydWN0IHBhZ2UgY2FzZSwgc28gSQo+Pj4gc3VnZ2VzdCBh
ZGRpbmcgc29tZSBuZXcgcDJwZG1hIEFQSSB0byBoYW5kbGUgdGhpcyBmb3Igbm9uLXN0cnVjdCBw
YWdlCj4+PiBjYXNlcy4KPj4+Cj4+PiBpZSBzb21lIHRoaW5nIGxpa2U6Cj4+Pgo+Pj4gaW50ICdw
MnBkbWEgbWFwIGJhcicoCj4+PiAgICAgIHN0cnVjdCBwY2lfZGV2aWNlICpzb3VyY2UsCj4+PiAg
ICAgIHVuc2lnbmVkIGludCBzb3VyY2VfYmFyX251bWJlciwKPj4+ICAgICAgc3RydWN0IHBjaV9k
ZXZpY2UgKmRlc3QsCj4+PiAgICAgIHBoeXNhZGRyJmxlbiAqYXJyYXlfb2Zfb2Zmc2V0cyAmIGxl
bmd0aCBwYWlycyBpbnRvIHNvdXJjZSBiYXIsCj4+PiAgICAgIHN0cnVjdCBzY2F0dGVybGlzdCAq
b3V0cHV0X3NnbCkKPj4gV2VsbCB0aGF0J3MgZXhhY3RseSB3aGF0IEkgaGF2ZSB0byBhdm9pZCBz
aW5jZSBJIGRvbid0IGhhdmUgdGhlIGFycmF5IG9mCj4+IG9mZnNldHMgYXJvdW5kIGFuZCB3YW50
IHRvIGF2b2lkIGNvbnN0cnVjdGluZyBpdC4KPiBNYXliZSBpdCBkb2Vzbid0IG5lZWQgYW4gYXJy
YXkgb2Ygb2Zmc2V0cyAtIGp1c3QgYSBzaW5nbGUgb2Zmc2V0IGFuZAo+IGNhbGxlcnMgY2FuIGl0
ZXJhdGUgdGhlIEFQST8KClllcywgdGhhdCB3b3VsZCBvZiBjb3Vyc2Ugd29yayBhcyB3ZWxsLgoK
QnV0IEkgd2FzIGFzc3VtaW5nIHRoYXQgcDJwZG1hX21hcF9iYXIoKSBuZWVkcyBzb21lIHN0YXRl
IGJldHdlZW4gdGhvc2UgCmNhbGxzLgoKPgo+PiBTaW1pbGFyIHByb2JsZW0gZm9yIGRtYV9tYXBf
cmVzb3VyY2UoKS4gTXkgZXhhbXBsZSBkb2VzIHRoaXMgb24gZGVtYW5kLCBidXQKPj4gZXNzZW50
aWFsbHkgd2UgYWxzbyBoYXZlIHVzZSBjYXNlcyB3aGVyZSB0aGlzIGlzIGRvbmUgb25seSBvbmNl
Lgo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHBvcnRhYmxlLiBEb2VzIGFueSBJT01NVSBIVyBu
ZWVkIHRvIGtub3cgUDJQCj4gaXMgaGFwcGVuaW5nIHRvIHNldHVwIHN1Y2Nlc3NmdWxseT8gV2Ug
Y3VycmVudGx5IHN1cHBvcnQgc3VjaCBhIG5hcnJvdwo+IHNjb3BlIG9mIEhXIGZvciBQMlAuLgoK
T24gdGhlIEFNRCBoYXJkd2FyZSBJJ20gdGVzdGluZyB0aGlzIGNhbGxpbmcgZG1hX21hcF9yZXNv
dXJjZSgpIGFscmVhZHkgCnNlZW1zIHRvIHdvcmsgd2l0aCBJT01NVSBlbmFibGVkLiAoV2VsbCBh
dCBsZWFzdCBpdCBzZWVtZWQgc28gNm1vbnRoIGFnbyAKd2hlbiBJIGxhc3QgdGVzdGVkIHRoaXMp
LgoKPj4gSWRlYWxseSB3ZSB3b3VsZCBoYXZlIHNvbWUgZnVuY3Rpb24gdG8gY3JlYXRlIGFuIHNn
bCBiYXNlZCBvbiBzb21lIGFyYml0cmFyeQo+PiBjb2xsZWN0aW9uIG9mIG9mZnNldHMgYW5kIGxl
bmd0aCBpbnNpZGUgYSBCQVIuCj4gSXNuJ3QgdGhhdCB3aGF0IEkganVzdCBwcm9wb3NlZCBhYm92
ZSA/CgpZZXMsIGp1c3QgZGlkbid0IHRob3VnaHQgdGhhdCB0aGlzIHdvdWxkIGVhc2lseSBwb3Nz
aWJsZS4gSSB3aWxsIGRvdWJsZSAKY2hlY2sgdGhlIHAycGRtYSBjb2RlIGFnYWluLgoKVGhhbmtz
LApDaHJpc3RpYW4uCgo+Cj4gSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
