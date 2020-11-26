Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676A2C5396
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 13:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372726E8EC;
	Thu, 26 Nov 2020 12:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4F56E8EC;
 Thu, 26 Nov 2020 12:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnecdLEhCl01fcC+90HeEvR2HxP7wdvJJlZudJsK+hyzc7+bzYpPdYHs7eRheDgsf+yyk3pqaFQfXhceIP55d0/QT07E2YZzYcK4nIwM7OLDV5IUWt5OY9avd+/7LB6vq/5IGuDiAszVHAd109vQqzLRA2Hw+nDCb+YtEz/rmMLzWMCp5asHOpnppuyixtqBuIX188BLg9Z+7/2QPWFVrJdOQgIoEZirVxnbcYoNaNpeuykytN9CYCs7t3A95GCKvS3CFRknsuc0OoL2D8J01n6st5D+JWO7y677qnYD96CIt3vehF0sUOFxryFPs5/XOTSEH/k8IEXnPZ6Q+1TNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3kDLiUfzj+GZ9BLOsPNn6uYcEVCFoRUF8bYFa5iHgE=;
 b=FJFr/hGKnNdYdBaUr7QkPfqxSQsKDsqe4+nK+SJDy9V/kEFT6xgXz2MvQfDJsOG785/hdh4ivnc4QuSWTmkzwtUdKhmI5EpsQ5dKIh9ZBpnI7weveAWvey/FJ8NPWTtMToO26pr243GD6GOFHM5EhWwj6fac4V823jo90xHP2ex52ucqo8ijdTH8VwkYU9LWYaFNeY0WgBQfFQHySL3jbdAmmlklWsFS1J+AxPnW3lz50n8bdiNguaD/EiGsXUucgEcPHoFtnzLfeMcbs1JZE+x4RPEXHyW8eQ98tB0Ur+wsco6ijJIxCElyNiXwvRWDxxMP9pnPiD96Xu4TbJ10EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3kDLiUfzj+GZ9BLOsPNn6uYcEVCFoRUF8bYFa5iHgE=;
 b=0R6zZMbqPVN+x6fL/erb5jBW6AwiTlnVm0UsndxSxAbAs+ax26WNjOkxWMpvB31Rxb3m6N15DWe1ASbpRlUgrYQ0vo2fm2AIiR6QEG9re7vC9UcJVix9RMhIGGziRm2DEswpa2jx+zcD5ewUXwbXdLPflDPODdcUdz7oBVikjMg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 12:08:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.032; Thu, 26 Nov 2020
 12:08:13 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
 <20201125163251.GY401619@phenom.ffwll.local>
 <75385451-7969-e199-1a8e-f29fd08d5043@suse.de>
 <CAKMK7uGfaHdTOEBPmeNiFWz2GVb4C+-cYO7SkJsyQCsa-sCZ5Q@mail.gmail.com>
 <1cad6728-ca8b-80c6-55a8-b75d4c7a8a60@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4dd0d521-908c-db23-d8b2-6d3a80a2bff3@amd.com>
Date: Thu, 26 Nov 2020 13:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1cad6728-ca8b-80c6-55a8-b75d4c7a8a60@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:205:1::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:205:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.9 via Frontend Transport; Thu, 26 Nov 2020 12:08:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b1bd2b1-4683-4247-0fde-08d89203f2fc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40946E48473EC1305768608683F90@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yH36dkNGpxgfg/RRBjcCdMdlP3pZjgX0V28Qe04Czre77ZDYJDMlc/WFF20THn2+aoB9n+Dcv78PHWB5nOOTo+iVA1jsLqUTFLkwrYJIoqYyEmyBK8ew5o7QJEcfcd1Vi9+agh93UKc0WV3XWur43Ex7xMGkanHwWZTHBQAmZlBQVewSO2EpfsCL3XC458dMTy0MDMMAof+kY/nPHnwWCn+WNhnOrx9WolValGbykyNf3LyPl+L0rJk0TN9gunwP2rx6K04kyW4j0n0yu4amwlsV0fNlGcfw5hWvqeQSl/FyFdsPcl09PpvjbaMNh6C6C8hsUiYoLjZ12tYNPYOpZN9EMfc98tNPO+xSKciNGy6S2qanhcVNVECr3XnKoyeRWh/MNVq1MEufD/GlKCvadLR5hvXa5lM9XvqSZU0rMUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(31686004)(2616005)(54906003)(110136005)(316002)(31696002)(52116002)(6666004)(53546011)(8936002)(478600001)(36756003)(6486002)(5660300002)(8676002)(186003)(66574015)(86362001)(16526019)(966005)(66946007)(2906002)(83380400001)(4326008)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1hCeUoxbEhuZm9WN3FtS3ZkdFdBSVFhQUtNQVk0OXJqT2kzOUZScHpJUE9x?=
 =?utf-8?B?a3B1WXU3ZWRGYnE3RStBVHQrZmU4TXBSV0RqZHpsQVNlc01ZOE8zdUVxcWg0?=
 =?utf-8?B?RjNzckl3cVhBUkNYSUFkMU00UjlSSlFtMzVzMVVHUHRHTG1Pb0I4M25vT054?=
 =?utf-8?B?N3RqdllSdEdkWEJhbVVCTCswc1BVMUt4cnlKUzhFcWZVRzlqaDBEZjZqMEFS?=
 =?utf-8?B?YlQwVFhqeWtPQ2YzcHJQS3JKeDlBK1ZWdU15NklOSW9NRlBudVRqZkZVeUUz?=
 =?utf-8?B?RFZRWXJTVHYyTVAxL0hnOHc3YmVZSVV2M1NZWDV1MFNmdjU0dnhyS0luRkJC?=
 =?utf-8?B?NldPdmZkWERDOE1XRmdMbWpjRUQ4SCtlbmlZU3FpSEsvNGJaVWtRNUdWL3Qx?=
 =?utf-8?B?amJBckJPQzVrM1NLMUN2Znd4Vmd0QUpraHNYUFFpalRKWW15TCtCZzVVSlFh?=
 =?utf-8?B?eURadVlubzJ0bjlTU1FBREppbyt5VUg2aEJreXF3dklTdS9wMkZ6cDVBYjdl?=
 =?utf-8?B?MDVhSzZWKzExb1NEWFgxdUhaR0wrUHZkSVBKaTA2amdkL2t2QjRVbDBVUlVJ?=
 =?utf-8?B?UEFwY3ZmVVB1NGNIWkpTbEhBalRjd3k3K04xamJkY2NyN0JnVXhndmtLejZG?=
 =?utf-8?B?U0FQem5NVVpUeVZadnZ2ajJKZERlV1pCeC9kZWdWMDAyZVVheThRVHhrc3BO?=
 =?utf-8?B?emxIL2N4NGNzUjR2enMydzJPYXlyaEpFUFcvSXcxYTdBekJJMGxyckE4U2Zj?=
 =?utf-8?B?Vld5eGYvdWN6ZHhiRlVHbFpLR2REZXpTV2RVMVRtcC92aU9vYVQrUnlqQXha?=
 =?utf-8?B?VnB2RjJGY082R3YrTHcxQ2Q3WEFDRlgyRTJHTmdBeVoydzF1eFBsTUVtZ3dO?=
 =?utf-8?B?QVZUb2hUVUV1dE1RWGxxVytvVFhqUjJRZWpVTzZDb0ZCZEp3ejJhZ0gxV0Ju?=
 =?utf-8?B?OGE2ZkthVXVPT3J2U0JsdTkySVJrZWt6M2kxaW5EbmhPN2JRY1lyU00vYW1Q?=
 =?utf-8?B?NktESDRDaFR1ZUhFamZSWVp4NGt3dGRaQmUwd1ovQjZLZzFtelRyWWZ5L0hR?=
 =?utf-8?B?Ykk5bXBUbW1QaE0yYy9qbUZQRFNOYzBTNVdmSjF3ZjZzeTA3SmtvTVhqbkxm?=
 =?utf-8?B?S0Vwck95S2tZODNMRnlnNVN3eU95YVczZ21JY0R0NkVZTWN1WUUxUkxXajB5?=
 =?utf-8?B?YzA3MzBrVXkxMHhRWXB4RWF3VW5RNU9wYjV1enF4bjVGNTlaSTFuaHl0STNG?=
 =?utf-8?B?d3VCMG5zcmcrUmowbDNaUVp3YXZ1L1diQjZBVjU5UktvL1BOclJNbGp2WU1s?=
 =?utf-8?B?K3pFbEpjaC9YQW10eTdScmdzRFdtSkNFMk5LT3YrUHMzUjJ1aWx2Qm1LQzRX?=
 =?utf-8?B?Qno3Q1l5WHBCaE9rV1F2aUMxVXU2NTlzYUUxZTZUY3V5RGxGd1VrdDNNRFZy?=
 =?utf-8?Q?rwhpwx25?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1bd2b1-4683-4247-0fde-08d89203f2fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 12:08:13.4966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXVcL7hBMDTMIURdDssqrJX111tz0W0lIFb6fE2UculdQWnyR57OWDeA9NrRV0Dt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMjAgdW0gMTI6NTkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjYuMTEuMjAgdW0gMTI6MDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBUaHUsIE5v
diAyNiwgMjAyMCBhdCAxMToxNSBBTSBUaG9tYXMgWmltbWVybWFubiAKPj4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+IHdyb3RlOgo+Pj4KPj4+IEhpCj4+Pgo+Pj4gQW0gMjUuMTEuMjAgdW0gMTc6MzIg
c2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+IFsuLi5dCj4+Pj4gSSBndWVzcyBmdWxsIGxvY2tp
bmcgaXMgcmVxdWlyZWQgOi0vIEknbSBub3QgZXhhY3RseSBzdXJlIGhvdyB0byAKPj4+PiBtYWtl
IHRoaXMKPj4+PiBoYXBwZW4gd2l0aCB0aGUgY3VycmVudCBwbGV0aG9yYSBvZiBoZWxwZXJzIC4u
LiBJIHRoaW5rIHdlIG5lZWQgYW4KPj4+PiBfbG9ja2VkIHZlcnNpb24gb2Ygdm1hcC92dW5tYXAg
Y2FsbGJhY2tzIGluIGRybV9nZW1fb2JqZWN0X2Z1bmNzLgo+Pj4KPj4+IEkgdGhpbmsgd2UgbWln
aHQgYmUgYWJsZSB0byBnZXQgYXdheSB3aXRob3V0IG5ldyBjYWxsYmFja3MuCj4+Pgo+Pj4gSSBs
b29rZWQgdGhyb3VnaCB0aGUgc291cmNlcyB0aGF0IGltcGxlbWVudCBhbmQgdXNlIHZtYXAuIEFs
bCB0aGUKPj4+IGltcGxlbWVudGF0aW9ucyBhcmUgd2l0aG91dCB0YWtpbmcgcmVzdiBsb2Nrcy4g
Rm9yIGxvY2tpbmcsIHdlIGNhbiB3cmFwCj4+PiB0aGVtIGluIGxvY2svdW5sb2NrIHBhaXJzLiBI
YXZpbmcgc29tZXRoaW5nIGxpa2UgCj4+PiBkcm1fZ2VtX3ZtYXBfdW5sb2NrZWQoKQo+Pj4gdGhh
dCBsb2NrcyBhbmQgdm1hcHMgc2hvdWxkIG1ha2UgdGhpcyBlYXN5Lgo+Pj4KPj4+IEluIHRlcm1z
IG9mIGltcGxlbWVudGF0aW9uLCBvbmx5IHZyYW0gaGVscGVycyBkbyBhIHBpbittYXAgaW4gdGhl
aXIgCj4+PiB2bWFwCj4+PiBjb2RlLiBBbmQgYXMgSSBtZW50aW9uZWQgYmVmb3JlLCB0aGlzIGlz
IGFjdHVhbGx5IHdyb25nLiBUaGUgcGF0dGVybgo+Pj4gZGF0ZXMgYmFjayB0byB3aGVuIHRoZSBj
b2RlIHdhcyBzdGlsbCBpbiBpbmRpdmlkdWFsIGRyaXZlcnMuIEl0J3MgdGltZQo+Pj4gdG8gY2xl
YW4gdGhpcyB1cC4gVnJhbSBoZWxwZXJzIGNhbiB1c2UgZHJtX2dlbV90dG1fdm1hcCgpIGluc3Rl
YWQuCj4+Pgo+Pj4gRmluYWxseSwgdGhlcmUgYXJlbid0IHRoYXQgbWFueSB1c2VycyBvZiB2bWFw
LiBBIGZldyBkcml2ZXJzIHVzZSBpdAo+Pj4gd2hpbGUgYmxpdHRpbmcgZnJhbWVidWZmZXJzIGlu
dG8gSFcgYnVmZmVycyBhbmQgYXN0IGRvZXMgc29tZSBwZXJtYW5lbnQKPj4+IG1hcHBpbmcgb2Yg
dGhlIGN1cnNvciBCTy4gQWxsIHRoaXMgaXMgdHJpdmlhbCB0byB0dXJuIGludG8gc21hbGwgcGFp
cnMKPj4+IG9mIGxvY2srdm1hcCBhbmQgdnVubWFwK3VubG9jay4KPj4+Cj4+PiBUaGF0IGxlYXZl
cyBnZW5lcmljIGZiZGV2LiBUaGUgc2hhZG93IGJ1ZmZlciBpcyBhbHNvIHRyaXZpYWwgdG8gZml4
LCBhcwo+Pj4gb3V0bGluZWQgZHVyaW5nIHRoaXMgZGlzY3Vzc2lvbi4KPj4+Cj4+PiBUaGUgY29k
ZSBmb3IgZmJkZXYgaW4gaGFyZHdhcmUgYnVmZmVycyBpcyBhIHNwZWNpYWwgY2FzZS4gSXQgdm1h
cHMgdGhlCj4+PiBidWZmZXIgZHVyaW5nIGluaXRpYWxpemF0aW9uIGFuZCBvbmx5IHZ1bm1hcHMg
aXQgZHVyaW5nIHNodXRkb3duLiBBcwo+Pj4gdGhpcyBoYXMgd29ya2VkIHNvIGZhciB3aXRob3V0
IGxvY2tpbmcsIEknZCBsZWF2ZSBpdCBhcyBpdCBpcyBhbmQgcHV0IGEKPj4+IGJpZyBjb21tZW50
IG5leHQgdG8gaXMuCj4+Pgo+Pj4gSGFyZHdhcmUgZmJkZXYgYnVmZmVycyBpcyBvbmx5IHJlcXVp
cmVkIGJ5IGZldyBkcml2ZXJzOyBuYW1lbHkgdGhvc2UKPj4+IHRoYXQgcmVxdWlyZSB0aGUgQ09O
RklHX0RSTV9GQkRFVl9MRUFLX1BIWVNfU01FTSBjb25maWcgb3B0aW9uIHRvIHdvcmsuCj4+PiBX
ZSBzaG91bGQgY29uc2lkZXIgdG8gbWFrZSB0aGUgZmJkZXYgc2hhZG93IGJ1ZmZlciB0aGUgZGVm
YXVsdCBhbmQgaGF2ZQo+Pj4gZHJpdmVycyBvcHQtaW4gZm9yIHRoZSBoYXJkd2FyZSBidWZmZXIs
IGlmIHRoZXkgbmVlZCBpdC4KPj4+Cj4+Pj4KPj4+PiBBbmQgdGhlbiBkb2N1bWVudCB0aGF0IGlm
IHRoZSBjYWxsZXJzIG9mIHRoZSBfbG9ja2VkIHZlcnNpb24gd2FudHMgYQo+Pj4+IHBlcm1hbmVu
dCBtYXBwaW5nLCBpdCBhbHNvIG5lZWRzIHRvIHBpbiBpdC4gUGx1cyBJIGd1ZXNzIGlkZWFsbHkg
Cj4+Pj4gaW1wbGVtZW50Cj4+Pj4gdGhlIHVubG9ja2VkL3Blcm1hbmVudCB2ZXJzaW9ucyBpbiB0
ZXJtcyBvZiB0aGF0LCBzbyB0aGF0IGRyaXZlcnMgb25seQo+Pj4+IGhhdmUgdG8gaW1wbGVtZW50
IG9uZSBvciB0aGUgb3RoZXIuCj4+Pgo+Pj4gRm9yIG15IHVuZGVyc3RhbmRpbmcsIHBpbm5pbmcg
aXMgb25seSBkb25lIGluIHByZXBhcmVfZmIgY29kZS4gQW5kIGFzdAo+Pj4gcGlucyBpdHMgY3Vy
c29yIEJPcyBpbnRvIHZyYW0uIFdlIHNob3VsZCBkb2N1bWVudCB0byBob2xzIHZtYXAvdnVubWFw
Cj4+PiBvbmx5IGZvciB0aW1lIGFuZCBjb3ZlciB0aGVtIHdpdGggcmVzdiBsb2Nrcy4gUGlubmlu
ZyBpcyBmb3IgY2FzZXMgCj4+PiB3aGVyZQo+Pj4gdGhlIGhhcmR3YXJlIHJlcXVpcmVzIGJ1ZmZl
cnMgaW4gYSBzcGVjaWFsIGxvY2F0aW9uLCBidXQgZG9lcyBub3QKPj4+IHByb3RlY3QgYWdhaW5z
dCBjb25jdXJyZW50IHRocmVhdC4gSSB0aGluayB0aG9zZSBhcmUgdGhlIGltcGxpY2l0IHJ1bGVz
Cj4+PiBhbHJlYWR5Lgo+Pj4KPj4+IEkgdXBkYXRlZCB0aGUgcmFkZW9uIHBhdGNoc2V0LCB3aGVy
ZSBhbGwgdGhpcyBhcHBlYXJzIHRvIGJlIHdvcmtpbmcgCj4+PiB3ZWxsLgo+Pgo+PiBIbSB5ZWFo
IGlmIHlvdSB3YW50IHRvIGRvIHRoZSBmdWxsIGNoYW5nZSwgdGhlbiB0aGF0IHdvcmtzIG91dCB0
b28uCj4+IEl0J3MganVzdCBhIHBpbGUgb2Ygd29yay4KPj4KPj4gQnV0IGlmIHdlIGNhbiBmaW5p
c2ggb2ZmIHdpdGggYW4gZG1hX3Jlc3ZfYXNzZXJ0X2xvY2tlZCBpbgo+PiBkbWFfYnVmX3ZtYXAv
dnVubWFwLCB0aGVuIEkgdGhpbmsgdGhhdCdzIG9rLiBJdCBkb2VzIG1lYW4gdGhhdAo+PiBleHBv
cnRlcnMgbXVzdCBpbXBsZW1lbnQgdm1hcCBjYWNoaW5nLCBvciBwZXJmb3JtYW5jZSB3aWxsIGJl
Cj4+IHRlcnJpYmxlLiBTbyBxdWl0ZSBzb21lIHVwZGF0ZSBmb3IgdGhlIGRtYS1idWYgZG9jcy4K
Pgo+IFllYWgsIEkgcmVtZW1iZXIgYSBidWcgcmVwb3J0IGFib3V0IGZyZXF1ZW50IHBhZ2UtdGFi
bGUgbW9kaWZpY2F0aW9ucyAKPiB3cnQgdG8gdnJhbSBoZWxwZXJzLiBTbyB3ZSBpbXBsZW1lbnRl
ZCB0aGUgbGF6eSB1bm1hcHBpbmcgLyB2bWFwIAo+IGNhY2hpbmcsIGFzIHN1Z2dlc3RlZCBieSBD
aHJpc3RpYW4gYmFjayB0aGVtLiBNeSBndWVzcyBpcyB0aGF0IAo+IGFueXRoaW5nIFRUTS1iYXNl
ZCBjYW4gdXNlIGEgc2ltaWxhciBwYXR0ZXJuLiBDaHJpc3RpYW4gcHJvYmFibHkga25vd3MgCj4g
dGhlIGNvcm5lciBjYXNlcy4KCk15IG1lbW9yeSBpcyBmYWlsaW5nIG1lLCB3aGF0IGNvcm5lciBj
YXNlIGFyZSB5b3UgdGFsa2luZyBhYm91dD8KCkNocmlzdGlhbi4KCj4KPiBDTUEgc2VlbXMgb2J2
aW91c2x5IHdvcmtpbmcgY29ycmVjdGx5IGFscmVhZHkuCj4KPiBGb3IgU0hNRU0sIEknZCBoYXZl
IHRvIGZpZ3VyZSBvdXQgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBvZiB0aGUgcGFnZXMgCj4gaW52
b2x2ZWQuIE15IGd1ZXNzIGlzIHRoYXQgdGhlIHZ1bm1hcCBpbiBkcm1fZ2VtX3NobWVtX3Z1bm1h
cCgpIGNvdWxkIAo+IGJlIG1vdmVkIGludG8gdGhlIGZyZWUgY2FsbGJhY2ssIHBsdXMgYSBmZXcg
b3RoZXIgbW9kaWZpY2F0aW9ucy4KPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4+Cj4+IEJ1
dCBpZiB5b3UncmUgd2lsbGluZyB0byBkbyBhbGwgdGhhdCBjb252ZXJzaW9uIG9mIGNhbGxlcnMs
IHRoZW4gb2YKPj4gY291cnNlIEknbSBub3Qgc3RvcHBpbmcgeW91LiBOb3QgYXQgYWxsLCBpdCdz
IGdyZWF0IHRvIHNlZSB0aGF0IGtpbmQKPj4gb2YgbWF6ZSB1bnRhbmdsZWQuCj4+IC1EYW5pZWwK
Pj4KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMKPj4+IFRob21hcwo+Pj4KPj4+Pgo+Pj4+IFRoYXQgc2hv
dWxkIGdpdmUgdXMgYXQgbGVhc3Qgc29tZSB3YXkgZm9yd2FyZCB0byBncmFkdWFsbHkgY29udmVy
IAo+Pj4+IGFsbCB0aGUKPj4+PiBkcml2ZXJzIGFuZCBoZWxwZXJzIG92ZXIgdG8gZG1hX3Jlc3Yg
bG9ja2luZy4KPj4+PiAtRGFuaWVsCj4+Pj4KPj4+Pj4gVGhlIHBpbiBjb3VudCBpcyBjdXJyZW50
bHkgbWFpbnRhaW5lZCBieSB0aGUgdm1hcCBpbXBsZW1lbnRhdGlvbiAKPj4+Pj4gaW4gdnJhbQo+
Pj4+PiBoZWxwZXJzLiBDYWxsaW5nIHZtYXAgaXMgYW4gaW1wbGljaXQgcGluOyBjYWxsaW5nIHZ1
bm1hcCBpcyBhbiAKPj4+Pj4gaW1wbGljaXQKPj4+Pj4gdW5waW4uIFRoaXMgcHJldmVudHMgZXZp
Y3Rpb24gaW4gdGhlIGRhbWFnZSB3b3JrZXIuIEJ1dCBub3cgSSB3YXMgCj4+Pj4+IHRvbGQgdGhh
bgo+Pj4+PiBwaW5uaW5nIGlzIG9ubHkgZm9yIEJPcyB0aGF0IGFyZSBjb250cm9sbGVkIGJ5IHVz
ZXJzcGFjZSBhbmQgCj4+Pj4+IGludGVybmFsIHVzZXJzCj4+Pj4+IHNob3VsZCBhY3F1aXJlIHRo
ZSByZXN2IGxvY2suIFNvIHZyYW0gaGVscGVycyBoYXZlIHRvIGJlIGZpeGVkLCAKPj4+Pj4gYWN0
dWFsbHkuCj4+Pj4+Cj4+Pj4+IEluIHZyYW0gaGVscGVycywgdW5tYXBwaW5nIGRvZXMgbm90IG1l
YW4gZXZpY3Rpb24uIFRoZSB1bm1hcCAKPj4+Pj4gb3BlcmF0aW9uIG9ubHkKPj4+Pj4gbWFya3Mg
dGhlIEJPIGFzIHVubWFwcGFibGUuIFRoZSByZWFsIHVubWFwIGhhcHBlbnMgd2hlbiB0aGUgCj4+
Pj4+IGV2aWN0aW9uIHRha2VzCj4+Pj4+IHBsYWNlLiBUaGlzIGF2b2lkcyBtYW55IG1vZGlmaWNh
dGlvbnMgdG8gdGhlIHBhZ2UgdGFibGVzLiBJT1cgYW4gCj4+Pj4+IHVucGlubmVkLAo+Pj4+PiB1
bm1hcHBlZCBCTyB3aWxsIHJlbWFpbiBpbiBWUkFNIHVudGlsIHRoZSBtZW1vcnkgaXMgYWN0dWFs
bHkgbmVlZGVkLgo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMKPj4+Pj4gVGhvbWFzCj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4gU28gSSdtIHN0aWxsIG5vdCBzZWVpbmcgaG93IHRoaXMgY2FuIGdvIGJvb20u
Cj4+Pj4+Pgo+Pj4+Pj4gTm93IGxvbmcgdGVybSBpdCdkIGJlIG5pY2UgdG8gY3V0IGV2ZXJ5dGhp
bmcgb3ZlciB0byBkbWFfcmVzdiAKPj4+Pj4+IGxvY2tpbmcsIGJ1dAo+Pj4+Pj4gdGhlIGlzc3Vl
IHRoZXJlIGlzIHRoYXQgYmV5b25kIHR0bSwgbm9uZSBvZiB0aGUgaGVscGVycyAoYW5kIGZldyAK
Pj4+Pj4+IG9mIHRoZQo+Pj4+Pj4gZHJpdmVycykgdXNlIGRtYV9yZXN2LiBTbyB0aGlzIGlzIGEg
ZmFpcmx5IGJpZyB1cGhpbGwgYmF0dGxlLiBRdWljawo+Pj4+Pj4gaW50ZXJpbSBmaXggc2VlbXMg
bGlrZSB0aGUgcmlnaHQgc29sdXRpb24gdG8gbWUuCj4+Pj4+PiAtRGFuaWVsCj4+Pj4+Pgo+Pj4+
Pj4+Cj4+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+Pj4+IFRob21hcwo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiBUaGVyZSdzIG5vIHJlY3Vyc2lvbiB0YWtpbmcgcGxhY2UsIHNvIEkgZ3Vlc3Mg
dGhlIHJlc2VydmF0aW9uCj4+Pj4+Pj4+Pj4gbG9jayBjb3VsZCBiZQo+Pj4+Pj4+Pj4+IGFjcXVp
cmVkL3JlbGVhc2UgaW4gZHJtX2NsaWVudF9idWZmZXJfdm1hcC92dW5tYXAoKSwgb3IgYQo+Pj4+
Pj4+Pj4+IHNlcGFyYXRlIHBhaXIgb2YKPj4+Pj4+Pj4+PiBEUk0gY2xpZW50IGZ1bmN0aW9ucyBj
b3VsZCBkbyB0aGUgbG9ja2luZy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBHaXZlbiBob3cgdGhpcyAi
ZG8gdGhlIHJpZ2h0IGxvY2tpbmciIGlzIGEgY2FuIG9mIHdvcm1zIChhbmQgSSAKPj4+Pj4+Pj4+
IHRoaW5rCj4+Pj4+Pj4+PiBpdCdzCj4+Pj4+Pj4+PiB3b3JzZSB0aGFuIHdoYXQgeW91IGR1ZyBv
dXQgYWxyZWFkeSkgSSB0aGluayB0aGUgCj4+Pj4+Pj4+PiBmYl9oZWxwZXIubG9jayBoYWNrIGlz
Cj4+Pj4+Pj4+PiBwZXJmZWN0bHkgZ29vZCBlbm91Z2guCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSdt
IGFsc28gc29tZXdoYXQgd29ycmllZCB0aGF0IHN0YXJ0aW5nIHRvIHVzZSBkbWFfcmVzdiBsb2Nr
IAo+Pj4+Pj4+Pj4gaW4gZ2VuZXJpYwo+Pj4+Pj4+Pj4gY29kZSwgd2hpbGUgbWFueSBoZWxwZXJz
L2RyaXZlcnMgc3RpbGwgaGF2ZSB0aGVpciBoYW5kLXJvbGxlZCAKPj4+Pj4+Pj4+IGxvY2tpbmcs
Cj4+Pj4+Pj4+PiB3aWxsIG1ha2UgY29udmVyc2lvbiBvdmVyIHRvIGRtYV9yZXN2IG5lZWRsZXNz
bHkgbW9yZSAKPj4+Pj4+Pj4+IGNvbXBsaWNhdGVkLgo+Pj4+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+Pj4+Pj4+Pj4+IFRob21hcwo+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gWzFdIAo+Pj4+Pj4+Pj4+IGh0dHBzOi8vY2dpdC5mcmVlZGVz
a3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
P2lkPWFjNjBmM2YzMDkwMTE1ZDIxZjAyOGJmZmEyZGNmYjY3ZjY5NWM0ZjIjbjM5NAo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFBsZWFzZSBub3RlIHRoYXQgdGhlIHJlc2VydmF0
aW9uIGxvY2sgeW91IG5lZWQgdG8gdGFrZSBoZXJlIAo+Pj4+Pj4+Pj4+PiBpcyBwYXJ0IG9mCj4+
Pj4+Pj4+Pj4+IHRoZSBHRU0gb2JqZWN0Lgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBVc3VhbGx5
IHdlIGRlc2lnbiB0aGluZ3MgaW4gdGhlIHdheSB0aGF0IHRoZSBjb2RlIG5lZWRzIHRvIAo+Pj4+
Pj4+Pj4+PiB0YWtlIGEgbG9jawo+Pj4+Pj4+Pj4+PiB3aGljaCBwcm90ZWN0cyBhbiBvYmplY3Qs
IHRoZW4gZG8gc29tZSBvcGVyYXRpb25zIHdpdGggdGhlIAo+Pj4+Pj4+Pj4+PiBvYmplY3QgYW5k
Cj4+Pj4+Pj4+Pj4+IHRoZW4gcmVsZWFzZSB0aGUgbG9jayBhZ2Fpbi4KPj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4gSGF2aW5nIGluIHRoZSBsb2NrIGluc2lkZSB0aGUgb3BlcmF0aW9uIGNhbiBiZSBk
b25lIGFzIHdlbGwsIAo+Pj4+Pj4+Pj4+PiBidXQKPj4+Pj4+Pj4+Pj4gcmV0dXJuaW5nIHdpdGgg
aXQgaXMga2luZCBvZiB1bnVzdWFsIGRlc2lnbi4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFNv
cnJ5IGZvciB0aGUgbm9vYiBxdWVzdGlvbnMuIEknbSBzdGlsbCB0cnlpbmcgdG8gCj4+Pj4+Pj4+
Pj4+PiB1bmRlcnN0YW5kIHRoZQo+Pj4+Pj4+Pj4+Pj4gaW1wbGljYXRpb25zIG9mIGFjcXVpcmlu
ZyB0aGVzZSBsb2Nrcy4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gV2VsbCB0aGlzIGlzIHRoZSBy
ZXNlcnZhdGlvbiBsb2NrIG9mIHRoZSBHRU0gb2JqZWN0IHdlIGFyZQo+Pj4+Pj4+Pj4+PiB0YWxr
aW5nIGFib3V0Cj4+Pj4+Pj4+Pj4+IGhlcmUuIFdlIG5lZWQgdG8gdGFrZSB0aGF0IGZvciBhIGNv
dXBsZSBvZiBkaWZmZXJlbnQgCj4+Pj4+Pj4+Pj4+IG9wZXJhdGlvbnMsCj4+Pj4+Pj4+Pj4+IHZt
YXAvdnVubWFwIGRvZXNuJ3Qgc291bmQgbGlrZSBhIHNwZWNpYWwgY2FzZSB0byBtZS4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEJlc3QgcmVnYXJkcwo+Pj4+Pj4+Pj4+Pj4g
VGhvbWFzCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Pj4+Pj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4+Pj4+Pj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+Pj4+PiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gLS0gCj4+Pj4+Pj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4KPj4+
Pj4+Pj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4+Pj4+Pj4+Pj4gU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4+Pj4+Pj4+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55Cj4+Pj4+Pj4+Pj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+
Pj4+Pj4+Pj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gLS0gCj4+Pj4+IFRob21hcyBaaW1tZXJtYW5u
Cj4+Pj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPj4+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJICj4+Pj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQo+Pj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCj4+Pj4+IEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4K
Pj4+Cj4+PiAtLSAKPj4+IFRob21hcyBaaW1tZXJtYW5uCj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyCj4+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKPj4+IE1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+Pj4gKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQo+Pj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+Pgo+Pgo+
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
