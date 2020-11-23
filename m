Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06F2BFF2A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 05:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A7A89AEE;
	Mon, 23 Nov 2020 04:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119F89A62;
 Mon, 23 Nov 2020 04:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFHLEHN399P0QR7j09SpKtQddrfIsmdSMfTNiQjdDhcyxNQcOO0dHv6WZJY7KwCTHvU1QEHewWRdUWQjuRw4ubeN2B+xqlnkC+VTDfRMoFJFG99H0XSjNj4RSOGDulKkyh1DZJ/UbvqGkp5fPpYVqgMSObpUA5mYIMfWWb6G/7jOP+aU4Z2GmtMRzQy9N/FcFT4Rdk5uNU8D+aQfRxSPGHjOfRzrSBOXFXRrYjM/vtpCTx3vpHDHEsbMmw2nLlTJefsh2f80AwnNk0ZH1+o53MuwVkLAzppuXdm3oFE91V7+CMFfXfk9Nr/zhJANnTe3wuNfmuaf2LlOkdOXadnNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JmS8bnSOz8pmKr0mSnwSbbmohHsCQEfu8AQangTcr8=;
 b=XvFBTC8C0f4MXDt8UPZRk7aZpBNsBY86NFclyzTOGIvqyChLxJ528pHx/LLq/9tJ7FVmFZXUIx44cl20qhHPJ+iMrftX3x3F3i+qUH0N67YjYoLL9HJi/P3M+HrpxptMHH9dCbv1zlyWLLw8WOunKyh5zsjBVxNynOqaUzeHIryYa3g7MwsosHvxQcwy5vnTAigjwkClzfInMCT5jaIGRTt32BYCAZ0Lvluoa/bGbTqci5QMf5TEZ9xwztTQiw4DZ+km7lxgFzay0+ewc7MDqMO7H7+egvI94FUSbhRBZLNVvOec0WHGHDDMB1Pmd75TJGlNgKJu/d6RqaBE5f/LAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JmS8bnSOz8pmKr0mSnwSbbmohHsCQEfu8AQangTcr8=;
 b=1PWaeFI3o3V0+jO8/ndkMGAkAkBMUd7Px4s/m/6lev2zzDJjS1qhJSCsI53hzczMg0zlAT+DUgfk3ryBjoNJMD/F7bc6CXHbemBow5J/4v4StdZRGxqVOBN61m34nh+T7LufgKy7ElJH7QgN+5y0EVsCO7/2iABhcWDLgrAjGmE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1514.namprd12.prod.outlook.com (2603:10b6:4:f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Mon, 23 Nov 2020 04:54:16 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 04:54:16 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
Date: Sun, 22 Nov 2020 23:54:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:f03b:708c:daad:521b]
X-ClientProxiedBy: BN8PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:408:ac::17) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f03b:708c:daad:521b]
 (2607:fea8:3edf:49b0:f03b:708c:daad:521b) by
 BN8PR07CA0004.namprd07.prod.outlook.com (2603:10b6:408:ac::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 04:54:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a390583-beef-4476-35c3-08d88f6bd423
X-MS-TrafficTypeDiagnostic: DM5PR12MB1514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1514FF033EEE2B106E457F23EAFC0@DM5PR12MB1514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmCa7oaTPv1WJfHi9PolSF5/czCKd8TO4E4t9TmGemVfWddHN5zvfEMwydbyyiK/H9fSNQNzkK5OfEa3P+wIklQjwxzQXDzr7KZgk/W9v1UwGwNFwgQZLB1ZYNxsk5P8tUKP9HUGyQWCeS8AUi3ioznwlkyjw+MBX1UeFch93iGnYHKz5DgwxcUJHLWFRWSptAgcw73fVLggto4vyHdzQ6qU9JB5aN2lDNg9hrxTCcf0c9P/atFhGFEAZT4/iJPjmwyY2RVGiRn5DwlWLx+E390vZpgza86A5WoE4AnWAn060Ln2prBq5nRifOF4bMT99gmbCZ34HBw/1zIztg0gNCU6DrK7xl1lVNd6Vz/vvvpnCv4qSPDOcy1e+eekZDrT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(8936002)(2906002)(66574015)(6666004)(86362001)(316002)(66556008)(53546011)(5660300002)(83380400001)(66476007)(16526019)(52116002)(186003)(8676002)(2616005)(31686004)(36756003)(4326008)(6486002)(31696002)(478600001)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkplYS9IZzFlRy9xSm85d2tUb3kxaXZ4T2hXcWU5MHd1ZndSSE4yLzM1MkMr?=
 =?utf-8?B?dTRyNXVaS1JLbmNWWFcvK0pWL3hlTDNzRWVFekxiZlhIbzJnSDlFblc3dmg1?=
 =?utf-8?B?UE1Vd2U2UHBCcVl3UXc5dHJkTisrL2pac1lidyt0N0xOSlpmSUZHYTBHRnFF?=
 =?utf-8?B?cjBvZVNyZmpGRzNGK2tmOWxxemRxdXc2QVZTais2Vy92VmJ5QVhVWk45UHds?=
 =?utf-8?B?cmxYR0FGOXZMb1hOcEFYWE93WldBem9veUtqZVB3M2xEVFVCdms0V1pWRjRB?=
 =?utf-8?B?L25qcnZHRmdJYzZzTWlqMlQ4Ty94QlhKYzZyZUNWNVpVYkVZc0pnRi9UZHRF?=
 =?utf-8?B?blUzSFlHbmRndnRNeUhram5kRnpUSXl4WjlmbmY0djRxWC9uTTJiNUdXNGNL?=
 =?utf-8?B?d2p0dU1YVDBqazBrVTVTSVA4dmR0UnNjTGJaTmFrYno2b2RnT1grbDZiVkt1?=
 =?utf-8?B?WWRxODdWdVo1QVNJVnBPcUhxZm5LRjUxT2VXdDl3NnVWOVFlQzlUdDJ4ZDlr?=
 =?utf-8?B?eEdneXRDZlNFdEpOa2s4ektrd1VUcUpUUktvK2FRZmlXZnZQRHVEMTVrb24w?=
 =?utf-8?B?TE5qUzFFcG1BUkErOFZUUzlPZm1KV05rK2txdThQaVV4QmwwTmplMUJqZGdZ?=
 =?utf-8?B?RlpEUnFDWjZXYVRVTWZoVkJUNm1tRTNvSzJjQTdTYUxQZFlHckZYNlFGNDNI?=
 =?utf-8?B?T1paVnJnMGZ2WTdEaEZsTFBkV2Erdk5nU1JlU1YxSG9KakExOFB1SjFPNzVG?=
 =?utf-8?B?ckdObGxlNVBrZ0pPN3hNZnByVVY4ZjR4Z1BtazFrQXRMTXpaUm83Q1RYZ1Ju?=
 =?utf-8?B?OTZVUU5Ma2VTT0NWUmlMdlJ4RDRLd2ZYbmVFYkdrWU1QL05FNjA4VThLejdl?=
 =?utf-8?B?VXBJbzlwWnZvM0F5WFQyTWNpVFJ1Sy9POGtRMmxSOE1iODl4WFp4M2t3WnVO?=
 =?utf-8?B?WVBDR3hrc1dsQklSTis3UjQ0YVlvSzRjcEtXdzBrSnRjbkh1dEUrbHNXUUt3?=
 =?utf-8?B?OXg0bGFoWXB0VzR2VzUwVnZIL1h0VmxuZ0hQWDFId0JuVFMxd3JtbTc1bWlQ?=
 =?utf-8?B?QjI5dXNYQXVvTjR5K3Evc1IyeTNwOXVPL1NiMzE0R3JjdGJTclJROXZkbnlQ?=
 =?utf-8?B?RG9EWjJubU16QWpMcUVQU0JNaXVhL1FZejJmL3hla29UMW5QdnppYThkeEFl?=
 =?utf-8?B?cFRnOG1aUC94aWdZUElRYTZUNXIrSlBVSGg4c3VDZ2QzNUpsTzMrdzk5NTdC?=
 =?utf-8?B?VDRDOWVtVVNtbDdyVWlBd3RHSGpwMXFGZHJQbHRzWEdqRXFMdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a390583-beef-4476-35c3-08d88f6bd423
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 04:54:15.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ3UpoYYBFQ0Qll1tabkko/DrNI73g5mSf9BiYM+1pozX4CQIuBWgrtLKssWCrnHGmeOs8+U7Ro6r1VRNLE8gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1514
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzIxLzIwIDk6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjEuMTEu
MjAgdW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gV2lsbCBiZSB1c2VkIHRv
IHJlcm91dGUgQ1BVIG1hcHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UKPj4gZGV2aWNlIGlzIHJl
bW92ZWQuCj4KPiBVZmYsIG9uZSBwYWdlIGZvciBlYWNoIGV4cG9ydGVkIERNQS1idWY/IFRoYXQn
cyBub3Qgc29tZXRoaW5nIHdlIGNhbiBkby4KPgo+IFdlIG5lZWQgdG8gZmluZCBhIGRpZmZlcmVu
dCBhcHByb2FjaCBoZXJlLgo+Cj4gQ2FuJ3Qgd2UgY2FsbCBhbGxvY19wYWdlKCkgb24gZWFjaCBm
YXVsdCBhbmQgbGluayB0aGVtIHRvZ2V0aGVyIHNvIHRoZXkgYXJlIAo+IGZyZWVkIHdoZW4gdGhl
IGRldmljZSBpcyBmaW5hbGx5IHJlYXBlZD8KCgpGb3Igc3VyZSBiZXR0ZXIgdG8gb3B0aW1pemUg
YW5kIGFsbG9jYXRlIG9uIGRlbWFuZCB3aGVuIHdlIHJlYWNoIHRoaXMgY29ybmVyIApjYXNlLCBi
dXQgd2h5IHRoZSBsaW5raW5nID8KU2hvdWxkbid0IGRybV9wcmltZV9nZW1fZGVzdHJveSBiZSBn
b29kIGVub3VnaCBwbGFjZSB0byBmcmVlID8KCkFuZHJleQoKCj4KPiBSZWdhcmRzLAo+IENocmlz
dGlhbi4KPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5j
wqAgfMKgIDggKysrKysrKysKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMTAg
KysrKysrKysrKwo+PiDCoCBpbmNsdWRlL2RybS9kcm1fZmlsZS5owqDCoMKgwqDCoCB8wqAgMiAr
Kwo+PiDCoCBpbmNsdWRlL2RybS9kcm1fZ2VtLmjCoMKgwqDCoMKgwqAgfMKgIDIgKysKPj4gwqAg
NCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+IGlu
ZGV4IDBhYzQ1NjYuLmZmM2QzOWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmlsZS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+IEBAIC0xOTMsNiAr
MTkzLDEyIEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Moc3RydWN0IGRybV9taW5v
ciAqbWlub3IpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rl
c3Ryb3k7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCArwqDCoMKgIGZpbGUtPmR1bW15X3BhZ2UgPSBh
bGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsKPj4gK8KgwqDCoCBpZiAoIWZpbGUt
PmR1bW15X3BhZ2UpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9NRU07Cj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dF9wcmltZV9kZXN0cm95Owo+PiArwqDCoMKgIH0KPj4gKwo+PiDC
oMKgwqDCoMKgIHJldHVybiBmaWxlOwo+PiDCoCDCoCBvdXRfcHJpbWVfZGVzdHJveToKPj4gQEAg
LTI4OSw2ICsyOTUsOCBAQCB2b2lkIGRybV9maWxlX2ZyZWUoc3RydWN0IGRybV9maWxlICpmaWxl
KQo+PiDCoMKgwqDCoMKgIGlmIChkZXYtPmRyaXZlci0+cG9zdGNsb3NlKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2LT5kcml2ZXItPnBvc3RjbG9zZShkZXYsIGZpbGUpOwo+PiDCoCArwqDCoMKg
IF9fZnJlZV9wYWdlKGZpbGUtPmR1bW15X3BhZ2UpOwo+PiArCj4+IMKgwqDCoMKgwqAgZHJtX3By
aW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7Cj4+IMKgIMKgwqDCoMKgwqAg
V0FSTl9PTighbGlzdF9lbXB0eSgmZmlsZS0+ZXZlbnRfbGlzdCkpOwo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
Cj4+IGluZGV4IDE2OTNhYTcuLjk4N2I0NWMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbWUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4gQEAg
LTMzNSw2ICszMzUsMTMgQEAgaW50IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gZHJtX3ByaW1lX2FkZF9idWZf
aGFuZGxlKCZmaWxlX3ByaXYtPnByaW1lLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
bWFfYnVmLCAqaGFuZGxlKTsKPj4gKwo+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBvYmotPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dGUF9a
RVJPKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghb2JqLT5kdW1teV9wYWdlKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKg
wqDCoMKgIG11dGV4X3VubG9jaygmZmlsZV9wcml2LT5wcmltZS5sb2NrKTsKPj4gwqDCoMKgwqDC
oCBpZiAocmV0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsOwo+PiBAQCAtMTAyMCw2
ICsxMDI3LDkgQEAgdm9pZCBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3koc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIAo+PiBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KGF0dGFjaCwgc2csIERNQV9CSURJUkVDVElPTkFMKTsK
Pj4gwqDCoMKgwqDCoCBkbWFfYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+IMKgwqDCoMKgwqAgZG1h
X2J1Zl9kZXRhY2goYXR0YWNoLT5kbWFidWYsIGF0dGFjaCk7Cj4+ICsKPj4gK8KgwqDCoCBfX2Zy
ZWVfcGFnZShvYmotPmR1bW15X3BhZ2UpOwo+PiArCj4+IMKgwqDCoMKgwqAgLyogcmVtb3ZlIHRo
ZSByZWZlcmVuY2UgKi8KPj4gwqDCoMKgwqDCoCBkbWFfYnVmX3B1dChkbWFfYnVmKTsKPj4gwqAg
fQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9maWxlLmgKPj4gaW5kZXggNzE2OTkwYi4uMmEwMTFmYyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2ZpbGUuaAo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+IEBAIC0z
NDYsNiArMzQ2LDggQEAgc3RydWN0IGRybV9maWxlIHsKPj4gwqDCoMKgwqDCoMKgICovCj4+IMKg
wqDCoMKgwqAgc3RydWN0IGRybV9wcmltZV9maWxlX3ByaXZhdGUgcHJpbWU7Cj4+IMKgICvCoMKg
wqAgc3RydWN0IHBhZ2UgKmR1bW15X3BhZ2U7Cj4+ICsKPj4gwqDCoMKgwqDCoCAvKiBwcml2YXRl
OiAqLwo+PiDCoCAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0xFR0FDWSkKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIGxvY2tfY291bnQ7IC8qIERSSTEgbGVnYWN5IGxvY2sgY291bnQgKi8K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9n
ZW0uaAo+PiBpbmRleCAzMzdhNDgzLi43NmE5N2EzIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fZ2VtLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+IEBAIC0zMTEsNiAr
MzExLDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0IHsKPj4gwqDCoMKgwqDCoMKgICoKPj4gwqDC
oMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1
bmNzICpmdW5jczsKPj4gKwo+PiArwqDCoMKgIHN0cnVjdCBwYWdlICpkdW1teV9wYWdlOwo+PiDC
oCB9Owo+PiDCoCDCoCAvKioKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
