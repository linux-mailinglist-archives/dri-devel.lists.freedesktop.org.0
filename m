Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CB7103610
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1346E0CF;
	Wed, 20 Nov 2019 08:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11036E029;
 Wed, 20 Nov 2019 08:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjZ/ELS7IVs74vwxD8MMpYwUtKXpM7XHttJMmqxV0zT+5U65mBI96BdBqlWazk5M4/ZcQi8d01eechBuC5nSR1LjT4uLqhIV8LRl8RLYjn3n2HRkyBTuZg5oGywnGwmJBl3fRZunZKX6fTIrR5CFaccrlklwOyyWK+e/mbgeYffZP+jebEtLJVehy3xGSS4Vswsylq3P1FxVYkGq3GJibCPfTLUQVwhx8Iq/nVfEYroCmLpTcXpfSQJj3TniReN33XifdxdCuF/Gcgc1GW9mpV0N4Qdxhw1uROE55Svao9s8kohwk/3zUaleaUt4y+kcue9DGs3daNiTeQrP+VXRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcOdvoHMEh3kFqvMUJq40KDiREgJbb2a5NL+3kB3A4s=;
 b=WRFZxZUbPIWV1S59zNEgVuetKqfycPSNgHbHFmrzm7JW4inUomVtZEcL45VysFuLLAD1uIRheOdFMMJCZT7tZGEmpDIJCvcptg/0Kij19wNm33WjMDUy/zevCuxFMXtXf9SOVoM8j/kJKT9nZiIu33KthmHnE7sAVHi8qGouL4UtQ5zoL3PAMf/juBuhwMVvTBDliA+D29F52VceeGx5XMAPJFxDigkJNEbHAsRTzJlSS2YQnYTzLb90YbyZk42+D9UeV8H9pUgPyWoHaldQuco+QFVVpIG4yo7ZhBDsEceFPLn1JE7lSTKcb2KHxMX4IzBVLTNAsPkplVFyvv5pjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1436.namprd12.prod.outlook.com (10.168.239.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Wed, 20 Nov 2019 08:34:09 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 08:34:09 +0000
Subject: Re: [PATCH 1/3] drm/modeset: Prime modeset lock vs dma_resv
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9ce03b86-3bec-3a33-b5d0-4acbe9e861ec@amd.com>
Date: Wed, 20 Nov 2019 09:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191119210844.16947-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e397b3f-acef-453f-79bd-08d76d94699c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1436:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1436D8DCC1915014E2BC5A8D834F0@DM5PR12MB1436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(446003)(66946007)(52116002)(36756003)(6506007)(2486003)(229853002)(386003)(31686004)(76176011)(23676004)(50466002)(186003)(31696002)(478600001)(6116002)(14454004)(5660300002)(6246003)(6666004)(14444005)(6512007)(4326008)(66574012)(2870700001)(6436002)(2906002)(6486002)(81156014)(8676002)(81166006)(99286004)(65956001)(58126008)(65806001)(8936002)(316002)(86362001)(7736002)(305945005)(46003)(47776003)(25786009)(66556008)(66476007)(486006)(11346002)(54906003)(110136005)(476003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1436;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqQhQ94WxYMMYYF8xalHcjtBoax2vj0ZLZ9klSLUZR6fUDXnEFSYvU0ZcjG0rxHUXCU+YcAlLddnAl4+P26vbGa9MaqkGrRJY0V1b5TgsF1Y6WvAvjXfdSy54mlTPQYeLI9jKxyuIUyPEYZs4/q0nC0evn9QEjo/7/2qhsY6wqqn4d18dT4Q1m8inONv65Q9KKXqBH/sNyRKa4e9aMMMr8r7wJ3xWrpHLXOX9u2S5hkRaudeX/UCUAJdx6K3ApxLzlJ6Jnre/m5IJI+uJJ6n8D73leo7eKVdCNbgKP4tEt7L1ck8htKo9RHL1zCa6KodvAdz3+0n1djFwYDyWvsiDZt4ReUNZvFBZp1R8yN0ov3qd+HL9X26yJiKwpg6xuW+FQCB0E3n5sLhE0Dcq2k4ClTpPWSefM+MIrjsMgQeIOh5H6e8qRiXH8y2rnye5ap2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e397b3f-acef-453f-79bd-08d76d94699c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 08:34:09.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kh93lXqM1sMhcyh+95HGLjEgerPR3aBExdj7GMk1YjVco6Wk42IHzIAp8sPrvlzA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcOdvoHMEh3kFqvMUJq40KDiREgJbb2a5NL+3kB3A4s=;
 b=NKRNwR18p1IPm/W5Zs0j4qc981IRYL/DXmX/n4zBnJPPn2a5oHFHQNnnDaN4GXM3IPKawZEL9mngSYdePg4EWxM8hLYaEpqVTjZoxStI/kvYWSljt4zkR7GwMYVm3QAmK2Ino/CUQL3CnWfiyJgGVjfJ93puOSMbfn4KJE+Bte4=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTEuMTkgdW0gMjI6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEl0J3Mga2luZGEg
cmVhbGx5IGhhcmQgdG8gZ2V0IHRoaXMgd3Jvbmcgb24gYSBkcml2ZXIgd2l0aCBib3RoIGRpc3Bs
YXkKPiBhbmQgZG1hX3Jlc3YgbG9ja2luZy4gQnV0IHdobyBldmVyIGtub3dzLCBzbyBiZXR0ZXIg
dG8gbWFrZSBzdXJlIHRoYXQKPiByZWFsbHkgYWxsIGRyaXZlcnMgbmVzdCB0aGVzZSB0aGUgc2Ft
ZSB3YXkuCj4KPiBGb3IgYWN0dWFsIGxvY2sgc2VtYW50aWNzIHRoZSBhY3F1aXJlIGNvbnRleHQg
bmVzdGluZyBkb2Vzbid0IG1hdHRlci4KPiBCdXQgdG8gdGVhY2ggbG9ja2RlcCB3aGF0J3MgZ29p
bmcgb24gd2l0aCB3d19tdXRleCB0aGUgYWNxdWlyZSBjdHggaXMKPiBhIGZha2UgbG9ja2RlcCBs
b2NrLCBoZW5jZSBmcm9tIGEgbG9ja2RlcCBwb3YgaXQgZG9lcyBtYXR0ZXIuIFRoYXQncwo+IHdo
eSBJIGZpZ3VyZWQgYmV0dGVyIHRvIGluY2x1ZGUgaXQuCj4KPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KCldoeSBub3QgYWRkIGFub3RoZXIgX19pbml0IGZ1bmN0aW9u
IGxpa2Ugd2UgZGlkIGZvciBkbWFfcmVzdj8gVGhhdCAKbG9va2VkIHJhdGhlciBjbGVhbiB0byBt
ZS4KCkVpdGhlciB3aHkgZmVlbCBmcmVlIHRvIGFkZCBhbiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gdGhlIHBhdGNoLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYyB8
IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2Nv
bmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4gaW5kZXggM2I1NzBh
NDA0OTMzLi4wOGU2ZWZmNmExNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2RlX2NvbmZpZy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCj4g
QEAgLTI3LDYgKzI3LDcgQEAKPiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiAgICNpbmNs
dWRlIDxkcm0vZHJtX21vZGVfY29uZmlnLmg+Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvZG1hLXJlc3YuaD4KPiAgIAo+ICAgI2luY2x1ZGUgImRybV9j
cnRjX2ludGVybmFsLmgiCj4gICAjaW5jbHVkZSAiZHJtX2ludGVybmFsLmgiCj4gQEAgLTQxNSw2
ICs0MTYsMzMgQEAgdm9pZCBkcm1fbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQo+ICAgCWRldi0+bW9kZV9jb25maWcubnVtX2NydGMgPSAwOwo+ICAgCWRldi0+bW9kZV9j
b25maWcubnVtX2VuY29kZXIgPSAwOwo+ICAgCWRldi0+bW9kZV9jb25maWcubnVtX3RvdGFsX3Bs
YW5lID0gMDsKPiArCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfTE9DS0RFUCkpIHsKPiArCQlz
dHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHggbW9kZXNldF9jdHg7Cj4gKwkJc3RydWN0IHd3
X2FjcXVpcmVfY3R4IHJlc3ZfY3R4Owo+ICsJCXN0cnVjdCBkbWFfcmVzdiByZXN2Owo+ICsJCWlu
dCByZXQ7Cj4gKwo+ICsJCWRtYV9yZXN2X2luaXQoJnJlc3YpOwo+ICsKPiArCQlkcm1fbW9kZXNl
dF9hY3F1aXJlX2luaXQoJm1vZGVzZXRfY3R4LCAwKTsKPiArCQlyZXQgPSBkcm1fbW9kZXNldF9s
b2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgsCj4gKwkJCQkgICAgICAgJm1v
ZGVzZXRfY3R4KTsKPiArCQlpZiAocmV0ID09IC1FREVBRExLKQo+ICsJCQlyZXQgPSBkcm1fbW9k
ZXNldF9iYWNrb2ZmKCZtb2Rlc2V0X2N0eCk7Cj4gKwo+ICsJCXd3X2FjcXVpcmVfaW5pdCgmcmVz
dl9jdHgsICZyZXNlcnZhdGlvbl93d19jbGFzcyk7Cj4gKwkJcmV0ID0gZG1hX3Jlc3ZfbG9jaygm
cmVzdiwgJnJlc3ZfY3R4KTsKPiArCQlpZiAocmV0ID09IC1FREVBRExLKQo+ICsJCQlkbWFfcmVz
dl9sb2NrX3Nsb3coJnJlc3YsICZyZXN2X2N0eCk7Cj4gKwo+ICsJCWRtYV9yZXN2X3VubG9jaygm
cmVzdik7Cj4gKwkJd3dfYWNxdWlyZV9maW5pKCZyZXN2X2N0eCk7Cj4gKwo+ICsJCWRybV9tb2Rl
c2V0X2Ryb3BfbG9ja3MoJm1vZGVzZXRfY3R4KTsKPiArCQlkcm1fbW9kZXNldF9hY3F1aXJlX2Zp
bmkoJm1vZGVzZXRfY3R4KTsKPiArCQlkbWFfcmVzdl9maW5pKCZyZXN2KTsKPiArCX0KPiAgIH0K
PiAgIEVYUE9SVF9TWU1CT0woZHJtX21vZGVfY29uZmlnX2luaXQpOwo+ICAgCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
