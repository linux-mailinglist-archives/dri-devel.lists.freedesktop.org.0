Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B615A10ABF1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018328864B;
	Wed, 27 Nov 2019 08:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494898864B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Koyge/fpbC+89b+bMu+HNcrQqweVPZrK9OQBrH+o9T6Rdu2+CB4jrTJJsiTmr6v9ad7mHgz/ztDGCL0klrzECPw88RFCJTtuQkMnn1A7ZL8w62c8IhZi+NqpnuFzZDJ1Lr9WC6IesKTSDUZdj76Mk1kn54ejr0zSreEOZvICrHAK34pVKjAAwfUBcwdUCtDxBcX5ZqKZ0lbZG008kI37kXz7vOa/7q+2v51SOtZhmXtyIodoPZbgJYwkcKMxWA9fD/pyNN+P4iBz3CR9nDbh5C+23zPpumIOITMAUBWqriazuyJsVlGJ1KST8TIw0X/jNAkfUde45FmVSpr9+tBW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjArgt8xEC3XRZ4TzMt//d5skXR3LOTrFiLTmqoRQms=;
 b=iB6Hm9s1TR7fUY8KpH1WrE3QkACrVgCzci3vhgD/8o18MKebnD8Qr95ZX24OowDnYApTqTlnl+DcP4ekrKCosShaLjRfk8hQYx90w14mjCo7Bb2GFP8VQuqDKBUh5kOEk7SITUlxaHfkS3hHdhN1RqNmZxC/VzgC2SSSJtFuokXamIB/pR+yM+P6oqGuZb7y6HOSJ9nNOyjE1Ci1unYRLo5lgpiapxPwVi3ZybKsNbZUHMm+src666twMijDcZ/d7UaHk+vu3m+7g/KpTCctXvwjDupcTLbVaYQHv3vgBtHbe6GbUauV03S5H6uUYVS7EJNb+8/wy871nSGTi2I+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1211.namprd12.prod.outlook.com (10.168.239.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 08:42:51 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 08:42:51 +0000
Subject: Re: [PATCH 1/2] mm: Add and export vmf_insert_mixed_prot()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
References: <20191126202717.30762-1-thomas_os@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e1a5ce03-1b8d-8118-de95-b53901e94b50@amd.com>
Date: Wed, 27 Nov 2019 09:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191126202717.30762-1-thomas_os@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:205:1::26) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23aa8fc9-fb06-4a08-148d-08d77315c9b7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1211:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1211B651519727476708FC9A83440@DM5PR12MB1211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(31686004)(446003)(11346002)(4326008)(50466002)(65806001)(47776003)(316002)(2616005)(186003)(46003)(2486003)(58126008)(229853002)(65956001)(6246003)(81166006)(81156014)(66556008)(386003)(66476007)(8676002)(6506007)(52116002)(7736002)(54906003)(76176011)(66946007)(23676004)(5660300002)(478600001)(6436002)(99286004)(6116002)(7416002)(8936002)(305945005)(6512007)(25786009)(6666004)(14454004)(86362001)(31696002)(2906002)(6486002)(36756003)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1211;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBwR4X1OeyHbwTFRpSndhJTtxNfxBFxCX+BLPN+6QiWJnW/zGWJAkg2LEMSgCYzxYdwogvLc4dtPU2DQAJ7IW7f7fxCWffx2EhQuq8TNXg2y0Dwn/2GwLp/pXO9rIKZbeFoPHNepGM9f4Td50fM/3wsukTuuD+1pUmsAljlSsSO/kxwYP/TG/sBY5sDK9n9oET3VTx1r95aPRfAmpXdRGzBVqEXHL91y5vywZ0a1XQ9aegkOJCjeC9Z6BTkz6f2Oe6UVs62mj4k5UElp9QK5zapfaPC9MIWuwzTofbK+aVnPtP5C9niyreoCRajOAZNzH67/mVSvUammoxBhuJ1q5Xg+t9ZFHfxdQ9SQk03QnKZ3Kfuort7QJ8YIPMppCQoclpKQ/oNjxws4B7IHdrnpcKLI77D8zhF3EdXqQG8l0TT8ovIIukIn0btupXbflTWV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23aa8fc9-fb06-4a08-148d-08d77315c9b7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 08:42:51.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLwdRiy11Jamxybl+T00UeynIieq/+3Yghcu08UusxpMHXLqCHunzTVBvDUgcaI2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjArgt8xEC3XRZ4TzMt//d5skXR3LOTrFiLTmqoRQms=;
 b=KXJJrPJbUqDoO65YYmCLEJtLAN5FjmMxH83AuuuYLFBrYuR6Gohw89Xfez+rruFd3mcvKTueC2uGFunPqblzxeJBPntWKS9+/DDmivVZEH5XMBbtfQ0j1ITn/Er/ribR1SHBsvX39jkAuN64/s/5SwvU8ASSoOon1ix9F3tdGIs=
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
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMTkgdW0gMjE6Mjcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4KPiBUaGUg
VFRNIG1vZHVsZSB0b2RheSB1c2VzIGEgaGFjayB0byBiZSBhYmxlIHRvIHNldCBhIGRpZmZlcmVu
dCBwYWdlCj4gcHJvdGVjdGlvbiB0aGFuIHN0cnVjdCB2bV9hcmVhX3N0cnVjdDo6dm1fcGFnZV9w
cm90LiBUbyBiZSBhYmxlIHRvIGRvCj4gdGhpcyBwcm9wZXJseSwgYWRkIGFuZCBleHBvcnQgdm1m
X2luc2VydF9taXhlZF9wcm90KCkuCj4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6
ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gQ2M6ICJL
aXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgo+IENj
OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gQ2M6ICJKw6lyw7RtZSBH
bGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgIDIg
KysKPiAgIG1tL21lbW9yeS5jICAgICAgICB8IDE1ICsrKysrKysrKysrLS0tLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4IGNjMjky
MjczZTZiYS4uMjk1NzVkM2MxZTQ3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0yNTQ4LDYgKzI1NDgsOCBAQCB2bV9mYXVs
dF90IHZtZl9pbnNlcnRfcGZuX3Byb3Qoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2ln
bmVkIGxvbmcgYWRkciwKPiAgIAkJCXVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwZ3Byb3Qp
Owo+ICAgdm1fZmF1bHRfdCB2bWZfaW5zZXJ0X21peGVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAJCQlwZm5fdCBwZm4pOwo+ICt2bV9mYXVsdF90
IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+ICsJCQlwZm5fdCBwZm4sIHBncHJvdF90IHBncHJvdCk7Cj4gICB2bV9m
YXVsdF90IHZtZl9pbnNlcnRfbWl4ZWRfbWt3cml0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwKPiAgIAkJdW5zaWduZWQgbG9uZyBhZGRyLCBwZm5fdCBwZm4pOwo+ICAgaW50IHZtX2lvbWFw
X21lbW9yeShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgcGh5c19hZGRyX3Qgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgbGVuKTsKPiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnku
Ywo+IGluZGV4IGIxY2E1MWEwNzlmMi4uMjhmMTYyZTI4MTQ0IDEwMDY0NAo+IC0tLSBhL21tL21l
bW9yeS5jCj4gKysrIGIvbW0vbWVtb3J5LmMKPiBAQCAtMTcxOSw5ICsxNzE5LDkgQEAgc3RhdGlj
IGJvb2wgdm1fbWl4ZWRfb2soc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBmbl90IHBmbikK
PiAgIH0KPiAgIAo+ICAgc3RhdGljIHZtX2ZhdWx0X3QgX192bV9pbnNlcnRfbWl4ZWQoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gLQkJdW5zaWduZWQgbG9uZyBhZGRyLCBwZm5fdCBwZm4s
IGJvb2wgbWt3cml0ZSkKPiArCQl1bnNpZ25lZCBsb25nIGFkZHIsIHBmbl90IHBmbiwgcGdwcm90
X3QgcGdwcm90LAo+ICsJCWJvb2wgbWt3cml0ZSkKPiAgIHsKPiAtCXBncHJvdF90IHBncHJvdCA9
IHZtYS0+dm1fcGFnZV9wcm90Owo+ICAgCWludCBlcnI7Cj4gICAKPiAgIAlCVUdfT04oIXZtX21p
eGVkX29rKHZtYSwgcGZuKSk7Cj4gQEAgLTE3NjQsMTAgKzE3NjQsMTcgQEAgc3RhdGljIHZtX2Zh
dWx0X3QgX192bV9pbnNlcnRfbWl4ZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAJ
cmV0dXJuIFZNX0ZBVUxUX05PUEFHRTsKPiAgIH0KPiAgIAo+ICt2bV9mYXVsdF90IHZtZl9pbnNl
cnRfbWl4ZWRfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+ICsJCQkJIHBmbl90IHBmbiwgcGdwcm90X3QgcGdwcm90KQo+ICt7Cj4gKwlyZXR1cm4g
X192bV9pbnNlcnRfbWl4ZWQodm1hLCBhZGRyLCBwZm4sIHBncHJvdCwgZmFsc2UpOwo+ICt9Cj4g
K0VYUE9SVF9TWU1CT0wodm1mX2luc2VydF9taXhlZF9wcm90KTsKPiArCj4gICB2bV9mYXVsdF90
IHZtZl9pbnNlcnRfbWl4ZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiAgIAkJcGZuX3QgcGZuKQo+ICAgewo+IC0JcmV0dXJuIF9fdm1faW5zZXJ0X21p
eGVkKHZtYSwgYWRkciwgcGZuLCBmYWxzZSk7Cj4gKwlyZXR1cm4gX192bV9pbnNlcnRfbWl4ZWQo
dm1hLCBhZGRyLCBwZm4sIHZtYS0+dm1fcGFnZV9wcm90LCBmYWxzZSk7Cj4gICB9Cj4gICBFWFBP
UlRfU1lNQk9MKHZtZl9pbnNlcnRfbWl4ZWQpOwo+ICAgCj4gQEAgLTE3NzksNyArMTc4Niw3IEBA
IEVYUE9SVF9TWU1CT0wodm1mX2luc2VydF9taXhlZCk7Cj4gICB2bV9mYXVsdF90IHZtZl9pbnNl
cnRfbWl4ZWRfbWt3cml0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgIAkJdW5zaWdu
ZWQgbG9uZyBhZGRyLCBwZm5fdCBwZm4pCj4gICB7Cj4gLQlyZXR1cm4gX192bV9pbnNlcnRfbWl4
ZWQodm1hLCBhZGRyLCBwZm4sIHRydWUpOwo+ICsJcmV0dXJuIF9fdm1faW5zZXJ0X21peGVkKHZt
YSwgYWRkciwgcGZuLCB2bWEtPnZtX3BhZ2VfcHJvdCwgdHJ1ZSk7Cj4gICB9Cj4gICBFWFBPUlRf
U1lNQk9MKHZtZl9pbnNlcnRfbWl4ZWRfbWt3cml0ZSk7Cj4gICAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
