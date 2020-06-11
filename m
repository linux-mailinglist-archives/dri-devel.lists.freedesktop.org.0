Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF131F6A96
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 17:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D056E0A2;
	Thu, 11 Jun 2020 15:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA76E0A2;
 Thu, 11 Jun 2020 15:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMhtQ7dMcUbF9RJJKx32oOUCHPTyhPzBNXm/FCh/7XSmBHwriQBauShIkiwrNza4hteIdumg3AF+t5P8AqUZ3T9GU0MfwIzXLzI/dVM2THQ1+rjBeyQG1z1as07O/9PzbQ294gqWQFEqOVQxCFc2DKPqjGs/aCOhdp/JdZ+2UxzsOfyLlXGWga+MYt5tQQTVL8UBQ3dymGVeAFX3BDxVl4rhkyfRhywfh+BK1pEPllxVZMh8YGoiIlwvsVTuwEHbkA5NFAiD7GvGwrvaYcKR6FxjS4jDFu1y1Yt2A5pyqPH0gGnH8YTRt/81HFS6ZhF8XmcvnnSJR2Z7FmAf27+D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riWSeU3BxD6NDZNGOsGFws+DHBl0GTc5eqgaVNUe3PE=;
 b=QxFqErHiwQqBLxZXlHHP98St5PyVXFrEJH+EeCxkh4yPKRbuvHAy8JUvwsS0+vZ0kioUx0y6gqI2ckQ9QqQCbrAHU0OeyEd4kCXolGbJe5lmS9r2TBgbPeOTFDU2cScBA03KaQLmq7GWEiXJdfTniJFC12gZ7gnJWQca1j/EU5Sg/BPWROvW8Q0FKQAinPjBEwRA8omUvvvfVE3XpHxhE0f16pvtjCa+8mg5v5lKNSZfvWTefEoxMxHDQ5VdlDDFfCXGUubtL9+UHuP2L3jO5pWABdYq2s9aoiuIOH0YS0sK3FKY+4ZxPfawEAs0oCqmEr21r+L8N96F5CwWzUidbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riWSeU3BxD6NDZNGOsGFws+DHBl0GTc5eqgaVNUe3PE=;
 b=MsNPRrOO0F1FIvjJFmIYjQbyMVpJ9VPHy2RPGxW5Q/6ZDMJfK3vjLfjvOluxsXyaB1b958Lz0s/9N/1RwYpz6z23GnEL+bnzi8FQttVDFddOtZHuZSDJD+P/Dv5DkL4hJXUIceTW/otcVPdFIrFEMAaqMOwrj945PFogOdRzKRw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19; Thu, 11 Jun 2020 15:06:18 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 15:06:18 +0000
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <52eec123-3fb1-843d-4ede-1fa0daeaa8ce@amd.com>
 <36ee0021-3044-4ae9-0d13-cbc1aba03022@shipmail.org>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <95df8d05-72b3-f4bd-f68a-696e402e5599@amd.com>
Date: Thu, 11 Jun 2020 11:06:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <36ee0021-3044-4ae9-0d13-cbc1aba03022@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c]
 (2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c) by
 YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 15:06:17 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:539:76a4:6ff2:bc3c]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfb6360e-4636-4ec9-3d75-08d80e18fe2a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4137A74591A3C8DBEEAED4B9EA800@DM6PR12MB4137.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1X5Np4MdQtl0RhvXCx7Ut7uNahl3ou6BWioq03L9xeFT7iFhrSWUTGUrVsHUBeHhwy4gt59wNUnhaVRVRqn/v/k4UVzvKGg/Vebh518LOwWMGJTC3LJab2lwTZxEGKKyUaN9SRFvvkum4zmHHDYW7Gp1wb/nZAVWdL78OWrk/cCIDgZMHRJJ7WZQYD/TU0UTZ2UperHCXC3vsl10Ya8wvwZUjP639sUgKnW4n0PnGZWxSIo/xKrsi2s6c2W6y8M/zoaW1D9chECs8S5HmY5HwLkXHsWiUo3UttxfD9ZvZcFUW9zTp0rmNaU/kE/sS3QSp1YROs9sh6i+dqovH+enSFTNDm4tGFGtsHvAVw/dqTfnmfZSxOL/iXrqa7IFmhNX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(110136005)(478600001)(54906003)(53546011)(52116002)(16526019)(316002)(66574014)(83380400001)(4326008)(186003)(2616005)(5660300002)(66556008)(6486002)(66946007)(8676002)(8936002)(31686004)(86362001)(66476007)(36756003)(6636002)(2906002)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Fjj8SUmSu7/piP3hrJg4/l+ixtNVwhqPS0J/JySZtDdLcZXflFVLQLzSasVGHMjS/kpXeg11/RMEXG0sJ+UUz5kVqsuFspesNosz7ogEI7/wWOjZJukEz9vS7VQB2G1offyRQ3/+No+gBzz8bYHhm/BWZst2yPNjE2Az9PNqEXmSyZf+EN/xel2R130zQlt5s5gQeWKglOBDYO8DCaTeufAPTfraeQJw8TEcc6dZN9lEhAG7oeRTUPgelkVMzx/jt+M2Eb5cHPjUy+Wp9fhUDKvtRT3iN72DpukpfLnxGqxezFO9jd5o7HGLRypDRGQtg5v4aLvtcAgCjA7Ww/a/n2HWAC2pFkeF8n67nEhd94RUf4opWF4dTZ5ofML9OWqRSrYpHNIxcQOQ/A2yP1Cnb/m3ZrEMsN4kVdG0cDnXnCoeMQkn2rARVmDiY9GxrTQDpzof/OHiBBDmL6xqYr3h3PJ44L+QCu+/7c66hmXWziM3i51Xf4yFJn/3r8mmgI1BE3lHzFK+yuRyTB9n6AQkazQiiciyPVzj4kVDu6LToGA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb6360e-4636-4ec9-3d75-08d80e18fe2a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 15:06:18.1041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSRNgMcALz4+q+8A0YVoKvZFV+bgBkghQNvzQIlowVsSvUPL1NT7okkoLDq3XmHKD3KQvYbBnNORXcC33ir5LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTEvMjAgMjozNSBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPgo+
IE9uIDYvMTAvMjAgMTE6MTkgUE0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pgo+PiBPbiA2
LzEwLzIwIDQ6MzAgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pgo+Pj4g
T24gNi8xMC8yMCA1OjMwIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVu
IDEwLCAyMDIwIGF0IDA0OjA1OjA0UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Pj4+IEFtIDEwLjA2LjIwIHVtIDE1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+
Pgo+Pj4+Pj4gT24gNi8xMC8yMCA2OjE1IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdy
b3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gNi85LzIwIDc6MjEgUE0sIEtvZW5pZywgQ2hyaXN0aWFu
IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbSAwOS4wNi4yMDIwIDE4OjM3IHNjaHJpZWIgIkdy
b2R6b3Zza3ksIEFuZHJleSIKPj4+Pj4+Pj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+Ogo+
Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiDCoMKgwqDCoCBPbiA2LzUvMjAgMjo0MCBQTSwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4gwqDCoMKgwqAgPiBBbSAwNS4wNi4yMCB1bSAx
NjoyOSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+PiDCoMKgwqDCoCA+Pgo+Pj4+
Pj4+PiDCoMKgwqDCoCA+PiBPbiA1LzExLzIwIDI6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+PiBBbSAwOS4wNS4yMCB1bSAyMDo1MSBzY2hyaWViIEFu
ZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IAo+Pj4+Pj4+PiA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+
Pj4+Pj4gwqDCoMKgwqAgPj4+PiAtLS0KPj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQo+Pj4+Pj4+PiDC
oMKgwqDCoCA+Pj4+IGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAyICsrCj4+Pj4+
Pj4+IMKgwqDCoMKgID4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4KPj4+Pj4+Pj4gwqDCoMKgwqAgPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+PiDCoMKg
wqDCoCA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+PiDCoMKgwqDC
oCA+Pj4+IGluZGV4IGM1YjUxNmYuLmVhZTYxY2MgMTAwNjQ0Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+PiDCoMKgwqDCoCA+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4+Pj4gwqDCoMKgwqAg
Pj4+PiBAQCAtMTc1MCw5ICsxNzUwLDI5IEBAIHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3Ry
dWN0Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+Pj4+Pj4+
PiDCoMKgwqDCoCA+Pj4+IHR0bV9ib191bm1hcF92aXJ0dWFsX2xvY2tlZChibyk7Cj4+Pj4+Pj4+
IMKgwqDCoMKgID4+Pj4gdHRtX21lbV9pb191bmxvY2sobWFuKTsKPj4+Pj4+Pj4gwqDCoMKgwqAg
Pj4+PiDCoCB9Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK0VYUE9SVF9TWU1CT0wodHRtX2JvX3Vu
bWFwX3ZpcnR1YWwpOwo+Pj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IMKgICt2b2lkIHR0bV9ib191bm1h
cF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2Uoc3RydWN0Cj4+Pj4+Pj4+IMKgwqDCoMKgIHR0bV9ib19k
ZXZpY2UgKmJkZXYpCj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK3sKPj4+Pj4+Pj4gwqDCoMKgwqAg
Pj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+Pj4+Pj4+PiDC
oMKgwqDCoCA+Pj4+ICvCoMKgwqAgaW50IGk7Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gLUVYUE9S
VF9TWU1CT0wodHRtX2JvX3VubWFwX3ZpcnR1YWwpOwo+Pj4+Pj4+PiDCoMKgwqDCoCA+Pj4KPj4+
Pj4+Pj4gwqDCoMKgwqAgPj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX01FTV9U
WVBFUzsgaSsrKSB7Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK8KgwqDCoMKgwqDCoMKgIG1hbiA9
ICZiZGV2LT5tYW5baV07Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChtYW4tPmhhc190eXBlICYmIG1hbi0+dXNlX3R5cGUpCj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4g
KyB0dG1fbWVtX2lvX2xvY2sobWFuLCBmYWxzZSk7Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK8Kg
wqDCoCB9Cj4+Pj4+Pj4+IMKgwqDCoMKgID4+Pgo+Pj4+Pj4+PiDCoMKgwqDCoCA+Pj4gWW91IHNo
b3VsZCBkcm9wIHRoYXQgaXQgd2lsbCBqdXN0IHJlc3VsdCBpbiBhIGRlYWRsb2NrCj4+Pj4+Pj4+
IMKgwqDCoMKgIHdhcm5pbmcgZm9yCj4+Pj4+Pj4+IMKgwqDCoMKgID4+PiBOb3V2ZWF1IGFuZCBo
YXMgbm8gZWZmZWN0IGF0IGFsbC4KPj4+Pj4+Pj4gwqDCoMKgwqAgPj4+Cj4+Pj4+Pj4+IMKgwqDC
oMKgID4+PiBBcGFydCBmcm9tIHRoYXQgbG9va3MgZ29vZCB0byBtZSwKPj4+Pj4+Pj4gwqDCoMKg
wqAgPj4+IENocmlzdGlhbi4KPj4+Pj4+Pj4gwqDCoMKgwqAgPj4KPj4+Pj4+Pj4gwqDCoMKgwqAg
Pj4KPj4+Pj4+Pj4gwqDCoMKgwqAgPj4gQXMgSSBhbSBjb25zaWRlcmluZyB0byByZS1pbmNsdWRl
IHRoaXMgaW4gVjIgb2YgdGhlCj4+Pj4+Pj4+IMKgwqDCoMKgIHBhdGNoc2V0cywgY2FuCj4+Pj4+
Pj4+IMKgwqDCoMKgID4+IHlvdSBjbGFyaWZ5IHBsZWFzZSB3aHkgdGhpcyB3aWxsIGhhdmUgbm8g
ZWZmZWN0IGF0IGFsbCA/Cj4+Pj4+Pj4+IMKgwqDCoMKgID4KPj4+Pj4+Pj4gwqDCoMKgwqAgPiBU
aGUgbG9ja3MgYXJlIGV4Y2x1c2l2ZSBmb3IgTm91dmVhdSB0byBhbGxvY2F0ZS9mcmVlIHRoZSBp
bwo+Pj4+Pj4+PiDCoMKgwqDCoCBhZGRyZXNzCj4+Pj4+Pj4+IMKgwqDCoMKgID4gc3BhY2UuCj4+
Pj4+Pj4+IMKgwqDCoMKgID4KPj4+Pj4+Pj4gwqDCoMKgwqAgPiBTaW5jZSB3ZSBkb24ndCBkbyB0
aGlzIGhlcmUgd2UgZG9uJ3QgbmVlZCB0aGUgbG9ja3MuCj4+Pj4+Pj4+IMKgwqDCoMKgID4KPj4+
Pj4+Pj4gwqDCoMKgwqAgPiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IMKg
wqDCoMKgIFNvIGJhc2ljYWxseSBjYWxsaW5nIHVubWFwX21hcHBpbmdfcmFuZ2UgZG9lc24ndCBy
ZXF1aXJlIAo+Pj4+Pj4+PiBhbnkgZXh0cmEKPj4+Pj4+Pj4gwqDCoMKgwqAgbG9ja2luZyBhcm91
bmQgaXQgYW5kIHdoYXRldmVyIGxvY2tzIGFyZSB0YWtlbiB3aXRoaW4gdGhlIAo+Pj4+Pj4+PiBm
dW5jdGlvbgo+Pj4+Pj4+PiDCoMKgwqDCoCBzaG91bGQgYmUgZW5vdWdoID8KPj4+Pj4+Pj4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSB0aGluayBzbywgeWVzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBDaHJpc3RpYW4uCj4+Pj4+Pj4gWWVzLCB0aGF0J3MgdHJ1ZS4gSG93ZXZlciwgd2l0aG91dCB0
aGUgYm8gcmVzZXJ2YXRpb24sIG5vdGhpbmcgCj4+Pj4+Pj4gc3RvcHMKPj4+Pj4+PiBhIFBURSBm
cm9tIGJlaW5nIGltbWVkaWF0ZWx5IHJlLWZhdWx0ZWQgYmFjayBhZ2Fpbi4gRXZlbiB3aGlsZQo+
Pj4+Pj4+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSBpcyBydW5uaW5nLgo+Pj4+Pj4+Cj4+Pj4+PiBD
YW4geW91IGV4cGxhaW4gbW9yZSBvbiB0aGlzIC0gc3BlY2lmaWNhbGx5LCB3aGljaCBmdW5jdGlv
biB0byAKPj4+Pj4+IHJlc2VydmUKPj4+Pj4+IHRoZSBCTywgd2h5IEJPIHJlc2VydmF0aW9uIHdv
dWxkIHByZXZlbnQgcmUtZmF1bHQgb2YgdGhlIFBURSA/Cj4+Pj4+Pgo+Pj4+PiBUaG9tYXMgaXMg
dGFsa2luZyBhYm91dCB0dG1fYm9fcmVzZXJ2ZXIoKS90dG1fYm9fdW5yZXNlcnZlKCksIGJ1dCAK
Pj4+Pj4gd2UgZG9uJ3QKPj4+Pj4gbmVlZCB0aGlzIGJlY2F1c2Ugd2UgdW5tYXAgZXZlcnl0aGlu
ZyBiZWNhdXNlIHRoZSB3aG9sZSBkZXZpY2UgaXMgCj4+Pj4+IGdvbmUgYW5kCj4+Pj4+IG5vdCBq
dXN0IG1hbmlwdWxhdGUgYSBzaW5nbGUgQk8uCj4+Pj4+Cj4+Pj4+Pj4gU28gdGhlIGRldmljZSBy
ZW1vdmVkIGZsYWcgbmVlZHMgdG8gYmUgYWR2ZXJ0aXplZCBiZWZvcmUgdGhpcwo+Pj4+Pj4+IGZ1
bmN0aW9uIGlzIHJ1biwKPj4+Pj4+Pgo+Pj4+Pj4gSSBpbmRlZWQgaW50ZW5kIHRvIGNhbGwgdGhp
c8KgIHJpZ2h0IGFmdGVyIGNhbGxpbmcgZHJtX2Rldl91bnBsdWcgCj4+Pj4+PiBmcm9tCj4+Pj4+
PiBhbWRncHVfcGNpX3JlbW92ZSB3aGlsZSBhZGRpbmcgZHJtX2Rldl9lbnRlci9leGl0IGluIAo+
Pj4+Pj4gdHRtX2JvX3ZtX2ZhdWx0IChvcgo+Pj4+Pj4gaW4gYW1kZ3B1IHNwZWNpZmljIHdyYXBw
ZXIgc2luY2UgSSBkb24ndCBzZWUgaG93IGNhbiBJIGFjY2VzcyBzdHJ1Y3QKPj4+Pj4+IGRybV9k
ZXZpY2UgZnJvbSB0dG1fYm9fdm1fZmF1bHQpIGFuZCB0aGlzIGluIG15IHVuZGVyc3RhbmRpbmcg
c2hvdWxkCj4+Pj4+PiBzdG9wIGEgUFRFIGZyb20gYmVpbmcgcmUtZmF1bHRlZCBiYWNrIGFzIHlv
dSBwb2ludGVkIG91dCAtIHNvIAo+Pj4+Pj4gYWdhaW4gSQo+Pj4+Pj4gZG9uJ3Qgc2VlIGhvd8Kg
IGJvIHJlc2VydmF0aW9uIHdvdWxkIHByZXZlbnQgaXQgc28gaXQgbG9va3MgbGlrZSBJIGFtCj4+
Pj4+PiBtaXNzaW5nIHNvbWV0aGluZy4uLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gKHBlcmhhcHMg
d2l0aCBhIG1lbW9yeSBiYXJyaWVyIHBhaXIpLgo+Pj4+Pj4+Cj4+Pj4+PiBkcm1fZGV2X3VucGx1
ZyBhbmQgZHJtX2Rldl9lbnRlci9leGl0IGFyZSBSQ1Ugc3luY2hyb25pemVkIGFuZCBzbyBJCj4+
Pj4+PiBkb24ndCB0aGluayByZXF1aXJlIGFueSBleHRyYSBtZW1vcnkgYmFycmllcnMgZm9yIHZp
c2liaWxpdHkgb2YgdGhlCj4+Pj4+PiByZW1vdmVkIGZsYWcgYmVpbmcgc2V0Cj4+Pj4+Pgo+Pj4+
PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoYXQgc2hvdWxkIGJlIHBlcmZlY3RseSBzdWZmaWNpZW50
Lgo+Pj4+IE9ubHkgaWYgeW91IGhhdmUgYSBkcm1fZGV2X2VudGVyL2V4aXQgcGFpciBpbiB5b3Vy
IGZhdWx0IGhhbmRsZXIuCj4+Pj4gT3RoZXJ3aXNlIHlvdSdyZSBzdGlsbCBvcGVuIHRvIHRoZSBy
YWNlcyBUaG9tYXMgZGVzY3JpYmVkLiBCdXQgCj4+Pj4gYXNpZGUgZnJvbQo+Pj4+IHRoYXQgdGhl
IGRybV9kZXZfdW5wbHVnIHN0dWZmIGhhcyBhbGwgdGhlIGJhcnJpZXJzIGFuZCBzdHVmZiB0byAK
Pj4+PiBtYWtlIHN1cmUKPj4+PiBub3RoaW5nIGVzY2FwZXMuCj4+Pj4KPj4+PiBGYWlsdXJlIHRv
IGRybV9kZXZfZW50ZXIgY291bGQgdGhlbiBhbHNvIHRyaWdnZXIgdGhlIHNwZWNpYWwgY2FzZSAK
Pj4+PiB3aGVyZSB3ZQo+Pj4+IHB1dCBhIGR1bW15IHBhZ2UgaW4gcGxhY2UuCj4+Pj4gLURhbmll
bAo+Pj4KPj4+IEhtbSwgWWVzLCBpbmRlZWQgYWR2ZXJ0aXppbmcgdGhlIGZsYWcgYmVmb3JlIHRo
ZSBjYWxsIHRvIAo+Pj4gdW5tYXBfbWFwcGluZ19yYW5nZSBpc24ndCBlbm91Z2gsIHNpbmNlIHRo
ZXJlIG1pZ2h0IGJlIGZhdWx0IAo+Pj4gaGFuZGxlcnMgcnVubmluZyB0aGF0IGhhdmVuJ3QgcGlj
a2VkIHVwIHRoZSBmbGFnIHdoZW4gCj4+PiB1bm1hcF9tYXBwaW5nX3JhbmdlIGlzIGxhdW5jaGVk
Lgo+Pgo+Pgo+PiBJZiB5b3UgbWVhbiB0aG9zZSBmYXVsdCBoYW5kbGVycyB0aGF0IHdlcmUgaW4g
cHJvZ3Jlc3Mgd2hlbiB0aGUgZmxhZyAKPj4gKGRybV9kZXZfdW5wbHVnKSB3YXMgc2V0IGluIGFt
ZGdwdV9wY2lfcmVtb3ZlIHRoZW4gYXMgbG9uZyBhcyBpIHdyYXAgCj4+IHRoZSBlbnRpcmUgZmF1
bHQgaGFuZGxlciAocHJvYmFibHkgdXNpbmcgYW1kZ3B1IHNwZWNpZmljIC5mYXVsdCBob29rIAo+
PiBhcm91bmQgdHRtX2JvX3ZtX2ZhdWx0KSB3aXRoIGRybV9kZXZfZW50ZXIvZXhpdCBwYWlyIHRo
ZW4gCj4+IGRybV9kZXZfdW5wbHVnLT5zeW5jaHJvbml6ZV9zcmN1IHdpbGwgYmxvY2sgdW50aWwg
dGhvc2UgaW4gcHJvZ3Jlc3MgCj4+IGZhdWx0cyBoYXZlIGNvbXBsZXRlZCBhbmQgb25seSBhZnRl
ciB0aGlzIGkgd2lsbCBjYWxsIAo+PiB1bm1hcF9tYXBwaW5nX3JhbmdlLiBTaG91bGQgdGhpcyBi
ZSBlbm91Z2ggPwo+Pgo+PiBBbmRyZXkKPj4KPj4KPiBZZXMsIEkgYmVsaWV2ZSBzby4gQWx0aG91
Z2ggSSBzdXNwZWN0IHlvdSBtaWdodCB0cmlwIGxvY2tkZXAgd2l0aCAKPiByZXZlcnNlIGxvY2tp
bmcgb3JkZXIgYWdhaW5zdCB0aGUgbW1hcF9zZW0gd2hpY2ggaXMgYSBjb25zdGFudCBwYWluIGlu
IAo+IGZhdWx0IGhhbmRsZXJzLiBJZiB0aGF0J3MgdGhlIGNhc2UsIHlvdSBtaWdodCBiZSBhYmxl
IHRvIGludHJvZHVjZSAKPiBhbm90aGVyIHNyY3UgbG9jayBmb3IgdGhpcyBzcGVjaWFsIHB1cnBv
c2UgYW5kIHN5bmNocm9uaXplIGp1c3QgYmVmb3JlIAo+IHRoZSBhZGRyZXNzLXNwYWNlLXdpZGUg
dW5tYXBfbWFwcGluZ19yYW5nZSgpLiBJZiBpdCB0dXJucyBvdXQgdGhhdCBhbiAKPiBhZGRyZXNz
IHNwYWNlIHNyY3UgbG9jayBsaWtlIHRoaXMgaXMgcmVhbGx5IG5lZWRlZCwgd2Ugc2hvdWxkIGZv
bGxvdyAKPiBEYW5pZWwncyBzdWdnZXN0aW9uIGFuZCB0cnkgdG8gdXNlIGl0IGZyb20gZHJtLXdp
ZGUgaGVscGVycy4KPgo+IC9UaG9tYXMKCgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gcHJlZmF1bHQg
YW5kIHNldCB0byB6ZXJvIHBhZ2UgdGhlIGVudGlyZSBWQSByYW5nZSAKY292ZXJlZCBieSB0aGUg
Z2l2ZW4gVk1BIG9uIHRoZSBmaXJzdCBwYWdlIGZhdWx0IHBvc3QgZGV2aWNlIGRpc2Nvbm5lY3Qg
CnRvIHNhdmUgb24gb3RoZXIgc2ltaWxhciBwYWdlIGZhdWx0cyA/CgpBbmRyZXkKCgo+Cj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
