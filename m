Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A133F269003
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 17:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4EE6E4F3;
	Mon, 14 Sep 2020 15:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FAA6E4EA;
 Mon, 14 Sep 2020 15:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVN1K6Gkj7REv1od2v/eqVUad4Cg0/qUI9voqqUQ2Kwpp7TtzWGm80GREQRIv9OcyehQYV5q8kg3JNu7YnvdWQIOdk2Q/JYWTHZfciIgf6OPzHi0LnZfjhQytgcwsczWFBD/k31kTDq8F3LliFkN7YhNYolm+dFUJpuOO9wZQTKcDLN+1g/zBUjgR9qh4yQ1Ru+EYV1lEK7fG4ay27YFXod/FKvC1pvIYnpgzzYwk3ZwEulURJH4ETKDM0ar6owcTbyocFnZKX/QD1CrlpYOAbLYM7W/t2Ihkv716fTYOXuoXX3RvR/KbuqS+/Dsz/za7j02hHmjdmqh8raR/Zb0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOuyCnMpV/1Z8PJ5CQw5RfMajQLrhIGnRh2dfIDVWhM=;
 b=I50a2pdDyLz+Y4WbTiWSg0gm3qVF7X4OozfLoRNQ43t15cMuPVwLvtSPsp8Gu5tar0osHCD2anKNKt0cB5BD43YrGscAqW876dsGCo94IkUqn8wtg/pGyQKuPdUkdNmaGMi9SKCO5n/M8jTQwv8adGoR/72fNcgNB1F0RPk2pZeK4sH4ejI8A1quOjJa2EJKKE/JDtiQyrOuE89Ej1dANwdXO/hLCQfy0FyR9KQ8FfR7XyEgk4/ZWhU6mFLv64Ujphrw7cn4F4U9t3J4ctPuJdzCe4fmoBWmqbvv4XB0xBKGfdkt3YI51j1S+gsSrh2AiOVrqfG0dVcfcYOXwHooeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOuyCnMpV/1Z8PJ5CQw5RfMajQLrhIGnRh2dfIDVWhM=;
 b=R9bLpVrJy7Iv5it19u5u/Cpn4BBmXBV17B2CenBLv7EXQuQeRzaTIg8+tKZUKjqeQmtUNj9E1XxbKGguVyGSuepyO2+BML2DYxfFHxNLoP1tIukk1P7AMcxOHicPZb8ZQhPg0w8e0lhIyQuJEWFkROydGckAxiuzBE98fPpReaw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB3891.namprd12.prod.outlook.com (2603:10b6:a03:1a3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 15:33:57 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::754e:8f27:157a:9101%6]) with mapi id 15.20.3326.030; Mon, 14 Sep 2020
 15:33:57 +0000
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <hwentlan@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
 <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
 <c64d591b-8f3c-5384-f103-3283bcf15c9d@amd.com>
 <2c090b33-2709-1f83-41ec-56fc5cc9e2ce@daenzer.net>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <26ce07b5-d225-547d-cec6-b2f87bdd9f12@amd.com>
Date: Mon, 14 Sep 2020 11:33:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <2c090b33-2709-1f83-41ec-56fc5cc9e2ce@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.20 via Frontend Transport; Mon, 14 Sep 2020 15:33:56 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 351c9cd0-f8d4-4fe1-1439-08d858c3986c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB38918440E3DA82BC31A9BA25EC230@BY5PR12MB3891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuRVU4/nvl58aBXhC5gpPyB1AHvSykNx8nO+slIeVqMLRqlkbDHY/EJm7nosP92EgJui79fXkUwgWGbKt9l+EZhKBoqve4Cs8xFc/74LLVFbEKnquYpCWumFx+35WX6x/n1HaxedlbA6eXrEh1YxcQV162vxGX+shW97u7F3aTgVIKVDhFvEqWlAgMOEfxLB8ufG8h3xyRcD1uZo6FcvSiLvECAfO8BhpZ9bNAonDKtD05rrPTMDcEHWo45BLh4ZR0lQ+kCxmR9sN5f7Gtdg14xaqYxbC6dfaJbkcGCes++HRYdDbm9OeJ+16bPx2EJ0ko1whYowQklNI0lEIutFlM00Vp/ZWaQFUWbzRrxgvvdFGTZdm75AhRUNu/mjGmokdK+eIDH49z4Wcx31/dc3PFOnibpYedXOwJTKYqe9BVG6y7mGz7wcYstCmMXGnVvXquLvTZfbaQeTSnTfiE/AGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(31686004)(2906002)(53546011)(110136005)(6636002)(66574015)(83380400001)(316002)(16576012)(2616005)(86362001)(66476007)(36756003)(66946007)(4326008)(31696002)(6666004)(8936002)(478600001)(956004)(6486002)(66556008)(52116002)(966005)(186003)(26005)(5660300002)(8676002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4Y1XNQ/YBHdQ00+sX14RbJB72NLo0q58lRv1jI+ImZKSdxjjGkvYFDdMEn1CsmWtNUUpERmbeyKJJ6XP7hp5T1eUBsuXeDybSNZIBDOozpHi9chFGtM7LLhveWaasg0M6Mxa65s9oms6jzQ8BgcmHxfI1KEBZd4PigBxiiLWKwL9s0z8lR6e+fKUl4CAAsO2Ga2S1i6EanPCoKfqS2ix4gEvRnOrir4D/k9KRYhuTf41P6ADTy9izO8jRlls+M964hI6uoiDye18LEGBLIAVGfmrPs3DU6y0pAImwd1MZ7PM3FmUpGvySIa577iIv19b+wHCXjo7c5rKS9+ZslXBPH23nKrGV01lScWlQ7ysI88j0O8qLxg0pC6HkpvtspW0Rlr5cK3wuVsR9YsQ7TxTRyInXWR4NTswRB++xnEOnwR2bIVFebgbKhHHt7qg2TAljQ0lfgLr/vpWje3tKrvbpRDVi1xw7B1KWrMNgbHmFbjb7G6V5c+kfnGKF0wLamHTG8pabOG1S6jXG1zBmS4iZo8dkCR+n9UjJpSeLmLbfTMXIcdP2YL3jsmPn8BTFeVi1ahHbBEZiUCue+KnGy8aUW8pCpaH21yvpJ4uiSEQZN4WKlR5S/7u+ZM6tv5bVoWM+7wGvV4IReExiFygNEmrRA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351c9cd0-f8d4-4fe1-1439-08d858c3986c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 15:33:57.5130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbVDx6O5+J5M4tbQxswB4oAiirkGCwiP+s0Hn23nckaZhzRqJu5WElq1RtbRiQ7gaSwaSKRS6w61zvnA/nnXeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3891
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0xNCAxMToyMiBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDIw
LTA5LTE0IDQ6MzcgcC5tLiwgS2F6bGF1c2thcywgTmljaG9sYXMgd3JvdGU6Cj4+IE9uIDIwMjAt
MDktMTQgMzo1MiBhLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IE9uIDIwMjAtMDktMDcg
OTo1NyBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+IE9uIEZyaSwgU2VwIDA0LCAyMDIw
IGF0IDEyOjQzOjA0UE0gKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+Pj4+PiBGcm9tOiBN
aWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPj4+Pj4KPj4+Pj4gRG9uJ3QgY2hl
Y2sgZHJtX2NydGNfc3RhdGU6OmFjdGl2ZSBmb3IgdGhpcyBlaXRoZXIsIHBlciBpdHMKPj4+Pj4g
ZG9jdW1lbnRhdGlvbiBpbiBpbmNsdWRlL2RybS9kcm1fY3J0Yy5oOgo+Pj4+Pgo+Pj4+PiDCoCAq
IEhlbmNlIGRyaXZlcnMgbXVzdCBub3QgY29uc3VsdCBAYWN0aXZlIGluIHRoZWlyIHZhcmlvdXMK
Pj4+Pj4gwqAgKiAmZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0b21pY19jaGVjayBjYWxsYmFjayB0
byByZWplY3QgYW4gYXRvbWljCj4+Pj4+IMKgICogY29tbWl0Lgo+Pj4+Pgo+Pj4+PiBhdG9taWNf
cmVtb3ZlX2ZiIGRpc2FibGVzIHRoZSBDUlRDIGFzIG5lZWRlZCBmb3IgZGlzYWJsaW5nIHRoZSBw
cmltYXJ5Cj4+Pj4+IHBsYW5lLgo+Pj4+Pgo+Pj4+PiBUaGlzIHByZXZlbnRzIGF0IGxlYXN0IHRo
ZSBmb2xsb3dpbmcgcHJvYmxlbXMgaWYgdGhlIHByaW1hcnkgcGxhbmUgCj4+Pj4+IGdldHMKPj4+
Pj4gZGlzYWJsZWQgKGUuZy4gZHVlIHRvIGRlc3Ryb3lpbmcgdGhlIEZCIGFzc2lnbmVkIHRvIHRo
ZSBwcmltYXJ5IHBsYW5lLAo+Pj4+PiBhcyBoYXBwZW5zIGUuZy4gd2l0aCBtdXR0ZXIgaW4gV2F5
bGFuZCBtb2RlKToKPj4+Pj4KPj4+Pj4gKiBUaGUgbGVnYWN5IGN1cnNvciBpb2N0bCByZXR1cm5l
ZCBFSU5WQUwgZm9yIGEgbm9uLTAgY3Vyc29yIEZCIElECj4+Pj4+IMKgwqAgKHdoaWNoIGVuYWJs
ZXMgdGhlIGN1cnNvciBwbGFuZSkuCj4+Pj4+ICogSWYgdGhlIGN1cnNvciBwbGFuZSB3YXMgZW5h
YmxlZCwgY2hhbmdpbmcgdGhlIGxlZ2FjeSBEUE1TIHByb3BlcnR5Cj4+Pj4+IMKgwqAgdmFsdWUg
ZnJvbSBvZmYgdG8gb24gcmV0dXJuZWQgRUlOVkFMLgo+Pj4+Pgo+Pj4+PiB2MjoKPj4+Pj4gKiBN
aW5vciBjaGFuZ2VzIHRvIGNvZGUgY29tbWVudCBhbmQgY29tbWl0IGxvZywgcGVyIHJldmlldyBm
ZWVkYmFjay4KPj4+Pj4KPj4+Pj4gR2l0TGFiOiAKPj4+Pj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL211dHRlci8tL2lzc3Vlcy8xMTA4IAo+Pj4+Pgo+Pj4+PiBHaXRMYWI6IAo+Pj4+
PiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vaXNzdWVzLzExNjUgCj4+
Pj4+Cj4+Pj4+IEdpdExhYjogCj4+Pj4+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9t
dXR0ZXIvLS9pc3N1ZXMvMTM0NCAKPj4+Pj4KPj4+Pj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoZWwg
RMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPj4+Pgo+Pj4+IENvbW1pdCBtZXNzYWdlIGFn
cmVlcyB3aXRoIG15IHVuZGVyc3RhbmQgb2YgdGhpcyBtYXplIG5vdywgc286Cj4+Pj4KPj4+PiBB
Y2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPj4+Cj4+PiBU
aGFua3MgRGFuaWVsIQo+Pj4KPj4+Cj4+PiBOaWNrIC8gSGFycnksIGFueSBtb3JlIGZlZWRiYWNr
PyBJZiBub3QsIGNhbiB5b3UgYXBwbHkgdGhpcz8KPj4+Cj4+Pgo+Pj4gUC5TLiBTaW5jZSBEQ04g
ZG9lc24ndCBtYWtlIGEgZGlzdGluY3Rpb24gYmV0d2VlbiBwcmltYXJ5IG9yIG92ZXJsYXkgCj4+
PiBwbGFuZXMgaW4gaGFyZHdhcmUsIGNvdWxkIENocm9taXVtT1MgYWNoaWV2ZSB0aGUgc2FtZSBl
ZmZlY3Qgd2l0aCAKPj4+IG9ubHkgdGhlIHByaW1hcnkgcGxhbmUgaW5zdGVhZCBvZiBvbmx5IGFu
IG92ZXJsYXkgcGxhbmU/IElmIHNvLCBtYXliZSAKPj4+IHRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhl
ICJibGFjayBwbGFuZSBoYWNrIi4KPj4+Cj4+Pgo+Pgo+PiBJIG9ubHkga25vdyB0aGF0IGF0b21p
Y3Rlc3QgdHJpZXMgdG8gZW5hYmxlIHRoaXMgY29uZmlndXJhdGlvbi4gTm90IAo+PiBzdXJlIGlm
IENocm9taXVtT1Mgb3Igb3RoZXIgInJlYWwiIHVzZXJzcGFjZSB0cmllcyB0aGlzIGNvbmZpZ3Vy
YXRpb24uCj4gCj4gU29tZW9uZSBtZW50aW9uZWQgdGhhdCBDaHJvbWl1bU9TIHVzZXMgdGhpcyBm
b3IgdmlkZW8gcGxheWJhY2sgd2l0aCAKPiBibGFjayBiYXJzICh3aGVuIHRoZSB2aWRlbyBhc3Bl
Y3QgcmF0aW8gZG9lc24ndCBtYXRjaCB0aGUgZGlzcGxheSdzKS4KCldlIG9ubHkgZXhwb3NlIHN1
cHBvcnQgZm9yIE5WMTIgb24gdGhlIHByaW1hcnkgcGxhbmUgc28gd2Ugd291bGRuJ3QgYmUgCmhp
dHRpbmcgdGhpcyBjYXNlIGF0IGxlYXN0LgoKPiAKPiAKPj4gTWF5YmUgZm9yIG5vdyB0aGlzIGNh
biBnbyBpbiBhbmQgaWYgc29tZXRoaW5nIGJyZWFrcyB3ZSBjYW4gZGVhbCB3aXRoIAo+PiB0aGUg
ZmFsbG91dCB0aGVuLiBXZSBjYW4gYWx3YXlzIGdvIGJhY2sgdG8gbHlpbmcgdG8gdXNlcnNwYWNl
IGFib3V0IAo+PiB0aGUgY3Vyc29yIGJlaW5nIHZpc2libGUgaWYgdGhlIGNvbW1pdCBmYWlscyBp
biB0aGF0IGNhc2UgSSBndWVzcyBbLi4uXQo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFu
IGJ5IHRoYXQgLyBob3cgaXQgY291bGQgd29yay4KCkRyb3BwaW5nIHRoZSBjaGVjayB5b3UgYWRk
ZWQgaW4gdGhpcyBwYXRjaDoKCisJaWYgKHN0YXRlLT5lbmFibGUgJiYKKwkgICAgIShzdGF0ZS0+
cGxhbmVfbWFzayAmIGRybV9wbGFuZV9tYXNrKGNydGMtPnByaW1hcnkpKSkKICAJCXJldHVybiAt
RUlOVkFMOwoKVGhhdCB3YXkgd2UgY2FuIHN0aWxsIGFsbG93IHRoZSBjdXJzb3IgcGxhbmUgdG8g
YmUgZW5hYmxlZCB3aGlsZSAKcHJpbWFyeS9vdmVybGF5IGFyZSBub3QsIGl0J3MganVzdCBub3Qg
Z29pbmcgdG8gYmUgYWN0dWFsbHkgdmlzaWJsZSBvbiAKdGhlIHNjcmVlbi4gSXQnbGwgZmFpbCBz
b21lIElHVCB0ZXN0cyBidXQgbm90aGluZyByZWFsbHkgdXNlcyB0aGlzIApjb25maWd1cmF0aW9u
IGFzIG1vcmUgdGhhbiBqdXN0IGEgdGVtcG9yYXJ5IHN0YXRlLgoKUmVnYXJkcywKTmljaG9sYXMg
S2F6bGF1c2thcwoKPiAKPiAKPj4gUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5p
Y2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KPiAKPiBUaGFua3MhCj4gCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
