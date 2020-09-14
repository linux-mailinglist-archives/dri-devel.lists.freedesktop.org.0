Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A2268DE6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 16:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C936E332;
	Mon, 14 Sep 2020 14:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDD88D96;
 Mon, 14 Sep 2020 14:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXLoDG3EYayXpebBbOIna0mXVsT/Cin7XtqihsHGJ9dTugb8+g8l/lrl/jEaN39bB1b6/rlzwQJKToCqrlVC6A0Lmh90dB2VmWkGzH5uFR5qge5iyu+AEZDyXIdFNiPlOg/VUYNpXAWr7l9teEQBjb/uTJ6DcVBO+iSePULD+WN4eqxJGGaqrb9uBfSTZMvIbSmjQrkiiP8iJnDGy0J3KEolatdbQLpOtEMv2kHr69kNNcbMm2wgIsGBz7uOeM/lcmLdYjlUAIi3JHnXRINpjy+dkhA53EEra24O1m1QJ1bz90dQnScAN+GF5eIUEKntWoJmvVVYJt7Kz3JJLckwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMwlHMRxq9HSlXyUe3luonSwqr/mi0a8kyOR2KB9oCk=;
 b=P7OUCOKnQFlaA9efUslZ5mTX4Ejs1WkHHwks5l+fpKQt0c4eqCmAO1yhD27is/4+54K8/b7WaRFHyqKYEFOdI49T0hepB4cIIwAqlQsAiPEXwU8CWwCQuFaRnX8LklS6jFpWce4EhYLPaAy0WVvGsIBOTpkAeCoETDJuzwH4JwaJND2HupSFI90ocf0eCTIi/JLMWheyl9Fr4ynzEdxU5Dx9v1v0Rf5ZruEpqWPQo5xCGJRXP8ffIebJcNMpVEx5iko2G3zY6GQrpZJSypYKNVrNbQUE2P/fR9CqdgLkQbHst6ANNu5IPpSxowkUDGM9frOFgFS5PhUVnZKABVq5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMwlHMRxq9HSlXyUe3luonSwqr/mi0a8kyOR2KB9oCk=;
 b=Jqj6ui30rULGBXfFp3yITo+RQXQUm8YmkuEBSYWQHo66nkaIQ0p2PuKX0z2uu86+Cp2WkUfzofhdw7lI6xjbGS+WmGabdT/8tRvm3Ufv/4Bw53Irx00aC/zNscPjPq4IQgbx6tyJT11RupyT1ev0o5+14vyZdMwRHq23Bs8CYD0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 14:37:13 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101%6]) with mapi id 15.20.3326.030; Mon, 14 Sep 2020
 14:37:13 +0000
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
 <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
Date: Mon, 14 Sep 2020 10:37:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 14:37:12 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 817c9274-15cb-475b-e383-08d858bbab33
X-MS-TrafficTypeDiagnostic: BY5PR12MB4164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4164EB6E7878E301B34AFA5EEC230@BY5PR12MB4164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2Mrv9UrusZ7Svq43gDPI4BMwxE90bDDFhrIA7Z3755hFY2gOnboHlAZFTRn+Mt4BANiIoWbQTQAFC0enl5RL9keFZGSA8ayKlcWe+5HnoFQdNKmGgUiOCBvNMCXk0tnQwuJ0AzVHbatWY7xSxaT14Qb1JG40QDFBDhDmmIp7OtXQhDTMb1ImJROM1eHTTTgio5bic244CsTUCW5AkYHFtyGUnez1KlCxnhw00UY0ituaXJJVDkjkLCzURUqNmixo8SEGaR3yUm/k8fde/P9rIH6D81fPG8Rn2Y2fPddsPRYCar0xK3iZlUyXwXYiKYjJ7XOq5VxXoBw9B7tF39vo7zN+6SBXupYXHe5e4XO+X3g+PHPBW60Cw8a2Q2WuCBtwhZlWRtY4SrmcE/W+PeoVSFWDjVODGcd/LHZfHfrqhmv2duicHkz4kCi3Dv4io8FSvR4oE8mQNdCCiDWG0a15Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(478600001)(66476007)(4326008)(86362001)(966005)(6636002)(53546011)(8936002)(8676002)(6666004)(52116002)(6486002)(31696002)(110136005)(83380400001)(66574015)(2616005)(16576012)(31686004)(66946007)(36756003)(66556008)(2906002)(956004)(316002)(26005)(186003)(16526019)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UE2BkiUOrQArhkDh1XdV4wO2BMV4uZ7dGKWkdK8ptFS4fTx42eqOmRc2DJOJl1d+NuEOAPdhk/1Tpb9YLpgfu3WxsGX0W/3Fkl+cbhFM7gBYjkYFl0iHz5r8RFSQznw0OCQiRpkzqlMPQf4NxT4vfEy3J2a9Gcu9dXbx2CxwTHyi3S63nmfuXX7404g8GZY+WGt7BVNTrZBfDRgglXKkzprMgZW8eb9vTRvLx476J8xMa0+VXWidiBN5hWySFTpFyVe9flzdBh0BdizdxjcKWDp5qto41p6EQnuzutNWfx8nbFWB+MX14bp0WY41xuptDgLe2NLTwiNUkqBIs9a0uS/kRaSGOLJs0h8UoIDN5qKseRT00275dHSu54JakRUKz0yOtRbh3W8i3TgCHdgg+oT7we4h4vixwgE6770jxM5PNooua2F88iUyC41RFXvVsI+gOsbZpt5PY/ryFQjLk/HmlziKuzlxvggTiyxp7wHaFBQQ0VkBiuuqjtZ/ssykdS+EgxoZD+GqKOnYouhzErwj/Vnv62ufMgQCCiqWDU70+Bng0PV+5SYfZBt7cqotEL3oox8lv9iOnWcLxO6exNEdeak7nDVl3ZtCVkU6KeI10ggjCeRhK6bLNC0YtI8bloSLOfAEyxDYr0ajD9RpYw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817c9274-15cb-475b-e383-08d858bbab33
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 14:37:13.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMm/7W8qKDMhlbwHNVOMVXo3YSet2T+LtrgOhFtdF4ZKaZ5yECRKH/aXzwLsh/qibg5G3RN6rsgvS9HVJSWKTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
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

T24gMjAyMC0wOS0xNCAzOjUyIGEubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMjAt
MDktMDcgOTo1NyBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBGcmksIFNlcCAwNCwg
MjAyMCBhdCAxMjo0MzowNFBNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IEZyb206
IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+Pj4KPj4+IERvbid0IGNoZWNr
IGRybV9jcnRjX3N0YXRlOjphY3RpdmUgZm9yIHRoaXMgZWl0aGVyLCBwZXIgaXRzCj4+PiBkb2N1
bWVudGF0aW9uIGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6Cj4+Pgo+Pj4gwqAgKiBIZW5jZSBk
cml2ZXJzIG11c3Qgbm90IGNvbnN1bHQgQGFjdGl2ZSBpbiB0aGVpciB2YXJpb3VzCj4+PiDCoCAq
ICZkcm1fbW9kZV9jb25maWdfZnVuY3MuYXRvbWljX2NoZWNrIGNhbGxiYWNrIHRvIHJlamVjdCBh
biBhdG9taWMKPj4+IMKgICogY29tbWl0Lgo+Pj4KPj4+IGF0b21pY19yZW1vdmVfZmIgZGlzYWJs
ZXMgdGhlIENSVEMgYXMgbmVlZGVkIGZvciBkaXNhYmxpbmcgdGhlIHByaW1hcnkKPj4+IHBsYW5l
Lgo+Pj4KPj4+IFRoaXMgcHJldmVudHMgYXQgbGVhc3QgdGhlIGZvbGxvd2luZyBwcm9ibGVtcyBp
ZiB0aGUgcHJpbWFyeSBwbGFuZSBnZXRzCj4+PiBkaXNhYmxlZCAoZS5nLiBkdWUgdG8gZGVzdHJv
eWluZyB0aGUgRkIgYXNzaWduZWQgdG8gdGhlIHByaW1hcnkgcGxhbmUsCj4+PiBhcyBoYXBwZW5z
IGUuZy4gd2l0aCBtdXR0ZXIgaW4gV2F5bGFuZCBtb2RlKToKPj4+Cj4+PiAqIFRoZSBsZWdhY3kg
Y3Vyc29yIGlvY3RsIHJldHVybmVkIEVJTlZBTCBmb3IgYSBub24tMCBjdXJzb3IgRkIgSUQKPj4+
IMKgwqAgKHdoaWNoIGVuYWJsZXMgdGhlIGN1cnNvciBwbGFuZSkuCj4+PiAqIElmIHRoZSBjdXJz
b3IgcGxhbmUgd2FzIGVuYWJsZWQsIGNoYW5naW5nIHRoZSBsZWdhY3kgRFBNUyBwcm9wZXJ0eQo+
Pj4gwqDCoCB2YWx1ZSBmcm9tIG9mZiB0byBvbiByZXR1cm5lZCBFSU5WQUwuCj4+Pgo+Pj4gdjI6
Cj4+PiAqIE1pbm9yIGNoYW5nZXMgdG8gY29kZSBjb21tZW50IGFuZCBjb21taXQgbG9nLCBwZXIg
cmV2aWV3IGZlZWRiYWNrLgo+Pj4KPj4+IEdpdExhYjogCj4+PiBodHRwczovL2dpdGxhYi5nbm9t
ZS5vcmcvR05PTUUvbXV0dGVyLy0vaXNzdWVzLzExMDggCj4+Pgo+Pj4gR2l0TGFiOiAKPj4+IGh0
dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tdXR0ZXIvLS9pc3N1ZXMvMTE2NSAKPj4+Cj4+
PiBHaXRMYWI6IAo+Pj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL2lz
c3Vlcy8xMzQ0IAo+Pj4KPj4+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFlbnpl
ckByZWRoYXQuY29tPgo+Pgo+PiBDb21taXQgbWVzc2FnZSBhZ3JlZXMgd2l0aCBteSB1bmRlcnN0
YW5kIG9mIHRoaXMgbWF6ZSBub3csIHNvOgo+Pgo+PiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiBUaGFua3MgRGFuaWVsIQo+IAo+IAo+IE5pY2sg
LyBIYXJyeSwgYW55IG1vcmUgZmVlZGJhY2s/IElmIG5vdCwgY2FuIHlvdSBhcHBseSB0aGlzPwo+
IAo+IAo+IFAuUy4gU2luY2UgRENOIGRvZXNuJ3QgbWFrZSBhIGRpc3RpbmN0aW9uIGJldHdlZW4g
cHJpbWFyeSBvciBvdmVybGF5IAo+IHBsYW5lcyBpbiBoYXJkd2FyZSwgY291bGQgQ2hyb21pdW1P
UyBhY2hpZXZlIHRoZSBzYW1lIGVmZmVjdCB3aXRoIG9ubHkgCj4gdGhlIHByaW1hcnkgcGxhbmUg
aW5zdGVhZCBvZiBvbmx5IGFuIG92ZXJsYXkgcGxhbmU/IElmIHNvLCBtYXliZSB0aGVyZSdzIAo+
IG5vIG5lZWQgZm9yIHRoZSAiYmxhY2sgcGxhbmUgaGFjayIuCj4gCj4gCgpJIG9ubHkga25vdyB0
aGF0IGF0b21pY3Rlc3QgdHJpZXMgdG8gZW5hYmxlIHRoaXMgY29uZmlndXJhdGlvbi4gTm90IHN1
cmUgCmlmIENocm9taXVtT1Mgb3Igb3RoZXIgInJlYWwiIHVzZXJzcGFjZSB0cmllcyB0aGlzIGNv
bmZpZ3VyYXRpb24uCgpNYXliZSBmb3Igbm93IHRoaXMgY2FuIGdvIGluIGFuZCBpZiBzb21ldGhp
bmcgYnJlYWtzIHdlIGNhbiBkZWFsIHdpdGggCnRoZSBmYWxsb3V0IHRoZW4uIFdlIGNhbiBhbHdh
eXMgZ28gYmFjayB0byBseWluZyB0byB1c2Vyc3BhY2UgYWJvdXQgdGhlIApjdXJzb3IgYmVpbmcg
dmlzaWJsZSBpZiB0aGUgY29tbWl0IGZhaWxzIGluIHRoYXQgY2FzZSBJIGd1ZXNzIHNpbmNlIHRo
ZSAKYmxhbmsgcGxhbmUgaGFjayBpcyBnb2luZyB0byBhZGQgYSBzaWduaWZpY2FudCBhbW91bnQg
b2YgY29tcGxleGl0eSB0byBETS4KClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxu
aWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+CgpSZWdhcmRzLApOaWNob2xhcyBLYXpsYXVza2Fz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
