Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264D21EF86
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 13:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846196E311;
	Tue, 14 Jul 2020 11:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE126E1E2;
 Tue, 14 Jul 2020 11:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSeIc3z/NY4eYsU9X9g9Wh/2JQy3q/HJeBf8BnO6GAIknbT2ggGw3ro7u9DLZfuk9T1oa+D7N8dR+KBxQDEY4dyAaLOF12I6lxyqth1+oryT8DQWxccJhgRQ+wp9bC/bVWT410XPT9/nKYF2DlkSfOXi4qrJHoz8AwQrNM5Ab1kGH6jP97Y3wvaQEOvoJCEQLxgIQPN7W6XGJJGU1ORgM4N8y8Ih/695yRNa96lS3tlH4nIA41AVW5vcLZ+kSRF5QESETSI9TGnwrpvvv5wWuzR7rEnYUEFmVkdGK59QXM1yszuyaX3bU5b4zMNHwx7yarq9tJDpiy+d96tQ82SLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hzMVLOPut+jJ7MKav9e4O+GJOdFo4l7xEOk6tjx0Ok=;
 b=OphCxHhvfQ4DhQj69lL8zqjJACWlj/9BI/iNsPiE10NMqeWjfgZ/pCKdb6XnA/ovhvKdEblFAU8BrYEg3GnjHJAdQiP4QklIiqOnsYm7vdt0ESY2Ajoa+HXwCRvW3F//9RxNcWTNP9SU+5gHnPLyik+07GuXF7Rt3IBom3E4CcGaDMd+qfn7gS1QPtfY19h0GSzi9ndPYSrGWdE5ekSqAKkF0+yAF0+S9JF7FBCN1T8YScYK/NBZwwW/R4YGQdwj94T6UNeONaAk2hD5/IxsGc4HoXcTbtkQf8FGjNPhWgSNLIYDpSubldHKycFfr46VVaotBc/hfTjo6/p/lKUwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hzMVLOPut+jJ7MKav9e4O+GJOdFo4l7xEOk6tjx0Ok=;
 b=Br/TZGo//3EGVr8szeBcvydEkJrm5qP6PQYL+OBWctciiyari37GMm+0I4hNW5ma2AcTMolgu6/7ztIo2aEx/uE8kKEI/iPC2DlUqtloS6ppFvkLAesE+nu7pcC0NZfEtyDTXMqsRn9u5R04tfhSfP+FPjNIPcsVacIhVQZaiho=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 11:40:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3195.017; Tue, 14 Jul 2020
 11:40:17 +0000
Subject: Re: [PATCH 19/25] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler
 code
To: Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-20-daniel.vetter@ffwll.ch>
 <20200714104910.GC3278063@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d3e85f62-e427-7f1c-0ff4-842ffe57172e@amd.com>
Date: Tue, 14 Jul 2020 13:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200714104910.GC3278063@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.9 via Frontend Transport; Tue, 14 Jul 2020 11:40:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53a416dd-bee2-4dd5-2076-08d827eaae41
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518AAE6DE82510F0DA318EE83610@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxlP2AKtDWUvPfOb1A9XDfeXzN+QercWnh0F73Mojx2whoJIkPaSoydmypFOwKutBs7Ma6D7Ue1Rz+gb0P6cufs19pU3X7ztjnqkmgoklsdky+swd4DV2PZGtJNs5651I0Ekf6AntxP0pS7rxMureMgWK4+PWZx6SE1LN4Bkl8fKnmbs5kT5Xd8gAvbxxkQiu1srTJCjphFp/XxJKVZnKcRt1fjypwVfc8FeBtXi5om1eURuF5bs8W32isK54pZM0tigcIwypiJHRlw4lg+1ccpuHvlnC5QdAUWuxVUFxRe/G6MPNb6SNH8lBf5C4j31UD+SqPnS/UZybOF3TsoAQVb64k1udAKZKxKHhopHY4ikv7feupikrWgcqC8LlSIY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(6666004)(66574015)(54906003)(110136005)(86362001)(8676002)(4326008)(66946007)(66556008)(186003)(316002)(16526019)(478600001)(2616005)(52116002)(7416002)(36756003)(66476007)(2906002)(5660300002)(83380400001)(31686004)(6486002)(31696002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tCJjKSQoGgm/m9kDXpSTgyRwePM9ia7dDj+MbziyemCJZwGBDPKH0buFORfhdIxvP5a3OhoRbCGK+wcUgND2IGtccYAbVrkfvuPQIdlpAgmp3eFQjY7UCsmvLG77mWhoE++16gAV7XCVGHkddz0th5gqL9k0I1Re0OgJY1ovt1gthpHyoGE1fXj7dcFg5L7SCkw9A30/csBm4asWgrZYtkPCzGtKAHoZPAayBeIRWx07MEP5Mtzh1QAY+vUUfqS5ie4j1Na5YDsghhvyyTbvaoZVHjvEagccwWQ4OWo7vDy0LHk3lmBmzUZVlUYvpEtzNgvTRm3UKJXyxv7zOIBbLFLju4T5TViA70o0CO8WljkKJZTW4gjQEwlpDxmBDixWJK51PqV2xvTlY+sjnos1iYOil/BPk1RcRgAS0pPX7/3cMcU4VGfx/pyZeHelBym7j9N4cH+s7HLNb2XgrgYZ8tAngCMAdZTVuLxKm0wg9MC9Aaqgd3qHAbgHHWAOqsOLdDgwcN7ZxtQ/iWEXb1bdIjawczupIv/1V1fWIMwXczBP6RN5KpizJyOewOLqECi8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a416dd-bee2-4dd5-2076-08d827eaae41
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 11:40:17.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6YkWmVy/DVmQUeeihKCzdZ0nQ1w2msoKg2S7nr1fuIdXVdOk03eSzJb5WduQtcX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDcuMjAgdW0gMTI6NDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgSnVs
IDA3LCAyMDIwIGF0IDEwOjEyOjIzUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE15
IGRtYS1mZW5jZSBsb2NrZGVwIGFubm90YXRpb25zIGNhdWdodCBhbiBpbnZlcnNpb24gYmVjYXVz
ZSB3ZQo+PiBhbGxvY2F0ZSBtZW1vcnkgd2hlcmUgd2UgcmVhbGx5IHNob3VsZG4ndDoKPj4KPj4g
CWttZW1fY2FjaGVfYWxsb2MrMHgyYi8weDZkMAo+PiAJYW1kZ3B1X2ZlbmNlX2VtaXQrMHgzMC8w
eDMzMCBbYW1kZ3B1XQo+PiAJYW1kZ3B1X2liX3NjaGVkdWxlKzB4MzA2LzB4NTUwIFthbWRncHVd
Cj4+IAlhbWRncHVfam9iX3J1bisweDEwZi8weDI2MCBbYW1kZ3B1XQo+PiAJZHJtX3NjaGVkX21h
aW4rMHgxYjkvMHg0OTAgW2dwdV9zY2hlZF0KPj4gCWt0aHJlYWQrMHgxMmUvMHgxNTAKPj4KPj4g
VHJvdWJsZSByaWdodCBub3cgaXMgdGhhdCBsb2NrZGVwIG9ubHkgdmFsaWRhdGVzIGFnYWluc3Qg
R0ZQX0ZTLCB3aGljaAo+PiB3b3VsZCBiZSBnb29kIGVub3VnaCBmb3Igc2hyaW5rZXJzLiBCdXQg
Zm9yIG1tdV9ub3RpZmllcnMgd2UgYWN0dWFsbHkKPj4gbmVlZCAhR0ZQX0FUT01JQywgc2luY2Ug
dGhleSBjYW4gYmUgY2FsbGVkIGZyb20gYW55IHBhZ2UgbGF1bmRlcmluZywKPj4gZXZlbiBpZiBH
RlBfTk9GUyBvciBHRlBfTk9JTyBhcmUgc2V0Lgo+Pgo+PiBJIGd1ZXNzIHdlIHNob3VsZCBpbXBy
b3ZlIHRoZSBsb2NrZGVwIGFubm90YXRpb25zIGZvcgo+PiBmc19yZWNsYWltX2FjcXVpcmUvcmVs
ZWFzZS4KPj4KPj4gT2ZjIHJlYWwgZml4IGlzIHRvIHByb3Blcmx5IHByZWFsbG9jYXRlIHRoaXMg
ZmVuY2UgYW5kIHN0dWZmIGl0IGludG8KPj4gdGhlIGFtZGdwdSBqb2Igc3RydWN0dXJlLiBCdXQg
R0ZQX0FUT01JQyBnZXRzIHRoZSBsb2NrZGVwIHNwbGF0IG91dCBvZgo+PiB0aGUgd2F5Lgo+Pgo+
PiB2MjogVHdvIG1vcmUgYWxsb2NhdGlvbnMgaW4gc2NoZWR1bGVyIHBhdGhzLgo+Pgo+PiBGcmlz
dCBvbmU6Cj4+Cj4+IAlfX2ttYWxsb2MrMHg1OC8weDcyMAo+PiAJYW1kZ3B1X3ZtaWRfZ3JhYisw
eDEwMC8weGNhMCBbYW1kZ3B1XQo+PiAJYW1kZ3B1X2pvYl9kZXBlbmRlbmN5KzB4ZjkvMHgxMjAg
W2FtZGdwdV0KPj4gCWRybV9zY2hlZF9lbnRpdHlfcG9wX2pvYisweDNmLzB4NDQwIFtncHVfc2No
ZWRdCj4+IAlkcm1fc2NoZWRfbWFpbisweGY5LzB4NDkwIFtncHVfc2NoZWRdCj4+Cj4+IFNlY29u
ZCBvbmU6Cj4+Cj4+IAlrbWVtX2NhY2hlX2FsbG9jKzB4MmIvMHg2ZDAKPj4gCWFtZGdwdV9zeW5j
X2ZlbmNlKzB4N2UvMHgxMTAgW2FtZGdwdV0KPj4gCWFtZGdwdV92bWlkX2dyYWIrMHg4NmIvMHhj
YTAgW2FtZGdwdV0KPj4gCWFtZGdwdV9qb2JfZGVwZW5kZW5jeSsweGY5LzB4MTIwIFthbWRncHVd
Cj4+IAlkcm1fc2NoZWRfZW50aXR5X3BvcF9qb2IrMHgzZi8weDQ0MCBbZ3B1X3NjaGVkXQo+PiAJ
ZHJtX3NjaGVkX21haW4rMHhmOS8weDQ5MCBbZ3B1X3NjaGVkXQo+Pgo+PiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcK
Pj4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+PiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBD
YzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+PiBDYzogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBIYXMgYW55b25lIGZy
b20gYW1kIHNpZGUgc3RhcnRlZCBsb29raW5nIGludG8gaG93IHRvIGZpeCB0aGlzIHByb3Blcmx5
PwoKWWVhaCBJIGNoZWNrZWQgYm90aCBhbmQgbmVpdGhlciBhcmUgYW55IHJlYWwgcHJvYmxlbS4K
Cj4gSSBsb29rZWQgYSBiaXQgaW50byBmaXhpbmcgdGhpcyB3aXRoIG1lbXBvb2wsIGFuZCB0aGUg
YmlnIGd1YXJhbnRlZSB3ZQo+IG5lZWQgaXMgdGhhdAo+IC0gdGhlcmUncyBhIGhhcmQgdXBwZXIg
bGltaXQgb24gaG93IG1hbnkgYWxsb2NhdGlvbnMgd2UgbWluaW1hbGx5IG5lZWQgdG8KPiAgICBn
dWFyYW50ZWUgZm9yd2FyZCBwcm9ncmVzcy4gQW5kIHRoZSBlbnRpcmUgdm1pZCBhbGxvY2F0aW9u
IGFuZAo+ICAgIGFtZGdwdV9zeW5jX2ZlbmNlIHN0dWZmIGtpbmRhIG1ha2VzIG1lIHF1ZXN0aW9u
IHRoYXQncyBhIHZhbGlkCj4gICAgYXNzdW1wdGlvbi4KCldlIGRvIGhhdmUgaGFyZCB1cHBlciBs
aW1pdHMgZm9yIHRob3NlLgoKVGhlIFZNSUQgYWxsb2NhdGlvbiBjb3VsZCBhcyB3ZWxsIGp1c3Qg
cmV0dXJuIHRoZSBmZW5jZSBpbnN0ZWFkIG9mIApwdXR0aW5nIGl0IGludG8gdGhlIHN5bmMgb2Jq
ZWN0IElJUkMuIFNvIHRoYXQganVzdCBuZWVkcyBzb21lIGNsZWFudXAgCmFuZCBjYW4gYXZvaWQg
dGhlIGFsbG9jYXRpb24gZW50aXJlbHkuCgpUaGUgaGFyZHdhcmUgZmVuY2UgaXMgbGltaXRlZCBi
eSB0aGUgbnVtYmVyIG9mIHN1Ym1pc3Npb25zIHdlIGNhbiBoYXZlIApjb25jdXJyZW50bHkgb24g
dGhlIHJpbmcgYnVmZmVycywgc28gYWxzbyBub3QgYSBwcm9ibGVtIGF0IGFsbC4KClJlZ2FyZHMs
CkNocmlzdGlhbi4KCj4KPiAtIG1lbXBvb2xfZnJlZSBtdXN0IGJlIGNhbGxlZCB3aXRob3V0IGFu
eSBsb2NrcyBpbiB0aGUgd2F5IHdoaWNoIGFyZSBoZWxkCj4gICAgd2hpbGUgd2UgY2FsbCBtZW1w
b29sX2FsbG9jLiBPdGhlcndpc2Ugd2UgYWdhaW4gaGF2ZSBhIG5pY2UgZGVhZGxvY2sKPiAgICB3
aXRoIG5vIGZvcndhcmQgcHJvZ3Jlc3MuIEkgdHJpZWQgYXVkaXRpbmcgdGhhdCwgYnV0IGdvdCBs
b3N0IGluIGFtZGdwdQo+ICAgIGFuZCBzY2hlZHVsZXIgY29kZS4gU29tZSBsb2NrZGVwIGFubm90
YXRpb25zIGZvciBtZW1wb29sLmMgbWlnaHQgaGVscCwKPiAgICBidXQgdGhleSdyZSBub3QgZ29p
bmcgdG8gY2F0Y2ggZXZlcnl0aGluZy4gUGx1cyBpdCB3b3VsZCBiZSBhZ2FpbiBtYW51YWwKPiAg
ICBhbm5vdGF0aW9ucyBiZWNhdXNlIHRoaXMgaXMgeWV0IGFub3RoZXIgY3Jvc3MtcmVsZWFzZSBp
c3N1ZS4gU28gbm90IHN1cmUKPiAgICB0aGF0IGhlbHBzIGF0IGFsbC4KPgo+IGlvdywgbm90IHN1
cmUgd2hhdCB0byBkbyBoZXJlLiBJZGVhcz8KPgo+IENoZWVycywgRGFuaWVsCj4KPj4gLS0tCj4+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgfCAyICstCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jICAgfCAyICstCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3N5bmMuYyAgfCAyICstCj4+ICAgMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4+IGluZGV4IDhkODQ5NzU4ODVjZC4u
YTA4OWE4MjdmZGZlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZmVuY2UuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZmVuY2UuYwo+PiBAQCAtMTQzLDcgKzE0Myw3IEBAIGludCBhbWRncHVfZmVuY2VfZW1pdChzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHN0cnVjdCBkbWFfZmVuY2UgKipmLAo+PiAgIAl1aW50MzJf
dCBzZXE7Cj4+ICAgCWludCByOwo+PiAgIAo+PiAtCWZlbmNlID0ga21lbV9jYWNoZV9hbGxvYyhh
bWRncHVfZmVuY2Vfc2xhYiwgR0ZQX0tFUk5FTCk7Cj4+ICsJZmVuY2UgPSBrbWVtX2NhY2hlX2Fs
bG9jKGFtZGdwdV9mZW5jZV9zbGFiLCBHRlBfQVRPTUlDKTsKPj4gICAJaWYgKGZlbmNlID09IE5V
TEwpCj4+ICAgCQlyZXR1cm4gLUVOT01FTTsKPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pZHMuYwo+PiBpbmRleCAyNjdmYTQ1ZGRiNjYuLmEzMzNjYTJkNGRkZCAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYwo+PiBAQCAtMjA4LDcg
KzIwOCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtaWRfZ3JhYl9pZGxlKHN0cnVjdCBhbWRncHVf
dm0gKnZtLAo+PiAgIAlpZiAocmluZy0+dm1pZF93YWl0ICYmICFkbWFfZmVuY2VfaXNfc2lnbmFs
ZWQocmluZy0+dm1pZF93YWl0KSkKPj4gICAJCXJldHVybiBhbWRncHVfc3luY19mZW5jZShzeW5j
LCByaW5nLT52bWlkX3dhaXQpOwo+PiAgIAo+PiAtCWZlbmNlcyA9IGttYWxsb2NfYXJyYXkoc2l6
ZW9mKHZvaWQgKiksIGlkX21nci0+bnVtX2lkcywgR0ZQX0tFUk5FTCk7Cj4+ICsJZmVuY2VzID0g
a21hbGxvY19hcnJheShzaXplb2Yodm9pZCAqKSwgaWRfbWdyLT5udW1faWRzLCBHRlBfQVRPTUlD
KTsKPj4gICAJaWYgKCFmZW5jZXMpCj4+ICAgCQlyZXR1cm4gLUVOT01FTTsKPj4gICAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zeW5jLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc3luYy5jCj4+IGluZGV4IDhlYTZjNDk1Mjll
Ny4uYWYyMmI1MjZjZWM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfc3luYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9zeW5jLmMKPj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBpbnQgYW1kZ3B1X3N5bmNfZmVuY2Uoc3Ry
dWN0IGFtZGdwdV9zeW5jICpzeW5jLCBzdHJ1Y3QgZG1hX2ZlbmNlICpmKQo+PiAgIAlpZiAoYW1k
Z3B1X3N5bmNfYWRkX2xhdGVyKHN5bmMsIGYpKQo+PiAgIAkJcmV0dXJuIDA7Cj4+ICAgCj4+IC0J
ZSA9IGttZW1fY2FjaGVfYWxsb2MoYW1kZ3B1X3N5bmNfc2xhYiwgR0ZQX0tFUk5FTCk7Cj4+ICsJ
ZSA9IGttZW1fY2FjaGVfYWxsb2MoYW1kZ3B1X3N5bmNfc2xhYiwgR0ZQX0FUT01JQyk7Cj4+ICAg
CWlmICghZSkKPj4gICAJCXJldHVybiAtRU5PTUVNOwo+PiAgIAo+PiAtLSAKPj4gMi4yNy4wCj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
