Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874E24DF16
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 20:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE046EB8B;
	Fri, 21 Aug 2020 18:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3476E6E364;
 Fri, 21 Aug 2020 18:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCVGDttVBqh7lgAxZZBEQTDrtOnzuc7ljgPsgD0FrSUhv2atNvsQniQWegWFFnDvFyK04+ezo/OEYnm/XIam36GzoKZZE67Otbgf48Pn5tVj5WkrB/MrizPQxOM7waldvZcheSsvEGI/p8H9hmLg1LH/c+KGSP3shiOdgRg7HIqs2gr5NMztlKuk8WT05n7xlkV0fa1ojjYffVIb66Q8w55+vbceDG3GIBkbqYJYMSKKG/xACGcOq0pe08sKRq8NyoVig3Cp71ns9gmpMSyg1FkaLIQy0cH2fEaSx+dOXgnY0uWYZ3BTHQHAmcf1n6TPpyXpR4IHBMKRfpau4BdZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJOXs3+E4eEU29V+/K3Oq8BsiHc+YCsFo2PGyUjxjSo=;
 b=A1jaTdtMmI2XleK01cBcis0bryNj1x8sfrR0iTM/qpeFFcKZWzgJBQnOgwE49KZsiAmUW4xoWOZDcSI4qGswhnYzkXtccWxAosi1E0fZInX83BO+YyPUS2FGqp/4J1orM/hZ1d7UEiFPA1d/HYGxewGGLqnoU2HhARnegEhzHzr+RS4DmHjgOBpCee0Lo9/CMSknLd7ufSDvDVCCyhaxXUMRjsNnHLwsTqCKClUJyt1VL8ivme2rs5oKapZ9rFv7anDRVtlVwEpf/xzNNbBjY3f/Xh4N4xYQUTWGh9TUNLXiIDusoRtIaqb76aF54VTWONHZmyXXm/8Z6+khdHb0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJOXs3+E4eEU29V+/K3Oq8BsiHc+YCsFo2PGyUjxjSo=;
 b=DFwJUfl/umi7Yo2CZRWADcNq0C3kfBcA4VD8KDBNZOTd1iAHccVrxt0Z3YfofcR3Pk2ZFCJXFJjhtpgZ+oodpjl25sDVcJxTuUTkMDF+4ZK38VIDpkSkWDLrugxlziRk9AbA0GahIOBBJsV4aEqVZHU16GOtC/eXY7LLaml6gC8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.24; Fri, 21 Aug
 2020 18:07:35 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3261.026; Fri, 21 Aug 2020
 18:07:34 +0000
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Leo Li <sunpeng.li@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
Date: Fri, 21 Aug 2020 14:07:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200821165758.1106210-1-michel@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::34) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Fri, 21 Aug 2020 18:07:34 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d953f273-ac26-48f7-da88-08d845fd148b
X-MS-TrafficTypeDiagnostic: BYAPR12MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB267756BCE4BA8859E929FB57EC5B0@BYAPR12MB2677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EX10+FEhw6pKefD4HRZbSfWUmV4IJRfBQjXXZgh8K+rNcHGD1TVLkydcmBr+9JAn+J2PuvfEALwYDEyn3e1CYh3Eguqm41ztOAFFurPGMkzNbgVNlOJ7uJ4uLwdnL0Pa5pnA9Vhq41e5vXVIDVMJYjwntlnbu375SBiVdUaKLdRtu3ZML/P+8kLutgNqiRhgQzVqqt2yZTlgnsQkzw94Nv2IlrK0lzKlFw+uocIwaouISmyaV2e50dWYMnVDkSGOhrk7mPXZkgShqgoJp/nGAKPmXfEPz6S3QhiTo8BElPb5oA6dKTAFlv9srzW2BCLFSd3CEUDIc1XQJJcIBDflCUN6n921/QYinfnSPomrBZTW4yf41akKTFqXnbMquF2q0GUoPH6IMjMlmJbieUBp0E6OVx9Trv+ArmLTzzMVTBXdt/j9MgxUTFXa6lLiv0J5Qsog3EusYsF0YWw8sh/NWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(16576012)(66574015)(66556008)(31696002)(36756003)(66946007)(478600001)(86362001)(53546011)(16526019)(5660300002)(26005)(6486002)(966005)(110136005)(316002)(66476007)(83380400001)(31686004)(6636002)(186003)(52116002)(2616005)(956004)(4326008)(6666004)(8676002)(8936002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yzBmb/JrIp/Og4/ZMjZCgAdzxAa7xrL84nrUifzbXrrgDM42MP6JQdsROw6eSvXD0PvDX/aMeYrdnqNwsho4a5CdsWRvySsP64GjgNWoedgMeg9oS+sb2q9Qtfr5N0rxSb7VIIGnuyV6izvuSuwHOAMvSoow2uXVAvUHUwpeDzGP3LXDt3+g2a7DBqf0EZZBdP7goeOtKuujkTvRuCichqfSnm5+qb2Gy/1PH9cPxjQhqN2Kj716ma8TAiSzjT1DapnkHrn3fo9c6qwqDDGqcbvApvj6R8URDVcWg7hWbI003UIeolRMyMB7AKUuDz5X1Gwfhw45k0zZCMmBy1QvlUA7ZemqZbDHpnk9YcxIJPpfKh72ECJmRJI15A42Nhz0+Xybq5+PdQwkVbmj5zFAZv/caDEDYCy/E1EctZCCfKbxvFGbAsrRSSoiw+U9zX2LoGs0jrkeZ9LtNrTHvnnKTfcTYHRj9jPbSkcYsgop/q6KBZPkGYhd3kl8DdWdEXPBspcNZ8pR2xWV48DGaFe8KxSvXSygQChl0BuvZ5VPaOkgeahqaWkl/fL0aMY1Icq/YIArESAl9P7JAXvBxi/xKXwKzT82yg45K+NaUOG9W7MJrCmmVus/YlM+7c29bJ/KR8PvNhRtiZbzcl/1lUwR7Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d953f273-ac26-48f7-da88-08d845fd148b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 18:07:34.8836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQxi4C8psym8DQ2Af6b8kQhgPkUtsQUlDZ2AEAzRNogzJ/L6ETHp3v/CE0x++YT76QUee/cxyoDPnxlVBWO50w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2677
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0yMSAxMjo1NyBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBGcm9tOiBN
aWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPiAKPiBEb24ndCBjaGVjayBkcm1f
Y3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwgcGVyIGl0cwo+IGRvY3VtZW50YXRp
b24gaW4gaW5jbHVkZS9kcm0vZHJtX2NydGMuaDoKPiAKPiAgICogSGVuY2UgZHJpdmVycyBtdXN0
IG5vdCBjb25zdWx0IEBhY3RpdmUgaW4gdGhlaXIgdmFyaW91cwo+ICAgKiAmZHJtX21vZGVfY29u
ZmlnX2Z1bmNzLmF0b21pY19jaGVjayBjYWxsYmFjayB0byByZWplY3QgYW4gYXRvbWljCj4gICAq
IGNvbW1pdC4KPiAKPiBUaGUgYXRvbWljIGhlbHBlcnMgZGlzYWJsZSB0aGUgQ1JUQyBhcyBuZWVk
ZWQgZm9yIGRpc2FibGluZyB0aGUgcHJpbWFyeQo+IHBsYW5lLgo+IAo+IFRoaXMgcHJldmVudHMg
YXQgbGVhc3QgdGhlIGZvbGxvd2luZyBwcm9ibGVtcyBpZiB0aGUgcHJpbWFyeSBwbGFuZSBnZXRz
Cj4gZGlzYWJsZWQgKGUuZy4gZHVlIHRvIGRlc3Ryb3lpbmcgdGhlIEZCIGFzc2lnbmVkIHRvIHRo
ZSBwcmltYXJ5IHBsYW5lLAo+IGFzIGhhcHBlbnMgZS5nLiB3aXRoIG11dHRlciBpbiBXYXlsYW5k
IG1vZGUpOgo+IAo+ICogVG9nZ2xpbmcgQ1JUQyBhY3RpdmUgdG8gMSBmYWlsZWQgaWYgdGhlIGN1
cnNvciBwbGFuZSB3YXMgZW5hYmxlZAo+ICAgIChlLmcuIHZpYSBsZWdhY3kgRFBNUyBwcm9wZXJ0
eSAmIGN1cnNvciBpb2N0bCkuCj4gKiBFbmFibGluZyB0aGUgY3Vyc29yIHBsYW5lIGZhaWxlZCwg
ZS5nLiB2aWEgdGhlIGxlZ2FjeSBjdXJzb3IgaW9jdGwuCgpXZSBwcmV2aW91c2x5IGhhZCB0aGUg
cmVxdWlyZW1lbnQgdGhhdCB0aGUgcHJpbWFyeSBwbGFuZSBtdXN0IGJlIGVuYWJsZWQgCmJ1dCBz
b21lIHVzZXJzcGFjZSBleHBlY3RzIHRoYXQgdGhleSBjYW4gZW5hYmxlIGp1c3QgdGhlIG92ZXJs
YXkgcGxhbmUgCndpdGhvdXQgYW55dGhpbmcgZWxzZS4KCkkgdGhpbmsgdGhlIGNocm9tdWl1bW9z
IGF0b21pY3Rlc3QgdmFsaWRhdGVzIHRoYXQgdGhpcyB3b3JrcyBhcyB3ZWxsOgoKU28gaXMgRFJN
IGdvaW5nIGZvcndhcmQgdGhlbiB3aXRoIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoaXMgaXMgd3Jv
bmcgCmJlaGF2aW9yIGZyb20gdXNlcnNwYWNlPwoKV2UgcmVxdWlyZSBhdCBsZWFzdCBvbmUgcGxh
bmUgdG8gYmUgZW5hYmxlZCB0byBkaXNwbGF5IGEgY3Vyc29yLCBidXQgaXQgCmRvZXNuJ3QgbmVj
ZXNzYXJpbHkgbmVlZCB0byBiZSB0aGUgcHJpbWFyeS4KClJlZ2FyZHMsCk5pY2hvbGFzIEthemxh
dXNrYXMKCj4gCj4gR2l0TGFiOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVy
Ly0vaXNzdWVzLzExMDgKPiBHaXRMYWI6IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9t
dXR0ZXIvLS9pc3N1ZXMvMTE2NQo+IEdpdExhYjogaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dO
T01FL211dHRlci8tL2lzc3Vlcy8xMzQ0Cj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxt
ZGFlbnplckByZWRoYXQuY29tPgo+IC0tLQo+IAo+IE5vdGUgdGhhdCB0aGlzIHdpbGwgY2F1c2Ug
c29tZSBJR1QgdGVzdHMgdG8gZmFpbCB3aXRob3V0Cj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy84MDkwNC8gLgo+IAo+ICAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzMgKysrKysrKy0tLS0tLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4
IDg5N2Q2MGFkZTFlNC4uMzNjNTczOWUyMjFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTUyNjIsMTkgKzUyNjIs
NiBAQCBzdGF0aWMgdm9pZCBkbV9jcnRjX2hlbHBlcl9kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKPiAgIHsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgYm9vbCBkb2VzX2NydGNfaGF2ZV9hY3Rp
dmVfY3Vyc29yKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUpCj4gLXsKPiAt
CXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBuZXdfY3J0Y19zdGF0ZS0+Y3J0Yy0+ZGV2Owo+IC0J
c3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Cj4gLQo+IC0JZHJtX2Zvcl9lYWNoX3BsYW5lX21hc2so
cGxhbmUsIGRldiwgbmV3X2NydGNfc3RhdGUtPnBsYW5lX21hc2spIHsKPiAtCQlpZiAocGxhbmUt
PnR5cGUgPT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKQo+IC0JCQlyZXR1cm4gdHJ1ZTsKPiAtCX0K
PiAtCj4gLQlyZXR1cm4gZmFsc2U7Cj4gLX0KPiAtCj4gICBzdGF0aWMgaW50IGNvdW50X2NydGNf
YWN0aXZlX3BsYW5lcyhzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQo+ICAg
ewo+ICAgCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IG5ld19jcnRjX3N0YXRlLT5z
dGF0ZTsKPiBAQCAtNTMzOCwxOSArNTMyNSwyMSBAQCBzdGF0aWMgaW50IGRtX2NydGNfaGVscGVy
X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAJCXJldHVybiByZXQ7Cj4g
ICAJfQo+ICAgCj4gLQkvKiBJbiBzb21lIHVzZSBjYXNlcywgbGlrZSByZXNldCwgbm8gc3RyZWFt
IGlzIGF0dGFjaGVkICovCj4gLQlpZiAoIWRtX2NydGNfc3RhdGUtPnN0cmVhbSkKPiAtCQlyZXR1
cm4gMDsKPiAtCj4gICAJLyoKPiAtCSAqIFdlIHdhbnQgYXQgbGVhc3Qgb25lIGhhcmR3YXJlIHBs
YW5lIGVuYWJsZWQgdG8gdXNlCj4gLQkgKiB0aGUgc3RyZWFtIHdpdGggYSBjdXJzb3IgZW5hYmxl
ZC4KPiArCSAqIFdlIHJlcXVpcmUgdGhlIHByaW1hcnkgcGxhbmUgdG8gYmUgZW5hYmxlZCB3aGVu
ZXZlciB0aGUgQ1JUQyBpcywKPiArCSAqIG90aGVyd2lzZSB0aGUgbGVnYWN5IGN1cnNvciBpb2N0
bCBoZWxwZXIgbWF5IGVuZCB1cCB0cnlpbmcgdG8gZW5hYmxlCj4gKwkgKiB0aGUgY3Vyc29yIHBs
YW5lIHdoaWxlIHRoZSBwcmltYXJ5IHBsYW5lIGlzIGRpc2FibGVkLCB3aGljaCBpcyBub3QKPiAr
CSAqIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUuIEFuZCB0aGVyZSBpcyBsZWdhY3kgdXNlcnNw
YWNlIHdoaWNoIHN0b3BzCj4gKwkgKiB1c2luZyB0aGUgSFcgY3Vyc29yIGFsdG9nZXRoZXIgaW4g
cmVzcG9uc2UgdG8gdGhlIHJlc3VsdGluZyBFSU5WQUwuCj4gICAJICovCj4gLQlpZiAoc3RhdGUt
PmVuYWJsZSAmJiBzdGF0ZS0+YWN0aXZlICYmCj4gLQkgICAgZG9lc19jcnRjX2hhdmVfYWN0aXZl
X2N1cnNvcihzdGF0ZSkgJiYKPiAtCSAgICBkbV9jcnRjX3N0YXRlLT5hY3RpdmVfcGxhbmVzID09
IDApCj4gKwlpZiAoc3RhdGUtPmVuYWJsZSAmJgo+ICsJICAgICEoc3RhdGUtPnBsYW5lX21hc2sg
JiBkcm1fcGxhbmVfbWFzayhjcnRjLT5wcmltYXJ5KSkpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+
ICAgCj4gKwkvKiBJbiBzb21lIHVzZSBjYXNlcywgbGlrZSByZXNldCwgbm8gc3RyZWFtIGlzIGF0
dGFjaGVkICovCj4gKwlpZiAoIWRtX2NydGNfc3RhdGUtPnN0cmVhbSkKPiArCQlyZXR1cm4gMDsK
PiArCj4gICAJaWYgKGRjX3ZhbGlkYXRlX3N0cmVhbShkYywgZG1fY3J0Y19zdGF0ZS0+c3RyZWFt
KSA9PSBEQ19PSykKPiAgIAkJcmV0dXJuIDA7Cj4gICAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
