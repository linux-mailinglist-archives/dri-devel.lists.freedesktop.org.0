Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DE2DA1F1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514F6E14F;
	Mon, 14 Dec 2020 20:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580356E14F;
 Mon, 14 Dec 2020 20:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAxeuOXgEAPRANLGm4w5FEHFaQO5pTwT9477IFsv3KnXJIXxfyCrMs/yeQTMDDTdy3AbkvTiDbqWHBk6BGFIYhb406SoeLnE7q/VQF3nGBjXp9MfUcXsCoefqJYtGW1BMgkC+ctFbAGSWQeuDlJ4tHeJ2j9m/9XrT2i0OvtrG3dPcrJhDVJVmwDJFRaFaBv4mSXhJgIvbooCk5Yw9WHs4o3G3fiW3m9Lsjeeh0ymwXcnCJsUdaarHAsRvq+f8dbfpie2Os+7OaDO1F8rKG0cK81jVNVT+2PMERg9kvuwR2bWAP5VNqBZVmzDbvL1hFe16EzqxQ/+CYCmLXiUx4SOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MaUuTaD7wZ6WrvOj/TO2mc+4/zMh2r4cDtVVVLNog4=;
 b=SqpfPHzdjwmkdGCLRXgFly3g8/tX/g/jdgOa0zqmTfyussmHXtlOcLECA6UfhVUAZoFu2wgnhquUYzoaulSe30t/Km57sxbHhsy0hMZ8OHIB+F6z2EONgP2ZKRs8oOh/C0y1MR6aSNpklAoXA4dZXXsTpxvwG+88h1GTnTcDtphvlXGVi2f7R6jn/5LmKblj27lk5l5ypm/ZpPROIOsBOIQsq7IVtVvVKKNyalina92TIvNF31zn9oxagP6KQIb81asQgDhppMTdNExRIO5RIMU5kyoyu3KTJxPjGknLWyeHgh/nQTkwWs4wYO4jm285u+p1YGzXUgh8pOCo9j9oBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MaUuTaD7wZ6WrvOj/TO2mc+4/zMh2r4cDtVVVLNog4=;
 b=BioavOudF7ZqQYZgdnX36LWfDogWO9UyoqwnXLWXsWeuJVfuIfSNlCwytY6DGaC+0xev393IC48VRhMngGWkDqNs4SK1ziro6HG0z/kvbXHSo0csGC1nUMVeOcpS9ElfGx2o5kRuNCkJhnB6UHEL8i7W6SJRMtOydFRFytPmKSU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 20:51:13 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8%9]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 20:51:13 +0000
Subject: Re: [PATCH] drm/amdkfd: fix ttm size refactor fallout
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
 <4dceb130-70bc-11b1-2078-02f511725b9e@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <83c8126b-7de8-3e92-4549-3d950e9ba7df@amd.com>
Date: Mon, 14 Dec 2020 15:51:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4dceb130-70bc-11b1-2078-02f511725b9e@amd.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::29) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YTBPR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.25 via Frontend Transport; Mon, 14 Dec 2020 20:51:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8783ea2-8a03-4b77-7e92-08d8a071fea5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440D1C04FD364FE345DACE492C70@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDnD+liUK5EnL05Mj0dp8Ax5sF/vIFqR5iwfHQBbgVPpWh/GQCJ/0pzVj+3w1YYi5RWdf/EtmYlVGnCqzeEIGtLXnSPtWp6FY9x9LA8mZET+T08dNCJrI1murqXBgtFEVGAEOju5iXiUqjJYOMrg48W3hFEXVsha2uuJkF3VGk/23OrAayZpmn98Mlt1e24R5mMakV5fGPyR4pr8XHrhxJTHWy+raes4gW8Exx68toPa17+43uxrIP2Je6T3s5jvGQpnviCPdVSu6XoDFwZwyDeLONHG4B2hJMsBn28shTeq8MDWYn/rR3u09otps7Ci2dND1gO1/y7R5rlBzZY0WDcUNaPI0NvxxpuqBb7/ibxoGiVzep9uFj+4ufvzEW1+QtFijwvdFVJ7XlqxrlfrBdI0cyINTdzk9OHVSrHIIbHcLEftorUlCbATeByxKE/d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(2616005)(66476007)(4001150100001)(186003)(34490700003)(54906003)(66556008)(956004)(16526019)(66574015)(16576012)(31696002)(8936002)(8676002)(31686004)(86362001)(508600001)(110136005)(52116002)(6486002)(26005)(5660300002)(4326008)(66946007)(2906002)(83380400001)(36756003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDErWEMxbHNoQWxKcjF4UDBFTHk1NkpLYVBsTW5tSVZtOGJud1pPQ251WnlM?=
 =?utf-8?B?d1JBUmdxK2NPeFh1RDQ5RVliRXNKZStxL1lON3hJdnZDTDNySFczVlVUMDd6?=
 =?utf-8?B?UEhUTm9CdDcwOVdNUWJIemo4VFRhQ3JTYnVuQ3JQWEt0R1JmZFFjcnNPYnho?=
 =?utf-8?B?eTJFWDlpV1hnbm1Qb2h3TEVUZVpZKzVmRVpSQzlJdmlvV0VieEhkd3VVajFW?=
 =?utf-8?B?QzVyRGxiVmdLbWxwZ3RZWHJKOStwd1RKanFYUTBLdEJEY0xWcEd3S3FPcU9Z?=
 =?utf-8?B?TDFGcE1RbE5USkZaSy9JUGpEcmMyRVVrRHo1bFVJbCs4eWhmQnBYa0VpdWdE?=
 =?utf-8?B?SGxDN3lHMURNUk1xOWI0QWZXcVoxMGpobldacnpqU3NFeFpLRXdDZld0SmUv?=
 =?utf-8?B?YzZTdWpKM2dBT3JTN3N0aHMwNi80MGhMSkJEMHJGUk1aR0F2TU1qY2dIV3hF?=
 =?utf-8?B?dTFXN1Fzb1JORDhYZTJYZU93U2xzcGpnT2c2Nm5NeWVYNjZLZ3gxOUowODJ2?=
 =?utf-8?B?UEZJaFEwTUtVQXdkb1M3VUN5UkZmWlRBenNJUHY1RVJnK2w5WDg2NXIzdHpZ?=
 =?utf-8?B?YTNMU3F1cEl4QmZBUlVlNlBxWjJBUzNnSU5KS2xIUFJVeXIrNS8rWndPckZK?=
 =?utf-8?B?SW5UWkFrNDRWZUx5N0xXdUwwVXRzMmIxQ3RaTGZxS0gxS2RLY3YrUEdSMHhI?=
 =?utf-8?B?ajVVOWQ2QjFaOFI4RnZYaGwyNkUxT0c2UVJpZlRTeEVkL252dlVvaDc0V25B?=
 =?utf-8?B?WllGVWVXMXN4K2JoRkJ5VzEwQUxxUVdMZWxVV21vMGlVSnZSNU95dzFELzdu?=
 =?utf-8?B?TTZjc2gwNTRtSVlEOEEyNHZLL3ZodE01SnM2ZDdBa3h3Q3dyTnc0NEo2a2V0?=
 =?utf-8?B?V3FjME9BUXpreEhCYXA3eUs4Y2huc0ZmeFlGRldsQW55UGU3bm1LL1lyUTJn?=
 =?utf-8?B?dnVQNUpFSnRiVS9rNGZrV3RDalJ3eWJyc3NmcUQzbjhabjIveGtZNEtFa1Rx?=
 =?utf-8?B?NENxeFZ2OFhwV2RMNjgzNE9OZDRRVHQzYjZ3cVR0aUlkMy9DRW5yZ2V0SGFG?=
 =?utf-8?B?K0hJVXlVdmZQQTF4U2N6ay9iSEgwbEpFcmdBc1Z6L2NiTkgzZWhXUVdaZ0h3?=
 =?utf-8?B?bTNwNFBoR3NkTTdCYnNGZ0Mvbzh3Qnd2WXlWQVZDQllxb0g1TUhCcEpvRGdu?=
 =?utf-8?B?Y0VDTFQvaDF3WFhjRFdQVjZjcW5ZazNXWm9vU01vZjZ2eW1CbUp4MndLRlJw?=
 =?utf-8?B?a3hYNXYzbG14WlJNTDAzSk5rSmx2NGZOb1pSdnFpUENGSGVXZGRPd0JiZnR2?=
 =?utf-8?Q?Wp/tISgEM5juSNzRF4Bk6mVp0mWFcVccr8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 20:51:13.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c8783ea2-8a03-4b77-7e92-08d8a071fea5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuI7B7K6mHaszlZ6lPdpzd/2gdUpZV1sMBNd4H8LIoiYaoOomlqW16TjQHPg5qC1D8YXoEVtl12NJcK47FfHOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0xMi0xNCB1bSAzOjI3IHAubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDE0LjEyLjIwIHVtIDIwOjE3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4gSSBndWVzcyBDaHJp
c3RpYW4gZGlkbid0IGNvbXBpbGUgdGVzdCBhbWRrZmQuCj4KPiBTY3JhdGNoaW5nIG15IGhlYWQg
d2hhdCBoYXMgaGFwcGVuZWQgaGVyZS4gV2hlbiBJIHRlc3RlZCBldmVyeXRoaW5nCj4gd2FzIGF0
IGxlYXN0IGJ1aWxkaW5nIGZpbmUuCgpMb29rcyBsaWtlIHlvdSB3ZXJlIG1pc3NpbmcgQ09ORklH
X0hTQV9BTUQgaW4geW91ciAuY29uZmlnIGZvciBzb21lIHJlYXNvbi4KClJlZ2FyZHMsCsKgIEZl
bGl4CgoKPgo+Pgo+PiBGaXhlczogZTExYmZiOTlkNmVjICgiZHJtL3R0bTogY2xlYW51cCBCTyBz
aXplIGhhbmRsaW5nIHYzIikKPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPj4gQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ICh2MSkKPj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+IENjOiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgOCArKysrLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IGluZGV4IDc3OTFk
MDc0YmQzMi4uYTk2NDdlN2Y5OGE4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IEBAIC00NTMsNyArNDUzLDcgQEAgc3Rh
dGljIGludCBhZGRfYm9fdG9fdm0oc3RydWN0IGFtZGdwdV9kZXZpY2UKPj4gKmFkZXYsIHN0cnVj
dCBrZ2RfbWVtICptZW0sCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBtZW0t
PmJvOwo+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IHZhID0gbWVtLT52YTsKPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgbGlzdF9oZWFkICpsaXN0X2JvX3ZhID0gJm1lbS0+Ym9fdmFfbGlzdDsKPj4gLcKgwqDC
oCB1bnNpZ25lZCBsb25nIGJvX3NpemUgPSBiby0+dGJvLm1lbS5zaXplOwo+PiArwqDCoMKgIHVu
c2lnbmVkIGxvbmcgYm9fc2l6ZSA9IGJvLT50Ym8uYmFzZS5zaXplOwo+PiDCoCDCoMKgwqDCoMKg
IGlmICghdmEpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiSW52YWxpZCBWQSB3aGVu
IGFkZGluZyBCTyB0byBWTVxuIik7Cj4+IEBAIC0xMjgxLDcgKzEyODEsNyBAQCBpbnQgYW1kZ3B1
X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCAqc2l6ZSkK
Pj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNz
X2luZm8gPSBtZW0tPnByb2Nlc3NfaW5mbzsKPj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGJvX3Np
emUgPSBtZW0tPmJvLT50Ym8ubWVtLnNpemU7Cj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBib19z
aXplID0gbWVtLT5iby0+dGJvLmJhc2Uuc2l6ZTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qga2ZkX2Jv
X3ZhX2xpc3QgKmVudHJ5LCAqdG1wOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBib192bV9yZXNlcnZh
dGlvbl9jb250ZXh0IGN0eDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZl
ciAqYm9fbGlzdF9lbnRyeTsKPj4gQEAgLTE0MDIsNyArMTQwMiw3IEBAIGludCBhbWRncHVfYW1k
a2ZkX2dwdXZtX21hcF9tZW1vcnlfdG9fZ3B1KAo+PiDCoMKgwqDCoMKgIG11dGV4X2xvY2soJm1l
bS0+bG9jayk7Cj4+IMKgIMKgwqDCoMKgwqAgZG9tYWluID0gbWVtLT5kb21haW47Cj4+IC3CoMKg
wqAgYm9fc2l6ZSA9IGJvLT50Ym8ubWVtLnNpemU7Cj4+ICvCoMKgwqAgYm9fc2l6ZSA9IGJvLT50
Ym8uYmFzZS5zaXplOwo+PiDCoCDCoMKgwqDCoMKgIHByX2RlYnVnKCJNYXAgVkEgMHglbGx4IC0g
MHglbGx4IHRvIHZtICVwIGRvbWFpbiAlc1xuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbWVtLT52YSwKPj4gQEAgLTE1MDYsNyArMTUwNiw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dw
dXZtX3VubWFwX21lbW9yeV9mcm9tX2dwdSgKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGdldF9hbWRncHVfZGV2aWNlKGtnZCk7Cj4+IMKgwqDCoMKgwqAgc3RydWN0
IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAoKHN0cnVjdCBhbWRncHVfdm0gKil2bSktPnByb2Nlc3NfaW5mbzsKPj4gLcKgwqDCoCB1bnNp
Z25lZCBsb25nIGJvX3NpemUgPSBtZW0tPmJvLT50Ym8ubWVtLnNpemU7Cj4+ICvCoMKgwqAgdW5z
aWduZWQgbG9uZyBib19zaXplID0gbWVtLT5iby0+dGJvLmJhc2Uuc2l6ZTsKPj4gwqDCoMKgwqDC
oCBzdHJ1Y3Qga2ZkX2JvX3ZhX2xpc3QgKmVudHJ5Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCBib192
bV9yZXNlcnZhdGlvbl9jb250ZXh0IGN0eDsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
