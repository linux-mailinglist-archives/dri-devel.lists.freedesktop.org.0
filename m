Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CE27E3B5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 10:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F2389956;
	Wed, 30 Sep 2020 08:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F3089956
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 08:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4z4VsL9B1Ub3TyrvHznuNxHeCBNZLuKP/kChNTjRK5ibbNWxpLdbWBzxpW/LjBBgobJOYhqiC0V3MavOwR0Awi+kGSFsj0ncuSnWjqHt9Reguud2HesGG0hRYpMe0f/qiPaVq5wlckvJu+grBrT2K79ri/Qi+FN+f1BkGhksY727DZGgmf/vgkySiSbQS7Av/eDK37gAyJ9C41hRfDJpApzKzMcWHTap+VmrSyk1SDatX+yqhATwtvoHAQyMuDsd9NJVLXch153HdvXVWJ43kamFfkcTdo6gjH7pLhDVVaj8lpm+L3v2kt1nVG8T7wzdye/En/xj93A5mFz+IDabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb1ITrqgbaD3XdBlESlM3D3PBkw7fSCsPwPV8mTaRVU=;
 b=XMJAz+MC33dvL5tc2bgwXic57Ul7OTaT6bdp+z78YwAyMXsVylbTn4ofR88rWS94a8n8pL2vOhceEW6I7ikGhPs73b4MOQOmWbR/cwP4+ljcugRWb2k62B0mReHMCTW0G2ZgH7775IixX7ti7tZBJ2kPM706t3tQ/F7fM0M4SpV/aV4uPzKmVlvhSvxb/oOmUxbR2MfqOenV9YBzH7HtlVZnTHP1/4RdBqU7yoMVIA2aKqDRlPRZ+r10Rv3BXDWum+p346c6WCOtCHSVg9RrhtLqJ7ZztbWqe5zaMq9QgdbirzSi/bF4SPw01S58vzxa9SAtD3DcFz9NHXiA+hz/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb1ITrqgbaD3XdBlESlM3D3PBkw7fSCsPwPV8mTaRVU=;
 b=YCHiKk0VOoTk15M8K1Y3aZ99jEsOqLmf2TXWWhuumnHmsQoDA42/NzLy+YlOxLdxhBjiOkzuCJc7hDB+s33gt0zkYV/HZ0OiGo2MGHoa2nqTGOF8VffMPbus6Vp9CRf3xqMWGaYuVp87KOsPecKHRyqgXW1eV8r8Ki7zFgOwOiw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 30 Sep
 2020 08:28:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 08:28:07 +0000
Subject: Re: [PATCH] drm/ttm: fix regression in ttm moves
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Roland Scheidegger <sroland@vmware.com>
References: <20200930055459.31310-1-airlied@gmail.com>
 <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
 <CAPM=9tzdT8suD5PZJGrWMM-kOSYYcvA3ZP2y=muZoQ6gNyJkRQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7fe46260-95ed-114d-940b-0512f39b857d@amd.com>
Date: Wed, 30 Sep 2020 10:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzdT8suD5PZJGrWMM-kOSYYcvA3ZP2y=muZoQ6gNyJkRQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Wed, 30 Sep 2020 08:28:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 882f4239-5944-4e1d-70b7-08d8651ac1bb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551BE609CF3C32B0200D4DE83330@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWsCy3tDGlMGByAMNb85ZCv4C4G/YK748BUSYHqr/rY67bQu496xP9sMaBu+B3zxNqkq7O119HMQvL9zCE7F6A2/qIHlcad8RvYvZaXGPVh12YqnxRAk9Cr1po4dBgIDxgITuoNHEVMjPiEexu7ufWBP3un5HQm82jKZnbv5PAW5Al0qaLqxJyTwn2ermGBqTHO93mKlWZkqyx5q8gH1PO/DddmVH+y/OKyPHFT+DOXqC5Q1/ySza3Blwid4YBzic6cyCTeOQJh7zAj5BtjDmFd3BLhxmukV3q15QORGwXwO2BXRPzFUkmunAhRR5/TyGSAZ8PyVoKTU9rHPsVbptef9ZW7jYIucwk8IadUq733gdOcFXvOnMywdl5A+0bTtskl2A0msF8G+Czp/SpIgXiEHlN9OGnvDptnsugFQ8s4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(52116002)(31686004)(110136005)(66946007)(83380400001)(8676002)(316002)(6666004)(186003)(16526019)(5660300002)(31696002)(86362001)(6486002)(966005)(4326008)(478600001)(2906002)(36756003)(8936002)(66574015)(66556008)(66476007)(45080400002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +qLxrD5Bs4hBMuiaS39A9V3zH3Gqb8JS1XSZpZi9wdQ99b4MmTy5J6YrSGckDM4sL5ueRCxQvasgwwwHYKADtPWe6cnIQXhXUJtbyJqYDpIlIig5ttOK3t2lOvS7pAr//p+b5vWSYGLofcbXvEvYWbRsHdgANiCc7t14M7CwIBIyS2KE8Dis9+xi8PjMaFowmFfb2o4rMc6EcHQDJq0Nkm3H+qsdnf7LyXsSmHTAoCXSLtGLI1DDnJyhFyXM/yRbSnecjU3togp7//ckM3UaBodt4hwbZbk7bHzQ5BUo1Bd1NzUjaTW9Lfvv3zqVq8rpXrjF+EmM1X2KDnKccVMDLdyocvY4CX/ufj6s2RugM8ZRwBaqMRvbrQfPEm4rezxHxKj/NXxhMi3G5g0dkIpEOhldAgZ8c3Ut0kD/i2PF9alck8fmfyKF4jhqwwdT/JZEuSv0W3THAK3MhBesl1ojdAa4K6FBoUcOBMvlBfy2Oyi/BCXooGiuoQSxB8uIRTn6ADlFKOBAh1AtPKuQZeniws5tWCCApmfETKvblOkcnVi+3BNHa0/SC3fyt7H9OzJhCgtTmzaTdkw1jmQuHcHhaRPacwFLZkUXNkyZxeflQHhw4mgrLWb07cP+usA+RunL55+qYyFl18xMn+2Li5L7rqau7RBmwuWGk0HmKb23wufymVZJPvs0SJIzkia5E1mr54erKUkNQQXGHDLEwgtsTw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882f4239-5944-4e1d-70b7-08d8651ac1bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 08:28:06.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLO6kBc/XO0nyDZn06VcrpYUD/9Nn5DOJoy6lcjY9vEpodkTXlNhECTtKDONpfXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhdCBzb3VuZHMgbGlrZSB0aGUgc2FtZSBwcm9ibGVtIEkndmUgZ290IHdoZW4gZHJtLW5leHQg
d2FzIG1lcmdlZCBpbnRvIApkcm0tbWlzYy1uZXh0LgoKSSd2ZSBmaXhlZCBpdCBpbiB0aGlzIGNv
bW1pdDoKCmNvbW1pdCAwYjA2Mjg2NTc5YjgxNDQ5YjFlOGYxNGY4OGQzYThkYjA5MWZkNDQzCkF1
dGhvcjogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpEYXRlOsKg
wqAgV2VkIEF1ZyAxOSAxNToyNzo0OCAyMDIwICswMjAwCgogwqDCoMKgIGRybS90dG06IGZpeCBi
cm9rZW4gbWVyZ2UgYmV0d2VlbiBkcm0tbmV4dCBhbmQgZHJtLW1pc2MtbmV4dAoKIMKgwqDCoCBk
cm0tbmV4dCByZXZlcnRlZCB0aGUgY2hhbmdlcyB0byB0dG1fdHRfY3JlYXRlKCkgdG8gZG8gdGhl
CiDCoMKgwqAgTlVMTCBjaGVjayBpbnNpZGUgdGhlIGZ1bmN0aW9uLCBidXQgZHJtLW1pc2MtbmV4
dCBhZGRzIG5ldwogwqDCoMKgIHVzZXJzIG9mIHRoaXMgYXBwcm9hY2guCgogwqDCoMKgIFJlLWFw
cGx5IHRoZSBOVUxMIGNoZWNrIGNoYW5nZSBpbnNpZGUgdGhlIGZ1bmN0aW9uIHRvIGZpeCB0aGlz
LgoKIMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CiDCoMKgwqAgUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJl
ZGhhdC5jb20+CiDCoMKgwqAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoLzM4NjYyOC8KCgpOb3Qgc3VyZSB3aHkgaXQgc2hvdWxkIGNhdXNlIHByb2JsZW1zIHdp
dGggZHJtLWZpeGVzIGFuZCBkcm0tbmV4dCBhcyB3ZWxsLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoK
QW0gMzAuMDkuMjAgdW0gMDk6MDkgc2NocmllYiBEYXZlIEFpcmxpZToKPiBqdXN0IEZZSSBJJ20g
c2VlaW5nIGEgcmVncmVzc2lvbiBvbiB2bXdnZnggd2l0aCBkcm0tZml4ZXMgYW5kIGRybS1uZXh0
Cj4gbWVyZ2VkIGludG8gaXQuCj4KPiBJJ20gZ29pbmcgdGFrZSBzb21lIHRpbWUgdG8gZGlnIHRo
cm91Z2ggYW5kIHdvcmsgb3V0IHdoZXJlLCB0aGUKPiByZWdyZXNzaW9uIGlzIGEgY29tbWFuZCBm
YWlsdXJlIGFuZCBhIGlvcmVtYXAgZmFpbHVyZS4KPgo+IERhdmUuCj4KPiBPbiBXZWQsIDMwIFNl
cCAyMDIwIGF0IDE2OjI2LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+
PiBVZ2doIHRoaXMgaXMgcGFydCBvZiB0aGUgbWVzcyB3aXRoIHRoZSByZXZlcnQsIEknbSBub3Qg
c3VyZSBob3cgYmVzdAo+PiB0byBkaWcgb3V0IG9mIHRoaXMgb25lIHlldC4KPj4KPj4gRGF2ZS4K
Pj4KPj4gT24gV2VkLCAzMCBTZXAgMjAyMCBhdCAxNTo1NSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRA
Z21haWwuY29tPiB3cm90ZToKPj4+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5j
b20+Cj4+Pgo+Pj4gVGhpcyBmaXhlcyBhIGJ1ZyBpbnRyb2R1Y2VkIGluIGJlMTIxM2EzNDFhMjg5
YWZjNTFmODkxODFjMzEwZTM2OGZiYTBiNjYKPj4+IGRybS90dG06IHJlbW92ZSBUVE1fTUVNVFlQ
RV9GTEFHX0ZJWEVEIHYyCj4+Pgo+Pj4gT24gdm13Z2Z4IHRoaXMgY2F1c2VzIGEgQ29tbWFuZCBi
dWZmZXIgZXJyb3IgV0FSTiB0byB0cmlnZ2VyLgo+Pj4KPj4+IFRoaXMgaXMgYmVjYXVzZSB0aGUg
b2xkIGNvZGUgdXNlZCB0byBjaGVjayBpZiBiby0+dHRtIHdhcyB0cnVlLAo+Pj4gYW5kIHRoZSBu
ZXcgY29kZSBkb2Vzbid0LCBmaXggaXQgY29kZSB0byBhZGQgYmFjayB0aGUgY2hlY2sgcmVzb2x2
ZXMKPj4+IHRoZSBpc3N1ZS4KPj4+Cj4+PiBGaXhlczogYmUxMjEzYTM0MWEyICgiZHJtL3R0bTog
cmVtb3ZlIFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgdjIiKQo+Pj4gU2lnbmVkLW9mZi1ieTogRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgOCArKysrKy0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4gaW5k
ZXggNzBiM2JlZTI3ODUwLi5lOGFhMmZlOGU5ZDEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4+PiBAQCAtMjUxLDkgKzI1MSwxMSBAQCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVfbW92ZV9t
ZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+ICAgICAgICAgICAgICAgICAgLyog
WmVybyBpbml0IHRoZSBuZXcgVFRNIHN0cnVjdHVyZSBpZiB0aGUgb2xkIGxvY2F0aW9uIHNob3Vs
ZAo+Pj4gICAgICAgICAgICAgICAgICAgKiBoYXZlIHVzZWQgb25lIGFzIHdlbGwuCj4+PiAgICAg
ICAgICAgICAgICAgICAqLwo+Pj4gLSAgICAgICAgICAgICAgIHJldCA9IHR0bV90dF9jcmVhdGUo
Ym8sIG9sZF9tYW4tPnVzZV90dCk7Cj4+PiAtICAgICAgICAgICAgICAgaWYgKHJldCkKPj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPj4+ICsgICAgICAgICAgICAgICBp
ZiAoIWJvLT50dG0pIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHR0bV90dF9j
cmVhdGUoYm8sIG9sZF9tYW4tPnVzZV90dCk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAocmV0KQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9lcnI7
Cj4+PiArICAgICAgICAgICAgICAgfQo+Pj4KPj4+ICAgICAgICAgICAgICAgICAgcmV0ID0gdHRt
X3R0X3NldF9wbGFjZW1lbnRfY2FjaGluZyhiby0+dHRtLCBtZW0tPnBsYWNlbWVudCk7Cj4+PiAg
ICAgICAgICAgICAgICAgIGlmIChyZXQpCj4+PiAtLQo+Pj4gMi4yMC4xCj4+Pgo+Pj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZl
bCZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NhOGU1MWRj
ZTFiMTM0NjAxNWMxZTA4ZDg2NTBmZGM1OSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2MzczNzA0NjYwODU1MDcwMTMmYW1wO3NkYXRhPVFydFNnZmttU3BOY05m
ZEo3MVlOQVRTMFVSeUVjTU5MZU1WbU9lblJwYWslM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
