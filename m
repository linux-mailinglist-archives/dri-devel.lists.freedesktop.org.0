Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD626D58B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880666EB0F;
	Thu, 17 Sep 2020 08:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB086EB0F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLLMec5NFuwQTZRS2HeuNX7gV0ukvHCWCIqTVy3qkrjWy09NtaDjPk+9WMy/Emfkp1XQE6Pk8FAtL2eqcHtrWC8XHgS3U/12GOvJtAF9+Soq9fnnJe8migutAHeOjyoUuY2YeoS6MLR0GYqUP6gsg8b9mRX8ccj+t487l/cR1CeI+JFtJI/iJM7rLz4+Bri6ZuHOKd33b+MrRDSwFYeajI+vT1RjFwAiOtNHTVg6xcm+UU9m2NSqkDMvtpxMsLTGRRKnoV//rJAm5eZaKiWXLjYLnIKMbTy1ggxpm1qX6oT1KxYwB6cG4MSdx9khQq1aelIoaBWpY/vk5kSntCK51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ojL+WqFDTDEoaYtt2iPqX17ziutJY4QRUVV0fyjFOM=;
 b=d0OjXZiWtfsS4c8AFQGUhvB4Jcwl3vICs3hdpUm+WEHW/ExP+cyxT6m9o0rjm0ByOOLoYNtxkDnslTT1alCk5qizUqdiM9Mw+zQI7EIkjbKnaObGjtFu9S1Hr+pt2H4z8Oeqp3CEjBQGgj7IDV6CTFVdl2EO8WYRGVlthvhqIgNkMPrxRBPJSSo8AhV4I1V4L22jtvpv5/ldnEeWDWe54w2SHQg2pa84CLQuEqsX/h/W9ioaSssAqbTcE9OUM4x60lZD7KFGCRfSUsOMALq1yJbitqvCWpG465B6MyT5oNDBDnRHd07P42+59i2WvkiBXfzWhdRWDhKUeuYjegkb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ojL+WqFDTDEoaYtt2iPqX17ziutJY4QRUVV0fyjFOM=;
 b=UGMtVT7raN9rt2i2TyGUbtouVpjkfM07NTMrhQCyT2suzRj0khnzr+5s09yypLCf7Pf9nmNLsIxcnHIFGmGt22ZiYNvrd1aHmmATG2EcZqBIl9/YcxDkwhCpw2XIeIY1uHq9mHBurLykmHaOEF+OPRTOqiiBvHZUpun4bwIGuCI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4814.namprd12.prod.outlook.com (2603:10b6:208:1b6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 08:04:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 08:04:12 +0000
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
 <20200916122405.GQ438822@phenom.ffwll.local>
 <53743f37-4142-c076-296f-bfcba0840121@amd.com>
 <5192750d-6e99-3dae-286b-3fe0ded0d094@shipmail.org>
 <eacc23d0-b18d-9b26-851d-e534174d43e3@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c4d3602-e38e-ef7e-2533-4a71eaab80ff@amd.com>
Date: Thu, 17 Sep 2020 10:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <eacc23d0-b18d-9b26-851d-e534174d43e3@suse.de>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.4 via Frontend Transport; Thu, 17 Sep 2020 08:04:11 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 384bf6e1-7252-4a0e-734f-08d85ae04329
X-MS-TrafficTypeDiagnostic: MN2PR12MB4814:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4814C2099A7EFEC236C69D5E833E0@MN2PR12MB4814.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Ya5/Jp37pdXRRuSUeAFtdSPz5/dlQrfKZN+L1nBGTgnwnjhQKlxMFe05spyfgaklgiuVe4U0upTEhoz2XveI7+GpvJuS3uuvA6dXOexneRxIzkcH5S39ClR3TRdGrY0GS5TxtYQtJPsBS3aFovnmBhx96xbwsttIHoN0doLbq18FuXtyOj7AdjxsJBxfJBbxcryiULNZ6uJnO4lNDkdzU/IMWyb5yvVZ3UjGo9CJltenUjAL1GtzF4Wk34EpRbITj1/A1tQx/NLM2hKs4Bo/0Yw+IrHwP7AOojTjW2FBO1riroZyaX3Gh9Wz1n0AEyar1S4MDjyfMey5InfcNPvhWv9Wpvz5C7wlVYdm9BMANuf0e61r4iMXZlzVt5LGO1/SJ99ejtfY2PexfQJ7c4l0ZSiNSmTzBKrm5f7vP3XntlJSIrYzAxDWL/WVeoFMY5FS1OA1w6tVNU4c+rl11HCwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(16526019)(83380400001)(66574015)(110136005)(8676002)(66556008)(2616005)(31686004)(6486002)(66476007)(6666004)(52116002)(5660300002)(8936002)(186003)(966005)(2906002)(316002)(86362001)(36756003)(478600001)(45080400002)(66946007)(53546011)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ib8XSY1hqUXVM9+RFh10zIJfh0R+ooaw3+AVnxy9ZHRGLJYp6Ez02ah+yt3dy6vbaYZaTLpoaL2MUKJR51kk+X+J3yNje+DyllXiiBTy01P9ZJ4gI4Xib40xqWLhTrwvFRkIKEG2CuR1+5kxCIwnawHF25DB5rvcB8m7jKtFtFHL0wOnXWqVRLQh10Hovx8//axnopQTebJfwvZqUdLtxVtvakw9ms4K2sM0gJwQz6ngGPRybkM0kCX4EFu9L5qIPbtn9fBo7wKPbGaFnzwq3jmG4JKDBpIA4/KnmIXuS0qkNbIGvNVH4dNfb481eE2DAyZSAxT5vaFE4nbNvMEjsAOGxvCNhmZ5fnhFZwBSAqNsAQHjjZ4Fcom9HKn2zd89ftEu5G0G05fQV7DNVoQsL+YxN4dNNGYY0bqSO/xTNlb66oIrEl2Ixz0iI+EYsbuJ9mpHTQIOHUxd5yq+FSC8ZrtyRe/ppcX2H4CWJXZvCQvQvouHv3tuYVpCcTSqmFL7DLGfeKl8s59t4V29pmuF8jgladS8gVdNBBi4nBIH9a/pJ5kmuqQ2vpoGeQOVPstfLKKr14huybSx/MYnIgUA3iLOpQV9ZUgaxttOmUorPTThUQ++GdAuWTEYTTvtCBwBBk+IAK0QhVYpwQy0ZGHkXR0zeolWY82gYikHjFLNQLHlCNNA3fdiQcyGS7LxwoBhLRF4MbsUw2OiGHbbK8Sncw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384bf6e1-7252-4a0e-734f-08d85ae04329
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:04:12.2027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxMs+SVEAbaYYMuOoK8D8mCNtSW6zfOCu09BvG46wz9isDC/zt/0Eap2DlLRlgyk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4814
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMDk6MTYgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaSBDaHJp
c3RpYW4gYW5kIFRob21hcwo+Cj4gQW0gMTYuMDkuMjAgdW0gMTU6Mzcgc2NocmllYiBUaG9tYXMg
SGVsbHN0csO2bSAoSW50ZWwpOgo+PiBPbiA5LzE2LzIwIDI6NTkgUE0sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4+PiBBbSAxNi4wOS4yMCB1bSAxNDoyNCBzY2hyaWViIERhbmllbCBWZXR0ZXI6
Cj4+Pj4gT24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMTI6NDg6MjBQTSArMDIwMCwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6Cj4+Pj4+IEhpCj4+Pj4+Cj4+Pj4+IEFtIDE2LjA5LjIwIHVtIDExOjM3
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+IE9uIE1vbiwgU2VwIDE0LCAyMDIwIGF0IDAx
OjI1OjE4UE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4+Pj4+IERtYS1idWYg
cHJvdmlkZXMgdm1hcCgpIGFuZCB2dW5tYXAoKSBmb3IgcmV0cmlldmluZyBhbmQgcmVsZWFzaW5n
Cj4+Pj4+Pj4gbWFwcGluZ3MKPj4+Pj4+PiBvZiBkbWEtYnVmIG1lbW9yeSBpbiBrZXJuZWwgYWRk
cmVzcyBzcGFjZS4gVGhlIGZ1bmN0aW9ucyBvcGVyYXRlCj4+Pj4+Pj4gd2l0aCBwbGFpbgo+Pj4+
Pj4+IGFkZHJlc3NlcyBhbmQgdGhlIGFzc3VtcHRpb24gaXMgdGhhdCB0aGUgbWVtb3J5IGNhbiBi
ZSBhY2Nlc3NlZAo+Pj4+Pj4+IHdpdGggbG9hZAo+Pj4+Pj4+IGFuZCBzdG9yZSBvcGVyYXRpb25z
LiBUaGlzIGlzIG5vdCB0aGUgY2FzZSBvbiBzb21lIGFyY2hpdGVjdHVyZXMKPj4+Pj4+PiAoZS5n
LiwKPj4+Pj4+PiBzcGFyYzY0KSB3aGVyZSBJL08gbWVtb3J5IGNhbiBvbmx5IGJlIGFjY2Vzc2Vk
IHdpdGggZGVkaWNhdGVkCj4+Pj4+Pj4gaW5zdHJ1Y3Rpb25zLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhp
cyBwYXRjaHNldCBpbnRyb2R1Y2VzIHN0cnVjdCBkbWFfYnVmX21hcCwgd2hpY2ggY29udGFpbnMg
dGhlCj4+Pj4+Pj4gYWRkcmVzcyBvZgo+Pj4+Pj4+IGEgYnVmZmVyIGFuZCBhIGZsYWcgdGhhdCB0
ZWxscyB3aGV0aGVyIHN5c3RlbS0gb3IgSS9PLW1lbW9yeQo+Pj4+Pj4+IGluc3RydWN0aW9ucwo+
Pj4+Pj4+IGFyZSByZXF1aXJlZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNvbWUgYmFja2dyb3VuZDogdXBk
YXRpbmcgdGhlIERSTSBmcmFtZWJ1ZmZlciBjb25zb2xlIG9uIHNwYXJjNjQKPj4+Pj4+PiBtYWtl
cyB0aGUKPj4+Pj4+PiBrZXJuZWwgcGFuaWMuIFRoaXMgaXMgYmVjYXVzZSB0aGUgZnJhbWVidWZm
ZXIgbWVtb3J5IGNhbm5vdCBiZQo+Pj4+Pj4+IGFjY2Vzc2VkIHdpdGgKPj4+Pj4+PiBzeXN0ZW0t
bWVtb3J5IGluc3RydWN0aW9ucy4gV2UgY3VycmVudGx5IGVtcGxveSBhIHdvcmthcm91bmQgaW4K
Pj4+Pj4+PiBEUk0gdG8KPj4+Pj4+PiBhZGRyZXNzIHRoaXMgc3BlY2lmaWMgcHJvYmxlbS4gWzFd
Cj4+Pj4+Pj4KPj4+Pj4+PiBUbyByZXNvbHZlIHRoZSBwcm9ibGVtLCB3ZSdkIGxpa2UgdG8gYWRk
cmVzcyBpdCBhdCB0aGUgbW9zdCBjb21tb24KPj4+Pj4+PiBwb2ludCwKPj4+Pj4+PiB3aGljaCBp
cyB0aGUgZG1hLWJ1ZiBmcmFtZXdvcmsuIFRoZSBkbWEtYnVmIG1hcHBpbmcgaWRlYWxseSBrbm93
cwo+Pj4+Pj4+IGlmIEkvTwo+Pj4+Pj4+IGluc3RydWN0aW9ucyBhcmUgcmVxdWlyZWQgYW5kIGV4
cG9ydHMgdGhpcyBpbmZvcm1hdGlvbiB0byBpdCdzCj4+Pj4+Pj4gdXNlcnMuIFRoZQo+Pj4+Pj4+
IG5ldyBzdHJ1Y3R1cmUgc3RydWN0IGRtYV9idWZfbWFwIHN0b3JlcyB0aGUgYnVmZmVyIGFkZHJl
c3MgYW5kIGEKPj4+Pj4+PiBmbGFnIHRoYXQKPj4+Pj4+PiBzaWduYWxzIEkvTyBtZW1vcnkuIEFm
ZmVjdGVkIHVzZXJzIG9mIHRoZSBidWZmZXIgKGUuZy4sIGRyaXZlcnMsCj4+Pj4+Pj4gZnJhbWV3
b3JrcykKPj4+Pj4+PiBjYW4gdGhlbiBhY2Nlc3MgdGhlIG1lbW9yeSBhY2NvcmRpbmdseS4KPj4+
Pj4+Pgo+Pj4+Pj4+IFRoaXMgcGF0Y2hzZXQgb25seSBpbnRyb2R1Y2VzIHN0cnVjdCBkbWFfYnVm
X21hcCwgYW5kIHVwZGF0ZXMKPj4+Pj4+PiBzdHJ1Y3QgZG1hX2J1Zgo+Pj4+Pj4+IGFuZCBpdCdz
IGludGVyZmFjZXMuIEZ1cnRoZXIgcGF0Y2hlcyBjYW4gdXBkYXRlIGRtYS1idWYgdXNlcnMuIEZv
cgo+Pj4+Pj4+IGV4YW1wbGUsCj4+Pj4+Pj4gdGhlcmUncyBhIHByb3RvdHlwZSBwYXRjaHNldCBm
b3IgRFJNIHRoYXQgZml4ZXMgdGhlIGZyYW1lYnVmZmVyCj4+Pj4+Pj4gcHJvYmxlbS4gWzJdCj4+
Pj4+Pj4KPj4+Pj4+PiBGdXJ0aGVyIHdvcms6IFRUTSwgb25lIG9mIERSTSdzIG1lbW9yeSBtYW5h
Z2VycywgYWxyZWFkeSBleHBvcnRzIGFuCj4+Pj4+Pj4gaXNfaW9tZW0gZmxhZyBvZiBpdHMgb3du
LiBJdCBjb3VsZCBsYXRlciBiZSBzd2l0Y2hlZCBvdmVyIHRvCj4+Pj4+Pj4gZXhwb3J0aW5nIHN0
cnVjdAo+Pj4+Pj4+IGRtYV9idWZfbWFwLCB0aHVzIHNpbXBsaWZ5aW5nIHNvbWUgY29kZS4gU2V2
ZXJhbCBEUk0gZHJpdmVycwo+Pj4+Pj4+IGV4cGVjdCB0aGVpcgo+Pj4+Pj4+IGZiZGV2IGNvbnNv
bGUgdG8gb3BlcmF0ZSBvbiBJL08gbWVtb3J5LiBUaGVzZSBjb3VsZCBwb3NzaWJseSBiZQo+Pj4+
Pj4+IHN3aXRjaGVkIG92ZXIKPj4+Pj4+PiB0byB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24s
IGFzIHNvb24gYXMgdGhlIGdlbmVyaWMgY29kZSB1c2VzCj4+Pj4+Pj4gc3RydWN0Cj4+Pj4+Pj4g
ZG1hX2J1Zl9tYXAuCj4+Pj4+Pj4KPj4+Pj4+PiBbMV0KPj4+Pj4+PiBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtl
cm5lbC5vcmclMkZkcmktZGV2ZWwlMkYyMDIwMDcyNTE5MTAxMi5HQTQzNDk1NyU0MHJhdm5ib3Jn
Lm9yZyUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0Mw
NGUzY2MzZTAzYWU0MGYxZmEwZjA4ZDg1YTNiNmE2OCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgy
ZDk5NGUxODNkJTdDMCU3QzAlN0M2MzczNTg1NTg1MjQ3MzIzODUmYW1wO3NkYXRhPXdUbUZ1Qjk1
R2hLVVUlMkYyUTkxVjAlMkJ0ekF1NCUyQkVlM1ZCVWNyaUJ5M2p4MmclM0QmYW1wO3Jlc2VydmVk
PTAKPj4+Pj4+Pgo+Pj4+Pj4+IFsyXQo+Pj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUy
RmRyaS1kZXZlbCUyRjIwMjAwODA2MDg1MjM5LjQ2MDYtMS10emltbWVybWFubiU0MHN1c2UuZGUl
MkYmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMDRlM2Nj
M2UwM2FlNDBmMWZhMGYwOGQ4NWEzYjZhNjglN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MwJTdDNjM3MzU4NTU4NTI0NzMyMzg1JmFtcDtzZGF0YT1MNHJCSG1lZ082M2Il
MkZpVFFkVHlIMTU4S054QVp3U3VKQ1FPYUZzem81TDAlM0QmYW1wO3Jlc2VydmVkPTAKPj4+Pj4+
Pgo+Pj4+Pj4gbGd0bSwgaW1vIHJlYWR5IHRvIGNvbnZlcnQgdGhlIGZvbGxvdy11cCBwYXRjaGVz
IG92ZXIgdG8gdGhpcy4gQnV0Cj4+Pj4+PiBJIHRoaW5rCj4+Pj4+PiB3b3VsZCBiZSBnb29kIHRv
IGdldCBhdCBsZWFzdCBzb21lIGFjayBmcm9tIHRoZSB0dG0gc2lkZSBmb3IgdGhlCj4+Pj4+PiBv
dmVyYWxsCj4+Pj4+PiBwbGFuLgo+Pj4+PiBZdXAsIGl0IHdvdWxkIGJlIG5pY2UgaWYgVFRNIGNv
dWxkIGhhZCBvdXQgdGhlc2UgdHlwZXMgYXV0b21hdGljYWxseS4KPj4+Pj4gVGhlbiBhbGwgVFRN
LWJhc2VkIGRyaXZlcnMgd291bGQgYXV0b21hdGljYWxseSBzdXBwb3J0IGl0Lgo+Pj4+Pgo+Pj4+
Pj4gQWxzbywgSSB0aGluayB3ZSBzaG91bGQgcHV0IGFsbCB0aGUgdmFyaW91cyBoZWxwZXJzICh3
cml0ZWwvcmVhZGwsCj4+Pj4+PiBtZW1zZXQsCj4+Pj4+PiBtZW1jcHksIHdoYXRldmVyIGVsc2Up
IGludG8gdGhlIGRtYS1idWYtbWFwLmggaGVscGVyLCBzbyB0aGF0IG1vc3QKPj4+Pj4+IGNvZGUK
Pj4+Pj4+IHVzaW5nIHRoaXMgY2FuIGp1c3QgdHJlYXQgaXQgYXMgYW4gYWJzdHJhY3QgcG9pbnRl
ciB0eXBlIGFuZCBuZXZlcgo+Pj4+Pj4gbG9vawo+Pj4+Pj4gdW5kZXJuZWF0aCBpdC4KPj4+Pj4g
V2UgaGF2ZSBzb21lIGZyYW1lYnVmZmVyIGhlbHBlcnMgdGhhdCByZWx5IG9uIHBvaW50ZXIgYXJp
dGhtZXRpYywgc28KPj4+Pj4gd2UnZCBuZWVkIHRoYXQgdG9vLiBObyBiaWcgZGVhbCB3cnQgY29k
ZSwgYnV0IEkgd2FzIHdvcnJpZWQgYWJvdXQgdGhlCj4+Pj4+IG92ZXJoZWFkLiBJZiBhIGxvb3Ag
Z29lcyBvdmVyIGZyYW1lYnVmZmVyIG1lbW9yeSwgdGhlcmUncyBhbiBpZi9lbHNlCj4+Pj4+IGJy
YW5jaCBmb3IgZWFjaCBhY2Nlc3MgdG8gdGhlIG1lbW9yeSBidWZmZXIuCj4+Pj4gSWYgd2UgbWFr
ZSBhbGwgdGhlIGhlbHBlcnMgc3RhdGljIGlubGluZSwgdGhlbiB0aGUgY29tcGlsZXIgc2hvdWxk
IGJlCj4+Pj4gYWJsZQo+Pj4+IHRvIHNlZSB0aGF0IGRtYV9idWZfbWFwLmlzX2lvbWVtIGlzIGFs
d2F5cyB0aGUgc2FtZSwgYW5kIHByb2R1Y2VkIHJlYWxseQo+Pj4+IG9wdGltaXplZCBjb2RlIGZv
ciBpdCBieSBwdWxsaW5nIHRoYXQgY2hlY2sgb3V0IGZyb20gYWxsIHRoZSBsb29wcy4KPj4+Pgo+
Pj4+IFNvIHNob3VsZCBvbmx5IHJlc3VsdCBpbiBzb21ld2hhdCB2ZXJib3NlIGNvZGUgb2YgaGF2
aW5nIHRvIGNhbGwKPj4+PiBkbWFfYnVmX21hcCBwb2ludGVyIGFydGhpbWV0aWMgaGVscGVycywg
YnV0IG5vdCBpbiBiYWQgZ2VuZXJhdGVkIGNvZGUuCj4+Pj4gU3RpbGwgd29ydGggZG91YmxlLWNo
ZWNraW5nIEkgdGhpbmssIHNpbmNlIGUuZy4gb24geDg2IHRoZSBnZW5lcmF0ZWQKPj4+PiBjb2Rl
Cj4+Pj4gc2hvdWxkIGJlIHRoZSBzYW1lIGZvciBib3RoIGNhc2VzIChidXQgbWF5YmUgdGhlIGNv
bXBpbGVyIGRvZXNuJ3Qgc2VlCj4+Pj4gdGhyb3VnaCB0aGUgaW5saW5lIGFzbSB0byByZWFsaXpl
IHRoYXQsIHNvIHdlIG1pZ2h0IGVuZCB1cCB3aXRoIDIKPj4+PiBjb3BpZXMpLgo+Pj4gQ2FuIHdl
IGhhdmUgdGhhdCBldmVuIGluZGVwZW5kZW50IG9mIERNQS1idWY/IFdlIGhhdmUgZXNzZW50aWFs
bHkgdGhlCj4+PiBzYW1lIHByb2JsZW0gaW4gVFRNIGFuZCB0aGUgY29kZSBhcm91bmQgdGhhdCBp
cyBhIGNvbXBsZXRlIG1lc3MgaWYgeW91Cj4+PiBhc2sgbWUuCj4+Pgo+Pj4gQ2hyaXN0aWFuLgo+
Pj4KPj4gSSB0aGluayB0aGlzIHBhdGNoc2V0IGxvb2tzIGdvb2QuIENoYW5naW5nIHR0bV9ib19r
bWFwKCkgb3ZlciB0bwo+PiByZXR1cm5pbmcgYSBzdHJ1Y3QgZG1hLWJ1Zi1tYXAgd291bGQgcHJv
YmFibHkgd29yayBqdXN0IGZpbmUuIElmIHdlIHRoZW4KPj4gY2FuIGhhdmUgYSBzZXQgb2YgaGVs
cGVycyB0byBvcGVyYXRlIG9uIGl0LCB0aGF0J3MgZ3JlYXQuCj4+Cj4+IC9UaG9tYXMKPiBDYW4g
SSBjb3VudCB0aGlzIGFzIGFuIEEtYiBieSBvbmUgb2YgeW91PwoKRm9yIHRoZSB0aGUgZ2VuZXJh
bCBhcHByb2FjaCwgY2VydGFpbmx5IHllcy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBCZXN0
IHJlZ2FyZHMKPiBUaG9tYXMKPgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
