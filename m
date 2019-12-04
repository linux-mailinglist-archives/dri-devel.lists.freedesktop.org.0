Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C60112D25
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5246E903;
	Wed,  4 Dec 2019 14:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D748909C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNsxNaDqD83acX7khCw3bG2u/hWVlj6u6BOowfW72TqmZHKIe6FcRRL9Xm2ydCa7B/n+mM1SL13O6grJnMSPM3JqsZ4ZxtTrUOZ6zrQEd/yTaOhqJqjHD+DTsu7DTIrjM0bejPQsf3dL0vz0r+mjQ3490cZx0SlfyselaP709XItRQsxgqLaqtI7bvcT5ButFSH9yrFY1ky30+Gen3zjIAYFHb+St10qJvbVZkFPS8Oapd1IUktUKMsfFALSf+t1KgP14VwLdAWnTL8mAvyXWkdmrJ7iv0wCkqv0P/dKSMHeGK6c0voa9BUVKViwist53inRmXzXvfE0KlxsxPBbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bGm5JMQnAFU8Ntt4xg3rbAARi/QoRFtqLwpDTU8S/I=;
 b=ffzHVvDt0Uu8v2fjY+/r3w7s+nOQhPJVO7QNBApeuyyWhAWyv9oazS0aVMy9roPS24InVR1D2Te6w5sAjbXxzn7n86lVsRYqBp/xfM4nULyXSCauJLtbkH2kj6F/bBlY4IRegmYm39qxsO6PsQF5uGv/EbiztlJsNgMBqkWFqe8SMcEWJnw898o+vykJJfEUs4d50F9fNfS/e5LoJvSOigUOHwUN1ZKQARSzvT+Yv1DYM1jpUtJswI9m+4fplDHDYO30RSsGRn7Om+WqRRTZaBrQDjZAbVZ/q7bqVXfJWXf6OsluEatEip3X0eavWz5IzA8/cfuQL3vJHEEDAtm0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1372.namprd12.prod.outlook.com (10.168.238.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Wed, 4 Dec 2019 14:02:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 14:02:31 +0000
Subject: Re: [PATCH 7/8] drm/ttm: Introduce a huge page aligning TTM range
 manager.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-8-thomas_os@shipmail.org>
 <39b9d651-6afd-1926-7302-aa2a8d4ca626@amd.com>
 <7223bee1-cb3f-3d88-a70b-f4e1a5088b76@shipmail.org>
 <f87a03da-ea9d-fe2b-8069-8fe0bda57c12@amd.com>
 <6ae46281-195c-2803-fc3d-16e7bc830639@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <34a91568-cd07-9d95-d2f1-89cc1ff5fa90@amd.com>
Date: Wed, 4 Dec 2019 15:02:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <6ae46281-195c-2803-fc3d-16e7bc830639@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0083.eurprd07.prod.outlook.com
 (2603:10a6:207:6::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 28fd6849-05b2-44d1-d9a5-08d778c29adf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1372:
X-Microsoft-Antispam-PRVS: <DM5PR12MB137250FF6223B34CCF49DF65835D0@DM5PR12MB1372.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0241D5F98C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(316002)(31696002)(6246003)(5660300002)(52116002)(7736002)(305945005)(31686004)(7416002)(81156014)(99286004)(23676004)(53546011)(66574012)(14454004)(478600001)(8676002)(8936002)(58126008)(4326008)(6506007)(54906003)(25786009)(186003)(6666004)(2906002)(81166006)(66946007)(2616005)(36756003)(66556008)(66476007)(86362001)(2870700001)(11346002)(50466002)(65956001)(6116002)(6486002)(76176011)(6512007)(6436002)(229853002)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1372;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1K+9QHOm0Xg6m/SYFwQB0uhyhWaUxA7FkAmh1RDMQYfxJPu2dqWUXYUrYgd2AJCRWQkL7IuegUQsiQqCFf8jxpwn0/GYp8aBQXvVUzoBxoaMwId3L6f4d2oAFCaV6wk27vENANbl6FtmAkB9DtwBwd4T7NxhnzMltMAQvaKLvlErRfl9qPV2YBag/zdjOfiq+C5TqeCNRb90lSwf3sWnjyJpormiHENkSuAYOI1EOTOfwuqOmSZWoC6QyV3/k/5U3eMWvm/Tlty+p7ljQW9XcM07yVzq55o9DQnr2RS5N/5mJsjRCxkV/oeq3cBLlKTDKUM1wkzYmYMkoZZdWkghlUeMLB1QnP81PRNEtgFE/Mf+8b0f7cZ1RVF1KZ/9yL+Q7YgkRyMvsFzdsXIoy8zUWQoN8Ue4PV2SIbrEfqCq3ty3kyKdvKYDUJJNOIBfKWLh3bpC9n4HwhVSoxxoE2h6XnEs5cj++4woFPYD8Co27pdO5FvS1IDgYmVQQrXFFpF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fd6849-05b2-44d1-d9a5-08d778c29adf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 14:02:31.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbV1Nj1lAP0/u7jsjhFR5hVXtkEMurP4uSsVZR+uYy4tmg/hB3NBidgoUScb2dPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1372
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bGm5JMQnAFU8Ntt4xg3rbAARi/QoRFtqLwpDTU8S/I=;
 b=DVMY6tpkLy+xbpxeGw0xK0dBJ6nTV1p03Pp51CD6p5cQIYj4r0/Lnfn7d2GJqUYjv0gUXW9ltnvwk2g6J+IR7FJs+exgMo5MqsV073McckDjHr3aXgCLri+tOJDdpt2u83povdijqRQ+yW/ExC5EHoeC1m4RHPVtlRj7iOLccoM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMTIuMTkgdW0gMTQ6MTggc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBPbiAxMi80LzE5IDE6MTYgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA0LjEy
LjE5IHVtIDEyOjQ1IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+PiBPbiAx
Mi80LzE5IDEyOjEzIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDAzLjEyLjE5
IHVtIDE0OjIyIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+Pj4+IEZyb206
IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pj4KPj4+Pj4gVXNp
bmcgaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgcmVxdWlyZSB0aGF0IHRoZSBzdGFydCBvZiBhIGJ1
ZmZlciAKPj4+Pj4gb2JqZWN0Cj4+Pj4+IGlzIGh1Z2UgcGFnZSBzaXplIGFsaWduZWQuIFNvIGlu
dHJvZHVjZSBhIHR0bV9ib19tYW5fZ2V0X25vZGVfaHVnZSgpCj4+Pj4+IGZ1bmN0aW9uIHRoYXQg
YXR0ZW1wdHMgdG8gYWNjb21wbGlzaCB0aGlzIGZvciBhbGxvY2F0aW9ucyB0aGF0IGFyZSAKPj4+
Pj4gbGFyZ2VyCj4+Pj4+IHRoYW4gdGhlIGh1Z2UgcGFnZSBzaXplLCBhbmQgcHJvdmlkZSBhIG5l
dyByYW5nZS1tYW5hZ2VyIGluc3RhbmNlIAo+Pj4+PiB0aGF0Cj4+Pj4+IHVzZXMgdGhhdCBmdW5j
dGlvbi4KPj4+Pgo+Pj4+IEkgc3RpbGwgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGlzIGEgZ29vZCBp
ZGVhLgo+Pj4KPj4+IEFnYWluLCBjYW4geW91IGVsYWJvcmF0ZSB3aXRoIHNvbWUgc3BlY2lmaWMg
Y29uY2VybnM/Cj4+Cj4+IFlvdSBzZWVtcyB0byBiZSBzZWVpbmcgUFVEIGFzIHNvbWV0aGluZyBv
cHRpb25hbC4KPj4KPj4+Pgo+Pj4+IFRoZSBkcml2ZXIvdXNlcnNwYWNlIHNob3VsZCBqdXN0IHVz
ZSBhIHByb3BlciBhbGlnbm1lbnQgaWYgaXQgd2FudHMgCj4+Pj4gdG8gdXNlIGh1Z2UgcGFnZXMu
Cj4+Pgo+Pj4gVGhlcmUgYXJlIGRyYXdiYWNrcyB3aXRoIHRoaXMgYXBwcm9hY2guIFRoZSBUVE0g
YWxpZ25tZW50IGlzIGEgaGFyZCAKPj4+IGNvbnN0cmFpbnQuIEFzc3VtZSB0aGF0IHlvdSB3YW50
IHRvIGZpdCBhIDFHQiBidWZmZXIgb2JqZWN0IGludG8gCj4+PiBsaW1pdGVkIFZSQU0gc3BhY2Us
IGFuZCBfaWYgcG9zc2libGVfIHVzZSBQVUQgc2l6ZSBodWdlIHBhZ2VzLiBMZXQncyAKPj4+IHNh
eSB0aGVyZSBpcyAxR0IgYXZhaWxhYmxlLCBidXQgbm90IDFHQiBhbGlnbmVkLiBUaGUgcHJvcGVy
IAo+Pj4gYWxpZ25tZW50IGFwcHJvYWNoIHdvdWxkIGZhaWwgYW5kIHBvc3NpYmx5IHN0YXJ0IHRv
IGV2aWN0IHN0dWZmIGZyb20gCj4+PiBWUkFNIGp1c3QgdG8gYmUgYWJsZSB0byBhY2NvbW9kYXRl
IHRoZSBQVUQgYWxpZ25tZW50LiBUaGF0J3MgYmFkLiAKPj4+IFRoZSBhcHByb2FjaCBJIHN1Z2dl
c3Qgd291bGQgaW5zdGVhZCBmYWxsIGJhY2sgdG8gUE1EIGFsaWdubWVudCBhbmQgCj4+PiB1c2Ug
Mk1CIHBhZ2UgdGFibGUgZW50cmllcyBpZiBwb3NzaWJsZSwgYW5kIGFzIGEgbGFzdCByZXNvcnQg
dXNlIDRLIAo+Pj4gcGFnZSB0YWJsZSBlbnRyaWVzLgo+Pgo+PiBBbmQgZXhhY3RseSB0aGF0IHNv
dW5kcyBsaWtlIGEgYmFkIGlkZWEgdG8gbWUuCj4+Cj4+IFVzaW5nIDFHQiBhbGlnbm1lbnQgaXMg
aW5kZWVkIHVucmVhbGlzdGljIGluIG1vc3QgY2FzZXMsIGJ1dCBmb3IgMk1CIAo+PiBhbGlnbm1l
bnQgd2Ugc2hvdWxkIHJlYWxseSBzdGFydCB0byBldmljdCBCT3MuCj4+Cj4+IE90aGVyd2lzZSB0
aGUgYWRkcmVzcyBzcGFjZSBjYW4gYmVjb21lIGZyYWdtZW50ZWQgYW5kIHdlIHdvbid0IGJlIAo+
PiBhYmxlIGRlLWZyYWdtZW50IGl0IGluIGFueSB3YXkuCj4KPiBBaCwgSSBzZWUsIFllYWggdGhh
dCdzIHRoZSBUSFAgdHJhZGVvZmYgYmV0d2VlbiBmcmFnbWVudGF0aW9uIGFuZCAKPiBtZW1vcnkt
dXNhZ2UuIEZyb20gbXkgcG9pbnQgb2YgdmlldywgaXQncyBub3Qgc2VsZi1ldmlkZW50IHRoYXQg
ZWl0aGVyIAo+IGFwcHJvYWNoIGlzIHRoZSBiZXN0IG9uZSwgYnV0IHRoZSBuaWNlIHRoaW5nIHdp
dGggdGhlIHN1Z2dlc3RlZCBjb2RlIAo+IGlzIHRoYXQgeW91IGNhbiB2aWV3IGl0IGFzIGFuIG9w
dGlvbmFsIGhlbHBlci4gRm9yIGV4YW1wbGUsIHRvIGF2b2lkIAo+IGZyYWdtZW50YXRpb24gYW5k
IGhhdmUgYSBoaWdoIGh1Z2UtcGFnZSBoaXQgcmF0aW8gZm9yIDJNQiBwYWdlcywgWW91J2QgCj4g
ZWl0aGVyIGluZmxhdGUgdGhlIGJ1ZmZlciBvYmplY3Qgc2l6ZSB0byBiZSAyTUIgYWxpZ25lZCwg
d2hpY2ggd291bGQgCj4gYWZmZWN0IGFsc28gc3lzdGVtIG1lbW9yeSwgb3IgeW91J2Qgc2V0IHRo
ZSBUVE0gbWVtb3J5IGFsaWdubWVudCB0byAKPiAyTUIuIElmIGluIGFkZGl0aW9uIHlvdSdkIGxp
a2UgInNvZnQiIChub24tZXZpY3RpbmcpIGFsaWdubWVudCBhbHNvIAo+IGZvciAxR0IgcGFnZXMs
IHlvdSdkIGFsc28gaG9vayB1cCB0aGUgbmV3IHJhbmdlIG1hbmFnZXIuIEkgZmlndXJlIAo+IGRp
ZmZlcmVudCBkcml2ZXJzIHdvdWxkIHdhbnQgdG8gdXNlIGRpZmZlcmVudCBzdHJhdGVnaWVzLgo+
Cj4gSW4gYW55IGNhc2UsIHZtd2dmeCB3b3VsZCwgZHVlIHRvIGl0cyB2ZXJ5IGxpbWl0ZWQgVlJB
TSBzaXplLCB3YW50IHRvIAo+IHVzZSB0aGUgInNvZnQiIGFsaWdubWVudCBwcm92aWRlZCBieSB0
aGlzIHBhdGNoLCBidXQgaWYgeW91IGRvbid0IHNlZSAKPiBhbnkgb3RoZXIgZHJpdmVycyB3YW50
aW5nIHRoYXQsIEkgY291bGQgZGVmaW5pdGVseSBtb3ZlIGl0IHRvIHZtd2dmeC4KCk9rLCBsZXQn
cyBkbyBpdCB0aGlzIHdheSB0aGVuLiBCb3RoIGFtZGdwdSBhbmQgd2VsbCBhcyBub3V2ZWF1IGhh
dmUgCnNwZWNpYWxpemVkIGFsbG9jYXRvcnMgYW55d2F5IGFuZCBJIGRvbid0IHNlZSB0aGUgbmVl
ZCBmb3IgdGhpcyBpbiByYWRlb24uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gL1Rob21hcwo+
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
