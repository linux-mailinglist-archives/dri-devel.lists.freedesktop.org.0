Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44D1F6AB1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 17:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2196E925;
	Thu, 11 Jun 2020 15:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD336E925;
 Thu, 11 Jun 2020 15:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyF69gX6sldKs9EuDinv6AEE0qBi+HbfDxeKdDnUwgVHkoGj/1drcqKLso7dbOGU47g3NDXAgfWkgl/Pdqxlc6ce+6rKn318OAyEjFV9Vi29+oiB6kBW+weChqitR5qszFS6Q4RFcWVkKNuEaT6CEBGzdG8Hk8VU8KWUVydyeyfpcQNk0VwDF2RSJMZjPcK9yCmiITJIl8zO+737cg9T0Yqr8B+iPpQrrOqgS459HSnpMVxjk5ZwBg2HdipRmq0f+mlgjb6FARvBd4xND9KDJ7/PaNxU8ogXN2HnjFjESY96tnfvY+bB3ic7UsJwDns8NswpIRyj3azA5bTVQP/Qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaELF2ACcfcUF0AnCfEzD3c7wRNrkFI2TOemiD97ad4=;
 b=g6ztjUaCyE1+AdNrz6r3T2+M/rPZVHlqGQUj6Gq59m3k30Zg/1d65JnYwS75C+pkzo6ASEdrF3QUFZCslyf2mojXqDmVzeBzpOBGBtrR+GzD1+T+O5V2J6Qz3Lx2ryn8wE72drmdP8q/mMbtXQkIy53+jRNubK8jzDzA5EfJUFFD0Vupls2pJ/+f7gc/pRUY/eK+hP4EsqpDQT0heovy2MYVoLUuPLaoTPzC9O7vfx7JdtRXEmm/DN72hvuSSNpqIVd4Vhi+DHhdXvTx34vR2xmqSmiMiJ+F9nLEXPieJ+P8Iuu8CrXc6xjUOmBHVYNLLEJxxERJx085EEz9G1LwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaELF2ACcfcUF0AnCfEzD3c7wRNrkFI2TOemiD97ad4=;
 b=mJ06QN6kRnuyK/jkhUgH71xy7etmjNuBMWARlt53JL4Q+0E02lHLjDDkEMsC+fS3xV73hOIrRMlw+KLYvWRJL5WT3Sm14pFnoBzxQss4faweJ6LealiXdJvWnwVzD1WtTWdpAbo3CtiY5GOVKu+cF9zBsKdgP8NpdK0M4DFloz0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Thu, 11 Jun 2020 15:15:45 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 15:15:45 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <CAKMK7uGyKKEk4fFdr45ipe0MmS_1qrv8z0QEPWk=zuwhiUajVA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <97308b69-6daa-6047-a1ef-338879be5280@amd.com>
Date: Thu, 11 Jun 2020 11:15:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uGyKKEk4fFdr45ipe0MmS_1qrv8z0QEPWk=zuwhiUajVA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c]
 (2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c) by
 YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 15:15:44 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6aa96b2-277f-41ec-09d4-08d80e1a5049
X-MS-TrafficTypeDiagnostic: DM6PR12MB4340:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB434055A00148FC88C8867AD8EA800@DM6PR12MB4340.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTuZXVwcLL9UUE9TNnqpu8vdW9pS4fFxMo9v+uvtJj1klVUuocvsFOuOavFpa9QoqWMLtX+Lg6Zx3HE2CZ40QBh8Kpn4s0zwySs0e/Vuevjdi69yudVDi0/T3vSYPUgqUdZMGia4QBawL9V5KqsroXdS2jR23KwGmrOUQH4kqJm9i4ohBhSCmi20VuamCm5zTJC5k3mqpM2Qv3rz/0/oMHYtPMUjuN9TMvcMrMPk9W6gq9c5TcyF1tg1kTJ0TrDJJYfZzuat8nYUaZ9c9fmIX2lfx3W32qgFzxFyHXznIE0iKU05fx7NbYYChCZQzUr376cWxYN9wOCFhjFUVRcDBpHJrUrtiGxsceiJNahaHwiaUeL1ETyom0/kQHX6MZnm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(83380400001)(31696002)(110136005)(6486002)(54906003)(8936002)(36756003)(5660300002)(31686004)(316002)(86362001)(4326008)(2906002)(478600001)(66946007)(8676002)(52116002)(186003)(66574014)(66476007)(2616005)(16526019)(53546011)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: M2rtTfChNPHNJ8hjTLWXqpq3uusXOTkm9wSGOH6sFj1w+6ibPX4nXcb8g4qlnJqmEDFDokv/QxZ6xsbEzRX19A+jp44dJxbzx2aXxEys8VXn18/L1LVvG1AjJPRXsWh2kr/E85qOml1wKO2q0+FKzyJfhYk7D7uJ0yFpiAyqLTeRCncRm6Ftl9+cpH2LrlyOpQ2oOv91dpJ6slQfdIO9NMFvIc7mlGh3gUCiYj2BIVrTsqIjG+0rTKBqLx+8Az5nL/G84FIESTVuUIhgTkeLuW7L89m/x10TZr25a95JhY0+QXCxqLFEnGDSm4POZurPPrxhrXjrtLo609/7nl+sBTrd1UXN8bqZC3N+QYVLXqdQSh10lWPh4a1tiynAdIuEAzKYoqkkMwz+hk3uOe5wAoY8fhH8QQAazPAePutIUif8zmOaTWnFEAmDjxG40YIK0ghQrxPcaN6gxwEg2Xee6H7QSLiWqhiR3U8fHrJuU8DA4WXc2fYYWEJ/CvpjWt0dBD8pU5Q9jlzbbZqhYSf+kid+NHOUH+mhT0WEORfqkvo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6aa96b2-277f-41ec-09d4-08d80e1a5049
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 15:15:45.4157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWajfLatWuLg4pkSQTKteIheBL/0vLa2+I9VY3T0UiFu14FOluO6BLFLIYo59PC7gfROSkRSans7U86z19x+Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMjAgNToxNiBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIEp1biAx
MCwgMjAyMCBhdCAxMDozMCBQTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpCj4gPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiA2LzEwLzIwIDU6MzAgUE0sIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAwNDowNTowNFBNICswMjAw
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDEwLjA2LjIwIHVtIDE1OjU0IHNjaHJp
ZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IE9uIDYvMTAvMjAgNjoxNSBBTSwgVGhvbWFzIEhl
bGxzdHLDtm0gKEludGVsKSB3cm90ZToKPj4+Pj4+IE9uIDYvOS8yMCA3OjIxIFBNLCBLb2VuaWcs
IENocmlzdGlhbiB3cm90ZToKPj4+Pj4+PiBBbSAwOS4wNi4yMDIwIDE4OjM3IHNjaHJpZWIgIkdy
b2R6b3Zza3ksIEFuZHJleSIKPj4+Pj4+PiA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT46Cj4+
Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgIE9uIDYvNS8yMCAyOjQwIFBNLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4+Pj4+ICAgICAgID4gQW0gMDUuMDYuMjAgdW0gMTY6Mjkgc2Nocmll
YiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+PiAgICAgICA+Pgo+Pj4+Pj4+ICAgICAgID4+IE9u
IDUvMTEvMjAgMjo0NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+PiAgICAgICA+
Pj4gQW0gMDkuMDUuMjAgdW0gMjA6NTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+
PiAgICAgICA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+ICAgICAgID4+Pj4gLS0tCj4+Pj4+Pj4gICAgICAgPj4+
PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrLQo+Pj4+Pj4+ICAgICAgID4+Pj4gaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8
ICAyICsrCj4+Pj4+Pj4gICAgICAgPj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+ICAgICAgID4+Pj4KPj4+Pj4+PiAgICAgICA+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gICAgICAg
Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4+PiAgICAgICA+Pj4+IGlu
ZGV4IGM1YjUxNmYuLmVhZTYxY2MgMTAwNjQ0Cj4+Pj4+Pj4gICAgICAgPj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gICAgICAgPj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gICAgICAgPj4+PiBAQCAtMTc1MCw5ICsxNzUw
LDI5IEBAIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0Cj4+Pj4+Pj4gICAgICAgPj4+
PiB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+Pj4+Pj4gICAgICAgPj4+PiB0dG1fYm9fdW5tYXBf
dmlydHVhbF9sb2NrZWQoYm8pOwo+Pj4+Pj4+ICAgICAgID4+Pj4gdHRtX21lbV9pb191bmxvY2so
bWFuKTsKPj4+Pj4+PiAgICAgICA+Pj4+ICAgfQo+Pj4+Pj4+ICAgICAgID4+Pj4gK0VYUE9SVF9T
WU1CT0wodHRtX2JvX3VubWFwX3ZpcnR1YWwpOwo+Pj4+Pj4+ICAgICAgID4+Pj4gICArdm9pZCB0
dG1fYm9fdW5tYXBfdmlydHVhbF9hZGRyZXNzX3NwYWNlKHN0cnVjdAo+Pj4+Pj4+ICAgICAgIHR0
bV9ib19kZXZpY2UgKmJkZXYpCj4+Pj4+Pj4gICAgICAgPj4+PiArewo+Pj4+Pj4+ICAgICAgID4+
Pj4gKyAgICBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbjsKPj4+Pj4+PiAgICAgICA+
Pj4+ICsgICAgaW50IGk7Cj4+Pj4+Pj4gICAgICAgPj4+PiAtRVhQT1JUX1NZTUJPTCh0dG1fYm9f
dW5tYXBfdmlydHVhbCk7Cj4+Pj4+Pj4gICAgICAgPj4+Cj4+Pj4+Pj4gICAgICAgPj4+PiArICAg
IGZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX01FTV9UWVBFUzsgaSsrKSB7Cj4+Pj4+Pj4gICAgICAg
Pj4+PiArICAgICAgICBtYW4gPSAmYmRldi0+bWFuW2ldOwo+Pj4+Pj4+ICAgICAgID4+Pj4gKyAg
ICAgICAgaWYgKG1hbi0+aGFzX3R5cGUgJiYgbWFuLT51c2VfdHlwZSkKPj4+Pj4+PiAgICAgICA+
Pj4+ICsgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwo+Pj4+Pj4+ICAgICAgID4+Pj4gKyAg
ICB9Cj4+Pj4+Pj4gICAgICAgPj4+Cj4+Pj4+Pj4gICAgICAgPj4+IFlvdSBzaG91bGQgZHJvcCB0
aGF0IGl0IHdpbGwganVzdCByZXN1bHQgaW4gYSBkZWFkbG9jawo+Pj4+Pj4+ICAgICAgIHdhcm5p
bmcgZm9yCj4+Pj4+Pj4gICAgICAgPj4+IE5vdXZlYXUgYW5kIGhhcyBubyBlZmZlY3QgYXQgYWxs
Lgo+Pj4+Pj4+ICAgICAgID4+Pgo+Pj4+Pj4+ICAgICAgID4+PiBBcGFydCBmcm9tIHRoYXQgbG9v
a3MgZ29vZCB0byBtZSwKPj4+Pj4+PiAgICAgICA+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+ICAgICAg
ID4+Cj4+Pj4+Pj4gICAgICAgPj4KPj4+Pj4+PiAgICAgICA+PiBBcyBJIGFtIGNvbnNpZGVyaW5n
IHRvIHJlLWluY2x1ZGUgdGhpcyBpbiBWMiBvZiB0aGUKPj4+Pj4+PiAgICAgICBwYXRjaHNldHMs
IGNhbgo+Pj4+Pj4+ICAgICAgID4+IHlvdSBjbGFyaWZ5IHBsZWFzZSB3aHkgdGhpcyB3aWxsIGhh
dmUgbm8gZWZmZWN0IGF0IGFsbCA/Cj4+Pj4+Pj4gICAgICAgPgo+Pj4+Pj4+ICAgICAgID4gVGhl
IGxvY2tzIGFyZSBleGNsdXNpdmUgZm9yIE5vdXZlYXUgdG8gYWxsb2NhdGUvZnJlZSB0aGUgaW8K
Pj4+Pj4+PiAgICAgICBhZGRyZXNzCj4+Pj4+Pj4gICAgICAgPiBzcGFjZS4KPj4+Pj4+PiAgICAg
ICA+Cj4+Pj4+Pj4gICAgICAgPiBTaW5jZSB3ZSBkb24ndCBkbyB0aGlzIGhlcmUgd2UgZG9uJ3Qg
bmVlZCB0aGUgbG9ja3MuCj4+Pj4+Pj4gICAgICAgPgo+Pj4+Pj4+ICAgICAgID4gQ2hyaXN0aWFu
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICBTbyBiYXNpY2FsbHkgY2FsbGluZyB1bm1h
cF9tYXBwaW5nX3JhbmdlIGRvZXNuJ3QgcmVxdWlyZSBhbnkgZXh0cmEKPj4+Pj4+PiAgICAgICBs
b2NraW5nIGFyb3VuZCBpdCBhbmQgd2hhdGV2ZXIgbG9ja3MgYXJlIHRha2VuIHdpdGhpbiB0aGUg
ZnVuY3Rpb24KPj4+Pj4+PiAgICAgICBzaG91bGQgYmUgZW5vdWdoID8KPj4+Pj4+Pgo+Pj4+Pj4+
Cj4+Pj4+Pj4KPj4+Pj4+PiBJIHRoaW5rIHNvLCB5ZXMuCj4+Pj4+Pj4KPj4+Pj4+PiBDaHJpc3Rp
YW4uCj4+Pj4+PiBZZXMsIHRoYXQncyB0cnVlLiBIb3dldmVyLCB3aXRob3V0IHRoZSBibyByZXNl
cnZhdGlvbiwgbm90aGluZyBzdG9wcwo+Pj4+Pj4gYSBQVEUgZnJvbSBiZWluZyBpbW1lZGlhdGVs
eSByZS1mYXVsdGVkIGJhY2sgYWdhaW4uIEV2ZW4gd2hpbGUKPj4+Pj4+IHVubWFwX21hcHBpbmdf
cmFuZ2UoKSBpcyBydW5uaW5nLgo+Pj4+Pj4KPj4+Pj4gQ2FuIHlvdSBleHBsYWluIG1vcmUgb24g
dGhpcyAtIHNwZWNpZmljYWxseSwgd2hpY2ggZnVuY3Rpb24gdG8gcmVzZXJ2ZQo+Pj4+PiB0aGUg
Qk8sIHdoeSBCTyByZXNlcnZhdGlvbiB3b3VsZCBwcmV2ZW50IHJlLWZhdWx0IG9mIHRoZSBQVEUg
Pwo+Pj4+Pgo+Pj4+IFRob21hcyBpcyB0YWxraW5nIGFib3V0IHR0bV9ib19yZXNlcnZlcigpL3R0
bV9ib191bnJlc2VydmUoKSwgYnV0IHdlIGRvbid0Cj4+Pj4gbmVlZCB0aGlzIGJlY2F1c2Ugd2Ug
dW5tYXAgZXZlcnl0aGluZyBiZWNhdXNlIHRoZSB3aG9sZSBkZXZpY2UgaXMgZ29uZSBhbmQKPj4+
PiBub3QganVzdCBtYW5pcHVsYXRlIGEgc2luZ2xlIEJPLgo+Pj4+Cj4+Pj4+PiBTbyB0aGUgZGV2
aWNlIHJlbW92ZWQgZmxhZyBuZWVkcyB0byBiZSBhZHZlcnRpemVkIGJlZm9yZSB0aGlzCj4+Pj4+
PiBmdW5jdGlvbiBpcyBydW4sCj4+Pj4+Pgo+Pj4+PiBJIGluZGVlZCBpbnRlbmQgdG8gY2FsbCB0
aGlzICByaWdodCBhZnRlciBjYWxsaW5nIGRybV9kZXZfdW5wbHVnIGZyb20KPj4+Pj4gYW1kZ3B1
X3BjaV9yZW1vdmUgd2hpbGUgYWRkaW5nIGRybV9kZXZfZW50ZXIvZXhpdCBpbiB0dG1fYm9fdm1f
ZmF1bHQgKG9yCj4+Pj4+IGluIGFtZGdwdSBzcGVjaWZpYyB3cmFwcGVyIHNpbmNlIEkgZG9uJ3Qg
c2VlIGhvdyBjYW4gSSBhY2Nlc3Mgc3RydWN0Cj4+Pj4+IGRybV9kZXZpY2UgZnJvbSB0dG1fYm9f
dm1fZmF1bHQpIGFuZCB0aGlzIGluIG15IHVuZGVyc3RhbmRpbmcgc2hvdWxkCj4+Pj4+IHN0b3Ag
YSBQVEUgZnJvbSBiZWluZyByZS1mYXVsdGVkIGJhY2sgYXMgeW91IHBvaW50ZWQgb3V0IC0gc28g
YWdhaW4gSQo+Pj4+PiBkb24ndCBzZWUgaG93ICBibyByZXNlcnZhdGlvbiB3b3VsZCBwcmV2ZW50
IGl0IHNvIGl0IGxvb2tzIGxpa2UgSSBhbQo+Pj4+PiBtaXNzaW5nIHNvbWV0aGluZy4uLgo+Pj4+
Pgo+Pj4+Pgo+Pj4+Pj4gKHBlcmhhcHMgd2l0aCBhIG1lbW9yeSBiYXJyaWVyIHBhaXIpLgo+Pj4+
Pj4KPj4+Pj4gZHJtX2Rldl91bnBsdWcgYW5kIGRybV9kZXZfZW50ZXIvZXhpdCBhcmUgUkNVIHN5
bmNocm9uaXplZCBhbmQgc28gSQo+Pj4+PiBkb24ndCB0aGluayByZXF1aXJlIGFueSBleHRyYSBt
ZW1vcnkgYmFycmllcnMgZm9yIHZpc2liaWxpdHkgb2YgdGhlCj4+Pj4+IHJlbW92ZWQgZmxhZyBi
ZWluZyBzZXQKPj4+Pj4KPj4+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoYXQgc2hvdWxkIGJlIHBl
cmZlY3RseSBzdWZmaWNpZW50Lgo+Pj4gT25seSBpZiB5b3UgaGF2ZSBhIGRybV9kZXZfZW50ZXIv
ZXhpdCBwYWlyIGluIHlvdXIgZmF1bHQgaGFuZGxlci4KPj4+IE90aGVyd2lzZSB5b3UncmUgc3Rp
bGwgb3BlbiB0byB0aGUgcmFjZXMgVGhvbWFzIGRlc2NyaWJlZC4gQnV0IGFzaWRlIGZyb20KPj4+
IHRoYXQgdGhlIGRybV9kZXZfdW5wbHVnIHN0dWZmIGhhcyBhbGwgdGhlIGJhcnJpZXJzIGFuZCBz
dHVmZiB0byBtYWtlIHN1cmUKPj4+IG5vdGhpbmcgZXNjYXBlcy4KPj4+Cj4+PiBGYWlsdXJlIHRv
IGRybV9kZXZfZW50ZXIgY291bGQgdGhlbiBhbHNvIHRyaWdnZXIgdGhlIHNwZWNpYWwgY2FzZSB3
aGVyZSB3ZQo+Pj4gcHV0IGEgZHVtbXkgcGFnZSBpbiBwbGFjZS4KPj4+IC1EYW5pZWwKPj4gSG1t
LCBZZXMsIGluZGVlZCBhZHZlcnRpemluZyB0aGUgZmxhZyBiZWZvcmUgdGhlIGNhbGwgdG8KPj4g
dW5tYXBfbWFwcGluZ19yYW5nZSBpc24ndCBlbm91Z2gsIHNpbmNlIHRoZXJlIG1pZ2h0IGJlIGZh
dWx0IGhhbmRsZXJzCj4+IHJ1bm5pbmcgdGhhdCBoYXZlbid0IHBpY2tlZCB1cCB0aGUgZmxhZyB3
aGVuIHVubWFwX21hcHBpbmdfcmFuZ2UgaXMKPj4gbGF1bmNoZWQuCj4gSG0gLi4uIE5vdyBJJ20g
bm90IHN1cmUgZHJtX2Rldl9lbnRlci9leGl0IGlzIGFjdHVhbGx5IGdvb2QgZW5vdWdoLiBJCj4g
Z3Vlc3MgaWYgeW91IHVzZSB2bWZfaW5zZXJ0X3BmbiB3aXRoaW4gdGhlIGRybV9kZXZfZW50ZXIv
ZXhpdCBjcml0aWNhbAo+IHNlY3Rpb24sIGl0IHNob3VsZCBiZSBmaW5lLiBCdXQgSSB0aGluayB5
b3UgY2FuIGFsc28gZG8gZmF1bHQgaGFuZGxlcnMKPiB0aGF0IGp1c3QgcmV0dXJuIHRoZSBzdHJ1
Y3QgcGFnZSBhbmQgdGhlbiBsZXQgY29yZSBoYW5kbGUgdGhlIHB0ZQo+IHdyYW5nbGluZywgdGhv
c2Ugd291bGQgaW5kZWVkIHJhY2UgYW5kIHdlIGNhbid0IGhhdmUgdGhhdCBJIHRoaW5rLgo+Cj4g
SSB0aGluayB3ZSBzaG91bGQgdHJ5IGFuZCBtYWtlIHN1cmUgKGFzIG11Y2ggYXMgcG9zc2libGUp
IHRoYXQgdGhpcyBpcwo+IGRvbmUgYWxsIGRvbmUgaW4gaGVscGVycyBhbmQgbm90IHNvbWUgb3Bl
biBjb2RlZCBzdHVmZiBpbiBkcml2ZXJzLCBvcgo+IHdlJ2xsIGp1c3QgZ2V0IGl0IGFsbCB3cm9u
ZyBpbiB0aGUgZGV0YWlscy4KCgpDYW4geW91IHBsZWFzZSBjbGFyaWZ5IHRoaXMgbGFzdCBwYXJh
Z3JhcGggPyBXaGVyZSBpbiB5b3VyIG9waW5pb24gCnNob3VsZCBJIHBsYWNlIHRoZSBkcm1fZGV2
X2VudGVyL2V4aXQgYW5kIHRoZSB6ZXJvIHBhZ2Ugc2V0dGluZ8KgIHRvIApmYXVsdGluZyBWQSdz
IFBURXMgPyBJIHdhcyBwbGFubmluZyB0byBkbyBpdCBpbiBhbWRncHUgc3BlY2lmaWMgLmZhdWx0
IApoYW5kbGVyIHdoaWNoIGluIHR1cm4gY2FsbHMgdG8gdHRtX2JvX3ZtX2ZhdWx0LgoKQW5kcmV5
CgoKPgo+PiBGb3IgdGhlIHNwZWNpYWwgY2FzZSBvZiBzeW5jaW5nIGEgZnVsbCBhZGRyZXNzLXNw
YWNlCj4+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSB3aXRoIGZhdWx0IGhhbmRsZXJzIHJlZ2FyZGxl
c3Mgb2YgdGhlIHJlYXNvbiBmb3IKPj4gdGhlIGZ1bGwgYWRkcmVzcy1zcGFjZSB1bm1hcF9tYXBw
aW5nX3JhbmdlKCkgb25lIGNvdWxkIGVpdGhlciB0cmF2ZXJzZQo+PiB0aGUgYWRkcmVzcyBzcGFj
ZSAoZHJtX3ZtYV9tYW5hZ2VyKSBhbmQgZ3JhYiAqYWxsKiBibyByZXNlcnZhdGlvbnMKPj4gYXJv
dW5kIHRoZSB1bm1hcF9tYXBwaW5nX3JhbmdlKCksIG9yIGdyYWIgdGhlIGlfbW1hcF9sb2NrIGlu
IHJlYWQgbW9kZQo+PiBpbiB0aGUgZmF1bHQgaGFuZGxlci4gKEl0J3MgdGFrZW4gaW4gd3JpdGUg
bW9kZSBpbiB1bm1hcF9tYXBwaW5nX3JhbmdlKS4KPj4gV2hpbGUgdGhlIGxhdHRlciBtYXkgc2Vl
bSBsaWtlIGEgc2ltcGxlIHNvbHV0aW9uLCBvbmUgc2hvdWxkIHByb2JhYmx5Cj4+IGNvbnNpZGVy
IHRoZSBvdmVyaGVhZCBib3RoIGluIHJ1bi10aW1lIGFuZCBzY2FsaW5nIGFiaWxpdHkuCj4gZHJt
X2Rldl9lbnRlci9leGl0IHVzZXMgc3JjdSBpbnRlcm5hbGx5LCBzbyBhZmFpayBzaG91bGQgc2Nh
bGUKPiByaWRpY3Vsb3VzbHkgd2VsbCBhbmQgYmUgZGlydCBjaGVhcCBvbiB0aGUgcmVhZCBzaWRl
LiBJdCdzIGhvcnJpYmxlIG9uCj4gdGhlIGZsdXNoIHNpZGUgaW4gZHJtX2Rldl91bnBsdWcsIGJ1
dCBoZXkgbm8gb25lIGNhcmVzIGFib3V0IHRoYXQgOi0pCj4gLURhbmllbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
