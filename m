Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC122A1373
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 06:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7104C6E147;
	Sat, 31 Oct 2020 05:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E406E0FD;
 Sat, 31 Oct 2020 05:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCcObwhQkdHNXjKz11B4UwdFzzrqwnqLMHAhikwBJggDg6xB++O+xLvkvaTffB0i0AmFvuHQg4VPLVjXcdGT/o0BH8krm2oDuQ67ZaUKuYO7XUHOH98ZANRkJ4WNkHpYe5v/AidOxLAyyaf+noStGAOPxImzFhORUg7cIV5FVIBwGXKd67EWjsgTQh0ik0i8vhAsJQcKGYOqiTDGXVgAxl0qfCoWo2p0y8FEDVnl3GldPb3XCjLWaOlZkkk2JlXKHNBenVOcwCwtUgwfbVh0lWavghE6d0ZwNgRc4vXFGAMnnmZI1jLpvr/+N8x1T7SrzezQYSOgmIzeg6SVvZ1TDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlmwZQmqjIOZCU9QxVh0jNM4dQjOnt3nYkwxx9OEYV0=;
 b=g0ZqTbV50EK78hTmdts2KEmi88EaFUZOjBXTh73Fd3JSjma5Dk1cBElVuEu9k/W099jvbR651DOdytUNzNTS86YphJnqPJCkJqZOPgf/QOvjUzWD9mK+Dd8XmGgSX0WXZ9vDcsRs/TRtCEkHZjzA5LwWoTy9066IxWG4fbQKVipnw5yt2DoYxLE4DMHrJdcFPQP+JpQjh5IcGgwLfV2TcOVpXtpqRvb/L86geX2Fhtcx6y/4zIxLnCIZ1O19HIFA/BxXsCS/3HDAeyCDT49JMDEengg9m9dv4dKk/BmGKD4VX/2qTXmfE1odnZ3R/1f6xjJeTaVJRI27nQzmfzHY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlmwZQmqjIOZCU9QxVh0jNM4dQjOnt3nYkwxx9OEYV0=;
 b=oYHjiakTNK8gvB+4Zjkc+Av91Pr13e+xJH/0DANcVINoI7Z/8a0hG4s/SmORntaKDG6SvMplERVb5CPwxKpUvJQqZaGArmXfivflFC73Xvm9Hbuw4xDWwI6Fe0QDFhqWFtWqtC6hA3Y6JfaS+CjPBH8532JtaSpWiAlFmrCA0vs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Sat, 31 Oct
 2020 05:09:24 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::935:a67:59f8:7067%7]) with mapi id 15.20.3499.028; Sat, 31 Oct 2020
 05:09:24 +0000
Subject: Re: [PATCH 3/5] drm/amdgpu: Paper over the drm_driver mangling for
 virt
To: Daniel Vetter <daniel.vetter@ffwll.ch>, "Liu, Monk" <Monk.Liu@amd.com>
References: <20201030101104.2503-1-daniel.vetter@ffwll.ch>
 <20201030101104.2503-3-daniel.vetter@ffwll.ch>
 <DM5PR12MB1708CC019EE615AA6B3D8A0184150@DM5PR12MB1708.namprd12.prod.outlook.com>
 <CAKMK7uGjiVVemSHUBCJoeYfkY42Hegfz6gikkrYp_nxYCF4FUA@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <f4c6da45-35c4-572f-46ed-9dd6aaa7d4a6@amd.com>
Date: Sat, 31 Oct 2020 01:09:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <CAKMK7uGjiVVemSHUBCJoeYfkY42Hegfz6gikkrYp_nxYCF4FUA@mail.gmail.com>
Content-Language: en-CA
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::30) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YTBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Sat, 31 Oct 2020 05:09:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef9de376-3254-4a05-a641-08d87d5b2222
X-MS-TrafficTypeDiagnostic: DM5PR12MB1356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB13564D283D1AB5002F97508099120@DM5PR12MB1356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ufmPLCwzvXZb7iCLMvAW6WSFks9ZQwZDrvnUabIAV/La97kYtOF+gN4MoaeqZ6xfIox3Zv1DU0zntDevI2c5gk5ADeYuPO5aXsWoApZhlh1ufJ+jxetlScJ1IID/I5XxvkHkEtJRGRDSXcLHWEFPcjbazyglgqw+CsRqml3BCm9VYosjpYApgL1Jxd7UNfB7Fsx3M23bW5Yl8FFstd2RDDv8ttEpVN43vwxwH+7t31yjWf8CfsA1Y1BzvlYyRE4oG4LuTw8R3h4FF3q1gSIFX2KwYuBD/k5NomEutbrYU4sN4CEft7DNqCYgjuAhYCaUXoGbN//EpEZzzSNWf/JgIvHaMUC5S/+MxbucKlVNrEW/OiVPaJ9QF77fEK17wWJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(31686004)(4001150100001)(86362001)(44832011)(956004)(2616005)(8936002)(36756003)(8676002)(2906002)(4326008)(66574015)(83380400001)(16576012)(6486002)(110136005)(54906003)(6636002)(478600001)(316002)(53546011)(5660300002)(52116002)(31696002)(16526019)(66946007)(186003)(26005)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: t3PxI7HQqeAqweYsdSAXnBAjYFPfVKxk3VKAO0U4u/0vP8uKqoqQ5HvY/dE4qRiCcuLbnztSzzD4O5QANA2qmiguGXuorMfNE0HVr4mvzWcFpTcy94AROVwcVwsGDulelv5aV9uHDDTl2J1H2tyr9SWYlOEzKw/yEIJn6AB2uwTG/5nNigH93ewQoizFyf5qZeYKpKlAmZMUnwxu+lIA933Z1E8X2mDC/R0bZ8djte5dwIn74wxflHZJ/RIINkxQvOjtSSOc3peUgVm1SCNUwZd7uipzi+UI/uvOfo2QzQCHrQ32KUfTuGj8rrKUWOkLq0vU+udvBgBjA4ELk4zt/98WFdS9dH60mitLwNVo2VLEWHo55TwSplopg9uLNJ6jF6hQ8tSkJib+9p3qto8Yl1Ahg0DIcQdHcIYsJdOsRrXTPZdEqkKETRIsnvwbOoKQUDzQenydSLInRKWbRp7GdpFESju33OiuP9f/ABJTi2p9t/WmVKhNixuvuP3bG/RyJRSlFri/j+9pfXhFwTWS5a7zYhF+huSNZm/FHE1eZFpq5T/Kpvztxg3ZKVG7q7utw6PnJrdhfeyUAQZV6XgBT0FShm1shw/InyQ0RaFRTmVZwaXZV5u0C954avKIfs5D/UwYYr09Wo0YBkDh+qDA/w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9de376-3254-4a05-a641-08d87d5b2222
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2020 05:09:24.3485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPpsWzLCHHEh/QQYPWLyhv4WXFdFew0bErtNsbGf+rhom60GBJQ2h6DlI+McIS3t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>,
 "Yang, Stanley" <Stanley.Yang@amd.com>, "Sheng, Wenhui" <Wenhui.Sheng@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Yintian Tao <yttao@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMC0zMCAwODowNCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIE9jdCAz
MCwgMjAyMCBhdCAxMTo0MSBBTSBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+IHdyb3RlOgo+
Pgo+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHld
Cj4+Cj4+IFdoYXQncyB0aGUgcHVycG9zZSBvZiB0aGUgcGF0Y2ggc2V0cwo+Pgo+PiBlLmcuOiB3
aGF0IGJ1ZyBjYW4gdGhvc2UgNSBwYXRjaGVzIGZpeCBvciB3aGF0IGZlYXR1cmUgcHJvdmlkZWQK
Pj4KPj4gZm9yIHRoaXMgcGFydGljdWxhciBvbmUgKDMvNSkgSSBkaWRuJ3Qgc2VlIGhvdyBpdCBo
ZWxwZnVsLCBjb3VsZCB5b3UgZ2l2ZSBhIGJhY2tncm91bmQgID8KPiAKPiBJdCdzIGdvb2QgdG8g
bWFrZSBmdW5jdGlvbiB0YWJsZXMgY29uc3QsIHNvIHRoYXQgdGhleSBjYW4gYmUgd3JpdGUKPiBw
cm90ZWN0ZWQuIE1vcmUgcmVzaWxpZW5jZSBhZ2FpbnN0IGV4cGxvaXRzIGFuZCBhbGwgdGhhdC4g
VGhpcyBwYXRjaAo+IGhlcmUgaXMgbmVlZGVkIHRvIGJlIGFibGUgdG8gbWFrZSBkcm1fZGV2aWNl
LT5kcml2ZXIgY29uc3Qgc28gdGhhdCBhbGwKPiBvdGhlciBkcml2ZXJzIGNhbiBtYWtlIHRoZWly
IGRybV9kcml2ZXIgc3RydWN0dXJlIGNvbnN0LiBXb3VsZCBiZSBnb29kCj4gdG8gZnVsbHkgZml4
IHVwIGFtZGdwdSBsaWtlIGluIHRoZSBjb21tZW50LCBidXQgSSdtIG5vdCBnb2luZyB0aGF0IGlu
Cj4gdGhpcyBzZXJpZXMgaGVyZS4KPiAtRGFuaWVsCgpIaSBEYW5pZWwsCgpJIGZlZWwgdGhhdCB0
aGF0J3MgYSBnb29kIGNoYW5nZS4KCkJ1dCBpZiB5b3UgY2FuIGNsYXJpZnkgdGhpcyBmb3IgbWUu
Li4gSXMgdGhpcyBsZWFkaW5nCnRvd2FyZHMgYSBzaW5nbGUgaW5zdGFuY2Ugb2YgYSBzdHJ1Y3Qg
ZHJtX2RyaXZlciBwZXIKbG93LWxldmVsIGRyaXZlciwgaS5lLiBhbWRncHU/CgpBbmQgYXMgc3Vj
aCwgYmVpbmcgYWJsZSB0byBiZSBkZWZpbmVkIGFzIGNvbnN0PwoKU28gdGhhdCB3ZSBoYXZlIG1h
bnkgR1BVIGRldmljZXMgZHJpdmVuIGJ5IG9uZQpsb3ctbGV2ZWwgZHJpdmVyIChhbWRncHVfZHJ2
KSwgcmVwcmVzZW50ZWQgYnkgb25lCmNvbnN0IGRybV9kcml2ZXIgKGFuZCB0aHVzIGNvbnN0KT8K
CldoaWNoIHdvdWxkIGltcGx5IHRoYXQgaWYgdmFyaWVkIGRldmljZXMgY2FuIGJlIGhhbmRsZWQK
YnkgYSBzaW5nbGUgbG93LWxldmVsIGRyaXZlciwgd2hvc2Ugc3RydWN0IGRybV9kcml2ZXIKc2V0
dGluZ3MgY2Fubm90IGJlIHNoYXJlZCBhbW9uZyBzdWJzZXQgb2YgZGV2aWNlcyAoc2F5CnZlcnkg
b2xkIGFuZCBuZXcpLCB0aGVuIHRoZSBsb3ctbGV2ZWwgZHJpdmVyCndvdWxkIGhhdmUgdG8gY3Jl
YXRlIG1vcmUgdGhhbiBvbmUgImNvbnN0IiBzdHJ1Y3QgZHJtX2RyaXZlcj8KClJlZ2FyZHMsCkx1
YmVuCgo+IAo+Pgo+PiB0aGFua3MKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBNb25rIExpdXxHUFUgVmlydHVhbGl6YXRpb24gVGVhbSB8QU1ECj4+Cj4+Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cj4+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAzMCwgMjAyMCA2OjExIFBN
Cj4+IFRvOiBEUkkgRGV2ZWxvcG1lbnQgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
Cj4+IENjOiBJbnRlbCBHcmFwaGljcyBEZXZlbG9wbWVudCA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyBEZXVj
aGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFt
ZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBaaGFuZywg
SGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRy
ZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgVHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5j
b20+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IExpdSwgTW9uayA8
TW9uay5MaXVAYW1kLmNvbT47IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPjsgTGksIERlbm5p
cyA8RGVubmlzLkxpQGFtZC5jb20+OyBMaXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+
OyBaaGFuZywgQm9rdW4gPEJva3VuLlpoYW5nQGFtZC5jb20+OyBZYW5nLCBTdGFubGV5IDxTdGFu
bGV5LllhbmdAYW1kLmNvbT47IFNoZW5nLCBXZW5odWkgPFdlbmh1aS5TaGVuZ0BhbWQuY29tPjsg
R29uZywgQ3VycnkgPEN1cnJ5LkdvbmdAYW1kLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggMy81XSBkcm0vYW1kZ3B1OiBQYXBl
ciBvdmVyIHRoZSBkcm1fZHJpdmVyIG1hbmdsaW5nIGZvciB2aXJ0Cj4+Cj4+IFByZXAgd29yayB0
byBtYWtlIGRybV9kZXZpY2UtPmRyaXZlciBjb25zdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiBDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KPj4gQ2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+PiBDYzog
SGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+PiBDYzogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+IENjOiBMdWJlbiBUdWlrb3YgPGx1
YmVuLnR1aWtvdkBhbWQuY29tPgo+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Cj4+IENjOiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4KPj4gQ2M6IFlpbnRp
YW4gVGFvIDx5dHRhb0BhbWQuY29tPgo+PiBDYzogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNv
bT4KPj4gQ2M6IHNoYW95dW5sIDxzaGFveXVuLmxpdUBhbWQuY29tPgo+PiBDYzogQm9rdW4gWmhh
bmcgPEJva3VuLlpoYW5nQGFtZC5jb20+Cj4+IENjOiAiU3RhbmxleS5ZYW5nIiA8U3RhbmxleS5Z
YW5nQGFtZC5jb20+Cj4+IENjOiBXZW5odWkgU2hlbmcgPFdlbmh1aS5TaGVuZ0BhbWQuY29tPgo+
PiBDYzogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgfCAgOCArKysrLS0tLSAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDEyICsrKysrKysrKysrLQo+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+IGluZGV4IDAyNGMzYjcwYjFhYS4u
M2QzMzdmMTNhZTRlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCj4+IEBAIC0xMDkzLDcgKzEwOTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZp
Y2VfaWQgcGNpaWRsaXN0W10gPSB7Cj4+Cj4+ICBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgcGNp
aWRsaXN0KTsKPj4KPj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrbXNfZHJpdmVyOwo+PiAr
c3RydWN0IGRybV9kcml2ZXIgYW1kZ3B1X2ttc19kcml2ZXI7Cj4+Cj4+ICBzdGF0aWMgaW50IGFt
ZGdwdV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4+ICAgICAgY29uc3Qgc3RydWN0
IHBjaV9kZXZpY2VfaWQgKmVudCkgQEAgLTExNjQsNyArMTE2NCw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPj4gIGlmIChyZXQpCj4+ICByZXR1
cm4gcmV0Owo+Pgo+PiAtYWRldiA9IGRldm1fZHJtX2Rldl9hbGxvYygmcGRldi0+ZGV2LCAma21z
X2RyaXZlciwgdHlwZW9mKCphZGV2KSwgZGRldik7Cj4+ICthZGV2ID0gZGV2bV9kcm1fZGV2X2Fs
bG9jKCZwZGV2LT5kZXYsICZhbWRncHVfa21zX2RyaXZlciwKPj4gK3R5cGVvZigqYWRldiksIGRk
ZXYpOwo+PiAgaWYgKElTX0VSUihhZGV2KSkKPj4gIHJldHVybiBQVFJfRVJSKGFkZXYpOwo+Pgo+
PiBAQCAtMTUwOCw3ICsxNTA4LDcgQEAgaW50IGFtZGdwdV9maWxlX3RvX2Zwcml2KHN0cnVjdCBm
aWxlICpmaWxwLCBzdHJ1Y3QgYW1kZ3B1X2Zwcml2ICoqZnByaXYpCj4+ICByZXR1cm4gMDsKPj4g
IH0KPj4KPj4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrbXNfZHJpdmVyID0gewo+PiArc3Ry
dWN0IGRybV9kcml2ZXIgYW1kZ3B1X2ttc19kcml2ZXIgPSB7Cj4+ICAuZHJpdmVyX2ZlYXR1cmVz
ID0KPj4gICAgICBEUklWRVJfQVRPTUlDIHwKPj4gICAgICBEUklWRVJfR0VNIHwKPj4gQEAgLTE1
NzEsNyArMTU3MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFtZGdwdV9pbml0KHZvaWQpCj4+ICBn
b3RvIGVycm9yX2ZlbmNlOwo+Pgo+PiAgRFJNX0lORk8oImFtZGdwdSBrZXJuZWwgbW9kZXNldHRp
bmcgZW5hYmxlZC5cbiIpOwo+PiAta21zX2RyaXZlci5udW1faW9jdGxzID0gYW1kZ3B1X21heF9r
bXNfaW9jdGw7Cj4+ICthbWRncHVfa21zX2RyaXZlci5udW1faW9jdGxzID0gYW1kZ3B1X21heF9r
bXNfaW9jdGw7Cj4+ICBhbWRncHVfcmVnaXN0ZXJfYXRweF9oYW5kbGVyKCk7Cj4+Cj4+ICAvKiBJ
Z25vcmUgS0ZEIGluaXQgZmFpbHVyZXMuIE5vcm1hbCB3aGVuIENPTkZJR19IU0FfQU1EIGlzIG5v
dCBzZXQuICovIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmlydC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+PiBpbmRl
eCBkMGFlYTVlMzk1MzEuLmRkZTRjNDQ5YzI4NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmlydC5jCj4+IEBAIC00NSwxMyArNDUsMjMgQEAgYm9vbCBhbWRncHVf
dmlydF9tbWlvX2Jsb2NrZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICByZXR1cm4g
UlJFRzMyX05PX0tJUSgweGMwNDApID09IDB4ZmZmZmZmZmY7ICB9Cj4+Cj4+ICtleHRlcm4gc3Ry
dWN0IGRybV9kcml2ZXIgYW1kZ3B1X2ttc19kcml2ZXI7Cj4+ICsKPj4gIHZvaWQgYW1kZ3B1X3Zp
cnRfaW5pdF9zZXR0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgewo+PiAgLyogZW5h
YmxlIHZpcnR1YWwgZGlzcGxheSAqLwo+PiAgaWYgKGFkZXYtPm1vZGVfaW5mby5udW1fY3J0YyA9
PSAwKQo+PiAgYWRldi0+bW9kZV9pbmZvLm51bV9jcnRjID0gMTsKPj4gIGFkZXYtPmVuYWJsZV92
aXJ0dWFsX2Rpc3BsYXkgPSB0cnVlOwo+PiAtYWRldl90b19kcm0oYWRldiktPmRyaXZlci0+ZHJp
dmVyX2ZlYXR1cmVzICY9IH5EUklWRVJfQVRPTUlDOwo+PiArCj4+ICsvKgo+PiArICogRklYTUU6
IEVpdGhlciBtYWtlIHZpcnQgc3VwcG9ydCBhdG9taWMgb3IgbWFrZSBzdXJlIHlvdSBoYXZlIHR3
bwo+PiArICogZHJtX2RyaXZlciBzdHJ1Y3RzLCB0aGVzZSBraW5kIG9mIHRyaWNrcyBhcmUgb25s
eSBvayB3aGVuIHRoZXJlJ3MKPj4gKyAqIGd1YXJhbnRlZWQgb25seSBhIHNpbmdsZSBkZXZpY2Ug
cGVyIHN5c3RlbS4gVGhpcyBzaG91bGQgYWxzbyBiZSBkb25lCj4+ICsgKiBiZWZvcmUgc3RydWN0
IGRybV9kZXZpY2UgaXMgaW5pdGlhbGl6ZWQuCj4+ICsgKi8KPj4gK2FtZGdwdV9rbXNfZHJpdmVy
LmRyaXZlcl9mZWF0dXJlcyAmPSB+RFJJVkVSX0FUT01JQzsKPj4gKwo+PiAgYWRldi0+Y2dfZmxh
Z3MgPSAwOwo+PiAgYWRldi0+cGdfZmxhZ3MgPSAwOwo+PiAgfQo+PiAtLQo+PiAyLjI4LjAKPj4K
PiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
